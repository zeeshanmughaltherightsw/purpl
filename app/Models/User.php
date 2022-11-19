<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Auth;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    
    protected $guarded = [];  
    // protected $fillable = [
    //     'name',
    //     'email',
    //     'password',
    //     'ref_by',
    //     'account_no',
    //     'username',
    //     'address',
    //     'phone_no',
    //     'plan_id',
    //     'status',
    //     'user_type',
    // ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function directReferrals()
    {
        return $this->hasMany(User::class, 'ref_by');
    }

    public function parentRef()
    {
        return $this->belongsTo(User::class, 'ref_by');
    }
    public function userLogin()
    {
        return $this->hasMany(UserLogin::class);
    }

    public function scopeAsNodes($query)
    {
        $query->select(['name', 'id', 'ref_by', 'investment', 'status']);
    }

    public function nodes() {
        return $this->directReferrals()->with(['nodes' => function($q){ $q->asNodes(); }]);
    }

    public function plan()
    {
        return $this->belongsTo(Plan::class);
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }

}
