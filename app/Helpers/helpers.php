<?php

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
?>