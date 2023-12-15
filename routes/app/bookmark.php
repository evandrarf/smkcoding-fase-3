<?php

use App\Http\Controllers\Dashboard\BookmarkController;
use Illuminate\Support\Facades\Route;

Route::controller(BookmarkController::class)->prefix('bookmarks')->name('bookmarks.')->group(function () {
    Route::get('/', 'index')->name('index');
    Route::get('get-data', 'getData')->name('get-data');
    Route::get('check-is-bookmarked', 'checkIsBookmarked')->name('check-is-bookmarked');
    Route::post('toogle-bookmark', 'toogleBookmark')->name('toggle-bookmark');
});
