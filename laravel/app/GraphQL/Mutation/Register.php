<?php

namespace App\GraphQL\Mutation;

use App\User;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Mutation;
use Rebing\GraphQL\Support\SelectFields;

class Register extends Mutation
{
    protected $attributes = [
        'name' => 'Register',
        'description' => 'A mutation'
    ];

    public function type()
    {
        return Type::listOf(Type::string());
    }

    public function args()
    {
        return [
            'name' => [
                'name' => 'name',
                'type' => Type::nonNull(Type::string())
            ],
            'email' => [
                'name' => 'email',
                'type' => Type::nonNull(Type::string())
            ],
            'area_code' => [
                'name' => 'area_code',
                'type' => Type::nonNull(Type::string())
            ],
            'phone' => [
                'name' => 'phone',
                'type' => Type::nonNull(Type::string())
            ],
            'password' => [
                'name' => 'password',
                'type' => Type::nonNull(Type::string())
            ]
        ];
    }

    public function resolve($root, $args, SelectFields $fields, ResolveInfo $info)
    {
        $args['password'] = bcrypt($args['password']);

        $user = User::create($args);
        return $user->toArray();
    }
}