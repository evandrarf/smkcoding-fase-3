<?php

use App\Http\Controllers\Dashboard\Admin\AdminController;
use App\Http\Controllers\Dashboard\Admin\MadingController;
use Illuminate\Support\Facades\Route;

Route::prefix('admin')->name('admin.')->group(function () {
    Route::controller(AdminController::class)->group(function () {
        Route::get('/', 'index')->name('index');
    });

    Route::controller(MadingController::class)->prefix('madings')->name('madings.')->group(function () {
        Route::get('/', 'index')->name('index');
    });
})->middleware(['auth', 'role:admin']);
