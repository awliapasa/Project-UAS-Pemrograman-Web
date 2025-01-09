-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: klinik
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `biodata_pasien`
--

DROP TABLE IF EXISTS `biodata_pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biodata_pasien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat_pasien` varchar(30) DEFAULT NULL,
  `nomor_telepon` varchar(12) DEFAULT NULL,
  `riwayat_alergi` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kata_sandi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_pasien`),
  UNIQUE KEY `id_pasien` (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biodata_pasien`
--

LOCK TABLES `biodata_pasien` WRITE;
/*!40000 ALTER TABLE `biodata_pasien` DISABLE KEYS */;
INSERT INTO `biodata_pasien` VALUES (1,'P001','Aulia Fasya','perempuan','2005-05-10','Jl. Senen Rabu Kamis','089677789818','udang','aulia@gmail.com','123'),(2,'P002','Michelle Hiu','perempuan','2004-12-05','Jl. Rabu Kamis','08119505559','tidak ada','micel@gmail.com','123'),(5,'P005','Carissa Metta','perempuan','2006-02-15','Jl. Duren Sawit','0818308030','asap rokok','crssa@gmail.com','123');
/*!40000 ALTER TABLE `biodata_pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daftar_antrian`
--

DROP TABLE IF EXISTS `daftar_antrian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daftar_antrian` (
  `tanggal` date DEFAULT NULL,
  `id_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `keluhan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`),
  CONSTRAINT `daftar_antrian_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `biodata_pasien` (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daftar_antrian`
--

LOCK TABLES `daftar_antrian` WRITE;
/*!40000 ALTER TABLE `daftar_antrian` DISABLE KEYS */;
INSERT INTO `daftar_antrian` VALUES ('2024-12-13','P001','Aulia Fasya','berakberak'),('2024-12-13','P002','Michelle Hiu','demam'),('2024-12-13','P005','Carissa Metta','akit ati');
/*!40000 ALTER TABLE `daftar_antrian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_kunjungan`
--

DROP TABLE IF EXISTS `data_kunjungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_kunjungan` (
  `id_pasien` varchar(10) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `tindakan` varchar(50) NOT NULL,
  `hasil_pemeriksaan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`,`tindakan`),
  CONSTRAINT `data_kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `biodata_pasien` (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_kunjungan`
--

LOCK TABLES `data_kunjungan` WRITE;
/*!40000 ALTER TABLE `data_kunjungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_kunjungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_antrian`
--

DROP TABLE IF EXISTS `list_antrian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_antrian` (
  `nomor_antrian` int NOT NULL AUTO_INCREMENT,
  `id_pasien` varchar(10) NOT NULL,
  PRIMARY KEY (`nomor_antrian`,`id_pasien`),
  KEY `id_pasien` (`id_pasien`),
  CONSTRAINT `list_antrian_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `daftar_antrian` (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_antrian`
--

LOCK TABLES `list_antrian` WRITE;
/*!40000 ALTER TABLE `list_antrian` DISABLE KEYS */;
INSERT INTO `list_antrian` VALUES (14,'P001'),(12,'P002'),(13,'P005');
/*!40000 ALTER TABLE `list_antrian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekam_medis`
--

DROP TABLE IF EXISTS `rekam_medis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rekam_medis` (
  `id_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `gejala` varchar(50) DEFAULT NULL,
  `tindakan` varchar(50) DEFAULT NULL,
  `diagnosa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`,`nama_pasien`),
  KEY `id_pasien` (`id_pasien`,`tindakan`),
  CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `biodata_pasien` (`id_pasien`),
  CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`id_pasien`, `tindakan`) REFERENCES `data_kunjungan` (`id_pasien`, `tindakan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekam_medis`
--

LOCK TABLES `rekam_medis` WRITE;
/*!40000 ALTER TABLE `rekam_medis` DISABLE KEYS */;
/*!40000 ALTER TABLE `rekam_medis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_kunjungan`
--

DROP TABLE IF EXISTS `riwayat_kunjungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_kunjungan` (
  `tanggal` date DEFAULT NULL,
  `tindakan` varchar(50) DEFAULT NULL,
  `diagnosa` varchar(50) DEFAULT NULL,
  `id_pasien` varchar(10) NOT NULL,
  PRIMARY KEY (`id_pasien`),
  CONSTRAINT `riwayat_kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `biodata_pasien` (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_kunjungan`
--

LOCK TABLES `riwayat_kunjungan` WRITE;
/*!40000 ALTER TABLE `riwayat_kunjungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `riwayat_kunjungan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-29 20:00:59
