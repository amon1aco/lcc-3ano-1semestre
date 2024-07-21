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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Data_De_Nascimento` date NOT NULL,
  `Nome` varchar(75) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Nr_CC` char(8) DEFAULT NULL,
  `Rua` varchar(50) NOT NULL,
  `Codigo_Postal` char(8) NOT NULL,
  `Nr_Da_Porta` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ind_ClienteNome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'1990-05-15','Carlos Pereira','carloscarlos1990@email.com','12345678','Rua da Cruz','1000-001',12),(2,'1985-08-20','Isabel Oliveira','belinha208@email.com','87654321','Rua das Candeias','2000-002',22),(3,'1995-02-10','Rui Martins','ruimartinez@email.com','56781234','Avenida da Boavista','3000-003',32),(4,'1990-05-20','José Andrade','joseAndrss@email.com','84212482','Rua da Noca','1120-001',122),(5,'1965-08-20','João Joana André','jjandre@gmail.com','87659221','Rua do joão','2012-022',322),(6,'1990-05-15','João Ferrari','vrummmm@email.com','12347859','Rua da jojoca','9000-021',12),(7,'1985-08-20','Nelinha Barbosa','nelinha101@email.com','87634321','Rua das oliveiras','2400-202',222),(8,'1935-12-12','Joâo Pedro','jonymaccarroni@email.com','56201234','Avenida da Joaquina','3000-025',101),(9,'1999-09-22','Miguel Rego ','mr1999@email.com','12245678','Avenida Brooklyn','1962-211',122),(10,'1985-08-20','Sara Barbosa','sarabrbs@gmail.com','20654321','Rua dos peões','2220-102',150),(11,'2000-02-14','Miguel Neiva','miguelneiva22@email.com','56782222','Avenida junior','3022-123',54),(12,'1998-09-29','Katia Mesquita','kitkat@email.com','12356222','Avenida Senior','9242-210',95),(13,'1998-03-25','Jessica Marte','joarte22@email.com','17611321','Avenida das Lilases','1750-214',72),(14,'1995-11-10','Matt Moon','tothemoon@email.com','56723234','Avenida das Costuras','3291-023',32),(15,'1990-05-15','Carlos Pedreira','partepedra10@email.com','75626984','Rua da Cruzada','8420-029',42),(16,'1921-09-20','Sergio Porto','portolove@email.com','82269321','Rua do Cavaleiro','2921-692',35),(17,'1998-12-21','Rosa Star','estrelinha@hotmail.com','92314356','Rotunda da Anémona','2942-241',72),(18,'1995-02-10','Charlie Sky','fullofstars@live.mail.com','96626621','Rua dos Peões','8354-142',68),(19,'2000-08-28','Eva Ferreira','evaferros@email.com','86731456','Avenida de Brooklyn','1092-901',91),(20,'2022-01-20','Lia Mesquita','babymsm@gmail.com','90123478','Avenida da Joaquina','9834-122',99),(21,'1920-10-10','Rui Chibarias','paezinhos@email.com','67672323','Rua do jojoca','1000-003',56),(22,'1990-02-22','Elisabete Cruz','Jesus00@email.com','90562390','Rua da Noitada','2819-221',45),(23,'1985-08-20','Rui Pilar','ruisemabrigo@email.com','87654531','Rua da Praia','2220-222',22),(24,'1920-10-07','Andre Belo','ballins@email.com','43217843','Rua do Trovão','1000-420',29),(25,'1996-09-21','Norberto Mesquita','norberto96@email.com','87103321','Rua das Costuras','2209-728',2),(26,'1982-02-10','Juan Desanta','juanmartinez@email.com','78342109','Avenida da Boavista','3000-829',5),(27,'1974-05-15','Kelly Barbosa','Kellylkes@email.com','55334466','Rua da Cruz','2192-221',12),(28,'1985-11-22','Beatriz Oliviera','Beatricee@email.com','99234492','Rua do Joaquina','9821-422',4),(29,'1996-02-19','Delfim Ribeiro ','Jkrowww@email.com','89218923','Avenida Bitcoin','6521-211',6),(30,'1999-05-05','Joaquim Ferreira','pedrabaixa@email.com','77722277','Avenida dos Perdedores','9871-221',98),(31,'1985-01-23','Vitoria Vitoria','acabouahistoria@email.com','88218822','Avenida Junior','2090-022',2),(32,'1991-04-10','João Tales','taliscas@email.com','89217621','Avenida da Noitada','3421-271',1),(33,'1992-05-15','Micael Litoral','micas@email.com','09262352','Rua da Nortada','9021-821',221),(34,'1981-08-20','Don Olivier','mrfrancois@email.com','89232123','Rua do Trovão','2229-122',9),(35,'1968-03-10','Lester Nyggard','Lesterthemoles@email.com','85412671','Rua do Chinatown ','3042-096',32),(36,'1993-02-10','Paco Taco','pacmans1@email.com','92011231','Avenida Do Benfica','2123-852',271),(37,'1990-05-15','João Maria','nomenome@email.com','85526743','Rua do jojoca','9281-021',1),(38,'2001-12-20','Boa Morte','mavida@email.com','94621262','Rua da Praia','2022-002',121),(39,'1990-05-15','Cristiano Ronaldo','siuuuuuuu@email.com','21097821','Rua da Cruz','9821-021',9),(40,'1982-08-20','António Costa','amops@email.com','89218221','Avenida da Liberdade','2221-212',98),(41,'1992-02-10','Rui Amares','amarorui@email.com','89218218','Avenida da Boavista','3000-003',33),(42,'1990-05-15','Marco Rites','poloo@email.com','78217242','Rua da Bitcoin','1221-521',7),(43,'1970-10-08','Paula Solar','queimaduras@email.com','89221289','Rua das Candeias','2000-002',22),(44,'1995-02-10','Paula Seixo','pedrada@email.com','67421321','Avenida do Canto','9212-720',7),(45,'1990-05-15','Francisco Pedro','pedrofrancisco@email.com','88112321','Avenida do Benfica','6721-782',9),(46,'1985-08-20','Becky Ribeiro','binarybecky@email.com','87224321','Avenida da Noitada','8921-222',10),(47,'1995-02-10','João Sopa','canjaesopa@email.com','85272142','Avenida da Liberdade','5829-339',8),(48,'1990-05-15','Andre Roberto','amopeixes@email.com','98083212','Avenida da Bitcoin','7842-212',42),(49,'1985-08-20','Miguel Oliveira','motassaofixes@email.com','78532304','Rua da Pista','8532-858',21),(50,'1995-02-10','Max Verstappen','dutchs@email.com','75262621','Avenida da Cruz','1972-192',41);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
