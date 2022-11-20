<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Illuminate\Http\Request;

class DepositController extends Controller
{
    public function index()
    {
        return Inertia::render('Deposit/Index', [
            'settings' => getSettings('payment')
        ]);
    }
}
