<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Services extends Model
{
    use HasFactory;

    protected $table = 'services';
    protected $fillable = [
        'product_id',
        'name',
        'slug',
        'description',
        'price',
        'available'
    ];

    protected $with = ['products'];
    public function product()
    {
        return $this->belongsTo(Category::class, 'product_id', 'id');
    }
}