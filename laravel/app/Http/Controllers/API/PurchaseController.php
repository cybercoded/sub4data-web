<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Levels;
use App\Models\Product;
use App\Models\Services;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    //Processing all of my purchase requests

    public function airtime(Request $request)
    {   
        $user_id=auth('sanctum')->user()->id;
        $user_level=auth('sanctum')->user()->level;
        $user= User::find($user_id);
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $discountedAmount = $request->input('amount') - ($request->input('amount') * $level['percentage']) / 100;
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) 
        {
            return response()->json([
               'status'=>400,
                'errors'=> 'You do not have enough balance'
            ]);
        }
        else
        {
            $curl = curl_init();
            $url = "https://smartrecharge.ng/api/v2/airtime/";

            $get_array = array(
                'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
                'product_code' => $product['api_product_id'],
                'phone' => $request->phone,
                'amount' => $request->amount,
            );

            // print_r($get_array);

            $curl_url = $url . "?" . http_build_query($get_array);

            curl_setopt_array($curl, array(
                CURLOPT_URL => $curl_url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
            ));

            $response =  curl_exec($curl);
            $result = json_decode($response, true);
            // print_r($result);
            
            if ($result['error_code'] === '1983') {
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user_id' => $user_id,
                    'category_id' => $product['category_id'],     
                    'product_id' => $product['id'],     
                    'service_id' => null,     
                    'amount' => $discountedAmount,     
                    'reference' => 'SUB'.rand(),     
                    'api_reference' => '',     
                    'description' => "₦".number_format($discountedAmount) ." ". $product['name'],     
                    'after_balance' => $afterBalance,
                    'status' => 'success',
                ]);

            }else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Something went wrong'
                ]);
            }
        }
    }

    public function data(Request $request)
    {   
        $user_id=auth('sanctum')->user()->id;
        $user_level=auth('sanctum')->user()->level;
        $user= User::find($user_id);
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $discountedAmount = $service['price'] - ($service['price'] * $level['percentage']) / 100;

        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) 
        {
            return response()->json([
               'status'=>400,
                'errors'=> 'You do not have enough balance'
            ]);
        }
        else
        {
            $curl = curl_init();
            $url = "https://smartrecharge.ng/api/v2/datashare/";

            $get_array = array(
                'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
                'product_code' => $service['api_service_id'],
                'phone' => $request->phone,
            );

            // print_r($get_array);

            $curl_url = $url . "?" . http_build_query($get_array);

            curl_setopt_array($curl, array(
                CURLOPT_URL => $curl_url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
            ));

            $response =  curl_exec($curl);
            $result = json_decode($response, true);
            // print_r($result);
            
            if ($result['error_code'] === '1983') {
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user_id' => $user_id,
                    'category_id' => $product['category_id'],     
                    'product_id' => $product['id'],     
                    'service_id' => $service['id'],     
                    'amount' => $discountedAmount,     
                    'reference' => 'SUB'.rand(),     
                    'api_reference' => '',     
                    'description' => "₦".number_format($discountedAmount) ." ". $service['name'],     
                    'after_balance' => $afterBalance,
                    'status' => 'success',
                ]);
            }else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Something went wrong'
                ]);
            }
        }
    }

    public function bill(Request $request)
    {   
        $user_id=auth('sanctum')->user()->id;
        $user= User::find($user_id);  
        $user_level=auth('sanctum')->user()->level; 
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $discountedAmount = $service['price'] - ($service['price'] * $level['percentage']) / 100;
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) 
        {
            return response()->json([
               'status'=>400,
                'errors'=> 'You do not have enough balance'
            ]);
        }
        else
        {

            $curl = curl_init();
            $url = "https://smartrecharge.ng/api/v2/tv/";

            $get_array = array(
                'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
                'product_code' => $service['api_service_id'],
                'smartcard_number' => $request->smartcard_number,
            );

            // print_r($get_array);

            $curl_url = $url . "?" . http_build_query($get_array);

            curl_setopt_array($curl, array(
                CURLOPT_URL => $curl_url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
            ));

            $response =  curl_exec($curl);
            $result = json_decode($response, true);
            // print_r($result);
            
            if ($result['error_code'] === '1983') {
                
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user_id' => $user_id,
                    'category_id' => $product['category_id'],     
                    'product_id' => $product['id'],     
                    'service_id' => $service['id'],     
                    'amount' => $discountedAmount,     
                    'reference' => 'SUB'.rand(),     
                    'api_reference' => '',     
                    'description' => "₦".number_format($discountedAmount) ." ". $service['name']. " for ". $request->smartcard_number,
                    'after_balance' => $afterBalance,
                    'status' => 'success',
                ]);
            }else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Something went wrong'
                ]);
            }
        }

    }
    

    public function electricity(Request $request)
    {   
        $user_id=auth('sanctum')->user()->id;
        $user_level=auth('sanctum')->user()->level;
        $user= User::find($user_id);
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $discountedAmount = $request->input('amount') - ($request->input('amount') * $level['percentage']) / 100;
        $afterBalance = $user->balance - $discountedAmount;

        if ($afterBalance - $discountedAmount < 0) 
        {
            return response()->json([
               'status'=>400,
                'errors'=> 'You do not have enough balance'
            ]);
        }
        else
        {
            $curl = curl_init();
            $url = "https://smartrecharge.ng/api/v2/electric/";

            $get_array = array(
                'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
                'product_code' => $service['api_service_id'],
                'meter_number' => $request->meter_number,
                'amount' => $request->amount,
            );

            // print_r($get_array);

            $curl_url = $url . "?" . http_build_query($get_array);

            curl_setopt_array($curl, array(
                CURLOPT_URL => $curl_url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
            ));

            $response =  curl_exec($curl);
            $result = json_decode($response, true);
            // print_r($result);
            
            if ($result['error_code'] === '1983') {
                $my_purchaser = new PurchaseController;
                return $my_purchaser->purchaser([
                    'user_id' => $user_id,
                    'category_id' => $product['category_id'],     
                    'product_id' => $product['id'],     
                    'service_id' => null,     
                    'amount' => $discountedAmount,     
                    'reference' => 'SUB'.rand(),     
                    'api_reference' => '',     
                    'description' => "₦".number_format($discountedAmount) ." ". $product['name']. " for ". $request->meter_number,     
                    'after_balance' => $afterBalance,     
                    'status' => 'success',     
                ]);

            }else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Something went wrong'
                ]);
            }
        }
    }

    public function purchaser($request)
    {
         //Live transactions
        /* if ($result['text_status'] == 'VERIFICATION SUCCESSFUL') {
            return response()->json([
                'status'=>200,
                'name'=> $result['data']['name']
            ]);
        }else {
            return response()->json([
                'status'=>400,
                'errors'=> $result['server_message']
            ]);
        } */

        //Demo transactions
        $transaction=new Transactions();
        $transaction->user_id= $request['user_id'];
        $transaction->category_id = $request['category_id'];            
        $transaction->product_id= $request['product_id'];
        $transaction->service_id= $request['service_id'];
        $transaction->amount = $request['amount'];            
        $transaction->reference = $request['reference']; 
        $transaction->api_reference = $request['api_reference']; ;
        $transaction->description = $request['description'];
        $transaction->type = 'debit';

        $user= User::find($request['user_id']); 
        $user->balance = $request['after_balance'];

        if ($transaction->save() && $user->save() ) {
            return [
                'status'=>200,
                'message'=> 'Transaction successful',
            ];
        } else {
            return [
                'status'=>400,
                'errors'=> 'Unable to save transaction'
            ];
        }
    }
}
