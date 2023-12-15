<?php

namespace App\Services\Dashboard;

use App\Actions\Utility\PaginateCollection;
use App\Models\Bookmark;

class BookmarkService
{
    public function getData($request)
    {
        $user = $request->user();

        if (!$user) throw new \Exception("You don't have permission to access this data", 403);

        $bookmarkedMadings = Bookmark::query()
            ->with('mading')
            ->where('user_id', $user->id)
            ->get()->pluck('mading');

        if ($request->has('search') && $request->search != null) {
            $bookmarkedMadings = $bookmarkedMadings->filter(function ($mading) use ($request) {
                return strpos(strtolower($mading->title), strtolower($request->search)) !== false;
            });
        }

        if ($request->has('priority') && $request->priority != null) {
            $bookmarkedMadings = $bookmarkedMadings->filter(function ($mading) use ($request) {
                return $mading->priority == $request->priority;
            });
        }

        $data = [];

        foreach ($bookmarkedMadings as $mading) {
            if ($mading->status() === 'published') {
                $data[] = $mading;
            }
        }

        $paginate = new PaginateCollection();

        $limit = $request->input('limit', 10);

        $data = $paginate->handle(collect($data), $limit);

        return $data;
    }

    public function checkIsBookmarked($request)
    {
        $user = $request->user();

        if (!$user) throw new \Exception("You don't have permission to access this data", 403);

        if (!$request->has('mading_id')) throw new \Exception("Missing mading_id parameter", 400);

        $madingId = $request->mading_id;

        $isBookmarked = Bookmark::where('user_id', $user->id)
            ->where('mading_id', $madingId)
            ->exists();

        return $isBookmarked;
    }

    public function toogleBookmark($request)
    {
        $user = $request->user();

        if (!$user) throw new \Exception("You don't have permission to access this data", 403);

        if (!$request->has('mading_id')) throw new \Exception("Missing mading_id parameter", 400);

        $madingId = $request->mading_id;

        $isBookmarked = Bookmark::where('user_id', $user->id)
            ->where('mading_id', $madingId)
            ->exists();

        if ($isBookmarked) {
            Bookmark::where('user_id', $user->id)
                ->where('mading_id', $madingId)
                ->delete();
            $data['message'] = 'Bookmark removed';
        } else {
            Bookmark::create([
                'user_id' => $user->id,
                'mading_id' => $madingId,
            ]);
            $data['message'] = 'Bookmark added';
        }

        return $data;
    }
}
