<?php

namespace App\Services\Dashboard;

use App\Actions\Utility\PaginateCollection;
use App\Models\Role;
use App\Models\User;

class UserService
{
    public function getData($request)
    {
        if ($request->user()->role->name !== 'admin' || !auth()->check()) {
            throw new \Exception("You don't have permission to access this data", 403);
        }

        $query = User::query();

        $query->when($request->has('search') && $request->search != null, function ($q) use ($request) {
            $q->where('name', 'like', '%' . $request->search . '%')->orWhere('email', 'like', '%' . $request->search . '%');
        });

        $paginateCollection = new PaginateCollection();

        $limit = $request->has('limit') ? $request->limit : 10;

        $data = $paginateCollection->handle($query->orderBy('created_at', 'desc')->get(), $limit);

        return $data;
    }

    public function createData($request)
    {
        if ($request->user()->role->name !== 'admin' || !auth()->check()) {
            throw new \Exception("You don't have permission to access this data", 403);
        }

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'role_id' => $request->role,
            'password' => bcrypt($request->password),
        ]);
    }

    public function getRoles()
    {
        return Role::get()->pluck('id', 'name');
    }

    public function updateData($request, $id = null)
    {
        if (!auth()->check()) {
            throw new \Exception("You don't have permission to access this data", 403);
        }

        if ($id != null) {
            $user = User::findOrFail($id);
        } else {
            $user = $request->user();
        }

        if (auth()->user()->role->name === 'admin') {
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'role_id' => $request->role,
            ]);
        } else {
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
            ]);
        }

        if ($request->has('password') && $request->password != null) {
            $user->update([
                'password' => bcrypt($request->password),
            ]);
        }
    }

    public function deleteData($id)
    {
        if (!auth()->check()) {
            throw new \Exception("You don't have permission to access this data", 403);
        }

        $user = User::findOrFail($id);

        $user->delete();
    }
}
