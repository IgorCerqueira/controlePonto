<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ponto extends Model
{
    use HasFactory;

    protected $fillable  = [
        'pontoEntrada', 
        'saidaAlmoco', 
        'entradaAlmoco', 
        'pontoSaida', 
        'user_id'
    ];

    protected $table = 'pontos';
    public $timestamps = false;
    
}
