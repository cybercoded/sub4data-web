<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Roles;
use App\Models\Permissions;

class ACLsController extends Controller
{

    public function index(Request $request)
    {
        $user = auth('sanctum')->user();
        $permissions = Permissions::where('user_id', $user->id)->where('status', 1)->get();

        // If no per$permissions found
        if ($permissions) {
            return response()->json([
                'status' => 200,
                'permissions' => $permissions
            ]);
        }
    }
    
    public function view($user_id)
    {
        // Get the roles with permissions
        $permissions = Permissions::where('user_id', $user_id)->get();

        // If no per$permissions found
        if (count($permissions) < count(Roles::all()) ) {
            $roles = Roles::all();

            foreach ($roles as $role) {
                $new_permission_check = Permissions::where('user_id', $user_id)->where('roles_id', $role->id)->first();
                if(!$new_permission_check){
                    Permissions::create([
                        'user_id' => $user_id,
                        'roles_id' => $role->id
                    ]);
                }
            }

            $permissions = Permissions::where('user_id', $user_id)->get();
            return response()->json([
                'status' => 200,
                'permissions' => $permissions
            ]);
        }

        return response()->json([
            'status' => 200,
            'permissions' => $permissions
        ]);
    }


    public function update(Request $request, $user_id) 
    {
        // Get the roles from the request payload
        $rolesPayload = $request->all();

        // Update permissions
        foreach ($rolesPayload as $role_slug => $assigned) {
            $role = Roles::where('slug', $role_slug)->first();
            $role_id = $role->id;

            // Query permission for the given user and role
            $permission = Permissions::where('user_id', $user_id)->where('roles_id', $role_id)->first();

            // If permission does not exist, create it
            if (!$permission) {
                Permissions::create([
                    'user_id' => $user_id,
                    'roles_id' => $role_id,
                    'status' => $assigned
                ]);
            } else {
                $permission->update([
                    'status' => $assigned
                ]);
            }
        }

        return response()->json([
            'status' => 200,
            'message' => "Permissions updated successfully"
        ]);
    }


}
