<?php

namespace App\Http\Controllers\History;

use App\Http\Controllers\Controller;
use App\Models\History;
use Illuminate\Http\Request;

class HistoryController extends Controller
{

    public function index(Request $request)
    {

        $histories = History::query()
            ->with([
                "user",
                "diagnoses"
            ])
            ->orderBy("created_at", "desc")
            ->get()
            ->map(function (History $history) {
                return [
                    "id" => $history->id,
                    "user" => $history->user?->name ?? "-",
                    "diagnose" => $history->diagnoses->name,
                    "date" => $history->created_at
                ];
            });

        return response()
            ->json([
                "result" => $histories,
            ]);
    }

}
