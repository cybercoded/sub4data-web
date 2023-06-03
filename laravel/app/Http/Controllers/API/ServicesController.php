<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Services;
use Illuminate\Http\Request;

class ServicesController extends Controller
{
    //
    public function index(){
        $service=Services::all();
        return response()->json([
            'status'=>200,
            'service'=>$service
        ]);
    }
}
