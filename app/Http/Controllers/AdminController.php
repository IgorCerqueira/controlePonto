<?php

namespace App\Http\Controllers;

use App\Models\Endereco;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class AdminController extends Controller
{
    public function index(){
        return view('admin.dashboard');
    }

    public function listaUsers(){

        $users = DB::table('users')
        ->select('CPF', 'name', 'email', 'cargo')
        ->where('isDeleted', '!=', 0)
        ->where('isAdmin', "=", 0)
        ->get();

        return $users;
    }

    public function editaUser(Request $request, $id){

        User::findOrFail($id)->update($request->all());
        Endereco::where('user_id', $id)->firstOrFail()->update($request->all());
        
        return('Sucesso');
    }

    public function deleteUser(Request $request, $id){
    
        User::findOrFail($id)->update($request->all());
        return('Sucesso');
        
    }

    public function listPonto(){

        $userId = (auth()->id());

        $pontos = DB::select(
            DB::raw(" select u.id, u.name as Funcionario, u.cargo ,g.name as Gestor, p.pontoEntrada, p.saidaAlmoco, p.entradaAlmoco, p.pontoSaida from users u
                      inner join users g
                         on u.user_id_gestor = g.id
                      inner join pontos p
                             on u.id = p.user_id
                       Where u.user_id_gestor = $userId")
        );

        return $pontos;
    }

    public function listPontoPerDate($dataInicio, $dataFinal){
        $userId = (auth()->id());
        
        dd($pontos = DB::select(
            DB::raw(" select u.id, u.name as Funcionario, u.cargo ,g.name as Gestor, p.pontoEntrada, p.saidaAlmoco, p.entradaAlmoco, p.pontoSaida from users u
                      inner join users g
                         on u.user_id_gestor = g.id
                      inner join pontos p
                             on u.id = p.user_id
                       Where u.user_id_gestor = $userId and DATE(p.pontoEntrada) BETWEEN '$dataInicio' and '$dataFinal'")
        ));

        return $pontos;
    }
}


