<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Mail\PasswordUpdateMail;
use App\Mail\TransactionMail;
use App\Mail\VerificationMail;
use App\Models\Activities;
use App\Models\Api;
use App\Models\Banks;
use App\Models\Levels;
use App\Models\PasswordReset;
use App\Models\TransactionPin;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Mail;

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

    public function getNotification()
    {
        $notification = Activities::where('type', 'bulk_email')->first();
        return response()->json([
            'status' => 200,
            'notification' => [
                'title' => $notification['title'],
                'message' => unserialize($notification['log'])['message']
            ]
        ]);
    }

    public function getMonnifyCharges()
    {
        $api = Api::where('api_name', 'monnify')->first();

        if(!$api) {
            return response()->json([
               'status' => 404,
               'error' => 'API not found'
            ]);
        }

        return response()->json([
            'status' => 200,
            'charge' => $api['api_payment_charges']
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

    public function resetPassword(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $password_reset = new PasswordReset();
            $otp = rand ( 10000 , 99999 );
            $password_reset->token = $otp;
            $password_reset->email = $request->input('email');

            if ($password_reset->save()) {

                $user = User::where('email', $request->input('email'))->first();
                $email_title = "[Verification] Password Reset";
                $email_message = [
                    'name' => $user->name,
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
                    'errors' => "Unable to update user",
                ]);
            }
        }
    }

    public function verifyOtpAndResetPassword(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'otp' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $password_reset = PasswordReset::where('token', $request->input('otp'))->first();

            if($password_reset) {
                $user= User::where('email',$request->email)->first();
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
                        $email_title = "[Update] Password Update";
                        $email_message = [
                            'name' => $user->name,
                            'otp' => $request->input('otp'),
                            'title' => $email_title
                        ];
                        Mail::to($request->input('email'))
                        ->send(new PasswordUpdateMail($email_title, $email_message));

                        Activities::create([
                            'type' => $request->type,
                            'title' => $request->title,
                            'log' => serialize($email_message)
                        ]);

                        $user->password = Hash::make($request->input('password'));
                        $user->save();
                    }

                    return response()->json([
                        'status' => 200,
                        'message' => "Password reset successfully",
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

    public function verifyRegistrationOtp(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'otp' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $password_reset = PasswordReset::where('token', $request->input('otp'))
            ->where('email', $request->input('email'))->first();

            if($password_reset) {
                $seconds = 1800; // 30 mins
                $time1 = strtotime($password_reset->created_at) + $seconds;
                if(time() >= $time1) {
                    return response()->json([
                        'status' => 422,
                        'errors' => "OTP has expired after 30 Minutes",
                    ]);
                }
                return response()->json([
                    'status' => 200,
                    'errors' => "OTP was verified successfully"
                ]);
            } else {
                return response()->json([
                   'status' => 404,
                   'errors' => "Incorrect OTP",
                ]);

            }
        }
    }


    public function usersFilter(Request $request)
    {
        $users = User::query()
        ->when($request->input('role_as'), fn ($query, $role_as) => $query->where('role_as', '=', $role_as))
        ->when($request->input('status'), fn ($query, $status) => $query->where('status', '=', $status))
        ->when($request->input('search'), fn ($query, $search) => $query->where('name', '=', $search))
        ->when($request->input('search'), fn ($query, $search) => $query->orWhere('email', 'like', '%'. $search .'%'))
        ->when($request->input('limit'), fn ($query, $limit) => $query->take($limit))
        ->orderBy('id', 'desc')
        ->get();


        if (count ($users) > 0) {
            return response()->json([
                'status' => 200,
                'users' => $users
            ]);
        } else {
            return response()->json([
               'status' => 422,
                'errors' => 'No users found for your filter'
            ]);
        }
    }

    public function adminUpdate(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $user = User::find($id);
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->status = $request->input('status') == true ? 1 : 0;
            $user->role_as = $request->input('role_as') == true ? 1 : 0;

            if($request->input('password')) {
                $user->password = Hash::make('password');
            }

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

                //mailing receivers
                $title = '[Credit Transaction] Transfer';
                $customer_details = [
                    'name' => $from->name,
                    'email' => $from->email,
                    'title' => $title,
                    'balance' => $from->balance,
                    'reference' =>  $transactionFrom->reference,
                    'price' => number_format($request['amount']),
                    'description' => $from->description,
                    'order_date' => date('Y-m-d H:i:s')
                ];

                Mail::to($customer_details['email'])
                ->send(new TransactionMail($title, $customer_details));

                //Recording receiver
                Activities::create([
                    'type' => $request->type,
                    'title' => $request->title,
                    'log' => serialize($customer_details)
                ]);

                //mailing sender
                $title = '[Debit Transaction] Transfer';
                $customer_details = [
                    'name' => $to->name,
                    'email' => $to->email,
                    'title' => $title,
                    'balance' => $to->balance,
                    'reference' =>  $transactionTo->reference,
                    'price' => number_format($request['amount']),
                    'description' => $to->description,
                    'order_date' => date('Y-m-d H:i:s')
                ];

                Mail::to($customer_details['email'])
                ->send(new TransactionMail($title, $customer_details));

                //Recording sender
                Activities::create([
                    'type' => $request->type,
                    'title' => $request->title,
                    'log' => serialize($customer_details)
                ]);


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

            //mailing receivers
            $title = '[Credit Transaction] Transfer';
            $customer_details = [
                'name' => $from->name,
                'email' => $from->email,
                'title' => $title,
                'balance' => $from->balance,
                'reference' =>  $transactionFrom->reference,
                'price' => number_format($request['amount']),
                'description' => $from->description,
                'order_date' => date('Y-m-d H:i:s')
            ];

            Mail::to($customer_details['email'])
            ->send(new TransactionMail($title, $customer_details));

            //Recording receiver
            Activities::create([
                'type' => $request->type,
                'title' => $request->title,
                'log' => serialize($customer_details)
            ]);

            //mailing sender
            $title = '[Debit Transaction] Transfer';
            $customer_details = [
                'name' => $to->name,
                'email' => $to->email,
                'title' => $title,
                'balance' => $to->balance,
                'reference' =>  $transactionTo->reference,
                'price' => number_format($request['amount']),
                'description' => $to->description,
                'order_date' => date('Y-m-d H:i:s')
            ];

            Mail::to($customer_details['email'])
            ->send(new TransactionMail($title, $customer_details));

            //Recording sender
            Activities::create([
                'type' => $request->type,
                'title' => $request->title,
                'log' => serialize($customer_details)
            ]);


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
