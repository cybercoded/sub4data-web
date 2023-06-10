<?php

namespace App\Http\Controllers;

use App\Mail\BulkMail;
use App\Models\Activities;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Mail;
use Validator;

class AdminController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     */
    public function bulkEmail(Request $request)
    {
        //
        $validator = Validator::make($request->all(), [
            'type' => 'required',
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
            'title' => $request->input('title'),
            'message' =>$request->message
        ];

        $users = User::all();

        foreach ($users as $user) {

            $email_body['name'] = $user->name;

            Mail::to($user['email'])
            ->send(new BulkMail($request->input('title'), $email_body));
        }

        $email_body['name'] = 'Customer name';
        Activities::create([
            'type' => $request->type,
            'title' => $request->title,
            'log' => serialize($email_body)
        ]);

        return response()->json([
           'status' => 200,
           'message' => 'Message successfully sent to all users',
        ]);
    }
}
