<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

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
}
