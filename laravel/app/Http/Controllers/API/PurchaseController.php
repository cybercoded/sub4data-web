<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Levels;
use App\Models\Product;
use App\Models\Services;
use App\Models\Transactions;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    //Processing all of my purchase requests

    public function airtime(Request $request)
    {       
        $curl = curl_init();
        $url = "https://smartrecharge.ng/api/v2/airtime/";

        $get_array = array(
            'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
            'product_code' => $request->product_id,
            'phone' => $request->phone,
            'amount' => $request->amount,
        );

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
        
        if ($result['error_code'] === '1983') {
            $transaction=new Transactions();
            $user_id=auth('sanctum')->user()->id;
            $user_level=auth('sanctum')->user()->level;
            $level = Levels::where('level', $user_level)->first();

            $product = Product::where('api_product_id', $request->input('product_id'))->first();
            $transaction->user_id= $user_id;

            $discountedAmount = $request->input('amount') - ($request->input('amount') * $level['percentage']) / 100;

            $transaction->category_id = $product['category_id'];            
            $transaction->product_id= $product['id'];
            $transaction->service_id= $request->input('service_id');
            $transaction->amount= $discountedAmount;
            $transaction->reference = 'SUB'.rand();
            $transaction->api_reference = '';

            $transaction->description = "₦".number_format($discountedAmount) ." ". $product['name'];
            
            if ($transaction->save()) {
            
                    return response()->json([
                        'status'=>200,
                        'message'=> 'Transaction successful',
                    ]);
            } else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Unable to save transaction'
                ]);
            }
        }else {
            return response()->json([
                'status'=>400,
                'errors'=> 'Something went wrong'
            ]);
        }
        


    }

    public function data(Request $request)
    {   
        $user_id=auth('sanctum')->user()->id;
        $user_level=auth('sanctum')->user()->level; 
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $discountedAmount = $service['price'] - ($service['price'] * $level['percentage']) / 100;


        $curl = curl_init();
        $url = "https://smartrecharge.ng/api/v2/datashare/";

        $get_array = array(
            'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
            'product_code' => $service['api_service_id'],
            'phone' => $request->phone,
        );

        print_r($get_array);

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
        
        if ($result['error_code'] === '1983') {
            $transaction=new Transactions();
            $transaction->user_id= $user_id;
            $transaction->category_id = $product['category_id'];            
            $transaction->product_id= $product['id'];
            $transaction->service_id= $service['id'];
            $transaction->amount = $discountedAmount;            
            $transaction->reference = 'SUB'.rand();
            $transaction->api_reference = '';

            $transaction->description = "₦".number_format($discountedAmount) ." ". $service['name'];
            
            if ($transaction->save()) {
            
                    return response()->json([
                        'status'=>200,
                        'message'=> 'Transaction successful',
                    ]);
            } else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Unable to save transaction'
                ]);
            }
        }else {
            return response()->json([
                'status'=>400,
                'errors'=> 'Something went wrong'
            ]);
        }
        


    }

    public function bill(Request $request)
    {   
        $user_id=auth('sanctum')->user()->id;
        $user_level=auth('sanctum')->user()->level; 
        $level = Levels::where('level', $user_level)->first();
        $product = Product::where('id', $request->input('product_id'))->first();
        $service = Services::where('id', $request->input('service_id'))->first();
        $discountedAmount = $service['price'] - ($service['price'] * $level['percentage']) / 100;


        $curl = curl_init();
        $url = "https://smartrecharge.ng/api/v2/datashare/";

        $get_array = array(
            'api_key' => '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1',
            'product_code' => $service['api_service_id'],
            'phone' => $request->phone,
        );

        print_r($get_array);

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
        
        if ($result['error_code'] === '1983') {
            $transaction=new Transactions();
            $transaction->user_id= $user_id;
            $transaction->category_id = $product['category_id'];            
            $transaction->product_id= $product['id'];
            $transaction->service_id= $service['id'];
            $transaction->amount = $discountedAmount;            
            $transaction->reference = 'SUB'.rand();
            $transaction->api_reference = '';

            $transaction->description = "₦".number_format($discountedAmount) ." ". $service['name'];
            
            if ($transaction->save()) {
            
                    return response()->json([
                        'status'=>200,
                        'message'=> 'Transaction successful',
                    ]);
            } else {
                return response()->json([
                    'status'=>400,
                    'errors'=> 'Unable to save transaction'
                ]);
            }
        }else {
            return response()->json([
                'status'=>400,
                'errors'=> 'Something went wrong'
            ]);
        }
        


    }
}
