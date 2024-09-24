<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserResourceCollection;
use App\Mail\PasswordUpdateMail;
use App\Mail\TransactionMail;
use App\Mail\VerificationMail;
use App\Models\Activities;
use App\Models\Api;
use App\Models\Banks;
use App\Models\Levels;
use App\Models\OTPs;
use App\Models\PasswordReset;
use App\Models\TransactionPin;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\API\PurchaseController;
use App\Http\Controllers\API\ACLsController;
use Illuminate\Support\Facades\Http;
use Mail;

class UserController extends Controller
{
    public function index()
    {
        $users = User::orderBy('id', 'desc')->take(10)->get();
        return response()->json([
            'status' => 200,
            'users' => new UserResourceCollection($users)
        ]);
    }

    public function view(Request $request)
    {
        $userId = $request->user?->id ?: auth('sanctum')->user()->id;
        $user = User::find($userId)->first();

        return response()->json([
            'status' => 200,
            'data' => new UserResource($user)
        ]);
    }

    public function getNotification()
    {
        $notification = Activities::where('type', 'bulk_email')->first();

        if($notification) {
            return response()->json([
                'status' => 200,
                'notification' => [
                    'title' => $notification['title'],
                    'message' => unserialize($notification['log'])['message']
                ]
            ]);
        }
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
            $user->mfa = $request->mfa ? 1 : 0;

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

    public function createAutomatedBanks(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $user = User::find($user_id);
        $api = Api::where('api_name', 'monnify')->first();
        $authorization = base64_encode($api['api_key'] . ':' . $api['api_secret']);

            $response = Http::withHeaders([
                'Authorization' => "Basic ".$authorization,
                'Content-Type' => 'application/json'
            ])->post('https://api.monnify.com/api/v1/auth/login/');

            $jsonData = $response->json();
            $accessToken = $jsonData['responseBody']['accessToken'];

            $apiPostArray = [
                'accountReference' => strtoupper(substr($user->name, 0, 5)).time(),
                'accountName' => $user->name,
                'currencyCode' => 'NGN',
                'contractCode' => $api['api_contract_code'],
                'customerEmail' => $user->email,
                'customerName' => $user->name,
                'bvn' => '22161748511',
                'getAllAvailableBanks' => true,
                'preferredBanks' => ['50515','035', '058', '232']
            ];

            $response = Http::withHeaders([
                'Authorization' => "Bearer ".$accessToken,
                'Content-Type' => 'application/json'
            ])->post($api['api_url']."/bank-transfer/reserved-accounts", $apiPostArray);

            $jsonData = $response->json();
            $result = $jsonData['responseBody'];

            if($jsonData['responseMessage'] == 'success'){

                Banks::create([
                    'user_id' => $user_id,
                    'bank_name'=>$result['bankName'],
                    'account_name'=>$result['accountName'],
                    'account_number'=>$result['accountNumber'],
                    'reference'=>$result['accountReference'],
                ]);

                return response()->json([
                    'status' => 200,
                    'message' => "Automated banks created successfully",
                ]);
            }
    }

    public function userUpgrade(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'level' => 'required|integer|min:1'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $user_id = auth('sanctum')->user()->id;
            $user = User::find($user_id);
            $level = Levels::where('level', $request->input('level'))->first();
            $afterBalance = $user->balance - $level['upgrade_fee'];

            $user->level = $request->input('level');
            $user->update();

            $my_purchaser = new PurchaseController;
            return $my_purchaser->purchaser([
                'user' => $user,
                'category_id' => null,
                'product_id' => null,
                'service_id' => null,
                'amount' => $level['upgrade_fee'],
                'reference' => 'SUB' . rand(),
                'api_reference' => null,
                'description' => "₦" . number_format($level['upgrade_fee']) . " for account upgrade to " . $level['name'],
                'after_balance' => $afterBalance,
                'status' => 'success'
            ]);

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
            $password_reset = new AuthController;
            return $password_reset->sendOTP($request->all(), 'VerificationMail', 'new-password');
        }
    }

    public function setNewPassword(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:otps,email',
            'otp' => 'required|exists:otps,token',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        }
        $password_reset = OTPs::where('token', $request->input('otp'))->first();

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

                $user->password = Hash::make($request->input('password'));
                $user->save();

                if( config('app.env') !== 'local' ) {
                    Mail::to($request->input('email'))
                    ->send(new PasswordUpdateMail($email_title, $email_message));
                }
            }

            return response()->json([
                'status' => 200,
                'message' => "Password reset successfully",
            ]);
        }
    }

    public function verifyOTP(Request $request)
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
            $password_reset = OTPs::where('token', $request->input('otp'))
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

            if($request->input('role_as') == true) {
                $new_acls = new ACLsController;
                $new_acls->populateACLs($id);
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
                    'description' => $transactionFrom->description,
                    'order_date' => date('Y-m-d H:i:s')
                ];

                if(config('app.env') !== 'local') {
                    Mail::to($customer_details['email'])
                    ->send(new TransactionMail($title, $customer_details));
                }

                //mailing sender
                $title = '[Debit Transaction] Transfer';
                $customer_details = [
                    'name' => $to->name,
                    'email' => $to->email,
                    'title' => $title,
                    'balance' => $to->balance,
                    'reference' =>  $transactionTo->reference,
                    'price' => number_format($request['amount']),
                    'description' => $transactionTo->description,
                    'order_date' => date('Y-m-d H:i:s')
                ];

                if(config('app.env') !== 'local') {
                    Mail::to($customer_details['email'])
                    ->send(new TransactionMail($title, $customer_details));
                }

                if ($to->save() && $from->save() && $transactionTo->save() && $transactionFrom->save()) {
                    return response()->json([
                        'status' => 200,
                        'message' => "Transaction successful",
                    ]);
                } else {
                    return response()->json([
                        'status' => 404,
                        'errors' => "Unable to transfer fund",
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

            if ($to->save() && $from->save() && $transactionTo->save() && $transactionFrom->save()) {
                return response()->json([
                    'status' => 200,
                    'message' => "Transaction successful",
                ]);
            } else {
                return response()->json([
                    'status' => 404,
                    'errors' => "Unable to transfer fund",
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
