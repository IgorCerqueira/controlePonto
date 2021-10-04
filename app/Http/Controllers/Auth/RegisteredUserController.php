<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Endereco;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\DB;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $userId = (auth()->id());

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);
   
        $user = User::create([
            'name' => $request->name,
            'cpf' => $request->cpf,
            'cargo' => $request->cargo,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'isAdmin' => $request->isAdmin,
            'user_id_gestor' => $userId
        ]);

        $idCadastro = DB::table('users')
            ->select('id')
            ->where('cpf', '=', $request->cpf)
            ->get();

        foreach($idCadastro as $cadastroId){
            $idCadastro = ($cadastroId->id);
        }

        $requestDataEndereco = $request->all();
        $requestDataEndereco['user_id'] = $idCadastro;
        
        $endereco = Endereco::create($requestDataEndereco);

        event(new Registered($user));

        Auth::login($user);

        dd('Criado com sucesso(mudar depois)');
    }
}
