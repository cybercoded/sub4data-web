<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MerchantAPI extends Model
{
    use HasFactory;

    protected $table='merchant_api';
    protected $fillable=[
        'id',
        'user_id',
        'private_key',
        'public_key'
    ];
}
