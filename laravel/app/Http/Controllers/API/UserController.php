<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Banks;
use App\Models\Levels;
use App\Models\Transactions;
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

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $user_id = auth('sanctum')->user()->id;
            $user = User::find($user_id);
            $user->name = $request->input('name');

            if ($user->save()) {
                return response()->json([
                    'status' => 200,
                    'message' => "Profile updates successfully",
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'errors' => "Unable to update user",
                ]);
            }
        }
    }

    public function adminUpdate(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $user = User::find($id);
            $user->name = $request->input('name');
            $user->status = $request->input('status') == true ? 1 : 0;

            if ($user->save()) {
                return response()->json([
                    'status' => 200,
                    'message' => "User updated successfully",
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'errors' => "Unable to update user",
                ]);
            }
        }
    }

    public function adminCreditUser(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'amount' => 'required',
            'user_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {

            $from = auth('sanctum')->user();
            $to = User::find($request->user_id);
            $afterBalance = $from->balance - $request->input('amount');

            if ($afterBalance - $request->input('amount') < 0) 
            {
                return response()->json([
                'status'=>400,
                    'errors'=> 'You do not have enough balance'
                ]);
            }
            else if ($from->id === $to->id) {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'You can not credit your own account'
                ]);
            }
            else {
               
                $transactionTo=new Transactions();
                $transactionFrom=new Transactions();
                
                $transactionTo->user_id= $to->id;
                $transactionTo->amount = $request->amount;            
                $transactionTo->reference = 'TRANS'.rand(); 
                $transactionTo->description = "₦".number_format($request->amount) ." sent from ". $from->name;
                $transactionTo->type = 'credit_transfer';
                $transactionTo->status = 'success';
                
                
                $transactionFrom->user_id= $from->id;
                $transactionFrom->amount = $request->amount;            
                $transactionFrom->reference = 'TRANS'.rand(); 
                $transactionFrom->description = "₦".number_format($request->amount) ." sent to ". $to->name;
                $transactionFrom->type = 'debit_transfer';
                $transactionFrom->status = 'success';

                $to->balance = $to->balance + $request->amount;

                $from->balance = $from->balance - $request->amount;


                if ($to->save() && $from->save() && $transactionTo->save() && $transactionFrom->save()) {
                    return response()->json([
                        'status' => 200,
                        'message' => "Transaction successful",
                    ]);
                } else {
                    return response()->json([
                        'status' => 404,
                        'errors' => "Unable to transafer fund",
                    ]);
                }
            }
        }
    }

    public function adminDebitUser(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'amount' => 'required',
            'user_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {

            $from = auth('sanctum')->user();
            $to = User::find($request->user_id);
            $transactionTo=new Transactions();
            $transactionFrom=new Transactions();
            
            $transactionTo->user_id= $to->id;
            $transactionTo->amount = $request->amount;            
            $transactionTo->reference = 'TRANS'.rand(); 
            $transactionTo->description = "₦".number_format($request->amount) ." debit from ". $from->name;
            $transactionTo->type = 'credit_transfer';
            $transactionTo->status = 'success';
            
            
            $transactionFrom->user_id= $from->id;
            $transactionFrom->amount = $request->amount;            
            $transactionFrom->reference = 'TRANS'.rand(); 
            $transactionFrom->description = "₦".number_format($request->amount) ." debit to ". $to->name;
            $transactionFrom->type = 'debit_transfer';
            $transactionFrom->status = 'success';

            $to->balance = $to->balance - $request->amount;

            $from->balance = $from->balance + $request->amount;


            if ($to->save() && $from->save() && $transactionTo->save() && $transactionFrom->save()) {
                return response()->json([
                    'status' => 200,
                    'message' => "Transaction successful",
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'errors' => "Unable to transafer fund",
                ]);
            }
        }
    }
    

    public function verifyPassword($password)
    {
        $user_id = auth('sanctum')->user()->id;
        $user = User::find($user_id);
        if (!Hash::check($password, $user->password)) {
            return response()->json([
                'status' => 422,
                'message' => "Password not matched",
            ]);
        } else {
            return response()->json([
                'status' => 200,
                'errors' => "Password was matched",
            ]);
        }
    }

    public function adminVerifyEmail($email)
    {
        $user = User::where('email', $email)->first();
        if ($user) {
            return response()->json([
                'status' => 200,
                'data' => [
                    'user_id' => $user->id,
                    'name' => $user->name
                ]
            ]);
        } else {
            return response()->json([
                'status' => 422,
                'errors' => "Email not found",
            ]);
        }
    }

    public function updatePassword(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $user_id = auth('sanctum')->user()->id;
            $user = User::find($user_id);
            $user->password = Hash::make($request->input('password'));

            if ($user->save()) {
                return response()->json([
                    'status' => 200,
                    'message' => "Password was updated successfully",
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'errors' => "Unable to update password",
                ]);
            }
        }
    }

    public function viewBanks()
    {
        $user_id = auth('sanctum')->user()->id;
        $banks = Banks::where('user_id', $user_id)->get();

        if ($banks) {
            return response()->json([
                'status' => 200,
                'banks' => $banks
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'No product found'
            ]);
        }
    }

    public function getDiscount()
    {
        $user_level = auth('sanctum')->user()->level;
        $level = Levels::where('level', $user_level)->first();

        if ($level && $user_level) {
            return response()->json([
                'status' => 200,
                'percentage' => $level['percentage']
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'No discount or percentage found'
            ]);
        }
    }

}