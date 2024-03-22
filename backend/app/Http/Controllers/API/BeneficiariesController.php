<?php

namespace App\Http\Controllers\API;

use App\Models\Beneficiaries;
use App\Models\Category;
use App\Http\Controllers\Controller;


class BeneficiariesController extends Controller
{

    public function get($slug)
    {
        // fetch beneficiaries for a user
        $user_id = auth('sanctum')->user()->id;
        $category = Category::where('slug', $slug)->first();

        if(!$category) {
            return response()->json([
                'status' => 422,
                'errors' => 'No beneficiaries found for this user'
            ]);
        }

        $beneficiaries = Beneficiaries::where('user_id', $user_id)
        ->where('category_id', $category->id)
        ->get();

        if(!$beneficiaries) {
            return response()->json([
                'status' => 422,
                'errors' => 'No beneficiaries found for this user'
            ]);
        }

        return response()->json([
            'status' => 200,
            'beneficiaries' => $beneficiaries
        ]);

    }

    public function delete($id, $slug)
    {
        $beneficiary = Beneficiaries::where('id', $id)->first();
        if (!$beneficiary) {
            return response()->json([
                'status' => 422,
                'errors' => 'No beneficiary found for this id'
            ]);
        }

       $beneficiary->delete();

        $my_purchaser = new BeneficiariesController;
        return $my_purchaser->get($slug);
    }
}
