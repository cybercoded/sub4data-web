<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\DiscountsResource;
use App\Http\Resources\DiscountsResourceCollection;
use App\Models\Discounts;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class DiscountsController extends Controller
{
    //

    public function index()
    {
        $discounts = Discounts::orderBy('id', 'desc')->get();
        return response()->json([
            'status' => 200,
            'discounts' => new DiscountsResourceCollection($discounts)
        ]);
    }

    public function get(Request $request)
    {
        $discounts = Discounts::orderBy('id', 'desc')->get();
        if(!$request->all) {
            $discounts = Discounts::query()
                ->where('used', $request->used)
                ->orWhere('status', $request->status)
                ->orderBy('id', 'desc')
            ->get();
        }
        
        return response()->json([
            'status' => 200,
            'discounts' => new DiscountsResourceCollection($discounts)
        ]);
    }

    public function verify($code)
    {
        $discount = Discounts::where('code', $code)->first();
        if(!$discount) {
            return response()->json([
                'status' => 200,
                'message' => "Invalid discount code"
            ]);
        }
        if($discount->used == 1) {
            return response()->json([
                'status' => 200,
                'message' => "This code has been used"
            ]);
        }
        if($discount->used == 1 && $discount->used_by_id == Auth::id()) {
            return response()->json([
                'status' => 200,
                'message' => "You have already used this code"
            ]);
        }
        if($discount->status == 0) {
            return response()->json([
                'status' => 200,
                'message' => "This code is no longer active"
            ]);
        }
        
        return response()->json([
            'status' => 200,
            'message' => "You received a discount of ".$discount->percentage. " %",
            'percentage' => $discount->percentage
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'percentage' => 'required|numeric|min:1|max:100'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }

        $created_for_id = "all";
        if ($request->all_user === false) {
            $user = User::where('email', $request->discount_to_user_email)->first();

            if(!$user) {
                return response()->json([
                    'status' => 400,
                    'errors' => "No user associated with the email provided"
                ]);
            }
            $created_for_id = $user->id;
        }
        
        $code = "SUB".mt_rand(10000, 99999);
        $ifCodeExist = Discounts::where('code', $code)->first();
        if($ifCodeExist) {
            return response()->json([
                'status' => 400,
                'errors' => "The code must be unique, please generate a new code"
            ]);
        }

        $new_discount = Discounts::create([
            'created_by_id' => Auth::id(),
            'created_for_id' => $created_for_id,
            'percentage' => $request->percentage,
            'code' => $code
        ]);

        if ($new_discount) {
            return response()->json([
                'status' => 200,
                'message' => "Discount created successfully"
            ]);
        }
    }

    public function update($id)
    {
        if (!$id) {
            return response()->json([
                'status' => 400,
                'errors' => "No discount ID provided"
            ]);
        }
        $discount = Discounts::where('id', $id)->first();

        if(!$discount) {
            return response()->json([
                'status' => 400,
                'errors' => "No discount is associated with ID provided"
            ]);
        }

        $updateDiscount = $discount->update([
            'status' => $discount->status == 1 ? 0 : 1
        ]);

        if ($updateDiscount) {
            return response()->json([
                'status' => 200,
                'message' => "Discount updated successfully"
            ]);
        }

    }
}
