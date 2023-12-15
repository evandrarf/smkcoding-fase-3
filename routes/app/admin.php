<?php

use App\Http\Controllers\Dashboard\Admin\AdminController;
use App\Http\Controllers\Dashboard\Admin\MadingController;
use App\Http\Controllers\Dashboard\Admin\UserController;
use Illuminate\Support\Facades\Route;

Route::prefix('admin')->name('admin.')->group(function () {
    Route::controller(AdminController::class)->group(function () {
        Route::get('/', 'index')->name('index');
    });

    Route::controller(MadingController::class)->prefix('madings')->name('madings.')->group(function () {
        Route::get('/', 'index')->name('index');
    });
    Route::controller(UserController::class)->prefix('users')->name('users.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/get-data', 'getData')->name('get-data');
        Route::post('/create', 'createData')->name('store');
        Route::put('/{id}/update', 'updateData')->name('update');
        Route::delete('/{id}/delete', 'deleteData')->name('delete');
    });
})->middleware(['auth', 'role:admin']);
