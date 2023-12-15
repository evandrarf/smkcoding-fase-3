<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Stevebauman\Purify\Casts\PurifyHtmlOnGet;

class Mading extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $casts = [
        'published_at' => 'datetime',
        'need_review' => 'boolean',
        'rejected' => 'boolean',
        'content' => PurifyHtmlOnGet::class,
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

    public function rejectionReason()
    {
        return $this->hasOne(RejectionReason::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function thumbnail()
    {
        return $this->belongsTo(File::class, 'thumbnail_id');
    }
}
