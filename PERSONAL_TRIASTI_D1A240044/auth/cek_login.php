<?php
session_start();
require_once("../koneksi.php");

// Ambil data dari form
$username = mysqli_real_escape_string($db, $_POST['username']);
$password = mysqli_real_escape_string($db, $_POST['password']);

// Cek user berdasarkan username dan password (tanpa hash)
$sql = "SELECT * FROM tbl_user WHERE username = '$username' AND password = '$password'";
$query = mysqli_query($db, $sql);
$data = mysqli_fetch_assoc($query);

if ($data) {
    // Set session
    $_SESSION['username'] = $data['username'];
    $_SESSION['role'] = strtolower(trim($data['role'])); // untuk antisipasi role tidak konsisten

    // Redirect berdasarkan role
    switch ($_SESSION['role']) {
        case 'admin':
            header("Location: ../admin/beranda_admin.php");
            exit;
        case 'editor':
            header("Location: ../editor/beranda_editor.php");
            exit;
        case 'viewer':
            header("Location: ../viewer/beranda_viewer.php");
            exit;
        default:
            echo "<script>alert('Role tidak dikenali.'); window.location='login.php';</script>";
            exit;
    }
} else {
    echo "<script>alert('Login gagal! Username atau password salah.'); window.location='login.php';</script>";
    exit;
}
