<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCartShippingTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'cart_shipping';

    /**
     * Run the migrations.
     * @table cart_shipping
     *
     * @return void
     */
    public function up()
    {
        Schema::create($this->tableName, function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->decimal('value', 11, 2);
            $table->string('cep', 8);
            $table->dateTime('deadline');
            $table->integer('carts_id')->unsigned();

            $table->index(["carts_id"], 'fk_shipping_carts1_idx');


            $table->foreign('carts_id', 'fk_shipping_carts1_idx')
                ->references('id')->on('carts')
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
