<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersCouponsTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'orders_coupons';

    /**
     * Run the migrations.
     * @table orders_coupons
     *
     * @return void
     */
    public function up()
    {
        Schema::create($this->tableName, function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('code', 45);
            $table->decimal('discount', 11, 2);
            $table->integer('discount_type');
            $table->integer('order_id')->unsigned();
            $table->integer('coupon_id')->unsigned();

            $table->index(["coupon_id"], 'fk_orders_coupons_coupons1_idx');

            $table->index(["order_id"], 'fk_orders_coupons_orders1_idx');


            $table->foreign('order_id', 'fk_orders_coupons_orders1_idx')
                ->references('id')->on('orders')
                ->onDelete('no action')
                ->onUpdate('no action');

            $table->foreign('coupon_id', 'fk_orders_coupons_coupons1_idx')
                ->references('id')->on('coupons')
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
