-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: prueba_1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_estilista` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('pendiente','confirmada','completada','cancelada','reagendada') NOT NULL,
  `comentarios` text NOT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `cita_FK` (`id_usuario`),
  KEY `cita_FK_1` (`id_servicio`),
  KEY `cita_FK_2` (`id_estilista`),
  CONSTRAINT `cita_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `cita_FK_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  CONSTRAINT `cita_FK_2` FOREIGN KEY (`id_estilista`) REFERENCES `estilista` (`id_estilista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estilista`
--

DROP TABLE IF EXISTS `estilista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estilista` (
  `id_estilista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_estilista`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estilista`
--

LOCK TABLES `estilista` WRITE;
/*!40000 ALTER TABLE `estilista` DISABLE KEYS */;
INSERT INTO `estilista` VALUES (1,'Gabriela ','Corte de cabello');
/*!40000 ALTER TABLE `estilista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `duracion` time NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Corte de cabello','Se realizará un corte de cabello básico.','01:00:00',120.00);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `tipo_usuario` enum('Administrador','Cliente') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_un` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,'Aarón','Rangel','Verdugo','6671611938','af.rangel20@info.uas.edu.mx','$2y$10$WfdTTz1vqbbaTLRDmBCw4eIjkcjPc5nCGnf54OlZI8g6Km5bx4lc6','Administrador'),(12,'Jesús Israel','Rangel','Verdugo','6674509809','ji.rangel@gmail.com','$2y$10$gEAtrJkUDiPr/eXavTs9mOvtZpYkn3yugVc2tPl1KBOeQBki1eX/C','Cliente'),(13,'Estrella Guadalupe','Rangel','Verdugo','6671234567','cverdugo820@gmail.com','$2y$10$q66Ok4QirHImm6IqdH1TGeGlD1mntQjQpnYVwNdASvbV3vApTj9GO','Cliente'),(15,'Ángel Emiliano','Rangel','Verdugo','6677897654','ae.rangelv@gmail.com','$2y$10$SFLE7xyXiAKkXO6QhejteuUv.bzsEtZhHytq0bRQJWG0CHeyO8ER.','Cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prueba_1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-17 20:34:09
