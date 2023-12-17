-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2023 pada 14.23
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smkcoding`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `mading_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `mading_id`, `created_at`, `updated_at`) VALUES
(1, 2, 30, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(2, 1, 30, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(3, 4, 30, '2023-12-17 08:04:28', '2023-12-17 08:04:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path_name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `files`
--

INSERT INTO `files` (`id`, `url`, `file_name`, `extension`, `size`, `created_at`, `updated_at`, `path_name`, `deleted_at`) VALUES
(1, 'http://localhost:8000', 'default', 'png', 155, '2023-12-17 07:06:30', '2023-12-17 07:06:30', '/storage/file/default.png', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `madings`
--

CREATE TABLE `madings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `need_review` tinyint(1) NOT NULL DEFAULT 1,
  `rejected` tinyint(1) NOT NULL DEFAULT 0,
  `priority` enum('normal','important') NOT NULL DEFAULT 'normal',
  `published_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `madings`
--

INSERT INTO `madings` (`id`, `title`, `content`, `thumbnail`, `slug`, `need_review`, `rejected`, `priority`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Officia dicta minus at qui et ipsam aut eligendi.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'autem-nihil-voluptas-sit-vel-veniam-corporis-atque', 0, 1, 'important', '2023-12-15 09:10:52', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(2, 'Ea qui ut eligendi error sunt.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'alias-ipsam-ea-voluptatem-sed-ut', 0, 1, 'normal', '2023-12-18 14:59:30', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(3, 'Non dolore quis et quod repudiandae aut.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'sunt-est-et-rem-saepe-sequi-porro-ut', 0, 1, 'important', '2023-12-17 01:14:15', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(4, 'Totam molestias odit necessitatibus sint vel qui accusamus.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'ratione-sit-iure-iure-blanditiis', 0, 1, 'normal', '2023-12-19 09:00:54', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(5, 'Nam error eaque maxime ut.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'consequatur-in-perferendis-illum-temporibus', 0, 0, 'important', '2023-12-18 02:08:51', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(6, 'Exercitationem voluptatem commodi maxime aperiam eveniet.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'omnis-iusto-consectetur-est-accusamus-id-dicta-ipsum-veniam', 0, 0, 'important', '2023-12-15 12:56:32', 1, '2023-12-17 07:06:31', '2023-12-17 09:46:24'),
(7, 'Nam praesentium accusamus quidem cum.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'quod-consequatur-mollitia-et-eaque-quia-enim', 0, 0, 'important', '2023-12-15 03:55:12', 1, '2023-12-17 07:06:31', '2023-12-17 09:46:29'),
(8, 'Hic sunt dolores tempore iusto commodi.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'ex-eaque-eius-ducimus-dolor-numquam-ut', 1, 0, 'normal', '2023-12-20 06:58:30', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(9, 'Libero est in eveniet labore omnis doloribus.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'porro-dolores-cumque-quia-saepe-voluptatem-quos-quis', 0, 0, 'important', '2023-12-15 00:21:25', 1, '2023-12-17 07:06:31', '2023-12-17 13:20:04'),
(10, 'Et assumenda voluptatibus et soluta ut quod qui.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'quos-temporibus-natus-autem-dicta-sequi-velit', 0, 1, 'normal', '2023-12-17 00:54:30', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(11, 'Enim provident sequi molestiae distinctio.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'hic-doloremque-magni-dolore-laudantium-debitis-iste-quisquam', 1, 0, 'normal', '2023-12-18 13:55:51', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(12, 'Distinctio tempore et et quisquam.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'cumque-quo-qui-molestiae-quis-sint-earum-hic-voluptatem', 1, 0, 'important', '2023-12-19 14:43:25', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(13, 'Harum autem et delectus aperiam enim est.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'unde-eos-et-id', 0, 1, 'normal', '2023-12-17 03:33:12', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(14, 'Reiciendis recusandae a ea sapiente.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'reiciendis-esse-reprehenderit-a-quia-saepe-soluta-consequatur', 0, 1, 'important', '2023-12-20 02:26:27', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(15, 'Ducimus at natus aut eos omnis sit qui.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'voluptatibus-laboriosam-iste-aut-numquam-veritatis-eum', 0, 1, 'important', '2023-12-15 04:55:01', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(16, 'Et voluptatem unde eligendi molestiae aut magni adipisci.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'eos-illo-harum-aut-impedit-excepturi-accusantium-fuga', 0, 1, 'normal', '2023-12-15 04:55:55', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(17, 'Dolorum non sit ullam dolores.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'est-assumenda-vero-nesciunt-fugiat-deserunt-earum-ducimus', 0, 1, 'normal', '2023-12-18 05:15:14', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(18, 'In qui est eveniet ipsum enim nemo rerum.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'voluptatem-molestiae-inventore-placeat-ipsa-quis-quas', 0, 0, 'normal', '2023-12-15 11:18:26', 2, '2023-12-17 07:06:31', '2023-12-17 09:46:26'),
(19, 'Dolorum cum voluptas sit numquam recusandae ipsum neque.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'dignissimos-quis-qui-minus-inventore-ut', 0, 0, 'important', '2023-12-18 22:36:25', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(20, 'Enim ut quam et minus blanditiis.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'suscipit-vel-sit-quis-excepturi-voluptatem-perspiciatis-voluptate', 0, 1, 'important', '2023-12-19 13:27:55', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(21, 'Non autem rerum in sapiente.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'non-distinctio-quia-tempore-non-quaerat-ut-eius', 0, 1, 'important', '2023-12-17 06:13:15', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31');
INSERT INTO `madings` (`id`, `title`, `content`, `thumbnail`, `slug`, `need_review`, `rejected`, `priority`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(22, 'Occaecati minus fugit et impedit sit.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'non-est-sunt-fugiat-consequatur-omnis-dolorem-ut', 1, 0, 'normal', '2023-12-14 18:35:18', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(23, 'Ut itaque et ea reiciendis in.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'repellendus-alias-rem-quo-ad-dolorum-delectus-quam', 0, 0, 'important', '2023-12-17 06:09:43', 1, '2023-12-17 07:06:31', '2023-12-17 08:06:29'),
(24, 'Ut quaerat ut deleniti voluptas pariatur accusantium.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'et-quos-dolorem-ratione-enim-excepturi', 0, 1, 'important', '2023-12-15 02:38:38', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(25, 'Voluptatem nulla ea distinctio ratione adipisci.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'recusandae-tenetur-nihil-blanditiis-ut', 1, 0, 'normal', '2023-12-19 17:55:42', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(26, 'Sit amet magni molestias fuga.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'architecto-voluptates-error-doloribus-corporis', 1, 0, 'normal', '2023-12-18 00:33:01', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(27, 'At aut similique deserunt praesentium praesentium ad.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'et-occaecati-doloribus-assumenda-dolores-ut-iste-eos', 0, 1, 'important', '2023-12-17 16:07:35', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(28, 'Tempore doloribus fugit molestias cumque ducimus aliquid earum.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'odit-ut-eligendi-aspernatur-voluptas-dolorum', 0, 1, 'important', '2023-12-17 09:26:49', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(29, 'Expedita aut non tempora voluptatem aut pariatur.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'quas-iusto-occaecati-dolor-rerum-ab-consectetur', 0, 0, 'important', '2023-12-17 03:40:11', 2, '2023-12-17 07:06:31', '2023-12-17 09:46:17'),
(30, 'Molestias non error recusandae autem harum nesciunt sed ipsam.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'quae-totam-voluptate-quae-modi-quo', 0, 0, 'normal', '2023-12-15 04:46:57', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(31, 'Maxime dolore quibusdam quae deleniti.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'sit-neque-numquam-amet-et-sit', 0, 1, 'important', '2023-12-20 13:46:02', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(32, 'Cum quia sit harum ut.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'neque-animi-ut-eius-maiores-eos-deserunt', 0, 0, 'normal', '2023-12-15 14:00:43', 1, '2023-12-17 07:06:31', '2023-12-17 09:46:20'),
(33, 'Nobis dolorum incidunt quis saepe commodi ea.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'repellat-id-tempore-distinctio-accusantium-voluptates-sit-et', 1, 0, 'normal', '2023-12-14 17:04:15', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(34, 'Aspernatur sapiente rem laudantium velit nihil id.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'non-distinctio-commodi-quia-velit-reiciendis', 0, 0, 'important', '2023-12-18 17:36:34', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(35, 'Praesentium possimus nihil laborum doloremque sunt porro.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'praesentium-quia-fuga-vero-qui-qui-eveniet-voluptatem', 1, 0, 'important', '2023-12-17 12:09:10', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(36, 'Tenetur rerum qui accusamus accusamus.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'fuga-debitis-numquam-quisquam-ipsam-totam-cupiditate-laborum-cupiditate', 1, 0, 'important', '2023-12-19 00:55:37', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(37, 'Sunt voluptates vero ut et.', '<p>Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</p><p><br></p><h2>Definisi dan Konsep Dasar AI</h2><p>AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</p><p><br></p><h2>Penerapan AI di Berbagai Sektor</h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li><li><strong>Pertanian</strong></li></ol><p><br></p><h2>Mendekati Era AI dengan Bijak</h2><p>Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'sunt-voluptates-vero-ut-et', 0, 0, 'normal', '2023-12-17 18:28:00', 1, '2023-12-17 07:06:31', '2023-12-17 13:19:17'),
(38, 'Adipisci tempora ullam non amet quo quos.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'nihil-neque-voluptas-animi', 0, 0, 'normal', '2023-12-18 16:02:00', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(39, 'Corporis sint est quasi magni aut.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'qui-expedita-tenetur-suscipit-illum-ex', 1, 0, 'important', '2023-12-18 20:49:11', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(40, 'Harum est quod qui natus.', '<p><span style=\"color: rgb(55, 65, 81);\">Artificial Intelligence (AI) telah menjadi pusat perhatian dalam dunia teknologi dan bisnis, menjanjikan transformasi besar-besaran dalam cara kita hidup dan bekerja. Dengan kemampuannya untuk memproses data dengan cepat dan belajar dari pola-pola, AI memberikan potensi untuk mengubah paradigma di berbagai industri.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Definisi dan Konsep Dasar AI</span></h2><p><span style=\"color: rgb(55, 65, 81);\">AI merujuk pada sistem komputer yang dapat melakukan tugas yang membutuhkan kecerdasan manusia. Ini mencakup kemampuan untuk belajar, merencanakan, beradaptasi, dan memecahkan masalah. Ada dua jenis utama AI: AI lemah, yang dirancang untuk tugas tertentu, dan AI kuat, yang mampu menyelesaikan tugas umum dengan kecerdasan serupa manusia.</span></p><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Penerapan AI di Berbagai Sektor</span></h2><ol><li><strong>Kesehatan</strong></li><li><strong>Keuangan</strong></li></ol><p><br></p><h2><span style=\"color: var(--tw-prose-bold);\">Mendekati Era AI dengan Bijak</span></h2><p><span style=\"color: rgb(55, 65, 81);\">Meskipun potensi AI sangat besar, tantangan etika dan keamanan juga perlu diperhatikan. Perhatian terhadap privasi data, keadilan algoritma, dan dampak sosial dari penggantian pekerjaan manusia oleh mesin otomatis menjadi sorotan utama.</span></p><p>Seiring AI terus berkembang, kita dapat mengharapkan lebih banyak inovasi yang akan membentuk masa depan kita. Peningkatan kemampuan komputasi, pertumbuhan data, dan pemahaman yang lebih baik tentang cara mengimplementasikan teknologi ini akan membawa AI ke tingkat berikutnya.</p><p>Sementara kita mengeksplorasi potensi luar biasa dari AI, penting untuk terus mendekati teknologi ini dengan kebijaksanaan dan tanggung jawab. Dengan demikian, kita dapat memaksimalkan manfaatnya sambil meminimalkan risiko yang mungkin muncul. Artificial Intelligence bukan hanya tentang teknologi; itu tentang bagaimana kita dapat menggunakannya untuk memajukan kesejahteraan dan kemajuan manusia secara keseluruhan.</p><p><br></p>', '1', 'eum-quis-quae-modi', 1, 0, 'normal', '2023-12-19 22:08:28', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mading_visits`
--

CREATE TABLE `mading_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mading_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mading_visits`
--

INSERT INTO `mading_visits` (`id`, `mading_id`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 30, 3, '2023-12-17 13:15:26', '2023-12-17 13:15:26'),
(13, 23, 3, '2023-12-17 13:15:31', '2023-12-17 13:15:31'),
(14, 29, 3, '2023-12-17 13:15:34', '2023-12-17 13:15:34'),
(15, 6, 3, '2023-12-17 13:15:37', '2023-12-17 13:15:37'),
(16, 7, 3, '2023-12-17 13:15:41', '2023-12-17 13:15:41'),
(17, 18, 3, '2023-12-17 13:15:44', '2023-12-17 13:15:44'),
(18, 29, 4, '2023-12-17 13:16:19', '2023-12-17 13:16:19'),
(19, 29, 5, '2023-12-17 13:17:25', '2023-12-17 13:17:25'),
(20, 9, 5, '2023-12-17 13:20:19', '2023-12-17 13:20:19'),
(21, 30, 5, '2023-12-17 13:20:56', '2023-12-17 13:20:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_12_11_023034_create_roles_table', 1),
(4, '2023_12_11_023406_create_permissions_table', 1),
(5, '2023_12_11_023459_create_role_permission_table', 1),
(6, '2023_12_11_023460_create_users_table', 1),
(7, '2023_12_11_140154_files', 1),
(8, '2023_12_13_185046_create_madings_table', 1),
(9, '2023_12_14_182046_create_rejection_reasons_table', 1),
(10, '2023_12_15_085214_create_bookmarks_table', 1),
(11, '2023_12_17_131850_create_mading_visits_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'create_user', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(2, 'update_user', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(3, 'create_mading', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(4, 'view_mading', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(5, 'view_admin_page', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(6, 'view_bookmarks', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(7, 'view_profile_page', '2023-12-17 07:06:29', '2023-12-17 07:06:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rejection_reasons`
--

CREATE TABLE `rejection_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` text NOT NULL,
  `mading_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rejection_reasons`
--

INSERT INTO `rejection_reasons` (`id`, `reason`, `mading_id`, `created_at`, `updated_at`) VALUES
(1, 'Konten tidak sesuai dengan kaidah bahas', 1, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(2, 'Konten tidak sesuai dengan kaidah bahas', 2, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(3, 'Konten tidak sesuai dengan kaidah bahas', 3, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(4, 'Konten tidak sesuai dengan tema', 4, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(5, 'Konten tidak sesuai dengan kaidah penulisan', 10, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(6, 'Konten tidak sesuai dengan tema', 13, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(7, 'Konten tidak sesuai dengan tema', 14, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(8, 'Konten tidak sesuai dengan kaidah bahas', 15, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(9, 'Konten tidak sesuai dengan kaidah penulisan', 16, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(10, 'Konten tidak sesuai dengan kaidah bahas', 17, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(11, 'Konten tidak sesuai dengan kaidah penulisan', 20, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(12, 'Konten tidak sesuai dengan kaidah bahas', 21, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(13, 'Konten tidak sesuai dengan kaidah bahas', 24, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(14, 'Konten tidak sesuai dengan kaidah penulisan', 27, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(15, 'Konten tidak sesuai dengan kaidah penulisan', 28, '2023-12-17 07:06:31', '2023-12-17 07:06:31'),
(16, 'Konten tidak sesuai dengan kaidah bahas', 31, '2023-12-17 07:06:31', '2023-12-17 07:06:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(2, 'management', '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(3, 'user', '2023-12-17 07:06:29', '2023-12-17 07:06:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 2, 3, NULL, NULL),
(9, 2, 4, NULL, NULL),
(10, 2, 6, NULL, NULL),
(11, 2, 7, NULL, NULL),
(12, 3, 4, NULL, NULL),
(13, 3, 6, NULL, NULL),
(14, 3, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$12$1hwyDM4YjHkO2SOEMoywH.sEvvAGYm.mgabEMdPb0ykZxWV32PMsO', 1, '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(2, 'Management', 'management@gmail.com', '$2y$12$EyBxU35xtx3ExN72G2yN0uZm12lE3Cnt/X4nU4QApOr.8si993Vpu', 2, '2023-12-17 07:06:29', '2023-12-17 07:06:29'),
(3, 'User', 'user@gmail.com', '$2y$12$/DqMp/vLYbIxZ7lZk/xZPODtfnMMEWbUAi.V8SC7.fUeo.M.lkHzW', 3, '2023-12-17 07:06:30', '2023-12-17 07:06:30'),
(4, 'Evandra', 'evandra@gmail.com', '$2y$12$eT3wJrCRrnM5fwrk9Sq8xOcx/VUZOAQUNPuQ54//8B9uJfiQH0JLq', 3, '2023-12-17 08:04:02', '2023-12-17 08:04:02'),
(5, 'Mas Buloh', 'masbuloh@gmail.com', '$2y$12$.PqM0uYG9TFMtrG0.ot3n.XR1XXstIZpVqkI5LK.SlC1WBW1NrBli', 3, '2023-12-17 13:17:07', '2023-12-17 13:17:07');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookmarks_user_id_mading_id_unique` (`user_id`,`mading_id`),
  ADD KEY `bookmarks_mading_id_foreign` (`mading_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `madings`
--
ALTER TABLE `madings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `madings_slug_unique` (`slug`),
  ADD KEY `madings_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `mading_visits`
--
ALTER TABLE `mading_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mading_visits_mading_id_foreign` (`mading_id`),
  ADD KEY `mading_visits_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rejection_reasons_mading_id_foreign` (`mading_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `madings`
--
ALTER TABLE `madings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `mading_visits`
--
ALTER TABLE `mading_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_mading_id_foreign` FOREIGN KEY (`mading_id`) REFERENCES `madings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `madings`
--
ALTER TABLE `madings`
  ADD CONSTRAINT `madings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mading_visits`
--
ALTER TABLE `mading_visits`
  ADD CONSTRAINT `mading_visits_mading_id_foreign` FOREIGN KEY (`mading_id`) REFERENCES `madings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mading_visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  ADD CONSTRAINT `rejection_reasons_mading_id_foreign` FOREIGN KEY (`mading_id`) REFERENCES `madings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
