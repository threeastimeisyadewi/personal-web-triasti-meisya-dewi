<?php
session_start();
require_once("../koneksi.php"); // Pastikan path koneksi.php benar

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['register'])) {
    $username = mysqli_real_escape_string($db, $_POST['username']);
    $password = mysqli_real_escape_string($db, $_POST['password']);
    $confirm_password = mysqli_real_escape_string($db, $_POST['confirm_password']);

    // Validasi input
    if (empty($username) || empty($password) || empty($confirm_password)) {
        echo "<script>alert('Username dan password tidak boleh kosong!'); history.back();</script>";
        exit;
    }

    if ($password !== $confirm_password) {
        echo "<script>alert('Konfirmasi password tidak cocok!'); history.back();</script>";
        exit;
    }

    // Cek apakah username sudah ada
    $check_query = "SELECT * FROM tbl_user WHERE username = '$username'";
    $check_result = mysqli_query($db, $check_query);

    if (mysqli_num_rows($check_result) > 0) {
        echo "<script>alert('Username sudah terdaftar! Gunakan username lain.'); history.back();</script>";
        exit;
    }

    // Hash password sebelum menyimpan ke database (sangat direkomendasikan untuk keamanan)
    // Untuk kesederhanaan studi kasus ini, kita akan menyimpan plaintext sesuai instruksi awal.
    // Namun, dalam aplikasi nyata, SELALU gunakan password hashing seperti password_hash()
    // $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Query untuk menyimpan data user baru
    $insert_query = "INSERT INTO tbl_user (username, password) VALUES ('$username', '$password')";
    $insert_result = mysqli_query($db, $insert_query);

    if ($insert_result) {
        echo "<script>alert('Registrasi berhasil! Silakan login.'); window.location='login.php';</script>";
    } else {
        echo "<script>alert('Registrasi gagal! Terjadi kesalahan database.'); history.back();</script>";
    }
} else {
    // Jika diakses langsung tanpa POST, redirect ke halaman register
    header('Location: register.php');
    exit;
}
