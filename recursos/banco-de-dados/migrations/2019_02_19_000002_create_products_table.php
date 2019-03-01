<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'products';

    /**
     * Run the migrations.
     * @table products
     *
     * @return void
     */
    public function up()
    {
        Schema::create($this->tableName, function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 250);
            $table->string('sku', 100);
            $table->text('description');
            $table->unsignedInteger('stock');
            $table->decimal('price', 11, 2)->nullable();
            $table->tinyInteger('active');
            $table->integer('format')->nullable();
            $table->integer('length')->nullable();
            $table->integer('height')->nullable();
            $table->integer('width')->nullable();
            $table->integer('diameter')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
     public function down()
     {
       Schema::dropIfExists($this->tableName);
     }
}
