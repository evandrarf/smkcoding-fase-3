<?php

namespace App\Services\Dashboard;

use App\Actions\Utility\PaginateCollection;
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

    public function getData($request)
    {
        $query = Mading::query();

        $query->when($request->has('priority') && $request->priority != null, function ($q) use ($request) {
            $q->where('priority', $request->priority);
        });

        $query->when($request->has('search') && $request->search != null, function ($q) use ($request) {
            $q->where('title', 'like', '%' . $request->search . '%');
        });

        $query->when($request->has('status') && $request->status != null, function ($q) use ($request) {
            if ($request->status == 'published') {
                $q->where('published_at', '<=', now())->where('rejected', false)->where('need_review', false);
            } else if (auth()->check() && auth()->user()->role->name == 'admin') {
                if ($request->status == 'rejected') {
                    $q->where('rejected', true);
                } else if ($request->status == 'need_review') {
                    $q->where('need_review', true);
                } else if ($request->status == 'draft') {
                    $q->where('published_at', '>', now())->where('rejected', false)->where('need_review', false);
                }
            } else {
                throw new Exception("You don't have permission to access this data", 403);
            }
        });

        $limit = $request->limit > 0 || $request->limit !== null ? $request->limit : 10;

        $paginate = new PaginateCollection();

        $data = $paginate->handle($query->orderBy('published_at', 'desc')->get(), $limit);

        return $data;
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

        if (auth()->check() && (auth()->user()->id == $data->user_id || auth()->user()->role->name == 'admin')) {
            return $data;
        }

        if ($data->need_review || $data->rejected || $data->published_at > now()) {
            throw new Exception("Data not found", 404);
        }

        return $data;
    }
}
