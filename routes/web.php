<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
// })->name('home');

Route::prefix('auth')->name('auth.')->group(function () {
    Route::controller(LoginController::class)->prefix('login')->name('login.')->group(function () {
        Route::get('/', [LoginController::class, 'index'])->name('index');
        Route::post('/', [LoginController::class, 'login'])->name('submit');
    });
    Route::controller(RegisterController::class)->prefix('register')->name('register.')->group(function () {
        Route::get('/', [RegisterController::class, 'index'])->name('index');
        Route::post('/', [RegisterController::class, 'register'])->name('submit');
    });
});

Route::middleware('auth')->group(function () {
    Route::get('/', function () {
        return inertia('Dashboard/Index');
    })->name('dashboard.index');

    Route::get('/admin', function () {
        return inertia('Admin/Dashboard/Index');
    })->name('admin.dashboard.index');
});