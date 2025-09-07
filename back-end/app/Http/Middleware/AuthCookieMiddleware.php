<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthCookieMiddleware
{

    public function handle(Request $request, Closure $next)
    {

        if ($request->hasCookie("x-access-token")) {
            $request->headers->set("Authorization", "Bearer {$request->cookie("x-access-token")}");
        }

        return $next($request);
    }

}
