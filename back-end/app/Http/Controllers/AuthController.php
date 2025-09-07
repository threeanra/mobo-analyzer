<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{

    public function data(Request $request)
    {

        $user = auth()->user();

        return response()
            ->json([
                "message" => "OK",
                "result" => [
                    "id" => $user->id,
                    "name" => $user->name,
                    "role" => $user->type,
                    "email" => $user->email,
                ]
            ]);
    }

    public function userData(Request $request, $target)
    {

        $user = User::findOrFail($target);

        return response()
            ->json([
                "message" => "OK",
                "result" => [
                    "id" => $user->id,
                    "name" => $user->name,
                    "email" => $user->email,
                ]
            ]);
    }

    public function login(Request $request)
    {

        $request->validate([
            "email" => ["required", "min:6", "email:dns,rfc", "exists:users,email"],
            "password" => ["required", "min:6"],
        ]);

        $is_valid = Auth::once([
            "email" => $request->email,
            "password" => $request->password
        ]);

        if (!$is_valid) {

            return response()
                ->json([
                    "message" => "Password tidak valid",
                    "errors" => [
                        "password" => [
                            "Password tidak valid"
                        ]
                    ]
                ], 422);
        }

        $user = Auth::user();

        $token = $user->createToken("web", []);

        return response()
            ->json([
                "message" => "OK",
                "result" => [
                    "id" => $user->id,
                    "name" => $user->name,
                    "role" => $user->type,
                    "email" => $user->email,
                ]
            ])
            ->withCookie(cookie(
                "x-access-token",
                $token->plainTextToken,
                60 * 24 * 30,
            ));
    }

    public function register(Request $request)
    {
        $request->validate([
            "name" => ["required", "string"],
            "email" => ["required", "min:6", "email:dns,rfc"],
            "password" => ["required", "min:6"],
        ]);

        if (User::where("email", $request->email)->exists()) {
            return response()->json([
                "message" => "Email sudah digunakan, silakan gunakan email lain"
            ], 400);
        }

        try {
            DB::beginTransaction();

            $user = User::create([
                "name" => $request->name,
                "type" => User::ROLE_USER,
                "email" => $request->email,
                "password" => bcrypt($request->password),
            ]);

            $user->update([
                "created_by" => $user->id,
                "updated_by" => $user->id
            ]);

            DB::commit();

            return response()->json([
                "message" => "Berhasil Membuat Akun",
            ]);
        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal Membuat Akun",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function registerAdmin(Request $request)
    {

        $request->validate([
            "name" => ["required", "string"],
            "email" => ["required", "min:6", "email:dns,rfc"],
            "password" => ["required", "min:6"],
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
                "type" => User::ROLE_ADMIN,
                "email" => $request->email,
                "password" => bcrypt($request->password),

                "created_by" => $user->id,
                "updated_by" => $user->id
            ]);

            DB::commit();

            return response()->json([
                "message" => "Berhasil Membuat Akun",
            ]);
        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal Membuat Akun",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function logout(Request $request)
    {

        $user = auth()->user();

        $user->currentAccessToken()
            ->update([
                "expires_at" => now(),
            ]);

        return response()
            ->json([
                "message" => "Logout Berhasil"
            ])
            ->withoutCookie(cookie(
                "x-access-token",
                ""
            ));
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            "password" => ["required", "min:6"],
        ]);

        $user = User::findOrFail($request->id);

        $user->update([
            "password" => bcrypt($request->password),
        ]);

        return response()->json([
            "message" => "Password berhasil diubah",
        ], 200);
    }

    public function resetPasswordWithOld(Request $request)
    {
        $request->validate([
            "email" => ["required", "email", "exists:users,email"],
            "old_password" => ["required"],
            "password" => ["required", "min:6"],
        ]);

        $user = User::where("email", $request->email)->firstOrFail();

        if (!Hash::check($request->old_password, $user->password)) {
            return response()->json([
                "message" => "Password lama tidak sesuai."
            ], 422);
        }

        $user->update([
            "password" => Hash::make($request->password),
        ]);

        return response()->json([
            "message" => "Password berhasil diubah."
        ], 200);
    }

}
