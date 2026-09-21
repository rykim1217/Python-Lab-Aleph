-- MySQL dump 10.13  Distrib 26.7.0, for Linux (x86_64)
--
-- Host: localhost    Database: my_new_board_db
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'ed8a6684-a598-11f1-aef4-ba2d36b1aab5:1-150';

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'게시글 제목 1','이것은 게시글 내용입니다. 테스트 데이터 번호: 1','자유',1),(2,'게시글 제목 2','이것은 게시글 내용입니다. 테스트 데이터 번호: 2','일반',1),(3,'게시글 제목 3','이것은 게시글 내용입니다. 테스트 데이터 번호: 3','공지',1),(4,'게시글 제목 4','이것은 게시글 내용입니다. 테스트 데이터 번호: 4','자유',1),(5,'게시글 제목 5','이것은 게시글 내용입니다. 테스트 데이터 번호: 5','일반',1),(6,'게시글 제목 6','이것은 게시글 내용입니다. 테스트 데이터 번호: 6','공지',1),(7,'게시글 제목 7','이것은 게시글 내용입니다. 테스트 데이터 번호: 7','자유',1),(8,'게시글 제목 8','이것은 게시글 내용입니다. 테스트 데이터 번호: 8','일반',1),(9,'게시글 제목 9','이것은 게시글 내용입니다. 테스트 데이터 번호: 9','공지',1),(10,'게시글 제목 10','이것은 게시글 내용입니다. 테스트 데이터 번호: 10','자유',1),(11,'게시글 제목 11','이것은 게시글 내용입니다. 테스트 데이터 번호: 11','일반',1),(12,'게시글 제목 12','이것은 게시글 내용입니다. 테스트 데이터 번호: 12','공지',1),(13,'게시글 제목 13','이것은 게시글 내용입니다. 테스트 데이터 번호: 13','자유',1),(14,'게시글 제목 14','이것은 게시글 내용입니다. 테스트 데이터 번호: 14','일반',1),(15,'게시글 제목 15','이것은 게시글 내용입니다. 테스트 데이터 번호: 15','공지',1),(16,'게시글 제목 16','이것은 게시글 내용입니다. 테스트 데이터 번호: 16','자유',1),(17,'게시글 제목 17','이것은 게시글 내용입니다. 테스트 데이터 번호: 17','일반',1),(18,'게시글 제목 18','이것은 게시글 내용입니다. 테스트 데이터 번호: 18','공지',1),(19,'게시글 제목 19','이것은 게시글 내용입니다. 테스트 데이터 번호: 19','자유',1),(20,'게시글 제목 20','이것은 게시글 내용입니다. 테스트 데이터 번호: 20','일반',1),(21,'게시글 제목 21','이것은 게시글 내용입니다. 테스트 데이터 번호: 21','공지',1),(22,'게시글 제목 22','이것은 게시글 내용입니다. 테스트 데이터 번호: 22','자유',1),(23,'게시글 제목 23','이것은 게시글 내용입니다. 테스트 데이터 번호: 23','일반',1),(24,'게시글 제목 24','이것은 게시글 내용입니다. 테스트 데이터 번호: 24','공지',1),(25,'게시글 제목 25','이것은 게시글 내용입니다. 테스트 데이터 번호: 25','자유',1),(26,'게시글 제목 26','이것은 게시글 내용입니다. 테스트 데이터 번호: 26','일반',1),(27,'게시글 제목 27','이것은 게시글 내용입니다. 테스트 데이터 번호: 27','공지',1),(28,'게시글 제목 28','이것은 게시글 내용입니다. 테스트 데이터 번호: 28','자유',1),(29,'게시글 제목 29','이것은 게시글 내용입니다. 테스트 데이터 번호: 29','일반',1),(30,'게시글 제목 30','이것은 게시글 내용입니다. 테스트 데이터 번호: 30','공지',1),(31,'게시글 제목 31','이것은 게시글 내용입니다. 테스트 데이터 번호: 31','자유',1),(32,'게시글 제목 32','이것은 게시글 내용입니다. 테스트 데이터 번호: 32','일반',1),(33,'게시글 제목 33','이것은 게시글 내용입니다. 테스트 데이터 번호: 33','공지',1),(34,'게시글 제목 34','이것은 게시글 내용입니다. 테스트 데이터 번호: 34','자유',1),(35,'게시글 제목 35','이것은 게시글 내용입니다. 테스트 데이터 번호: 35','일반',1),(36,'게시글 제목 36','이것은 게시글 내용입니다. 테스트 데이터 번호: 36','공지',1),(37,'게시글 제목 37','이것은 게시글 내용입니다. 테스트 데이터 번호: 37','자유',1),(38,'게시글 제목 38','이것은 게시글 내용입니다. 테스트 데이터 번호: 38','일반',1),(39,'게시글 제목 39','이것은 게시글 내용입니다. 테스트 데이터 번호: 39','공지',1),(40,'게시글 제목 40','이것은 게시글 내용입니다. 테스트 데이터 번호: 40','자유',1),(41,'게시글 제목 41','이것은 게시글 내용입니다. 테스트 데이터 번호: 41','일반',1),(42,'게시글 제목 42','이것은 게시글 내용입니다. 테스트 데이터 번호: 42','공지',1),(43,'게시글 제목 43','이것은 게시글 내용입니다. 테스트 데이터 번호: 43','자유',1),(44,'게시글 제목 44','이것은 게시글 내용입니다. 테스트 데이터 번호: 44','일반',1),(45,'게시글 제목 45','이것은 게시글 내용입니다. 테스트 데이터 번호: 45','공지',1),(46,'게시글 제목 46','이것은 게시글 내용입니다. 테스트 데이터 번호: 46','자유',1),(47,'게시글 제목 47','이것은 게시글 내용입니다. 테스트 데이터 번호: 47','일반',1),(48,'게시글 제목 48','이것은 게시글 내용입니다. 테스트 데이터 번호: 48','공지',1),(49,'게시글 제목 49','이것은 게시글 내용입니다. 테스트 데이터 번호: 49','자유',1),(50,'게시글 제목 50','이것은 게시글 내용입니다. 테스트 데이터 번호: 50','일반',1),(51,'게시글 제목 51','이것은 게시글 내용입니다. 테스트 데이터 번호: 51','공지',1),(52,'게시글 제목 52','이것은 게시글 내용입니다. 테스트 데이터 번호: 52','자유',1),(53,'게시글 제목 53','이것은 게시글 내용입니다. 테스트 데이터 번호: 53','일반',1),(54,'게시글 제목 54','이것은 게시글 내용입니다. 테스트 데이터 번호: 54','공지',1),(55,'게시글 제목 55','이것은 게시글 내용입니다. 테스트 데이터 번호: 55','자유',1),(56,'게시글 제목 56','이것은 게시글 내용입니다. 테스트 데이터 번호: 56','일반',1),(57,'게시글 제목 57','이것은 게시글 내용입니다. 테스트 데이터 번호: 57','공지',1),(58,'게시글 제목 58','이것은 게시글 내용입니다. 테스트 데이터 번호: 58','자유',1),(59,'게시글 제목 59','이것은 게시글 내용입니다. 테스트 데이터 번호: 59','일반',1),(60,'게시글 제목 60','이것은 게시글 내용입니다. 테스트 데이터 번호: 60','공지',1),(61,'게시글 제목 61','이것은 게시글 내용입니다. 테스트 데이터 번호: 61','자유',1),(62,'게시글 제목 62','이것은 게시글 내용입니다. 테스트 데이터 번호: 62','일반',1),(63,'게시글 제목 63','이것은 게시글 내용입니다. 테스트 데이터 번호: 63','공지',1),(64,'게시글 제목 64','이것은 게시글 내용입니다. 테스트 데이터 번호: 64','자유',1),(65,'게시글 제목 65','이것은 게시글 내용입니다. 테스트 데이터 번호: 65','일반',1),(66,'게시글 제목 66','이것은 게시글 내용입니다. 테스트 데이터 번호: 66','공지',1),(67,'게시글 제목 67','이것은 게시글 내용입니다. 테스트 데이터 번호: 67','자유',1),(68,'게시글 제목 68','이것은 게시글 내용입니다. 테스트 데이터 번호: 68','일반',1),(69,'게시글 제목 69','이것은 게시글 내용입니다. 테스트 데이터 번호: 69','공지',1),(70,'게시글 제목 70','이것은 게시글 내용입니다. 테스트 데이터 번호: 70','자유',1),(71,'게시글 제목 71','이것은 게시글 내용입니다. 테스트 데이터 번호: 71','일반',1),(72,'게시글 제목 72','이것은 게시글 내용입니다. 테스트 데이터 번호: 72','공지',1),(73,'게시글 제목 73','이것은 게시글 내용입니다. 테스트 데이터 번호: 73','자유',1),(74,'게시글 제목 74','이것은 게시글 내용입니다. 테스트 데이터 번호: 74','일반',1),(75,'게시글 제목 75','이것은 게시글 내용입니다. 테스트 데이터 번호: 75','공지',1),(76,'게시글 제목 76','이것은 게시글 내용입니다. 테스트 데이터 번호: 76','자유',1),(77,'게시글 제목 77','이것은 게시글 내용입니다. 테스트 데이터 번호: 77','일반',1),(78,'게시글 제목 78','이것은 게시글 내용입니다. 테스트 데이터 번호: 78','공지',1),(79,'게시글 제목 79','이것은 게시글 내용입니다. 테스트 데이터 번호: 79','자유',1),(80,'게시글 제목 80','이것은 게시글 내용입니다. 테스트 데이터 번호: 80','일반',1),(81,'게시글 제목 81','이것은 게시글 내용입니다. 테스트 데이터 번호: 81','공지',1),(82,'게시글 제목 82','이것은 게시글 내용입니다. 테스트 데이터 번호: 82','자유',1),(83,'게시글 제목 83','이것은 게시글 내용입니다. 테스트 데이터 번호: 83','일반',1),(84,'게시글 제목 84','이것은 게시글 내용입니다. 테스트 데이터 번호: 84','공지',1),(85,'게시글 제목 85','이것은 게시글 내용입니다. 테스트 데이터 번호: 85','자유',1),(86,'게시글 제목 86','이것은 게시글 내용입니다. 테스트 데이터 번호: 86','일반',1),(87,'게시글 제목 87','이것은 게시글 내용입니다. 테스트 데이터 번호: 87','공지',1),(88,'게시글 제목 88','이것은 게시글 내용입니다. 테스트 데이터 번호: 88','자유',1),(89,'게시글 제목 89','이것은 게시글 내용입니다. 테스트 데이터 번호: 89','일반',1),(90,'게시글 제목 90','이것은 게시글 내용입니다. 테스트 데이터 번호: 90','공지',1),(91,'게시글 제목 91','이것은 게시글 내용입니다. 테스트 데이터 번호: 91','자유',1),(92,'게시글 제목 92','이것은 게시글 내용입니다. 테스트 데이터 번호: 92','일반',1),(93,'게시글 제목 93','이것은 게시글 내용입니다. 테스트 데이터 번호: 93','공지',1),(94,'게시글 제목 94','이것은 게시글 내용입니다. 테스트 데이터 번호: 94','자유',1),(95,'게시글 제목 95','이것은 게시글 내용입니다. 테스트 데이터 번호: 95','일반',1),(96,'게시글 제목 96','이것은 게시글 내용입니다. 테스트 데이터 번호: 96','공지',1),(97,'게시글 제목 97','이것은 게시글 내용입니다. 테스트 데이터 번호: 97','자유',1),(98,'게시글 제목 98','이것은 게시글 내용입니다. 테스트 데이터 번호: 98','일반',1),(99,'게시글 제목 99','이것은 게시글 내용입니다. 테스트 데이터 번호: 99','공지',1),(100,'게시글 제목 100','이것은 게시글 내용입니다. 테스트 데이터 번호: 100','자유',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_events`
--

DROP TABLE IF EXISTS `security_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fail_count` int NOT NULL,
  `decision` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_min` int DEFAULT NULL,
  `source` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_at` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_security_events_src_ip` (`src_ip`),
  KEY `ix_security_events_student` (`student`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_events`
--

LOCK TABLES `security_events` WRITE;
/*!40000 ALTER TABLE `security_events` DISABLE KEYS */;
INSERT INTO `security_events` VALUES (1,'김라연','1.2.3.118',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-14 12:16:49'),(2,'김라연','1.2.3.4',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-14 12:20:53'),(3,'김라연','5.6.7.8',0,'allow','Low','level 3 (rule 1001) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-14 12:20:55'),(4,'김라연','1.2.3.4',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:56:56'),(5,'김라연','5.6.7.8',0,'allow','Low','level 3 (rule 1001) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:56:59'),(6,'김라연','1.2.3.4',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:57:29'),(7,'김라연','5.6.7.8',0,'allow','Low','level 3 (rule 1001) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:57:32'),(8,'김라연','1.2.3.4',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:59:21'),(9,'김라연','5.6.7.8',0,'allow','Low','level 3 (rule 1001) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:59:24'),(10,'김라연','1.2.3.4',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:02:50'),(11,'김라연','5.6.7.8',0,'allow','Low','level 3 (rule 1001) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:02:52'),(12,'김라연','1.2.3.4',0,'allow','Low','level 10 (rule 5712) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:12:26'),(13,'김라연','1.2.3.4',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:40:14'),(14,'김라연','5.6.7.8',0,'allow','Low','level 3 (rule 1001) → allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:40:15'),(15,'김라연','1.2.3.118',0,'deny','High','level 10 (rule 5712) → deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:43:42'),(16,'lsy','0.0.0.0',0,'deny','High','usauthorized admin auto-revoked via n8n','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:37:37'),(17,'admin','0.0.0.0',0,'deny','High','관리자 페이지 수동 회수','kry',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:37:53'),(18,'admin','0.0.0.0',0,'deny','High','관리자 페이지 수동 회수','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:37:55'),(19,'lsy','0.0.0.0',0,'deny','High','usauthorized admin auto-revoked via n8n','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:38:21'),(67,'lsy','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 admin)','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 10:19:57'),(68,'lsy','127.0.0.1',0,'deny','High','unauthorized admin auto-revoked via n8n','zz_victim',NULL,NULL,'privilege-guard',NULL,'2026-09-17 10:56:32'),(69,'lsy','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)','zz_admin2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:01:26'),(70,'lsy','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)','zz_admin',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:05:26'),(71,'lsy','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 unknown)','admin',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:16:28'),(72,'lsy','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)','zz_victim',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:17:30'),(73,'lsy','127.0.0.1',0,'deny','High','unauthorized admin auto-revoked via n8n','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:35:54'),(74,'lsy','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)','test1',NULL,NULL,'privilege-guard',NULL,'2026-09-17 12:07:38'),(75,'kry','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:02:21'),(76,'kry','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:06:15'),(77,'kry','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:06:57'),(78,'kry','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:07:42'),(79,'kry','0.0.0.0',0,'deny','High','usauthorized admin auto-revoked via n8n','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:13:29'),(80,'kry','127.0.0.1',0,'deny','High','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:15:55'),(81,'kry','테스트 출발지 아이피',0,'deny','High','과잉권한 자동회수: 테스트 룰 (부여자 테스트 승인 관리자)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:18:33');
/*!40000 ALTER TABLE `security_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `role_granted_by` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_granted_at` datetime DEFAULT NULL,
  `role_reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kry','scrypt:32768:8:1$s7knMGdURBQwxnvU$87d33b7d1f51005c875e58f4624fa095aa3c8c72ec8c870e0633b22239b0d80dae3b193b088d9fe86d04a97ff73f23fe293fa0bf0a28431901f328960f5098ad','admin','admin','2026-09-17 14:59:28',''),(2,'admin','scrypt:32768:8:1$YY79rzFTXBhFsFhh$c82d4fb3a0b49b05a67adea4c173fe1cac76faa98007fedbedc87533dc25b6541730c897c01e6a53dd52f1028d1afa810bc41e3420d3dfe533779f440084b7fb','admin','lsy','2026-09-17 11:18:35',''),(3,'test','scrypt:32768:8:1$5Xzf8N4bd9mCaYQD$a269471982d17317cb7ae242e486f5ec94592e5046793e97f22ab1ee7decaf15c7033e8526bcad50acc552a0194e29880e17ace0dd6e7e18dfa67969f068fa7e','gold','admin','2026-09-14 11:08:15',''),(5,'kry2','scrypt:32768:8:1$XLuZIaPIfflZNuG6$abea2433eb171706b6b02b4b57e56c5aa3a49a132b36dac756854af88c37e70d36e11eb539a4d1e9e748251d1bfe8c78a06fb27186bdfa94144a64eee52998eb','user','apikey','2026-09-17 15:18:33','과잉권한 자동회수: 테스트 룰 (부여자 테스트 승인 관리자)'),(6,'lsy','scrypt:32768:8:1$valnvJhNhPSkTJnG$6fb414f859f1ef9b3b86d9f0507ca14debdfb8fd08ac2bb8edd8da4d0d7a2fe7431cd7573d864093444144cec061f50f4ab55d031822c6e1a42f3901bfd1995d','admin','admin','2026-09-16 12:07:58',''),(7,'lsy2','scrypt:32768:8:1$6Rsc11m50adD8oJa$22ccc28285e5e99278795a00d606b3a5634331d8ac515bab8701100f1dc9c86d638ec5492229c33f9bb134c6b45a4bbfe5b08bb990994b228c89d82984e14e35','user','apikey','2026-09-17 11:35:54','unauthorized admin auto-revoked via n8n'),(56,'lsy4','scrypt:32768:8:1$KisG0DqUC5xXIZS5$30070a5f6c4112532f7a727da7ffcd871a912a2cd261975f9fb63e7b67e11bf9f6b5316ac7bfc096bad53699f8cd33741b7ae36d8da9e281368717bfd4a7abcd','user',NULL,NULL,NULL),(57,'zz_admin','scrypt:32768:8:1$hjsQnfPwU8EqM0ts$6c5e19b26b9131b42c1bdbae4b14e83375abe2cd4a3755de87b4782818878467b9b658fbad70852c08ff486aaa48488f7081899782ece66cf3b8a9c9dd09027e','user','apikey','2026-09-17 11:05:26','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)'),(58,'zz_admin2','scrypt:32768:8:1$i75af8T9dIDeWbGF$672ede574587efc0530929d5d81774e891f208d7bba154000c116eeac15bbd8267cf719c8bbe4fa25bc931139d3affe795b4a8e75f03118d7c4914f014d3f1a0','user','apikey','2026-09-17 11:01:26','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)'),(59,'zz_victim','scrypt:32768:8:1$zGAaKyilBspBmWtz$aaeed8f91402f4c0148ddd37b43e89979a34490af0a074db5564e89f2d08919174340822252095bd339e3448a1a19b6c775059e6cd3fbc7cadde803d3f65eb6b','user','apikey','2026-09-17 11:17:30','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)'),(60,'test1','scrypt:32768:8:1$6Ht3k2xABuSfTyCu$5132afcc051d8ad384f7a43cb18c1a0b23eaba125349bd1890f327b8b17eba302e2927e7de380d705dab12664ac24b81e1bbf85fe58923155f72506e00bec73c','user','apikey','2026-09-17 12:07:38','과잉권한 자동회수: 자동 회수봇 테스트 (부여자 apikey)');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18  8:10:54
