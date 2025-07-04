<?php
include "koneksi.php";
session_start();

// Validasi slug
if (!isset($_GET['slug']) || empty($_GET['slug'])) {
    echo "<script>alert('Artikel tidak ditemukan.'); window.location='index.php';</script>";
    exit;
}

$slug = mysqli_real_escape_string($db, $_GET['slug']);

// Cek apakah artikel ada
$sql = "SELECT * FROM tbl_artikel WHERE slug = '$slug' LIMIT 1";
$query = mysqli_query($db, $sql);
$data = mysqli_fetch_assoc($query);

if (!$data) {
    echo "<script>alert('Artikel tidak ditemukan.'); window.location='index.php';</script>";
    exit;
}

// Tambahkan view (hanya sekali per sesi per artikel)
$session_key = 'viewed_' . $data['id_artikel'];
unset($_SESSION[$session_key]);

if (!isset($_SESSION[$session_key])) {
    mysqli_query($db, "UPDATE tbl_artikel SET views = views + 1 WHERE id_artikel = " . $data['id_artikel']);
    $_SESSION[$session_key] = true;
}
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title><?php echo htmlspecialchars($data['nama_artikel']); ?> | Artikel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class'
        }
    </script>
</head>

<body class="bg-blue-50 dark:bg-gray-900 dark:text-white min-h-screen font-sans">

    <!-- Header -->
    <header class="bg-blue-900 dark:bg-gray-800 text-white text-center py-6 shadow relative">
        <h1 class="text-3xl font-bold">📘 Detail Artikel</h1>
        <button id="toggle-dark" class="absolute top-4 right-6 text-white dark:text-yellow-300">🌃</button>
    </header>

    <!-- Main Content -->
    <main class="max-w-4xl mx-auto bg-white dark:bg-gray-800 shadow rounded-lg p-6 mt-10">
        <h2 class="text-2xl font-bold text-blue-800 dark:text-yellow-300 mb-2"><?php echo htmlspecialchars($data['nama_artikel']); ?></h2>
        <p class="text-sm text-gray-500 dark:text-gray-300 mb-4">
            <?php echo date('d M Y', strtotime($data['created_at'])); ?> |
            👁️ Dilihat <?php echo $data['views']; ?>x
        </p>
        <div class="text-lg leading-relaxed text-gray-800 dark:text-gray-100">
            <?php echo nl2br($data['isi_artikel']); ?>
        </div>

        <!-- Tombol Bagikan -->
        <div class="mt-6 border-t pt-4">
            <p class="text-sm mb-2">Bagikan artikel ini:</p>
            <div class="flex gap-3">
                <a href="https://wa.me/?text=<?php echo urlencode('Baca artikel ini: http://localhost/project/view_artikel.php?slug=' . $data['slug']); ?>"
                    target="_blank" class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600 text-sm">WhatsApp</a>
                <button onclick="copyLink()" class="bg-gray-300 text-black px-3 py-1 rounded hover:bg-gray-400 text-sm">Copy Link</button>
            </div>
        </div>

        <!-- Artikel Terkait -->
        <h3 class="mt-10 text-lg font-semibold text-blue-700 dark:text-yellow-300">📌 Artikel Terkait</h3>
        <ul class="list-disc list-inside mt-3 space-y-1 text-sm">
            <?php
            $idNow = $data['id_artikel'];
            $related = mysqli_query($db, "SELECT * FROM tbl_artikel WHERE id_artikel != '$idNow' ORDER BY RAND() LIMIT 3");
            while ($rel = mysqli_fetch_assoc($related)) {
                echo "<li><a href='view_artikel.php?slug={$rel['slug']}' class='text-blue-600 dark:text-yellow-300 hover:underline'>" . htmlspecialchars($rel['nama_artikel']) . "</a></li>";
            }
            ?>
        </ul>

        <!-- Kembali -->
        <div class="mt-6">
            <a href="index.php" class="text-blue-600 dark:text-yellow-300 hover:underline text-sm">← Kembali ke daftar artikel</a>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-blue-800 dark:bg-gray-800 text-white text-center py-4 mt-12 shadow-inner">
        &copy; <?php echo date('Y'); ?> | Created by <span class="font-semibold">Triasti Meisya Dewi</span>
    </footer>

    <script>
        function copyLink() {
            navigator.clipboard.writeText(window.location.href);
            alert('Link artikel disalin!');
        }

        document.getElementById('toggle-dark').addEventListener('click', function() {
            document.body.classList.toggle('dark');
        });
    </script>
</body>

</html>