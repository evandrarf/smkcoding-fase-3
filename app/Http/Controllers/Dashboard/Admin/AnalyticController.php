<?php

namespace App\Http\Controllers\Dashboard\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\ListMadingResource;
use App\Http\Resources\ListMadingVisitorResurce;
use App\Services\Dashboard\AnalyticService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class AnalyticController extends Controller
{
    private $analyticService;

    public function __construct(AnalyticService $analyticService)
    {
        $this->analyticService = $analyticService;
    }

    public function index()
    {
        return Inertia::render('App/Admin/Analytic/Index');
    }

    public function getMadingVisitorChart(Request $request)
    {
        try {
            $data = $this->analyticService->getMadingVisitorChart($request);

            return $this->respond($data);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }

    public function getData(Request $request)
    {
        try {
            $data = $this->analyticService->getData($request);

            $res = new ListMadingVisitorResurce($data);

            return $this->respond($res);
        } catch (\Exception $e) {
            return $this->exceptionError($e->getMessage());
        }
    }
}
