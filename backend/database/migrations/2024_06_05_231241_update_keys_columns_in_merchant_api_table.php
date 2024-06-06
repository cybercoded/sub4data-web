<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateKeysColumnsInMerchantApiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('merchant_api', function (Blueprint $table) {
            //
            $table->longText('private_key')->change();
            $table->longText('public_key')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('merchant_api', function (Blueprint $table) {
            //
            $table->string('private_key')->change();
            $table->string('public_key')->change();
        });
    }
}
