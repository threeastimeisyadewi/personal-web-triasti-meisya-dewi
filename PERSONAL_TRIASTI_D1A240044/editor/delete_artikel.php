<?php
session_start();
require_once("../koneksi.php");

if (!isset($_SESSION['username']) || strtolower($_SESSION['role']) !== 'editor') {
    header("Location: ../auth/login.php");
    exit;
}

$username = $_SESSION['username'];
$id = $_GET['id_artikel'];

$sql = "DELETE FROM tbl_artikel WHERE id_artikel='$id' AND author='$username'";
$query = mysqli_query($db, $sql);

if ($query) {
    echo "<script>alert('Artikel berhasil dihapus.'); window.location='data_artikel.php';</script>";
} else {
    echo "<script>alert('Gagal menghapus artikel.'); window.location='data_artikel.php';</script>";
}
