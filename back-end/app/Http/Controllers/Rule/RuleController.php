<?php

namespace App\Http\Controllers\Rule;

use App\Http\Controllers\Controller;
use App\Models\Diagnose;
use App\Models\Rule;
use App\Models\Symptom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RuleController extends Controller
{

    public function index(Request $request)
    {
        $rules = Rule::query()
            ->with([
                "diagnoses",
                "symptoms"
            ])
            ->get()
            ->groupBy("diagnose_id")
            ->map(function ($group) {
                return [
                    "id" => $group->first()->id,
                    "diagnose" => [
                        "id" => $group->first()->diagnose_id,
                        "name" => $group->first()->diagnoses->name
                    ],
                    "symptoms" => $group->map(function ($rule) {
                        return [
                            "id" => $rule->symptom_id,
                            "name" => $rule->symptoms->name,
                        ];
                    })->values(),
                ];
            })
            ->values();

        return response()->json([
            "result" => $rules,
        ]);
    }

    private function indexDiagnose(Request $request)
    {
        $diagnoses = Diagnose::query()
            ->get()
            ->map(function (Diagnose $diagnose) {
                return [
                    "id" => $diagnose->id,
                    "name" => $diagnose->id . " - " . $diagnose->name
                ];
            });

        return response()->json([
            "result" => $diagnoses,
        ]);
    }

    private function indexSymptom(Request $request)
    {
        $symptoms = Symptom::query()
            ->get()
            ->map(function (Symptom $symptom) {
                return [
                    "id" => $symptom->id,
                    "name" => $symptom->id . " - " . $symptom->name
                ];
            });

        return response()->json([
            "result" => $symptoms,
        ]);
    }

    public function show(Request $request, $target)
    {
        return match ($target) {
            "diagnoses" => $this->indexDiagnose($request),
            "symptoms" => $this->indexSymptom($request),
            "create" => $this->create($request),
            default => $this->edit($request, $target),
        };
    }

    public function create(Request $request)
    {
        $id = generate_custom_id(Rule::class, "KR");

        return response()
            ->json([
                "result" => [
                    "id" => $id,
                    "diagnose" => [],
                    "symptoms" => [],
                ]
            ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            "diagnose_id" => ["required", "string"],
            "symptoms" => ["required", "array"],
        ]);

        $user = auth()->user();

        try {
            DB::beginTransaction();

            foreach ($request->symptoms as $symptomId) {
                $existsRule = Rule::where("diagnose_id", $request->diagnose)
                    ->where("symptom_id", $symptomId)
                    ->exists();

                if ($existsRule) {
                    DB::rollBack();

                    return response()->json([
                        "message" => "Rule dengan gejala dan diagnosa tersebut sudah ada",
                    ], 422);
                }

                Rule::create([
                    "symptom_id" => $symptomId,
                    "diagnose_id" => $request->diagnose_id,

                    "created_by" => $user->id,
                    "updated_by" => $user->id,
                ]);
            }

            DB::commit();

            return response()->json([
                "message" => "Rule berhasil disimpan",
            ]);

        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menambahkan Rule",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function edit(Request $request, $target)
    {
        $rules = Rule::query()
            ->with(["diagnoses", "symptoms"])
            ->where("diagnose_id", $target)
            ->get();

        if ($rules->isEmpty()) {
            return response()->json([
                "message" => "Data not found"
            ], 404);
        }

        $result = [
            "id" => $rules->first()->id,
            "diagnose" => [
                "id" => $rules->first()->diagnose_id,
                "name" => $rules->first()->diagnoses->name
            ],
            "symptoms" => $rules->map(function ($rule) {
                return [
                    "id" => $rule->symptom_id,
                    "name" => $rule->symptoms->name,
                ];
            })->values(),
        ];

        return response()->json([
            "result" => $result
        ]);
    }

    public function update(Request $request, $target)
    {
        $request->validate([
            "symptoms" => ["required", "array"],
        ]);

        $user = auth()->user();

        try {
            DB::beginTransaction();

            $diagnoseId = Rule::where("diagnose_id", $target)->pluck("diagnose_id")->first();

            $newSymptomIds = $request->symptoms;

            $oldSymptomIds = Rule::where("diagnose_id", $diagnoseId)->pluck("symptom_id")->toArray();

            $toDelete = array_diff($oldSymptomIds, $newSymptomIds);
            Rule::where("diagnose_id", $diagnoseId)
                ->whereIn("symptom_id", $toDelete)
                ->delete();

            foreach ($newSymptomIds as $symptomId) {
                $exists = Rule::where("diagnose_id", $diagnoseId)
                    ->where("symptom_id", $symptomId)
                    ->exists();

                if (!$exists) {
                    Rule::create([
                        "diagnose_id" => $diagnoseId,
                        "symptom_id" => $symptomId,

                        "created_by" => $user->id,
                        "updated_by" => $user->id,
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                "message" => "Rule berhasil diperbarui",
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                "message" => "Gagal memperbarui Rule",
                "error" => $e->getMessage(),
            ], 500);
        }
    }

    public function destroy(Request $request, $target)
    {

        try {
            DB::beginTransaction();

            Rule::where("diagnose_id", $target)->delete();

            DB::commit();

            return response()
                ->json([
                    "message" => "Rule berhasil dihapus",
                ]);

        } catch (\Exception $e) {

            DB::rollBack();
            return response()->json([
                "message" => "Gagal menghapus Rule",
                "error" => $e->getMessage(),
            ], 500);
        }
    }
}
