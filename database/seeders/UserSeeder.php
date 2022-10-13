<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [
                'full_name'       =>  'admin',
                'username'        =>  'admin',
                'password'        =>   Hash::make('12345678'),
                'email'           => 'admin@admin.com',
                'account_no'      =>   3,
                'ref_by'          =>   1,
                'account_no'      => '12345678',
                'date_of_birth'   => '2000-01-01',
                'address'         => 'Lorem Multan',
                'phone_no'        =>  '1234567',
            ],

        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
