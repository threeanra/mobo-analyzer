<?php

namespace App\Http\Controllers;

use App\Models\Symptom;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{

    public function index(Request $request)
    {

        $users = User::query()
            ->get()
            ->map(function (User $user) {
                return [
                    "id" => $user->id,
                    "name" => $user->name,
                    "type" => $user->type,
                    "email" => $user->email,
                ];
            });

        return response()
            ->json([
                "result" => $users,
            ]);
    }

    public function show(Request $request, $target)
    {
        return match($target) {
            "create" => $this->create($request),
        };
    }

    public function create(Request $request)
    {

        return response()
            ->json([
                "result" => [
                    "id" => "",
                    "name" => "",
                    "role" => "user",
                    "email" => "",
                ]
            ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            "name" => ["required", "string"],
            "email" => ["required", "string", "email:dns,rfc"],
            "password" => ["required", "string"],
        ]);

        if (User::where("email", $request->email)->exists()) {
            return response()->json([
                "message" => "Email sudah digunakan, silakan gunakan email lain."
            ], 400);
        }

        $user = auth()->user();

        try {
            DB::beginTransaction();

            User::create([
                "name" => $request->name,
                "type" => User::ROLE_USER,
                "email" => $request->email,
                "password" => bcrypt($request->password),

                "created_by" => $user->id,
                "updated_by" => $user->id
            ]);

            DB::commit();

            return response()
                ->json([
                    "message" => "Gejala berhasil disimpan",
                ]);

        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menambahkan gejala",
                "error" => $e->getMessage(),
            ], 400);
        }
    }

    public function destroy(Request $request, $target)
    {
        $user = User::findOrFail($target);

        try {
            DB::beginTransaction();

            $user->delete();

            DB::commit();

            return response()
                ->json([
                    "message" => "Akun berhasil dihapus",
                ]);

        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menghapus akun",
                "error" => $e->getMessage(),
            ], 500);
        }
    }
}
