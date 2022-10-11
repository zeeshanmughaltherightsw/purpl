<?php

namespace Database\Seeders;

use App\Models\Transaction;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TransactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $transactions = [
            [
                'user_id'         =>   1,
                'amount'          =>   5,
                'old_balance'     =>   10,
                'new_balance'     =>   3,
                'details'         =>   "Dummy",

            ],

        ];

        foreach ($transactions as $transaction) {
            Transaction::create($transaction);
        }
    }
}
