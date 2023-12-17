<?php

namespace App\Exports;

use App\Models\Mading;
use App\Models\MadingVisit;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class MadingVisitorExport implements FromCollection, WithColumnWidths, WithHeadings, WithMapping
{
    use Exportable;

    public function __construct(private $start_date, private $end_date)
    {
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $data = Mading::query()->whereHas('visitors', function ($q) {
            $q->whereDate('created_at', '>=', $this->start_date)->whereDate('created_at', '<=', $this->end_date);
        })->with(['visitors', 'author'])->withCount(['visitors'])->get();

        return $data;
    }

    public function map($mading): array
    {
        $total = MadingVisit::all()->count();

        $data = [
            $mading->title,
            $mading->author->name,
            $mading->visitors_count,
            round($mading->visitors_count / $total * 100, 2)
        ];

        return $data;
    }

    public function columnWidths(): array
    {
        $data = [
            'A' => 32,
            'B' => 13,
            "C" => 13,
            'D' => 18,
        ];

        return $data;
    }

    public function headings(): array
    {
        return ["Title", "Author", "Visitors Count", "Percentage"];
    }
}
