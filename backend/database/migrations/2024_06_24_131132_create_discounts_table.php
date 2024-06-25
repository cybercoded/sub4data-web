<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('discounts');

        Schema::create('discounts', function (Blueprint $table) {

            $table->id();
            $table->integer('user_id')->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('code')->unique();
            $table->float('percentage', 11, 2);
            $table->tinyInteger('status');
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
        Schema::dropIfExists('discounts');
    }
}
