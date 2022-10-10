<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::create([
            'name' => 'admin',
            'password' => Hash::make('12345678'),
            'email' => 'admin@admin.com'
        ]);

        \App\Models\User::factory()->create([
            'password' => Hash::make('12345678'),
        ]);
    }
}
