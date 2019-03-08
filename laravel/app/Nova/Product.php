<?php

namespace App\Nova;

use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Trix;
use Laravel\Nova\Panel;
use Illuminate\Http\Request;
use Laravel\Nova\Http\Requests\NovaRequest;

class Product extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = 'App\Product';

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'title';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'id',
    ];

    /**
     * Get the fields displayed by the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function fields(Request $request)
    {
        return [
            ID::make()->sortable(),
            new Panel('Geral', [
                Text::make('Título', 'title'),
                Text::make('SKU', 'sku'),
                Trix::make('Descrição', 'description'),
                Number::make('Em estoque', 'stock'),
                Number::make('Preço', 'price')->displayUsing(function($value) {
                    return 'R$ ' . number_format($value, 2, ',', '.');
                }),
                Boolean::make('Ativado', 'active'),
                Boolean::make('Destaque', 'featured'),
            ]),

            
            new Panel('Frete', [
                Select::make('Formato', 'format')->options([
                    '1' => 'Caixa/Pacote',
                    '2' => 'Role/Prisma',
                    '3' => 'Envelope',
                ])->hideFromIndex(),
                Number::make('Comprimento', 'length')->help('Valor em centimetros')->hideFromIndex(),
                Number::make('Altura', 'height')->help('Valor em centimetros')->hideFromIndex(),
                Number::make('Largura', 'width')->help('Valor em centimetros')->hideFromIndex(),
                Number::make('Diâmetro', 'diameter')->help('Valor em centimetros')->hideFromIndex(),
            ]),

            BelongsToMany::make(__('Categories'), 'categories', 'App\Nova\Category')
        ];
    }

    public static function label()
    {
        return __('Products');
    }

    // public static function singularLabel()
    // {
    //     return __('Product->');
    // }

    /**
     * Get the cards available for the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function cards(Request $request)
    {
        return [];
    }

    /**
     * Get the filters available for the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function filters(Request $request)
    {
        return [];
    }

    /**
     * Get the lenses available for the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function lenses(Request $request)
    {
        return [];
    }

    /**
     * Get the actions available for the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function actions(Request $request)
    {
        return [
            new Actions\ChangeProductVisibility(),
            new Actions\ProductFeatured(),
        ];
    }
}
