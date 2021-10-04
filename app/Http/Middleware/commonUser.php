<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Providers\RouteServiceProvider;

class commonUser
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
        if(auth()->user()->isAdmin){
            dd("Não autorizado");
        }

        return $next($request);
    }
}
