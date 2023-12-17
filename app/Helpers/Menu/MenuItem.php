<?php

namespace App\Helpers\Menu;

use Illuminate\Support\Facades\Auth;

class MenuItem
{
    private $menus;

    public function __construct(array $menus)
    {
        $this->menus = $menus;
    }

    public function filter($menu)
    {
        if (!Auth::check()) {
            return false;
        }

        if (!isset($menu["can"]) || empty($menu["can"])) {
            return true;
        }

        if (is_string($menu["can"])) {
            return Auth::check() && Auth::user()->can($menu["can"]);
        }

        $return = [];

        foreach ($menu["can"] as $key => $permission) {
            if (!Auth::user()->can($permission)) {
                $return[$key] = false;
            } else {
                $return[$key] = true;
            }
        }

        return !in_array(false, $return);
    }

    public function handle()
    {
        $activeMenus = array_values(array_filter($this->menus, [$this, "filter"]));

        $menus = array_map(function ($m) {
            $menu["name"] = $m["name"];
            $menu["url"] = $m["url"];
            $menu["icon"] = $m["icon"];

            return $menu;
        }, $activeMenus);


        return $menus;
    }
}
