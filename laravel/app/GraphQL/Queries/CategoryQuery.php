<?php

namespace App\GraphQL\Queries;

use App\Category;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Query;

class CategoryQuery extends Query
{
    protected $attributes = [
        'name' => 'Categories query'
    ];

    public function type()
    {
        return Type::listOf(\GraphQL::type('category'));
    }

    public function resolve()
    {
        return Category::all();
    }
}