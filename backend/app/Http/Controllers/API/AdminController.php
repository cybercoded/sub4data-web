<?php

namespace App\Http\Controllers\API;

use App\Mail\BulkMail;
use App\Models\Activities;
use App\Models\Messages;
use App\Models\Transactions;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Mail;
use Validator;
use App\Http\Controllers\Controller;

class AdminController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     */

    public function index(Request $request)
    {
        $users_count = User::count();
        $users_balance = User::sum('balance');
        $failed_transactions = Transactions::where('status', '!=', 'success')->count();

        return response()->json([
            'users_count' => $users_count,
            'users_balance' => $users_balance,
            'unsuccessful_transactions' => $failed_transactions
        ]);

    }
    public function bulkEmail(Request $request)
    {
        //
        $validator = Validator::make($request->all(), [
            'title' =>'required|max:255',
            'message' =>'required|max:3000'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        }

        $email_body = [
            'name' => 'Customer name',
            'title' => $request->title,
            'message' => $request->message
        ];

        $users = User::all();

        foreach ($users as $user) {

            $email_body['name'] = $user->name;

            Mail::to($user['email'])
            ->send(new BulkMail($request->input('title'), $email_body));
        }

        $send_message = Messages::create([
            'user_id' => Auth::user()->id,
            'title' => $request->title,
            'body' =>$request->message
        ]);
        
        if ($send_message) {
            return response()->json([
            'status' => 200,
            'message' => 'Message successfully sent to all users',
            ]);
        }
    }

    public function purchaser()
    {
        $this->info('Hello world from controller!');
    }
}
