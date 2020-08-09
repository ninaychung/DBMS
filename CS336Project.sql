CREATE DATABASE  IF NOT EXISTS `TrainProject` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TrainProject`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: cs336db.c0osdnfnu1fa.us-east-1.rds.amazonaws.com    Database: TrainProject
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `SSN` varchar(9) NOT NULL DEFAULT '',
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('123456789','nina','chung','Nina','Chung');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AskQuestion`
--

DROP TABLE IF EXISTS `AskQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AskQuestion` (
  `Question` varchar(500) NOT NULL,
  `CustomerUN` varchar(20) NOT NULL,
  `Answer` varchar(500) DEFAULT NULL,
  `Rep SSN` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`Question`,`CustomerUN`),
  KEY `Username_idx` (`CustomerUN`),
  KEY `Rep SSN_idx` (`Rep SSN`),
  CONSTRAINT `CustomerUN` FOREIGN KEY (`CustomerUN`) REFERENCES `Customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Rep SSN` FOREIGN KEY (`Rep SSN`) REFERENCES `CustomerRep` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AskQuestion`
--

LOCK TABLES `AskQuestion` WRITE;
/*!40000 ALTER TABLE `AskQuestion` DISABLE KEYS */;
INSERT INTO `AskQuestion` VALUES ('Asking a question','Customer2',NULL,NULL),('Keyword 2?','customerusername','Answer 2','123456789'),('Question 1?','Customer2','Answer 1','123456789'),('What is a train?','customerusername','answer to \'what is a train?\'','123456789');
/*!40000 ALTER TABLE `AskQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Username` varchar(20) NOT NULL DEFAULT '',
  `Password` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('Customer2','Customer2','Customer2','Customer2','Customer2@gmail.com'),('Customer5','Customer5','Customer5','Customer5','Customer5@gmail.com'),('customerusername','customerpw','CustomerFirst','CustomerLast','customer@gmail.com');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerRep`
--

