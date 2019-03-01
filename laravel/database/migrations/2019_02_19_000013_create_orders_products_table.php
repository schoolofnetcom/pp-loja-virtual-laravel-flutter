<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersProductsTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'order_products';

    /**
     * Run the migrations.
     * @table orders_products
     *
     * @return void
     */
    public function up()
    {
        Schema::create($this->tableName, function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('title', 250);
            $table->decimal('price', 11, 2);
            $table->integer('quantity');
            $table->integer('format')->nullable();
            $table->integer('length')->nullable();
            $table->integer('height')->nullable();
            $table->integer('width')->nullable();
            $table->integer('order_id')->unsigned();
            $table->integer('product_id')->unsigned();
            $table->timestamps();

            $table->index(["order_id"], 'fk_order_products_carts1_idx');

            $table->index(["product_id"], 'fk_order_products_products1_idx');


            $table->foreign('product_id', 'fk_order_products_products1_idx')
                ->references('id')->on('products')
                ->onDelete('no action')
                ->onUpdate('no action');

            $table->foreign('order_id', 'fk_order_products_carts1_idx')
                ->references('id')->on('orders')
                ->onDelete('no action')
                ->onUpdate('no action');
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
