<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use App\Models\UserLogin;
use App\Traits\ClientInfo;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     *
     * @return \Inertia\Response
     */
    public function create()
    {
        return Inertia::render('Auth/Login', [
            'canResetPassword' => Route::has('password.request'),
            'status' => session('status'),
        ]);
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {
       
        $request->authenticate();

        $request->session()->regenerate();
            // browser and os
            $mybrowser = ClientInfo::osBrowser();

            $info =  json_decode(json_encode(ClientInfo::ipInfo()),true);
    
    
            $userLogin = new UserLogin();
            $userLogin->user_id = Auth::user()->id;
            $userLogin->user_ip = $info['ip'];
            $userLogin->location = Auth::user()->address;
            $userLogin->browser = $mybrowser['browser'];
            $userLogin->os      = $mybrowser['os_platform'];
            $userLogin->longitude = $info['long'][0];
            $userLogin->latitude   = $info['lat'][0];
            $userLogin->country    = $info['country'][0];
            $userLogin->country_code = $info['code'][0];
            $userLogin->save();
    

        return redirect()->intended(RouteServiceProvider::HOME);
    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
