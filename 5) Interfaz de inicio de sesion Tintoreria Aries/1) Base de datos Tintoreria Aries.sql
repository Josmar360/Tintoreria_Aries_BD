-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.100.4    Database: tintoreria_aries
-- ------------------------------------------------------
-- Server version	8.0.28
-- Josmar Gustavo Palomino Castelan
-- Josmar360
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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `Identificador_Area` char(3) NOT NULL,
  `Numero_Area` int NOT NULL,
  `Nombre_Area` varchar(15) NOT NULL,
  `Cantidad_Empleados` int NOT NULL,
  PRIMARY KEY (`Identificador_Area`),
  CONSTRAINT `Identificador_Areas_Valido` CHECK ((`Identificador_Area` in (_utf8mb4'L',_utf8mb4'M',_utf8mb4'P',_utf8mb4'PL'))),
  CONSTRAINT `Numero_Area_Positivo` CHECK ((`Numero_Area` > 0)),
  CONSTRAINT `Numeros_Positivos` CHECK ((`Cantidad_Empleados` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES ('L',3,'Lavado',1),('M',1,'Mostrador',2),('P',2,'Planta',1),('PL',4,'Planchado',1);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacoraproductos`
--

DROP TABLE IF EXISTS `bitacoraproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoraproductos` (
  `Clave` int NOT NULL AUTO_INCREMENT,
  `Operacion` varchar(15) DEFAULT NULL,
  `Usuario` varchar(30) DEFAULT NULL,
  `FechaHora` datetime DEFAULT NULL,
  `ClaveProducto_Nueva` char(10) DEFAULT NULL,
  `ClaveProducto_Anterior` char(10) DEFAULT NULL,
  `NombreProducto_Nuevo` varchar(40) DEFAULT NULL,
  `NombreProducto_Anterior` varchar(40) DEFAULT NULL,
  `Piezas_Nuevo` int DEFAULT NULL,
  `Piezas_Anterior` int DEFAULT NULL,
  `UM_Nueva` char(10) DEFAULT NULL,
  `UM_Anterior` char(10) DEFAULT NULL,
  `DescripcionProducto_Nueva` varchar(35) DEFAULT NULL,
  `DescripcionProducto_Anterior` varchar(35) DEFAULT NULL,
  `PrecioUnitario_Nuevo` float DEFAULT NULL,
  `PrecioUnitario_Anterior` float DEFAULT NULL,
  `Existencia_Nueva` int DEFAULT NULL,
  `Existencia_Anterior` int DEFAULT NULL,
  PRIMARY KEY (`Clave`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacoraproductos`
--

LOCK TABLES `bitacoraproductos` WRITE;
/*!40000 ALTER TABLE `bitacoraproductos` DISABLE KEYS */;
INSERT INTO `bitacoraproductos` VALUES (1,'INSERTO','Josmar@192.168.1.71','2022-05-01 15:27:03','V37',NULL,'Bolsa negra grande',NULL,50,NULL,'Piezas',NULL,'Caja',NULL,99.99,NULL,56,NULL),(2,'MODIFICO','Josmar@LAPTOP-OONQOSFN','2022-05-01 15:28:08','V37','V37','Bolsa Larga','Bolsa negra grande',50,50,'Piezas','Piezas','Caja','Caja',80.67,99.99,45,56),(3,'ELIMINO','Josmar@192.168.1.68','2022-05-01 15:46:35',NULL,'V37',NULL,'Bolsa Larga',NULL,50,NULL,'Piezas',NULL,'Caja',NULL,80.67,NULL,45),(4,'INSERTO','root@LAPTOP-OONQOSFN','2022-06-09 06:17:17','V37',NULL,'Bolsa negra grande',NULL,50,NULL,'Piezas',NULL,'Caja',NULL,99.99,NULL,56,NULL),(5,'MODIFICO','root@LAPTOP-OONQOSFN','2022-06-09 06:17:20','V37','V37','Bolsa Larga','Bolsa negra grande',50,50,'Piezas','Piezas','Caja','Caja',80.67,99.99,45,56),(6,'ELIMINO','root@LAPTOP-OONQOSFN','2022-06-09 06:17:23',NULL,'V37',NULL,'Bolsa Larga',NULL,50,NULL,'Piezas',NULL,'Caja',NULL,80.67,NULL,45),(7,'INSERTO','root@LAPTOP-OONQOSFN','2022-06-09 06:17:28','V37',NULL,'Bolsa negra grande',NULL,50,NULL,'Piezas',NULL,'Caja',NULL,99.99,NULL,56,NULL);
/*!40000 ALTER TABLE `bitacoraproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Telefono_Cliente` varchar(10) NOT NULL,
  `Primer_Nombre` varchar(15) NOT NULL,
  `Segundo_Nombre` varchar(15) DEFAULT NULL,
  `Primer_Apellido` varchar(15) NOT NULL,
  `Segundo_Apellido` varchar(15) NOT NULL,
  `Calle` varchar(20) NOT NULL,
  `Numero_Exterior` int NOT NULL,
  PRIMARY KEY (`Telefono_Cliente`),
  CONSTRAINT `Numero_Ext_Clientes` CHECK ((`Numero_Exterior` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('5503288379','Eduardo',' ','Romero','Torralba','Oriente 19',176),('5504711160','Araceli',' ','Ramirez','Gonzales','Oriente 1',132),('5526015450','Erika',' ','Castro','Dominguez','Jose Maria Morelos',127),('5529628501','Julieta',' ','Cruz','Cruz','Oriente 34',23),('5539630068','Julio',' ','Romero','Zambrano','Oriente 23',144),('5545303785','Aquiles',' ','Piña','Olvera','Oriente 22',166),('5551901738','Victoria',' ','Herrera','Mendoza','Loma 2',47),('5552393774','Jose',' ','Mendoza','Cordero','Oriente 13',143),('5552774867','Jordan','Miguel','Gutierrez','Lopez','Oriente 12',192),('5559849048','Alexis',' ','Bautista','Gonzales','Morelos',161),('5561150401','Mitzy','Ayelen','Ramirez','Ramirez','Oriente 24',156),('5563802500','Antonio',' ','Rivera','Garcia','Morelos',98),('5568346061','Virginia',' ','Romero','Hernandez','Loma 2',45),('5570472184','Jose','Guadalupe','Mendez','Funetes','Morelos',189),('5572210522','Lidia',' ','Hernandez','Lopez','Oriente 4',43),('5573498028','Tania',' ','Martinez','Olivares','Loma 2',45),('5574721936','Enrique',' ','Rivera','Esperon','Loma 2',79),('5574873193','Diego',' ','Hernandez','Moreno','Morelos',165),('5579578291','Fredy',' ','Ramirez','Ramirez','Loma 2',45),('5583119396','Stephani',' ','Fuentes','Gomez','Loma 2',78),('5583510568','Jose','Angel','Arzate','Torres','Oriente 13',152),('5586249212','Zaid',' ','Ramirez','Ramirez','Morelos',161),('5586740704','Casandra',' ','Gonzales','Cruz','Loma 2',89),('5588728726','Fabiola',' ','Romero','Oiguin','Oriente 7',186),('5591098389','Leonardo',' ','Saldivar','Gomez','Loma 2',48),('5592299421','Sergio',' ','Gonzales','Ramirez','Oriente 22',166),('5596842072','Misael',' ','Flores','Flores','Loma 2',45),('5596984932','Janet',' ','Catro','Olvera','Morelos',149),('5597133077','Alfredo',' ','Gonzales','Moreno','Oriente 20',12),('5598276753','Eduardo',' ','Pliego','Buen dia','Oriente 31',112);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaboradores` (
  `Telefono_Colaborador` char(10) NOT NULL,
  `Nombre_Colaborador` varchar(15) NOT NULL,
  `Primer_Apellido_Colaborador` varchar(15) NOT NULL,
  `Segundo_Apellido_Colaborador` varchar(15) NOT NULL,
  PRIMARY KEY (`Telefono_Colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
INSERT INTO `colaboradores` VALUES ('5513106553','Oscar','Riveros','Ortega');
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedidos`
--

DROP TABLE IF EXISTS `detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedidos` (
  `Numero_Pedido` char(10) NOT NULL,
  `ID_Producto` char(10) NOT NULL,
  `Cantidad_Producto` int NOT NULL,
  KEY `Numero_Pedido_FK` (`Numero_Pedido`),
  KEY `ID_Producto_FK` (`ID_Producto`),
  CONSTRAINT `ID_Producto_FK` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`Clave_Producto`),
  CONSTRAINT `Numero_Pedido_FK` FOREIGN KEY (`Numero_Pedido`) REFERENCES `pedidos` (`Numero_Pedido`),
  CONSTRAINT `Cantidad_Producto_Positivo` CHECK ((`Cantidad_Producto` >= 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedidos`
--

LOCK TABLES `detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `detalles_pedidos` DISABLE KEYS */;
INSERT INTO `detalles_pedidos` VALUES ('56236781','CPT-03',1),('56236781','V-33',1),('56236781','P-10',2),('56236781','T-B30-006',1),('56236781','HAN-01A',1),('56236781','HAN-06',1),('56236781','KC-02',2),('56236781','KC-04',2),('56236781','KC-09',2),('56236781','KC-16',2),('56236781','KC-23',2),('56236781','KC-25',1),('56236781','KC-28',1),('56236781','KC-12',1),('56236781','V-26',2),('56236781','V-14',2),('56236782','HAN-01A',1),('56236782','HAN-06',1),('56236782','T-B30-006',1),('56236782','V-26',2),('56236782','V-14',2),('56236783','CPT-03',1),('56236783','V-33',1),('56236783','P-10',2),('56236783','T-B30-006',1),('56236783','HAN-01A',1),('56236783','HAN-06',1),('56236783','KC-02',2),('56236783','KC-04',2),('56236783','KC-09',2),('56236783','KC-16',2),('56236783','KC-23',2),('56236783','KC-25',1),('56236783','KC-28',1),('56236783','KC-13',1),('56236783','V-26',2),('56236783','V-14',2);
/*!40000 ALTER TABLE `detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lavado`
--

DROP TABLE IF EXISTS `lavado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lavado` (
  `Folio_Nota` int NOT NULL,
  `Fecha_Entrada` date NOT NULL,
  `Identificador_Area` char(3) NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Estatus` varchar(15) NOT NULL,
  `Area_Siguiente` char(3) NOT NULL,
  PRIMARY KEY (`Fecha_Entrada`),
  KEY `Notas_Lavado_FK` (`Folio_Nota`),
  KEY `Identificador_Area_Lavado_FK` (`Identificador_Area`),
  CONSTRAINT `Identificador_Area_Lavado_FK` FOREIGN KEY (`Identificador_Area`) REFERENCES `areas` (`Identificador_Area`),
  CONSTRAINT `Notas_Lavado_FK` FOREIGN KEY (`Folio_Nota`) REFERENCES `notas` (`Folio_Nota`),
  CONSTRAINT `Area_Siguiente_Valida` CHECK ((`Area_Siguiente` = _utf8mb4'PL')),
  CONSTRAINT `Estatus_Lavado_Valido` CHECK ((`Estatus` in (_utf8mb4'Terminada',_utf8mb4'Pendiente')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lavado`
--

LOCK TABLES `lavado` WRITE;
/*!40000 ALTER TABLE `lavado` DISABLE KEYS */;
INSERT INTO `lavado` VALUES (754,'2021-02-08','L','11:30:00',NULL,NULL,'Pendiente','PL'),(750,'2021-02-12','L','11:30:00',NULL,NULL,'Pendiente','PL'),(755,'2021-08-03','L','11:30:00',NULL,NULL,'Pendiente','PL'),(756,'2021-08-10','L','11:30:00','2021-08-10','15:30:00','Terminada','PL'),(757,'2021-08-15','L','11:30:00','2021-08-15','15:30:00','Terminada','PL'),(804,'2021-09-14','L','11:30:00',NULL,NULL,'Pendiente','PL'),(806,'2021-09-18','L','11:30:00',NULL,NULL,'Pendiente','PL'),(807,'2021-09-25','L','11:30:00','2021-09-25','15:30:00','Terminada','PL'),(808,'2021-10-03','L','11:30:00','2021-10-03','15:30:00','Terminada','PL'),(809,'2021-10-07','L','11:30:00','2021-10-07','15:30:00','Terminada','PL'),(810,'2021-10-08','L','11:30:00',NULL,NULL,'Pendiente','PL'),(811,'2021-10-09','L','11:30:00',NULL,NULL,'Pendiente','PL'),(818,'2021-10-23','L','11:30:00',NULL,NULL,'Pendiente','PL'),(819,'2021-11-04','L','11:30:00',NULL,NULL,'Pendiente','PL');
/*!40000 ALTER TABLE `lavado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lavado_pendiente`
--

DROP TABLE IF EXISTS `lavado_pendiente`;
/*!50001 DROP VIEW IF EXISTS `lavado_pendiente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lavado_pendiente` AS SELECT 
 1 AS `Folio_Nota`,
 1 AS `Fecha_Entrada`,
 1 AS `Identificador_Area`,
 1 AS `Hora_Entrada`,
 1 AS `Fecha_Salida`,
 1 AS `Hora_Salida`,
 1 AS `Estatus`,
 1 AS `Area_Siguiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lavado_terminada`
--

DROP TABLE IF EXISTS `lavado_terminada`;
/*!50001 DROP VIEW IF EXISTS `lavado_terminada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lavado_terminada` AS SELECT 
 1 AS `Folio_Nota`,
 1 AS `Fecha_Entrada`,
 1 AS `Identificador_Area`,
 1 AS `Hora_Entrada`,
 1 AS `Fecha_Salida`,
 1 AS `Hora_Salida`,
 1 AS `Estatus`,
 1 AS `Area_Siguiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mostrador`
--

DROP TABLE IF EXISTS `mostrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mostrador` (
  `Folio_Nota` int NOT NULL,
  `Fecha_Entrada` date NOT NULL,
  `Identificador_Area` char(3) NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Fecha_Salida` date NOT NULL,
  `Hora_Salida` time NOT NULL,
  `Area_Siguiente` char(3) NOT NULL,
  `Estatus` varchar(15) NOT NULL,
  PRIMARY KEY (`Fecha_Entrada`),
  KEY `Identificador_Area_Mostrador_FK` (`Identificador_Area`),
  KEY `Notas_Mostrador_FK` (`Folio_Nota`),
  CONSTRAINT `Identificador_Area_Mostrador_FK` FOREIGN KEY (`Identificador_Area`) REFERENCES `areas` (`Identificador_Area`),
  CONSTRAINT `Notas_Mostrador_FK` FOREIGN KEY (`Folio_Nota`) REFERENCES `notas` (`Folio_Nota`),
  CONSTRAINT `Area_Siguiente_Mostrador_Valida` CHECK ((`Area_Siguiente` in (_utf8mb4'L',_utf8mb4'T',_utf8mb4'REP',_utf8mb4'P',_utf8mb4'PL'))),
  CONSTRAINT `Estatus_De_Mostrador_Valido` CHECK ((`Estatus` in (_utf8mb4'Enviada',_utf8mb4'Pendiente')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mostrador`
--

LOCK TABLES `mostrador` WRITE;
/*!40000 ALTER TABLE `mostrador` DISABLE KEYS */;
INSERT INTO `mostrador` VALUES (750,'2021-02-11','M','11:00:00','2021-02-11','19:30:00','L','Enviada'),(751,'2021-06-17','M','18:00:00','2021-06-17','19:30:00','T','Enviada'),(752,'2021-07-04','M','15:30:00','2021-07-04','19:30:00','REP','Enviada'),(753,'2021-07-31','M','14:20:00','2021-07-31','19:30:00','P','Enviada'),(754,'2021-08-01','M','12:00:00','2021-08-01','19:30:00','L','Enviada'),(757,'2021-08-14','M','13:45:00','2021-08-14','19:30:00','L','Enviada'),(758,'2021-08-22','M','15:50:00','2021-08-22','19:30:00','T','Enviada'),(759,'2021-08-24','M','17:40:00','2021-08-24','19:30:00','T','Enviada'),(755,'2021-09-02','M','16:25:00','2021-09-02','19:30:00','L','Enviada'),(801,'2021-09-04','M','14:35:00','2021-09-04','19:30:00','P','Enviada'),(756,'2021-09-07','M','16:30:00','2021-09-07','19:30:00','L','Enviada'),(802,'2021-09-08','M','19:20:00','2021-09-08','19:30:00','PL','Enviada'),(803,'2021-09-10','M','15:50:00','2021-09-10','19:30:00','PL','Enviada'),(804,'2021-09-13','M','07:42:00','2021-09-13','19:30:00','L','Enviada'),(805,'2021-09-14','M','16:55:00','2021-09-14','19:30:00','PL','Enviada'),(806,'2021-09-17','M','13:19:00','2021-09-17','19:30:00','L','Enviada'),(807,'2021-09-24','M','11:02:00','2021-09-24','19:30:00','L','Enviada'),(800,'2021-09-30','M','19:30:00','2021-09-30','19:30:00','T','Enviada'),(808,'2021-10-02','M','10:00:00','2021-10-02','19:30:00','L','Enviada'),(809,'2021-10-06','M','12:23:00','2021-10-06','19:30:00','L','Enviada'),(810,'2021-10-07','M','14:25:00','2021-10-07','19:30:00','L','Enviada'),(811,'2021-10-08','M','20:00:00','2021-10-08','19:30:00','L','Enviada'),(812,'2021-10-09','M','14:47:00','2021-10-09','19:30:00','PL','Enviada'),(813,'2021-10-10','M','13:22:00','2021-10-10','19:30:00','PL','Enviada'),(814,'2021-10-13','M','11:52:00','2021-10-13','19:30:00','PL','Enviada'),(815,'2021-10-16','M','16:34:00','2021-10-16','19:30:00','P','Enviada'),(816,'2021-10-18','M','17:34:00','2021-10-18','19:30:00','P','Enviada'),(817,'2021-10-19','M','13:20:00','2021-10-19','19:30:00','PL','Enviada'),(818,'2021-10-22','M','11:17:00','2021-10-22','19:30:00','L','Enviada'),(819,'2021-11-03','M','12:22:00','2021-11-03','19:30:00','L','Enviada');
/*!40000 ALTER TABLE `mostrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `Folio_Nota` int NOT NULL,
  `Telefono_Cliente` varchar(10) NOT NULL,
  `Tipo_Servicio` varchar(15) NOT NULL,
  `Fecha_Entrega_Estimada` date NOT NULL,
  `Fecha_Hora_Estimada` time NOT NULL,
  `Estatus` varchar(15) NOT NULL,
  PRIMARY KEY (`Folio_Nota`),
  KEY `Telefono_Clientes_FK` (`Telefono_Cliente`),
  CONSTRAINT `Telefono_Clientes_FK` FOREIGN KEY (`Telefono_Cliente`) REFERENCES `clientes` (`Telefono_Cliente`),
  CONSTRAINT `Estatus_Mostrador_Valido` CHECK ((`Estatus` in (_utf8mb4'En Lavado',_utf8mb4'En Teñido',_utf8mb4'En Reparacion',_utf8mb4'En Planta',_utf8mb4'En Planchado',_utf8mb4'En Mostrador',_utf8mb4''))),
  CONSTRAINT `Tipo_Servicio_Mostrador_Valido` CHECK ((`Tipo_Servicio` in (_utf8mb4'Lavado',_utf8mb4'Teñido',_utf8mb4'Reparación',_utf8mb4'Lavado en seco',_utf8mb4'Planchado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (750,'5572210522','Lavado','2021-02-13','19:30:00','En Lavado'),(751,'5526015450','Teñido','2021-06-24','19:30:00',''),(752,'5588728726','Reparación','2021-07-08','19:30:00',''),(753,'5552774867','Lavado en seco','2021-08-02','19:30:00',''),(754,'5570472184','Lavado','2021-08-03','19:30:00','En Lavado'),(755,'5529628501','Lavado','2021-09-04','19:30:00','En Lavado'),(756,'5583119396','Lavado','2021-07-11','19:30:00',''),(757,'5583510568','Lavado','2021-08-16','19:30:00',''),(758,'5586249212','Teñido','2021-08-26','19:30:00',''),(759,'5561150401','Teñido','2021-09-06','19:30:00',''),(800,'5568346061','Teñido','2021-10-07','19:30:00',''),(801,'5592299421','Lavado en seco','2021-09-06','19:30:00',''),(802,'5574721936','Planchado','2021-09-09','19:30:00','En Planchado'),(803,'5574721936','Planchado','2021-09-11','19:30:00','En Planchado'),(804,'5574873193','Lavado','2021-09-15','19:30:00','En Lavado'),(805,'5545303785','Planchado','2021-09-14','19:30:00','En Planchado'),(806,'5579578291','Lavado','2021-09-20','19:30:00','En Lavado'),(807,'5598276753','Lavado','2021-09-27','19:30:00',''),(808,'5573498028','Lavado','2021-10-04','19:30:00',''),(809,'5596984932','Lavado','2021-10-08','19:30:00',''),(810,'5551901738','Lavado','2021-10-09','19:30:00','En Lavado'),(811,'5504711160','Lavado','2021-10-10','19:30:00','En Lavado'),(812,'5563802500','Planchado','2021-10-10','19:30:00',''),(813,'5503288379','Planchado','2021-10-11','19:30:00',''),(814,'5552393774','Planchado','2021-10-15','19:30:00','En Planchado'),(815,'5591098389','Lavado en seco','2021-10-18','19:30:00',''),(816,'5539630068','Lavado en seco','2021-10-20','19:30:00',''),(817,'5596842072','Planchado','2021-10-21','19:30:00',''),(818,'5559849048','Lavado','2021-10-24','19:30:00','En Lavado'),(819,'5586740704','Lavado','2021-11-05','19:30:00','En Lavado'),(820,'5586740704','Lavado en seco','2021-11-06','16:30:00','En Planta');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `Numero_Pedido` char(10) NOT NULL,
  `Fecha_Pedido` date NOT NULL,
  `Total_Pagar` float NOT NULL,
  `Nombre_Distribuidora` varchar(25) NOT NULL,
  `Pago_Extra` float NOT NULL,
  PRIMARY KEY (`Numero_Pedido`),
  KEY `Nombre_Distribuidora_FK` (`Nombre_Distribuidora`),
  CONSTRAINT `Nombre_Distribuidora_FK` FOREIGN KEY (`Nombre_Distribuidora`) REFERENCES `proveedores` (`Nombre_Distribuidora`),
  CONSTRAINT `Pago_Extra_Valido` CHECK ((`Pago_Extra` > 0)),
  CONSTRAINT `Total_Pagar_Valido` CHECK ((`Total_Pagar` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES ('56236781','2020-11-01',5334.92,'Velasquez',80),('56236782','2020-01-28',4172.36,'Velasquez',80),('56236783','2020-02-11',5334.92,'Velasquez',80),('56236784','2020-02-25',5346.34,'Rodriguez',90),('56236785','2020-03-11',4783.65,'Rodriguez',90),('56236786','2020-03-25',5783.56,'Rodriguez',90);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planchado`
--

DROP TABLE IF EXISTS `planchado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planchado` (
  `Folio_Nota` int NOT NULL,
  `Identificador_Area` char(3) NOT NULL,
  `Fecha_Entrada` date NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Estatus` varchar(15) NOT NULL,
  `Area_Siguiente` char(3) NOT NULL,
  PRIMARY KEY (`Fecha_Entrada`),
  KEY `Notas_Planchado_FK` (`Folio_Nota`),
  KEY `Identificador_Area_Planchado_FK` (`Identificador_Area`),
  CONSTRAINT `Identificador_Area_Planchado_FK` FOREIGN KEY (`Identificador_Area`) REFERENCES `areas` (`Identificador_Area`),
  CONSTRAINT `Notas_Planchado_FK` FOREIGN KEY (`Folio_Nota`) REFERENCES `notas` (`Folio_Nota`),
  CONSTRAINT `Area_Siguiente_Planchado_Valido` CHECK ((`Area_Siguiente` = _utf8mb4'M')),
  CONSTRAINT `Estatus_Planchado_Valido` CHECK ((`Estatus` in (_utf8mb4'Terminada',_utf8mb4'Pendiente')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planchado`
--

LOCK TABLES `planchado` WRITE;
/*!40000 ALTER TABLE `planchado` DISABLE KEYS */;
INSERT INTO `planchado` VALUES (802,'PL','2021-09-09','16:00:00',NULL,NULL,'Pendiente','M'),(803,'PL','2021-09-11','16:00:00',NULL,NULL,'Pendiente','M'),(805,'PL','2021-09-14','16:00:00',NULL,NULL,'Pendiente','M'),(812,'PL','2021-10-10','16:00:00','2021-10-10','19:40:00','Terminada','M'),(813,'PL','2021-10-11','16:00:00','2021-10-11','19:40:00','Terminada','M'),(814,'PL','2021-10-12','16:00:00',NULL,NULL,'Pendiente','M'),(817,'PL','2021-10-13','16:00:00','2021-10-17','19:40:00','Terminada','M');
/*!40000 ALTER TABLE `planchado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `planchado_pendiente`
--

DROP TABLE IF EXISTS `planchado_pendiente`;
/*!50001 DROP VIEW IF EXISTS `planchado_pendiente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `planchado_pendiente` AS SELECT 
 1 AS `Folio_Nota`,
 1 AS `Identificador_Area`,
 1 AS `Fecha_Entrada`,
 1 AS `Hora_Entrada`,
 1 AS `Fecha_Salida`,
 1 AS `Hora_Salida`,
 1 AS `Estatus`,
 1 AS `Area_Siguiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `planchado_terminado`
--

DROP TABLE IF EXISTS `planchado_terminado`;
/*!50001 DROP VIEW IF EXISTS `planchado_terminado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `planchado_terminado` AS SELECT 
 1 AS `Folio_Nota`,
 1 AS `Identificador_Area`,
 1 AS `Fecha_Entrada`,
 1 AS `Hora_Entrada`,
 1 AS `Fecha_Salida`,
 1 AS `Hora_Salida`,
 1 AS `Estatus`,
 1 AS `Area_Siguiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `planta`
--

DROP TABLE IF EXISTS `planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planta` (
  `Folio_Nota` int NOT NULL,
  `Fecha_Entrada` date NOT NULL,
  `Identificador_Area` char(3) NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Estatus` varchar(15) NOT NULL,
  `Area_Siguiente` char(3) NOT NULL,
  PRIMARY KEY (`Fecha_Entrada`),
  KEY `NotasPlanta_FK` (`Folio_Nota`),
  KEY `Identificador_Area_Planta_FK` (`Identificador_Area`),
  CONSTRAINT `Identificador_Area_Planta_FK` FOREIGN KEY (`Identificador_Area`) REFERENCES `areas` (`Identificador_Area`),
  CONSTRAINT `NotasPlanta_FK` FOREIGN KEY (`Folio_Nota`) REFERENCES `notas` (`Folio_Nota`),
  CONSTRAINT `Area_Siguiente_Planta_Valido` CHECK ((`Area_Siguiente` = _utf8mb4'PL')),
  CONSTRAINT `Estatus_Planta_Valido` CHECK ((`Estatus` in (_utf8mb4'Terminada',_utf8mb4'Pendiente')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planta`
--

LOCK TABLES `planta` WRITE;
/*!40000 ALTER TABLE `planta` DISABLE KEYS */;
INSERT INTO `planta` VALUES (753,'2021-07-01','P','11:00:00','2021-07-01','15:00:00','Terminada','PL'),(801,'2021-09-05','P','11:00:00','2021-09-05','15:00:00','Terminada','PL'),(815,'2021-10-17','P','11:00:00','2021-10-17','15:00:00','Terminada','PL'),(816,'2021-10-19','P','11:00:00','2021-10-19','15:00:00','Terminada','PL'),(820,'2021-11-16','P','11:00:00',NULL,NULL,'Pendiente','PL');
/*!40000 ALTER TABLE `planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `planta_pendiente`
--

DROP TABLE IF EXISTS `planta_pendiente`;
/*!50001 DROP VIEW IF EXISTS `planta_pendiente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `planta_pendiente` AS SELECT 
 1 AS `Folio_Nota`,
 1 AS `Fecha_Entrada`,
 1 AS `Identificador_Area`,
 1 AS `Hora_Entrada`,
 1 AS `Fecha_Salida`,
 1 AS `Hora_Salida`,
 1 AS `Estatus`,
 1 AS `Area_Siguiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `planta_terminada`
--

DROP TABLE IF EXISTS `planta_terminada`;
/*!50001 DROP VIEW IF EXISTS `planta_terminada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `planta_terminada` AS SELECT 
 1 AS `Folio_Nota`,
 1 AS `Fecha_Entrada`,
 1 AS `Identificador_Area`,
 1 AS `Hora_Entrada`,
 1 AS `Fecha_Salida`,
 1 AS `Hora_Salida`,
 1 AS `Estatus`,
 1 AS `Area_Siguiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `precios_prendas`
--

DROP TABLE IF EXISTS `precios_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios_prendas` (
  `Tipo_Prenda` varchar(18) NOT NULL,
  `Precio_Unitario` float NOT NULL,
  PRIMARY KEY (`Tipo_Prenda`),
  CONSTRAINT `Precio_Unitatio_Prenda_Valido` CHECK ((`Precio_Unitario` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_prendas`
--

LOCK TABLES `precios_prendas` WRITE;
/*!40000 ALTER TABLE `precios_prendas` DISABLE KEYS */;
INSERT INTO `precios_prendas` VALUES ('Abrigo',60),('Blusa',32),('Camisa',32),('Capa',30),('Chaleco',40),('Chalinas',15),('Chamarra',65),('Cobertor',85),('Cobija',80),('Corbata',25),('Edredon',100),('Falda',35),('Gabardina',55),('Pans',35),('Pantalon',32),('Playera',35),('Saco',32),('Sudadera',35),('Traje',64),('Vestido de noche',70);
/*!40000 ALTER TABLE `precios_prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prendas`
--

DROP TABLE IF EXISTS `prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prendas` (
  `Folio_Nota` int NOT NULL,
  `Tipo_Prenda` varchar(18) NOT NULL,
  `Color` varchar(15) NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Total` float NOT NULL,
  `Observaciones` varchar(30) NOT NULL,
  `Fecha_Entrada` date NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Fecha_Salida` date NOT NULL,
  `Hora_Salida` time NOT NULL,
  KEY `Precios_Prendas_FK` (`Tipo_Prenda`),
  KEY `Notas_FK` (`Folio_Nota`),
  CONSTRAINT `Notas_FK` FOREIGN KEY (`Folio_Nota`) REFERENCES `notas` (`Folio_Nota`),
  CONSTRAINT `Precios_Prendas_FK` FOREIGN KEY (`Tipo_Prenda`) REFERENCES `precios_prendas` (`Tipo_Prenda`),
  CONSTRAINT `Cantidad_Prendas_Valido` CHECK ((`Cantidad` > 0)),
  CONSTRAINT `Precio_Total_Prendas_Valido` CHECK ((`Precio_Total` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prendas`
--

LOCK TABLES `prendas` WRITE;
/*!40000 ALTER TABLE `prendas` DISABLE KEYS */;
INSERT INTO `prendas` VALUES (750,'Pantalon','Negro',2,64,'Ninguna','2021-02-11','11:00:00','2021-02-13','13:10:00'),(751,'Sudadera','Azul',3,105,'Roto de la manga','2021-06-17','18:00:00','2021-06-24','18:34:00'),(752,'Saco','Negro',5,160,'Ninguna','2021-07-04','15:30:00','2021-07-08','14:45:00'),(753,'Traje','Gris',4,256,'Ninguna','2021-07-31','14:20:00','2021-08-02','16:23:00'),(754,'Abrigo','Blanco',2,120,'Mancha de cloro','2021-08-01','12:00:00','2021-08-03','13:45:00'),(755,'Chamarra','Verde',3,195,'Ninguna','2021-08-02','16:25:00','2021-08-04','16:14:00'),(756,'Vestido de noche','Rojo',6,420,'Luido','2021-08-09','16:30:00','2021-08-11','17:12:00'),(757,'Playera','Verde',2,70,'Ninguna','2021-08-14','13:45:00','2021-08-16','16:23:00'),(758,'Blusa','Blanco',2,64,'Ninguna','2021-08-22','15:50:00','2021-08-26','16:19:00'),(759,'Camisa','Lila',2,64,'Ninguna','2021-08-24','17:40:00','2021-08-28','14:45:00'),(800,'Edredon','Azul',2,200,'Ninguna','2021-09-30','19:30:00','2021-10-07','16:24:00'),(801,'Cobija','Ginda',2,160,'Mchas de grasa','2021-09-04','14:35:00','2021-09-06','16:24:00'),(802,'Cobertor','Blanco',1,85,'Ninguna','2021-09-08','19:20:00','2021-09-09','16:16:00'),(803,'Sudadera','Verde',1,35,'Ninguna','2021-09-10','15:50:00','2021-09-11','08:12:00'),(804,'Blusa','Blanco',1,32,'Ninguna','2021-09-13','17:45:00','2021-09-15','09:28:00'),(805,'Chaleco','Azul',3,40,'Rasgado','2021-09-13','16:50:00','2021-09-14','12:46:00'),(806,'Capa','Negra',1,30,'Ninguna','2021-09-17','13:25:00','2021-09-20','13:48:00'),(807,'Gabardina','Café',1,55,'Ninguna','2021-09-24','11:30:00','2021-09-27','18:37:00'),(808,'Falda','Negro',2,70,'Pintada','2021-10-02','10:00:00','2021-10-04','12:36:00'),(809,'Corbata','Lila',9,225,'Roto de un lado','2021-10-06','12:00:00','2021-10-08','18:29:00'),(810,'Pantalon','Azul marino',4,128,'Ninguna','2021-10-07','10:30:00','2021-10-09','13:39:00'),(811,'Pans','Rojo',4,140,'Ninguna','2021-10-08','17:55:00','2021-10-10','16:24:00'),(812,'Chalinas','Blanco',15,225,'Ninguna','2021-10-09','15:40:00','2021-10-10','13:15:00'),(813,'Camisa','Amarillo',12,384,'Ninguna','2021-10-10','19:00:00','2021-10-11','16:10:00'),(814,'Pantalon','Gris oxfo',7,224,'Ninguna','2021-10-13','16:00:00','2021-10-15','15:14:00'),(815,'Sudadera','Beige',6,210,'Ninguna','2021-10-16','14:15:00','2021-10-18','16:12:00'),(816,'Abrigo','Rosa',3,180,'Manchas de grasa','2021-10-18','20:00:00','2021-10-20','12:14:00'),(817,'Traje','Gris',3,180,'Ninguna','2021-10-19','13:45:00','2021-10-21','16:15:00'),(818,'Saco','Morado',3,96,'Ninguna','2021-10-22','11:30:00','2021-10-24','13:15:00'),(819,'Pantalon','Verde',8,256,'Ninguna','2021-11-03','14:50:00','2021-11-05','15:13:00');
/*!40000 ALTER TABLE `prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Clave_Producto` char(10) NOT NULL,
  `Nombre_Producto` varchar(40) NOT NULL,
  `Piezas` int NOT NULL,
  `UM` char(10) NOT NULL,
  `Descripcion_Producto` varchar(35) DEFAULT NULL,
  `Precio_Unitario` float NOT NULL,
  `Existencia` int NOT NULL,
  PRIMARY KEY (`Clave_Producto`),
  CONSTRAINT `Existencia_Productos_Valido` CHECK ((`Existencia` >= 0)),
  CONSTRAINT `Piezas_Productos_Valido` CHECK ((`Piezas` > 0)),
  CONSTRAINT `Precio_Unitario_Productos_Valido` CHECK ((`Precio_Unitario` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('CPT-03','Carton para corbata',100,'Piezas','Caja',92.8,35),('HAN-01A','Gancho strut dorado o blanco',500,'Piezas','Caja',1000,200),('HAN-06','Gancho estandar azul cal 12,5',500,'Piezas','Caja',645,175),('KC-02','Jabon liquido para ropa blanca',4,'Litros','Garrafon',60.7,1),('KC-04','Jabon liquido para ropa obscura',4,'Litros','Garrafon',60.7,2),('KC-09','Jabon liquido aviva el color',4,'Litros','Garrafon',337.63,2),('KC-12','Predesmanchado para cuello y puños',4,'Litros','Garrafon',59.6,1),('KC-13','Predesmanchador',3,'Litros','Garrafon',59.6,2),('KC-16','Suavizante con agadable aroma',4,'Litros','Garrafon',90.6,2),('KC-23','Suavizante de telas',3,'Litros','Garrafon',57.9,1),('KC-25','Ultra Klin',3,'Litros','Garrafon',107.8,2),('KC-28','Pino klin',3,'Litros','Garrafon',49.28,1),('P-10','Rollo para marcar',10,'Metros','Caja',39.44,2),('T-B30-006','Paquete caballete engomado importado',500,'Piezas','Caja',255.2,350),('V-14','Rollo bolsa para vestido largo',25,'Kilos','Rollo',568.04,10),('V-26','Rollo bolsa para seco',25,'Kilos','Rollo',568.04,15),('V-33','Bolsa para corbata',100,'Piezas','Rollo',92.8,50),('V37','Bolsa negra grande',50,'Piezas','Caja',99.99,56);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Nombre_Distribuidora` varchar(25) NOT NULL,
  `Codigo_Postal` char(5) NOT NULL,
  `Calle` varchar(25) NOT NULL,
  `Numero_Exterior` int NOT NULL,
  `Colonia` varchar(25) NOT NULL,
  `Telefono_Principal` char(10) NOT NULL,
  `Telefono_Alterno` char(10) DEFAULT NULL,
  `Correo_Electronico` char(35) NOT NULL,
  `Metodo_Pago` varchar(15) NOT NULL,
  `Catalogo_Productos` varchar(50) NOT NULL,
  `Municipio` varchar(15) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Vigente` bit(1) NOT NULL,
  PRIMARY KEY (`Nombre_Distribuidora`),
  CONSTRAINT `Numero_Exterior_Proveedor_Valido` CHECK ((`Numero_Exterior` >= 0)),
  CONSTRAINT `Vigente_Proveedores_Valido` CHECK ((`Vigente` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES ('Alejandro','13205','Oriente',4,'Loma Bonita','5542669356','5611432509','elejo65@gmail.com','Efectivo','Detergentes y accesorios','Chimualhuacán','Estado de México',_binary ''),('Rodriguez','13277','Gomez',45,'San Juan Ixhuatepec','5538571840','5618265387','marthavel@gmail.com','Efectivo','Accesorios y reparaciones','Chimalhuacán','Estado de México',_binary '\0'),('Velasquez','54180','Jose Ma. Pino Suarez',8,'San Juan Ixhuatepec','57460963','27333631','distribuidoravelasquez@hotmail.com','Efectivo','Accesorios para tintoreria y lavancerias','Tlanepantla','Estado de mexico',_binary '\0');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenido_reparacion`
--

DROP TABLE IF EXISTS `tenido_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenido_reparacion` (
  `Folio_Nota` int NOT NULL,
  `Cantidad_Prendas` int NOT NULL,
  `Tipo_Servicio` varchar(25) NOT NULL,
  `Telefono_Colaborador` char(10) NOT NULL,
  `Estatus` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Cantidad_Prendas`),
  KEY `Nota_Tenido_FK` (`Folio_Nota`),
  KEY `Colaborador_FK` (`Telefono_Colaborador`),
  CONSTRAINT `Colaborador_FK` FOREIGN KEY (`Telefono_Colaborador`) REFERENCES `colaboradores` (`Telefono_Colaborador`),
  CONSTRAINT `Nota_Tenido_FK` FOREIGN KEY (`Folio_Nota`) REFERENCES `notas` (`Folio_Nota`),
  CONSTRAINT `Cantidad_Prendas_Tenido_Valido` CHECK ((`Cantidad_Prendas` > 0)),
  CONSTRAINT `Estatus_Tenido_Valido` CHECK ((`Estatus` in (_utf8mb4'Terminada',_utf8mb4'Pendiente')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenido_reparacion`
--

LOCK TABLES `tenido_reparacion` WRITE;
/*!40000 ALTER TABLE `tenido_reparacion` DISABLE KEYS */;
INSERT INTO `tenido_reparacion` VALUES (752,1,'Teñido','5513106553','Terminada'),(751,2,'Reparacion de cierres','5513106553','Pendiente'),(758,3,'Teñido','5513106553','Terminada'),(759,4,'Teñido','5513106553','Terminada'),(800,5,'Teñido','5513106553','Pendiente');
/*!40000 ALTER TABLE `tenido_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `lavado_pendiente`
--

/*!50001 DROP VIEW IF EXISTS `lavado_pendiente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lavado_pendiente` AS select `lavado`.`Folio_Nota` AS `Folio_Nota`,`lavado`.`Fecha_Entrada` AS `Fecha_Entrada`,`lavado`.`Identificador_Area` AS `Identificador_Area`,`lavado`.`Hora_Entrada` AS `Hora_Entrada`,`lavado`.`Fecha_Salida` AS `Fecha_Salida`,`lavado`.`Hora_Salida` AS `Hora_Salida`,`lavado`.`Estatus` AS `Estatus`,`lavado`.`Area_Siguiente` AS `Area_Siguiente` from `lavado` where (`lavado`.`Estatus` = 'Pendiente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lavado_terminada`
--

/*!50001 DROP VIEW IF EXISTS `lavado_terminada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lavado_terminada` AS select `lavado`.`Folio_Nota` AS `Folio_Nota`,`lavado`.`Fecha_Entrada` AS `Fecha_Entrada`,`lavado`.`Identificador_Area` AS `Identificador_Area`,`lavado`.`Hora_Entrada` AS `Hora_Entrada`,`lavado`.`Fecha_Salida` AS `Fecha_Salida`,`lavado`.`Hora_Salida` AS `Hora_Salida`,`lavado`.`Estatus` AS `Estatus`,`lavado`.`Area_Siguiente` AS `Area_Siguiente` from `lavado` where (`lavado`.`Estatus` = 'Terminada') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `planchado_pendiente`
--

/*!50001 DROP VIEW IF EXISTS `planchado_pendiente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `planchado_pendiente` AS select `planchado`.`Folio_Nota` AS `Folio_Nota`,`planchado`.`Identificador_Area` AS `Identificador_Area`,`planchado`.`Fecha_Entrada` AS `Fecha_Entrada`,`planchado`.`Hora_Entrada` AS `Hora_Entrada`,`planchado`.`Fecha_Salida` AS `Fecha_Salida`,`planchado`.`Hora_Salida` AS `Hora_Salida`,`planchado`.`Estatus` AS `Estatus`,`planchado`.`Area_Siguiente` AS `Area_Siguiente` from `planchado` where (`planchado`.`Estatus` = 'Pendiente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `planchado_terminado`
--

/*!50001 DROP VIEW IF EXISTS `planchado_terminado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `planchado_terminado` AS select `planchado`.`Folio_Nota` AS `Folio_Nota`,`planchado`.`Identificador_Area` AS `Identificador_Area`,`planchado`.`Fecha_Entrada` AS `Fecha_Entrada`,`planchado`.`Hora_Entrada` AS `Hora_Entrada`,`planchado`.`Fecha_Salida` AS `Fecha_Salida`,`planchado`.`Hora_Salida` AS `Hora_Salida`,`planchado`.`Estatus` AS `Estatus`,`planchado`.`Area_Siguiente` AS `Area_Siguiente` from `planchado` where (`planchado`.`Estatus` = 'Terminada') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `planta_pendiente`
--

/*!50001 DROP VIEW IF EXISTS `planta_pendiente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `planta_pendiente` AS select `planta`.`Folio_Nota` AS `Folio_Nota`,`planta`.`Fecha_Entrada` AS `Fecha_Entrada`,`planta`.`Identificador_Area` AS `Identificador_Area`,`planta`.`Hora_Entrada` AS `Hora_Entrada`,`planta`.`Fecha_Salida` AS `Fecha_Salida`,`planta`.`Hora_Salida` AS `Hora_Salida`,`planta`.`Estatus` AS `Estatus`,`planta`.`Area_Siguiente` AS `Area_Siguiente` from `planta` where (`planta`.`Estatus` = 'Pendiente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `planta_terminada`
--

/*!50001 DROP VIEW IF EXISTS `planta_terminada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `planta_terminada` AS select `planta`.`Folio_Nota` AS `Folio_Nota`,`planta`.`Fecha_Entrada` AS `Fecha_Entrada`,`planta`.`Identificador_Area` AS `Identificador_Area`,`planta`.`Hora_Entrada` AS `Hora_Entrada`,`planta`.`Fecha_Salida` AS `Fecha_Salida`,`planta`.`Hora_Salida` AS `Hora_Salida`,`planta`.`Estatus` AS `Estatus`,`planta`.`Area_Siguiente` AS `Area_Siguiente` from `planta` where (`planta`.`Estatus` = 'Terminada') */;
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

-- Dump completed on 2022-06-14 18:34:17
