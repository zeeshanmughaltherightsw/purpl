<?php

namespace App\Http\Controllers;

use Exception;
use Inertia\Inertia;
use App\Models\Gateway;
use App\Models\Withdrawal;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Models\GatewayCurrency;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;

class WithdrawController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gateway = Gateway::with('single_currency')->whereHas('single_currency')->whereStatus(1)->get();
        return Inertia::render('Withdraw/Index', [
            'gateways' => $gateway,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'amount' => 'required|numeric'
        ]);
        $method = GatewayCurrency::with('method')->where('id', $request->id)->firstOrFail();
        $user = auth()->user();
        if ($request->amount < $method->min_amount) {
            return response()->json([
                'message' => 'Your Requested Amount is Smaller Than Minimum Amount.'
            ], 401);
        }
        if ($request->amount > $method->max_amount) {
            return response()->json([
                'message' => 'Your Requested Amount is Larger Than Maximum Amount.'
            ], 401);
        }

        if ($request->amount > $user->profit) {
            return response()->json([
                'message' => 'Your do not have Sufficient Balance For Withdraw.'
            ], 401);
        }
        try{
            DB::beginTransaction();
            $charge = $method->fixed_charge + ($request->amount * ($method->percentage_charge / 100));
            $afterCharge = $request->amount - $charge;
            if($afterCharge < 0){
                return redirect()->back()->withErrors([
                    'message' => 'Amount is insufficient for withdraw'
                ]);
            }
            $i = 0; 
            $inputForm = $request->input_form;
            foreach($inputForm as $key => $value){
                foreach($value as $input => $inputValue){
                    if($inputValue instanceof \Illuminate\Http\UploadedFile){
                        $filename = uploadImage($inputValue, 'images/withdrawals/');
                        $inputForm[$i][$input] = asset('storage/images/withdrawals/'. $filename);
                    }   
                }
                $i++;
            }
            $finalAmount = $afterCharge * $method->rate;
            if($finalAmount)
            $w['method_id'] = $method->method->id; // wallet method ID
            $w['user_id'] = $user->id;
            $w['amount'] = $request->amount;
            $w['currency'] = $method->currency;
            $w['rate'] = $method->rate;
            $w['charge'] = $charge;
            $w['final_amount'] = $finalAmount;
            $w['after_charge'] = $afterCharge;
            $w['trx'] = getTrx();
            $w['withdraw_information'] = json_encode($inputForm);
            $result = Withdrawal::create($w);
            $user->profit  -=  $request->amount;
            $user->update();

            
            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->amount = $request->amount;
            $transaction->post_balance = $user->profit;
            $transaction->charge = $charge;
            $transaction->trx_type = '-';
            $transaction->details = $w['final_amount'] . ' ' . $w['currency'] . ' Via ' . $method->method->name;
            $transaction->trx =  $w['trx'];
            $transaction->remark = 'withdraw';
            $transaction->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return redirect()->route('withdraw.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
