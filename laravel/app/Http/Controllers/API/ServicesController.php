<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Levels;
use App\Models\Services;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class ServicesController extends Controller
{
    //
    public function index()
    {
        $service = Services::all();
        return response()->json([
            'status' => 200,
            'service' => $service
        ]);
    }

    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'product_id' => 'required|integer',
            'price' => 'required|string',
            'api_servie_id' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {


            if (Services::where('api_servie_id', $request->input('api_servie_id'))->exists()) {
                return response()->json([
                    'status' => 409,
                    'message' => $request->input('api_servie_id') . ' already in services'
                ]);
            } else {

                $service = new Services();
                $service->product_id = $request->input('product_id');
                $service->name = $request->input('name');
                $service->description = $request->input('description');
                $service->api_servie_id = $request->input('api_servie_id');
                $service->price = $request->input('price');
                $service->status = $request->input('status') == true ? 1 : 0;
                $service->save();

                return response()->json([
                    'status' => 200,
                    'message' => "Service added successfully",
                ]);
            }
        }


    }

    public function update(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'product_id' => 'required|integer',
            'price' => 'required|string',
            'api_servie_id' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {
            $service = Services::find($id);
            $service->product_id = $request->input('product_id');
            $service->name = $request->input('name');
            $service->description = $request->input('description');
            $service->api_servie_id = $request->input('api_servie_id');
            $service->price = $request->input('price');
            $service->status = $request->input('status') == true ? 1 : 0;
            $service->update();

            return response()->json([
                'status' => 200,
                'message' => "Service added successfully",
            ]);
        }

    }

    public function edit($id)
    {
        $service = Services::find($id);

        if ($service) {

            return response()->json([
                'status' => 200,
                'service' => $service
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'No service found'
            ]);
        }
    }

    public function view($id)
    {
        $services = Services::where('product_id', $id)->get();

        $user_id=auth('sanctum')->user()->id;        
        $user_level = User::where('id', $user_id)->first()->level;
        $user_discount = Levels::where('level', $user_level)->first()->percentage;
        
        $my_services = [];
        foreach ($services as $service) {
            $discounted_price = $user_discount * $service->price / 100;
            
            $my_services[] = array(
                'id' => $service->id,
                'product_id' => $service->product_id,
                'name' => "$service->name = ₦".number_format($discounted_price, 2),
                'description' => $service->description,
                'price' => $discounted_price,
                'amount' => "₦".number_format($discounted_price, 2),
                'api_servie_id' => $service->api_servie_id,
                'status' => $service->status
            );
        }

        if($my_services)
        {            
            return response()->json([
                'status'=>200,
                'services'=>$my_services
            ]);
        }
        else
        {
            return response()->json([
                'status'=>404,
                'message'=>'No product found'
            ]);
        }
    }

    public function destory($id)
    {
        $service = Services::find($id);

        if ($service) {
            $service->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Service deleted successfully'
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'Service not found'
            ]);
        }
    }
}