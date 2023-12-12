<?php

use App\Http\Controllers\Dashboard\HomeController;
use App\Http\Controllers\Dashboard\MadingController;
use Illuminate\Support\Facades\Route;

Route::controller(MadingController::class)->prefix('madings')->name('madings.')->group(function () {
    Route::get('/create', 'index')->name('index');
    Route::post('/create', 'store')->name('store');
    Route::get('/{slug}', 'detail')->name('detail');
    Route::get('/{slug}/get-data', 'getDataDetail')->name('get-data-detail');
});
