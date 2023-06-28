<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class APIPublicVerification
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        $user = User::where('access_token', $request->bearerToken())->first();

        if(!$user)
        {
            return response()->json([
                'status' => 401,
                'errors' => 'Access token error'
            ]);
        }

        $request->merge(['user'=> $user]);

        return $next($request);
    }
}
