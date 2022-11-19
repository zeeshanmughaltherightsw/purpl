<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;

class ReferralController extends Controller
{
    public function directReferals()
    {
        return Inertia::render('Referral/DirectReferrals', [
            'referrals' => auth()->user()->directReferrals
        ]);
    }

    public function referralLink(){
        return Inertia::render('Referral/ReferralLink');
    }

    public function uniLevel(){
        return Inertia::render('Referral/UniLevel', [
            'users' => User::asNodes()->with('nodes', function($q){$q->asNodes();})->find(auth()->user()->id)
        ]);
    }
}
