<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('madings', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('content')->nullable();
            $table->string('thumbnail')->nullable();
            $table->string('slug')->unique();
            $table->enum('status', ['published', 'draft', 'rejected'])->default('draft');
            $table->enum('priority', ['normal', 'important'])->default('normal');
            $table->dateTime('publish_at')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->foreignId('user_id')->constrained('users')->cascadeOnUpdate()->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('madings');
    }
};
