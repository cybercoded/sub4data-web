<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function update(Request $request)
    {
        
        $validator=Validator::make($request->all(),[
            'name'=>'required|string',
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
            $user->name= $request->input('name');                
            
            if ( $user->save() ) 
            {
                return response()->json([
                    'status'=>200,
                    'message'=>"Profile updates successfully",
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

    public function verifyPassword($password)
    {
        $user_id=auth('sanctum')->user()->id;
        $user= User::find($user_id);
        if(! Hash::check($password,$user->password))                
        {
            return response()->json([
                'status'=>422,
                'message'=>"Password not matched",
            ]);
        }
        else
        {
            return response()->json([
                'status'=>200,
                'errors'=>"Password was matched",
            ]);
        }
    }

    public function updatePassword(Request $request)
    {
        
        $validator=Validator::make($request->all(),[
            'password'=>'required|string',
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
            $user->password= Hash::make($request->input('password'));                
            
            if ( $user->save() ) 
            {
                return response()->json([
                    'status'=>200,
                    'message'=>"Password was updated successfully",
                ]);
            }
            else
            {
                return response()->json([
                    'status'=>404,
                    'errors'=>"Unable to update password",
                ]);
            }
        }
    }
    
}
