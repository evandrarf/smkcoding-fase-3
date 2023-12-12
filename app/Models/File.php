<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class File extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $appends = [
        'full_path'
    ];

    public function getFullPathAttribute()
    {
        return "{$this->url}" . "{$this->path_name}";
    }
}
