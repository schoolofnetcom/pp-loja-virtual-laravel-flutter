<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShippingsTable extends Migration
{
    /**
     * Schema table name to migrate
     * @var string
     */
    public $tableName = 'shippings';

    /**
     * Run the migrations.
     * @table shippings
     *
     * @return void
     */
    public function up()
    {
        Schema::create($this->tableName, function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('cep', 8);
            $table->string('address', 250);
            $table->unsignedInteger('number');
            $table->string('neighborhood', 100);
            $table->string('complement', 100)->nullable();
            $table->string('city', 100);
            $table->string('state', 100);
            $table->integer('user_id')->unsigned();
            $table->timestamps();

            $table->index(["user_id"], 'fk_shippings_users1_idx');

            $table->foreign('user_id', 'fk_shippings_users1_idx')
                ->references('id')->on('users')
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
