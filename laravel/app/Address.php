<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    protected $table = 'shippings';
    protected $fillable = [
        'cep',
        'address',
        'number',
        'neighborhood',
        'complement',
        'city',
        'state',
        'user_id'
    ];
}
