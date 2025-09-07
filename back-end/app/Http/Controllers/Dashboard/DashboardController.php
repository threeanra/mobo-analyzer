<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Diagnose;
use App\Models\Rule;
use App\Models\Symptom;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function index(Request $request)
    {

        $users = User::query()
            ->get()
            ->map(function (User $user) {

                return [
                    "id" => $user->id,
                    "type" => $user->type,
                    "name" => $user->name,
                    "email" => $user->email,
                ];
            });

        $symptoms = Symptom::query()->get()->count();
        $diagnoses = Diagnose::query()->get()->count();
        $rules = Rule::query()->get()->groupBy("diagnose_id")->count();

        return response()
            ->json([
                "result" => [
                    "users" => $users,
                    "total_users" => $users->count(),
                    "total_symptoms" => $symptoms,
                    "total_diagnoses" => $diagnoses,
                    "total_rules" => $rules,
                ]
            ]);
    }

}
