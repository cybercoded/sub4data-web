<?php

namespace App\Http\Controllers\API;

use App\Models\Levels;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;

class LevelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     */
    public function index()
    {
        $levels = Levels::all();
        return response()->json([
            'status' => 200,
            'levels' => $levels
        ]);
    }

    public function get($id)
    {
        $levels = Levels::where('id', $id)->first();
        if (!$levels) {
            return response()->json([
               'status' => 404,
               'errors' => 'Level not found.'
            ]);
        }
        return response()->json([
            'status' => 200,
            'level' => $levels
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'level' => 'numeric|required|numeric|min:1|max:10|unique:levels,level',
            'name' => 'string|required',
            'percentage' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }

        $new_levels = Levels::create([
            'level' => $request->level,
            'name' => $request->name,
            'percentage' => $request->percentage
        ]);

        if ($new_levels) {
            return response()->json([
                'status' => 200,
                'message' => "Level added successfully"
            ]);
        }


    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'level' => 'numeric|required|numeric|min:1|max:10|exists:levels,level',
            'name' => 'string|required',
            'percentage' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ]);
        }

        $update_levels = Levels::where('id', $request->id)->update([
            'level' => $request->level,
            'name' => $request->name,
            'percentage' => $request->percentage,
            'status' => $request->status == 1? 1 : 0
        ]);

        if ($update_levels) {
            return response()->json([
                'status' => 200,
                'message' => "Level updated successfully"
            ]);
        }
    }

    public function delete($id) {
        $level = Levels::where('id', $id)->first();
        if (!$level) {
            return response()->json([
              'status' => 404,
               'errors' => 'Level not found.'
            ]);
        }
        $level->delete();
        return response()->json([
           'status' => 200,
           'message' => 'Level deleted successfully'
        ]);
    }
}
