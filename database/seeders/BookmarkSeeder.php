<?php

namespace Database\Seeders;

use App\Models\Bookmark;
use App\Models\Mading;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BookmarkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();
        $madings = Mading::all();

        $numberOfBookmark = 10;

        foreach (range(1, $numberOfBookmark) as $index) {
            $user = $users->random();
            $mading = $madings->random();

            if ($mading->status() !== 'published') {
                continue;
            }

            $existing = Bookmark::where('user_id', $user->id)
                ->where('mading_id', $mading->id)
                ->exists();

            if (!$existing) {
                Bookmark::create([
                    'user_id' => $user->id,
                    'mading_id' => $mading->id,
                ]);
            }
        }
    }
}
