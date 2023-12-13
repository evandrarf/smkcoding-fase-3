<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\CreateMadingRequest;
use App\Http\Resources\DetailMadingResource;
use App\Http\Resources\ListMadingResource;
use App\Http\Resources\SubmitMadingResource;
use App\Services\Dashboard\MadingService;
use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MadingController extends Controller
{
    private $madingService;

    public function __construct(MadingService $madingService)
    {
        $this->madingService = $madingService;
    }

    public function index()
    {
        return Inertia::render('App/Mading/Index');
    }
    public function create()
    {
        return Inertia::render('App/Mading/Create');
    }

    public function getData(Request $request)
    {
        try {
            $data = $this->madingService->getData($request);

            $res = new ListMadingResource($data);

            return $this->respond($res, 200);
        } catch (Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }

    public function store(CreateMadingRequest $request)
    {
        try {
            $data = $this->madingService->store($request);

            $res = new SubmitMadingResource($data, "Success create mading");

            return $this->respond($res, 200);
        } catch (Exception $e) {
            return $this->exceptionError($e->getMessage(), $e->getCode());
        }
    }

    public function detail($slug)
    {
        return Inertia::render('App/Mading/Detail', [
            'slug' => $slug
        ]);
    }

    public function getDataDetail($slug)
    {
        try {
            $data = $this->madingService->getDataDetail($slug);

            $res = new DetailMadingResource($data);

            return $this->respond($res, 200);
        } catch (Exception $e) {
            return $this->exceptionError($e->getMessage(), $e->getCode() !== 0 ? $e->getCode() : 500);
        }
    }
}
