<?php

namespace Database\Seeders;

use App\Models\RejectionReason as ModelsRejectionReason;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RejectionReason extends Seeder
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

        foreach ($reasons as $reason) {
            ModelsRejectionReason::create(compact('reason'));
        }
    }
}
