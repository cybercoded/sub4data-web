<?php

namespace App\Http\Controllers\API;

use App\Models\Api;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;

class ApisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     */
    public function index()
    {
        $apis = Api::all();
        return response()->json([
            'status' => 200,
            'apis' => $apis
        ]);
    }

    public function get($id)
    {
        $api = Api::where('id', $id)->first();
        if (!$api) {
            return response()->json([
               'status' => 404,
               'errors' => 'Level not found.'
            ]);
        }
        return response()->json([
            'status' => 200,
            'api' => $api
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'api_name' => 'string|required|unique:api,api_name',
            'api_contract_code' => 'string|required',
            'api_key' => 'string|required',
            'api_payment_charges' => 'string|required',
            'api_secret' => 'string|required',
            'api_url' => 'string|required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }

        $new_api = Api::create([
           'api_contract_code' => $request->api_contract_code,
           'api_key' => $request->api_key,
           'api_name' => $request->api_name,
           'api_payment_charges' => $request->api_payment_charges,
           'api_secret' => $request->api_secret,
           'api_url' => $request->api_url
        ]);

        if ($new_api) {
            return response()->json([
                'status' => 200,
                'message' => "Api added successfully"
            ]);
        }


    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'api_name' => 'string|required|unique:api,api_name',
            'api_contract_code' => 'string|required',
            'api_key' => 'string|required',
            'api_payment_charges' => 'string|required',
            'api_secret' => 'string|required',
            'api_url' => 'string|required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }

        $updated_api = Api::where('id', $id)->update([
           'api_contract_code' => $request->api_contract_code,
           'api_key' => $request->api_key,
           'api_name' => $request->api_name,
           'api_payment_charges' => $request->api_payment_charges,
           'api_secret' => $request->api_secret,
           'api_url' => $request->api_url
        ]);

        if ($updated_api) {
            return response()->json([
                'status' => 200,
                'message' => "Api updated successfully"
            ]);
        }
    }

    public function delete($id) {
        $api = Api::where('id', $id)->first();
        if (!$api) {
            return response()->json([
              'status' => 404,
               'errors' => 'Api not found.'
            ]);
        }
        $api->delete();
        return response()->json([
           'status' => 200,
           'message' => 'Api deleted successfully'
        ]);
    }
}
