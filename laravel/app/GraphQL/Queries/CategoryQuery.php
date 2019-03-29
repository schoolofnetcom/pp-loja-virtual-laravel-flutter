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

    public function args()
    {
        return [
            'id' => [
                'name' => 'id',
                'type' => Type::int()
            ]
        ];
    }

    public function resolve($root, $args)
    {
        if (isset($args['id'])) {
            return Category::where('id', $args['id'])->get();
        }
        return Category::all();
    }
}