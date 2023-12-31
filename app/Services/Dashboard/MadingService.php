<?php

namespace App\Services\Dashboard;

use App\Actions\Utility\PaginateCollection;
use App\Models\Mading;
use App\Models\RejectionReason;
use App\Services\FileService;
use Exception;
use Illuminate\Support\Str;

class MadingService
{
    protected function checkSlug($originalSlug, $id = null)
    {
        $count = 1;
        $slug = $originalSlug;


        while (Mading::where('slug', $slug)->count() > 0 && Mading::where('slug', $slug)->first()->id != $id) {
            $slug = $originalSlug . '-' . $count;
            $count++;
        }

        return $slug;
    }

    public function getData($request)
    {
        $query = Mading::query()->with(['author', 'thumbnail', 'rejectionReason']);

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

    public function changeStatus($request, $id)
    {
        if (!auth()->check() || auth()->user()->role->name != 'admin') {
            throw new Exception("You don't have permission to access this data", 403);
        }

        $data = Mading::find($id);

        if (!$data) {
            throw new Exception("Data not found", 404);
        }

        if ($request->status === "approve") {
            $data->need_review = false;
            $data->rejected = false;
            if ($data->rejectionReason) {
                $data->rejectionReason()->delete();
            }
            $data->rejectionReason()->delete();
        } else if ($request->status === "reject") {
            $data->need_review = false;
            $data->rejected = true;

            RejectionReason::create([
                'reason' => $request->rejection_reason,
                'mading_id' => $data->id,
            ]);
        } else if ($request->status === "need review") {
            $data->need_review = true;
            $data->rejected = false;
            $data->rejectionReason()->delete();
        } else {
            throw new Exception("Invalid request", 400);
        }

        $data->save();

        return $data;
    }

    public function update($request, $slug)
    {
        $data = Mading::where('slug', $slug)->first();

        if (!$data) {
            throw new Exception("Data not found", 404);
        }

        if (auth()->user()->id !== $data->user_id) {
            throw new Exception("You don't have permission to access this data", 403);
        }

        $fileService = new FileService();

        $slug = $this->checkSlug(Str::slug($request->title), $data->id);

        $data->title = $request->title;
        $data->content = $request->content;
        $data->slug = $slug;
        $data->priority = $request->priority;
        $data->published_at = $request->published_at ? $request->published_at : now();

        if ($request->hasFile('file')) {
            $file = $fileService->uploadFile($request->file('file'));
            $data->thumbnail = $file->id;
        }

        $data->need_review = false;

        if ($data->rejected) {
            $data->need_review = true;
        }

        $data->rejected = false;

        $data->rejectionReason()->delete();

        $data->save();

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
            'published_at' => $request->published_at ? $request->published_at : now(),
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

    public function myMading($request)
    {
        if (!auth()->check()) {
            throw new Exception("You don't have permission to access this data", 403);
        }

        $query = Mading::query()->where('user_id', auth()->user()->id)->with(['thumbnail', 'author', 'rejectionReason']);

        $query->when($request->has('priority') && $request->priority != null, function ($q) use ($request) {
            $q->where('priority', $request->priority);
        });

        $query->when($request->has('search') && $request->search != null, function ($q) use ($request) {
            $q->where('title', 'like', '%' . $request->search . '%');
        });

        $query->when($request->has('status') && $request->status != null, function ($q) use ($request) {
            if ($request->status == 'published') {
                $q->where('published_at', '<=', now())->where('rejected', false)->where('need_review', false);
            } else if ($request->status == 'rejected') {
                $q->where('rejected', true);
            } else if ($request->status == 'need_review') {
                $q->where('need_review', true);
            } else if ($request->status == 'draft') {
                $q->where('published_at', '>', now())->where('rejected', false)->where('need_review', false);
            }
        });


        $limit = $request->limit > 0 || $request->limit !== null ? $request->limit : 10;

        $paginate = new PaginateCollection();

        $data = $paginate->handle($query->orderBy('published_at', 'desc')->get(), $limit);

        return $data;
    }

    public function delete($id)
    {
        $data = Mading::find($id);

        if (!$data) {
            throw new Exception("Data not found", 404);
        }

        if (auth()->user()->id !== $data->user_id && auth()->user()->role->name != 'admin') {
            throw new Exception("You don't have permission to access this data", 403);
        }

        $data->delete();
    }
}
