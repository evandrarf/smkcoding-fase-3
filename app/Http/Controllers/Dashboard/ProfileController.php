<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\UpdateProfileRequest;
use App\Http\Resources\SubmitProfileResource;
use App\Services\Dashboard\MadingService;
use App\Services\Dashboard\UserService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProfileController extends Controller
{
    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index()
    {
        return Inertia::render('App/Profile/Index');
    }

    public function updateData(UpdateProfileRequest $request)
    {
        try {
            $this->userService->updateData($request);

            $res = new SubmitProfileResource(null, 'Profile updated successfully');

            return $this->respond($res, 200);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }
}
