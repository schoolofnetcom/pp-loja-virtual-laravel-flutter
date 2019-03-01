<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersShippingTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'orders_shipping';

    /**
     * Run the migrations.
     * @table orders_shipping
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
            $table->integer('order_id')->unsigned();
            $table->string('address', 250);
            $table->unsignedInteger('number');
            $table->string('neighborhood', 100);
            $table->string('complement', 100);
            $table->string('city', 100);
            $table->string('state', 100);

            $table->index(["order_id"], 'fk_shipping_orders1_idx');


            $table->foreign('order_id', 'fk_shipping_orders1_idx')
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
