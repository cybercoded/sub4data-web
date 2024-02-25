<?php

use App\Http\Controllers\API\AdminController;
use App\Http\Controllers\API\ActivityController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\PinController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\PurchaseController;
use App\Http\Controllers\API\ServicesController;
use App\Http\Controllers\API\TransactionController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\VerificationController;
use App\Http\Controllers\API\ApisController;
use App\Http\Controllers\API\BackupController;
use App\Http\Controllers\API\BeneficiariesController;
use App\Http\Controllers\API\LevelController;
use App\Http\Controllers\API\MonnifyController;
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


Route::post('login', [AuthController::class, 'login']);

Route::post('register', [AuthController::class, 'register']);

Route::get('verify-user-email/{email}', [UserController::class, 'adminVerifyEmail']);

Route::put('password-reset', [UserController::class, 'resetPassword']);

Route::put('send-otp', [AuthController::class, 'sendOTP']);

Route::put('resend-otp', [AuthController::class, 'resendOTP']);

Route::put('verify-otp-and-reset', [UserController::class, 'verifyOtpAndResetPassword']);

Route::put('verify-registration-otp', [UserController::class, 'verifyRegistrationOtp']);

Route::get('verify-monnify-merchant-payment', [MonnifyController::class, 'verifyPay']);

Route::get('verify-monnify-atm-payment', [MonnifyController::class, 'verifyAtmPayment']);

Route::middleware('isTokenVerified')->prefix('v1')->group(function () {
    //user
    Route::get('get-user', [UserController::class, 'view']);

    Route::post('update-user', [UserController::class, 'userUpdate']);

    Route::put('update-password', [UserController::class, 'updatePassword']);

    Route::get('verify-password/{password}', [UserController::class, 'verifyPassword']);

    Route::get('verify-email/{email}', [UserController::class, 'adminVerifyEmail']);

    Route::put('transfer-fund', [UserController::class, 'adminCreditUser']);

    Route::post('create-automated-banks', [UserController::class, 'createAutomatedBanks']);


    //Products

    Route::get('view-product/{slug}', [ProductController::class, 'viewWithSlug']);

    Route::get('view-product', [ProductController::class, 'index']);

    //Services
    Route::get('view-services/{id}', [ServicesController::class, 'view']);


    //Verifications
    Route::post('meternumber-verification', [VerificationController::class, 'meternumber']);

    Route::post('smartcard-verification', [VerificationController::class, 'smartnumber']);

    //Pins
    Route::put('update-pin', [PinController::class, 'update']);

    Route::get('reset-pin', [PinController::class, 'resetPin']);

    Route::get('verify-pin/{pin}', [PinController::class, 'verify']);

    Route::get('verify-otp-for-pin/{pin}', [PinController::class, 'verifyOtpForPin']);

    //Transactions
    Route::post('filter-transactions', [TransactionController::class, 'filter']);

    Route::get('view-transactions/{limit}', [TransactionController::class, 'get']);

    //Payment
    Route::post('merchant-pay', [MonnifyController::class, 'initializePay']);

    //Levels
    Route::get('view-levels', [LevelController::class, 'index']);

    Route::post('upgrade-user', [UserController::class, 'userUpgrade']);

    //Purchases
    Route::post('airtime-purchase', [PurchaseController::class, 'airtime']);

    Route::post('data-purchase', [PurchaseController::class, 'data']);

    Route::post('bill-purchase', [PurchaseController::class, 'bill']);

    Route::post('electricity-purchase', [PurchaseController::class, 'electricity']);

    //Beneficiaries
    Route::get('get-beneficiaries/{slug}', [BeneficiariesController::class, 'get']);

    Route::delete('delete-beneficiary/{id}/{slug}', [BeneficiariesController::class, 'delete']);

});

