<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Resources\ListMadingResource;
use App\Http\Resources\SubmitMadingResource;
use App\Services\Dashboard\BookmarkService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BookmarkController extends Controller
{
    private $bookmarkService;

    public function __construct(BookmarkService $bookmarkService)
    {
        $this->bookmarkService = $bookmarkService;
    }

    public function index()
    {
        return Inertia::render('App/Bookmark/Index');
    }

    public function getData(Request $request)
    {
        $data = $this->bookmarkService->getData($request);

        $res = new ListMadingResource($data);

        return $res;
    }

    public function checkIsBookmarked(Request $request)
    {
        $data = $this->bookmarkService->checkIsBookmarked($request);

        $res = new SubmitMadingResource(['is_bookmarked' => $data], null);

        return $this->respond($res);
    }

    public function toogleBookmark(Request $request)
    {
        $data = $this->bookmarkService->toogleBookmark($request);

        $res = new SubmitMadingResource(null, $data['message']);

        return $this->respond($res);
    }
}
