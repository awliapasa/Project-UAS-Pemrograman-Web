<?php

include 'connection.php';

$query = "
    SELECT 
        list_antrian.nomor_antrian,
        biodata_pasien.id_pasien,
        biodata_pasien.nama_pasien
    FROM 
        list_antrian
    JOIN 
        biodata_pasien 
    ON 
        list_antrian.id_pasien = biodata_pasien.id_pasien
";

if (isset($_POST['search']) && !empty($_POST['search'])) {
    $search = mysqli_real_escape_string($conn, $_POST['search']);
    $query = "
        SELECT
            list_antrian.nomor_antrian,
            biodata_pasien.id_pasien,
            biodata_pasien.nama_pasien 
        FROM 
            list_antrian 
        JOIN
            biodata_pasien
        ON
            list_antrian.id_pasien = biodata_pasien.id_pasien 
        WHERE 
            biodata_pasien.nama_pasien LIKE '%$search'";
}

if(isset($_POST['delete']) && isset($_POST['nomor_antrian'])) {
    $nomor_antrian = mysqli_real_escape_string($conn, $_POST['nomor_antrian']);

    $deleteQuery = "DELETE FROM list_antrian WHERE nomor_antrian = '$nomor_antrian'";

    if(mysqli_query($conn, $deleteQuery)) {
        echo "<script>alert('Semua data berhasil dihapus!'); window.location.href='index_DataAntrian.php';</script>";
    } else {
        echo "<script>alert('Gagal menghapus data: " . mysqli_error($conn) . "');</script";
    }
}

$result = mysqli_query($conn, $query);

if(!$result) {
    die("Gagal Query!: " . mysqli_query($conn));
}
?>

<!DOCTYPE html><html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Manajemen Data TPMD</title>

        <link rel="stylesheet" href="css/Biodatapasien.css" />

        <!--Google Fonts-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
        
        <!--Font awesome 5.15.4-->
        <link 
            rel="stylesheet" 
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" 
            integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" 
            crossorigin="anonymous" 
            referrerpolicy="no-referrer" />
    </head>
    <body>
        <header class="navbar-container">
            <div class="logo">
                <img src="img/logo.png" alt="Tempat Praktik Mandiri Dokter">
            </div>
            <nav class="nav-list">
                <ul>
                    <li><a href="index_beranda.html">Beranda</a></li>
                    <li><a href="index_BiodataPasien.php">Biodata Pasien</a></li>
                    <li><a href="index_DataAntrian.php">Data Antrian</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <div id="content">
                <article id="Rekam Medis">
                    <h2>Data Antrian</h2>
                    <section class="search-section">
                        <form class="search-form" method="POST" action="index_DataAntrian.php">
                            <input type="text" name="search" placeholder="Cari ID/Nama Pasien" class="search-input">
                            <button type="submit" class="search-button">Search</button>
                        </form>
                    </section>
                    <table>
                        <tr>
                            <th>Nomor Antrian</th>
                            <th>ID Pasien</th>
                            <th>Nama Pasien</th>
                        </tr>

                        <?php
                        while($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td>" . $row['nomor_antrian'] . "</td>";
                            echo "<td>" . $row['id_pasien'] . "</td>";
                            echo "<td>" . $row['nama_pasien'] . "</td>";
                            echo "<td>
                                <form method='POST' action='index_DataAntrian.php'>
                                    <input type='hidden' name='nomor_antrian' value='" . $row['nomor_antrian'] . "' />
                                    <button type='submit' name='delete' class='delete-button'>Selesai</button>
                                </form>
                              </td>";
                            echo "</tr>";

                        }
                        ?>
                    </table>
                </article>
            </div>
        </main>
    </body>