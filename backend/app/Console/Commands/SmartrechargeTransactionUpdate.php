<?php

namespace App\Console\Commands;

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

            $status_update = Transactions::where('id', $transaction->id)->update([
                'status' => strtolower($result['text_status'] == 'COMPLETED' ? 'success' : $result['text_status']),
            ]);

            if($result['error_code'] != '1981' || $result['text_status'] != '1986') {

                $user = User::where('id', $transaction->user_id)->first();
                $afterBalance = $user->balance + $transaction->amount;
                $title = '[Debit Transaction] Thank you for your purchase';
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

                Activities::create([
                    'type' => 'credit',
                    'title' => "Refunded ".$transaction->description,
                    'log' => serialize($customer_details)
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
