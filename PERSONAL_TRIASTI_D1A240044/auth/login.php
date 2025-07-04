<?php
session_start();
require_once("../koneksi.php");

// Jika sudah login, redirect sesuai role
if (isset($_SESSION['username']) && isset($_SESSION['role'])) {
    $role = strtolower(trim($_SESSION['role']));

    switch ($role) {
        case 'admin':
            header('Location: ../admin/beranda_admin.php');
            exit;
        case 'editor':
            header('Location: ../editor/beranda_editor.php');
            exit;
        case 'viewer':
            header('Location: ../viewer/beranda_viewer.php');
            exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login - Personal Web</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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