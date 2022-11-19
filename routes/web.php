<?php

use App\Models\Plan;
use App\Models\User;
use Inertia\Inertia;
use App\Models\UserLogin;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\UserProfileController;

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
    return Inertia::render('Welcome' , [
        'plans'   => Plan::withCount('levels')->active()->get(),
    ]);
})->name('welcome');

Route::get('/contact', function () {
    return Inertia::render('Contact');
})->name('contact');

Route::get('/about', function () {
    return Inertia::render('About');
})->name('about');

Route::middleware(['auth', 'verified'])->group(function(){
    Route::get('/dashboard', [DashboardController::class,'index'])->name('dashboard');
    Route::get('direct-referrals', [\App\Http\Controllers\ReferralController::class, 'directReferals'])->name('direct-referrals');
    Route::get('referral-link', [\App\Http\Controllers\ReferralController::class, 'referralLink'])->name('referral-link');
    Route::get('uni-level', [\App\Http\Controllers\ReferralController::class, 'uniLevel'])->name('uni-level');
    Route::get('profile', [UserProfileController::class, 'index'])->name('profile');
    Route::post('save-meta-address', [UserProfileController::class, 'saveMetaAddress'])->name('save-meta-address');
    Route::get('save-transactions', [UserProfileController::class, 'saveTransactions'])->name('save-transactions');
    
    Route::get('transactions', function (){
        return Inertia::render('Transactions', [
            'transactions' => auth()->user()->transactions()->paginate(8),
        ]);
    })->name('transactions');
    
    Route::get('membership', [\App\Http\Controllers\MembershipController::class, 'index'])->name('membership.index');
    
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
