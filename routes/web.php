<?php

use App\Http\Controllers\UserProfileController;
use App\Models\User;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::middleware(['auth', 'verified'])->group(function(){
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
    Route::get('direct-referrals', function(){
        return Inertia::render('Referral/DirectReferrals', [
            'referrals' => auth()->user()->directReferrals
        ]);
    })->name('direct-referrals');
    Route::get('referral-link', function(){
        return Inertia::render('Referral/ReferralLink');
    })->name('referral-link');

    Route::get('profile', [UserProfileController::class, 'index'])->name('profile');

      Route::get('account-activity', function(){
        return Inertia::render('Profile/AccountActivity');
      })->name('account-activity');

      Route::get('security-setting', function(){
        User::all();
        return Inertia::render('Profile/SecuritySetting');
      })->name('security-setting');
});




require __DIR__.'/auth.php';
