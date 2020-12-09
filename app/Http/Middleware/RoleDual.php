<?php

namespace App\Http\Middleware;

use Closure;
use Session;

class RoleDual
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
        if (Session::get('role') == 'Siswa') {
            return redirect('dashboard');
        }
        return $next($request);
    }
}
