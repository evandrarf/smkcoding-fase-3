<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function respond($data, $status = 200)
    {
        return response()->json($data, $status);
    }

    public function exceptionError($exception, $status = 500)
    {
        return response()->json([
            'message' => is_array($exception) ? $exception : $exception
        ], $status);
    }
}
