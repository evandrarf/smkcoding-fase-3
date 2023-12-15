<?php

use App\Http\Controllers\Dashboard\ProfileController;
use Illuminate\Support\Facades\Route;

Route::controller(ProfileController::class)->prefix('profile')->name('profile.')->middleware('auth')->group(function () {
    Route::get('/', 'index')->name('index');
    Route::put('/update-data', 'updateData')->name('update-data');
});
