<?php

namespace App\Http\Resources;

use App\Actions\Utility\GetFile;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ListMadingResource extends ResourceCollection
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
        $getFile = new GetFile();
        $date = Carbon::parse($data->published_at);

        return [
            'id' => $data->id,
            'title' => $data->title,
            'thumbnail' => $getFile->handle($data->thumbnail)->full_path,
            'priority' => ucfirst($data->priority),
            'author' => $data->author->name,
            'slug' => $data->slug,
            'status' => ucfirst($data->status()),
            'published_at' => $date->format("j F Y"),
            'published_at_time' => $date->format("g:i A"),
        ];
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
