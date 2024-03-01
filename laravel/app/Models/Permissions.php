<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permissions extends Model
{
    use HasFactory;

    protected $table='permissions';

    protected $fillable=[
        'id',
        'user_id',
        'status',
        'roles_id'
    ];

    // Define the relationship with permissions
    protected $with = ['roles'];
    public function roles(){
        return $this->hasMany(Roles::class, 'id', 'roles_id');
    }
}
