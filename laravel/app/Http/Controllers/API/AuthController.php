<?php

namespace App\Http\Controllers\API;

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

            $response = Http::withHeaders([
                'Authorization' => "Basic ".$authorization,
                'Content-Type' => 'application/json'
            ])->post('https://api.monnify.com/api/v1/auth/login/');

            $jsonData = $response->json();
            $accessToken = $jsonData['responseBody']['accessToken'];

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
            /* "232": "Sterling bank",
            "035": "Wema bank",
            "50515": "Moniepoint Microfinance Bank",
            "058": "GTBank", */

            $response = Http::withHeaders([
                'Authorization' => "Bearer ".$accessToken,
                'Content-Type' => 'application/json'
            ])->post($api['api_url']."/bank-transfer/reserved-accounts", $apiPostArray);

            $jsonData = $response->json();
            $result = $jsonData['responseBody'];

            // print_r($jsonData);
            $user=User::create([
                'name'=>$request->name,
                'email'=>$request->email,
                'user_ip' => $request->ip(),
                'password'=>Hash::make($request->password)
            ]);

            if($jsonData['responseMessage'] == 'success' && $user){

                Banks::create([
                    'user_id' => $user->id,
                    'bank_name'=>$result['bankName'],
                    'account_name'=>$result['accountName'],
                    'account_number'=>$result['accountNumber'],
                    'reference'=>$result['accountReference'],
                ]);
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

            if(! $user || ! Hash::check($request->password,$user->password)){
                return response()->json([
                    'status'=>401,
                    'errors'=>'Invalid credentials'
                ]);
            }else{
                if($user->role_as==1) //admin
                {
                    $role='admin';
                    $token=$user->createToken($user->email. '_AdminToken', ['server:admin'])->plainTextToken;
                }
                else //user
                {
                    $role='user';
                    $token=$user->createToken($user->email. '_Token', [''])->plainTextToken;
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
            Mail::to($request->input('email'))
            ->send(new VerificationMail($email_title, $email_message));

            return response()->json([
                'status' => 200,
                'message' => "OTP sent successfully",
            ]);
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
            Mail::to($request->input('email'))
            ->send(new VerificationMail($email_title, $email_message));

            return response()->json([
                'status' => 200,
                'message' => "OTP sent successfully",
            ]);
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
