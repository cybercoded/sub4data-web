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
use App\Http\Controllers\API\ACLsController;
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

Route::prefix('public')->group( function () {
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

});

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

    //Access Control Lists
    Route::get('view-acls/{id}', [ACLsController::class, 'view'])->middleware('VerifyPermission:read_acls');
    Route::put('update-acls/{id}', [ACLsController::class, 'update'])->middleware('VerifyPermission:update_acls');
    Route::get('view-permissions', [ACLsController::class, 'index'])->middleware('VerifyPermission:read_acls');
    Route::get('get-permissions', [ACLsController::class, 'index']);

    //Categories
    Route::post('store-category', [CategoryController::class, 'store'])->middleware('VerifyPermission:create_categories');
    Route::get('view-category', [CategoryController::class, 'index'])->middleware('VerifyPermission:read_categories');
    Route::get('view-category/{id}', [CategoryController::class, 'edit'])->middleware('VerifyPermission:read_categories');
    Route::post('update-category/{id}', [CategoryController::class, 'update'])->middleware('VerifyPermission:update_categories');
    Route::delete('delete-category/{id}', [CategoryController::class, 'destory'])->middleware('VerifyPermission:delete_categories');
    Route::get('all-category', [CategoryController::class, 'allCategory'])->middleware('VerifyPermission:read_categories');

    //Products
    Route::post('store-product', [ProductController::class, 'store'])->middleware('VerifyPermission:create_products');
    Route::get('view-product', [ProductController::class, 'index'])->middleware('VerifyPermission:read_products');
    Route::get('view-product/{id}', [ProductController::class, 'view'])->middleware('VerifyPermission:read_products');
    Route::post('update-product/{id}', [ProductController::class, 'update'])->middleware('VerifyPermission:update_products');
    Route::delete('delete-product/{id}', [ProductController::class, 'destory'])->middleware('VerifyPermission:delete_products');

    //Services
    Route::get('view-services', [ServicesController::class, 'index'])->middleware('VerifyPermission:read_services');
    Route::get('view-services/{id}', [ServicesController::class, 'view'])->middleware('VerifyPermission:read_services');
    Route::get('get-services/{id}', [ServicesController::class, 'get'])->middleware('VerifyPermission:read_services');
    Route::post('store-services', [ServicesController::class, 'store'])->middleware('VerifyPermission:create_services');
    Route::put('update-services/{id}', [ServicesController::class, 'update'])->middleware('VerifyPermission:update_services');
    Route::delete('delete-services/{id}', [ServicesController::class, 'destory'])->middleware('VerifyPermission:delete_services');

    //Users
    Route::get('view-users', [UserController::class, 'index'])->middleware('VerifyPermission:read_users');
    Route::post('view-users', [UserController::class, 'index'])->middleware('VerifyPermission:read_users');
    Route::get('get-user/{id}', [UserController::class, 'edit'])->middleware('VerifyPermission:read_users');
    Route::post('update-user/{id}', [UserController::class, 'adminUpdate'])->middleware('VerifyPermission:update_users');
    Route::get('verify-email/{email}', [UserController::class, 'adminVerifyEmail'])->middleware('VerifyPermission:read_users');
    Route::put('credit-user', [UserController::class, 'adminCreditUser'])->middleware('VerifyPermission:create_transactions');

    //Transactions
    Route::get('view-transactions-admin', [TransactionController::class, 'index'])->middleware('VerifyPermission:read_transactions');
    Route::post('filter-transactions-admin', [TransactionController::class, 'adminFilter'])->middleware('VerifyPermission:read_transactions');
    Route::post('filter-users', [UserController::class, 'usersFilter'])->middleware('VerifyPermission:read_users');
    Route::post('send-bulk-email', [AdminController::class, 'bulkEmail'])->middleware('VerifyPermission:create_messages');
    Route::get('get-activities', [ActivityController::class, 'index'])->middleware('VerifyPermission:read_activies');
    Route::post('filter-activities', [ActivityController::class, 'filter'])->middleware('VerifyPermission:read_activies');

    //Levels
    Route::get('view-levels', [LevelController::class, 'index'])->middleware('VerifyPermission:read_levels');
    Route::get('get-level/{id}', [LevelController::class, 'get'])->middleware('VerifyPermission:read_levels');
    Route::post('update-level/{id}', [LevelController::class, 'update'])->middleware('VerifyPermission:update_levels');
    Route::post('store-level', [LevelController::class, 'store'])->middleware('VerifyPermission:create_levels');
    Route::delete('delete-level/{id}', [LevelController::class, 'delete'])->middleware('VerifyPermission:delete_levels');

    //Apis
    Route::get('view-apis', [ApisController::class, 'index'])->middleware('VerifyPermission:read_apis');
    Route::get('get-api/{id}', [ApisController::class, 'get'])->middleware('VerifyPermission:read_apis');
    Route::post('update-api/{id}', [ApisController::class, 'update'])->middleware('VerifyPermission:update_apis');
    Route::post('store-api', [ApisController::class, 'store'])->middleware('VerifyPermission:create_apis');
    Route::delete('delete-api/{id}', [ApisController::class, 'delete'])->middleware('VerifyPermission:delete_apis');

    //Dashboard
    Route::get('get-panel-value-admin', [AdminController::class, 'index']);

    //Backups
    Route::get('database-backup', [BackupController::class, 'backup'])->middleware('VerifyPermission:create_db_backups');

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
