<?php

use App\Http\Controllers\UserProfileController;
use App\Models\User;
use App\Models\UserLogin;
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
    return Inertia::render('Welcome');
})->name('welcome');

Route::get('/contact', function () {
    return Inertia::render('Contact');
})->name('contact');

Route::get('/about', function () {
    return Inertia::render('About');
})->name('about');

Route::middleware(['auth', 'verified'])->group(function(){
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
    Route::get('direct-referrals', [\App\Http\Controllers\ReferralController::class, 'directReferals'])->name('direct-referrals');
    Route::get('referral-link', [\App\Http\Controllers\ReferralController::class, 'referralLink'])->name('referral-link');
    Route::get('uni-level', [\App\Http\Controllers\ReferralController::class, 'uniLevel'])->name('uni-level');

    Route::get('profile', [UserProfileController::class, 'index'])->name('profile');

      Route::get('account-activity', function(){
        return Inertia::render('Profile/AccountActivity', [
            'details'  =>  UserLogin::all()
        ]);
      })->name('account-activity');

      Route::get('security-setting', function(){
        User::all();
        return Inertia::render('Profile/SecuritySetting');
      })->name('security-setting');
});




require __DIR__.'/auth.php';
