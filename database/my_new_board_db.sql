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

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_ips` (
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocked_by` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_ips`
--

LOCK TABLES `blocked_ips` WRITE;
/*!40000 ALTER TABLE `blocked_ips` DISABLE KEYS */;
INSERT INTO `blocked_ips` VALUES ('203.0.113.200','怨듦꺽 異쒕컻吏 ?먮룞 李⑤떒: 5??濡쒓렇???ㅽ뙣(?숈씪 IP)','apikey','2026-09-22 12:51:52'),('203.0.113.210','?먮룞 李⑤떒 by apikey','apikey','2026-09-28 15:28:14'),('203.0.113.211','?먮룞 李⑤떒 by apikey','apikey','2026-09-28 15:34:14'),('203.0.113.212','?먮룞 李⑤떒 by apikey','apikey','2026-09-28 15:55:14'),('203.0.113.213','?먮룞 李⑤떒 by apikey','apikey','2026-09-28 15:59:15'),('203.0.113.216','?먮룞 李⑤떒 by apikey','apikey','2026-09-28 15:04:55');
/*!40000 ALTER TABLE `blocked_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `severity` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `event_count` int DEFAULT NULL,
  `actions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_incidents_src_ip` (`src_ip`),
  KEY `ix_incidents_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'蹂댁븞 ?몄떆?섑듃: 203.0.113.210 (5嫄?','203.0.113.210','High','closed','[?몄떆?섑듃 ?붿빟] 異쒕컻吏 203.0.113.210\n- 愿???대깽?? 5嫄?(ip-guard횞3, login-guard횞2)\n- 理쒖큹/理쒖쥌: 2026-09-28 14:38:27 ~ 2026-09-28 15:28:14\n- 痍⑦빐吏?議곗튂: deny\n- 理쒓퀬 ?ш컖?? High\n[??꾨씪??\n- 2026-09-28 15:28:14 [High/ip-guard] IP ?ㅼ감?? 203.0.113.210 (users=-)\n- 2026-09-28 15:27:51 [High/login-guard] 怨꾩젙 ?좉툑: zz_inc (釉뚮（?명룷?? (users=zz_inc)\n- 2026-09-28 15:14:39 [High/ip-guard] repeated bruteforce (users=-)\n- 2026-09-28 14:48:24 [High/login-guard] 怨꾩젙 ?좉툑: zz_inc (釉뚮（?명룷?? (users=zz_inc)\n- 2026-09-28 14:38:27 [High/ip-guard] repeated bruteforce (users=-)',5,'deny','kry','2026-09-28 15:05:40','2026-09-28 15:38:28','2026-09-28 15:38:28'),(2,'蹂댁븞 ?몄떆?섑듃: 203.0.113.211 (1嫄?','203.0.113.211','High','closed','[?몄떆?섑듃 ?붿빟] 異쒕컻吏 203.0.113.211\n- 愿???대깽?? 1嫄?(login-guard횞1)\n- 理쒖큹/理쒖쥌: 2026-09-28 15:31:53 ~ 2026-09-28 15:31:53\n- 痍⑦빐吏?議곗튂: deny\n- 理쒓퀬 ?ш컖?? High\n[??꾨씪??\n- 2026-09-28 15:31:53 [High/login-guard] 怨꾩젙 ?좉툑: zz_inc2 (釉뚮（?명룷?? (users=zz_inc2)',1,'deny','kry2','2026-09-28 15:29:42','2026-09-28 15:48:13','2026-09-28 15:48:13'),(3,'蹂댁븞 ?몄떆?섑듃: 203.0.113.211 (0嫄?','203.0.113.211','Low','closed','[?몄떆?섑듃 ?붿빟] 異쒕컻吏 203.0.113.211\n- 愿???대깽?? 0嫄?()\n- 理쒖큹/理쒖쥌: None ~ None\n- 痍⑦빐吏?議곗튂: ?놁쓬\n- 理쒓퀬 ?ш컖?? Low\n[??꾨씪??\n',0,'?놁쓬','kry2','2026-09-28 15:39:59','2026-09-28 15:48:23','2026-09-28 15:48:23'),(4,'蹂댁븞 ?몄떆?섑듃: 203.0.113.212 (1嫄?','203.0.113.212','High','closed','[?몄떆?섑듃 ?붿빟] 異쒕컻吏 203.0.113.212\n- 愿???대깽?? 1嫄?(login-guard횞1)\n- 理쒖큹/理쒖쥌: 2026-09-28 15:52:43 ~ 2026-09-28 15:52:43\n- 痍⑦빐吏?議곗튂: deny\n- 理쒓퀬 ?ш컖?? High\n[??꾨씪??\n- 2026-09-28 15:52:43 [High/login-guard] 怨꾩젙 ?좉툑: zz_inc_1 (釉뚮（?명룷?? (users=zz_inc_1)',1,'deny','kry2','2026-09-28 15:55:14','2026-09-28 16:02:35','2026-09-28 16:02:35'),(5,'蹂댁븞 ?몄떆?섑듃: 203.0.113.213 (2嫄?','203.0.113.213','High','closed','[?몄떆?섑듃 ?붿빟] 異쒕컻吏 203.0.113.213\n- 愿???대깽?? 2嫄?(ip-guard횞1, login-guard횞1)\n- 理쒖큹/理쒖쥌: 2026-09-28 15:58:07 ~ 2026-09-28 15:59:15\n- 痍⑦빐吏?議곗튂: deny\n- 理쒓퀬 ?ш컖?? High\n[??꾨씪??\n- 2026-09-28 15:59:15 [High/ip-guard] IP ?ㅼ감?? 203.0.113.213 (users=-)\n- 2026-09-28 15:58:07 [High/login-guard] 怨꾩젙 ?좉툑: zz_inc_2 (釉뚮（?명룷?? (users=zz_inc_2)',2,'deny','kry3','2026-09-28 15:59:39','2026-09-28 16:03:47','2026-09-28 16:03:47');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `posts` VALUES (1,'寃뚯떆湲 ?쒕ぉ 1','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 1','?먯쑀',1),(2,'寃뚯떆湲 ?쒕ぉ 2','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 2','?쇰컲',1),(3,'寃뚯떆湲 ?쒕ぉ 3','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 3','怨듭?',1),(4,'寃뚯떆湲 ?쒕ぉ 4','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 4','?먯쑀',1),(5,'寃뚯떆湲 ?쒕ぉ 5','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 5','?쇰컲',1),(6,'寃뚯떆湲 ?쒕ぉ 6','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 6','怨듭?',1),(7,'寃뚯떆湲 ?쒕ぉ 7','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 7','?먯쑀',1),(8,'寃뚯떆湲 ?쒕ぉ 8','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 8','?쇰컲',1),(9,'寃뚯떆湲 ?쒕ぉ 9','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 9','怨듭?',1),(10,'寃뚯떆湲 ?쒕ぉ 10','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 10','?먯쑀',1),(11,'寃뚯떆湲 ?쒕ぉ 11','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 11','?쇰컲',1),(12,'寃뚯떆湲 ?쒕ぉ 12','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 12','怨듭?',1),(13,'寃뚯떆湲 ?쒕ぉ 13','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 13','?먯쑀',1),(14,'寃뚯떆湲 ?쒕ぉ 14','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 14','?쇰컲',1),(15,'寃뚯떆湲 ?쒕ぉ 15','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 15','怨듭?',1),(16,'寃뚯떆湲 ?쒕ぉ 16','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 16','?먯쑀',1),(17,'寃뚯떆湲 ?쒕ぉ 17','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 17','?쇰컲',1),(18,'寃뚯떆湲 ?쒕ぉ 18','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 18','怨듭?',1),(19,'寃뚯떆湲 ?쒕ぉ 19','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 19','?먯쑀',1),(20,'寃뚯떆湲 ?쒕ぉ 20','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 20','?쇰컲',1),(21,'寃뚯떆湲 ?쒕ぉ 21','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 21','怨듭?',1),(22,'寃뚯떆湲 ?쒕ぉ 22','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 22','?먯쑀',1),(23,'寃뚯떆湲 ?쒕ぉ 23','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 23','?쇰컲',1),(24,'寃뚯떆湲 ?쒕ぉ 24','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 24','怨듭?',1),(25,'寃뚯떆湲 ?쒕ぉ 25','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 25','?먯쑀',1),(26,'寃뚯떆湲 ?쒕ぉ 26','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 26','?쇰컲',1),(27,'寃뚯떆湲 ?쒕ぉ 27','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 27','怨듭?',1),(28,'寃뚯떆湲 ?쒕ぉ 28','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 28','?먯쑀',1),(29,'寃뚯떆湲 ?쒕ぉ 29','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 29','?쇰컲',1),(30,'寃뚯떆湲 ?쒕ぉ 30','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 30','怨듭?',1),(31,'寃뚯떆湲 ?쒕ぉ 31','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 31','?먯쑀',1),(32,'寃뚯떆湲 ?쒕ぉ 32','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 32','?쇰컲',1),(33,'寃뚯떆湲 ?쒕ぉ 33','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 33','怨듭?',1),(34,'寃뚯떆湲 ?쒕ぉ 34','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 34','?먯쑀',1),(35,'寃뚯떆湲 ?쒕ぉ 35','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 35','?쇰컲',1),(36,'寃뚯떆湲 ?쒕ぉ 36','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 36','怨듭?',1),(37,'寃뚯떆湲 ?쒕ぉ 37','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 37','?먯쑀',1),(38,'寃뚯떆湲 ?쒕ぉ 38','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 38','?쇰컲',1),(39,'寃뚯떆湲 ?쒕ぉ 39','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 39','怨듭?',1),(40,'寃뚯떆湲 ?쒕ぉ 40','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 40','?먯쑀',1),(41,'寃뚯떆湲 ?쒕ぉ 41','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 41','?쇰컲',1),(42,'寃뚯떆湲 ?쒕ぉ 42','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 42','怨듭?',1),(43,'寃뚯떆湲 ?쒕ぉ 43','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 43','?먯쑀',1),(44,'寃뚯떆湲 ?쒕ぉ 44','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 44','?쇰컲',1),(45,'寃뚯떆湲 ?쒕ぉ 45','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 45','怨듭?',1),(46,'寃뚯떆湲 ?쒕ぉ 46','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 46','?먯쑀',1),(47,'寃뚯떆湲 ?쒕ぉ 47','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 47','?쇰컲',1),(48,'寃뚯떆湲 ?쒕ぉ 48','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 48','怨듭?',1),(49,'寃뚯떆湲 ?쒕ぉ 49','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 49','?먯쑀',1),(50,'寃뚯떆湲 ?쒕ぉ 50','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 50','?쇰컲',1),(51,'寃뚯떆湲 ?쒕ぉ 51','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 51','怨듭?',1),(52,'寃뚯떆湲 ?쒕ぉ 52','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 52','?먯쑀',1),(53,'寃뚯떆湲 ?쒕ぉ 53','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 53','?쇰컲',1),(54,'寃뚯떆湲 ?쒕ぉ 54','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 54','怨듭?',1),(55,'寃뚯떆湲 ?쒕ぉ 55','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 55','?먯쑀',1),(56,'寃뚯떆湲 ?쒕ぉ 56','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 56','?쇰컲',1),(57,'寃뚯떆湲 ?쒕ぉ 57','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 57','怨듭?',1),(58,'寃뚯떆湲 ?쒕ぉ 58','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 58','?먯쑀',1),(59,'寃뚯떆湲 ?쒕ぉ 59','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 59','?쇰컲',1),(60,'寃뚯떆湲 ?쒕ぉ 60','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 60','怨듭?',1),(61,'寃뚯떆湲 ?쒕ぉ 61','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 61','?먯쑀',1),(62,'寃뚯떆湲 ?쒕ぉ 62','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 62','?쇰컲',1),(63,'寃뚯떆湲 ?쒕ぉ 63','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 63','怨듭?',1),(64,'寃뚯떆湲 ?쒕ぉ 64','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 64','?먯쑀',1),(65,'寃뚯떆湲 ?쒕ぉ 65','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 65','?쇰컲',1),(66,'寃뚯떆湲 ?쒕ぉ 66','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 66','怨듭?',1),(67,'寃뚯떆湲 ?쒕ぉ 67','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 67','?먯쑀',1),(68,'寃뚯떆湲 ?쒕ぉ 68','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 68','?쇰컲',1),(69,'寃뚯떆湲 ?쒕ぉ 69','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 69','怨듭?',1),(70,'寃뚯떆湲 ?쒕ぉ 70','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 70','?먯쑀',1),(71,'寃뚯떆湲 ?쒕ぉ 71','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 71','?쇰컲',1),(72,'寃뚯떆湲 ?쒕ぉ 72','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 72','怨듭?',1),(73,'寃뚯떆湲 ?쒕ぉ 73','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 73','?먯쑀',1),(74,'寃뚯떆湲 ?쒕ぉ 74','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 74','?쇰컲',1),(75,'寃뚯떆湲 ?쒕ぉ 75','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 75','怨듭?',1),(76,'寃뚯떆湲 ?쒕ぉ 76','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 76','?먯쑀',1),(77,'寃뚯떆湲 ?쒕ぉ 77','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 77','?쇰컲',1),(78,'寃뚯떆湲 ?쒕ぉ 78','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 78','怨듭?',1),(79,'寃뚯떆湲 ?쒕ぉ 79','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 79','?먯쑀',1),(80,'寃뚯떆湲 ?쒕ぉ 80','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 80','?쇰컲',1),(81,'寃뚯떆湲 ?쒕ぉ 81','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 81','怨듭?',1),(82,'寃뚯떆湲 ?쒕ぉ 82','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 82','?먯쑀',1),(83,'寃뚯떆湲 ?쒕ぉ 83','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 83','?쇰컲',1),(84,'寃뚯떆湲 ?쒕ぉ 84','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 84','怨듭?',1),(85,'寃뚯떆湲 ?쒕ぉ 85','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 85','?먯쑀',1),(86,'寃뚯떆湲 ?쒕ぉ 86','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 86','?쇰컲',1),(87,'寃뚯떆湲 ?쒕ぉ 87','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 87','怨듭?',1),(88,'寃뚯떆湲 ?쒕ぉ 88','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 88','?먯쑀',1),(89,'寃뚯떆湲 ?쒕ぉ 89','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 89','?쇰컲',1),(90,'寃뚯떆湲 ?쒕ぉ 90','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 90','怨듭?',1),(91,'寃뚯떆湲 ?쒕ぉ 91','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 91','?먯쑀',1),(92,'寃뚯떆湲 ?쒕ぉ 92','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 92','?쇰컲',1),(93,'寃뚯떆湲 ?쒕ぉ 93','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 93','怨듭?',1),(94,'寃뚯떆湲 ?쒕ぉ 94','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 94','?먯쑀',1),(95,'寃뚯떆湲 ?쒕ぉ 95','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 95','?쇰컲',1),(96,'寃뚯떆湲 ?쒕ぉ 96','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 96','怨듭?',1),(97,'寃뚯떆湲 ?쒕ぉ 97','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 97','?먯쑀',1),(98,'寃뚯떆湲 ?쒕ぉ 98','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 98','?쇰컲',1),(99,'寃뚯떆湲 ?쒕ぉ 99','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 99','怨듭?',1),(100,'寃뚯떆湲 ?쒕ぉ 100','?닿쾬? 寃뚯떆湲 ?댁슜?낅땲?? ?뚯뒪???곗씠??踰덊샇: 100','?먯쑀',1);
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
  `student` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fail_count` int NOT NULL,
  `decision` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_min` int DEFAULT NULL,
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_at` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_security_events_src_ip` (`src_ip`),
  KEY `ix_security_events_student` (`student`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_events`