DROP TABLE IF EXISTS `CustomerRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerRep` (
  `SSN` varchar(9) NOT NULL DEFAULT '',
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerRep`
--

LOCK TABLES `CustomerRep` WRITE;
/*!40000 ALTER TABLE `CustomerRep` DISABLE KEYS */;
INSERT INTO `CustomerRep` VALUES ('123456789','Customer','rep','Customer','Repping'),('987654321','CustomerRep2','CustomerRep2','CustomerRep2','CustomerRep2');
/*!40000 ALTER TABLE `CustomerRep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `reservation number` int(11) NOT NULL,
  `departure_date` date DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `fare type` varchar(10) DEFAULT NULL,
  `trip type` varchar(10) DEFAULT NULL,
  `fare cost` decimal(9,2) DEFAULT NULL,
  `origin station` varchar(45) DEFAULT NULL,
  `destination station` varchar(45) DEFAULT NULL,
  `TLN` varchar(50) NOT NULL,
  PRIMARY KEY (`reservation number`),
  KEY `TLN_idx` (`TLN`),
  CONSTRAINT `TLN` FOREIGN KEY (`TLN`) REFERENCES `TrainSchedule` (`TransitLineName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (6,'2020-08-03','2020-08-08','Child','Round-Trip',37.50,'Newark Penn Station','New York Penn Station','Northeast Corridor'),(7,'2020-08-03','2020-08-08','Child','Round-Trip',37.50,'Newark Penn Station','New York Penn Station','Northeast Corridor'),(8,'2020-08-05','2020-08-08','Adult','One-Way',50.00,'Newark Penn Station','Newark Penn Station','Northeast Corridor'),(9,'2020-08-03','2020-08-08','Child','Round-Trip',37.50,'New Brunswick Station','Newark Penn Station','Northeast Corridor');
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserves`
--

DROP TABLE IF EXISTS `Reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserves` (
  `Username` varchar(20) NOT NULL,
  `reservation number` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`reservation number`),
  KEY `reservation number_idx` (`reservation number`),
  CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `Customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation number` FOREIGN KEY (`reservation number`) REFERENCES `Reservation` (`reservation number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserves`
--

LOCK TABLES `Reserves` WRITE;
/*!40000 ALTER TABLE `Reserves` DISABLE KEYS */;
INSERT INTO `Reserves` VALUES ('Customer2',6),('Customer2',7),('Customer2',8),('Customer2',9);
/*!40000 ALTER TABLE `Reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Station` (
  `sid` int(11) NOT NULL,
  `station name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station`
--

LOCK TABLES `Station` WRITE;
/*!40000 ALTER TABLE `Station` DISABLE KEYS */;
INSERT INTO `Station` VALUES (1234,'Newark Penn Station','NJ','Newark'),(4321,'New Brunswick Station','NJ','New Brunswick'),(5678,'Secaucus Junction','NJ','Secaucus'),(6666,'Trenton Transit Center','NJ','Trenton'),(9876,'New York Penn Station','NY','New York');
/*!40000 ALTER TABLE `Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stops`
--

DROP TABLE IF EXISTS `Stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stops` (
  `train ID` int(11) NOT NULL,
  `TransitLineName` varchar(45) NOT NULL,
  `station ID` int(11) NOT NULL,
  `station name` varchar(45) NOT NULL,
  `arrival date` date NOT NULL,
  `arrival time` time NOT NULL,
  `departure date` date NOT NULL,
  `departure time` time NOT NULL,
  PRIMARY KEY (`train ID`,`TransitLineName`,`station ID`,`arrival date`,`arrival time`,`departure time`,`departure date`,`station name`),
  KEY `sid_idx` (`station ID`),
  KEY `TransitLineName_idx` (`TransitLineName`),
  KEY `name_idx` (`station name`),
  CONSTRAINT `TransitLineName` FOREIGN KEY (`TransitLineName`) REFERENCES `TrainSchedule` (`TransitLineName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `station ID` FOREIGN KEY (`station ID`) REFERENCES `Station` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `train ID` FOREIGN KEY (`train ID`) REFERENCES `Train` (`trainID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stops`
--

LOCK TABLES `Stops` WRITE;
/*!40000 ALTER TABLE `Stops` DISABLE KEYS */;
INSERT INTO `Stops` VALUES (1111,'Northeast Corridor',1234,'Newark Penn Station','2020-08-03','03:50:00','2020-08-03','04:00:00'),(1111,'Northeast Corridor',4321,'New York Penn Station','2020-08-03','04:10:00','2020-08-03','04:20:00'),(2222,'Northeast Corridor',4321,'New Brunswick Station','2020-08-03','15:30:00','2020-08-03','14:15:00'),(2222,'Northeast Corridor',4321,'Trenton Transit Center','2020-08-03','17:00:00','2020-08-03','16:00:00'),(4444,'Northeast Corridor',4321,'New Brunswick Station','2020-08-06','08:35:00','2020-08-06','08:05:00'),(2222,'Northeast Corridor',5678,'Secaucus Junction','2020-08-03','14:00:00','2020-08-06','13:00:00'),(3333,'Northeast Corridor',5678,'Secaucus Junction','2020-08-05','11:05:00','2020-08-05','10:30:00'),(4444,'Northeast Corridor',5678,'Secaucus Junction','2020-08-06','08:00:00','2020-08-06','07:00:00'),(1111,'Northeast Corridor',6666,'Trenton Transit Center','2020-08-03','03:30:00','2020-08-03','03:48:00'),(3333,'Northeast Corridor',6666,'Trenton Transit Center','2020-08-05','08:00:00','2020-08-05','06:00:00'),(4444,'Northeast Corridor',6666,'New York Penn Station','2020-08-06','09:15:00','2020-08-06','08:40:00'),(3333,'Northeast Corridor',9876,'New York Penn Station','2020-08-05','10:25:00','2020-08-05','09:00:00');
/*!40000 ALTER TABLE `Stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train` (
  `trainID` int(11) NOT NULL,
  `Transit Line Name` varchar(50) NOT NULL,
  PRIMARY KEY (`trainID`,`Transit Line Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
INSERT INTO `Train` VALUES (1111,'Northeast Corridor'),(2222,'Northeast Corridor'),(3333,'Northeast Corridor'),(4444,'Northeast Corridor'),(5555,'Northeast Corridor'),(6666,'Raritan Valley Line'),(7777,'North Jersey Coast Line'),(8888,'Morristown Line');
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrainSchedule`
--

DROP TABLE IF EXISTS `TrainSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrainSchedule` (
  `TransitLineName` varchar(50) NOT NULL DEFAULT '',
  `Origin` varchar(50) NOT NULL DEFAULT '',
  `Destination` varchar(50) NOT NULL DEFAULT '',
  `DepartureDate` date NOT NULL DEFAULT '2000-01-01',
  `ArrivalDate` date NOT NULL DEFAULT '2000-01-01',
  `DepartureTime` time NOT NULL DEFAULT '00:00:01',
  `ArrivalTime` time NOT NULL DEFAULT '00:00:01',
  `TrainID` int(11) NOT NULL DEFAULT '0',
  `Fare` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`TransitLineName`,`Origin`,`Destination`,`DepartureDate`,`DepartureTime`,`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrainSchedule`
--

LOCK TABLES `TrainSchedule` WRITE;
/*!40000 ALTER TABLE `TrainSchedule` DISABLE KEYS */;
INSERT INTO `TrainSchedule` VALUES ('Morristown Line','Hackettstown','New York Penn Station','2020-08-08','2020-08-08','06:00:00','08:00:00',8888,30.00),('North Jersey Coast Line','Bay Head','New York Penn Station','2020-08-08','2020-08-08','05:00:00','07:00:00',7777,20.00),('Northeast Corridor','New Brunswick Station','New York Penn Station','2020-08-06','2020-08-03','07:00:00','09:15:00',4444,70.00),('Northeast Corridor','Secaucus Junction','New York Penn Station','2020-08-03','2020-08-03','13:00:00','17:00:00',2222,50.00),('Northeast Corridor','Trenton Transit Center','New York Penn Station','2020-08-03','2020-08-03','03:48:00','04:10:00',1111,50.00),('Northeast Corridor','Trenton Transit Center','Secaucus Junction','2020-08-05','2020-08-05','06:00:00','11:05:00',3333,45.00),('Raritan Valley Line','High Bridge','New York Penn Station','2020-08-08','2020-08-08','04:00:00','06:00:00',6666,10.00);
/*!40000 ALTER TABLE `TrainSchedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-08 23:24:01
