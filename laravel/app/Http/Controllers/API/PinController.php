<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class PinController extends Controller
{
    public function verify($pin)
    {
        if(auth('sanctum')->check()) {
            $user_id=auth('sanctum')->user()->id;
            
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
            $user_id=auth('sanctum')->user()->id;
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
}
