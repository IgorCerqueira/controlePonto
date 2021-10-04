<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEnderecosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('enderecos', function (Blueprint $table) {
            $table->id();
            $table->string('endereco');
            $table->integer('numero');
            $table->string('complemento');
            $table->integer('cep');
            $table->string('bairro');
            $table->string('cidade');
            $table->string('uf');
            $table->timestamps();
            $table->foreignId('user_id')->constrained('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('enderecos');
    }
}
