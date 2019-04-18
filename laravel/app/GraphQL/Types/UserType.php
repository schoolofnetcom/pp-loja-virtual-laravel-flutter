<?php

namespace App\GraphQL\Types;

use App\User;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;

class UserType extends GraphQLType
{
    protected $attributes = [
        'name' => 'UserType',
        'description' => 'A type',
        'model' => User::class
    ];

    public function fields()
    {
        return [
            'name' => [
                "type" => Type::string(),
                "description" => "The name of user"
            ],
            'email' => [
                "type" => Type::string(),
                "description" => "The email of user"
            ],
            'area_code' => [
                "type" => Type::string(),
                "description" => "The area_code of user"
            ],
            'phone' => [
                "type" => Type::string(),
                "description" => "The phone of user"
            ],
        ];
    }
}