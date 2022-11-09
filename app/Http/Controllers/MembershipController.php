<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class MembershipController extends Controller
{
    public function index()
    {
        return Inertia::render('Membership/Index', [
            
        ]);
    }
}
