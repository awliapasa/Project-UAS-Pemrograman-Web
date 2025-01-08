<?php 

   include 'connection.php';
   session_start();

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $id_pasien = $_POST['id_pasien'];
        $tanggal = $_POST['tanggal'];
        $tindakan = $_POST['tindakan'];
        $hasil_pemeriksaan = $_POST['hasil_pemeriksaan'];

        $check_id = "SELECT * FROM biodata_pasien WHERE id_pasien = '$id_pasien'";
        $result = $conn->query($check_id);
                                
        if ($result->num_rows > 0) {
        $sql = "INSERT INTO data_kunjungan (id_pasien, tanggal, tindakan, hasil_pemeriksaan) 
        VALUES ('$id_pasien', '$tanggal', '$tindakan', '$hasil_pemeriksaan')";

            if ($conn->query($sql) === TRUE) {
                $_SESSION['message'] = "Data berhasil disimpan!";
                header("Location: index_kunjungan.php");
                exit();
            } else {
                $_SESSION['message'] = "Oops! Anda gagal menyimpan data. Silahkan coba lagi.";
                header("Location: index_kunjungan.php");
                exit();
            }
        } else {
            echo "ID Pasien tidak dikenali.";
            $_SESSION['message'] = "ID Pasien tidak dikenali.";
            header("Location: index_kunjungan.php");
            exit();
       }                            
    }      
    
    $conn->close();
?>