<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Mail\VerificationMail;
use App\Models\User;
use Dotenv\Exception\ValidationException;
use App\Models\PasswordReset;
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
            $user=User::create([
                'name'=>$request->name,
                'email'=>$request->email,
                'password'=>Hash::make($request->password)
            ]);

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
            $user= User::where('email',$request->email)->first();

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
