<?php
session_start();
require_once("../koneksi.php");

if (!isset($_SESSION['username']) || strtolower($_SESSION['role']) !== 'editor') {
    header("Location: ../auth/login.php");
    exit;
}

$username = $_SESSION['username'];
$judul = mysqli_real_escape_string($db, $_POST['nama_artikel']);
$isi   = mysqli_real_escape_string($db, $_POST['isi_artikel']);

function generateSlug($string)
{
    return strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $string)));
}

$slug = generateSlug($judul);

$sql = "INSERT INTO tbl_artikel (nama_artikel, slug, isi_artikel, author) 
        VALUES ('$judul', '$slug', '$isi', '$username')";
$query = mysqli_query($db, $sql);

if ($query) {
    echo "<script>alert('Artikel berhasil ditambahkan.'); window.location='data_artikel.php';</script>";
} else {
    echo "<script>alert('Gagal menambahkan artikel.'); history.back();</script>";
}
