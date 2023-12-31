<?php

use App\Http\Controllers\Dashboard\HomeController;
use App\Http\Controllers\Dashboard\MadingController;
use Illuminate\Support\Facades\Route;

Route::controller(MadingController::class)->prefix('madings')->name('madings.')->group(function () {
    Route::get('/', 'index')->name('index');
    Route::get('/get-data', 'getData')->name('get-data');
    Route::middleware('auth')->group(function () {
        Route::get('/create', 'create')->name('create')->middleware('roles:admin,management');
        Route::post('/create', 'store')->name('store')->middleware('roles:admin,management');
        Route::get('/{slug}/edit', 'edit')->name('edit')->middleware('roles:admin,management');
        Route::post('/{slug}/update', 'update')->name('update')->middleware('roles:admin,management');
        Route::post('/{id}/change-status', 'changeStatus')->name('change-status')->middleware('roles:admin');
        Route::get('/me', 'myMading')->name('my-mading')->middleware('roles:admin,management');
        Route::delete('/{id}/delete', 'delete')->name('delete')->middleware('roles:admin,management');
    });
    Route::get('/{slug}', 'detail')->name('detail')->middleware('mading_visits_counter');
    Route::get('/{slug}/get-data', 'getDataDetail')->name('get-data-detail');
});
