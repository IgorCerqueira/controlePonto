<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CommonUserController extends Controller
{
    public function index(){


        return view('commonUser.index');
    }
}
