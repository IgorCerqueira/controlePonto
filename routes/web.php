<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    AdminController,
    CommonUserController
};

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

Route::middleware(['admin'])->group( function(){
    Route::get('/AdminDashboard', [AdminController::class, 'index'])->name('admin.index');
    Route::get('/listaUser', [AdminController::class, 'listaUsers'])->name('admin.listUser');
    Route::put('/editaUser/{idUser}', [AdminController::class, 'editaUser'])->name('admin.editUser');
    Route::put('/deleteUser/{idUser}', [AdminController::class, 'deleteUser'])->name('admin.deleteUser');
    Route::get('/listaPonto', [AdminController::class, 'listPonto'])->name('admin.listPonto');
    Route::get('/listaPontoData/{dataInicio}/{dataFinal}', [AdminController::class, 'listPontoPerDate'])->name('admin.listPonto');
});

Route::middleware(['commonUser'])->group( function(){
    Route::get('/dashboard', [CommonUserController::class, 'index'])->name('commonUser.index');
    Route::post('/ponto', [CommonUserController::class, 'registraPonto'])->name('commonUser.registraPonto');
    Route::post('/mudarSenha', [CommonUserController::class, 'changePassword'])->name('commonUser.mudarSenha');
});



require __DIR__.'/auth.php';


