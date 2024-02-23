<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Banks extends Model
{
    use HasFactory;

    protected $table='banks';

    protected $fillable=[
        'id',
        'user_id',
        'bank_name',
        'account_name',
        'account_number',
        'reference'
    ];
}
