<?php

namespace App\Services\Dashboard;

use App\Models\User;

class UserService
{
    public function updateData($request, $id = null)
    {
        if ($id != null) {
            $user = User::findOrFail($id);
        } else {
            $user = $request->user();
        }

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        if ($request->has('password') && $request->password != null) {
            $user->update([
                'password' => bcrypt($request->password),
            ]);
        }
    }
}
