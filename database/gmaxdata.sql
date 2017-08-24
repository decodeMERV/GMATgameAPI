-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: gmax
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Math','Section that tests Math skills','2017-08-17 20:36:03','2017-08-17 21:22:36'),(2,'Verbal','Section that tests verbal abilities','2017-08-17 20:36:15','2017-08-17 20:36:15'),(3,'Writing','Section that tests Writing abilities','2017-08-17 20:36:24','2017-08-17 20:36:24'),(4,'Reasoning','Section that tests Reasoning abilities','2017-08-17 20:36:32','2017-08-17 21:21:32'),(5,'Data','Section that tests Data Sufficienty abilities','2017-08-17 20:36:42','2017-08-17 20:36:42');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leader_board`
--

DROP TABLE IF EXISTS `leader_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leader_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `isCorrect` tinyint(1) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `answer` enum('A','B','C','D','E') DEFAULT NULL,
  `level` enum('200','300','400') DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leader_board`
--

LOCK TABLES `leader_board` WRITE;
/*!40000 ALTER TABLE `leader_board` DISABLE KEYS */;
INSERT INTO `leader_board` VALUES (1,'matt',1,1,1,'D','200',12,NULL),(3,'222',NULL,NULL,NULL,NULL,'200',NULL,NULL),(4,'222',NULL,1,NULL,NULL,'200',NULL,NULL),(5,'222',12,1,1,'D','200',33,NULL),(6,'ADSFADS',12,1,1,'D','200',33,NULL),(7,'fdasdfads',12,1,1,'D','200',33,NULL),(8,'mikeUser',17,1,1,'E','200',100,NULL),(9,'mikeUser',24,1,4,'C','200',100,NULL),(10,'JosephP',20,1,5,'B','200',100,53322),(11,'JosephP',23,1,3,'D','200',100,53322),(12,'JosephP',7,1,2,'E','300',100,53322),(13,'JosephP',44,1,4,'C','400',100,53322),(14,'JosephP',43,1,3,'D','400',100,53322),(15,'joe2user',28,1,3,'D','200',100,NULL),(16,'joe2user',42,1,2,'E','400',100,NULL),(17,'joe2user',35,1,5,'B','400',100,NULL),(18,'bro1Username',6,1,1,'D','200',100,NULL),(19,'bro1Username',24,1,4,'C','200',100,NULL),(20,'M_The_User',1,1,1,'D','200',100,NULL),(21,'P-Oh-eh-Username',19,1,4,'C','200',100,77772),(22,'P-Oh-eh-Username',9,1,4,'A','400',100,77772),(23,'P-Oh-eh-Username',9,1,4,'A','400',100,77772),(24,'P-Oh-eh-Username',45,0,5,'D','400',0,77772),(25,'P-Oh-eh-Username',45,1,5,'B','400',100,77772),(26,'P-Oh-eh-Username',37,0,2,'D','400',0,77772),(27,'P-Oh-eh-Username',14,0,4,'A','300',0,77772),(28,'P-Oh-eh-Username',23,0,3,'E','200',0,77772),(29,'ASDF',19,1,4,'C','200',100,NULL),(30,'ASDF',29,0,4,'B','200',0,NULL),(31,'ASDF',29,0,4,'A','200',0,NULL),(32,'ASDF',18,0,3,'E','200',0,NULL),(33,'ASDF',21,0,1,'C','200',0,NULL),(34,'ASDF',30,0,5,'D','200',0,NULL),(35,'ASDF',23,1,3,'D','200',100,NULL),(36,'ASDF',25,0,5,'A','200',0,NULL),(37,'ASDF',25,0,5,'E','200',0,NULL),(38,'ASDF',16,0,NULL,'C','200',0,NULL),(39,'ASDF',27,0,NULL,'B','200',0,NULL),(40,'ASDF',16,1,NULL,'A','200',100,NULL),(41,'ASDF',41,1,NULL,'A','400',100,NULL),(42,'ASDF',44,1,NULL,'C','400',100,NULL),(43,'ASDF',9,1,NULL,'A','400',100,NULL),(44,'ASDF',20,1,NULL,'B','200',100,NULL),(45,'ASDF',25,1,NULL,'B','200',100,NULL),(46,'ASDF',43,1,NULL,'D','400',100,NULL),(47,'ASDF',31,1,NULL,'A','400',100,NULL),(48,'P-Oh-eh-Username',22,0,NULL,'D','200',0,77772),(49,'ASDF',23,0,3,'A','200',0,NULL),(50,'ASDF',30,1,5,'B','200',100,NULL),(51,'ASDF',30,1,5,'B','200',100,NULL),(52,'ASDF',42,1,2,'E','400',100,NULL),(53,'ASDF',21,1,1,'A','200',100,NULL),(54,'ASDF',19,1,4,'C','200',100,NULL),(55,'ASDF',17,0,2,'A','200',0,NULL),(56,'ASDF',23,1,3,'D','200',100,NULL),(57,'ASDF',45,1,5,'B','400',100,NULL),(58,'ASDF',42,1,2,'E','400',100,NULL),(59,'ASDF',21,1,1,'A','200',100,NULL),(60,'ASDF',20,1,5,'B','200',100,NULL),(61,'ASDF',28,1,3,'D','200',100,NULL),(62,'ASDF',18,1,3,'D','200',100,NULL),(63,'ASDF',23,1,3,'D','200',100,NULL),(64,'ASDF',38,1,3,'D','400',100,NULL),(65,'ASDF',36,1,1,'A','400',100,NULL),(66,'ASDF',29,1,4,'C','200',100,NULL),(67,'ASDF',20,0,5,'C','200',0,NULL),(68,'ASDF',25,1,5,'B','200',100,NULL),(69,'ASDF',23,1,3,'D','200',100,NULL),(70,'ASDF',1,1,1,'D','200',100,NULL),(71,'ASDF',20,1,5,'B','200',100,NULL),(72,'ASDF',39,1,4,'C','400',100,NULL),(74,'Johnny',20,1,5,'B','200',100,77772),(75,'Johnny',9,0,4,'D','400',0,77772),(76,'Johnny',45,1,5,'B','400',100,77772),(77,'Johnny',39,0,4,'B','400',0,77772),(78,'Johnny',27,1,2,'E','200',100,77772),(79,'Johnny',30,1,5,'B','200',100,77772),(80,'Johnny',7,0,2,'A','300',0,77772),(81,'ASDF',28,0,3,'A','200',0,868),(82,'ASDF',25,1,5,'B','200',100,2142),(83,'ASDF',31,1,1,'A','400',100,803),(84,'ASDF',6,1,1,'D','200',100,4960),(85,'ASDF',35,1,5,'B','400',100,1009),(86,'ASDF',9,1,4,'A','400',100,1309),(87,'ASDF',4,0,4,'E','400',0,1828),(88,'ASDF',25,1,5,'B','200',100,4451),(89,'Matti',1,1,1,'D','200',100,4940),(90,'Matti',27,0,2,'A','200',0,823),(91,'Matti',21,1,1,'A','200',100,35745),(92,'Matti',26,1,1,'A','200',100,1468),(93,'Matti',17,0,2,'A','200',0,6771),(94,'Matti',29,0,4,'D','200',0,1759),(95,'ASDF',27,1,2,'E','200',100,3445),(96,'ASDF',19,1,4,'C','200',100,1144),(97,'ASDF',4,1,4,'A','400',100,1197),(98,'ASDF',21,1,1,'A','200',100,1961),(99,'ASDF',15,1,5,'B','300',100,633),(100,'ASDF',38,0,3,'C','400',0,546),(101,'ASDF',44,0,4,'D','400',0,533),(102,'ASDF',40,0,5,'A','400',0,4573),(103,'ASDF',16,1,1,'A','200',100,19964),(104,'ASDF',36,1,1,'A','400',100,616),(105,'ASDF',39,0,4,'A','400',0,18759),(106,'ASDF',17,0,2,'C','200',0,1260),(107,'ASDF',26,0,1,'E','200',0,1371),(108,'ASDF',22,1,2,'E','200',100,25249),(109,'ASDF',14,1,4,'C','300',100,18316),(110,'ASDF',17,0,2,'A','200',0,2972),(111,'ASDF',1,0,1,'E','200',0,977),(112,'ASDF',16,1,1,'A','200',100,1471),(113,'ASDF',19,0,4,'A','200',0,974),(114,'ASDF',22,0,2,'C','200',0,5142),(115,'ASDF',25,1,5,'B','200',100,1978),(116,'ASDF',21,1,1,'A','200',100,2468),(117,'ASDF',29,0,4,'A','200',0,9959),(118,'ASDF',17,1,2,'E','200',100,1653),(119,'ASDF',45,1,5,'B','400',100,19642),(120,'ASDF',39,1,4,'C','400',100,3023),(121,'ASDF',28,0,3,'B','200',0,1944),(122,'ASDF',17,0,2,'A','200',0,960),(123,'ASDF',29,1,4,'C','200',100,3804),(124,'Matti',24,1,4,'C','200',100,2969),(125,'Matti',21,1,1,'A','200',100,914),(126,'Matti',36,0,1,'C','400',0,620),(127,'ASDF',26,1,1,'A','200',100,2410),(128,'ASDF',31,1,1,'A','400',100,669),(129,'ASDF',38,0,3,'B','400',0,2628),(130,'Antonio',6,1,1,'D','200',100,57437),(131,'Antonio',11,1,1,'A','300',100,3016),(132,'Antonio',14,1,4,'C','300',100,3256),(133,'Antonio',33,1,3,'D','400',100,56419),(134,'Antonio',39,1,4,'C','400',100,1879),(135,'Antonio',33,1,3,'D','400',100,1752),(136,'Antonio',35,1,5,'B','400',100,1513),(137,'Antonio',4,1,4,'A','400',100,1538),(138,'Antonio',44,1,4,'C','400',100,1384),(139,'Antonio',40,1,5,'B','400',100,119984),(140,'Antonio',5,1,1,'C','400',100,177400),(141,'Antonio',31,1,1,'A','400',100,1867),(142,'Antonio',5,0,1,'E','400',0,45015),(143,'Antonio',27,1,2,'E','200',100,5921),(144,'Antonio',24,1,4,'C','200',100,154073),(145,'Erick',24,1,4,'C','200',100,7921),(146,'Erick',43,1,3,'D','400',100,1387),(147,'Erick',39,1,4,'C','400',100,652),(148,'Erick',34,1,4,'C','400',100,772),(149,'Erick',38,1,3,'D','400',100,1214),(150,'Erick',5,1,1,'C','400',100,882),(151,'Erick',33,1,3,'D','400',100,2957),(152,'Erick',31,1,1,'A','400',100,58753),(153,'Erick',37,1,2,'E','400',100,1801),(154,'Erick',42,1,2,'E','400',100,2117),(155,'Erick',38,1,3,'D','400',100,192093),(156,'Erick',62,0,2,'D','200',0,13407),(157,'Erick',65,1,2,'A','200',100,5129),(158,'Tim_McNamara',60,0,5,'A','200',0,48930),(159,'Tim_McNamara',61,1,4,'D','200',100,47603),(160,'Tim_McNamara',57,0,4,'E','400',0,39429),(161,'Tim_McNamara',58,0,4,'B','400',0,228283),(162,'Tim_McNamara',48,0,5,'C','400',0,8517),(163,'Tim_McNamara',59,0,4,'A','400',0,201377),(164,'Tim_McNamara',67,0,4,'B','300',0,11588),(165,'Tim_McNamara',63,0,2,'A','200',0,3284),(166,'Tim_McNamara',61,0,4,'C','200',0,316),(167,'Tim_McNamara',65,0,2,'D','200',0,1048),(168,'Tim_McNamara',64,0,5,'D','200',0,4050),(169,'Tim_McNamara',60,0,5,'A','200',0,7975),(170,'Tim_McNamara',63,0,2,'B','200',0,8836),(171,'Tim_McNamara',62,1,2,'A','200',100,6595),(172,'Tim_McNamara',53,1,4,'B','300',100,16504),(173,'Tim_McNamara',67,0,4,'D','300',0,4032),(174,'Tim_McNamara',68,1,1,'D','300',100,22362),(175,'Tim_McNamara',48,0,5,'C','400',0,37492),(176,'Ziad',65,1,2,'A','200',100,7918),(177,'Ziad',63,1,2,'E','200',100,34780),(178,'Ziad',68,0,1,'E','300',0,2791),(179,'Ziad',66,0,4,'B','300',0,4933),(180,'Ziad',60,0,5,'D','200',0,6206),(181,'Ziad',65,1,2,'A','200',100,23997),(182,'Ziad',48,0,5,'E','400',0,4627),(183,'Ziad',50,1,1,'B','400',100,32178),(184,'Ziad',59,1,4,'B','400',100,1808),(185,'Ziad',55,0,5,'C','400',0,95793),(186,'Ziad',51,1,1,'B','300',100,2840),(187,'Ziad',49,0,1,'A','300',0,3861),(188,'Matti',62,1,2,'A','200',100,11449),(189,'Matti',58,0,4,'C','400',0,1030),(190,'Matti',66,0,4,'A','300',0,372),(191,'Matti',64,0,5,'D','200',0,82),(192,'Matti',60,0,5,'D','200',0,2474),(193,'Matti',63,0,2,'B','200',0,2972),(194,'Armel C',62,1,2,'A','200',100,4969),(195,'Armel C',48,0,5,'C','400',0,2203),(196,'Armel C',58,0,4,'A','400',0,682),(197,'Armel C',55,0,5,'A','400',0,527),(198,'Armel C',61,0,4,'A','200',0,807),(199,'Armel C',60,0,5,'C','200',0,1036),(200,'Armel C',65,0,2,'B','200',0,452),(201,'Armel C',64,1,5,'B','200',100,207),(202,'Armel C',55,0,5,'A','400',0,655),(203,'Armel C',62,0,2,'C','200',0,4479),(204,'Armel C',61,0,4,'B','200',0,232),(205,'Armel C',64,0,5,'D','200',0,533),(206,'Armel C',61,0,4,'A','200',0,509),(207,'Armel C',64,0,5,'E','200',0,800),(208,'Armel C',60,0,5,'A','200',0,104),(209,'Armel C',65,1,2,'A','200',100,561),(210,'Armel C',63,1,2,'E','200',100,5191),(211,'Armel C',48,1,5,'A','400',100,10127),(212,'MariaScale',63,0,2,'A','200',0,684),(213,'MariaScale',60,0,5,'C','200',0,329),(214,'MariaScale',61,0,4,'A','200',0,333),(215,'MariaScale',60,0,5,'C','200',0,144),(216,'MariaScale',63,0,2,'D','200',0,709),(217,'MariaScale',62,0,2,'E','200',0,535),(218,'MariaScale',63,0,2,'B','200',0,364),(219,'MariaScale',64,0,5,'A','200',0,618),(220,'MariaScale',62,0,2,'B','200',0,222),(221,'MariaScale',63,0,2,'C','200',0,1157),(222,'MariaScale',65,1,2,'A','200',100,561),(223,'MariaScale',58,1,4,'D','400',100,940),(224,'MariaScale',48,0,5,'D','400',0,5653),(225,'MariaScale',51,1,1,'B','300',100,1829),(226,'MariaScale',50,0,1,'C','400',0,1182),(227,'MariaScale',58,1,4,'D','400',100,1637),(228,'MariaScale',54,0,4,'A','400',0,2128),(229,'MariaScale',66,0,4,'A','300',0,1293),(230,'MariaScale',56,0,1,'D','300',0,415),(231,'MariaScale',51,1,1,'B','300',100,876),(232,'Peter Smith',63,0,2,'A','200',0,2224),(233,'Peter Smith',62,0,2,'D','200',0,986),(234,'Peter Smith',64,1,5,'B','200',100,803),(235,'Peter Smith',59,0,4,'E','400',0,704),(236,'Peter Smith',50,0,1,'C','400',0,3684),(237,'Peter Smith',60,0,5,'D','200',0,2959),(238,'Peter Smith',61,0,4,'C','200',0,2434),(239,'Peter Smith',60,0,5,'D','200',0,2541),(240,'Peter Smith',62,0,2,'E','200',0,2627),(241,'Peter Smith',63,1,2,'E','200',100,1222),(242,'Peter Smith',57,0,4,'E','400',0,6225),(243,'Peter Smith',48,0,5,'C','400',0,2456),(244,'Peter Smith',65,1,2,'A','200',100,4039),(245,'Peter Smith',67,0,4,'D','300',0,2920),(246,'Peter Smith',63,1,2,'E','200',100,1511),(247,'Peter Smith',65,1,2,'A','200',100,8539),(271,'Rachel Elha',61,1,4,'D','200',100,6234),(272,'Rachel Elha',48,0,5,'B','400',0,2721),(273,'Rachel Elha',50,1,1,'B','400',100,2508),(274,'Rachel Elha',48,0,5,'E','400',0,2935),(275,'Rachel Elha',66,0,4,'A','300',0,1390),(276,'Rachel Elha',62,0,2,'D','200',0,2247),(277,'Rachel Elha',60,0,5,'C','200',0,1768),(278,'Rachel Elha',61,0,4,'C','200',0,3303),(279,'Rachel Elha',62,1,2,'A','200',100,883),(280,'Rachel Elha',51,1,1,'B','300',100,1948),(281,'Rachel Elha',58,1,4,'D','400',100,26690),(282,'Rachel Elha',57,1,4,'C','400',100,3108),(283,'Rachel Elha',55,0,5,'B','400',0,31688),(284,'Rachel Elha',63,1,2,'E','200',100,4082),(285,'Rachel Elha',62,1,2,'A','200',100,1376),(286,'Rachel Elha',59,1,4,'B','400',100,804),(287,'Rachel Elha',48,0,5,'C','400',0,2869),(288,'Rachel Elha',68,1,1,'D','300',100,3405),(289,'Rachel Elha',61,0,4,'B','200',0,2731),(290,'Rachel Elha',65,1,2,'A','200',100,1653),(291,'Rachel Elha',58,1,4,'D','400',100,2078),(292,'Rachel Elha',57,1,4,'C','400',100,1493),(293,'Rachel Elha',59,1,4,'B','400',100,1354),(294,'Rachel Elha',55,0,5,'B','400',0,7220),(295,'Rachel Elha',59,1,4,'B','400',100,2306),(296,'Rachel Elha',55,1,5,'D','400',100,1709),(297,'Rachel Elha',50,0,1,'C','400',0,2206),(298,'Rachel Elha',68,0,1,'C','300',0,2375),(299,'Rachel Elha',63,1,2,'E','200',100,3276),(300,'Rachel Elha',55,0,5,'A','400',0,2376),(301,'Rachel Elha',50,0,1,'D','400',0,2028),(302,'Rachel Elha',57,1,4,'C','400',100,1791),(303,'Martin Coutu',63,1,2,'E','200',100,4733),(304,'Martin Coutu',60,1,5,'E','200',100,1487),(305,'Martin Coutu',49,0,1,'B','300',0,2020),(306,'Martin Coutu',51,1,1,'B','300',100,549),(307,'Martin Coutu',49,0,1,'B','300',0,2226),(308,'Martin Coutu',62,1,2,'A','200',100,753);
/*!40000 ALTER TABLE `leader_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(2000) DEFAULT NULL,
  `answerA` varchar(500) DEFAULT NULL,
  `answerB` varchar(500) DEFAULT NULL,
  `answerC` varchar(500) DEFAULT NULL,
  `answerD` varchar(500) DEFAULT NULL,
  `answerE` varchar(500) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `level` enum('200','300','400') DEFAULT '200',
  `correctAnswer` enum('A','B','C','D','E') NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (48,'In an isosceles triangle DEF, what is the measure of angle EDF? 1) Angle DEF is 96 degrees. 2) Angle DFE is 43 degrees','Statement (1) Alone is sufficient, but statement (2) alone is not sufficient to answer the question','Statement (2) Alone is sufficient, but statement (1) alone is not sufficient to answer the question','Both statements (1) and (2) together are sufficient to answer the question asked, but NEITHER statement ALONE is sufficient','Each statement ALONE is sufficient to answer the question','Statements (1) and (2) together are not sufficient to answer the question asked, additional data is needed',5,'400','A','2017-08-22 18:56:46','2017-08-22 18:56:46'),(49,'If an equilateral triangle has an area of square root 243, what is the perimeter of that triangle?','6','12','18','27','81',1,'300','C','2017-08-22 19:02:00','2017-08-22 19:02:00'),(50,'In the following diagram DE is parallel to AC. If AC = 10 and DE = 5 and the area of triangle ABC is 40, then what is the area of triangle BDE?','8','10','12','14','20',1,'400','B','2017-08-22 19:04:04','2017-08-22 19:04:04'),(51,'How many hours does it take Jennifer to run y miles if she runs at a speed of x miles per hour?','x/y','y/x','xy','60x/y','y/60x',1,'300','B','2017-08-22 19:14:26','2017-08-22 19:14:26'),(53,'An overpriced bat and an overpriced baseball were purchased together for a total of $110 (#robbed). The bat cost $100 more than the ball. What is the cost of the ball?','$10','$5','$7','$8','$6',4,'300','B','2017-08-22 19:20:04','2017-08-22 19:20:04'),(54,'Numerous ancient Mayan cities have been discovered in the Yucatan peninsula in recent decades. The ruins lack any evidence of destruction by invading forces, internal revolts, or disease, and appear simply to have been abandoned. Some archaeologists have theorized that the cities were abandoned due to a severe drought known to have occurred in the region between 800 and 1000 AD. Which of the following, if true, most strongly supports the archaeologists’ theory? ','Ample archaeological evidence of Mayan peasant revolts and city-state warfare exists, but such events could never result in the permanent abandonment of cities.','No monumental inscriptions created after 900 AD have been found in these cities, but inscriptions dating before that time have been found in abundance.','Studies of Yucatan lake sediment cores provide conclusive evidence that a prolonged drought occurred in the region from 800 to 1000 AD.','Climatic studies have documented cycles of intermittent drought in the Yucatan peninsula dating from the present to at least 7,000 years ago.','The Mayan city Uxmal was continuously inhabited from 500 to 1550 AD.',4,'400','B','2017-08-22 19:22:13','2017-08-22 19:22:13'),(55,'All geologists must pass a written test and a field test to become licensed. If 70% of geologists pass the written test and 90% of geologists pass the field test, what percent pass both tests?  (1) 10% did not pass either test. (2) 20% passed only the field test.','(A) Statement (1) ALONE is sufficient, but statement (2) alone is not sufficient to answer the question asked','(B) Statement (2) ALONE is sufficient, but statement (1) alone is not sufficient to answer the question asked','(C) BOTH statements (1) and (2) TOGETHER are sufficient to answer the question asked, but NEITHER statement ALONE is sufficient','(D) EACH statement ALONE is sufficient to answer the question asked','(E) Statements (1) and (2) TOGETHER are NOT sufficient to answer the question asked, and additional data are needed',5,'400','D','2017-08-22 20:04:53','2017-08-22 20:04:53'),(56,'30% of consumers like only product A, and for every consumer that likes only product B, 3 also like product A. If 18% of consumers like neither product, what percentage likes both?','39%','52%','18%','36%','None of the above',1,'300','A','2017-08-22 20:06:12','2017-08-22 20:06:12'),(57,'All the homes for sale in an overpriced Toronto community are either faux-colonial or modern style, and either white or blue. 40% of the homes are faux-colonial, and of the faux-colonial homes 25% are white. If 40% of all homes are white, what percent of the modern homes are blue?','45%','55%','50%','40%','60%',4,'400','C','2017-08-22 20:08:16','2017-08-22 20:08:16'),(58,'Last month, Tesla sold three-quarters of the cars it produced, including two-thirds of its Model S sedans. If three-fifths of the cars that it produces each month are Model S, what percent of the cars that were NOT sold last month were Model S?','25%','60%','70%','80%','85%',4,'400','D','2017-08-22 20:11:45','2017-08-22 20:11:45'),(59,'Together it takes three different 3D printers 5 hours to build a prototype jet engine. The first printer takes 10 hours to complete the job alone and the second printer takes 15 hours to complete the job alone. What fraction of the job does the third printer get done in 15 hours?','1/20','1/30','1/3','3/8','1/3',4,'400','B','2017-08-22 20:12:54','2017-08-22 20:12:54'),(60,'Find the value of |r| + |2|: (1) r^2 = 36 (2) (23 - 2r)/(2r -1) = 1','(A) Statement (1) ALONE is sufficient, but statement (2) alone is not sufficient to answer the question asked','(B) Statement (2) ALONE is sufficient, but statement (1) alone is not sufficient to answer the question asked','(C) BOTH statements (1) and (2) TOGETHER are sufficient to answer the question asked, but NEITHER statement ALONE is sufficient','(D) EACH statement ALONE is sufficient to answer the question asked','(E) Statements (1) and (2) TOGETHER are NOT sufficient to answer the question asked, and additional data are needed',5,'200','E','2017-08-22 20:21:43','2017-08-22 20:21:43'),(61,'What is the percentage change in the area of a rectangle? (1) The length is increased by 10%. (2) The length is increased by 10% and the width reduced by 5%.','Statement (1) ALONE is sufficient, but statement (2) alone is not sufficient to answer the question asked','Statement (2) ALONE is sufficient, but statement (1) alone is not sufficient to answer the question asked','BOTH statements (1) and (2) TOGETHER are sufficient to answer the question asked, but NEITHER statement ALONE is sufficient','EACH statement ALONE is sufficient to answer the question asked','Statements (1) and (2) TOGETHER are NOT sufficient to answer the question asked, and additional data are needed',4,'200','D','2017-08-22 20:28:00','2017-08-22 20:28:00'),(62,'Read the sentence below. The answer options give five ways of phrasing the part in quotation marks. One of these repeats the original passage; the other four are different. Follow the requirements of standard written English to choose the option that produces the most effective passage. \"Marley claimed she had made an honest mistake,\" but I think she intentionally called me a dumbass instead of Dumbo in front of the board of directors- this merits a witch hunt! ','Marley claimed she had made an honest mistake,','Marley claimed she had made an honest mistakes,','Marley claimed she had made honest mistakes,','Marley claimed she had made a honest mistake,','Marley claimed she had made honest mistake,',2,'200','A','2017-08-22 20:34:01','2017-08-22 20:34:01'),(63,'Read the sentence below. The answer options give five ways of phrasing the part in quotation marks. One of these repeats the original passage; the other four are different. Follow the requirements of standard written English to choose the option that produces the most effective passage.','A culture in which everybody believes we can be famous,','A culture in which many people believes we can be famous,','A culture that everybody believes they can be famous,','A culture where everybody believes we can be famous,','A culture in which many people believe they can be famous,',2,'200','E','2017-08-22 20:43:28','2017-08-22 20:43:28'),(64,'Is a < b? (1) a^2/b^2 < 1. (2) a / b < 1','Statement (1) ALONE is sufficient, but statement (2) alone is not sufficient to answer the question asked','Statement (2) ALONE is sufficient, but statement (1) alone is not sufficient to answer the question asked','BOTH statements (1) and (2) TOGETHER are sufficient to answer the question asked, but NEITHER statement ALONE is sufficient','EACH statement ALONE is sufficient to answer the question asked','Statements (1) and (2) TOGETHER are NOT sufficient to answer the question asked, and additional data are needed',5,'200','B','2017-08-22 20:45:51','2017-08-22 20:45:51'),(65,'Read the following passage then answer the following question. Which of the following sentences from the passage does not belong there?: \"The human body is made up of 65% Oxygen, 18.5% Carbon, 9.5% Hydrogen and 3.3% Nitrogen. These are the basic elements required, but without very small amounts of other elements, humans cannot thrive. One of these elements is sulfur, which is found in breast milk, insulin and cartilage. Sulfur allows the body to break down and absorb sugars. If it enables the body to use something so sweet, why does sulfur smell so bad?\"','If it enables the body to use something so sweet, why does Sulfur smell so bad?','This allows the body to break down and use sugars.','These are the basic elements required, but without very small amounts of other elements, humans cannot thrive.','One of these elements is Sulfur, which is found in breast milk, insulin and cartilage.','The human body is made up of 65% Oxygen, 18.5% Carbon, 9.5% Hydrogen and 3.3% Nitrogen.',2,'200','A','2017-08-22 20:51:17','2017-08-22 20:51:17'),(66,'What is the main idea of this passage: \"Penguins are aquatic, terrestrial birds that live almost entirely in the Southern Hemisphere, particularly in Antarctica. With dark and white plumage and flipper-like wings, the birds are exceedingly adapted for life in the water. Most penguins survive on fish, krill, squid and other forms of sea life caught underwater. They spend about half of their existence on land and the other half in the water.  Even though all penguin species are native to the Southern Hemisphere, they are found beyond freezing climates. In fact, several species are found in temperate regions, such as the Galapagos Penguin that resides near the equator.  The largest living penguin species is the Emperor Penguin, and the smallest is the Little Blue Penguin. Larger penguins inhabit colder regions while smaller penguins are generally found in temperate or even tropical climates. Some prehistoric species reached enormous sizes, becoming as tall and heavy as an adult human. These were not limited to Antarctic regions. On the contrary, other regions exhibited high diversity, with at least one giant penguin living in a zone almost 2,000 kilometres south of the equator in a very hot climate.\"','Penguins have changed over time','Penguins are magnificent creatures','Penguins need to be protected from harm','Penguins have always lived in many different climates','Penguins don\'t know how to survive in tropical climates',4,'300','D','2017-08-22 21:26:58','2017-08-22 21:26:58'),(67,'Read the following passage and then answer the following question. With which of the following statements would the author likely disagree? The increased usage of mobile devices has resulted in some unintended and even dangerous consequences. Studies have shown that mobile communications are linked to a significant increase in distracted driving, resulting in injury and loss of life. In 2008, it was reported that driver distraction was the cause of 16 percent of all fatal crashes, leading to the deaths of 5,800 people; 21 percent of the crashes resulted in an injury, causing 515,000 people to be wounded. The studies also show that nearly 50 percent of teens admit to texting while driving. Distracted driving endangers life and property, and the current levels of injury and loss are unacceptable.  To stem this problem, safety organizations and other government agencies are working to inform and educate the public about the dangers of distracted driving and are seeking to identify and facilitate the development of innovative technologies that could reduce the incidence of distracted driving. Currently, there is no national ban on texting or using a wireless phone while driving, but a number of states have passed laws banning texting or wireless phones or requiring hands-free use of wireless phones while driving.','The number of teens who admit to texting while driving is likely higher than reported due to dishonest reporting.','Safety organizations would benefit from free publicity by informing the nation about the dangers of distracting driving.','Using a hands-free device is no less distracting than using a handheld phones and should be included in bans.','The use of mobile communications has had some positive consequences along with the negative.','Current levels of fatalities might be decreased if phone companies installed software that would alert parents to phone use while the phone is moving at speeds concurrent with vehicular movement.',4,'300','C','2017-08-22 21:35:33','2017-08-22 21:35:33'),(68,'A sheet of iron in the form of a sector of 60° and 18 inches radius is used to make a curved surface of a cone. Determine the radius of the base of the cone.','1 inch','2(PI) inches','2 inches','3 inches','6 inches',1,'300','D','2017-08-22 21:39:06','2017-08-22 21:39:06');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `token` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `userId` (`userId`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'0W1axpPY+1AS+MNR8lOSGp7Q0e+IdHcseH2/kNeEKMmHyiMnraEQJmAnRl3cjgyCE4s='),(10,8,'fmZrl/86gKihLUpAh2jE/x/+VMsVf25tPjTfJiKJpNmxXMwf3pTEtMoHumRv15BvxYo='),(19,8,'7mDdVoZgFBgB1MvHEWiI6P/kBMq8I+yryrPLPkzAkiZVTq8Yu8/McC7ZqtgPqAmJWy0='),(42,8,'MNXIW28qH7jN1H7yYh4nltt1KB4reWmgq3FdF/UDbTWoQYhj0vK09hAwALvjhgN+H54='),(43,10,'mme3zXndo8ohHehIEZo4sKWoXsptQMU5Ob33k/AXs6Qy5hv8NwlMXkpWQSat5W5IXww='),(44,8,'Ks4lHLdmoxaChSQ2wZLdwr2gzyrRoHzPNh+P6RpCLHJ2xZ8uI5Qot9F8Cp7lRtv/lm8='),(45,8,'V8FpcKZtMBWRcDM3DK19m0M8pGNcO3U2+WNEOWbpJYH4uIy5WGedBl4s4HoYJBc3tMg='),(47,8,'EdTymbGh14U/TlRqDyZf5gPlMWLrkzbe5/67ZgA/rBS+0X+qtbhijAs9me45PHZrTzo='),(76,8,'HhR/qA4QCCfJ4zJvmyUFN9hin3Au5OLkuZ0La8AYg1eMV0Qnjbj1ldM3ggi21Tf78dE=');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `interests` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mattUser','matt@matt.com','$2a$10$jG0IAkpjTMOTEWSHmDiU3.P8wZC8lq1B4wn34PHmC7A3nej8vP8/.','Coding','2017-08-17 21:33:08','2017-08-17 21:33:08',0),(2,'mikeUser','mike@mike.com','$2a$10$Q3yqtMfS.PE8nYwgstUpa.bcxxNfOEu5pKRDrMatwQWdWdHz3jFRa','hobby','2017-08-18 02:47:06','2017-08-18 02:47:06',0),(3,'joe2','joe1@gmail.com','$2a$10$yM/xojWjJZWA4oraCEsPwuhPOu9pkXhjQb2Fe5.VzjC1XXqEn2zW2','hockey','2017-08-18 14:48:39','2017-08-18 14:48:39',0),(4,'joe2user','joe2@gmail.com','$2a$10$NsG3nGe07M/Zy/VxprpcGeC5H1OjEibNe2Z/dYpRmL/8hbyQ8PJkK','boarding','2017-08-18 14:50:27','2017-08-18 14:50:27',0),(5,'bro1Username','Bro1@gmail.com','$2a$10$1o/ESeKfKkWdIEomiB6h5Ofljb0sRZPmTonph31m7yIkRpfw1p7va','baseball, darts, philanthropy','2017-08-18 14:51:38','2017-08-18 14:51:38',0),(6,'M_The_User','m@m.com','$2a$10$go7UCe2CGla9OlmxM35dsu21WT2lfG0fyRXK9MNpcVKmbRAxt2Vsq','sports','2017-08-18 14:53:01','2017-08-18 14:53:01',0),(7,'P-Oh-eh-Username','p@p.com','$2a$10$7afRRvfet7vx5CKIkO5xteqUFCUYxAE2QOLYrHungXSdKkB8ebUV2','coffee','2017-08-18 14:54:12','2017-08-18 14:54:12',0),(8,'MariaScale','scalemary@gmail.com','$2a$10$uzhM87VG4PV.wQbNfIZmeejstWMFt91.1Ckj43cfgrK90otCqykDy','asdf, and a lot of text goes here because - its like that','2017-08-18 14:55:07','2017-08-24 16:14:44',1),(9,'Joker Roker','login@login.com','$2a$10$JkiBwQRO/08joR09X.eu/Oq1ukCK1vq.sgY6oN/M1YLm7ftdcALbS','farming','2017-08-20 00:45:31','2017-08-20 00:45:31',0),(10,'Matti','mattidj@gmail.com','$2a$10$4pm9q8Y9sohM9h.J9aYQSu3fclEH3gGjNzXzHHljLJTsek7IwDlyK','Hockey, Formula1, soccer','2017-08-21 06:08:09','2017-08-23 23:23:17',0),(11,'QWERTY','qwer@qwer.com','$2a$10$esUkGwHwR6Fgyk3dGAjq2uUmYN9L8IiLdvNoMxuEIJ2pc4Nh/pCSC','biking','2017-08-21 15:14:48','2017-08-21 15:14:48',0),(12,'Antonio','antonio.qfel@gmail.com','$2a$10$ORgm4CmD88dxz5bKNZcklempMb/mPOKI9WhcAEroiajdqM.NhG1Iy','Calcio','2017-08-23 15:36:26','2017-08-23 15:36:26',0),(13,'Erick','rckmnz05@gmail.com','$2a$10$xrVeGyooaIlYE1CKY.40ye0XIZvUK93TLUjyiVzdh3aXfFR7pdyHO','Coding, Eating, Technology','2017-08-23 15:51:41','2017-08-23 15:51:41',0),(14,'Tim_McNamara','timlmcn@gmail.com','$2a$10$ycMW.24GuqhDKxGhJOKTEelJNo3RpWOmtfXplq1g6iRtskGj/BAm.','Cars, web design','2017-08-23 16:23:45','2017-08-23 16:23:45',0),(15,'Ziad','ziad.saab@gmail.com','$2a$10$Ot5pyXsxSNGrj1ureGf/EOJVVRwOjripwaGCUbnqmZLNbbWSGIfgS','Software','2017-08-23 17:06:19','2017-08-24 17:10:07',1),(17,'adsfasdfasdfa','asdf@asdf.comasdfads','$2a$10$0.YFSYwwVlHF01Fk5Oac4.0eWXoA5io1gJmyxzaHxRdIEuwS2omaq','asdfasdfa','2017-08-24 14:23:45','2017-08-24 14:23:45',0),(21,'asdfadsf','asdkfjh@asdfas.ca','$2a$10$wfFgvBO.GSBS1QbMWctT3.xTTqZus2KNYZHJ33E3zSAWH.XI5fV7y','asdfads','2017-08-24 14:34:20','2017-08-24 14:34:20',0),(48,'asdfasdf','SADF@asdf.ca','$2a$10$YMM1hqmQ3wjPxCP4w7Rq7OLSxaKm9qJomljoxw2tiujOVZdsXUr1K','asdfasd','2017-08-24 15:27:44','2017-08-24 15:27:44',0),(49,'asdfa hhghgf','asdf@asdffasd.com','$2a$10$/Vt9VM/HYSI4LEpKyOEdMebVp.z0tUgiv25J.fr7Qc0oobDxuoo4S','asdf','2017-08-24 15:41:36','2017-08-24 15:41:36',0),(50,'asdfads','asdfads@asdf.com','$2a$10$ssDV0c0rk9OpMTyzvvhp0Ox7Luj0OsMbvsS4sVqsd7SnypHvkFkkS','adsf23f','2017-08-24 15:48:26','2017-08-24 15:48:26',0),(51,'Armel C','armelchiza@gmail.com','$2a$10$xPCOAZKCZJjXXWkXRMhgCuwQuQTqNrvWMLIOz3wBlwQpDgdEFHL7m','JuJitsu','2017-08-24 15:58:49','2017-08-24 15:58:49',0),(52,'Peter Smith','peter@peter.com','$2a$10$vJztoDea.GDnO/yKZ8h.VO8TB1gN41ImlbrCinU6foUO0UJ.2hj1G','cycling','2017-08-24 16:53:56','2017-08-24 16:53:56',0),(53,'Rachel','rachel@gmail.com','$2a$10$mWu9MpcU8r5vMTG1B5h5yeFxP0oA6cLp3.JnxYDzqdgvM5dzaUAE6','Sports','2017-08-24 16:56:17','2017-08-24 16:56:17',0),(54,'Rachel Elha','elhamoui.rachel@gmail.com','$2a$10$bGEb9Dcr3ZoF9OSdexVjfu7NDHnbXoqCjoZwADoeW0zAgkA.XRtG.','Reading, Film, Photography','2017-08-24 17:00:27','2017-08-24 17:00:27',0),(55,'Martin Coutu','philgo20@gmail.com','$2a$10$ebDkzx16CvRRJir4VaU2/eIld5DAUUJGUwDQrfvMbLdoBvPPfljmK','sports','2017-08-24 17:06:46','2017-08-24 17:06:46',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-24 13:12:39
