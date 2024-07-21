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
-- Table structure for table `patrocina`
--

DROP TABLE IF EXISTS `patrocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrocina` (
  `Patrocinador_Nome_Patrocina` varchar(45) NOT NULL,
  `Evento_ID_patrocina` int NOT NULL,
  `Montante` decimal(10,2) NOT NULL,
  `Observações` varchar(500) DEFAULT NULL,
  KEY `Patrocinador_Nome_Evento` (`Patrocinador_Nome_Patrocina`),
  KEY `Evento_ID_Patrocinador` (`Evento_ID_patrocina`),
  CONSTRAINT `Evento_ID_Patrocinador` FOREIGN KEY (`Evento_ID_patrocina`) REFERENCES `evento` (`ID`),
  CONSTRAINT `Patrocinador_Nome_Evento` FOREIGN KEY (`Patrocinador_Nome_Patrocina`) REFERENCES `patrocinador` (`Nome`),
  CONSTRAINT `patrocina_chk_1` CHECK ((`Montante` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrocina`
--

LOCK TABLES `patrocina` WRITE;
/*!40000 ALTER TABLE `patrocina` DISABLE KEYS */;
INSERT INTO `patrocina` VALUES ('Meo',1,5000.00,NULL),('Red Bull',2,1000.00,'Exigimos cartaz publicitário na entrada'),('AlbertoMusical',2,250.00,NULL);
/*!40000 ALTER TABLE `patrocina` ENABLE KEYS */;
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
