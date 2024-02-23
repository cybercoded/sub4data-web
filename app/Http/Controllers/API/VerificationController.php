<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Api;
use App\Models\Levels;
use App\Models\Services;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Http;


class VerificationController extends Controller
{
    //Verification of services
    public function smartnumber(Request $request)
    {
        $service = Services::where('id', $request->service_id)->first();

        $api = Api::where('api_name', 'smartrecharge')->first();
        $response = Http::get($api['api_url'].'/tv', [
            'api_key' => $api['api_key'],
            'smartcard_number' => $request->smartcard_number,
            'product_code' => $service['api_service_id'],
            'task' => 'verify'
        ]);

        $result = $response->json();

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
        $service = Services::where('id', $request->service_id)->first();

        $api = Api::where('api_name', 'smartrecharge')->first();
        $response = Http::get($api['api_url'].'/electric', [
            'api_key' => $api['api_key'],
            'meter_number' => $request->meter_number,
            'product_code' => $service['api_service_id'],
            'task' => 'verify'
        ]);

        $result = $response->json();

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
