<?php

use App\Models\Plan;
use App\Models\PlanLevel;
use App\Models\GeneralSetting;
use App\Models\CommissionRecord;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cache;
use Intervention\Image\Facades\Image;

function getRealIP()
{
    $ip = $_SERVER["REMOTE_ADDR"];
    //Deep detect ip
    if (filter_var(@$_SERVER['HTTP_FORWARDED'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_FORWARDED'];
    }
    if (filter_var(@$_SERVER['HTTP_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_FORWARDED_FOR'];
    }
    if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    }
    if (filter_var(@$_SERVER['HTTP_X_REAL_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_X_REAL_IP'];
    }
    if (filter_var(@$_SERVER['HTTP_CF_CONNECTING_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_CF_CONNECTING_IP'];
    }
    if ($ip == '::1') {
        $ip = '127.0.0.1';
    }

    return $ip;
}

function getTrx($length = 12)
{
    $characters = 'ABCDEFGHJKMNOPQRSTUVWXYZ123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function addCommissionToReferals($user, $transaction){
    $realUser = $user;
    $amount = $transaction->amount;
    $levelOneExists = $realUser->transactions()->where('ref_id', $realUser->id)->first();
    $level = PlanLevel::orderBy('level', 'asc')->get();
    $transaction->commissionRecord()->increment('day');
    if($user && $user->ref_by && $user->plan_id && count($level) > 0 && $amount > 0 && $transaction){
        for($i=0; $i < count($level); $i++){
            //getting direct referral of current user
            $user = $user->parentRef;
            //if no referrals then breaking the loop
            if(!$user){
                break;
            }
            //if level one referral has already given the amount the skip this iteration
            if($levelOneExists || !$user->plan_id){
                continue;
            }

            // geting percentage of amout according to level
            $commission = $amount * ($level[$i]->commission / 100);
            
            // if level is greater than one then dividing the amount with 30
            if($level[$i]->level > 1){
                $commission = $commission / 30; 
            }
            $user->commission += $commission;
            $user->save();
            $user->transactions()->create([
                'amount' => $commission,
                'trx' => getTrx(),
                'trx_type' => '+',
                'details' => "Referral Commission of level " . $level[$i]->level,
                'remarks' => "Referral Commission",
                'ref_id' => $realUser->id
            ]);
        }
    }
}


function upgradeMembership($investment, $user)
{
    $plan = Plan::active()
            ->where('max_price', '<=', $user->investment)
            ->where('plan_type', 'investor')
            ->orderByDesc('max_price')
            ->first();
    if($plan){
        if($plan->id == $user->plan_id){
            return $user;
        }
        $user->plan_id = $plan->id;
        $user->save();
        return $user;
    }
    return null;
}
/*
* Recursive top-down tree traversal example:
* Indent and print child nodes
*/
function display_child_nodes($child=null, $spaces=0)
{
    
    $root = $child ? $child: auth()->user();
    // Print the data first
    if ($root)
    {
        // On the way down the tree, we get lft.
        $left = ++$spaces;                
        foreach($root->allReferrals as $child)
        {               
            if ($child)
            {  
                Log::info("ul");
                $spaces = display_child_nodes($child, $spaces);                      
            }
        }
    }
    Log::info("$left - $root->name");                
    return $spaces;
}

function getSettings($group = null)
{
    $settings = Cache::get('settings');
    if(!$settings){
        $settings = GeneralSetting::all();
    }

    if($group){
        return $settings->where('group', $group)->values();
    }
    return $settings;
}


function makeDirectory($path)
{
    if (file_exists($path)) return true;
    return mkdir($path, 0755, true);
}

function removeFile($path)
{
    return file_exists($path) && is_file($path) ? @unlink($path) : false;
}
function uploadImage($file, $location, $size = null, $old = null, $thumb = null)
{
    $location = 'storage/' . $location;
    $path = makeDirectory($location);
    if (!$path) throw new Exception('File could not been created.');
    if (!empty($old)) {
        removeFile($location . '/' . $old);
        removeFile($location . '/thumb_' . $old);
    }


    // $filename = uniqid() . time() . '.' . $file->getClientOriginalExtension();
    $filename = uniqid() . time() . '.png';


    $image = Image::make($file);


    if (!empty($size)) {
        $size = explode('x', strtolower($size));
        $image->resize($size[0], $size[1]);
    }
    $image->save($location . '/' . $filename);

    if (!empty($thumb)) {
        $thumb = explode('x', $thumb);
        Image::make($file)->resize($thumb[0], $thumb[1])->save($location . '/thumb_' . $filename);
    }
    return $filename;
}

function currency($currency){
    $settings = getSettings('currency_setting');
    $cur_text = $settings->where('key', 'cur_text')->first()->value;

    return number_format(($currency / 100), 2, '.', ',') . ' ' . $cur_text;
      
}

?>