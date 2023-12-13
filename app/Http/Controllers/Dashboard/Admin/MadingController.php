<?php

namespace App\Http\Controllers\Dashboard\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MadingController extends Controller
{
    public function index()
    {
        return Inertia::render('App/Admin/Mading/Index');
    }
}
