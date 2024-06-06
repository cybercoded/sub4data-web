<?php

namespace App\Http\Controllers\API;

use App\Models\IPWhitelists;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Mail\VerificationMail;
use App\Models\Api;
use App\Models\Banks;
use App\Models\User;
use Dotenv\Exception\ValidationException;
use App\Models\PasswordReset;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
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

    public function login(Request $request){
        $validator= Validator::make($request->all(),[
            'email'=>'required|max:191',
            'password'=>'required'
        ]);
        if($validator->fails()){
            return response()->json([
                'validation_errors'=>$validator->errors()
            ]);
        }else{
            $user= User::where('email',$request->email)->where('status', 1)->first();
            $ifIPisWhitelisted = IPWhitelists::where('ip', $request->ip())->get();

            if(! $user || ! Hash::check($request->password,$user->password)){
                return response()->json([
                    'status'=>401,
                    'errors'=>'Invalid credentials'
                ]);
            }elseif(count($ifIPisWhitelisted) == 0){
                return response()->json([
                    'status'=>401,
                    'errors'=> "(". $request->ip(). ") IP address was not found on our list"
                ]);
            }else {
                if($user->role_as==1) //admin
                {
                    $role='admin';
                    $token=$user->createToken($user->email. '_AdminToken', ['server:admin'])->plainTextToken;
                }
                else //user
                {
                    $role='user';
                    $token=$user->createToken($user->email. '_Token', ['client:user'])->plainTextToken;
                }

                $user->access_token = $token;

                $user->save();

                return response()->json([
                    'status'=>200,
                    'username'=>$user->name,
                    'token'=>$token,
                    'message'=>'Logged in successfully',
                    'role'=>$role
                ]);
            }
        }
    }

    public function sendOTP(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        }

        $existing_user = User::where('email',$request->email)->first();
        if ($existing_user) {
            return response()->json([
                'status' => 404,
                'errors' => "Email already registered",
            ]);
        }
        $password_reset = new PasswordReset();
        $otp = rand ( 10000 , 99999 );
        $password_reset->token = $otp;
        $password_reset->email = $request->input('email');

        if ($password_reset->save()) {

            $email_title = "[Verification] Password Reset";
            $email_message = [
                'name' => "Dear customer",
                'otp' => $otp,
                'title' => $email_title,
            ];

            try {
                // Send the email
                Mail::to($request->input('email'))->send(new VerificationMail($email_title, $email_message));
                
                // Check if the email was sent successfully
                if(count(Mail::failures()) > 0) {
                    // Handle failure, log errors, or perform any necessary action
                    Log::error('Failed to send email to: ' . $request->input('email'));
                    return response()->json([
                        'status' => 419,
                        'errors' => "Mail could not be sent to ". $request->input('email'),
                    ]);
                } else {
                    // Email sent successfully
                    return response()->json([
                        'status' => 200,
                        'message' => "OTP sent successfully",
                    ]);
                }
            } catch (\Exception $e) {
                // Handle exceptions, which could include cases like no internet connection
                Log::error('Error sending email: ' . $e->getMessage());
                return response()->json([
                    'status' => 201,
                    'errors' => "Mail could not be sent",
                    'log' => $e->getMessage(),
                    'otp' => config('app.env') === 'local' ? $otp : '',
                    'local' => config('app.env') === 'local' ? true : false,
                ]);
            }
           
        } else {
            return response()->json([
                'status' => 404,
                'errors' => "Unable to send OTP",
            ]);
        }

    }

    public function resendOTP(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        }

        $password_reset = new PasswordReset();
        $otp = rand ( 10000 , 99999 );
        $password_reset->token = $otp;
        $password_reset->email = $request->input('email');

        if ($password_reset->save()) {

            $email_title = "[Verification] Password Reset";
            $email_message = [
                'name' => "Dear customer",
                'otp' => $otp,
                'title' => $email_title,
            ];
            
            try {
                // Send the email
                Mail::to($request->input('email'))->send(new VerificationMail($email_title, $email_message));
                
                // Check if the email was sent successfully
                if(count(Mail::failures()) > 0) {
                    // Handle failure, log errors, or perform any necessary action
                    Log::error('Failed to send email to: ' . $request->input('email'));
                    return response()->json([
                        'status' => 419,
                        'errors' => "Mail could not be sent to ". $request->input('email'),
                    ]);
                } else {
                    // Email sent successfully
                    return response()->json([
                        'status' => 200,
                        'message' => "OTP sent successfully",
                    ]);
                }
            } catch (\Exception $e) {
                // Handle exceptions, which could include cases like no internet connection
                Log::error('Error sending email: ' . $e->getMessage());
                return response()->json([
                    'status' => 201,
                    'errors' => "Mail could not be sent",
                    'log' => $e->getMessage(),
                    'otp' => config('app.env') === 'local' ? $otp : '',
                    'local' => config('app.env') === 'local' ? true : false,
                ]);
            }
        } else {
            return response()->json([
                'status' => 404,
                'errors' => "Unable to send OTP",
            ]);
        }

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
