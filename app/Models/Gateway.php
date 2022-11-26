<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gateway extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
    protected $casts = [
        'input_form' => 'array',
    ];

    public function media()
    {
        return $this->morphOne(Media::class, 'model');
    }

    public function single_currency()
    {
        return $this->hasOne(GatewayCurrency::class)->latest();
    }

    public function scopeManual()
    {
        return $this->where('is_manual', 1);
    }
}
