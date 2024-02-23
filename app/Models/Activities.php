<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Activities extends Model
{
    use HasFactory;

    protected $table='activity_logs';

    protected $fillable=[
        'id',
        'type',
        'title',
        'log'
    ];
}
