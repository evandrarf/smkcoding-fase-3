<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\RegisterRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class RegisterController extends Controller
{
    public function __construct()
    {
        $this->middleware(['guest']);
    }

    public function index()
    {
        return Inertia::render('Auth/Register');
    }

    public function register(RegisterRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if ($user) {
            return $this->respond([
                'message' => 'Email already taken',
            ], 422);
        }

        $user = User::create($request->only('name', 'email', 'password'));
        $user->assignRole('user');

        return $this->respond([
            'message' => 'Account created',
        ], 201);
    }
}
