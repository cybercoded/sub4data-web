<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Permissions;
use App\Models\Roles;

class VerifyPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle($request, Closure $next, $permission)
    {
        // Check if the user has the required permission
        $role = Roles::where('slug', $permission)->first();
        $user_permission = Permissions::where('user_id', $request->user()->id)->where('roles_id', $role->id)->where('status', 1)->first();
        if (!$user_permission) {
            // If not, return an error response
            return response()->json([
                'status' => 403,
                'errors' => 'Unauthorized.'
            ]);
        }

        // If the user has the permission, proceed with the request
        return $next($request);
    }
}
