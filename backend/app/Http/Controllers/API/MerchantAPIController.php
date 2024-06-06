<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\MerchantAPI;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use phpseclib3\Crypt\RSA;

class MerchantAPIController extends Controller
{
    //
    public function index()
    {
        $merchantAPIs = MerchantAPI::join(
            'users', 'users.id', '=', 'merchant_api.user_id')
            ->select('users.name', 'merchant_api.public_key')
        ->get();
        
        if (count($merchantAPIs) == 0) {
            return response()->json([
                'status'=> 404,
                'errors'=> 'No Merchant API was ever created'
            ]);
        }

        return response()->json([
            'status' => 200,
            'merchant_apis' => $merchantAPIs
        ]);
    }

    public function get($id)
    {
        $merchantAPIs = MerchantAPI::find( $id )->select('id')
            ->join('users', 'users.id', 'merchant_api.user_id')
            ->select('users.name',  'merchant_api.private_key', 'merchant_api.public_key')
        ->first();

        if (!$merchantAPIs) {
            return response()->json([
                'status'=> 404,
                'errors'=> 'No merchant is associated to this ID'
            ]);
        }

        return response()->json([
            'status' => 200,
            'merchant_apis' => $merchantAPIs
        ]);
    }

    public function view()
    {
        $user_id = Auth::user()->id;
        $merchantAPIs = MerchantAPI::find( $user_id )->select('id')
            ->join('users', 'users.id', 'merchant_api.user_id')
            ->select('users.name',  'merchant_api.private_key', 'merchant_api.public_key')
            ->orderBy('merchant_api.created_at', 'desc')
        ->first();

        if (!$merchantAPIs) {
            return response()->json([
                'status'=> 404,
                'errors'=> 'No merchant is associated to this ID'
            ]);
        }

        return response()->json([
            'status' => 200,
            'merchant_apis' => $merchantAPIs
        ]);
    }

    public function store(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
    
        // Generate a new private (and public) key pair using phpseclib
        $rsa = RSA::createKey(1024);
        $private_key = $rsa->toString('PKCS8');
        $public_key = $rsa->getPublicKey()->toString('PKCS8');
    
        // Save the keys to the database
        $merchant_api = MerchantAPI::create([
            'user_id' => $user_id,
            'private_key' => $private_key,
            'public_key' => $public_key,
        ]);
    
        if ($merchant_api) {
            return response()->json([
                'status' => 200,
                'message' => "Merchant API created successfully"
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'message' => "Failed to create Merchant API"
            ], 500);
        }
    }
}
