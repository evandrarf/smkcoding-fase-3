<?php

namespace App\Http\Resources;

use App\Models\MadingVisit;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ListMadingVisitorResurce extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'data' => $this->transformCollection($this->collection),
            "message" => "Success get mading list",
            'meta' => [
                'pagination' => $this->metaData()
            ]
        ];
    }

    private function transformData($data)
    {
        $total = MadingVisit::all()->count();

        $res = [
            "id" => $data->id,
            "title" => $data->title,
            "author" => $data->author->name,
            "visitors_count" => $data->visitors_count,
            'percentage' => round($data->visitors_count / $total * 100, 2),
        ];

        return $res;
    }

    private function transformCollection($collection)
    {
        return $collection->transform(function ($data) {
            return $this->transformData($data);
        });
    }

    private function metaData()
    {
        return [
            "total" => $this->total(),
            "count" => $this->count(),
            "per_page" => (int)$this->perPage(),
            "current_page" => $this->currentPage(),
            "total_pages" => $this->lastPage(),
            "links" => [
                "next" => $this->nextPageUrl()
            ],
        ];
    }
}
