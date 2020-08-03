-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: lacocinadeapolo
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `detalles venta`
--

DROP TABLE IF EXISTS `detalles venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usar_id` int NOT NULL,
  `venta_id` int NOT NULL,
  `ingredientes_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalles venta_usar1_idx` (`usar_id`),
  KEY `fk_detalles venta_venta1_idx` (`venta_id`),
  KEY `fk_detalles venta_ingredientes1_idx` (`ingredientes_id`),
  CONSTRAINT `fk_detalles venta_ingredientes1` FOREIGN KEY (`ingredientes_id`) REFERENCES `ingredientes` (`id`),
  CONSTRAINT `fk_detalles venta_usar1` FOREIGN KEY (`usar_id`) REFERENCES `ingredientes_por_receta` (`id`),
  CONSTRAINT `fk_detalles venta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles venta`
--

LOCK TABLES `detalles venta` WRITE;
/*!40000 ALTER TABLE `detalles venta` DISABLE KEYS */;
INSERT INTO `detalles venta` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,1,1,4),(5,1,1,5),(6,1,1,6),(7,1,1,7),(8,1,1,8),(9,1,1,9),(10,1,1,10),(11,1,1,11),(12,1,1,12);
/*!40000 ALTER TABLE `detalles venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Pan para Hamburguesa','Pan balnco para hamburguesa',1),(2,'Carne Molida','Carne Molida ',1.5),(3,'Lechuga','Lechuga fresca',0.3),(4,'Tomate','Tomate fresco',0.3),(5,'Mayonesa','Mayonesa',0.3),(6,'Mostaza','Mostaza',0.3),(7,'Salsa de Tomate','Salsa de tomate',0.3),(8,'Aceite','Aceite para cocinar',0.75),(9,'Sal','Sal',0.3),(10,'Pimienta','Pimienta',0.3),(11,'Aguacate','Aguacate',0.5),(12,'Queso Blanco','Queso Blanco',0.5);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes_por_receta`
--

DROP TABLE IF EXISTS `ingredientes_por_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes_por_receta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingredientes_id` int NOT NULL,
  `recetas_id` int NOT NULL,
  `cantidad` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usar_ingredientes_idx` (`ingredientes_id`),
  KEY `fk_usar_recetas1_idx` (`recetas_id`),
  CONSTRAINT `fk_usar_ingredientes` FOREIGN KEY (`ingredientes_id`) REFERENCES `ingredientes` (`id`),
  CONSTRAINT `fk_usar_recetas1` FOREIGN KEY (`recetas_id`) REFERENCES `recetas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes_por_receta`
--

LOCK TABLES `ingredientes_por_receta` WRITE;
/*!40000 ALTER TABLE `ingredientes_por_receta` DISABLE KEYS */;
INSERT INTO `ingredientes_por_receta` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,9,1,1),(10,10,1,1),(11,11,1,1),(12,12,1,1);
/*!40000 ALTER TABLE `ingredientes_por_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `video` varchar(1200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,'Cheeseburger','Deliciosa torta de brisket y short rib molida, acompañada con el fiel','Casero','https://www.youtube.com/watch?v=Y_yBuRW5818'),(2,'Club Sandwich','Deliciosa Texas toast con lechuga, tomate, tocino, jamon, huevo y','Casero','https://www.youtube.com/watch?v=YpMzu5lBsY4'),(3,'Poke bowl','No se que lleva brother pero fijo es algo rico, a pues lleva garbazos y','Casero','https://www.youtube.com/watch?v=lxK2-K0bj7Q'),(4,'Pizza','Deliciosa masa de la casa, con la salsa especial de tomates del','Casero','https://www.youtube.com/watch?v=mxqEM_1WiG8');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `contrasenna` varchar(45) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `numero_tarjeta` varchar(12) DEFAULT NULL,
  `fecha_vencimientol` varchar(5) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Juan','Miembro','Juan@hotmail.com','123456789111','04/24','Colonia San Juan,casa#3,San Salvador,El Salvador'),(2,'Lucas','Lucas','Admin','Lucas@hotmail.com','123456789115','03/23','Colonia San Lucas,casa#3,San Salvador,El Salvador'),(3,'Pedro','Pedro','Miembro','Pedro@hotmail.com','123456789117','02/22','Colonia San Pedro,casa#3,San Salvador,El Salvador');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuarios_id` int NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `catidad` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_usuarios1_idx` (`usuarios_id`),
  CONSTRAINT `fk_venta_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'26/junio/2020',2),(2,2,'27/Junio/2020',5);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-01 17:16:45
