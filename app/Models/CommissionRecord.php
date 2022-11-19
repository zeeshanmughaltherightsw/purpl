<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommissionRecord extends Model
{
    use HasFactory;

    protected $fillable = [
        'transaction_id',
        'user_id',
        'ref_id',
        'amount'
    ];

    public function transaction()
    {
        return $this->belongsTo(Transaction::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
