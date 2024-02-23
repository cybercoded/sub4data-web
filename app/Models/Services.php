<?php

namespace App\Models;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Services extends Model
{
    use HasFactory;

    protected $table = 'services';
    protected $fillable = [
        'product_id',
        'name',
        'api_service_id',
        'description',
        'price',
        'available'
    ];

    protected $with = ['product'];
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}