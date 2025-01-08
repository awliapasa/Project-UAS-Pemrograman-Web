<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "gugugaga05";
$dbname = "klinik";

$conn = new mysqli ($servername, $username, $password, $dbname, 3307);

if($conn -> connect_error) {
    die("Gagal menghubungkan: " . $conn->connect_error);
}
?>