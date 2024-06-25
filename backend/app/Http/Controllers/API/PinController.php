<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Mail\PasswordUpdateMail;
use App\Mail\VerificationMail;
use App\Models\OTPs;
use App\Models\TransactionPin;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Mail;


class PinController extends Controller
{
    public function verify($pin)
    {
        if(auth('sanctum')->check()) {
            $user_id=Auth::id();

            $user_pin = User::where('id', $user_id)->first()->pin;


            if ($pin != $user_pin) {
                return response()->json([
                'status' => 400,
                'message' => "Invalid pin",
                ]);
            }
            else {
                return response()->json([
                    'status'=>200,
                    'message'=>'pin was matched'
                ]);
            }
        }
    }

    public function update(Request $request)
    {

        $validator=Validator::make($request->all(),[
            'pin'=>'required',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status'=>422,
                'errors'=>$validator->errors(),
            ]);
        }
        else
        {
            $user_id=Auth::id();
            $user= User::find($user_id);
            $user->pin= $request->input('pin');

            if ( $user->save() )
            {
                return response()->json([
                    'status'=>200,
                    'message'=>"Transaction PIN updated successfully",
                ]);
            }
            else
            {
                return response()->json([
                    'status'=>404,
                    'errors'=>"Unable to update user",
                ]);
            }
        }
    }

    public function verifyOtpAndResetPin(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'otp' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $password_reset = OTPs::where('token', $request->input('otp'))->first();

            if($password_reset) {
                $user= User::where('email',$password_reset->email)->first();
                $seconds = 1800; // 30 mins
                $time1 = strtotime($password_reset->created_at) + $seconds;
                if(time() >= $time1) {
                    return response()->json([
                        'status' => 422,
                        'errors' => "OTP has expired after 30 Minutes",
                    ]);
                }

                if ($password_reset->email === $user->email) {

                    if($request->password) {
                        $email_title = "[Update] PIN Update";
                        $email_message = [
                            'name' => $user->name,
                            'otp' => $request->input('otp'),
                            'title' => $email_title
                        ];

                        if(config('app.env') !== 'local') {
                            Mail::to($request->input('email'))
                            ->send(new PasswordUpdateMail($email_title, $email_message));
                        }
                        
                        $user->pin = $request->input('pin');
                        $user->save();
                    }

                    return response()->json([
                        'status' => 200,
                        'message' => "Pin reset successfully",
                    ]);
                } else {
                    return response()->json([
                        'status' => 400,
                        'errors' => "User not found",
                    ]);
                }
            } else {
                return response()->json([
                   'status' => 404,
                   'errors' => "Incorrect OTP",
                ]);

            }
        }
    }

    public function verifyOtpForPin($otp)
    {

        $password_reset = TransactionPin::where('token', $otp)->first();

        if($password_reset) {
            $user= User::where('email',$password_reset->email)->first();
            $seconds = 1800; // 30 mins
            $time1 = strtotime($password_reset->created_at) + $seconds;
            if(time() >= $time1) {
                return response()->json([
                    'status' => 422,
                    'errors' => "OTP has expired after 30 Minutes",
                ]);
            }

            if ($password_reset->email === $user->email) {
                return response()->json([
                    'status' => 200,
                    'message' => "Pin reset successfully",
                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'errors' => "User not found",
                ]);
            }
        } else {
            return response()->json([
                'status' => 404,
                'errors' => "Incorrect OTP",
            ]);

        }
    }
}
