<?php

namespace App\Http\Resources;

use App\Actions\Utility\GetFile;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;

class DetailMadingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $getFile = new GetFile();

        $res =  [
            'id' => $this->id,
            'title' => $this->title,
            'thumbnail' => $getFile->handle($this->thumbnail)->full_path,
            'content' => $this->content,
            'priority' => $this->priority,
            'author' => $this->author->name,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];

        if (Auth::user()->id == $this->user_id || Auth::user()->role->name == 'admin') {
            $res['status'] = $this->status;
            $date = Carbon::parse($this->publish_at);
            $res['published_at'] = $date->format("j F Y");
        }

        return $res;
    }
}
