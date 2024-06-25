<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discounts extends Model
{
    use HasFactory;

    protected $table='discounts';
    protected $fillable=[
        'id',
        'percentage',
        'created_by_id',
        'code',
        'used',
        'status',
        'user_id'
    ];
}
