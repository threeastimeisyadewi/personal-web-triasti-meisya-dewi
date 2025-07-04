-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2025 pada 15.41
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_nabil_d1a240036`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_about`
--

CREATE TABLE `tbl_about` (
  `id_about` int(11) NOT NULL,
  `about` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_about`
--

INSERT INTO `tbl_about` (`id_about`, `about`, `updated_at`) VALUES
(1, 'Halo! Nama saya Triasti Meisya Dewi, seorang mahasiswa dari Fakultas Ilmu Komputer, Program Studi Sistem Informasi di Universitas Subang.\r\n\r\nSaya memiliki ketertarikan yang besar dalam bidang teknologi informasi, khususnya dalam pengembangan sistem informasi, manajemen basis data, serta pemrograman web. Sebagai mahasiswa Sistem Informasi, saya aktif dalam mengembangkan pengetahuan dan keterampilan di bidang analisis sistem, desain antarmuka, serta implementasi teknologi untuk memecahkan masalah nyata di dunia digital.\r\n\r\nSelama masa kuliah, saya telah mengikuti beberapa proyek dan pelatihan, termasuk pembuatan aplikasi berbasis web, penggunaan database MySQL, dan eksplorasi tools seperti PHP, Laravel, dan Tailwind CSS. Saya juga tertarik untuk mendalami dunia data seperti business intelligence, sistem ERP, dan pengembangan sistem berbasis cloud.\r\n\r\nSaya percaya bahwa teknologi dapat menjadi solusi strategis untuk efisiensi dan inovasi dalam berbagai sektor, baik pemerintahan, pendidikan, maupun bisnis. Oleh karena itu, saya terus berusaha mengembangkan diri melalui pembelajaran, kolaborasi tim, dan keterlibatan dalam berbagai kegiatan kampus maupun proyek pribadi.\r\n\r\nKe depannya, saya berharap dapat berkontribusi sebagai profesional IT yang tidak hanya menguasai aspek teknis, tetapi juga memahami kebutuhan bisnis dan mampu menjadi penghubung antara teknologi dan tujuan organisasi.', '2025-06-29 13:24:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_artikel`
--

CREATE TABLE `tbl_artikel` (
  `id_artikel` int(11) NOT NULL,
  `nama_artikel` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `isi_artikel` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `views` int(11) DEFAULT 0,
  `author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_artikel`
--

INSERT INTO `tbl_artikel` (`id_artikel`, `nama_artikel`, `slug`, `isi_artikel`, `created_at`, `views`, `author`) VALUES
(5, 'tes', 'tes', '<p>hallo</p>', '2025-06-29 15:17:54', 1, 'admin'),
(6, 'Database', 'database', '<h2 data-start=\"162\" data-end=\"227\"><strong data-start=\"165\" data-end=\"227\">Mengenal Database: Fondasi Sistem Informasi di Era Digital</strong></h2>\r\n<p data-start=\"229\" data-end=\"579\">Di tengah perkembangan teknologi informasi yang pesat, database menjadi salah satu elemen paling fundamental dalam pengelolaan data. Hampir semua sistem informasi yang kita gunakan, mulai dari aplikasi media sosial, layanan perbankan digital, hingga sistem akademik di perguruan tinggi, bergantung pada keberadaan database yang andal dan terstruktur.</p>\r\n<h3 data-start=\"581\" data-end=\"606\"><strong data-start=\"585\" data-end=\"606\">Apa Itu Database?</strong></h3>\r\n<p data-start=\"608\" data-end=\"909\">Secara sederhana, <strong data-start=\"626\" data-end=\"638\">database</strong> adalah kumpulan data yang terorganisir secara sistematis dan dapat diakses, dikelola, serta diperbarui dengan mudah. Data dalam database disimpan dalam bentuk tabel, dan hubungan antar data dapat dirancang agar saling terhubung serta efisien dalam pengambilan informasi.</p>\r\n<p data-start=\"911\" data-end=\"1132\">Database dikelola menggunakan sistem yang disebut <strong data-start=\"961\" data-end=\"998\">Database Management System (DBMS)</strong>, seperti MySQL, PostgreSQL, Oracle, dan Microsoft SQL Server. DBMS ini bertugas menyimpan, memanipulasi, dan menjaga integritas data.</p>\r\n<h3 data-start=\"1134\" data-end=\"1162\"><strong data-start=\"1138\" data-end=\"1162\">Jenis-Jenis Database</strong></h3>\r\n<p data-start=\"1164\" data-end=\"1220\">Beberapa jenis database yang umum digunakan antara lain:</p>\r\n<ol data-start=\"1222\" data-end=\"1864\">\r\n<li data-start=\"1222\" data-end=\"1364\">\r\n<p data-start=\"1225\" data-end=\"1364\"><strong data-start=\"1225\" data-end=\"1248\">Relational Database</strong><br data-start=\"1248\" data-end=\"1251\">Data disimpan dalam bentuk tabel dan saling berhubungan menggunakan relasi. Contoh: MySQL, PostgreSQL, SQLite.</p>\r\n</li>\r\n<li data-start=\"1366\" data-end=\"1575\">\r\n<p data-start=\"1369\" data-end=\"1575\"><strong data-start=\"1369\" data-end=\"1404\">Non-Relational (NoSQL) Database</strong><br data-start=\"1404\" data-end=\"1407\">Digunakan untuk data yang tidak terstruktur atau semi-terstruktur. Cocok untuk aplikasi berskala besar dengan kebutuhan fleksibel. Contoh: MongoDB, Redis, Cassandra.</p>\r\n</li>\r\n<li data-start=\"1577\" data-end=\"1723\">\r\n<p data-start=\"1580\" data-end=\"1723\"><strong data-start=\"1580\" data-end=\"1598\">Cloud Database</strong><br data-start=\"1598\" data-end=\"1601\">Database yang disimpan di server cloud dan dapat diakses secara online. Contoh: Firebase, Amazon RDS, Google Cloud SQL.</p>\r\n</li>\r\n<li data-start=\"1725\" data-end=\"1864\">\r\n<p data-start=\"1728\" data-end=\"1864\"><strong data-start=\"1728\" data-end=\"1752\">Distributed Database</strong><br data-start=\"1752\" data-end=\"1755\">Data disimpan di beberapa lokasi fisik yang terpisah, namun tetap terkoneksi sebagai satu kesatuan sistem.</p>\r\n</li>\r\n</ol>\r\n<h3 data-start=\"1866\" data-end=\"1901\"><strong data-start=\"1870\" data-end=\"1901\">Fungsi dan Manfaat Database</strong></h3>\r\n<p data-start=\"1903\" data-end=\"1990\">Database memiliki peran penting dalam berbagai aspek teknologi informasi, di antaranya:</p>\r\n<ul data-start=\"1992\" data-end=\"2497\">\r\n<li data-start=\"1992\" data-end=\"2097\">\r\n<p data-start=\"1994\" data-end=\"2097\"><strong data-start=\"1994\" data-end=\"2026\">Penyimpanan Data Terstruktur</strong><br data-start=\"2026\" data-end=\"2029\">Menyimpan data dalam bentuk tabel yang mudah diakses dan dikelola.</p>\r\n</li>\r\n<li data-start=\"2101\" data-end=\"2238\">\r\n<p data-start=\"2103\" data-end=\"2238\"><strong data-start=\"2103\" data-end=\"2132\">Akses Data Cepat dan Aman</strong><br data-start=\"2132\" data-end=\"2135\">Menyediakan mekanisme query (seperti SQL) untuk mencari dan menampilkan data secara efisien dan aman.</p>\r\n</li>\r\n<li data-start=\"2240\" data-end=\"2346\">\r\n<p data-start=\"2242\" data-end=\"2346\"><strong data-start=\"2242\" data-end=\"2262\">Integrasi Sistem</strong><br data-start=\"2262\" data-end=\"2265\">Database memungkinkan sistem yang berbeda saling berbagi data secara konsisten.</p>\r\n</li>\r\n<li data-start=\"2348\" data-end=\"2497\">\r\n<p data-start=\"2350\" data-end=\"2497\"><strong data-start=\"2350\" data-end=\"2381\">Skalabilitas dan Redundansi</strong><br data-start=\"2381\" data-end=\"2384\">Database modern mendukung pertumbuhan data besar (big data) dan backup otomatis untuk menjaga keandalan sistem.</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"2499\" data-end=\"2532\"><strong data-start=\"2503\" data-end=\"2532\">Contoh Penerapan Database</strong></h3>\r\n<ol data-start=\"2534\" data-end=\"2845\">\r\n<li data-start=\"2534\" data-end=\"2601\">\r\n<p data-start=\"2537\" data-end=\"2601\"><strong data-start=\"2537\" data-end=\"2551\">E-Commerce</strong>: Menyimpan data produk, transaksi, dan pelanggan.</p>\r\n</li>\r\n<li data-start=\"2602\" data-end=\"2676\">\r\n<p data-start=\"2605\" data-end=\"2676\"><strong data-start=\"2605\" data-end=\"2618\">Perbankan</strong>: Mengelola data rekening, transaksi, dan riwayat nasabah.</p>\r\n</li>\r\n<li data-start=\"2677\" data-end=\"2765\">\r\n<p data-start=\"2680\" data-end=\"2765\"><strong data-start=\"2680\" data-end=\"2694\">Pendidikan</strong>: Sistem akademik untuk menyimpan data mahasiswa, nilai, dan kurikulum.</p>\r\n</li>\r\n<li data-start=\"2766\" data-end=\"2845\">\r\n<p data-start=\"2769\" data-end=\"2845\"><strong data-start=\"2769\" data-end=\"2782\">Kesehatan</strong>: Sistem rekam medis digital pasien di rumah sakit atau klinik.</p>\r\n</li>\r\n</ol>\r\n<h3 data-start=\"2847\" data-end=\"2865\"><strong data-start=\"2851\" data-end=\"2865\">Kesimpulan</strong></h3>\r\n<p data-start=\"2867\" data-end=\"3284\">Database merupakan komponen inti dari hampir semua sistem berbasis digital. Dengan kemampuan menyimpan, mengelola, dan mengakses data secara efisien, database membantu organisasi dalam mengambil keputusan yang berbasis data (data-driven decision). Pemahaman dasar tentang database menjadi keterampilan penting, terutama bagi para profesional di bidang teknologi informasi, bisnis digital, dan sistem manajemen modern.</p>', '2025-06-29 15:20:12', 1, 'admin'),
(7, 'Developer', 'developer', '<h2 data-start=\"198\" data-end=\"257\"><strong data-start=\"201\" data-end=\"257\">Peran dan Tantangan Seorang Developer di Era Digital</strong></h2>\r\n<p data-start=\"259\" data-end=\"749\">Di tengah pesatnya perkembangan teknologi informasi, peran seorang developer menjadi semakin vital dalam berbagai sektor kehidupan. Developer, atau yang biasa dikenal sebagai pengembang perangkat lunak, adalah profesi yang bertanggung jawab dalam menciptakan, mengembangkan, dan memelihara sistem aplikasi, situs web, hingga perangkat lunak yang kita gunakan sehari-hari. Dari aplikasi perbankan, media sosial, hingga sistem informasi rumah sakit&mdash;semuanya adalah hasil karya para developer.</p>\r\n<h3 data-start=\"751\" data-end=\"780\"><strong data-start=\"755\" data-end=\"780\">Jenis-Jenis Developer</strong></h3>\r\n<p data-start=\"782\" data-end=\"857\">Dalam dunia pengembangan, terdapat beberapa spesialisasi yang umum dikenal:</p>\r\n<ol data-start=\"859\" data-end=\"1599\">\r\n<li data-start=\"859\" data-end=\"1073\">\r\n<p data-start=\"862\" data-end=\"1073\"><strong data-start=\"862\" data-end=\"885\">Front-End Developer</strong>: Fokus pada bagian tampilan (user interface) dan interaksi pengguna. Mereka bekerja dengan HTML, CSS, dan JavaScript untuk memastikan tampilan aplikasi atau website menarik dan responsif.</p>\r\n</li>\r\n<li data-start=\"1074\" data-end=\"1232\">\r\n<p data-start=\"1077\" data-end=\"1232\"><strong data-start=\"1077\" data-end=\"1099\">Back-End Developer</strong>: Bertanggung jawab atas logika, server, dan database. Mereka menggunakan bahasa pemrograman seperti PHP, Python, Java, atau Node.js.</p>\r\n</li>\r\n<li data-start=\"1233\" data-end=\"1360\">\r\n<p data-start=\"1236\" data-end=\"1360\"><strong data-start=\"1236\" data-end=\"1260\">Full-Stack Developer</strong>: Menguasai baik sisi front-end maupun back-end, sehingga mampu menangani proyek secara keseluruhan.</p>\r\n</li>\r\n<li data-start=\"1361\" data-end=\"1486\">\r\n<p data-start=\"1364\" data-end=\"1486\"><strong data-start=\"1364\" data-end=\"1384\">Mobile Developer</strong>: Khusus mengembangkan aplikasi untuk perangkat mobile, seperti Android (Java/Kotlin) dan iOS (Swift).</p>\r\n</li>\r\n<li data-start=\"1487\" data-end=\"1599\">\r\n<p data-start=\"1490\" data-end=\"1599\"><strong data-start=\"1490\" data-end=\"1508\">Game Developer</strong>: Berfokus pada pembuatan permainan digital, baik untuk platform mobile, PC, maupun konsol.</p>\r\n</li>\r\n</ol>\r\n<h3 data-start=\"1601\" data-end=\"1642\"><strong data-start=\"1605\" data-end=\"1642\">Tantangan yang Dihadapi Developer</strong></h3>\r\n<p data-start=\"1644\" data-end=\"1875\">Menjadi developer bukanlah hal yang mudah. Selain keterampilan teknis, seorang developer dituntut untuk memiliki pola pikir logis, ketekunan, dan kemampuan belajar yang tinggi. Berikut beberapa tantangan utama yang sering dihadapi:</p>\r\n<ul data-start=\"1877\" data-end=\"2537\">\r\n<li data-start=\"1877\" data-end=\"2043\">\r\n<p data-start=\"1879\" data-end=\"2043\"><strong data-start=\"1879\" data-end=\"1914\">Teknologi yang Cepat Berkembang</strong>: Framework dan bahasa pemrograman terus berkembang. Seorang developer harus selalu mengikuti tren terbaru agar tidak tertinggal.</p>\r\n</li>\r\n<li data-start=\"2044\" data-end=\"2195\">\r\n<p data-start=\"2046\" data-end=\"2195\"><strong data-start=\"2046\" data-end=\"2063\">Bug dan Error</strong>: Kesalahan dalam baris kode dapat menyebabkan kegagalan sistem. Mendeteksi dan memperbaiki bug memerlukan ketelitian dan kesabaran.</p>\r\n</li>\r\n<li data-start=\"2196\" data-end=\"2387\">\r\n<p data-start=\"2198\" data-end=\"2387\"><strong data-start=\"2198\" data-end=\"2216\">Kolaborasi Tim</strong>: Dalam proyek besar, developer harus mampu bekerja sama dengan tim lain seperti desainer, analis, dan project manager. Komunikasi yang buruk bisa menghambat proses kerja.</p>\r\n</li>\r\n<li data-start=\"2388\" data-end=\"2537\">\r\n<p data-start=\"2390\" data-end=\"2537\"><strong data-start=\"2390\" data-end=\"2421\">Deadline dan Tekanan Proyek</strong>: Proyek dengan tenggat waktu ketat seringkali membuat developer harus bekerja lembur atau mengalami tekanan mental.</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"2539\" data-end=\"2584\"><strong data-start=\"2543\" data-end=\"2584\">Peran Penting dalam Inovasi Teknologi</strong></h3>\r\n<p data-start=\"2586\" data-end=\"2720\">Developer merupakan motor penggerak inovasi digital. Mereka berperan penting dalam transformasi digital di berbagai industri, seperti:</p>\r\n<ul data-start=\"2722\" data-end=\"3068\">\r\n<li data-start=\"2722\" data-end=\"2807\">\r\n<p data-start=\"2724\" data-end=\"2807\"><strong data-start=\"2724\" data-end=\"2738\">Pendidikan</strong>: Membangun platform e-learning dan aplikasi pembelajaran interaktif.</p>\r\n</li>\r\n<li data-start=\"2808\" data-end=\"2907\">\r\n<p data-start=\"2810\" data-end=\"2907\"><strong data-start=\"2810\" data-end=\"2823\">Kesehatan</strong>: Mengembangkan sistem rekam medis elektronik dan aplikasi konsultasi dokter online.</p>\r\n</li>\r\n<li data-start=\"2908\" data-end=\"2978\">\r\n<p data-start=\"2910\" data-end=\"2978\"><strong data-start=\"2910\" data-end=\"2920\">Bisnis</strong>: Membuat sistem manajemen inventori, CRM, dan e-commerce.</p>\r\n</li>\r\n<li data-start=\"2979\" data-end=\"3068\">\r\n<p data-start=\"2981\" data-end=\"3068\"><strong data-start=\"2981\" data-end=\"2997\">Pemerintahan</strong>: Mendorong transparansi dan efisiensi melalui sistem informasi publik.</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"3070\" data-end=\"3088\"><strong data-start=\"3074\" data-end=\"3088\">Kesimpulan</strong></h3>\r\n<p data-start=\"3090\" data-end=\"3590\">Profesi developer tidak hanya soal menulis kode, tetapi juga tentang menyelesaikan masalah, menciptakan solusi, dan memberikan dampak nyata bagi masyarakat. Di era digital saat ini, kebutuhan akan developer semakin meningkat seiring dengan berkembangnya teknologi. Oleh karena itu, menjadi developer adalah pilihan karier yang menjanjikan namun juga menantang. Bagi siapa pun yang ingin terjun di dunia ini, persiapkan diri dengan pengetahuan teknis, semangat belajar, dan kemampuan berpikir kreatif.</p>', '2025-06-29 15:29:11', 1, 'Editor'),
(9, 'Test Dong', 'test-dong', '<p>hallo</p>\r\n<p>&nbsp;</p>', '2025-06-29 15:34:22', 0, 'Editor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gallery`
--

CREATE TABLE `tbl_gallery` (
  `id_gallery` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_gallery`
--

INSERT INTO `tbl_gallery` (`id_gallery`, `judul`, `foto`, `uploaded_at`) VALUES
(3, 'Foto 1', 'img_68614a3c828ec.jpg', '2025-06-29 14:14:20'),
(4, 'Foto 2', 'img_68614a4d3f2a5.jpg', '2025-06-29 14:14:37'),
(5, 'Foto 3', 'img_68614a5f01291.jpg', '2025-06-29 14:14:55'),
(6, 'Foto 4', 'img_68614a6fbfad0.jpg', '2025-06-29 14:15:11'),
(7, 'Foto 5', 'img_68614a83c54d4.jpg', '2025-06-29 14:15:31'),
(8, 'Foto 6', 'img_68614a9889189.jpg', '2025-06-29 14:15:52'),
(9, 'Foto 7', 'img_68614aab9347f.jpg', '2025-06-29 14:16:11'),
(10, 'Foto 8', 'img_68614ac2341f9.jpg', '2025-06-29 14:16:34'),
(11, 'Foto 9', 'img_68614ad4eb2dc.jpg', '2025-06-29 14:16:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','editor','viewer') DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'admin'),
(2, 'asti', 'asti', 'admin'),
(3, 'Editor', 'editor', 'editor');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_about`
--
ALTER TABLE `tbl_about`
  ADD PRIMARY KEY (`id_about`);

--
-- Indeks untuk tabel `tbl_artikel`
--
ALTER TABLE `tbl_artikel`
  ADD PRIMARY KEY (`id_artikel`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indeks untuk tabel `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_about`
--
ALTER TABLE `tbl_about`
  MODIFY `id_about` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_artikel`
--
ALTER TABLE `tbl_artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
