<?php

namespace App\Http\Middleware;

use App\Actions\Utility\GetAdminSidebarMenu;
use App\Actions\Utility\GetNavbarMenu;
use App\Helpers\Menu\MenuItem;
use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that's loaded on the first page visit.
     *
     * @see https://inertiajs.com/server-side-setup#root-template
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determines the current asset version.
     *
     * @see https://inertiajs.com/asset-versioning
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    /**
     * Defines the props that are shared by default.
     *
     * @see https://inertiajs.com/shared-data
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function share(Request $request): array
    {
        $menus = (new GetNavbarMenu())->handle();
        $adminMenus = (new GetAdminSidebarMenu())->handle();
        $activeMenu = (new MenuItem($menus))->handle();

        return array_merge(parent::share($request), [
            "app_name" => config("app.name"),
            "user" => fn () => $request->user()
                ? $request->user()->only("id", "name", "email")
                : null,
            "menus" => $activeMenu,
            "admin_menus" => $request->user()?->hasRole("admin") ? $adminMenus : [],
        ]);
    }
}
