<?php

namespace App\Nova\Actions;

use Illuminate\Bus\Queueable;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SetImageAsCover extends Action
{
    use InteractsWithQueue, Queueable, SerializesModels;

    public function name()
    {
        return __('Set image as cover');
    }

    /**
     * Perform the action on the given models.
     *
     * @param  \Laravel\Nova\Fields\ActionFields  $fields
     * @param  \Illuminate\Support\Collection  $models
     * @return mixed
     */
    public function handle(ActionFields $fields, Collection $models)
    {
        $model = $models->first();

        if (!$model) {
            return Action::danger('Nenhum model encontrado');
        }

        \App\ProductImage::where([
            ['product_id', $model->product_id],
            ['cover', true]
        ])->update([
            'cover' => false
        ]);

        $model->cover = true;
        $model->save();
        
        if ($models->count() > 1) {
            return Action::message('Apenas a primeira imagem foi definida como capa');
        }
        return Action::message('Atualizado com sucesso');
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        return [];
    }
}
