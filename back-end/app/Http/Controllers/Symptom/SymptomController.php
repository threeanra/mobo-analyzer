<?php

namespace App\Http\Controllers\Symptom;

use App\Http\Controllers\Controller;
use App\Models\Diagnose;
use App\Models\Symptom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SymptomController extends Controller
{

    public function index(Request $request)
    {

        $symptoms = Symptom::query()
            ->get()
            ->map(function (Symptom $symptom) {
                return [
                    "id" => $symptom->id,
                    "name" => $symptom->name,
                    "question" => $symptom->question,
                ];
            });

        return response()
            ->json([
                "result" => $symptoms,
            ]);
    }

    public function show(Request $request, $target)
    {
        return match ($target) {
            "create" => $this->create($request),
            default => $this->edit($request, $target),
        };
    }

    public function create(Request $request)
    {
        $id = generate_custom_id(Symptom::class, "KG");

        return response()
            ->json([
                "result" => [
                    "id" => $id,
                    "name" => "",
                    "question" => "",
                ]
            ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            "code" => ["required", "string"],
            "name" => ["required", "string"],
            "question" => ["required", "string"],
        ]);

        $user = auth()->user();

        try {
            DB::beginTransaction();

            Symptom::create([
                "name" => $request->name,
                "question" => $request->question,

                "created_by" => $user->id,
                "updated_by" => $user->id,
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

    public function edit(Request $request, $target)
    {
        $symptom = Symptom::findOrFail($target);

        return response()
            ->json([
                "result" => [
                    "id" => $symptom->id,
                    "code" => $symptom->code,
                    "name" => $symptom->name,
                    "question" => $symptom->question,
                ]
            ]);
    }

    public function update(Request $request, $target)
    {
        $symptom = Symptom::findOrFail($target);

        $request->validate([
            "code" => ["required", "string"],
            "name" => ["required", "string"],
            "question" => ["required", "string"],
        ]);

        $user = auth()->user();

        try {
            DB::beginTransaction();

            $symptom->update([
                "name" => $request->name,
                "question" => $request->question,

                "updated_by" => $user->id,
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
        $symptom = Symptom::findOrFail($target);

        if ($symptom->rules()->exists()) {

            return response()->json([
                "message" => "Gejala {$symptom->name} sudah terhubung dengan aturan, hapus aturan terlebih dahulu",
            ], 422);
        }

        try {
            DB::beginTransaction();


            $symptom->delete();

            DB::commit();

            return response()
                ->json([
                    "message" => "Gejala berhasil dihapus",
                ]);

        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menghapus gejala",
                "error" => $e->getMessage(),
            ], 500);
        }
    }
}
