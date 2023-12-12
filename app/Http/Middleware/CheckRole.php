<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, string ...$role): Response
    {
        if (!in_array($request->user()->role->name, $role)) {
            return response()->json([
                'message' => 'You are not authorized to access this resource'
            ], 403);
        }

        return $next($request);
    }
}
