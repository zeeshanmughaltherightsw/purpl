<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\User;
use Inertia\Inertia;
use App\Models\UserLogin;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class UserProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Inertia::render('Profile/PersonalInformation', [
            'profiles' => auth()->user()
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
        //
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

    public function saveMetaAddress(Request $request)
    {
        $user = User::findOrFail(auth()->user()->id);
        $user->public_address = $request->address;
        $user->save();
        return response()->json([
            'status' => JsonResponse::HTTP_OK,
        ], JsonResponse::HTTP_OK);
    }

    public function saveTransactions(Request $request)
    {
        // $request->validate([
        //     'amount' => 'required | min:1',
        //     'trx' => 'required',
                // 'from' => 'required'
        // ]);
        try{
            DB::beginTransaction();
            // $user = User::findOrFail(auth()->user()->id);
            $user = User::findOrFail(auth()->user()->id);
            $amount = $request->amount;
            $user->investment += $amount;
            $user->save();
            $transaction = $user->transactions()->create([
                'amount' => $amount,
                'trx' => $request->trx,
                'gas_price' => $request->gas_price,
                'trx_type' => '+',
                'details' => "Deposit",
                'remark' => "Deposit",
                'status' => $request->status ? 1 : 0,
                'from' => $request->from,
                'to' => $request->to,
            ]);
            // http://localhost:8000/save-transactions?gas_price=21596&trx=0x893e5721e7d65431caf38da7871cded5ffe2e42cdb8fd658e21765b22d5a225f&amount=1000000&status=true&from=0xadc95259bf19af8cea70426af1ae5db4e71167f1&to=0xdac17f958d2ee523a2206206994597c13d831ec7
            $user = upgradeMembership($amount, $user);
            if($user && $user->plan_id){
                $transaction->commissionRecord()->create([
                    'amount' => $amount,
                    'user_id' => $user->id,
                ]);
    
                addCommissionToReferals($user, $transaction);
            }

            DB::commit();
            return redirect()->back();
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function transactions(){
        return Inertia::render('Transactions', [
            'transactions' => auth()->user()->transactions()->paginate(8),
        ]);
    }

    public function accountActivity()
    {
        return Inertia::render('Profile/AccountActivity', [
            'details'  =>  UserLogin::limit(20)->get()
        ]);
    }

    public function securitySettings()
    {
        User::all();
        return Inertia::render('Profile/SecuritySetting');
    }
}
