<?php

namespace App\GraphQL\Types;

use Rebing\GraphQL\Support\Type as GraphQLType;
use Illuminate\Support\Facades\Storage;
use GraphQL\Type\Definition\Type;

class ProductImageType extends GraphQLType
{
    protected $attributes = [
        'name' => 'ProductImageType',
        'description' => 'A type'
    ];

    public function fields()
    {
        return [
            'url' => [
                'name' => 'url',
                'type' => Type::string()
            ]
        ];
    }

    protected function resolveUrlField($root)
    {
        return Storage::disk('image_product')->url($root->url);
    }
}