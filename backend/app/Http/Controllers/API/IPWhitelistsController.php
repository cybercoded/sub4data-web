<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\IPWhitelists;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class IPWhitelistsController extends Controller
{
    public function index()
    {
        $whitelists = IPWhitelists::join(
            'users', 'users.id', '=', 'ip_whitelists.user_id')
            ->select('users.name',  'ip_whitelists.id', 'ip_whitelists.ip')
        ->get();
        
        if (count($whitelists) == 0) {
            return response()->json([
                'status'=> 404,
                'errors'=> 'No IP was ever whitelisted'
            ]);
        }

        return response()->json([
            'status' => 200,
            'whitelists' => $whitelists
        ]);
    }

    public function get($id)
    {
        $whitelists = IPWhitelists::find( $id )->select('id')
            ->join('users', 'users.id', 'ip_whitelists.user_id')
            ->select('users.email', 'ip_whitelists.status', 'ip_whitelists.ip')
        ->first();

        if (!$whitelists) {
            return response()->json([
                'status'=> 404,
                'errors'=> 'This IP was not whitelisted'
            ]);
        }

        return response()->json([
            'status' => 200,
            'whitelist' => $whitelists
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'ip' => 'required|unique:ip_whitelists,ip',
            'email'=>'required|email|max:191|exists:users,email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }

        $user_id = User::where('email', $request->email)->first()->id;

        $ipWhitelists = IPWhitelists::create([
            'user_id'=> $user_id,
            'ip' => $request->ip
        ]);           

        if ($ipWhitelists) {
            return response()->json([
                'status' => 200,
                'message' => "IP whitelisted successfully"
            ]);
        }

    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'ip' => 'required|ip',
            'status' => 'boolean|required',
            'email'=>'required|email|max:191|exists:users,email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }
        $IPWhitelists = IPWhitelists::where('id', $id);

        $updateIPWhitelists = $IPWhitelists->update([
            'ip' => $request->ip,
            'status' => $request->status == true ? 1 : 0
        ]);

        if ($updateIPWhitelists) {
            return response()->json([
                'status' => 200,
                'message' => "IP whitelist updated successfully"
            ]);
        }

    }
}
