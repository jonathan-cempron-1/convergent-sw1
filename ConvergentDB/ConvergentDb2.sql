CREATE DATABASE  IF NOT EXISTS `convergentDb2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `convergentDb2`;
-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: convergentDb2
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `idAccount` int(11) NOT NULL AUTO_INCREMENT,
  `idBank` int(11) NOT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `isResolved` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=66600002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (66600000,22200000,'2018-01-01',NULL,0),(66600001,22200001,'2018-01-01','2018-02-01',1);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountInfo`
--

DROP TABLE IF EXISTS `AccountInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountInfo` (
  `idAccountInfo` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(45) DEFAULT NULL,
  `idAccount` int(11) NOT NULL,
  PRIMARY KEY (`idAccountInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=77700005 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountInfo`
--

LOCK TABLES `AccountInfo` WRITE;
/*!40000 ALTER TABLE `AccountInfo` DISABLE KEYS */;
INSERT INTO `AccountInfo` VALUES (77700000,'account information here',66600000),(77700001,'account info here',66600000),(77700002,'account info here',66600001),(77700003,'account info here',66600001),(77700004,'account info here',66600000);
/*!40000 ALTER TABLE `AccountInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountStatus`
--

DROP TABLE IF EXISTS `AccountStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountStatus` (
  `idAccountStatus` int(11) NOT NULL AUTO_INCREMENT,
  `fvStatus` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `actionPlan` varchar(45) DEFAULT NULL,
  `dateSaved` datetime DEFAULT CURRENT_TIMESTAMP,
  `idAccount` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  PRIMARY KEY (`idAccountStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=10100002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountStatus`
--

LOCK TABLES `AccountStatus` WRITE;
/*!40000 ALTER TABLE `AccountStatus` DISABLE KEYS */;
INSERT INTO `AccountStatus` VALUES (10100000,'PRESENT','remarks here','action plan here','2018-02-06 15:00:38',66600000,11100000),(10100001,'MISSING','remark here','action plan here','2018-02-06 15:00:38',66600001,11100001);
/*!40000 ALTER TABLE `AccountStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `completeAddress` varchar(45) NOT NULL,
  `zipCode` varchar(45) DEFAULT NULL,
  `dateSaved` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` tinyint(4) DEFAULT NULL,
  `idLocation` int(11) DEFAULT NULL,
  `idOwner` int(11) NOT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=44400009 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (44400000,'calamba laguna','4027','2018-02-06 14:23:09',1,33300000,11100000),(44400001,'tondo manila','1012','2018-02-06 14:25:46',1,33300001,11100001),(44400002,'malate manila','1004','2018-02-06 14:29:12',1,33300001,22200000),(44400003,'cubao quezon city','1109','2018-02-06 14:32:44',1,33300002,22200001),(44400004,'mactan cebu','6016','2018-02-06 14:35:33',1,33300003,11100002),(44400005,'tondo manila','1012','2018-02-06 15:07:40',1,33300001,10200000),(44400006,'tondo manila','1012','2018-02-06 15:07:40',1,33300001,10200001),(44400007,'tondo manila','1012','2018-02-06 15:15:39',1,33300001,10300000),(44400008,'tondo manila','1012','2018-02-06 15:15:39',1,33300001,10300001);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignment` (
  `idAssignment` int(11) NOT NULL AUTO_INCREMENT,
  `idAccount` varchar(45) NOT NULL,
  `idEmployee` varchar(45) NOT NULL,
  `dateStart` date NOT NULL,
  `dateEnd` date DEFAULT NULL,
  PRIMARY KEY (`idAssignment`)
) ENGINE=InnoDB AUTO_INCREMENT=10400002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
INSERT INTO `Assignment` VALUES (10400000,'66600000','11100000','2017-12-12',NULL),(10400001,'66600001','11100001','2017-11-11',NULL);
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bank`
--

DROP TABLE IF EXISTS `Bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bank` (
  `idBank` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `branch` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBank`)
) ENGINE=InnoDB AUTO_INCREMENT=22200002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bank`
--

LOCK TABLES `Bank` WRITE;
/*!40000 ALTER TABLE `Bank` DISABLE KEYS */;
INSERT INTO `Bank` VALUES (22200000,'ucpb','p.ocampo'),(22200001,'bdo','cubao');
/*!40000 ALTER TABLE `Bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactInfo`
--

DROP TABLE IF EXISTS `ContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactInfo` (
  `idContactInfo` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `contactInfo` varchar(45) NOT NULL,
  `dateSaved` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `idOwner` int(11) DEFAULT NULL,
  PRIMARY KEY (`idContactInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=55500009 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactInfo`
--

LOCK TABLES `ContactInfo` WRITE;
/*!40000 ALTER TABLE `ContactInfo` DISABLE KEYS */;
INSERT INTO `ContactInfo` VALUES (55500000,'celno','5550123','2018-02-06 14:40:12',1,11100000),(55500001,'email','qq123@gmail.com','2018-02-06 14:41:46',1,11100001),(55500002,'celno','5550124','2018-02-06 14:41:46',1,11100002),(55500003,'telno','4220000','2018-02-06 14:41:46',1,22200000),(55500004,'telno','193','2018-02-06 14:41:46',1,22200001),(55500005,'telno','666666','2018-02-06 15:08:33',1,10200000),(55500006,'telno','666555','2018-02-06 15:08:33',1,10200001),(55500007,'telno','666666','2018-02-06 15:14:42',1,10300000),(55500008,'telno','666555','2018-02-06 15:14:42',1,10300001);
/*!40000 ALTER TABLE `ContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `idEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `bday` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT '1',
  `adminPrivilege` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=11100003 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (11100000,'jose rizal','jose','abc123','1861-06-19','male',1,1),(11100001,'andres bonifacio','andres','abc123','1863-11-30','male',1,0),(11100002,'lapu lapu','lapulapu','abc123','1480-02-03','male',0,0);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `idLocation` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`idLocation`)
) ENGINE=InnoDB AUTO_INCREMENT=33300004 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (33300000,'laguna',121.2,14.1),(33300001,'manila',121,14.35),(33300002,'quezon city',121.02,14.38),(33300003,'mactan',123.58,10.8);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonInterest`
--

DROP TABLE IF EXISTS `PersonInterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonInterest` (
  `idPersonInterest` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `idAccount` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersonInterest`)
) ENGINE=InnoDB AUTO_INCREMENT=10200002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonInterest`
--

LOCK TABLES `PersonInterest` WRITE;
/*!40000 ALTER TABLE `PersonInterest` DISABLE KEYS */;
INSERT INTO `PersonInterest` VALUES (10200000,'hideki tojo','male','1884-12-30','66600000'),(10200001,'adolf hitler','male','1889-04-20','66600001');
/*!40000 ALTER TABLE `PersonInterest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourcePerson`
--

DROP TABLE IF EXISTS `ResourcePerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourcePerson` (
  `idResourcePerson` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `idPersonInterest` varchar(45) NOT NULL,
  PRIMARY KEY (`idResourcePerson`)
) ENGINE=InnoDB AUTO_INCREMENT=10300002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourcePerson`
--

LOCK TABLES `ResourcePerson` WRITE;
/*!40000 ALTER TABLE `ResourcePerson` DISABLE KEYS */;
INSERT INTO `ResourcePerson` VALUES (10300000,'Katsuko Ito','female','wife','10200000'),(10300001,'Klara Hitler','female','mother','10200000');
/*!40000 ALTER TABLE `ResourcePerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicle` (
  `idVehicle` int(11) NOT NULL AUTO_INCREMENT,
  `numberPlate` varchar(45) NOT NULL,
  `make` varchar(45) NOT NULL,
  `year` int(11) NOT NULL,
  `model` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `chassisNum` varchar(45) DEFAULT NULL,
  `engineNum` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `idAccount` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`idVehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=88800002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (88800000,'abc123','toyota',2010,'corolla','red','abc123pkp420','pkp4201bc123','/home/user/Pictures/car1.jpg',66600000,350000),(88800001,'pkp420','nissan',1990,'cefiro','gold','kek123pkp123','pkp123kek123','/home/user/Pictures/car2.jpg',66600001,100000);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleInfo`
--

DROP TABLE IF EXISTS `VehicleInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleInfo` (
  `idVehicleInfo` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(45) DEFAULT NULL,
  `dateSaved` datetime DEFAULT CURRENT_TIMESTAMP,
  `idVehicle` varchar(45) NOT NULL,
  PRIMARY KEY (`idVehicleInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=99900002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleInfo`
--

LOCK TABLES `VehicleInfo` WRITE;
/*!40000 ALTER TABLE `VehicleInfo` DISABLE KEYS */;
INSERT INTO `VehicleInfo` VALUES (99900000,'vehicle info here','2018-02-06 14:57:53','88800000'),(99900001,'vehicle info here','2018-02-06 14:58:06','88800001');
/*!40000 ALTER TABLE `VehicleInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-06 15:29:56
