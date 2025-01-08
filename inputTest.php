<?php
$id_pasien = $_POST['id_pasien'];
$nama_pasien = $_POST['nama_pasien'];
$gejala = $_POST['gejala'];
$diagnosa = $_POST['diagnosa'];
$tindakan = $_POST['tindakan'];

$id_pasien = $_POST['id_pasien'];
$tanggal = $_POST['tanggal'];
$tindakan = $_POST['tindakan'];
$hasil_pemeriksaan = $_POST['hasil_pemeriksaan'];


error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "gugugaga05";
$dbname = "klinik";

$conn = new mysqli ($servername, $username, $password, $dbname);

if($conn -> connect_error) {
    die("Gagal menghubungkan: " . $conn->connect_error);
}
?>