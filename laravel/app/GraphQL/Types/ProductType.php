<?php

namespace App\GraphQL\Types;

use App\Product;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;

class ProductType extends GraphQLType
{
    protected $attributes = [
        'name' => 'Product',
        'description' => 'A product',
        'model' => Product::class
    ];

    public function fields()
    {
        return [
            'id' => [
                "type" => Type::nonNull(Type::id()),
                'description' => 'The id of the product'
            ],
            'title' => [
                "type" => Type::nonNull(Type::string()),
                'description' => 'The title of the product'
            ],
            'sku' => [
                "type" => Type::nonNull(Type::string()),
                'description' => 'The SKU of the product'
            ],
            'description' => [
                "type" => Type::nonNull(Type::string()),
                'description' => 'The description of the product'
            ],
            'stock' => [
                "type" => Type::nonNull(Type::int()),
                'description' => 'The stock of the product'
            ],
            'price' => [
                "type" => Type::float(),
                'description' => 'The price of the product'
            ],
            'formatedPrice' => [
                "type" => Type::nonNull(Type::string()),
                'description' => 'The formated price of the product'
            ],
            'images' => [
                'type' => Type::listOf(\GraphQL::type('product_imagem')),
                'description' => 'List of images'
            ]
        ];
    }

    protected function resolveFormatedPriceField($root)
    {
        return 'R$ ' . number_format($root->price, 2, ',', '.');
    }
}