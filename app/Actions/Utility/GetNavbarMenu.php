<?php

namespace App\Actions\Utility;

class GetNavbarMenu
{
    public function handle()
    {
        return [
            [
                "name" => "Home",
                "url" => route("app.home"),
                "icon" => "Home",
                "can" => ["view_mading"]
            ],
            [
                "name" => "Mading",
                "url" => route("app.madings.index"),
                "icon" => "NewsPaper",
                "can" => ["view_mading"]
            ],
            [
                "name" => "Create",
                "url" => route("app.madings.create"),
                "icon" => "Plus",
                "can" => ["create_mading"]
            ],
            [
                "name" => "Bookmarks",
                "url" => "https://localhost:8000/bookmarks",
                "icon" => "Bookmark",
                "can" => ["view_mading"]
            ],
            [
                "name" => "Profile",
                "url" => "https://localhost:8000/profile",
                "icon" => "User",
                "can" => []
            ],
        ];
    }
}
