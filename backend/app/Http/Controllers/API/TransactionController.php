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
        $transactions = Transactions::orderByDesc('id')->take(10)->get();
        
        return response()->json([
            'status' => 200,
            'data' => $transactions
        ]);
    }

    public function get(Request $request)
    {
        $numberOfRows = 10;
        $transactions = Transactions::where('user_id', '=',  auth()->user()?->id ?: $request->user->id)
            ->skip($request->limit-$numberOfRows)
            ->take($numberOfRows)
            ->orderByDesc('id')
            ->get();
        if(count($transactions) == 0) {
            return response()->json([
                'status' => 402,
                'errors' => 'No more transactions'
            ]);
        }

        return response()->json([
            'status' => 200,
            'data' => $transactions
        ]);
    }

    public function filter(Request $request)
    {
        $transactions = Transactions::query()
        ->where('user_id', '=', auth()->user()?->id ?: $request->user->id)
        ->when($request->input('from'), fn ($query, $from) => $query->where('created_at', '>=', $from))
        ->when($request->input('to'), fn ($query, $to) => $query->where('created_at', '<=', $to))
        ->when($request->input('status'), fn ($query, $status) => $query->where('status', '=', $status))
        ->when($request->input('type'), fn ($query, $type) => $query->where('type', '=', $type))
        ->when($request->input('product_id'), fn ($query, $product_id) => $query->where('product_id', '=', $product_id))
        ->when($request->input('service_id'), fn ($query, $service_id) => $query->where('service_id', '=', $service_id))
        ->when($request->input('search'), fn ($query, $search) => $query->where('reference', '=', $search))
        ->when($request->input('search'), fn ($query, $search) => $query->orWhere('description', 'like', '%'. $search .'%'))
        ->when($request->input('limit'), fn ($query, $limit) => $query->take($limit))
        ->orderBy('id', 'desc')
        ->get();


        if (count ($transactions) > 0) {
            return response()->json([
                'status' => 200,
                'data' => $transactions
            ]);
        } else {
            return response()->json([
               'status' => 422,
                'errors' => 'No transactions found for your filter'
            ]);
        }
    }

    public function adminFilter(Request $request)
    {
        $transactions = Transactions::query()
        ->when($request->input('user_id'), fn ($query, $user_id) => $query->where('user_id', '=', $user_id))
        ->when($request->input('from'), fn ($query, $from) => $query->where('created_at', '>=', $from))
        ->when($request->input('to'), fn ($query, $to) => $query->where('created_at', '<=', $to))
        ->when($request->input('status'), fn ($query, $status) => $query->where('status', '=', $status))
        ->when($request->input('type'), fn ($query, $type) => $query->where('type', '=', $type))
        ->when($request->input('product_id'), fn ($query, $product_id) => $query->where('product_id', '=', $product_id))
        ->when($request->input('service_id'), fn ($query, $service_id) => $query->where('service_id', '=', $service_id))
        ->when($request->input('search'), fn ($query, $search) => $query->where('reference', '=', $search))
        ->when($request->input('search'), fn ($query, $search) => $query->orWhere('description', 'like', '%'. $search .'%'))
        ->when($request->input('limit'), fn ($query, $limit) => $query->take($limit))
        ->orderBy('id', 'desc')
        ->get();


        if (count ($transactions) > 0) {
            return response()->json([
                'status' => 200,
                'data' => $transactions
            ]);
        } else {
            return response()->json([
               'status' => 422,
                'errors' => 'No transactions found for your filter'
            ]);
        }
    }
}
