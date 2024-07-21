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
-- Table structure for table `conhece`
--

DROP TABLE IF EXISTS `conhece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conhece` (
  `Funcionario_ID_Conhece` int NOT NULL,
  `Evento_ID_Conhece` int NOT NULL,
  KEY `funcionario_ID` (`Funcionario_ID_Conhece`),
  KEY `Evento_ID` (`Evento_ID_Conhece`),
  CONSTRAINT `Evento_ID` FOREIGN KEY (`Evento_ID_Conhece`) REFERENCES `evento` (`ID`),
  CONSTRAINT `funcionario_ID` FOREIGN KEY (`Funcionario_ID_Conhece`) REFERENCES `funcionario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conhece`
--

LOCK TABLES `conhece` WRITE;
/*!40000 ALTER TABLE `conhece` DISABLE KEYS */;
INSERT INTO `conhece` VALUES (1,6),(1,5),(1,4),(1,3),(1,2),(1,1),(2,6),(2,5),(2,4),(2,3),(2,2),(2,1),(3,6),(3,5),(3,4),(3,3),(3,2),(3,1),(4,6),(4,5),(4,4),(4,3),(4,2),(4,1),(5,6),(5,5),(5,4),(5,3),(5,2),(5,1),(6,6),(6,5),(6,4),(6,3),(6,2),(6,1),(7,6),(7,5),(7,4),(7,3),(7,2),(7,1),(8,6),(8,5),(8,4),(8,3),(8,2),(8,1),(9,6),(9,5),(9,4),(9,3),(9,2),(9,1);
/*!40000 ALTER TABLE `conhece` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 16:30:23
