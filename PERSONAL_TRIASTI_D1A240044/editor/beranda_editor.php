<?php
session_start();
if (!isset($_SESSION['username']) || strtolower($_SESSION['role']) !== 'editor') {
    header('Location: ../auth/login.php');
    exit;
}

require_once("../koneksi.php");

$username = $_SESSION['username'];
$sqlUser = "SELECT * FROM tbl_user WHERE username = '$username'";
$queryUser = mysqli_query($db, $sqlUser);
$hasil = mysqli_fetch_array($queryUser);

// Hitung jumlah artikel milik editor ini
$sqlArtikel = "SELECT id_artikel FROM tbl_artikel WHERE author = '$username'";
$jumlah_artikel = mysqli_num_rows(mysqli_query($db, $sqlArtikel));
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Dashboard Editor</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-b from-blue-50 to-blue-100 min-h-screen font-sans">

    <!-- Header -->
    <header class="bg-blue-900 text-white text-center py-6 shadow-md">
        <h1 class="text-3xl font-bold tracking-wide">📝 Dashboard Editor</h1>
    </header>

    <!-- Container -->
    <div class="flex flex-col md:flex-row max-w-7xl mx-auto mt-8 px-4 gap-6">

        <!-- Sidebar -->
        <aside class="md:w-1/4 bg-white rounded-xl shadow-md p-6">
            <h2 class="text-xl font-semibold text-blue-700 mb-4 text-center">📁 MENU</h2>
            <ul class="space-y-3 text-gray-800 text-base">
                <li><a href="beranda_editor.php" class="block hover:text-blue-600 font-semibold">🏠 Beranda</a></li>
                <li><a href="data_artikel.php" class="block hover:text-blue-600">📝 Artikel Saya</a></li>
                <li>
                    <a href="../auth/logout.php"
                        onclick="return confirm('Apakah Anda yakin ingin keluar?');"
                        class="block text-red-600 hover:underline font-medium">🚪 Logout</a>
                </li>
            </ul>
        </aside>

        <!-- Main Content -->
        <main class="md:w-3/4 bg-white rounded-xl shadow-md p-8">
            <h2 class="text-xl font-bold text-blue-800 mb-4">👋 Selamat Datang, <?php echo htmlspecialchars($username); ?>!</h2>
            <p class="text-sm text-gray-600 mb-6">Anda login sebagai <strong>Editor</strong>. Anda hanya dapat mengelola artikel milik Anda sendiri.</p>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                <div class="bg-white border-t-4 border-blue-600 rounded shadow p-6 text-center hover:shadow-lg transition duration-300">
                    <h3 class="text-xl font-semibold text-blue-700">📄 Artikel Anda</h3>
                    <p class="text-4xl font-bold text-gray-800 mt-3"><?php echo $jumlah_artikel; ?></p>
                    <p class="text-sm text-gray-500 mt-1">Jumlah artikel yang telah Anda tulis</p>
                </div>
            </div>
        </main>

    </div>

    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-4 mt-12 shadow-inner">
        &copy; <?php echo date('Y'); ?> | Created by <span class="font-semibold">Triasti Meisya Dewi</span>
    </footer>

</body>

</html>