--

LOCK TABLES `security_events` WRITE;
/*!40000 ALTER TABLE `security_events` DISABLE KEYS */;
INSERT INTO `security_events` VALUES (1,'源?쇱뿰','1.2.3.118',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-14 12:16:49'),(2,'源?쇱뿰','1.2.3.4',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-14 12:20:53'),(3,'源?쇱뿰','5.6.7.8',0,'allow','Low','level 3 (rule 1001) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-14 12:20:55'),(4,'源?쇱뿰','1.2.3.4',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:56:56'),(5,'源?쇱뿰','5.6.7.8',0,'allow','Low','level 3 (rule 1001) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:56:59'),(6,'源?쇱뿰','1.2.3.4',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:57:29'),(7,'源?쇱뿰','5.6.7.8',0,'allow','Low','level 3 (rule 1001) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:57:32'),(8,'源?쇱뿰','1.2.3.4',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:59:21'),(9,'源?쇱뿰','5.6.7.8',0,'allow','Low','level 3 (rule 1001) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 11:59:24'),(10,'源?쇱뿰','1.2.3.4',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:02:50'),(11,'源?쇱뿰','5.6.7.8',0,'allow','Low','level 3 (rule 1001) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:02:52'),(12,'源?쇱뿰','1.2.3.4',0,'allow','Low','level 10 (rule 5712) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:12:26'),(13,'源?쇱뿰','1.2.3.4',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:40:14'),(14,'源?쇱뿰','5.6.7.8',0,'allow','Low','level 3 (rule 1001) ??allow',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:40:15'),(15,'源?쇱뿰','1.2.3.118',0,'deny','High','level 10 (rule 5712) ??deny',NULL,NULL,NULL,'login_guard',NULL,'2026-09-15 12:43:42'),(16,'lsy','0.0.0.0',0,'deny','High','usauthorized admin auto-revoked via n8n','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:37:37'),(17,'admin','0.0.0.0',0,'deny','High','愿由ъ옄 ?섏씠吏 ?섎룞 ?뚯닔','kry',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:37:53'),(18,'admin','0.0.0.0',0,'deny','High','愿由ъ옄 ?섏씠吏 ?섎룞 ?뚯닔','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:37:55'),(19,'lsy','0.0.0.0',0,'deny','High','usauthorized admin auto-revoked via n8n','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-16 12:38:21'),(67,'lsy','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 admin)','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 10:19:57'),(68,'lsy','127.0.0.1',0,'deny','High','unauthorized admin auto-revoked via n8n','zz_victim',NULL,NULL,'privilege-guard',NULL,'2026-09-17 10:56:32'),(69,'lsy','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)','zz_admin2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:01:26'),(70,'lsy','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)','zz_admin',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:05:26'),(71,'lsy','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 unknown)','admin',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:16:28'),(72,'lsy','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)','zz_victim',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:17:30'),(73,'lsy','127.0.0.1',0,'deny','High','unauthorized admin auto-revoked via n8n','lsy2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 11:35:54'),(74,'lsy','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)','test1',NULL,NULL,'privilege-guard',NULL,'2026-09-17 12:07:38'),(75,'kry','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:02:21'),(76,'kry','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:06:15'),(77,'kry','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:06:57'),(78,'kry','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 kry)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:07:42'),(79,'kry','0.0.0.0',0,'deny','High','usauthorized admin auto-revoked via n8n','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:13:29'),(80,'kry','127.0.0.1',0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:15:55'),(81,'kry','?뚯뒪??異쒕컻吏 ?꾩씠??,0,'deny','High','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?뚯뒪??猷?(遺?ъ옄 ?뚯뒪???뱀씤 愿由ъ옄)','kry2',NULL,NULL,'privilege-guard',NULL,'2026-09-17 15:18:33'),(118,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3-synflood) ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:04:19'),(119,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3-synflood) ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:05:59'),(120,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:44:59'),(121,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:45:13'),(122,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:45:29'),(123,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:45:44'),(124,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:59:34'),(125,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 11:59:44'),(126,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:00:00'),(127,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:00:14'),(128,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:24:31'),(129,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:24:43'),(130,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:24:59'),(131,'lsy','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:25:14'),(132,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:30:14'),(133,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:30:28'),(134,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:30:44'),(135,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:30:59'),(136,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:32:13'),(137,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:32:29'),(138,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:32:44'),(139,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-21 12:32:59'),(140,'kali-01','203.0.113.50',0,'deny','High','bruteforce test','',NULL,NULL,'ip-guard',NULL,'2026-09-22 11:37:54'),(141,'kali-01','203.0.113.50',0,'deny','High','bruteforce test','',NULL,NULL,'ip-guard',NULL,'2026-09-22 12:03:28'),(142,'kry','203.0.113.200',5,'deny','High','怨듦꺽 異쒕컻吏 ?먮룞 李⑤떒: 5??濡쒓렇???ㅽ뙣(?숈씪 IP)','',NULL,NULL,'ip-guard',NULL,'2026-09-22 12:21:07'),(143,'kali-01','203.0.113.50',0,'deny','High','bruteforce test','',NULL,NULL,'ip-guard',NULL,'2026-09-22 12:32:25'),(144,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-22 12:34:59'),(145,'kry','172.31.195.249',10,'deny','High','level 10 (rule hping3 SYN flood ?먯? ?뚯뒪?? ??deny','',NULL,NULL,'graylog',NULL,'2026-09-22 12:35:14'),(146,'kali-01','203.0.113.50',0,'deny','High','bruteforce test','',NULL,NULL,'ip-guard',NULL,'2026-09-22 12:47:35'),(147,'kry','203.0.113.200',5,'deny','High','怨듦꺽 異쒕컻吏 ?먮룞 李⑤떒: 5??濡쒓렇???ㅽ뙣(?숈씪 IP)','',NULL,NULL,'ip-guard',NULL,'2026-09-22 12:51:52'),(148,'源?쇱뿰','198.51.100.77',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 12:37:44'),(149,'源?쇱뿰','203.0.113.90',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 12:38:55'),(150,'源?쇱뿰','203.0.113.90',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 13:14:55'),(151,'源?쇱뿰','203.0.113.90',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 13:16:56'),(152,'源?쇱뿰','198.51.100.77',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 13:19:54'),(153,'源?쇱뿰','203.0.113.90',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 13:27:55'),(154,'源?쇱뿰','198.51.100.77',0,'deny','Low',NULL,NULL,NULL,NULL,'login_guard',NULL,'2026-09-23 13:28:24'),(199,'kry','203.0.113.216',0,'deny','Critical','IP ?ㅼ감?? 203.0.113.216','',NULL,NULL,'ip-guard',NULL,'2026-09-28 14:26:40'),(200,'apikey','203.0.113.210',0,'deny','High','repeated bruteforce','',NULL,NULL,'ip-guard',NULL,'2026-09-28 14:38:27'),(201,'apikey','203.0.113.210',0,'deny','High','怨꾩젙 ?좉툑: zz_inc (釉뚮（?명룷??','zz_inc',NULL,NULL,'login-guard',NULL,'2026-09-28 14:48:24'),(202,'kry','203.0.113.216',0,'deny','Critical','IP ?ㅼ감?? 203.0.113.216','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:04:55'),(203,'kry','127.0.0.1',0,'deny','High','IP ?ㅼ감?? 127.0.0.1','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:12:14'),(204,'apikey','203.0.113.210',0,'deny','High','repeated bruteforce','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:14:39'),(205,'apikey','203.0.113.210',0,'deny','High','怨꾩젙 ?좉툑: zz_inc (釉뚮（?명룷??','zz_inc',NULL,NULL,'login-guard',NULL,'2026-09-28 15:27:51'),(206,'kry','203.0.113.210',0,'deny','High','IP ?ㅼ감?? 203.0.113.210','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:28:14'),(207,'apikey','203.0.113.211',0,'deny','High','怨꾩젙 ?좉툑: zz_inc2 (釉뚮（?명룷??','zz_inc2',NULL,NULL,'login-guard',NULL,'2026-09-28 15:31:53'),(208,'kry','203.0.113.211',0,'deny','High','IP ?ㅼ감?? 203.0.113.211','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:34:14'),(209,'apikey','203.0.113.212',0,'deny','High','怨꾩젙 ?좉툑: zz_inc_1 (釉뚮（?명룷??','zz_inc_1',NULL,NULL,'login-guard',NULL,'2026-09-28 15:52:43'),(210,'kry','203.0.113.212',0,'deny','High','IP ?ㅼ감?? 203.0.113.212','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:55:14'),(211,'apikey','203.0.113.213',0,'deny','High','怨꾩젙 ?좉툑: zz_inc_2 (釉뚮（?명룷??','zz_inc_2',NULL,NULL,'login-guard',NULL,'2026-09-28 15:58:07'),(212,'kry','203.0.113.213',0,'deny','High','IP ?ㅼ감?? 203.0.113.213','',NULL,NULL,'ip-guard',NULL,'2026-09-28 15:59:15');
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
  `username` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `role_granted_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_granted_at` datetime DEFAULT NULL,
  `role_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `locked_at` datetime DEFAULT NULL,
  `lock_reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_logins` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kry','scrypt:32768:8:1$s7knMGdURBQwxnvU$87d33b7d1f51005c875e58f4624fa095aa3c8c72ec8c870e0633b22239b0d80dae3b193b088d9fe86d04a97ff73f23fe293fa0bf0a28431901f328960f5098ad','admin','admin','2026-09-17 14:59:28','',0,NULL,NULL,0),(2,'admin','scrypt:32768:8:1$YY79rzFTXBhFsFhh$c82d4fb3a0b49b05a67adea4c173fe1cac76faa98007fedbedc87533dc25b6541730c897c01e6a53dd52f1028d1afa810bc41e3420d3dfe533779f440084b7fb','admin','lsy','2026-09-17 11:18:35','',0,NULL,NULL,0),(3,'test','scrypt:32768:8:1$5Xzf8N4bd9mCaYQD$a269471982d17317cb7ae242e486f5ec94592e5046793e97f22ab1ee7decaf15c7033e8526bcad50acc552a0194e29880e17ace0dd6e7e18dfa67969f068fa7e','gold','admin','2026-09-14 11:08:15','',0,NULL,NULL,0),(5,'kry2','scrypt:32768:8:1$XLuZIaPIfflZNuG6$abea2433eb171706b6b02b4b57e56c5aa3a49a132b36dac756854af88c37e70d36e11eb539a4d1e9e748251d1bfe8c78a06fb27186bdfa94144a64eee52998eb','user','apikey','2026-09-17 15:18:33','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?뚯뒪??猷?(遺?ъ옄 ?뚯뒪???뱀씤 愿由ъ옄)',0,NULL,NULL,0),(6,'lsy','scrypt:32768:8:1$valnvJhNhPSkTJnG$6fb414f859f1ef9b3b86d9f0507ca14debdfb8fd08ac2bb8edd8da4d0d7a2fe7431cd7573d864093444144cec061f50f4ab55d031822c6e1a42f3901bfd1995d','admin','admin','2026-09-16 12:07:58','',0,NULL,NULL,0),(7,'lsy2','scrypt:32768:8:1$6Rsc11m50adD8oJa$22ccc28285e5e99278795a00d606b3a5634331d8ac515bab8701100f1dc9c86d638ec5492229c33f9bb134c6b45a4bbfe5b08bb990994b228c89d82984e14e35','user','apikey','2026-09-17 11:35:54','unauthorized admin auto-revoked via n8n',0,NULL,NULL,0),(56,'lsy4','scrypt:32768:8:1$KisG0DqUC5xXIZS5$30070a5f6c4112532f7a727da7ffcd871a912a2cd261975f9fb63e7b67e11bf9f6b5316ac7bfc096bad53699f8cd33741b7ae36d8da9e281368717bfd4a7abcd','user',NULL,NULL,NULL,0,NULL,NULL,0),(57,'zz_admin','scrypt:32768:8:1$hjsQnfPwU8EqM0ts$6c5e19b26b9131b42c1bdbae4b14e83375abe2cd4a3755de87b4782818878467b9b658fbad70852c08ff486aaa48488f7081899782ece66cf3b8a9c9dd09027e','user','apikey','2026-09-17 11:05:26','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)',0,NULL,NULL,0),(58,'zz_admin2','scrypt:32768:8:1$i75af8T9dIDeWbGF$672ede574587efc0530929d5d81774e891f208d7bba154000c116eeac15bbd8267cf719c8bbe4fa25bc931139d3affe795b4a8e75f03118d7c4914f014d3f1a0','user','apikey','2026-09-17 11:01:26','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)',0,NULL,NULL,0),(59,'zz_victim','scrypt:32768:8:1$zGAaKyilBspBmWtz$aaeed8f91402f4c0148ddd37b43e89979a34490af0a074db5564e89f2d08919174340822252095bd339e3448a1a19b6c775059e6cd3fbc7cadde803d3f65eb6b','user','apikey','2026-09-17 11:17:30','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)',0,NULL,NULL,0),(60,'test1','scrypt:32768:8:1$6Ht3k2xABuSfTyCu$5132afcc051d8ad384f7a43cb18c1a0b23eaba125349bd1890f327b8b17eba302e2927e7de380d705dab12664ac24b81e1bbf85fe58923155f72506e00bec73c','user','apikey','2026-09-17 12:07:38','怨쇱엵沅뚰븳 ?먮룞?뚯닔: ?먮룞 ?뚯닔遊??뚯뒪??(遺?ъ옄 apikey)',0,NULL,NULL,0),(107,'zz_inc','scrypt:32768:8:1$fX2ptLCzWNIxhzKW$880d26b45c8d16b74ecddd8ed623af8ce2d8802daf6f8cdf2df05c4cb4a45b55ecd17753ceffd11ded6d417ee73b0487e9e9654dfc9a296e5ecc6fd14dab6229','user',NULL,NULL,NULL,1,'2026-09-28 15:27:51','釉뚮（?명룷???먮룞 ?좉툑 by apikey',0),(108,'zz_inc2','scrypt:32768:8:1$LqfWVEKAC6rvbGf5$697c1e9b8b051ac1dde95995aa412999663e888bc284064d70903a00b0b64e4fa79b78c0af04cd34239b4b6579dfb26eb8b226af024f6661d995035e2f716529','user',NULL,NULL,NULL,1,'2026-09-28 15:31:53','釉뚮（?명룷???먮룞 ?좉툑 by apikey',0),(109,'zz_inc_1','scrypt:32768:8:1$jFs70c77vpjb2CaG$66f73fe94b4031c41a9fca42f0a3a423497e300fcdb68d8081b17112f2f9d73822689088188a70b6683e75811d48080812e2d2ec4d882c53affc8cd6eaa71407','user',NULL,NULL,NULL,1,'2026-09-28 15:52:43','釉뚮（?명룷???먮룞 ?좉툑 by apikey',0),(110,'zz_inc_2','scrypt:32768:8:1$YIuGmd18gownjhJn$fd19b5698d912f2a5fde17a97d33f90e88c7fb34c72c397c69e2b7400b79d08b0399f82c1d5a8d63ead029ee1b4ef75b3c761583c323a11bf0b47d1a5eba0b00','user',NULL,NULL,NULL,1,'2026-09-28 15:58:07','釉뚮（?명룷???먮룞 ?좉툑 by apikey',0);
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

-- Dump completed on 2026-09-28  8:35:53
