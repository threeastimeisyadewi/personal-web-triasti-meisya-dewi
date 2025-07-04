<?php
session_start();
require_once("../koneksi.php"); // Pastikan path koneksi.php benar

// Jika user sudah login, mungkin sebaiknya diarahkan pulang atau ke beranda admin
if (isset($_SESSION['username'])) {
    header('Location: ../admin/beranda_admin.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Akun Baru</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }

        .input-focus-ring:focus {
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.45);
            border-color: #3b82f6;
        }
    </style>
</head>

<body class="bg-gradient-to-br from-green-500 to-teal-600 min-h-screen flex items-center justify-center p-4">

    <div class="bg-white shadow-2xl rounded-xl p-8 sm:p-10 w-full max-w-sm transform transition-all duration-300 hover:scale-105">
        <h2 class="text-3xl font-extrabold text-center text-green-700 mb-8 tracking-wide">
            Daftar Akun Baru
        </h2>
        <form action="proses_register.php" method="post" class="space-y-6">
            <div>
                <label for="username" class="block text-sm font-semibold text-gray-700 mb-2">Username</label>
                <input
                    type="text"
                    name="username"
                    id="username"
                    required
                    autocomplete="new-username"
                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none input-focus-ring"
                    placeholder="Buat username baru">
            </div>
            <div>
                <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">Password</label>
                <input
                    type="password"
                    name="password"
                    id="password"
                    required
                    autocomplete="new-password"
                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none input-focus-ring"
                    placeholder="Buat password">
            </div>
            <div>
                <label for="confirm_password" class="block text-sm font-semibold text-gray-700 mb-2">Konfirmasi Password</label>
                <input
                    type="password"
                    name="confirm_password"
                    id="confirm_password"
                    required
                    autocomplete="new-password"
                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none input-focus-ring"
                    placeholder="Ulangi password">
            </div>
            <div class="flex flex-col space-y-4">
                <button
                    type="submit"
                    name="register"
                    class="w-full bg-green-700 text-white font-bold py-3 px-4 rounded-lg hover:bg-green-800 transition duration-300 ease-in-out transform hover:-translate-y-0.5 shadow-md">
                    Daftar
                </button>
                <a href="login.php"
                    class="w-full text-center bg-gray-300 text-gray-800 font-bold py-3 px-4 rounded-lg hover:bg-gray-400 transition duration-300 ease-in-out transform hover:-translate-y-0.5 shadow-md">
                    Kembali ke Login
                </a>
            </div>
        </form>

        <div class="text-center text-sm text-gray-600 mt-8">
            <p>Sudah punya akun? <a href="login.php" class="text-green-600 hover:underline font-semibold">Login di sini</a></p>
        </div>

        <div class="text-center text-xs text-gray-500 mt-4">
            &copy; <?php echo date('Y'); ?> Personal Web.
        </div>
    </div>

</body>

</html>