<?php

namespace App\Http\Middleware;

use Closure;
use Session;
class CekLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Session::get('is_login') == null || Session::get('is_login') == ''){
            return redirect('login');
        }
        return $next($request);
    }
}
