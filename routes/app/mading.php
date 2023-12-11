<?php

use App\Http\Controllers\Dashboard\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/madings', [HomeController::class, 'index'])->name('mading.index');
