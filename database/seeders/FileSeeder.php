<?php

namespace Database\Seeders;

use App\Models\File;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $file = File::create([
            'id' => 1,
            'file_name' => 'default',
            'path_name' => '/storage/file/default.png',
            'extension' => 'png',
            'size' => 155,
            'url' => 'http://localhost:8000',
        ]);
    }
}
