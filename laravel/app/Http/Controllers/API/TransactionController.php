<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Transactions;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    //Transaction Controller
    public function index()
    {
        $transactions = Transactions::all()->take(10);
        return response()->json([
            'status' => 200,
            'data' => $transactions
        ]);
    }
}
