<?php

namespace App\Actions\Utility;

use App\Models\File;

class GetFile
{
    public function handle($file)
    {
        $result = null;

        if (is_array($file)) {
            $result = [];
            foreach ($file as $key => $value) {
                $file = File::find($value);
                array_push($result, $file->full_path);
            }
        } else {
            $uploaded = File::find($file);
            $result = $uploaded;
        }

        return $result;
    }
}
