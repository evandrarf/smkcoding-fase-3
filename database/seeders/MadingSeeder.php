<?php

namespace Database\Seeders;

use App\Models\Mading;
use Illuminate\Database\Seeder;

class MadingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Mading::factory()->count(40)->create();
    }
}
