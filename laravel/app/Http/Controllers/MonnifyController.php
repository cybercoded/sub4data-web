<?php

namespace App\Http\Controllers;

use App\Mail\TransactionMail;
use App\Models\Api;
use App\Models\Banks;
use App\Models\Transactions;
use App\Models\User;
use App\Models\Activities;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Mail;
use Illuminate\Support\Facades\Validator;

class MonnifyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
    //  * @return \Illuminate\Http\Response
     */
    public function initializePay(Request $request)
    {
        //Initializing monnify payments
        $api = Api::where('api_name', 'monnify')->first();
        $authorization = base64_encode($api['api_key'] . ':' . $api['api_secret']);

        $response = Http::withHeaders([
            'Authorization' => "Basic " . $authorization,
            'Content-Type' => 'application/json'
        ])->post('https://api.monnify.com/api/v1/auth/login/');

        $jsonData = $response->json();
        $accessToken = $jsonData['responseBody']['accessToken'];

        $user = User::where('id', auth('sanctum')->user()->id)->first();
        $charges = $api['api_payment_charges'];
        $amountPlusCharges = ($request->input('amount') * $charges / 100) + $request->input('amount');
        $ref = 'SUB' . rand();

        $apiPostArray = [
            "amount" => $amountPlusCharges,
            "customerName" => $user->name,
            "customerEmail" => $user->email,
            "paymentReference" => $ref,
            "paymentDescription" => $user->name . " " . $request->amount . " deposit",
            "currencyCode" => "NGN",
            "contractCode" => $api['api_contract_code'],
            "redirectUrl" => "http://localhost:8000/api/verify-monnify-merchant-payment?amount=$request->amount&user_id=$user->id&paymentReference=$ref",
            "paymentMethods" => ["CARD"]
        ];

        $response = Http::withHeaders([
            'Authorization' => "Bearer " . $accessToken,
            'Content-Type' => 'application/json'
        ])->post('https://sandbox.monnify.com/api/v1/merchant/transactions/init-transaction', $apiPostArray);

        if ($response['responseMessage'] != 'success') {
            return response()->json([
                'status' => 200,
                'errors' => 'Payment could not be initiated'
            ]);
        }

        $jsonData = $response->json();
        return response()->json([
            'status' => 200,
            'url' => $jsonData['responseBody']['checkoutUrl']
        ]);


    }

    public function verifyPay(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required|numeric|min:0',
            'user_id' => 'required|numeric|exists:users,id',
            'paymentReference' => 'required|'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 200,
                'errors' => $validator->errors()
            ]);
        }

        $user = User::where('id', $request->user_id)->first();
        $afterBalance = $user->balance + $request->amount;
        $title = '[Credit Transaction] Payment received';
        $ref = 'SUB' . rand();
        $customer_details = [
            'name' => $user->name,
            'email' => $user->email,
            'title' => $title,
            'balance' => $afterBalance,
            'reference' => $ref,
            'price' => number_format($request->amount),
            'description' => "₦" . number_format($request->amount) . " Credit to your account via Monnify",
            'order_date' => date('Y-m-d H:i:s')
        ];

        Mail::to($customer_details['email'])
            ->send(new TransactionMail($title, $customer_details));

        Activities::create([
            'type' => 'monnify_credit',
            'title' => 'Monnify Merchant Credit Payment',
            'log' => serialize($customer_details)
        ]);

        $transaction = new Transactions();
        $transaction->user_id = $user->id;
        $transaction->amount = $request->amount;
        $transaction->reference = $ref;
        $transaction->api_reference = $request->paymentReference;
        $transaction->description = $customer_details['description'];
        $transaction->status = 'success';
        $transaction->type = 'credit';

        $user = User::find($user->id);
        $user->balance = $afterBalance;

        if ($transaction->save() && $user->save()) {
            return [
                'status' => 200,
                'message' => 'Transaction successful',
            ];
        } else {
            return [
                'status' => 400,
                'errors' => 'Unable to save transaction'
            ];
        }
    }

    public $monnifyResult = [];
    public function verifyAtmPayment(Request $request)
    {
        $data = file_get_contents("php://input");
        $data = '{
            "eventData ": {
              "transactionReference ": "MNFY|39|20230613160439|000884 ",
              "paymentMethod ": "ACCOUNT_TRANSFER ",
              "paidOn ": "2023-06-13 16:04:44.513 ",
              "cardDetails ": {},
              "paymentSourceInformation ": [
                {
                  "sessionId ": "6AUAmFiPL9D7KvUchZBUA3hX9aoNvuHV ",
                  "accountNumber ": "0065432190 ",
                  "bankCode ": " ",
                  "amountPaid ": 100,
                  "accountName ": "Monnify Limited "
                }
              ],
              "settlementAmount ": "90.00 ",
              "destinationAccountInformation ": {
                "accountNumber ": "5000390667 ",
                "bankName ": "Wema bank ",
                "bankCode ": "035 "
              },
              "amountPaid ": 100,
              "customer ": {
                "email ": "adexgyh@gmail.com ",
                "name ": "Akinyemi Ajayi "
              },
              "metaData ": {},
              "totalPayable ": 100,
              "paymentDescription ": "Rem ",
              "product ": {
                "reference ": "REMIL1686661296 ",
                "type ": "RESERVED_ACCOUNT "
              },
              "paymentReference ": "MNFY|39|20230613160439|000884 ",
              "paymentStatus ": "PAID ",
              "currency ": "NGN "
            },
            "eventType ": "SUCCESSFUL_TRANSACTION "
        }';

        function computeSHA512TransactionHash($stringifiedData, $clientSecret)
        {
            $computedHash = hash_hmac('sha512', $stringifiedData, $clientSecret);
            return $computedHash;
        }

        $DEFAULT_MERCHANT_CLIENT_SECRET = '78DLT2XQ6KFM2HYVRSAUPSR9LEHHWMAE';
        $computedHash = computeSHA512TransactionHash($data, $DEFAULT_MERCHANT_CLIENT_SECRET);


        $response = json_decode($data, true);

        function trimArrayKeysAndValues($array)
        {
            $return = [];

            foreach ($array as $key => $val) {
                if (is_array($val)) {

                    $return[trim($key)] = trimArrayKeysAndValues($val);
                } else {
                    $return[trim($key)] = trim($val);
                }
            }

            return $return;
        }
        $result = trimArrayKeysAndValues($response);
        // print_r(trimArrayKeysAndValues($result));

        $eventData = (array) $result['eventData'];
        $destinationAccountInformation = (array) $eventData['destinationAccountInformation'];
        $status = strtolower($eventData['paymentStatus'] == 'PAID' ? 'success' :  $eventData['paymentStatus']);
        $amount = $eventData['amountPaid'];
        $transactionRef = $eventData['transactionReference'];
        $accountNumber = $destinationAccountInformation['accountNumber'];

        $user_bank = Banks::where('account_number', $accountNumber)->first();
        $user = User::where('id', $user_bank->user_id)->first();
        $afterBalance = $user->balance + $amount;
        $title = '[Credit Transaction] Payment Received';
        $ref = 'SUB' . rand();
        $customer_details = [
            'name' => $user->name,
            'email' => $user->email,
            'title' => $title,
            'balance' => $afterBalance,
            'reference' => $ref,
            'price' => number_format($amount),
            'description' => "₦" . number_format($amount) . " Credit to your account via Monnify",
            'order_date' => date('Y-m-d H:i:s')
        ];

        Mail::to($customer_details['email'])
            ->send(new TransactionMail($title, $customer_details));

        Activities::create([
            'type' => 'monnify_credit',
            'title' => 'Monnify Merchant Credit Payment',
            'log' => serialize($customer_details)
        ]);

        $transaction = new Transactions();
        $transaction->user_id = $user->id;
        $transaction->amount = $amount;
        $transaction->reference = $ref;
        $transaction->api_reference = $transactionRef;
        $transaction->description = $customer_details['description'];
        $transaction->status = $status;
        $transaction->type = 'credit';

        $user = User::find($user->id);
        $user->balance = $afterBalance;

        if ($transaction->save() && $user->save()) {

            echo $computedHash;

        } else {
            echo "Something went wrong";
        }
    }
}
