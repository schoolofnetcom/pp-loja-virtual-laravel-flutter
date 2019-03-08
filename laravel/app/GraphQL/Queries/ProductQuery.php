<?php

namespace App\GraphQL\Queries;

use App\Product;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Query;

class ProductQuery extends Query
{
    protected $attributes = [
        'name' => 'Products query'
    ];

    public function type()
    {
        return Type::listOf(\GraphQL::type('product'));
    }

    public function resolve()
    {
        return Product::where([
                ['active', true],
                ['featured', true],
            ])
            ->get();
    }
}