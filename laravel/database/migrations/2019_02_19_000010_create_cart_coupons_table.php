<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCartCouponsTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'cart_coupons';

    /**
     * Run the migrations.
     * @table cart_coupons
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
            $table->integer('coupons_id')->unsigned();
            $table->integer('carts_id')->unsigned();

            $table->index(["coupons_id"], 'fk_coupons_coupons1_idx');

            $table->index(["carts_id"], 'fk_coupons_carts1_idx');


            $table->foreign('coupons_id', 'fk_coupons_coupons1_idx')
                ->references('id')->on('coupons')
                ->onDelete('no action')
                ->onUpdate('no action');

            $table->foreign('carts_id', 'fk_coupons_carts1_idx')
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
