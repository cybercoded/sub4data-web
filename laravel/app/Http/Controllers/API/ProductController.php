<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function index(){
        $product=Product::all();
        return response()->json([
            'status'=>200,
            'product'=>$product
        ]);
    }
    public function store(Request $request){

        $validator=Validator::make($request->all(),[
            'name'=>'required|string',
            'category_id'=>'required|integer',
            'api_product_id'=>'required|string',
            'meta_title'=>'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>422,
                'errors'=>$validator->errors(),
            ]);
        }else{
            $product=new Product();
            $product->category_id= $request->input('category_id');
            $product->api_product_id= $request->input('api_product_id');
            $product->name= $request->input('name');
            $product->description= $request->input('description');
            $product->meta_title= $request->input('meta_title');
            $product->meta_keyword= $request->input('meta_keyword');
            $product->meta_description= $request->input('meta_description');
            $product->status= $request->input('status') ==true? 1:0;


            if($request->hasFile('image')){
                $file=$request->file('image');
                $extenstion=$file->getClientOriginalExtension();
                $fileName=time().'.'.$extenstion;
                $path='uploads/products/';
                $file->move($path,$fileName);
                $product->image=$path.$fileName;
            }

            $product->save();
            return response()->json([
                'status'=>200,
                'message'=>"Product added successfully",
            ]);
        }


    }

    public function update(Request $request, $id)
    {
        $validator=Validator::make($request->all(),[
            'category_id'=>'required|integer',
            'name'=>'required|string',
            'api_product_id'=>'required|string',
            'meta_title'=>'required',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>422,
                'errors'=>$validator->errors(),
            ]);
        }else{
            $product= Product::find($id);
            if($product)
            {
                $product->category_id= $request->input('category_id');
                $product->api_product_id= $request->input('api_product_id');
                $product->name= $request->input('name');
                $product->description= $request->input('description');
                $product->meta_title= $request->input('meta_title');
                $product->meta_keyword= $request->input('meta_keyword');
                $product->meta_description= $request->input('meta_description');
                $product->status= $request->input('status') ==true? 1:0;


                if($request->hasFile('image')){
                    $path=$product->image;
                    if(File::exists($path))
                    {
                        File::delete($path);
                    }
                    $file=$request->file('image');
                    $extenstion=$file->getClientOriginalExtension();
                    $fileName=time().'.'.$extenstion;
                    $new_path='uploads/products/';
                    $file->move($new_path,$fileName);
                    $product->image=$new_path.$fileName;
                }

                $product->update();
                return response()->json([
                    'status'=>200,
                    'message'=>"Product updates successfully",
                ]);
            }
            else
            {
                return response()->json([
                    'status'=>404,
                    'message'=>"Product not found",
                ]);
            }
        }
    }

    public function edit($id)
    {
        $product= Product::find($id);

        if($product)
        {

            return response()->json([
                'status'=>200,
                'product'=>$product
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

    public function view($id)
    {
        $products=Product::where('category_id', $id)->get();

        if($products)
        {
            return response()->json([
                'status'=>200,
                'product'=>$products
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
        $product = Product::find($id);

        if ($product) {
            $product->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Product deleted successfully'
            ]);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'Product not found'
            ]);
        }
    }
}
