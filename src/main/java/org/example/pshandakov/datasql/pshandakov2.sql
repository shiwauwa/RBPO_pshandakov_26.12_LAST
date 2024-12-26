-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: database
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
-- Table structure for table `action_auth_reg_history`
--

DROP TABLE IF EXISTS `action_auth_reg_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_auth_reg_history` (
  `id_action` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `time_action` datetime(6) NOT NULL,
  `action_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_auth_reg_history`
--

LOCK TABLES `action_auth_reg_history` WRITE;
/*!40000 ALTER TABLE `action_auth_reg_history` DISABLE KEYS */;
INSERT INTO `action_auth_reg_history` VALUES (1,'admin@mail.ru','admin','Успешный вход','2024-12-14 00:51:15.288869',''),(2,'admin@mail5.ru',NULL,'Неудачная попытка входа с admin@mail5.ru: email не существует','2024-12-14 00:51:40.317195',''),(3,'admin@mail.ru',NULL,'Неудачная попытка входа с admin@mail.ru: неверный пароль','2024-12-14 00:52:02.321558',''),(4,'admin@mail.ru',NULL,'Email уже используется','2024-12-14 01:17:57.424715','Регистрация'),(5,'admin@mail5.ru',NULL,'Ошибка регистрации: could not execute statement [Column \'username\' cannot be null] [insert into users (email,password,role,username) values (?,?,?,?)]; SQL [insert into users (email,password,role,username) values (?,?,?,?)]; constraint [null]','2024-12-14 01:18:05.472274','Регистрация'),(6,'admin@mail5.ru','Pavel56','Успешная регистрация','2024-12-14 01:21:16.378179','Регистрация'),(7,'admin@mail5.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:26:40.897944','Регистрация'),(8,'admin@mail5.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:29:36.963677','Регистрация'),(9,'admin@mail576.ru','Pavel566','Успешная регистрация','2024-12-14 01:29:42.093428','Регистрация'),(10,'admin@mail5766.ru','Pavel566','Ошибка регистрации: Username уже используется','2024-12-14 01:30:09.180958','Регистрация'),(11,'admin@mail5766.ru','Pavel566','Ошибка регистрации: Username уже используется','2024-12-14 01:36:52.951607','Регистрация'),(12,'pexix@yandex.ru','SuperAdmin','Успешная регистрация','2024-12-14 01:37:17.824858','Регистрация'),(13,'pexix@yandex1.ru','SuperAdmin2','Пароль слишком короткий.  Требуется не менее 6 символов.','2024-12-14 01:37:42.469964','Регистрация'),(14,'pexix@yandex1.ru','SuperAdmin2','Слабый пароль, используйте цифры или специальные символы (!@#$%^&*)','2024-12-14 01:37:51.040172','Регистрация'),(15,'pexix@yandex1.ru','SuperAdmin2','Успешная регистрация','2024-12-14 01:39:19.077572','Регистрация'),(16,'pexix@yandex1.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:39:31.393825','Регистрация'),(17,'pexix@yandex1.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:39:53.336866','Регистрация'),(18,'pexix@yandex1.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:40:24.282513','Регистрация'),(19,'pexix@yandex1.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:40:47.703808','Регистрация'),(20,'pexix@yandex1.ru',NULL,'Ошибка регистрации: Email уже используется','2024-12-14 01:41:24.901042','Регистрация'),(21,'pexix@yandex1.ru','SuperAdmin2','Ошибка регистрации: Слабый пароль, используйте цифры или специальные символы (!@#$%^&*)','2024-12-14 01:41:46.217460','Регистрация'),(22,'pexix@yandex1.ru','SuperAdmin2','Ошибка регистрации: Слабый пароль, используйте символы разных регистров.','2024-12-14 01:42:04.869753','Регистрация'),(23,'pexix@yandex1.ru','SuperAdmin2','Успешная регистрация','2024-12-14 01:42:30.130447','Регистрация'),(24,'admin@mail.ru','admin','Успешный вход','2024-12-14 01:50:35.575506','Авторизация'),(25,'admin@mail.ru','admin','Успешный вход','2024-12-14 11:06:15.483139','Авторизация'),(26,'admin@mail.ru',NULL,'Неудачная попытка входа: email=admin@mail.ru, причина=Неверный пароль.','2024-12-14 11:07:47.357235','Авторизация'),(27,'admin@mail.ru','admin','Успешный вход','2024-12-14 11:09:59.948762','Авторизация'),(28,'admin@mail.ru','admin','Успешный вход','2024-12-14 12:17:47.779541','Авторизация'),(29,'admin@mail.ru','admin','Успешный вход','2024-12-19 09:02:56.794785','Авторизация'),(30,'admin@mail.ru','admin','Успешный вход','2024-12-19 10:13:02.148500','Авторизация'),(31,'admin@mail.ru','admin','Лицензия была создана','2024-12-19 10:13:41.311471','Лицензия'),(32,'user@gmail.ru',NULL,'Неудачная попытка входа: email=user@gmail.ru, причина=Пользователь с таким email не найден.','2024-12-19 10:15:08.470397','Авторизация'),(33,'user@gmail.com','user','Успешный вход','2024-12-19 10:15:21.335976','Авторизация'),(34,'user@gmail.com','user','Попытка создать лицензию без прав ADMIN','2024-12-19 10:15:49.342608','Лицензия'),(35,'user@gmail.com','user','Успешный вход','2024-12-19 11:31:02.035606','Авторизация'),(36,'admin@mail.ru','admin','Успешный вход','2024-12-19 11:31:20.491028','Авторизация'),(37,'admin@mail.ru','admin','Лицензия была создана: admin','2024-12-19 11:31:50.884569','Лицензия'),(38,'admin@mail.ru','admin','Ошибка создания лицензии: The given id must not be null','2024-12-19 11:33:34.906178','Лицензия'),(39,'admin@mail.ru','admin','Ошибка обновления лицензии: попытка подделки токена','2024-12-19 11:33:47.639425','Лицензия'),(40,'admin@mail.ru','admin','Лицензия успешно продлена','2024-12-19 11:37:51.432555','Лицензия'),(41,'admin@mail.ru','admin','Ошибка обновления лицензии: попытка подделки токена','2024-12-19 11:38:46.932577','Лицензия'),(42,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-19 11:39:22.931931','Лицензия'),(43,'admin@mail.ru','admin','Ошибка проверки лицензии: лицензия не найдена с ID: 3','2024-12-19 11:40:05.552655','Лицензия'),(44,'admin@mail.ru','admin','Ошибка активации лицензии: повторное добавление устройства','2024-12-19 11:41:52.179548','Лицензия'),(45,'admin@mail.ru','admin','Добавление новых устройств в лицензию','2024-12-19 11:43:50.027679','Лицензия'),(46,'admin@mail.ru','admin','Успешная активация лицензии с ID: 13','2024-12-19 11:43:50.052667','Лицензия'),(47,'admin@mail.ru','admin','Успешный вход','2024-12-19 15:18:58.997901','Авторизация'),(48,'admin@mail.ru','admin','Лицензия была создана: admin','2024-12-19 15:20:15.324416','Лицензия'),(49,'admin@mail.ru','admin','Лицензия была создана: admin','2024-12-19 15:20:22.247546','Лицензия'),(50,'admin@mail.ru','admin','Лицензия была создана: admin','2024-12-19 15:20:26.546142','Лицензия'),(51,'admin@mail.ru','admin','Ошибка обновления лицензии: Недействительный ключ лицензии','2024-12-19 15:21:26.393603','Лицензия'),(52,'admin@mail.ru','admin','Ошибка обновления лицензии: Cannot invoke \"String.length()\" because \"text\" is null','2024-12-19 15:22:48.945660','Лицензия'),(53,'admin@mail.ru','admin','Ошибка обновления лицензии: Unparseable date: \"2024-03-03:23:00:00\"','2024-12-19 15:23:23.154315','Лицензия'),(54,'admin@mail.ru','admin','Ошибка обновления лицензии: Unparseable date: \"2024-03-03:23-00-00\"','2024-12-19 15:23:47.724130','Лицензия'),(55,'admin@mail.ru','admin','Лицензия успешно продлена','2024-12-19 15:26:16.589303','Лицензия'),(56,'admin@mail.ru','admin','Ошибка проверки лицензии: устройство не найдено','2024-12-19 15:28:21.754893','Лицензия'),(57,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-19 15:28:30.146606','Лицензия'),(58,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-19 15:29:55.090917','Лицензия'),(59,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-19 15:30:56.636490','Лицензия'),(60,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-19 15:31:01.811118','Лицензия'),(61,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-19 15:31:41.627986','Лицензия'),(62,'admin@mail.ru','admin','Ошибка активации лицензии: повторное добавление устройства','2024-12-19 15:34:02.029975','Лицензия'),(63,'admin@mail.ru','admin','Добавление новых устройств в лицензию','2024-12-19 15:34:28.777725','Лицензия'),(64,'admin@mail.ru','admin','Успешная активация лицензии с ID: 16','2024-12-19 15:34:28.803707','Лицензия'),(65,'admin@mail.ru','admin','Ошибка активации лицензии: повторное добавление устройства','2024-12-19 15:34:30.310983','Лицензия'),(66,'admin@mail.ru','admin','Добавление новых устройств в лицензию','2024-12-19 15:36:06.156827','Лицензия'),(67,'admin@mail.ru','admin','Успешная активация лицензии с ID: 16','2024-12-19 15:36:06.179799','Лицензия'),(68,'admin@mail.ru','admin','Добавление новых устройств в лицензию','2024-12-19 15:36:13.760309','Лицензия'),(69,'admin@mail.ru','admin','Успешная активация лицензии с ID: 16','2024-12-19 15:36:13.784376','Лицензия'),(70,'',NULL,'Неудачная попытка входа: email= , причина=Ошибка аутентификации: Поле email не должно быть пустым.','2024-12-26 15:39:23.180084','Авторизация'),(71,'admin@mail.ru','admin','Успешный вход','2024-12-26 15:39:57.871685','Авторизация'),(72,'admin@mail.ru','admin','Ошибка создания лицензии: The given id must not be null','2024-12-26 15:44:46.221992','Лицензия'),(73,'admin@mail.ru','admin','Лицензия была создана: admin','2024-12-26 15:44:59.570375','Лицензия'),(74,'admin@mail.ru','admin','Ошибка проверки лицензии: устройство не найдено','2024-12-26 15:49:05.429211','Лицензия'),(75,'admin@mail.ru','admin','Ошибка проверки лицензии: Устройство не найдено','2024-12-26 15:49:05.447208','Лицензия'),(76,'admin@mail.ru','admin','Успешная проверка лицензии','2024-12-26 15:49:31.284090','Лицензия'),(77,'admin@mail.ru','admin','Лицензия была создана: admin','2024-12-26 15:58:06.971017','Лицензия'),(78,'admin@mail.ru','admin','Добавление новых устройств в лицензию','2024-12-26 15:59:06.376202','Лицензия'),(79,'admin@mail.ru','admin','Успешная активация лицензии с ID: 18','2024-12-26 15:59:06.419292','Лицензия'),(80,'admin@mail.ru','admin','Лицензия успешно продлена | Лицензия активирована на устройстве','2024-12-26 16:01:09.032352','Лицензия'),(81,'admin@mail.ru','admin','Добавление новых устройств в лицензию','2024-12-26 16:14:33.902968','Лицензия'),(82,'admin@mail.ru','admin','Успешная активация лицензии с ID: 18','2024-12-26 16:14:33.957057','Лицензия'),(83,'user@gmail.com','user','Успешный вход','2024-12-26 16:31:01.014011','Авторизация'),(84,'user1@gmail.com','PashokSuper','Ошибка регистрации: Ошибка регистрации: Пароль слишком короткий. Требуется не менее 6 символов','2024-12-26 16:49:23.457539','Регистрация'),(85,'user1@gmail.com','PashokSuper','Ошибка регистрации: Ошибка регистрации: Слабый пароль, используйте цифры или специальные символы (!@#$%^&*)','2024-12-26 16:49:40.224709','Регистрация'),(86,'user1@gmail.com','PashokSuper','Успешная регистрация','2024-12-26 16:49:46.363823','Регистрация'),(87,'user1@gmail.com','PashokSuper','Успешный вход','2024-12-26 17:17:50.525758','Авторизация');
/*!40000 ALTER TABLE `action_auth_reg_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_license`
--

DROP TABLE IF EXISTS `device_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_license` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `license_id` bigint NOT NULL,
  `device_id` bigint NOT NULL,
  `activation_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license` (`license_id`),
  KEY `fk_device` (`device_id`),
  CONSTRAINT `fk_device` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_license` FOREIGN KEY (`license_id`) REFERENCES `licenses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_license`
--

LOCK TABLES `device_license` WRITE;
/*!40000 ALTER TABLE `device_license` DISABLE KEYS */;
INSERT INTO `device_license` VALUES (4,6,4,'2024-11-30 14:21:20.351000'),(5,6,7,'2024-11-30 16:14:56.196000'),(6,11,8,'2024-12-14 11:37:52.146000'),(7,11,9,'2024-12-14 11:40:06.067000'),(8,13,10,'2024-12-19 11:43:50.035000'),(9,16,11,'2024-12-19 15:34:28.784000'),(10,16,12,'2024-12-19 15:36:06.163000'),(11,16,13,'2024-12-19 15:36:13.767000'),(12,18,14,'2024-12-26 15:59:06.393000'),(13,18,15,'2024-12-26 16:14:33.920000');
/*!40000 ALTER TABLE `device_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mac_address` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_ibfk_1` (`user_id`),
  CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'MacBook','00:1A:2B:3C:4D:5E',2),(2,'Asus zenbook','00:1A:2B:3C:4D:5A',2),(3,'Lenovo','00:1A:2H:3S:4D:5E',3),(4,'Lenovo','00:1A:2B:3C:4D:5E',3),(5,'Samsung ','00:1A:2B:3C:4D:5K',3),(6,'Samsung','00:1A:2B:3C:4D:5A',3),(7,'Samsung','00:1A:2A:3C:4D:5A',3),(8,'Vivo','00:A5:6U:6R:DE:TY',1),(9,'Vivo SuperPlex','00:A5:6U:7R:ZH:AB',1),(10,'Leno','00:1A:2H:9S:45:5E',1),(11,'SuperAdminPhone','05:1A:2A:9S:45:T4',1),(12,'\'1==1','05:1A:2A:9S:45:T4',1),(13,'\'1==1#','05:1A:2A:9S:45:T4',1),(14,'Bobber','05:1B:2A:SS:45:T4',1),(15,'Bobberq','05:1B:2A:SS:45:Q4',1);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_publication`
--

DROP TABLE IF EXISTS `event_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_publication` (
  `id` binary(16) NOT NULL,
  `completion_date` datetime(6) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `listener_id` varchar(255) DEFAULT NULL,
  `publication_date` datetime(6) DEFAULT NULL,
  `serialized_event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_publication`
--

LOCK TABLES `event_publication` WRITE;
/*!40000 ALTER TABLE `event_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_ticket`
--

DROP TABLE IF EXISTS `folder_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activation_date` datetime(6) DEFAULT NULL,
  `device_id` bigint DEFAULT NULL,
  `digital_signature` varchar(255) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `is_blocked` bit(1) DEFAULT NULL,
  `server_date` datetime(6) DEFAULT NULL,
  `ticket_lifetime` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_ticket`
--

LOCK TABLES `folder_ticket` WRITE;
/*!40000 ALTER TABLE `folder_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_history`
--

DROP TABLE IF EXISTS `license_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `license_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `change_date` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `license_id` (`license_id`),
  KEY `license_history_ibfk_2` (`user_id`),
  CONSTRAINT `license_history_ibfk_1` FOREIGN KEY (`license_id`) REFERENCES `licenses` (`id`),
  CONSTRAINT `license_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_history`
--

LOCK TABLES `license_history` WRITE;
/*!40000 ALTER TABLE `license_history` DISABLE KEYS */;
INSERT INTO `license_history` VALUES (5,5,2,'Создана','2024-11-28 00:00:00.000000','Лицензия создана'),(7,6,3,'Создана','2024-11-30 00:00:00.000000','Лицензия создана'),(8,6,3,'Активирована','2024-11-30 14:21:20.374000','Лицензия активирована на устройстве'),(9,6,3,'Активирована','2024-11-30 16:14:56.231000','Лицензия активирована на устройстве'),(10,7,1,'Создана','2024-12-04 00:00:00.000000','Лицензия создана'),(11,8,1,'Создана','2024-12-04 00:00:00.000000','Лицензия создана'),(12,9,1,'Создана','2024-12-05 00:00:00.000000','Лицензия создана'),(13,10,1,'Создана','2024-12-05 00:00:00.000000','Лицензия создана'),(14,11,10,'Создана','2024-12-14 00:00:00.000000','Лицензия создана'),(15,11,1,'Активирована','2024-12-14 11:37:52.161000','Лицензия активирована на устройстве'),(16,11,1,'Активирована','2024-12-14 11:40:06.076000','Лицензия активирована на устройстве'),(17,12,1,'Создана','2024-12-19 00:00:00.000000','Лицензия создана'),(18,13,1,'Создана','2024-12-19 00:00:00.000000','Лицензия создана'),(19,13,1,'Активирована','2024-12-19 11:43:50.046000','Лицензия активирована на устройстве'),(20,14,1,'Создана','2024-12-19 00:00:00.000000','Лицензия создана'),(21,15,1,'Создана','2024-12-19 00:00:00.000000','Лицензия создана'),(22,16,1,'Создана','2024-12-19 00:00:00.000000','Лицензия создана'),(23,16,1,'Активирована','2024-12-19 15:34:28.796000','Лицензия активирована на устройстве'),(24,16,1,'Активирована','2024-12-19 15:36:06.173000','Лицензия активирована на устройстве'),(25,16,1,'Активирована','2024-12-19 15:36:13.778000','Лицензия активирована на устройстве'),(26,17,1,'Создана','2024-12-26 00:00:00.000000','Лицензия создана'),(27,18,1,'Создана','2024-12-26 00:00:00.000000','Лицензия создана'),(28,18,1,'Активирована','2024-12-26 15:59:06.411000','Лицензия активирована на устройстве Bobber'),(29,18,1,'Активирована','2024-12-26 16:14:33.946000','Лицензия активирована на устройстве Bobberq');
/*!40000 ALTER TABLE `license_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_types`
--

DROP TABLE IF EXISTS `license_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `default_duration` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_types`
--

LOCK TABLES `license_types` WRITE;
/*!40000 ALTER TABLE `license_types` DISABLE KEYS */;
INSERT INTO `license_types` VALUES (1,'Условно-бесплатная',30,'Подписка на 30 дней');
/*!40000 ALTER TABLE `license_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `owner_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  `first_activation_date` datetime(6) DEFAULT NULL,
  `ending_date` datetime(6) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `device_count` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `product_id` (`product_id`),
  KEY `type_id` (`type_id`),
  KEY `licenses_ibfk_1` (`user_id`),
  CONSTRAINT `licenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `licenses_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `licenses_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `licenses_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `license_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (5,'167CBB6FED064683BD2115C0EA9CB797',2,2,1,1,'2024-11-28 00:00:00.000000','2025-02-11 00:43:17.000000',0,1,74,'Приятного пользования нашими продуктами!'),(6,'E0445845D222452FA1ECA3224DB51EE1',3,3,1,1,'2024-11-30 00:00:00.000000','2024-12-30 00:00:00.000000',0,3,30,'Приятного пользования нашими продуктами!'),(7,'72C8FDA02B224A07A5FC12A6F67C1903',4,1,1,1,'2024-12-04 00:00:00.000000','2034-03-23 23:03:03.000000',0,1,3381,'Приятного пользования нашими продуктами!'),(8,'A43DC6B40FAA4B05865A8013E23B51CB',4,1,1,1,'2024-12-04 00:00:00.000000','2025-01-03 00:00:00.000000',0,1,30,'Была создана лицензияorg.example.kurs.model.ApplicationUser@4e50cf8!'),(9,'1155765C3F73476DAAE42AA15E945615',4,1,1,1,'2024-12-05 00:00:00.000000','2025-01-04 00:00:00.000000',0,1,30,'Была создана лицензияPavel!'),(10,'7E40490332E5420F971A2585AC9921D1',NULL,1,1,1,'2024-12-05 00:00:00.000000','2025-01-04 00:00:00.000000',0,1,30,'Была создана лицензия admin!'),(11,'21315A6ECBA14EEBB9DE8524BD314712',1,10,1,1,'2024-12-14 00:00:00.000000','2025-01-13 00:00:00.000000',0,3,30,'Приятного пользования нашими продуктами!'),(12,'7CDD1396632F4534AF00AB2E73226C31',NULL,1,1,1,'2024-12-19 00:00:00.000000','2025-01-18 00:00:00.000000',0,5,30,'Лицензия успешно создана: admin'),(13,'02371ABD57824C7F977E3F686D9FACD2',1,1,1,1,'2024-12-19 00:00:00.000000','2025-01-18 00:00:00.000000',0,4,30,'Лицензия успешно создана: admin'),(14,'F11FFA7C41A7469FAB1D701C3D787764',NULL,1,1,1,'2024-12-19 00:00:00.000000','2025-01-18 00:00:00.000000',0,5,30,'Лицензия успешно создана: admin'),(15,'CFFFD099FD17485BB6AFE67DDA0B9FA4',NULL,1,1,1,'2024-12-19 00:00:00.000000','2025-01-18 00:00:00.000000',0,3,30,'Лицензия успешно создана: admin'),(16,'136634AF06AE482D9F4972045B19F8D5',1,1,1,1,'2024-12-19 00:00:00.000000','2025-03-03 23:00:00.000000',0,5,74,'Лицензия успешно создана: admin'),(17,'X3KVKTSWZ9UAVG5WEVFL4X3BUT89D2GK',NULL,1,1,1,'2024-12-26 00:00:00.000000','2025-01-25 00:00:00.000000',0,8,30,'Лицензия успешно создана: admin'),(18,'LWWZBKXU9BRYQV7A6SEBKGTHGDM6KHVC',1,1,1,1,'2024-12-26 00:00:00.000000','2028-03-03 23:00:00.000000',0,6,1163,'Лицензия успешно создана: admin');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_blocked` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,_binary '\0','Scanner');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activation_date` datetime(6) DEFAULT NULL,
  `device_id` bigint DEFAULT NULL,
  `digital_signature` varchar(255) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `is_blocked` bit(1) NOT NULL,
  `server_date` datetime(6) DEFAULT NULL,
  `ticket_lifetime` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activation_date` datetime(6) DEFAULT NULL,
  `device_id` bigint DEFAULT NULL,
  `digital_signature` varchar(255) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `is_blocked` bit(1) DEFAULT NULL,
  `server_date` datetime(6) DEFAULT NULL,
  `ticket_lifetime` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@mail.ru','$2a$12$vKtvXiZlTIJLlRK/KqWan.SXN3u3eMJGaBATHEVGoautYhtCLsora','ADMIN'),(2,'user','user@gmail.com','$2a$12$v5YCIHEhYpMAI3qzzNV1J.PsUlB/heJlIu.Z1EqMSzLeIbT50n./S','USER'),(3,'Danilin','user5@gmail.com','$2a$12$Zm6jGiMqqPAVb2qydPfWeOEqSt4KOt1u2MKYF0UKniqJl1esnbZt.','USER'),(4,'Pavel','pavel@gmail.com','$2a$12$vKtvXiZlTIJLlRK/KqWan.SXN3u3eMJGaBATHEVGoautYhtCLsora','USER'),(8,'Pavel56','admin@mail5.ru','$2a$12$KD1MWus3l/dx2ZxZ8QGk2eJgkB07iukABblPpCBowpQ.DrIoXjhCe','USER'),(9,'Pavel566','admin@mail576.ru','$2a$12$EPA0gMpJDZ1MikihluX3ROvpV9dHOWcBbd1S8mcVEX3BbHmqEQ1uO','USER'),(10,'SuperAdmin','pexix@yandex.ru','$2a$12$zUHx1STv32Cw4lM17KGQhuBF9GFOgSfFs0GrU6cJV3pGxntHysZNe','USER'),(12,'SuperAdmin2','pexix@yandex1.ru','$2a$12$O1K0ovKhsndtSB/dpDL55OChqTnFUCSQwd.Xs9PycW2UJVuXQD3DK','USER'),(13,'PashokSuper','user1@gmail.com','$2a$12$oTSktiUpVyvSdFBuUnMXDeKMckCH.3IYUTbVm.TavIZXuqzK9xQSq','USER');
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

-- Dump completed on 2024-12-26 19:05:20
