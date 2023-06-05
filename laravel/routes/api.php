<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\OrderController;
use App\Http\Controllers\API\PinController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\ServicesController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\VerificationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register',[AuthController::class,'register']);

Route::post('login',[AuthController::class,'login']);

Route::middleware(['auth:sanctum','isAPIAdmin'])->group(function(){

    Route::get('/checkingAuthenticated',function(){
        return response()->json(["message"=>"You are in", 'status'=>200],200);
    });

    Route::post('store-category',[CategoryController::class,'store']);

    Route::get('view-category',[CategoryController::class,'index']);

    Route::get('edit-category/{id}',[CategoryController::class,'edit']);

    Route::post('update-category/{id}',[CategoryController::class,'update']);

    Route::delete('delete-category/{id}',[CategoryController::class,'destory']);

    Route::get('all-category',[CategoryController::class,'allCategory']);

    //Products
    Route::post('store-product', [ProductController::class,'store']);

    Route::get('view-product', [ProductController::class,'index']);

    Route::get('edit-product/{id}',[ProductController::class,'edit']);

    Route::post('update-product/{id}',[ProductController::class,'update']);

    Route::delete('delete-product/{id}',[ProductController::class,'destory']);

    //Services
    Route::get('view-services',[ServicesController::class,'index']);

    Route::post('store-services',[ServicesController::class,'store']);

    Route::get('edit-services/{id}',[ServicesController::class,'edit']);

    Route::put('update-services/{id}',[ServicesController::class,'update']);

    Route::delete('delete-services/{id}',[ServicesController::class,'destory']);

    //Orders
    Route::get('admin/orders',[OrderController::class,'index']);
});

Route::middleware(['auth:sanctum'])->group(function(){

    Route::post('logout',[AuthController::class,'logout']);

    Route::get('view-category',[CategoryController::class,'index']);

    Route::get('view-product/{id}', [ProductController::class,'view']);

    Route::get('view-services/{id}', [ServicesController::class,'view']);

    Route::get('verify-pin/{pin}', [PinController::class,'verify']);

    Route::put('update-pin', [PinController::class,'update']);

    Route::post('smartcard-verification', [VerificationController::class,'smartnumber']);

    Route::post('meternumber-verification', [VerificationController::class,'meternumber']);

    Route::post('update-user', [UserController::class,'update']);

    Route::put('update-password', [UserController::class,'updatePassword']);

    Route::get('verify-password/{password}', [UserController::class,'verifyPassword']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