Route::middleware(['auth:sanctum', 'isAPIAdmin'])->group(function () {

    Route::get('/checkingAuthenticated', function () {
        return response()->json(["message" => "You are in", 'status' => 200], 200);
    });

    //Categories
    Route::post('store-category', [CategoryController::class, 'store']);

    Route::get('view-category', [CategoryController::class, 'index']);

    Route::get('edit-category/{id}', [CategoryController::class, 'edit']);

    Route::post('update-category/{id}', [CategoryController::class, 'update']);

    Route::delete('delete-category/{id}', [CategoryController::class, 'destory']);

    Route::get('all-category', [CategoryController::class, 'allCategory']);

    //Products
    Route::post('store-product', [ProductController::class, 'store']);

    Route::get('view-product', [ProductController::class, 'index']);

    Route::get('view-product/{id}', [ProductController::class, 'view']);

    Route::get('edit-product/{id}', [ProductController::class, 'edit']);

    Route::post('update-product/{id}', [ProductController::class, 'update']);

    Route::delete('delete-product/{id}', [ProductController::class, 'destory']);

    //Services
    Route::get('view-services', [ServicesController::class, 'index']);

    Route::get('view-services/{id}', [ServicesController::class, 'view']);

    Route::post('store-services', [ServicesController::class, 'store']);

    Route::get('edit-services/{id}', [ServicesController::class, 'edit']);

    Route::put('update-services/{id}', [ServicesController::class, 'update']);

    Route::delete('delete-services/{id}', [ServicesController::class, 'destory']);

    //Users
    Route::get('view-users', [UserController::class, 'index']);

    Route::post('view-users', [UserController::class, 'index']);

    Route::get('get-user/{id}', [UserController::class, 'edit']);

    Route::post('update-user/{id}', [UserController::class, 'adminUpdate']);

    Route::get('verify-email/{email}', [UserController::class, 'adminVerifyEmail']);

    Route::put('credit-user', [UserController::class, 'adminCreditUser']);

    //Transactions
    Route::get('view-transactions-admin', [TransactionController::class, 'index']);

    Route::post('filter-transactions-admin', [TransactionController::class, 'adminFilter']);

    Route::post('filter-users', [UserController::class, 'usersFilter']);

    Route::post('send-bulk-email', [AdminController::class, 'bulkEmail']);

    Route::get('get-activities', [ActivityController::class, 'index']);

    Route::post('filter-activities', [ActivityController::class, 'filter']);

    //Levels
    Route::get('view-levels', [LevelController::class, 'index']);
    Route::get('get-level/{id}', [LevelController::class, 'get']);
    Route::post('update-level/{id}', [LevelController::class, 'update']);
    Route::post('store-level', [LevelController::class, 'store']);
    Route::delete('delete-level/{id}', [LevelController::class, 'delete']);

    //Apis
    Route::get('view-apis', [ApisController::class, 'index']);
    Route::get('get-api/{id}', [ApisController::class, 'get']);
    Route::post('update-api/{id}', [ApisController::class, 'update']);
    Route::post('store-api', [ApisController::class, 'store']);
    Route::delete('delete-api/{id}', [ApisController::class, 'delete']);

    //Dashboard
    Route::get('get-panel-value-admin', [AdminController::class, 'index']);

    //Backups
    Route::get('database-backup', [BackupController::class, 'backup']);

});

Route::middleware(['auth:sanctum'])->group(function () {

    //Categories
    Route::get('view-category', [CategoryController::class, 'index']);

    //Products
    Route::get('view-product/{id}', [ProductController::class, 'view']);

    Route::get('view-product', [ProductController::class, 'index']);

    //Services
    Route::get('view-services/{id}', [ServicesController::class, 'view']);

    //Transaction Pins
    Route::get('verify-pin/{pin}', [PinController::class, 'verify']);

    Route::put('update-pin', [PinController::class, 'update']);

    Route::get('reset-pin', [PinController::class, 'resetPin']);

    Route::put('verify-otp-and-reset-pin', [PinController::class, 'verifyOtpAndResetPin']);

    //API Verifications
    Route::post('smartcard-verification', [VerificationController::class, 'smartnumber']);

    Route::post('meternumber-verification', [VerificationController::class, 'meternumber']);


    //User
    Route::post('logout', [AuthController::class, 'logout']);

    Route::get('user', [UserController::class, 'view']);

    Route::post('update-user', [UserController::class, 'userUpdate']);

    Route::put('update-password', [UserController::class, 'updatePassword']);

    Route::get('verify-password/{password}', [UserController::class, 'verifyPassword']);

    Route::get('user-banks', [UserController::class, 'viewBanks']);

    Route::get('user-discount', [UserController::class, 'getDiscount']);

    Route::get('get-monnify-charges', [UserController::class, 'getMonnifyCharges']);

    Route::post('create-automated-banks', [UserController::class, 'createAutomatedBanks']);

    //Purchases
    Route::post('airtime-purchase', [PurchaseController::class, 'airtime']);

    Route::post('data-purchase', [PurchaseController::class, 'data']);

    Route::post('bill-purchase', [PurchaseController::class, 'bill']);

    Route::post('electricity-purchase', [PurchaseController::class, 'electricity']);

    //Transactions
    Route::get('view-transactions', [TransactionController::class, 'get']);

    Route::post('filter-transactions', [TransactionController::class, 'filter']);

    Route::put('transfer-fund', [UserController::class, 'adminCreditUser']);

    Route::get('verify-email/{email}', [UserController::class, 'adminVerifyEmail']);

    Route::get('get-notification', [UserController::class, 'getNotification']);

    Route::post('merchant-pay', [MonnifyController::class, 'initializePay']);

    //Levels
    Route::get('view-levels', [LevelController::class, 'index']);

    Route::post('upgrade-user', [UserController::class, 'userUpgrade']);

});
