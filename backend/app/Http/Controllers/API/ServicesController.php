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
            'services' => $service
        ]);
    }

    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'product_id' => 'required|integer',
            'price' => 'required|string',
            'api_service_id' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ]);
        } else {


            if (Services::where('api_service_id', $request->input('api_service_id'))->exists()) {
                return response()->json([
                    'status' => 409,
                    'message' => $request->input('api_service_id') . ' already in services'
                ]);
            } else {

                $service = new Services();
                $service->product_id = $request->input('product_id');
                $service->name = $request->input('name');
                $service->description = $request->input('description');
                $service->api_service_id = $request->input('api_service_id');
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
            'api_service_id' => 'required|string'
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
            $service->api_service_id = $request->input('api_service_id');
            $service->price = $request->input('price');
            $service->status = $request->input('status') == true ? 1 : 0;
            $service->update();

            return response()->json([
                'status' => 200,
                'message' => "Service added successfully",
            ]);
        }

    }

    public function get($id)
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
        $services = Services::where('product_id', $id)->orderBy('price')->get();

        $user_id=auth('sanctum')->user()->id;
        $user_level = User::where('id', $user_id)->first()->level;
        $percentage = Levels::where('level', $user_level)->first()->percentage;

        $my_services = [];
        foreach ($services as $service) {
            $discounted_price = $service->price - ($service->price * $percentage) / 100;

            $my_services[] = array(
                'id' => $service->id,
                'product_id' => $service->product_id,
                'name' => "$service->name = ₦".number_format($discounted_price, 2),
                'description' => $service->description,
                'price' => $discounted_price,
                'amount' => "₦".number_format($discounted_price, 2),
                'api_service_id' => $service->api_service_id,
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
                'message'=>'No services found for this particular product'
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
