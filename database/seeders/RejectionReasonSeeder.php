<?php

namespace Database\Seeders;

use App\Models\Mading;
use App\Models\RejectionReason;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RejectionReasonSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $reasons = [
            'Konten tidak sesuai dengan tema',
            'Konten tidak sesuai dengan kaidah bahas',
            'Konten tidak sesuai dengan kaidah penulisan',
        ];

        $rejectMadings = Mading::where('rejected', true)->pluck('id')->toArray();

        foreach ($rejectMadings as $id) {
            RejectionReason::create([
                'mading_id' => $id,
                'reason' => $reasons[array_rand($reasons)],
            ]);
        }
    }
}
