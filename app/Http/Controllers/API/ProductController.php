<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
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
            'api_product_id'=>'required|string'
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
            $product->discount= $request->input('discount');
            $product->charges= $request->input('charges');
            $status = $request->input('status') == 'true' ? 1 : 0;
            $product->status= $status;


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
            'api_product_id'=>'required|string'
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
                $product->discount= $request->input('discount');
                $product->charges= $request->input('charges');
                $status = $request->input('status') == 'true' ? 1 : 0;
                $product->status= $status;

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
                    'message'=>"Product updated successfully",
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
        $products=Product::where('category_id', $id)->where('status', 1)->get();

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

    public function viewWithSlug($slug)
    {
        $category = Category::where('slug', $slug)->first();
        $products=Product::where('category_id', $category->id)->where('status', 1)->get();

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
