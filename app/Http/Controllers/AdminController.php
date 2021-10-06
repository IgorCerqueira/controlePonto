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

        $coins = DB::table('users')
        ->select('CPF', 'name', 'email', 'cargo')
        ->where('isDeleted', '!=', 0)
        ->get();

        return $coins;
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
}
