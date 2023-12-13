<?php

namespace App\Actions\Utility;

class GetAdminSidebarMenu
{
    public function handle()
    {
        return [
            [
                "name" => "Admin",
                "url" => route("app.admin.index"),
            ],
            [
                "name" => "Mading",
                "url" => route("app.admin.madings.index"),
            ]
        ];
    }
}
