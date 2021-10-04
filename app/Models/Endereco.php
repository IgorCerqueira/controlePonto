<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Endereco extends Model
{
    use HasFactory;

    protected $fillable  = [
        'endereco', 
        'numero', 
        'complemento', 
        'cep', 
        'bairro', 
        'cidade', 
        'uf',
        'user_id'
    ];

    protected $table = 'enderecos';

   
}
