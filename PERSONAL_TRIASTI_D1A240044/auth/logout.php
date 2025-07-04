<?php
session_start();

// Hapus semua data session
session_unset();
session_destroy();

// Arahkan ke login dengan notifikasi logout
echo "<script>
    alert('Anda telah berhasil logout.');
    window.location.href = 'login.php';
</script>";
exit;
