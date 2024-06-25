<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IPWhitelists extends Model
{
    use HasFactory;

    protected $table='ip_whitelists';
    protected $fillable=[
        'user_id',
        'email',
        'ip'
    ];
}
