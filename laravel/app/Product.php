<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public function categories()
    {
        return $this->belongsToMany(Category::class, 'categories_has_products');
    }

    public function changeVisibility()
    {
        $this->attributes['active'] = !$this->attributes['active'];
        $this->save();
    }

    public function changeFeatured()
    {
        $this->attributes['featured'] = !$this->attributes['featured'];
        $this->save();
    }
}
