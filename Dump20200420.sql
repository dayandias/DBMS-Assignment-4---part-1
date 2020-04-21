CREATE DATABASE  IF NOT EXISTS `paper_reviews` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `paper_reviews`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: paper_reviews
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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `Email_Address` varchar(50) NOT NULL,
  `First_name` varchar(20) NOT NULL,
  `Last_name` varchar(20) DEFAULT NULL,
  `Author_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Email_Address`),
  UNIQUE KEY `Author_id` (`Author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('daniel@gmail.com','Daniel','Terach',2),('dayandias@gmail.com','Dayan','Dias',1),('Nairobi@gmail.com','Nairobi','Kenya',6),('pablo@gmail.com','Pablo','Escobar',3),('riode@yahoo.com','Rio','De',5),('sumant@yahoo.com','Sumant','Watekar',4);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Abstract` varchar(5) NOT NULL,
  `File_name` varchar(100) NOT NULL,
  `Contact_Author` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Contact_Author` (`Contact_Author`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`Contact_Author`) REFERENCES `author` (`Author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,'Database management systems','yes','Data Science',1),(2,'Java programming','yes','Programming',2),(3,'C## programming','yes','Programming',2),(4,'Distributive networks','yes','Marketing',3),(5,'Youth employment','yes','Employment',4),(6,'Garbage Disposal','yes','Recycling',6);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer` (
  `Reviewer_id` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `First_name` varchar(20) NOT NULL,
  `Last_name` varchar(20) DEFAULT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Affiliation` varchar(100) DEFAULT NULL,
  `Author_Feedback` varchar(200) DEFAULT NULL,
  `Committee_Feedback` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Reviewer_id` (`Reviewer_id`),
  UNIQUE KEY `Phone_number` (`Phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES (3,'KevinP@hotmail.com','Kevin','Peterson','6596884236','Affiliation3','Author feedback 3','committee feedback3'),(4,'markA@hotmail.com','Mark','Anthony','9179884236','Affiliation3','Author feedback 3','committee feedback3'),(5,'Robin@hood.com','Robin','Hood','1592634785','Affiliation4','Author feedback 4','Committee Feedback 4'),(2,'Shaun@hotmail.com','Shaun','Mike','6569884236','Affiliation2','Author feedback 2','committee feedback2'),(1,'Smithg@gmail.com','Smith','Grahm','9295663874','<Affiliation1>','<Author_Feedback1>','<Committee_Feedback1>');
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Paper_id` int NOT NULL,
  `Reviewer_id` int NOT NULL,
  `Merit_Score` int NOT NULL,
  `Readability_Score` int NOT NULL,
  `Originality_Score` int NOT NULL,
  `Relevance_Score` int NOT NULL,
  `Recommendation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Paper_id` (`Paper_id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Paper_id`) REFERENCES `paper` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Reviewer_id`) REFERENCES `reviewer` (`Reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,9,8,8,8,'recommendation'),(2,3,4,8,9,8,7,'recommendation 2'),(3,2,3,9,9,7,8,'recommendation 3'),(4,4,2,8,8,9,6,'recommendation 4'),(5,5,5,7,8,9,7,'recommendation 5');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Topic_name` varchar(100) NOT NULL,
  `Reviewer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`Reviewer_id`) REFERENCES `reviewer` (`Reviewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Computer Languages',1),(3,'Marketing',2),(4,'E-Commerce',3),(5,'Biology',4),(6,'Social Science',5);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'paper_reviews'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 21:06:09
