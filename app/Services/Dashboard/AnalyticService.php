<?php

namespace App\Services\Dashboard;

use App\Actions\Utility\PaginateCollection;
use App\Models\Mading;
use App\Models\MadingVisit;
use Carbon\Carbon;

class AnalyticService
{
    public function getMadingVisitorChart($request)
    {
        $data = [];

        $query = MadingVisit::query()->with('mading');

        $start_date = $request->has('start_date') && $request->start_date != null ? $request->start_date : Carbon::now();
        $end_date = $request->has('end_date') && $request->end_date != null ? $request->end_date : $request->start_date;

        $start_date_format = Carbon::parse($start_date)->format('Y-m-d');
        $end_date_format = Carbon::parse($end_date)->format('Y-m-d');

        $query = $query->whereDate('created_at', '>=', $start_date_format)->whereDate('created_at', '<=', $end_date_format);

        $data['total'] = $query->count();

        $raw = $query->get()->groupBy('mading_id');

        foreach ($raw as $key => $value) {
            if ($value->count() == 0) {
                continue;
            }

            $data['data'][] = [
                'mading_id' => $key,
                'mading_title' => $value->first()->mading->title,
                'visitor' => $value->count(),
                'percentage' => round($value->count() / $data['total'] * 100, 2),
            ];
        }

        if (isset($data['data']) && count($data['data']) > 5) {
            $data['data'] = collect($data['data'])->sortByDesc('visitor')->toArray();
            $data['data'] = array_slice($data['data'], 0, 5);

            $data['data'][] = [
                'mading_id' => null,
                'mading_title' => 'Other',
                'visitor' => $data['total'] - array_sum(array_column($data['data'], 'visitor')),
                'percentage' => round(($data['total'] - array_sum(array_column($data['data'], 'visitor'))) / $data['total'] * 100, 2),
            ];
        }

        return collect($data);
    }

    public function getData($request)
    {
        $start_date = $request->has('start_date') && $request->start_date != null ? $request->start_date : Carbon::now();
        $end_date = $request->has('end_date') && $request->end_date != null ? $request->end_date : $request->start_date;

        $start_date_format = Carbon::parse($start_date)->format('Y-m-d');
        $end_date_format = Carbon::parse($end_date)->format('Y-m-d');

        $query = Mading::query()->whereHas('visitors', function ($q) use ($start_date_format, $end_date_format) {
            $q->whereDate('created_at', '>=', $start_date_format)->whereDate('created_at', '<=', $end_date_format);
        })->with('visitors')->withCount(['visitors', 'author']);

        $paginateCollection = new PaginateCollection();

        $limit = $request->has('limit') && $request->limit != null ? $request->limit : 10;

        $data = $paginateCollection->handle($query->orderBy('visitors_count', 'desc')->get(), $limit);

        return $data;
    }
}
