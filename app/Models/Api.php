<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Api extends Model
{
    use HasFactory;

    protected $table = 'api';

    protected $fillable = [
        'api_name',
        'api_payment_charges',
        'api_contract_code',
        'api_key',
        'api_secret',
        'api_url'
    ];
}
