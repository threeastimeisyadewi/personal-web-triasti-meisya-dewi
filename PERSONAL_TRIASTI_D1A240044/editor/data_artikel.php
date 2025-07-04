<?php
session_start();
if (!isset($_SESSION['username']) || strtolower($_SESSION['role']) !== 'editor') {
    header('location:../auth/login.php');
    exit;
}

include('../koneksi.php');
$username = $_SESSION['username'];
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Artikel Saya</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-b from-blue-50 to-blue-100 min-h-screen font-sans">

    <!-- Header -->
    <header class="bg-blue-900 text-white text-center py-6 shadow-md">
        <h1 class="text-3xl font-bold">📝 Artikel Saya</h1>
    </header>

    <!-- Layout -->
    <div class="flex flex-col md:flex-row max-w-7xl mx-auto mt-8 px-4 gap-6">

        <!-- Sidebar -->
        <aside class="md:w-1/4 bg-white rounded-xl shadow p-6">
            <h2 class="text-xl font-semibold text-blue-700 mb-4 text-center">📁 MENU</h2>
            <ul class="space-y-3 text-gray-800 text-base">
                <li><a href="beranda_editor.php" class="block hover:text-blue-600">🏠 Beranda</a></li>
                <li><a href="data_artikel.php" class="block font-semibold text-blue-900">📝 Artikel Saya</a></li>
                <li><a href="../auth/logout.php" onclick="return confirm('Yakin ingin logout?')" class="block text-red-600 hover:underline font-medium">🚪 Logout</a></li>
            </ul>
        </aside>

        <!-- Konten -->
        <main class="md:w-3/4 bg-white rounded-xl shadow p-6 overflow-auto">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-xl font-semibold text-blue-800">📚 Daftar Artikel</h2>
                <a href="add_artikel.php" class="bg-blue-700 text-white px-4 py-2 rounded hover:bg-blue-800 transition">+ Tambah Artikel</a>
            </div>

            <table class="min-w-full text-left bg-white border border-gray-200 rounded">
                <thead class="bg-blue-100 text-blue-800 font-semibold">
                    <tr>
                        <th class="px-4 py-2 border">No</th>
                        <th class="px-4 py-2 border">Judul</th>
                        <th class="px-4 py-2 border">Isi Singkat</th>
                        <th class="px-4 py-2 border">Tanggal</th>
                        <th class="px-4 py-2 border">Aksi</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700">
                    <?php
                    $no = 1;
                    $sql = "SELECT * FROM tbl_artikel WHERE author = '$username' ORDER BY created_at DESC";
                    $query = mysqli_query($db, $sql);
                    while ($data = mysqli_fetch_assoc($query)) {
                        echo "<tr class='hover:bg-gray-50'>";
                        echo "<td class='px-4 py-2 border text-center'>{$no}</td>";
                        echo "<td class='px-4 py-2 border font-semibold'>" . htmlspecialchars($data['nama_artikel']) . "</td>";
                        echo "<td class='px-4 py-2 border'>" . substr(strip_tags($data['isi_artikel']), 0, 50) . "...</td>";
                        echo "<td class='px-4 py-2 border'>" . date('d M Y', strtotime($data['created_at'])) . "</td>";
                        echo "<td class='px-4 py-2 border text-center space-x-2'>";
                        echo "<a href='edit_artikel.php?id_artikel={$data['id_artikel']}' class='text-blue-600 hover:underline'>Edit</a>";
                        echo "<a href='delete_artikel.php?id_artikel={$data['id_artikel']}' onclick='return confirm(\"Yakin ingin menghapus artikel ini?\")' class='text-red-600 hover:underline'>Hapus</a>";
                        echo "</td></tr>";
                        $no++;
                    }
                    ?>
                </tbody>
            </table>
        </main>

    </div>

    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-4 mt-12 shadow-inner">
        &copy; <?php echo date('Y'); ?> | Created by <span class="font-semibold">Triasti Meisya Dewi</span>
    </footer>

</body>

</html>