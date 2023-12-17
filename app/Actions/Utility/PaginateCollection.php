<?php

namespace App\Actions\Utility;

use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class PaginateCollection
{
    public function handle($data, $per_page = 5, $options = null)
    {
        //Get current page form url e.g. &page=6
        $currentPage = LengthAwarePaginator::resolveCurrentPage();

        //Create a new Laravel collection from the array data
        $collection = new Collection($data);

        //Slice the collection to get the items to display in current page
        $currentPageResults = $collection->slice(($currentPage - 1) * $per_page, $per_page)->values();

        //Create our paginator and add it to the data array
        $data['results'] = new LengthAwarePaginator($currentPageResults, count($collection), $per_page);


        return $data['results']->setPath(url()->current() . '?' . http_build_query(['per_page' => $per_page]));
    }
}
