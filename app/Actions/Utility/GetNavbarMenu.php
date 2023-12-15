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
                "can" => []
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
                "can" => ["view_bookmarks"]
            ],
            [
                "name" => "Admin",
                "url" => route("app.admin.index"),
                "icon" => "ChartAnalytics",
                "can" => ['view_admin_page']
            ],
            [
                "name" => "Profile",
                "url" => route('app.profile.index'),
                "icon" => "User",
                "can" => ['view_profile_page']
            ],
        ];
    }
}
