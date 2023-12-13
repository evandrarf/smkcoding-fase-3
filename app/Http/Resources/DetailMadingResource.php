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

        $date = Carbon::parse($this->published_at);

        $res =  [
            'id' => $this->id,
            'title' => $this->title,
            'thumbnail' => $getFile->handle($this->thumbnail)->full_path,
            'content' => $this->content,
            'priority' => ucfirst($this->priority),
            'author' => $this->author->name,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'published_at' => $date->format("j F Y")
        ];
        $res['published_at_time'] = $date->format("g:i A");

        if (Auth::check() && (Auth::user()->id == $this->user_id || Auth::user()->role->name == 'admin')) {
            $res['status'] = ucfirst($this->status());
            $res['is_schedule'] = $this->published_at > now();
        }

        return $res;
    }
}
