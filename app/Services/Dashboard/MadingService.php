<?php

namespace App\Services\Dashboard;

use App\Models\Mading;
use App\Services\FileService;
use Exception;
use Illuminate\Support\Str;

class MadingService
{
    protected function checkSlug($originalSlug)
    {
        $count = 1;
        $slug = $originalSlug;

        while (Mading::query()->where('slug', $slug)->count() > 0) {
            $slug = $originalSlug . '-' . $count;
            $count++;
        }

        return $slug;
    }

    public function store($request)
    {
        $fileService = new FileService();

        $slug = $this->checkSlug(Str::slug($request->title));
        $file = $fileService->uploadFile($request->file('file'));

        $data = Mading::create([
            'title' => $request->title,
            'content' => $request->content,
            'user_id' => auth()->user()->id,
            'thumbnail' => $file->id,
            'slug' => $slug,
            'priority' => $request->priority,
            'published_at' => $request->published_at,
        ]);

        return $data;
    }

    public function getDataDetail($slug)
    {
        $data = Mading::where('slug', $slug)->first();

        if (!$data) {
            throw new Exception("Data not found", 404);
        }

        return $data;
    }
}
