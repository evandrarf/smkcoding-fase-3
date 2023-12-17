<?php

namespace App\Http\Resources;

use App\Actions\Utility\GetFile;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ListUserResource extends ResourceCollection
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
        $res = [
            "id" => $data->id,
            "name" => $data->name,
            "email" => $data->email,
            "role" => $data->role->name,
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
