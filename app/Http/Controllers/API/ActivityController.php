<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Activities;
use Illuminate\Http\Request;

class ActivityController extends Controller
{
    //

    public function index()
    {
        $activities = Activities::orderByDesc('id')->take(10)->get();
        $activityArray = [];
        foreach ($activities as $activity) {
            $activityArray[] = array(
                'id' => $activity['id'],
                'type' => $activity['type'],
                'title' => $activity['title'],
                'log' => unserialize($activity['log']),
            );
        }
        return response()->json([
            'status' => 200,
            'activities' => $activityArray
        ]);
    }

    public function filter(Request $request)
    {
        $activities = Activities::query()
        ->when($request->input('type'), fn ($query, $type) => $query->where('type', '=', $type))
        ->when($request->input('log'), fn ($query, $search) => $query->where('log', 'like', '%'. $search .'%'))
        ->when($request->input('limit'), fn ($query, $limit) => $query->take($limit))
        ->orderBy('id', 'desc')
        ->get();


        if (count ($activities) > 0) {
            $activityArray = [];
            foreach ($activities as $activity) {
                $activityArray[] = array(
                    'id' => $activity['id'],
                    'type' => $activity['type'],
                    'title' => $activity['title'],
                    'log' => unserialize($activity['log']),
                );
            }
            return response()->json([
                'status' => 200,
                'activities' => $activityArray
            ]);
        } else {
            return response()->json([
               'status' => 422,
                'errors' => 'No activities found for your filter'
            ]);
        }
    }
}
