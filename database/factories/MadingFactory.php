<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Mading>
 */
class MadingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $publishedAt = $this->faker->dateTimeBetween('-3 days', '+3 days');
        $need_review = $this->faker->boolean();
        $rejected = $need_review ? false : $this->faker->boolean();
        return [
            'title' => $this->faker->sentence(),
            'content' => '<p><span style="color: rgb(55, 65, 81);">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style="color: var(--tw-prose-bold);">Definisi dan Konsep Dasar AI</span></h2><p><span style="color: rgb(55, 65, 81);">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style="color: var(--tw-prose-bold);">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style="color: var(--tw-prose-bold);">Mendekati Era AI dengan Bijak</span></h2><p><span style="color: rgb(55, 65, 81);">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>',
            'user_id' => $this->faker->numberBetween(1, 2),
            'thumbnail' => 1,
            'slug' => $this->faker->slug(),
            'priority' => $this->faker->randomElement(['important', 'normal']),
            'need_review' => $need_review,
            'rejected' => $rejected,
            'rejection_reason_id' => $rejected ? $this->faker->numberBetween(1, 3) : null,
            'published_at' => $publishedAt,
        ];
    }
}
