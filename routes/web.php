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

});

//UserComum
Route::middleware(['commonUser'])->group( function(){
    Route::get('/dashboard', [CommonUserController::class, 'index'])->name('commonUser.index');
});



require __DIR__.'/auth.php';


