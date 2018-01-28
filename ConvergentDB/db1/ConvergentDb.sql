CREATE DATABASE  IF NOT EXISTS `convergentDb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `convergentDb`;
-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: convergentDb
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
  `idAccount` int(11) NOT NULL,
  `idPersonInterest` int(11) NOT NULL,
  `idBank` int(11) NOT NULL,
  `genStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountStatus`
--

DROP TABLE IF EXISTS `AccountStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountStatus` (
  `idAccountStatus` int(11) NOT NULL,
  `fvStatus` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `actionPlan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAccountStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountStatus`
--

LOCK TABLES `AccountStatus` WRITE;
/*!40000 ALTER TABLE `AccountStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccountStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignment` (
  `idAssignment` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`idAssignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bank`
--

DROP TABLE IF EXISTS `Bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bank` (
  `idBank` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `completeAddress` varchar(45) NOT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `idLocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bank`
--

LOCK TABLES `Bank` WRITE;
/*!40000 ALTER TABLE `Bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `idEmployee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `adminPrivelege` int(11) DEFAULT '0',
  `resolved` int(11) DEFAULT '0',
  `unresolved` int(11) DEFAULT '0',
  `removed` int(11) DEFAULT '0',
  `idlocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeAddress`
--

DROP TABLE IF EXISTS `EmployeeAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeAddress` (
  `idEmployeeAddress` int(11) NOT NULL,
  `completeAddress` varchar(45) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `isActive` int(11) DEFAULT '1',
  `idLocation` int(11) DEFAULT NULL,
  `idEmployee` int(11) NOT NULL,
  PRIMARY KEY (`idEmployeeAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeAddress`
--

LOCK TABLES `EmployeeAddress` WRITE;
/*!40000 ALTER TABLE `EmployeeAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeeAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeContactInfo`
--

DROP TABLE IF EXISTS `EmployeeContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeContactInfo` (
  `idEmployeeContactInfo` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `contactInfo` varchar(45) NOT NULL,
  `isActive` int(11) DEFAULT '1',
  `idEmployee` int(11) NOT NULL,
  PRIMARY KEY (`idEmployeeContactInfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeContactInfo`
--

LOCK TABLES `EmployeeContactInfo` WRITE;
/*!40000 ALTER TABLE `EmployeeContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeeContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `idLocation` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  PRIMARY KEY (`idLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonInterest`
--

DROP TABLE IF EXISTS `PersonInterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonInterest` (
  `idPersonInterest` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `bday` varchar(45) DEFAULT NULL,
  `idAccount` int(11) NOT NULL,
  PRIMARY KEY (`idPersonInterest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonInterest`
--

LOCK TABLES `PersonInterest` WRITE;
/*!40000 ALTER TABLE `PersonInterest` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonInterest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonInterestAddress`
--

DROP TABLE IF EXISTS `PersonInterestAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonInterestAddress` (
  `idPersonInterestAddress` int(11) NOT NULL,
  `completeAddress` varchar(45) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `isActive` int(11) DEFAULT '1',
  `idLocation` int(11) DEFAULT NULL,
  `idPersonInterest` int(11) NOT NULL,
  PRIMARY KEY (`idPersonInterestAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonInterestAddress`
--

LOCK TABLES `PersonInterestAddress` WRITE;
/*!40000 ALTER TABLE `PersonInterestAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonInterestAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonInterestContactInfo`
--

DROP TABLE IF EXISTS `PersonInterestContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonInterestContactInfo` (
  `idPersonInterestContactInfo` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `contactInfo` varchar(45) NOT NULL,
  `isActive` int(11) DEFAULT '1',
  `idPersonInterest` int(11) NOT NULL,
  PRIMARY KEY (`idPersonInterestContactInfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonInterestContactInfo`
--

LOCK TABLES `PersonInterestContactInfo` WRITE;
/*!40000 ALTER TABLE `PersonInterestContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonInterestContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourcePerson`
--

DROP TABLE IF EXISTS `ResourcePerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourcePerson` (
  `idResourcePerson` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `idPersonInterest` int(11) NOT NULL,
  PRIMARY KEY (`idResourcePerson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourcePerson`
--

LOCK TABLES `ResourcePerson` WRITE;
/*!40000 ALTER TABLE `ResourcePerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResourcePerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourcePersonAddress`
--

DROP TABLE IF EXISTS `ResourcePersonAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourcePersonAddress` (
  `idResourcePersonAddress` int(11) NOT NULL,
  `completeAddress` varchar(45) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `isActive` int(11) DEFAULT '1',
  `idResourcePerson` int(11) NOT NULL,
  `idLocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResourcePersonAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourcePersonAddress`
--

LOCK TABLES `ResourcePersonAddress` WRITE;
/*!40000 ALTER TABLE `ResourcePersonAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResourcePersonAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourcePersonContactInfo`
--

DROP TABLE IF EXISTS `ResourcePersonContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourcePersonContactInfo` (
  `idResourcePersonContactInfo` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `contactInfo` varchar(45) DEFAULT NULL,
  `isActive` int(11) DEFAULT '1',
  `idResourcePerson` int(11) NOT NULL,
  PRIMARY KEY (`idResourcePersonContactInfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourcePersonContactInfo`
--

LOCK TABLES `ResourcePersonContactInfo` WRITE;
/*!40000 ALTER TABLE `ResourcePersonContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResourcePersonContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicle` (
  `idVehicle` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `numberPlate` varchar(45) DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `otherInfo` varchar(45) DEFAULT NULL,
  `idAccount` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22 23:29:00
