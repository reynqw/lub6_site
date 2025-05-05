-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: all_library_new
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `autor` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Лев Толстой','Война и мир'),(2,'Фёдор Достоевский','Преступление и наказание'),(3,'Михаил Булгаков','Мастер и Маргарита'),(4,'Александр Пушкин','Капитанская дочка'),(5,'Иван Тургенев','Отцы и дети'),(6,'Максим Горький','На дне'),(7,'Антон Чехов','Чайка'),(8,'Владимир Набоков','Лолита'),(9,'Николай Лесков','Очарованный странник'),(10,'Андрей Платонов','Котлован');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed_book`
--

DROP TABLE IF EXISTS `borrowed_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed_book` (
  `id_borrowed_book` int NOT NULL AUTO_INCREMENT,
  `loan_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `reader_id` int DEFAULT NULL,
  PRIMARY KEY (`id_borrowed_book`),
  KEY `FKgfew4nhw99hxn1vhfu5dvneos` (`book_id`),
  KEY `FK1xm7hrg2oyc99lm5uypswm9l3` (`reader_id`),
  CONSTRAINT `FK1xm7hrg2oyc99lm5uypswm9l3` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id_reader`),
  CONSTRAINT `FKgfew4nhw99hxn1vhfu5dvneos` FOREIGN KEY (`book_id`) REFERENCES `books` (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed_book`
--

LOCK TABLES `borrowed_book` WRITE;
/*!40000 ALTER TABLE `borrowed_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowed_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed_books`
--

DROP TABLE IF EXISTS `borrowed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed_books` (
  `id_borrowed_books` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `loan_id` int DEFAULT NULL,
  `reader_id` int DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id_borrowed_books`),
  KEY `book_id` (`book_id`),
  KEY `reader_id` (`reader_id`),
  CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id_book`),
  CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id_reader`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed_books`
--

LOCK TABLES `borrowed_books` WRITE;
/*!40000 ALTER TABLE `borrowed_books` DISABLE KEYS */;
INSERT INTO `borrowed_books` VALUES (1,1,101,1,'2025-04-20'),(2,2,102,2,'2025-04-15'),(3,3,103,3,NULL),(4,4,104,4,'2025-04-18'),(5,5,105,5,NULL),(6,6,106,6,'2025-04-10'),(7,7,107,7,NULL),(8,8,108,8,NULL),(9,9,109,4,'2025-04-22'),(10,10,110,1,NULL);
/*!40000 ALTER TABLE `borrowed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `id_reader` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_reader`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'Иван','Иванов'),(2,'Мария','Смирнова'),(3,'Александр','Кузнецов'),(4,'Николай','Смирнов'),(5,'Наталья','Седова'),(6,'Виталий','Новиков'),(7,'Ярослав','Великий'),(8,'Мирослава','Демидова'),(9,'user112','user112');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin1','admin1','admin'),(4,'admin12','admin12','user'),(6,'user15','user15','user'),(7,'user112','user112','user'),(8,'user100','user100','USER'),(9,'user101','user101','USER'),(11,'user103','user103','USER'),(12,'user104','user104','USER'),(13,'user105','user105','USER'),(14,'user1005','user1005','user'),(15,'user228','user228','user'),(16,'api','api1','user'),(18,'api228','api228','user');
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

-- Dump completed on 2025-05-05 21:40:19
