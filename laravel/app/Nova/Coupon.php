<?php

namespace App\Nova;

use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Textarea;
use Illuminate\Http\Request;
use Laravel\Nova\Http\Requests\NovaRequest;

class Coupon extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = 'App\Coupon';

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'id';

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
            Text::make('Código', 'code'),
            Number::make('Disconto', 'discount'),
            Select::make('Tipo do desconto', 'discount_type')
                ->options([
                    'Valor monetário',
                    'Porcentagem'
                ])->displayUsing(function ($value) {
                    if ($value == 0) {
                        return 'Valor monetário';
                    }
                    return 'Porcentagem';
                }),
            Textarea::make('Descrição', 'description'),
            DateTime::make('Data de expiração', 'expiration_date')
                ->help('Deixe em branco para o cupom durar para sempre')
                ->onlyOnForms(),
            Text::make('Data de expiração', 'expiration_date')
                ->displayUsing(function ($value) {
                    return $value->diffForHumans();
                })
                ->exceptOnForms(),
            Number::make('Quantidade', 'quantity')
                    ->help('Deixe em branco para o cupom não ter limite de uso')
        ];
    }

    public static function label()
    {
        return __('Coupons');
    }

    public static function singularLabel()
    {
        return __('Coupon');
    }

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
        return [];
    }
}
