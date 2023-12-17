<?php

namespace App\Http\Middleware;

use App\Models\Mading;
use App\Models\MadingVisit as ModelsMadingVisit;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class MadingVisitCounter
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if ($request->route()->named('app.madings.detail') && auth()->check() && auth()->user()->role->name === 'user') {
            $mading = Mading::where('slug', $request->route('slug'))->first();

            $exist = ModelsMadingVisit::where('mading_id', $mading->id)->where('user_id', $request->user()->id)->count() > 0;

            if ($mading && $mading->status() === 'published' && !$exist) {

                $user = $request->user();

                ModelsMadingVisit::create([
                    'mading_id' => $mading->id,
                    'user_id' => $user->id,
                ]);
            }
        }

        return $next($request);
    }
}
