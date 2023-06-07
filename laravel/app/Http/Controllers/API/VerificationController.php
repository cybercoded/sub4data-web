<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Levels;
use App\Models\Services;
use Illuminate\Http\Request;
use App\Models\User;


class VerificationController extends Controller
{
    //Verification of services
    public function smartnumber(Request $request)
    {   
        $service = Services::where('id', $request->service_id)->first();
        $curl = curl_init();
        $url = "https://smartrecharge.ng/api/v2/tv/";
        
        // print_r($service);
        $get_array = array(
            'api_key' => 'wfmmh34p7yz3b1oe1k0yx4m0gwny5a8t1xpljzoysi9u',
            'smartcard_number' => $request->smartcard_number,
            'product_code' => $service['api_service_id'],
            'task' => 'verify',
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

        if ($result['text_status'] == 'VERIFICATION SUCCESSFUL') {
            return response()->json([
                'status'=>200,
                'name'=> $result['data']['name']
            ]);
        }else {
            return response()->json([
                'status'=>400,
                'errors'=> $result['server_message']
            ]);
        }

    }

    public function meternumber(Request $request)
    {       
        $curl = curl_init();
        $url = "https://smartrecharge.ng/api/v2/electric/";

        $get_array = array(
            'api_key' => 'wfmmh34p7yz3b1oe1k0yx4m0gwny5a8t1xpljzoysi9u',
            'meter_number' => $request->meter_number,
            'product_code' => $request->product_code,
            'task' => 'verify',
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

        if ($result['text_status'] == 'VERIFICATION SUCCESSFUL') {
            return response()->json([
                'status'=>200,
                'name'=> $result['data']['name']
            ]);
        }else {
            return response()->json([
                'status'=>400,
                'errors'=> $result['server_message']
            ]);
        }

    }
}
