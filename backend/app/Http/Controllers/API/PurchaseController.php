<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Mail\TransactionMail;
use App\Models\Activities;
use App\Models\Api;
use App\Models\Beneficiaries;
use App\Models\Category;
use App\Models\Levels;
use App\Models\Product;
use App\Models\Services;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Mail;

class PurchaseController extends Controller
{
    //Processing all of my purchase requests

    public function airtime(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $user_level = auth('sanctum')->user()->level;
        $user = User::find($user_id);
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $category = Category::where('id', $product->product_id)->first();
        $discountedAmount = ($request->input('amount') - ($request->input('amount') * $level['percentage']) / 100) - ($product['discount'] - $product['charges']);
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) {
            return response()->json([
                'status' => 400,
                'errors' => 'You do not have enough balance'
            ]);
        } else {
            /* $api = Api::where('api_name', 'smartrecharge')->first();
            $response = Http::get($api['api_url'].'/airtime', [
                'api_key' => $api['api_key'],
                'product_code' => $product['api_product_id'],
                'phone' => $request->phone,
                'amount' => $request->amount
            ]);

            $result = $response->json(); */

            $result = [
                'error_code' => '1986',
                'data' => [
                    'recharge_id' => '122255453',
                    'text_status' => 'success'
                ]
            ];

            // print_r($result);

            if ($result['error_code'] == '1986' || $result['error_code'] == '1981') {
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user' => $user,
                    'beneficiaryName' => $request->beneficiaryName,
                    'saveBeneficiary' => $request->saveBeneficiary,
                    'number' => $request->phone,
                    'category_id' => $product['category_id'],
                    'product_id' => $product['id'],
                    'service_id' => null,
                    'amount' => $discountedAmount,
                    'reference' => 'SUB' . rand(),
                    'api_reference' => $result['data']['recharge_id'],
                    'description' => "₦" . number_format($discountedAmount) . " " . $product['name']. " for " . $request->phone,
                    'after_balance' => $afterBalance,
                    'status' => strtolower($result['data']['text_status'] == 'COMPLETED' ? 'success' :  $result['data']['text_status'])
                ]);

            } else {
                return response()->json([
                    'status' => 400,
                    'errors' => 'Something went wrong: '. $result['error_code']
                ]);
            }
        }
    }

    public function data(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $user_level = auth('sanctum')->user()->level;
        $user = User::find($user_id);
        $level = Levels::where('level', $user_level)->first();
        $service = Services::where('id', $request->service_id)->first();
        $product = Product::where('id', $service->product_id)->first();
        $category = Category::where('id', $product->product_id)->first();
        $discountedAmount = $service['price'] - ($service['price'] * $level['percentage']) / 100;
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) {
            return response()->json([
                'status' => 400,
                'errors' => 'You do not have enough balance'
            ]);
        } else {

           /*  $api = Api::where('api_name', 'smartrecharge')->first();
            $response = Http::get($api['api_url'].'/datashare', [
                'api_key' => $api['api_key'],
                'product_code' => $service['api_service_id'],
                'phone' => $request->phone
            ]);

            $result = $response->json(); */

            $result = [
                'error_code' => '1986',
                'data' => [
                    'recharge_id' => '122255453',
                    'text_status' => 'success'
                ]
            ];

            if ($result['error_code'] == '1986' || $result['error_code'] == '1981') {
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user' => $user,
                    'beneficiaryName' => $request->beneficiaryName,
                    'saveBeneficiary' => $request->saveBeneficiary,
                    'number' => $request->phone,
                    'category_id' => $product['category_id'],
                    'product_id' => $product['id'],
                    'service_id' => $service['id'],
                    'amount' => $discountedAmount,
                    'reference' => 'SUB' . rand(),
                    'api_reference' => $result['data']['recharge_id'],
                    'description' => "₦" . number_format($discountedAmount) . " " . $service['name']. " for " . $request->phone,
                    'after_balance' => $afterBalance,
                    'status' => strtolower($result['data']['text_status'] == 'COMPLETED' ? 'success' :  $result['data']['text_status'])
                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'errors' => 'Something went wrong: '. $result['error_code']
                ]);
            }
        }
    }

    public function bill(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $user = User::find($user_id);
        $user_level = auth('sanctum')->user()->level;
        $level = Levels::where('level', $user_level)->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $product = Product::where('id', $service->product_id)->first();
        $category = Category::where('id', $product->product_id)->first();
        $discountedAmount = $service['price'] - ($service['price'] * $level['percentage']) / 100;
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) {
            return response()->json([
                'status' => 400,
                'errors' => 'You do not have enough balance'
            ]);
        } else {
            $api = Api::where('api_name', 'smartrecharge')->first();
            /* $response = Http::get($api['api_url'].'/tv', [
                'api_key' => $api['api_key'],
                'product_code' => $service['api_service_id'],
                'smartcard_number' => $request->smartcard_number
            ]);
            $result = $response->json(); */

            $result = [
                'error_code' => '1986',
                'data' => [
                    'recharge_id' => '122255453',
                    'text_status' => 'success'
                ]
            ];

            if ($result['error_code'] == '1986' || $result['error_code'] == '1981') {

                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user' => $user,
                    'beneficiaryName' => $request->beneficiaryName,
                    'saveBeneficiary' => $request->saveBeneficiary,
                    'number' => $request->smartcard_number,
                    'category_id' => $product['category_id'],
                    'product_id' => $product['id'],
                    'service_id' => $service['id'],
                    'amount' => $discountedAmount,
                    'reference' => 'SUB' . rand(),
                    'api_reference' => $result['data']['recharge_id'],
                    'description' => "₦" . number_format($discountedAmount) . " " . $service['name'] . " for " . $request->smartcard_number,
                    'after_balance' => $afterBalance,
                    'status' => strtolower($result['data']['text_status'] == 'COMPLETED' ? 'success' :  $result['data']['text_status'])
                ]);
            } else {
                return response()->json([
                    'status' => 400,
                    'errors' => 'Something went wrong: '. $result['error_code']
                ]);
            }
        }

    }


    public function electricity(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $user_level = auth('sanctum')->user()->level;
        $user = User::find($user_id);
        $level = Levels::where('level', $user_level)->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $product = Product::where('id', $service->product_id)->first();
        $category = Category::where('id', $product->product_id)->first();
        $discountedAmount = ($request->input('amount') - ($request->input('amount') * $level['percentage']) / 100) + ($product['charges'] - $product['discount']);
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) {
            return response()->json([
                'status' => 400,
                'errors' => 'You do not have enough balance'
            ]);
        } else {
            /* $api = Api::where('api_name', 'smartrecharge')->first();
            $response = Http::get($api['api_url'].'/electric', [
                'api_key' => $api['api_key'],
                'product_code' => $service['api_service_id'],
                'meter_number' => $request->meter_number,
                'amount' => $request->amount
            ]);

            $result = $response->json(); */

            $result = [
                'error_code' => '1986',
                'data' => [
                    'recharge_id' => '122255453',
                    'text_status' => 'success'
                ]
            ];

            if ($result['error_code'] == '1986' || $result['error_code'] == '1981') {
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user' => $user,
                    'beneficiaryName' => $request->beneficiaryName,
                    'saveBeneficiary' => $request->saveBeneficiary,
                    'number' => $request->meter_number,
                    'category_id' => $product['category_id'],
                    'product_id' => $product['id'],
                    'service_id' => null,
                    'amount' => $discountedAmount,
                    'reference' => 'SUB' . rand(),
                    'api_reference' => $result['data']['recharge_id'],
                    'description' => "₦" . number_format($discountedAmount) . " " . $product['name'] . " for " . $request->meter_number,
                    'after_balance' => $afterBalance,
                    'status' => strtolower($result['data']['text_status'] == 'COMPLETED' ? 'success' :  $result['data']['text_status'])
                ]);

            } else {
                return response()->json([
                    'status' => 400,
                    'errors' => 'Something went wrong: '. $result['error_code']
                ]);
            }
        }
    }

    public function purchaser($request)
    {
        $title = '[Debit Transaction] Thank you for your purchase';
        $customer_details = [
            'name' => $request['user']['name'],
            'email' => $request['user']['email'],
            'title' => $title,
            'balance' => $request['after_balance'],
            'reference' => $request['reference'],
            'price' => number_format($request['amount']),
            'description' => $request['description'],
            'order_date' => date('Y-m-d H:i:s')
        ];

        Activities::create([
            'type' => 'debit',
            'title' => $request['description'],
            'log' => serialize($customer_details)
        ]);

        if ($request['saveBeneficiary'] == 'true') {
            $beneficiary = Beneficiaries::where('user_id', $request['user']['id'])->where('number', $request['number'])->first();

            if ($beneficiary) {
                return response()->json([
                    'status' => 422,
                    'errors' => 'Beneficiary already exists'
                ]);
            }
            Beneficiaries::create([
                'user_id' =>$request['user']['id'],
                'name' => $request['beneficiaryName'],
                'category_id' => $request['category_id'],
                'number' => $request['number']
            ]);
        }

        $transaction = new Transactions();
        $transaction->user_id = $request['user']['id'];
        $transaction->category_id = $request['category_id'];
        $transaction->product_id = $request['product_id'];
        $transaction->service_id = $request['service_id'];
        $transaction->amount = $request['amount'];
        $transaction->reference = $request['reference'];
        $transaction->api_reference = $request['api_reference'];

        $transaction->description = $request['description'];
        $transaction->status = $request['status'];
        $transaction->type = 'debit';

        $user = User::find($request['user']['id']);
        $user->balance = $request['after_balance'];

        if ($transaction->save() && $user->save()) {

            Mail::to($customer_details['email'])
            ->send(new TransactionMail($title, $customer_details));

            return [
                'status' => 200,
                'message' => 'Transaction successful',
            ];
        } else {
            return [
                'status' => 400,
                'errors' => 'Unable to save transaction'
            ];
        }
    }
}
