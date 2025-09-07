<?php

namespace App\Http\Controllers\Diagnose;

use App\Http\Controllers\Controller;
use App\Models\Diagnose;
use App\Models\History;
use App\Models\Rule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DiagnoseController extends Controller
{

    public function index(Request $request)
    {

        $diagnoses = Diagnose::query()
            ->with("solutions")
            ->get()
            ->map(function (Diagnose $diagnose) {
                return [
                    "id" => $diagnose->id,
                    "name" => $diagnose->name,
                    "description" => $diagnose->solutions->description
                ];
            });

        return response()
            ->json([
                "result" => $diagnoses,
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
        $id = generate_custom_id(Diagnose::class, "KD");

        return response()
            ->json([
                "result" => [
                    "id" => $id,
                    "name" => "",
                    "description" => "",
                ]
            ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            "code" => ["required", "string"],
            "name" => ["required", "string"],
            "description" => ["required", "string"],
        ]);

        $user = auth()->user();

        try {
            DB::beginTransaction();

            $diagnose = Diagnose::create([
                "name" => $request->name,

                "created_by" => $user->id,
                "updated_by" => $user->id,
            ]);

            $diagnose->solutions()->create([
                "description" => $request->description,

                "created_by" => $user->id,
                "updated_by" => $user->id
            ]);

            DB::commit();

            return response()
                ->json([
                    "message" => "Diagnosa berhasil disimpan",
                ]);

        } catch (\Throwable $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menambahkan diagnosa",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function edit(Request $request, $target)
    {
        $diagnose = Diagnose::with("solutions")->findOrFail($target);

        return response()
            ->json([
                "result" => [
                    "id" => $diagnose->id,
                    "name" => $diagnose->name,
                    "description" => $diagnose->solutions->description,
                ]
            ]);
    }

    public function update(Request $request, $target)
    {
        $diagnose = Diagnose::findOrFail($target);

        $request->validate([
            "code" => ["required", "string"],
            "name" => ["required", "string"],
            "description" => ["required", "string"],
        ]);

        $user = auth()->user();

        try {
            DB::beginTransaction();

            $diagnose->update([
                "name" => $request->name,

                "updated_by" => $user->id,
            ]);

            $diagnose->solutions()->update([
                "description" => $request->description,

                "updated_by" => $user->id
            ]);

            DB::commit();

            return response()
                ->json([
                    "message" => "Diagnosa berhasil disimpan",
                ]);

        } catch (\Throwable $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menambahkan diagnosa",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function destroy(Request $request, $target)
    {
        $diagnose = Diagnose::findOrFail($target);

        if ($diagnose->rules()->exists()) {

            return response()->json([
                "message" => "Diagnosa {$diagnose->name} sudah terhubung dengan aturan, hapus aturan terlebih dahulu",
            ], 422);
        }

        try {
            DB::beginTransaction();

            $diagnose->delete();

            DB::commit();

            return response()
                ->json([
                    "message" => "Diagnosa berhasil dihapus",
                ]);

        } catch (\Throwable $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menghapus diagnosa",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function diagnose(Request $request)
    {
        $request->validate([
            "symptoms" => ["nullable", "array"]
        ]);

        $symptoms = $request->symptoms;

        $user = auth()->user();

        $rules = Rule::whereIn("symptom_id", $symptoms)
            ->with([
                "diagnoses",
                "diagnoses.solutions",
                "symptoms"
            ])
            ->get();

        if ($rules->isEmpty()) {
            return response()->json([
                "message" => "Tidak ditemukan diagnosa berdasarkan gejala yang dipilih",
                "result" => []
            ], 422);
        }

        $diagnoseCounts = $rules->groupBy("diagnose_id")->map(function ($group) use ($symptoms) {
            $matched = $group->count();
            $totalNeeded = Rule::where("diagnose_id", $group->first()->diagnose_id)->count();
            $percentage = round(($matched / $totalNeeded) * 100, 2);

            return [
                "diagnose_id" => $group->first()->diagnose_id,
                "diagnose" => $group->first()->diagnoses->name,
                "solution" => $group->first()->diagnoses->solutions->description,
                "matched" => $matched,
                "total" => $totalNeeded,
                "percentage" => $percentage
            ];
        });

        $fullMatch = $diagnoseCounts->filter(fn($item) => $item["percentage"] == 100);

        if ($fullMatch->isNotEmpty()) {
            $result = $fullMatch->values();
        } else {
            $result = $diagnoseCounts->sortByDesc("percentage")->values()->take(3);
        }

        if ($user && $result->isNotEmpty()) {
            foreach ($result as $diagnoses) {
                History::create([
                    "diagnose_id" => $diagnoses["diagnose_id"],

                    "created_by" => $user->id,
                    "updated_by" => $user->id
                ]);
            }
        }

        return response()->json([
            "message" => "Hasil diagnosa",
            "result" => $result
        ]);
    }
}
