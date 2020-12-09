<?php

namespace App\Http\Middleware;

use Closure;
use Session;

class RoleAdmin
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
        if (Session::get('role') != 'Admin') {
            return redirect('dashboard');
        }
        return $next($request);
    }
}
