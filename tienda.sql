-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acciones` (
  `idacciones` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usser` varchar(45) NOT NULL,
  PRIMARY KEY (`idacciones`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
INSERT INTO `acciones` VALUES (1,'se registro en la tabla cliente --> 2 Marco Molina Coral AV. luzuriaga 986532745','2021-08-24 09:11:02','root@localhost'),(2,'se registro en la tabla producto --> 3 laptop laptop 1200 3','2021-08-28 19:23:22','root@localhost'),(3,'se registro en la tabla cliente --> 3 Juan Gomes Molina Soledad 95363423','2022-03-11 22:22:53','root@localhost');
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Luis','Garro Torres','AV. Atusparia','939492096'),(2,'Marco','Molina Coral','AV. luzuriaga','986532745'),(3,'Juan','Gomes Molina','Soledad','95363423');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cliente_producto`
--

DROP TABLE IF EXISTS `cliente_producto`;
/*!50001 DROP VIEW IF EXISTS `cliente_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cliente_producto` AS SELECT 
 1 AS `id_cliente`,
 1 AS `Dato_Cliente`,
 1 AS `Nombre_prod`,
 1 AS `Descripcion_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cliente_servicio`
--

DROP TABLE IF EXISTS `cliente_servicio`;
/*!50001 DROP VIEW IF EXISTS `cliente_servicio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cliente_servicio` AS SELECT 
 1 AS `id_cliente`,
 1 AS `Dato_Cliente`,
 1 AS `Descripcion_servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `compra_producto`
--

DROP TABLE IF EXISTS `compra_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_producto` (
  `Cliente_ID_Cliente` int NOT NULL,
  `Producto_Id_Producto` int NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`Cliente_ID_Cliente`,`Producto_Id_Producto`),
  KEY `fk_Cliente_has_Producto_Producto1_idx` (`Producto_Id_Producto`),
  KEY `fk_Cliente_has_Producto_Cliente_idx` (`Cliente_ID_Cliente`),
  CONSTRAINT `fk_Cliente_has_Producto_Cliente` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  CONSTRAINT `fk_Cliente_has_Producto_Producto1` FOREIGN KEY (`Producto_Id_Producto`) REFERENCES `producto` (`Id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_producto`
--

LOCK TABLES `compra_producto` WRITE;
/*!40000 ALTER TABLE `compra_producto` DISABLE KEYS */;
INSERT INTO `compra_producto` VALUES (1,2,'2021-08-24 00:00:00');
/*!40000 ALTER TABLE `compra_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_servicio`
--

DROP TABLE IF EXISTS `compra_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_servicio` (
  `Cliente_ID_Cliente` int NOT NULL,
  `Servicio_ID_Servicio` int NOT NULL,
  `Fec_Inicio` date NOT NULL,
  `Fec_Final` date NOT NULL,
  PRIMARY KEY (`Cliente_ID_Cliente`,`Servicio_ID_Servicio`),
  KEY `fk_Cliente_has_Servicio_Servicio1_idx` (`Servicio_ID_Servicio`),
  KEY `fk_Cliente_has_Servicio_Cliente1_idx` (`Cliente_ID_Cliente`),
  CONSTRAINT `fk_Cliente_has_Servicio_Cliente1` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  CONSTRAINT `fk_Cliente_has_Servicio_Servicio1` FOREIGN KEY (`Servicio_ID_Servicio`) REFERENCES `servicio` (`ID_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_servicio`
--

LOCK TABLES `compra_servicio` WRITE;
/*!40000 ALTER TABLE `compra_servicio` DISABLE KEYS */;
INSERT INTO `compra_servicio` VALUES (2,2,'2021-10-12','2021-11-12');
/*!40000 ALTER TABLE `compra_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hola`
--

DROP TABLE IF EXISTS `hola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hola` (
  `saludo` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hola`
--

LOCK TABLES `hola` WRITE;
/*!40000 ALTER TABLE `hola` DISABLE KEYS */;
/*!40000 ALTER TABLE `hola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Id_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre_prod` varchar(45) NOT NULL,
  `Descripcion_producto` varchar(200) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Stock` int NOT NULL,
  PRIMARY KEY (`Id_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'sin producto','vacio',0,0),(2,'Ram','Partes informaticas',25,9),(3,'laptop','laptop',1200,3);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedor`
--

DROP TABLE IF EXISTS `provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor` (
  `RUC` int NOT NULL,
  `Razon_Social` varchar(45) NOT NULL,
  `Representante_legal` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `id_producto` int NOT NULL,
  `id_servicio` int NOT NULL,
  PRIMARY KEY (`RUC`,`id_producto`,`id_servicio`),
  KEY `id_producto` (`id_producto`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `provedor_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`Id_Producto`),
  CONSTRAINT `provedor_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`ID_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor`
--

LOCK TABLES `provedor` WRITE;
/*!40000 ALTER TABLE `provedor` DISABLE KEYS */;
INSERT INTO `provedor` VALUES (59,'sol srl','Juan','soledad','956231478',2,1),(5456,'Tecno SAC','Maria','Belen','953624896',1,2);
/*!40000 ALTER TABLE `provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `provedor_producto`
--

DROP TABLE IF EXISTS `provedor_producto`;
/*!50001 DROP VIEW IF EXISTS `provedor_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `provedor_producto` AS SELECT 
 1 AS `RUC`,
 1 AS `Dato_provedor`,
 1 AS `Nombre_prod`,
 1 AS `Descripcion_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `provedor_servicio`
--

DROP TABLE IF EXISTS `provedor_servicio`;
/*!50001 DROP VIEW IF EXISTS `provedor_servicio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `provedor_servicio` AS SELECT 
 1 AS `RUC`,
 1 AS `Dato_provedor`,
 1 AS `Descripcion_servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `ID_Servicio` int NOT NULL AUTO_INCREMENT,
  `Descripcion_servicio` varchar(200) NOT NULL,
  `Tiempo` varchar(45) NOT NULL,
  `Costo` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_Servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'sin servicio','0',0),(2,'sistemas de informacion','1 mes',500);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cliente_producto`
--

/*!50001 DROP VIEW IF EXISTS `cliente_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cliente_producto` AS select `c`.`ID_Cliente` AS `id_cliente`,concat_ws(' ',`c`.`Apellidos`,`c`.`Nombres`,`c`.`Direccion`) AS `Dato_Cliente`,`p`.`Nombre_prod` AS `Nombre_prod`,`p`.`Descripcion_producto` AS `Descripcion_producto` from ((`compra_producto` `s` join `cliente` `c` on((`c`.`ID_Cliente` = `s`.`Cliente_ID_Cliente`))) join `producto` `p` on((`p`.`Id_Producto` = `s`.`Producto_Id_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cliente_servicio`
--

/*!50001 DROP VIEW IF EXISTS `cliente_servicio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cliente_servicio` AS select `c`.`ID_Cliente` AS `id_cliente`,concat_ws(' ',`c`.`Apellidos`,`c`.`Nombres`,`c`.`Direccion`) AS `Dato_Cliente`,`p`.`Descripcion_servicio` AS `Descripcion_servicio` from ((`compra_servicio` `s` join `cliente` `c` on((`c`.`ID_Cliente` = `s`.`Cliente_ID_Cliente`))) join `servicio` `p` on((`p`.`ID_Servicio` = `s`.`Servicio_ID_Servicio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `provedor_producto`
--

/*!50001 DROP VIEW IF EXISTS `provedor_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `provedor_producto` AS select `c`.`RUC` AS `RUC`,concat_ws(' ',`c`.`Representante_legal`) AS `Dato_provedor`,`p`.`Nombre_prod` AS `Nombre_prod`,`p`.`Descripcion_producto` AS `Descripcion_producto` from (`producto` `p` join `provedor` `c` on((`c`.`id_producto` = `p`.`Id_Producto`))) where (`p`.`Nombre_prod` <> 'sin producto') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `provedor_servicio`
--

/*!50001 DROP VIEW IF EXISTS `provedor_servicio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `provedor_servicio` AS select `c`.`RUC` AS `RUC`,concat_ws(' ',`c`.`Representante_legal`) AS `Dato_provedor`,`p`.`Descripcion_servicio` AS `Descripcion_servicio` from (`servicio` `p` join `provedor` `c` on((`c`.`id_servicio` = `p`.`ID_Servicio`))) where (`p`.`Descripcion_servicio` <> 'sin servicio') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-11 22:23:38
