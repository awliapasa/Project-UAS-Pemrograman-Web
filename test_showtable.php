<?php
include 'connection.php';

// Sertakan file connection.php
include 'connection.php';

// Query untuk mengambil data dari tabel
$sql = "SELECT * FROM list_antrian"; // Ganti 'nama_tabel' dengan nama tabel Anda
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Tabel Klinik</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Data dari Tabel Klinik</h1>
    <table>
        <thead>
            <tr>
                <th>Nomor Antrian</th>
                <th>ID Pasien</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($result->num_rows > 0) {
                // Looping data untuk ditampilkan
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row['nomor_antrian'] . "</td>";
                    echo "<td>" . $row['id_pasien'] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='2'>Tidak ada data</td></tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>
