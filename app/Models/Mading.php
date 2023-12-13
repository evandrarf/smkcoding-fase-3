<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mading extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $casts = [
        'published_at' => 'datetime',
        'need_review' => 'boolean',
        'rejected' => 'boolean',
    ];

    public function status()
    {
        if ($this->published_at <= now() && !$this->rejected && !$this->need_review) {
            return 'published';
        } else if ($this->rejected) {
            return 'rejected';
        } else if ($this->need_review) {
            return 'need review';
        } else {
            return 'draft';
        }
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
