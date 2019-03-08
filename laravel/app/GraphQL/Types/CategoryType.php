<?php

namespace App\GraphQL\Types;

use App\Category;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;

class CategoryType extends GraphQLType
{
    protected $attributes = [
        'name' => 'Category',
        'description' => 'A category',
        'model' => Category::class
    ];

    public function fields()
    {
        return [
            'id' => [
                "type" => Type::nonNull(Type::id()),
                'description' => 'The id of the category'
            ],
            'title' => [
                "type" => Type::nonNull(Type::string()),
                'description' => 'The title of the category'
            ],
            'products' => [
                'type' => \GraphQL::paginate('product'),
                'description' => 'Paginated list of the products'
            ]
        ];
    }

    protected function resolveProductsField($root)
    {
        return $root
            ->products()
            ->where('active', true)
            ->paginate();
    }
}