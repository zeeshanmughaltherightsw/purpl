<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    use HasFactory;

    public function scopeActive($query)
    {
        $query->whereStatus(1);
    }

    public function levels()
    {
        return $this->hasMany(PlanLevel::class);
    }
}
