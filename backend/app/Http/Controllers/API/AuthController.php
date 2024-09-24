<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\IPWhitelists;
use App\Models\LoginAttempt;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Mail\VerificationMail;
use App\Models\Api;
use App\Models\Banks;
use App\Models\User;
use Dotenv\Exception\ValidationException;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\OTPs;

use Mail;

class AuthController extends Controller
{
    public function register(Request $request){

        $validator=Validator::make($request->all(),[
            'name'=>'required|string',
            'email'=>'required|email|max:191|unique:users,email',
            'password'=>'required|min:8'
        ]);

        if($validator->fails()){
            return response()->json([
                'validation_errors'=>$validator->errors()
            ]);
        }else{

            $api = Api::where('api_name', 'monnify')->first();
            $authorization = base64_encode($api['api_key'] . ':' . $api['api_secret']);

            if (!config('app.env') === 'local') {
                $response = Http::withHeaders([
                    'Authorization' => "Basic ".$authorization,
                    'Content-Type' => 'application/json'
                ])->post('https://api.monnify.com/api/v1/auth/login/')->json();

            } else {
                $response = [
                    'responseBody' => [
                        'accessToken' => '12hdggyu23edff5t'
                    ],
                    'responseMessage' => 'success'
                ];
            }

            $accessToken = $response['responseBody']['accessToken'];

            $apiPostArray = [
                'accountReference' => strtoupper(substr($request->name, 0, 5)).time(),
                'accountName' => $request->name,
                'currencyCode' => 'NGN',
                'contractCode' => $api['api_contract_code'],
                'customerEmail' => $request->email,
                'customerName' => $request->name,
                'bvn' => '22161748511',
                'getAllAvailableBanks' => true,
                'preferredBanks' => ['50515','035', '058', '232']
            ];

            if (!config('app.env') === 'local') {
                $response = Http::withHeaders([
                    'Authorization' => "Bearer ".$accessToken,
                    'Content-Type' => 'application/json'
                ])->post($api['api_url']."/bank-transfer/reserved-accounts", $apiPostArray)->json();
            } else {
                $response = [
                    'responseBody' => [
                        'accessToken' => '12hdggyu23edff5t',
                        'bankName' => 'Wema bank',
                        'accountName' => 'Tomiwa',
                        'accountNumber' => '5000358118',
                        'accountReference' => 'ELECT1686463044'

                    ],
                    'responseMessage' => 'success'
                ];
            }

            $user=User::create([
                'name'=>$request->name,
                'email'=>$request->email,
                'user_ip' => $request->ip(),
                'password'=>Hash::make($request->password)
            ]);

            if($response['responseMessage'] == 'success' && $user){
                if(isset($response['responseBody'])) {
                    $result = $response['responseBody'];
                    Banks::create([
                        'user_id' => $user->id,
                        'bank_name'=>$result['bankName'],
                        'account_name'=>$result['accountName'],
                        'account_number'=>$result['accountNumber'],
                        'reference'=>$result['accountReference'],
                    ]);
                }
            }

            $token=$user->createToken($user->email. '_Token')->plainTextToken;
            return response()->json([
                'status'=>200,
                'username'=>$user->name,
                'token'=>$token,
                'message'=>'Registered successfully'
            ]);
        }
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|max:191',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'validation_errors' => $validator->errors()
            ]);
        }

        $user = User::where('email', $request->email)->where('status', 1)->first();
        $ifIPisWhitelisted = IPWhitelists::where('ip', $request->ip())->get();

        if (!$user) {
            // If email not found
            Log::info("Login attempt: failed for email: {$request->email} from IP: {$request->ip()}");
            return response()->json([
                'status' => 401,
                'errors' => 'Invalid credentials'
            ]);
        }

        // Check if account is locked
        if ($user->lockout_time && Carbon::parse($user->lockout_time)->isFuture()) {
            $lockoutTime = Carbon::parse($user->lockout_time)->diffForHumans();
            return response()->json([
                'status' => 401,
                'errors' => "Your account is locked. Please try again in {$lockoutTime}."
            ]);
        }

        if (!Hash::check($request->password, $user->password)) {
            // Password mismatch
            $this->incrementLoginAttempts($user);
            return response()->json([
                'status' => 401,
                'errors' => 'Invalid credentials'
            ]);
        }

        if (count($ifIPisWhitelisted) == 0) {
            return response()->json([
                'status' => 401,
                'errors' => "({$request->ip()}) IP address was not found on our list"
            ]);
        }

        if ($user->mfa === 1 && $request->auto === 0) {
            $password_reset = new AuthController();
            $response = $password_reset->sendOTP($request->email, 'VerificationMail', 'new-password');
            $data = $response->getData(true);
            $data['mfa'] = 1;
            $data['otp'] = null;

            return response()->json($data);
        }

        // Successful login
        $role = $user->role_as == 1 ? 'admin' : 'user';
        $token = $role == 'admin' ? $user->createToken($user->email . '_AdminToken', ['server:admin'])->plainTextToken : $user->createToken($user->email . '_Token', ['client:user'])->plainTextToken;

        $user->access_token = $token;
        $user->login_attempts = 0;
        $user->lockout_time = null;
        $user->save();

        $this->recordLoginAttempt($user->id, $request->ip(), true);

        return response()->json([
            'status' => 200,
            'username' => $user->name,
            'mfa' => $user->mfa,
            'token' => $token,
            'message' => 'Logged in successfully',
            'role' => $role
        ]);
    }

    protected function incrementLoginAttempts(User $user)
    {
        $user->login_attempts += 1;
        if ($user->login_attempts >= 5) {
            $user->lockout_time = Carbon::now()->addHour();
            $user->login_attempts = 0; // Reset attempts after lockout
        }
        $user->save();

        $this->recordLoginAttempt($user->id, request()->ip(), false);
    }

    protected function recordLoginAttempt($userId, $ip, $successful)
    {
        LoginAttempt::create([
            'user_id' => $userId,
            'ip_address' => $ip,
            'successful' => $successful,
        ]);
    }

    public function send_otp(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:otps,email',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        }

        $password_reset = new AuthController;
        return $password_reset->sendOTP($request->all(), 'VerificationMail', 'new-password');
    }


    public function sendOTP($data, $mail_function, $destination)
    {
        $otp = rand ( 10000 , 99999 );
        $email = $data['email'];
        $password = @$data['encrypted_password'];
        $name = @$data['name'];

        $send_mfa_otp = OTPs::create([
            'email' => $email,
            'token' => $otp
        ]);

        $email_title = "[Verification] Password Reset";
        $email_message = [
            'name' => "Dear customer",
            'otp' => $otp,
            'title' => $email_title
        ];

        $jsonRespMessage = ($destination == 'new-password')
        ?
           "Mail could not be sent, because you are on local machine, use $otp for your verification or click <a href='".config('app.react_url') . "/verify-otp/$destination/$email/$otp'>Verify</a> to proceed"
        :
           "Mail could not be sent, because you are on local machine, use $otp for your verification or click <a href='".config('app.react_url') . "/verify-registration/$destination/$name/$email/$otp/$password'>Verify</a> to proceed";


        return send_email($mail_function, $otp, $email, $email_title, $email_message, $jsonRespMessage);

    }

    public function sendRegistrationOTP(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email'=>'required|email|max:191|unique:users,email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        }

        $password_reset = new AuthController;
        return $password_reset->sendOTP($request->all(), 'VerificationMail', 'dashboard');
    }


    public function logout(){
        Auth::user()->tokens->each(function($token, $key) {
            $token->delete();
        });

        return response()->json([
            'status'=>200,
            'message'=>'Logged out successfully'
        ]);
    }
}
