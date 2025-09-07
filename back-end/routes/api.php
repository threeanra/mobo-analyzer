<?php

use Illuminate\Support\Facades\Route;

Route::post("auth/login", [\App\Http\Controllers\AuthController::class, "login"]);
Route::post("auth/register", [\App\Http\Controllers\AuthController::class, "register"]);
Route::post("auth/logout", [\App\Http\Controllers\AuthController::class, "logout"])->middleware("auth:sanctum");
Route::post("auth/reset-password-old", [\App\Http\Controllers\AuthController::class, "resetPasswordWithOld"]);

Route::group(["middleware" => "auth:sanctum"], function () {
    Route::apiResource("auth/users", \App\Http\Controllers\UserController::class)->names("users");
    Route::get("auth/user-data/{user_id}", [\App\Http\Controllers\AuthController::class, "userData"]);
    Route::post("auth/data", [\App\Http\Controllers\AuthController::class, "data"]);
    Route::post("auth/register/admin", [\App\Http\Controllers\AuthController::class, "registerAdmin"]);
    Route::post("auth/reset-password", [\App\Http\Controllers\AuthController::class, "resetPassword"]);

    Route::apiResource("dashboard", \App\Http\Controllers\Dashboard\DashboardController::class)->names("dashboard");
    Route::apiResource("symptoms", \App\Http\Controllers\Symptom\SymptomController::class)->names("symptoms");
    Route::apiResource("diagnoses", \App\Http\Controllers\Diagnose\DiagnoseController::class)->names("diagnoses");
    Route::post("analyze", [\App\Http\Controllers\Diagnose\DiagnoseController::class, "diagnose"]);
    Route::apiResource("rules", \App\Http\Controllers\Rule\RuleController::class)->names("rules");
    Route::apiResource("histories", \App\Http\Controllers\History\HistoryController::class)->names("history");
});
