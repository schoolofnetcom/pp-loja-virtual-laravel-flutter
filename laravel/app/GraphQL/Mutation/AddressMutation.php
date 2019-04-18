<?php

namespace App\GraphQL\Mutation;

use App\Address;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Mutation;
use Rebing\GraphQL\Support\SelectFields;

class AddressMutation extends Mutation
{
    protected $attributes = [
        'name' => 'AddressMutation',
        'description' => 'A mutation'
    ];

    public function type()
    {
        return Type::listOf(Type::string());
    }

    public function args()
    {
        return [
            'cep' => [
                'name' => 'cep',
                'type' => Type::nonNull(Type::int())
            ],
            'address' => [
                'name' => 'address',
                'type' => Type::nonNull(Type::string())
            ],
            'number' => [
                'name' => 'number',
                'type' => Type::nonNull(Type::string())
            ],
            'neighborhood' => [
                'name' => 'neighborhood',
                'type' => Type::nonNull(Type::string())
            ],
            'complement' => [
                'name' => 'complement',
                'type' => Type::string()
            ],
            'city' => [
                'name' => 'city',
                'type' => Type::nonNull(Type::string())
            ],
            'state' => [
                'name' => 'state',
                'type' => Type::nonNull(Type::string())
            ],
        ];
    }

    public function resolve($root, $args, SelectFields $fields, ResolveInfo $info)
    {
        $select = $fields->getSelect();
        $with = $fields->getRelations();

        $user = request()->user();

        $address = Address::updateOrCreate(
            ['user_id' => $user->id],
            $args
        );

        return $address->toArray();
    }
}