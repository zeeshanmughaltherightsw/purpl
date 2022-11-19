<?php

use App\Models\CommissionRecord;
use App\Models\GeneralSetting;
use App\Models\Plan;
use App\Models\PlanLevel;
use Illuminate\Support\Facades\Log;
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
            if($levelOneExists){
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
    if($group){
        return GeneralSetting::where('group', $group)->get();
    }
    return GeneralSetting::all();
}
?>