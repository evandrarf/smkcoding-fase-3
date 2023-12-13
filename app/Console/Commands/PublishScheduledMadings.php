<?php

namespace App\Console\Commands;

use App\Models\Mading;
use Illuminate\Console\Command;

class PublishScheduledMadings extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:publish-scheduled-madings';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Publish scheduled madings';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Mading::query()
            ->where('status', 'draft')
            ->where('published_at', '<=', now())
            ->update(['status' => 'published']);

        $this->info('Scheduled madings published successfully.');
    }
}
