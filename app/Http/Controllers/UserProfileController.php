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
    }

    public function saveTransactions(Request $request)
    {
        try{
            if(!$request->has('amount') && $request->amount <=0){
                return response()->json([
                    'message' => "Amount cannot be null or Zero"
                ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
            }
            DB::beginTransaction();
            // $user = User::findOrFail(auth()->user()->id);
            $user = User::findOrFail(203);
            $amount = $request->amount * 0.95;
            $user->investment += $amount;
            $user->save();
            $transaction = $user->transactions()->create([
                'amount' => $amount,
                'trx' => getTrx(),
                'trx_type' => '+',
                'details' => "Deposit"
            ]);
            $user = upgradeMembership($amount, $user);
            
            $user->plan_id ? $transaction->commissionRecord()->create([
                'amount' => $amount,
                'user_id' => $user->id,
            ]) : null;

            addCommissionToReferals($user, $transaction);

            DB::commit();
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
            'details'  =>  UserLogin::all()
        ]);
    }

    public function securitySettings()
    {
        User::all();
        return Inertia::render('Profile/SecuritySetting');
    }
}
