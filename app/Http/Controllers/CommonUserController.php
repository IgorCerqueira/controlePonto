<?php

namespace App\Http\Controllers;

use App\Models\Ponto;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DateTime;
use DateTimeZone;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CommonUserController extends Controller
{
    public function index(){
        return view('commonUser.index');
    }

    public function registraPonto(Request $request){

    $dt = Carbon::now();
    $dt->setTimezone(new DateTimeZone('America/Sao_Paulo'));
    $dt = ($dt->format('Y-m-d H:i:s'));

    $userId = (auth()->id());

    $ponto = DB::table('pontos')
        ->select('id','pontoEntrada', 'saidaAlmoco', 'entradaAlmoco', 'pontoSaida', 'user_id')
        ->where('user_id', '=', $userId)
        ->orderBy('id', 'desc')
        ->first();
        
    if($ponto == null){
        Ponto::create([
            'pontoEntrada' => $dt,
            'user_id' => $userId
        ]);
    }
    else{
        if($ponto->pontoSaida == null){
          if($ponto->saidaAlmoco == null){
            Ponto::where('id', $ponto->id)->update([ 'saidaAlmoco' => $dt]);
          }
          else{
              if($ponto->entradaAlmoco == null){
                Ponto::where('id', $ponto->id)->update([ 'entradaAlmoco' => $dt]);
              }
              else{
                Ponto::where('id', $ponto->id)->update([ 'pontoSaida' => $dt]);
              }
        
          }
        }
        else{
            Ponto::create([
                'pontoEntrada' => $dt,
                'user_id' => $userId
            ]);
        }
    }  
  }

  public function changePassword(Request $request) {
    $userId = (auth()->id());

    $user = DB::table('users')
    ->where('id', '=', $userId)
    ->first();

    // return($request->senhaAtual);
    // return($user->password);

    if(Hash::check($request->senhaAtual, $user->password)){
        
        $user = DB::table('users')
        ->where('id', '=', $userId)->update(['password' => Hash::make($request->senhaNova)]);
        
        return('Senha alterada com sucesso');
    }
    else{
        return('A senha atual não confere');
    }


    

  }
}
