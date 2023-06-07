<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Banks;
use App\Models\Levels;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return response()->json([
            'status' => 200,
            'users' => $users
        ]);
    }

    public function edit($id)
    {
        $user = User::find($id);

        if ($user) {

            return response()->json([
                'status' => 200,
                'data' => $user
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'No user found'
            ]);
        }
    }

    public function userUpdate(Request $request)
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

    public function adminUpdate(Request $request, $id)
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
            $user= User::find($id);
            $user->name= $request->input('name');                
            $user->status= $request->input('status') == true ? 1 : 0;                
            $user->balance= $request->input('balance'); 
            
            if ( $user->save() ) 
            {
                return response()->json([
                    'status'=>200,
                    'message'=>"User updated successfully",
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

    public function viewBanks()
    {
        $user_id=auth('sanctum')->user()->id; 
        $banks = Banks::where('user_id', $user_id)->get();

        if($banks)
        {            
            return response()->json([
                'status'=>200,
                'banks'=>$banks
            ]);
        }
        else
        {
            return response()->json([
                'status'=>404,
                'message'=>'No product found'
            ]);
        }
    }

    public function getDiscount()
    {
        $user_level=auth('sanctum')->user()->level; 
        $level = Levels::where('level', $user_level)->first();

        if($level && $user_level)
        {            
            return response()->json([
                'status'=>200,
                'percentage'=> $level['percentage']
            ]);
        }
        else
        {
            return response()->json([
                'status'=>404,
                'message'=>'No discount or percentage found'
            ]);
        }
    }
    
}
