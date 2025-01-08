<?php 

   include 'connection.php';
   session_start();

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $id_pasien = $_POST['id_pasien'];
        $nama_pasien = $_POST['nama_pasien'];
        $tanggal = $_POST['tanggal'];
        $gejala = $_POST['gejala'];
        $diagnosa = $_POST['diagnosa'];
        $tindakan = $_POST['tindakan'];

        $check_id = "SELECT * FROM biodata_pasien WHERE id_pasien = '$id_pasien'";
        $result = $conn->query($check_id);
                                
        if ($result->num_rows > 0) {
        $sql = "INSERT INTO rekam_medis (id_pasien, nama_pasien, tanggal, gejala, diagnosa, tindakan) 
        VALUES ('$id_pasien', '$nama_pasien', '$tanggal','$gejala', '$diagnosa', '$tindakan')";

            if ($conn->query($sql) === TRUE) {
                $_SESSION['message'] = "Data berhasil disimpan!";
                header("Location: index_RekamMedis.php");
                exit();
            } else {
                $_SESSION['message'] = "Oops! Anda gagal menyimpan data. Silahkan coba lagi.";
                header("Location: index_RekamMedis.php");
                exit();
            }
        } else {
            echo "ID Pasien tidak dikenali.";
            $_SESSION['message'] = "ID Pasien tidak dikenali.";
            header("Location: index_RekamMedis.php");
            exit();
       }                            
    }      
    
    $conn->close();
?>