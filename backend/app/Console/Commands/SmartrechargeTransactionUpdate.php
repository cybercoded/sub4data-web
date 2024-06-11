<?php

namespace App\Console\Commands;

use App\Http\Controllers\API\PurchaseController;
use App\Mail\TransactionMail;
use App\Models\Activities;
use App\Models\Api;
use App\Models\Category;
use App\Models\Transactions;
use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Http;
use Mail;

class SmartrechargeTransactionUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'transactions:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Smartrecharge Transactions Update';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $transactions = Transactions::where('type', 'debit')->where('status', 'pending')->get();
        foreach ($transactions as $transaction) {

            $api = Api::where('api_name', 'smartrecharge')->first();
            $category = Category::where('id', $transaction->category_id)->first();
            $response = Http::get($api['api_url'].'/'.$category->api_slug, [
                'api_key' => $api['api_key'],
                'order_id' => $transaction->api_reference,
                'task' => 'check_status'
            ]);

            $result = $response->json();
            $transaction = Transactions::where('id', $transaction->id);
            $status_update = $transaction->update([
                'status' => strtolower($result['text_status'] == 'COMPLETED' ? 'success' : $result['text_status']),
            ]);

            if($result['error_code'] != '1981' || $result['text_status'] != '1986') {
                
                $user = User::where('id', $transaction->user_id)->first();
                $afterBalance = $user->balance + $transaction->amount;
                $title = '[Debit Transaction] Thank you for your patience';
                $customer_details = [
                    'name' => $user->name,
                    'email' => $user->email,
                    'title' => $title,
                    'balance' => $afterBalance,
                    'reference' => $transaction->api_reference,
                    'price' => number_format($transaction->amount),
                    'description' => "Refunded ".$transaction->description,
                    'order_date' => date('Y-m-d H:i:s')
                ];

                Mail::to($customer_details['email'])
                ->send(new TransactionMail($title, $customer_details));

                $my_purchaser = new PurchaseController;
                $my_purchaser->purchaser([
                    'user' => $user,
                    'beneficiaryName' => $user->name,
                    'saveBeneficiary' => 'false',
                    'number' => 'null',
                    'category_id' => $transaction->category_id,
                    'product_id' => $transaction->product_id,
                    'service_id' => $transaction->service_id,
                    'amount' => $transaction->amount,
                    'reference' => 'SUB' . rand(),
                    'api_reference' => $transaction->api_reference,
                    'description' => "₦" . number_format($transaction->amount) . " " . $user->name . " was refunded to your account for transaction ID (" . $transaction->reference.")",
                    'after_balance' => $afterBalance,
                    'status' => 'success'
                ]);

                User::where('id', $transaction->user_id)->update([
                   'balance' => $afterBalance
                ]);
            }

            if($status_update) {

                \Log::info('Transaction with #'.$transaction->id. ' responded with: ' .$result['text_status']);
            }
        }
    }
}
