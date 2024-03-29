<?php

namespace App\Http\Controllers\Auth;

use App\Models\Role;
use App\Models\User;
use Inertia\Inertia;
use App\Models\UserLogin;
use App\Traits\ClientInfo;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Session;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Inertia\Response
     */
    public function create($referrals = null)
    {
        if ($referrals) {
            Session::put('username', $referrals);
        }
        return Inertia::render('Auth/Register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'username' => 'required|string|max:15 | min:5 |unique:users',
            'phone_no' => 'required|string|max:11 | min:11 |unique:users',
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);




        $referrals = Session::get('username');
        if ($referrals) {
            $ref = User::select('id')->where('username', $referrals)->first();
        }
        $user = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'address' =>$request->address,
            'phone_no' =>$request->phone_no,
            'account_no' => rand(),
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'ref_by' => isset($ref) ? $ref->id : null,
            'user_type' => 'user'
        ]);
        $userRole = Role::where('name', 'user')->first();
        $userRole->users()->attach($user->id);

        event(new Registered($user));

        Auth::login($user);

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

        return redirect(RouteServiceProvider::HOME);
    }
}
