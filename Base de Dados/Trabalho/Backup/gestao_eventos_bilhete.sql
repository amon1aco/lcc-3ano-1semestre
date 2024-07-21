CREATE DATABASE  IF NOT EXISTS `gestao_eventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestao_eventos`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gestao_eventos
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `bilhete`
--

DROP TABLE IF EXISTS `bilhete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bilhete` (
  `QR_Code` int NOT NULL AUTO_INCREMENT,
  `Tipo_Entrada` varchar(20) DEFAULT NULL,
  `Cliente_Nome` varchar(75) DEFAULT NULL,
  `Preco` decimal(5,2) NOT NULL,
  PRIMARY KEY (`QR_Code`),
  KEY `ind_BilheteClienteNome` (`Cliente_Nome`),
  CONSTRAINT `bilhete_chk_1` CHECK ((`Preco` >= 0)),
  CONSTRAINT `bilhete_chk_2` CHECK ((`Tipo_Entrada` in (_utf8mb4'Normal',_utf8mb4'VIP',_utf8mb4'Grupo')))
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilhete`
--

LOCK TABLES `bilhete` WRITE;
/*!40000 ALTER TABLE `bilhete` DISABLE KEYS */;
INSERT INTO `bilhete` VALUES (1001,'Normal',NULL,25.00),(1002,'Normal',NULL,15.00),(1003,'VIP',NULL,40.00),(1004,'VIP',NULL,35.00),(1005,'Grupo',NULL,20.00),(1006,'VIP',NULL,50.00),(1007,'Normal',NULL,30.00),(1008,'Grupo',NULL,25.00),(1009,'Grupo',NULL,45.00),(1010,'Normal','Miguel Oliveira',20.00),(1011,'VIP',NULL,55.00),(1012,'Normal',NULL,15.00),(1013,'Normal',NULL,28.00),(1014,'VIP',NULL,60.00),(1015,'Normal',NULL,18.00),(1016,'Normal',NULL,22.00),(1017,'VIP','Andre Belo',48.00),(1018,'Normal','Rui Martins',30.00),(1019,'Normal',NULL,25.00),(1020,'Grupo',NULL,70.00);
/*!40000 ALTER TABLE `bilhete` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 16:30:24
