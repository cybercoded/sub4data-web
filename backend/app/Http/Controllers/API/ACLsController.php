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
        $permissions = Roles::orderBy('name')
                        ->join('permissions', 'roles.id', '=', 'permissions.roles_id')
                        ->where('permissions.user_id', $user->id)
                        ->where('permissions.status', 1)
                        ->get();
        // If no per$permissions found
        if ($permissions) {
            return response()->json([
                'status' => 200,
                'permissions' => $permissions
            ]);
        }
    }

    public function populateACLs($user_id)
    {
        $permissions = Permissions::where('user_id', $user_id)->get();

        if (count($permissions) < count(Roles::all()) ) {
            $roles = Roles::all();

            foreach ($roles as $role) {
                $new_permission_check = Permissions::where('user_id', $user_id)->where('roles_id', $role->id)->first();
                if(!$new_permission_check){
                    Permissions::create([
                        'user_id' => $user_id,
                        'roles_id' => $role->id,
                        'status' => $role->default_permission
                    ]);
                }
            }

            $permissions = Permissions::where('user_id', $user_id)->get();
            return [
                'status' => 200,
                'permissions' => $permissions
            ];
        }
    }
    
    public function view($user_id)
    {
        $permissions = Roles::orderBy('name')
        ->join('permissions', 'roles.id', '=', 'permissions.roles_id')
        ->where('permissions.user_id', $user_id)
        ->get();        

        if(count($permissions) < count(Roles::all()) ) {
            $new_acls = new ACLsController;
            return $new_acls->populateACLs($user_id);
        }
        
        return response()->json([
            'status' => 200,
            'permissions' => $permissions
        ]);
    }




    public function update(Request $request, $user_id) 
    {
        $rolesPayload = $request->all();

        $counts = 0;
        foreach ($rolesPayload as $payload => $role_slug) {
            $role = Roles::where('slug', $payload)->first();
            $role_id = $role->id;
            // Query permission for the given user and role
            $permission = Permissions::where('user_id', $user_id)->where('roles_id', $role_id)->first();

            $permission->update([
                'status' => $role_slug == true ? 1 : 0
            ]);
        }

        return response()->json([
            'status' => 200,
            'message' => "Permissions updated successfully"
        ]);
    }


}
