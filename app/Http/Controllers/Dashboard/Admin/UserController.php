<?php

namespace App\Http\Controllers\Dashboard\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\CreateUserRequest;
use App\Http\Requests\Dashboard\UpdateProfileRequest;
use App\Http\Requests\Dashboard\UpdateUserRequest;
use App\Http\Resources\ListUserResource;
use App\Http\Resources\SubmitProfileResource;
use App\Services\Dashboard\UserService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UserController extends Controller
{
    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index()
    {
        $roles = $this->userService->getRoles();

        return Inertia::render('App/Admin/User/Index', compact('roles'));
    }

    public function getData(Request $request)
    {
        try {
            $data = $this->userService->getData($request);

            $res = new ListUserResource($data);

            return $this->respond($res, 200);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }

    public function createData(CreateUserRequest $request)
    {
        try {
            $this->userService->createData($request);

            $res = new SubmitProfileResource(null, "Success Create User");

            return $this->respond($res, 200);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }

    public function updateData(UpdateUserRequest $request, $id)
    {
        try {
            $this->userService->updateData($request, $id);

            $res = new SubmitProfileResource(null, "Success Update User");

            return $this->respond($res, 200);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }

    public function deleteData($id)
    {
        try {
            $this->userService->deleteData($id);

            $res = new SubmitProfileResource(null, "Success Delete User");

            return $this->respond($res, 200);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }
}
