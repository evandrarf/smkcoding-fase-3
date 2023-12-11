<?php

namespace Database\Seeders;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Database\Seeder;

class RolePermission extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $permissions = [
            'create_user',
            'update_user',
            'create_mading',
            'view_mading',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }

        $roles = [
            'admin',
            'management',
            'user'
        ];

        collect($roles)->map(function ($name) {
            Role::query()->updateOrCreate(compact('name'), compact('name'));
        });

        $allPermissions = Permission::all()->pluck('name')->toArray();

        $roleAdmin = Role::where('name', 'admin')->first();
        $roleAdmin->givePermissionsTo($allPermissions);

        $roleManagement = Role::where('name', 'management')->first();
        $roleManagement->givePermissionsTo(['create_mading']);

        $roleUser = Role::where('name', 'user')->first();
        $roleUser->givePermissionsTo(['view_mading']);
    }
}