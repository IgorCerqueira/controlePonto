<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(auth()->user()->isAdmin != null){
            if(auth()->user()->isAdmin){
                return $next($request);
            }
            else{
                dd("Não autorizado");
            }
        }
        else{
            return "Faça um novo login";
        }
    }
}
