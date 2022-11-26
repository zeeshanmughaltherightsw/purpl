<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Gateway;
use App\Models\Withdrawal;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Models\GatewayCurrency;

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

        $charge = $method->fixed_charge + ($request->amount * $method->percent_charge / 100);
        $afterCharge = $request->amount - $charge;
        $finalAmount = $afterCharge * $method->rate;
        $w['method_id'] = $method->method->id; // wallet method ID
        $w['user_id'] = $user->id;
        $w['amount'] = $request->amount;
        $w['currency'] = $method->currency;
        $w['rate'] = $method->rate;
        $w['charge'] = $charge;
        $w['final_amount'] = $finalAmount;
        $w['after_charge'] = $afterCharge;
        $w['trx'] = getTrx();
        $w['withdraw_information'] = json_encode($request->input_form);
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
        $transaction->remark = 'deposit';
        $transaction->save();

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
