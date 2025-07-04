<?php
session_start();
require_once("../koneksi.php");

if (!isset($_SESSION['username']) || strtolower($_SESSION['role']) !== 'editor') {
    header("Location: ../auth/login.php");
    exit;
}

$id = $_POST['id_artikel'];
$username = $_SESSION['username'];

$judul = mysqli_real_escape_string($db, $_POST['nama_artikel']);
$isi = mysqli_real_escape_string($db, $_POST['isi_artikel']);

function generateSlug($string)
{
    return strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $string)));
}
$slug = generateSlug($judul);

// Update hanya jika artikel milik sendiri
$sql = "UPDATE tbl_artikel SET nama_artikel='$judul', slug='$slug', isi_artikel='$isi'
        WHERE id_artikel='$id' AND author='$username'";
$query = mysqli_query($db, $sql);

if ($query) {
    echo "<script>alert('Artikel berhasil diperbarui.'); window.location='data_artikel.php';</script>";
} else {
    echo "<script>alert('Gagal memperbarui artikel.'); history.back();</script>";
}
