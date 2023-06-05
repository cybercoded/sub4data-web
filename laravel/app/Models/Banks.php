<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banks extends Model
{
    use HasFactory;

    protected $table='banks';

    protected $fillable=[
        'id',
        'bank_name',
        'account_name',
        'account_number',
        'reference'
    ];
}
