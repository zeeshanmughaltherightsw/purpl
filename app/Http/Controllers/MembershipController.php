<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use Inertia\Inertia;
use Illuminate\Http\Request;

class MembershipController extends Controller
{
    public function index()
    {
        return Inertia::render('Membership/Index', [
            'settings' => getSettings('payment'),
            'plans' => Plan::where('plan_type', 'investor')->active()->get(),
        ]);
    }
}
