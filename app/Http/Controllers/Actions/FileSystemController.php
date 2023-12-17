<?php

namespace App\Http\Controllers\Actions;

use App\Http\Controllers\Controller;
use App\Http\Requests\FileUploadRequest;
use App\Services\FileService;
use Illuminate\Http\Request;

class FileSystemController extends Controller
{
    public function upload(FileUploadRequest $request)
    {
        $request_file = $request->file('file');

        $fileService = new FileService();

        $file = $fileService->uploadFile($request_file);

        return $this->respond([
            'message' => 'File uploaded successfully',
            'data' => [
                'url' => $file->getFullPathAttribute(),
            ]
        ], 201);
    }
}
