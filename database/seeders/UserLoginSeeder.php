<?php

namespace Database\Seeders;

use App\Models\UserLogin;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserLoginSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $userlogins = [
            [
                'user_id'            =>   1,
                'user_ip'            =>   "sdfghjkjhgfds",
                'location'           => 'Lorem Lahore',
                'browser'            =>   'Chrome',
                'os'                 =>   'Window',
                'longitude'          => '30.1575° N',
                'latitude'           => '71.5249° E',
                'country'            => 'Pakistan',
                'country_code'       => '+92',
            ],

        ];

        foreach ($userlogins as $userlogin) {
            UserLogin::create($userlogin);
        }
    }
}
