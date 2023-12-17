<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MadingVisit extends Model
{
    use HasFactory;

    protected $fillable = [
        'mading_id',
        'user_id',
    ];

    public function mading()
    {
        return $this->belongsTo(Mading::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
