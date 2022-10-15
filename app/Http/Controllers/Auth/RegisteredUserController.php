<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use App\Http\Controllers\Controller;
use App\Models\UserLogin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use App\Providers\RouteServiceProvider;
use App\Traits\ClientInfo;
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
            Session::put('ref_account_no', $referrals);
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
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);
        $mybrowser = ClientInfo::osBrowser();
        dd($mybrowser['os_platform']);

        dd(json_decode(json_encode(ClientInfo::ipInfo()),true));

        $ipaddress = $_SERVER["REMOTE_ADDR"];

        function ip_details($ip)
        {
            $json = file_get_contents("http://ipinfo.io/{$ip}/geo");
            $details = json_decode($json); // HERE!!!
            return $details;
        }

        $details = ip_details($ipaddress);

        // IP address 
        $userIP = $details->ip;

        // API end URL 
        $apiURL = 'https://ip-api.com/docs/api:json/' . $userIP;
        // dd($apiURL);

        // Create a new cURL resource with URL 
        $ch = curl_init($apiURL);
        dd($ch);

        // Return response instead of outputting 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Execute API request 
        $apiResponse = curl_exec($ch);


        // Close cURL resource 
        curl_close($ch);

        // Retrieve IP data from API response 
        $ipData = json_decode($apiResponse, true);
        // dd($ipData);

        if (!empty($ipData)) {
            $country_code = $ipData['country_code'];
            $country_name = $ipData['country_name'];
            $region_code = $ipData['region_code'];
            $region_name = $ipData['region_name'];
            $city = $ipData['city'];
            $zip_code = $ipData['zip_code'];
            $latitude = $ipData['latitude'];
            $longitude = $ipData['longitude'];
            $time_zone = $ipData['time_zone'];

            echo 'Country Name: ' . $country_name . '<br/>';
            echo 'Country Code: ' . $country_code . '<br/>';
            echo 'Region Code: ' . $region_code . '<br/>';
            echo 'Region Name: ' . $region_name . '<br/>';
            echo 'City: ' . $city . '<br/>';
            echo 'Zipcode: ' . $zip_code . '<br/>';
            echo 'Latitude: ' . $latitude . '<br/>';
            echo 'Longitude: ' . $longitude . '<br/>';
            echo 'Time Zone: ' . $time_zone;
        } else {
            echo 'IP data is not found!';
        }

        dd("asdf");



        $referrals = Session::get('ref_account_no');
        if ($referrals) {
            $ref = User::select('id')->where('account_no', $referrals)->first();
        }
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'ref_by' => isset($ref) ? $ref->id : null
        ]);


        event(new Registered($user));

        Auth::login($user);

        // user ip



        // browser
        // echo $_SERVER['HTTP_USER_AGENT'];

        // Using get_browser() to display
        // capabilities of the user browser
        $mybrowser = ClientInfo::osBrowser();

        // os
        $client = $_SERVER['HTTP_USER_AGENT'];
        $os = explode(";", $client)[1] . "";




        $userLogin = new UserLogin();
        $userLogin->user_id = Auth::user()->id;
        $userLogin->user_ip = $details->ip;
        $userLogin->location = Auth::user()->address;
        $userLogin->browser = $mybrowser->browser;
        $userLogin->os      = $os;
        $userLogin->longitude = '30.1575° N';
        $userLogin->latitude   = '71.5249° E';
        $userLogin->country    = 'Pakistan';
        $userLogin->country_code = '+92';
        $userLogin->save();

        return redirect(RouteServiceProvider::HOME);
    }
}
