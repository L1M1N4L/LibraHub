-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: dcrm
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add member',7,'add_member'),(26,'Can change member',7,'change_member'),(27,'Can delete member',7,'delete_member'),(28,'Can view member',7,'view_member'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add book',9,'add_book'),(34,'Can change book',9,'change_book'),(35,'Can delete book',9,'delete_book'),(36,'Can view book',9,'view_book'),(37,'Can add book copy',10,'add_bookcopy'),(38,'Can change book copy',10,'change_bookcopy'),(39,'Can delete book copy',10,'delete_bookcopy'),(40,'Can view book copy',10,'view_bookcopy'),(41,'Can add fine reason',11,'add_finereason'),(42,'Can change fine reason',11,'change_finereason'),(43,'Can delete fine reason',11,'delete_finereason'),(44,'Can view fine reason',11,'view_finereason'),(45,'Can add genre',12,'add_genre'),(46,'Can change genre',12,'change_genre'),(47,'Can delete genre',12,'delete_genre'),(48,'Can view genre',12,'view_genre'),(49,'Can add publisher',13,'add_publisher'),(50,'Can change publisher',13,'change_publisher'),(51,'Can delete publisher',13,'delete_publisher'),(52,'Can view publisher',13,'view_publisher'),(53,'Can add reservation',14,'add_reservation'),(54,'Can change reservation',14,'change_reservation'),(55,'Can delete reservation',14,'delete_reservation'),(56,'Can view reservation',14,'view_reservation'),(57,'Can add loan',15,'add_loan'),(58,'Can change loan',15,'change_loan'),(59,'Can delete loan',15,'delete_loan'),(60,'Can view loan',15,'view_loan'),(61,'Can add fine',16,'add_fine'),(62,'Can change fine',16,'change_fine'),(63,'Can delete fine',16,'delete_fine'),(64,'Can view fine',16,'view_fine');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$PWvbwqUIKHjJuOQ1NHn0cx$UakOCvqAkfnq4OdNCi6ycjT9oR7fFmvRn4jtgd3FqRo=','2024-11-26 23:34:47.630187',1,'admin','','','',1,1,'2024-11-26 07:00:00.000000'),(6,'pbkdf2_sha256$600000$BAaLjCisSncn9MEhNRjwBM$uNbtm/Xrf+JQCohUQAv2NCSgd06nB72W1Y4g1mS0Rg8=','2024-11-26 00:15:49.425797',0,'Liminal','Jonathan','Leewin','jonathan.leewin@gmail.com',0,1,'2024-11-26 00:15:20.287163');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-25 23:45:29.359497','4','LIMINALL',3,'',4,1),(2,'2024-11-25 23:45:52.020084','3','Leewini',3,'',4,1),(3,'2024-11-25 23:45:56.977891','2','JonathanL',3,'',4,1),(4,'2024-11-25 23:59:52.091751','5','Limitod',3,'',4,1),(5,'2024-11-26 00:00:21.884913','1','admin',2,'[{\"changed\": {\"fields\": [\"Last login\", \"Date joined\"]}}]',4,1),(6,'2024-11-26 00:00:37.938915','1','admin',2,'[{\"changed\": {\"fields\": [\"Date joined\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'website','author'),(9,'website','book'),(10,'website','bookcopy'),(16,'website','fine'),(11,'website','finereason'),(12,'website','genre'),(15,'website','loan'),(7,'website','member'),(13,'website','publisher'),(14,'website','reservation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-25 09:40:19.399916'),(2,'auth','0001_initial','2024-11-25 09:40:19.941819'),(3,'admin','0001_initial','2024-11-25 09:40:20.101465'),(4,'admin','0002_logentry_remove_auto_add','2024-11-25 09:40:20.111440'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-25 09:40:20.122410'),(6,'contenttypes','0002_remove_content_type_name','2024-11-25 09:40:20.221145'),(7,'auth','0002_alter_permission_name_max_length','2024-11-25 09:40:20.279989'),(8,'auth','0003_alter_user_email_max_length','2024-11-25 09:40:20.299935'),(9,'auth','0004_alter_user_username_opts','2024-11-25 09:40:20.317887'),(10,'auth','0005_alter_user_last_login_null','2024-11-25 09:40:20.368756'),(11,'auth','0006_require_contenttypes_0002','2024-11-25 09:40:20.371747'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-25 09:40:20.378728'),(13,'auth','0008_alter_user_username_max_length','2024-11-25 09:40:20.440568'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-25 09:40:20.502417'),(15,'auth','0010_alter_group_name_max_length','2024-11-25 09:40:20.518376'),(16,'auth','0011_update_proxy_permissions','2024-11-25 09:40:20.525356'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-25 09:40:20.585196'),(18,'sessions','0001_initial','2024-11-25 09:40:20.618669'),(20,'website','0002_remove_member_id_member_email_member_username','2024-11-25 23:49:31.155396'),(21,'website','0001_initial','2024-11-26 22:32:08.730683');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kdk1r1h8wihwe52edatb44627bznm1u8','.eJxVjMsOwiAQRf-FtSFAebp07zeQYRikaiAp7cr479qkC93ec859sQjbWuM2aIlzZmcm2el3S4APajvId2i3zrG3dZkT3xV-0MGvPdPzcrh_BxVG_dbWFzFB8FpoQESvDXgF2pfgsqJibTDK6jIRJgQhg5U-kHHBuEkKQsveH9ezN18:1tG54x:y_VMednroFHN8PFgfbZN4lwKAQMXYjudMEv3Kx4uEAQ','2024-12-10 23:34:47.633178');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_author`
--

DROP TABLE IF EXISTS `website_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `biography` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_author`
--

LOCK TABLES `website_author` WRITE;
/*!40000 ALTER TABLE `website_author` DISABLE KEYS */;
INSERT INTO `website_author` VALUES (1,'Lindley Murray',NULL,'fiction',''),(2,'Agatha Christie',NULL,'fiction','Agatha Mary Clarissa Miller was born in Torquay, Devon, in the United Kingdom, the daughter of a wealthy American stockbroker. Her father died when she was eleven years old. Her mother taught her at home, encouraging her to write at a very young age. At the age of 16, she went to Mrs. Dryden\'s finishing school in Paris to study singing and piano. In 1914, at age 24, she married Colonel Archibald Christie, an aviator in the Royal Flying Corps. While he went away to war, she worked as a nurse and wrote her first novel, The Mysterious Affair at Styles (1920), which wasn\'t published until four years later. When her husband came back from the war, they had a daughter. In 1928 she divorced her husband, who had been having an affair. In 1930, she married Sir Max Mallowan, an archaeologist and a Catholic. She was happy in the early years of her second marriage, and did not divorce her husband despite his many affairs. She travelled with her husband\'s job, and set several of her novels set in the Middle East. Most of her other novels were set in a fictionalized Devon, where she was born.\r\n\r\nAgatha Christie is credited with developing the \"cozy style\" of mystery, which became popular in, and ultimately defined, the Golden Age of fiction in England in the 1920s and \'30s, an age of which she is considered to have been Queen. In all, she wrote over 66 novels, numerous short stories and screenplays, and a series of romantic novels using the pen name Mary Westmacott. She was the single most popular mystery writer of all time. In 1971 she was made a Dame Commander of the Order of the British Empire.'),(3,'J. D. Salinger',NULL,'fiction','*28 January, 2010:* The New Yorker has made a series of Salinger\'s short stories available online: http://www.newyorker.com/online/blogs/backissues/2010/01/postscript-j-d-salinger.html'),(4,'Euclid',NULL,'fiction','A Greek mathematician, often referred to as the \"Father of Geometry.\"'),(5,'Markus Zusak',NULL,'fiction','Markus Zusak was born in 1975 and is the author of five books, including the international bestseller, The Book Thief, which is translated into more than forty languages. First released in 2005, The Book Thief has spent more than a decade on the New York Times bestseller list, and still remains there to this day.\r\n\r\nsource: http://www.zusakbooks.com\r\nphoto: https://www.facebook.com/MarkusZusak/'),(6,'Margaret Mitchell',NULL,'fiction',''),(7,'Ernesto Sabato',NULL,'fiction','Ernesto Roque Sabato\r\n\r\nDoctor en Ciencias Físico-Matemáticas. Escritor. Nació en Rojas (Prov. de Buenos Aires, Argentina), el 24/VI/1911. Pd.: Francisco Sábato y Juana Ferrari. Esp.: Matilde Kusminsky-Richter. Hijos: Mario y Jorge Federico \r\nEstudios: Univ. Nac. de La Plata (UNLP). Doctorado en 1938. Fue becado para trabajar en el Laboratorio Curie, de Francia (1938). \r\n\r\nEn 1945 abandonó definitivamente sus actividades científicas para dedicarse al ensayo y a la literatura. Ha sido Dir. de Relaciones Culturales, en el Min. de R.E. y C. (1958-1959). \r\n\r\nObtuvo Primer Premio de prosa de la Munic. de la Ciudad de Bs. As. por su libro “Uno y el Universo” (1945). Su novela “El túnel” ha sido traducida a las lenguas más importantes, incluso al japonés. Ha dictado Conferencias en las Univ. de París, Columbia, Berkeley, Madrid, Milán, Roma, Pavia, California, Bonn, Heidelberg, Mc Guill, Varsovia, etc. \r\n\r\nEs Mbro. del Club de Roma, del Comité pour l’Universalité de I’UNESCO y del Jerusalem Committée. Ha sido premiado con la Faja de Honor y con Gran Premio, ambos de la Soc. Arg. de Escritores (SADE). Premio al Mejor Libro Extranjero, París, 1977, por su obra “Abaddón el Exterminador”.  \r\nDistinciones: Caballero de las Letras y las Artes, de la República Francesa; Condecoración del Instituto de Relaciones Exteriores, Stutthart, Alemania; Caballero de la Legión de Honor, de la Rep. Francesa; Gran Cruz al Mérito Civil, de España. \r\n\r\nObras principales: “Uno y el Universo” (1945). “El túnel” (1948), “Hombres y Engranajes” (1951), “Heterodoxia” (1953), “Sobre Héroes y Tumbas” (1961), “El Escritor y sus Fantasmas” (1963), “Abaddón el Exterminador” (1974),  “Apologías y Rechazos” (1979). \r\n\r\nDom. Part.: Langeri 3135, Tel.: (54 11) 4757-1373 Santos Lugares (Prov. de Buenos Aires, Argentina).'),(8,'Maurice Leblanc',NULL,'fiction','Maurice Marie Émile Leblanc (11 December 1864 – 6 November 1941) was a French novelist and writer of short stories, known primarily as the creator of the fictional gentleman thief and detective Arsène Lupin, often described as a French counterpart to Arthur Conan Doyle\'s creation Sherlock Holmes.\r\n\r\nThe first Arsène Lupin story appeared in a series of short stories that was serialized in the magazine Je sais tout, starting in No. 6, dated 15 July 1905. Clearly created at editorial request, it’s possible that Leblanc had also read Octave Mirbeau\'s *Les 21 jours d\'un neurasthénique* (1901), which features a gentleman thief named Arthur Lebeau, and he had seen Mirbeau\'s comedy Scrupules (1902), whose main character is a gentleman thief.\r\nLeblanc\'s house in Étretat, today the museum Le clos Arsène Lupin.\r\n\r\nBy 1907, Leblanc had graduated to writing full-length Lupin novels, and the reviews and sales were so good that Leblanc effectively dedicated the rest of his career to working on the Lupin stories. Like Conan Doyle, who often appeared embarrassed or hindered by the success of Sherlock Holmes and seemed to regard his success in the field of crime fiction as a detraction from his more \"respectable\" literary ambitions, Leblanc also appeared to have resented Lupin\'s success. Several times he tried to create other characters, such as private eye Jim Barnett, but he eventually merged them with Lupin. He continued to pen Lupin tales well into the 1930s.\r\n\r\nLeblanc also wrote two notable science fiction novels: *Les Trois Yeux* (1919), in which a scientist makes televisual contact with three-eyed Venusians, and *Le Formidable Evènement* (1920), in which an earthquake creates a new landmass between England and France.\r\n\r\nLeblanc was awarded the Légion d\'Honneur for his services to literature, and died in Perpignan in 1941. He was buried in the Montparnasse Cemetery. Georgette Leblanc was his sister.'),(9,'Sam McBratney',NULL,'fiction',''),(10,'Anita Jeram',NULL,'fiction',''),(11,'Raymond Chandler',NULL,'fiction',''),(12,'John Steinbeck',NULL,'fiction','John Steinbeck was an American writer. He wrote the Pulitzer Prize-winning novel *The Grapes of Wrath* (1939) and the novella *Of Mice and Men* (1937). He wrote a total of 27 books, including 16 novels, six non-fiction books, and five collections of short stories. In 1962, Steinbeck received the Nobel Prize for Literature ([Source][1]).\r\n\r\n[1]:https://en.wikipedia.org/wiki/John_Steinbeck'),(13,'Max Ernst',NULL,'fiction','German painter, sculptor and graphic artist'),(14,'Werner Spies',NULL,'fiction',''),(15,'Fabrice Hergott',NULL,'fiction',''),(16,'Doris Krystof',NULL,'fiction',''),(17,'Günter Metken',NULL,'fiction',''),(18,'Patrick Süskind',NULL,'fiction','Patrick Süskind is a German writer and screenwriter, best known for his internationally acclaimed novel Perfume: The Story of a Murderer, first published in 1985.\r\n\r\nSüskind was born in Ambach am Starnberger See, near Munich in Germany. His father was writer and journalist Wilhelm Emanuel Süskind, who worked for the Süddeutsche Zeitung and is famous as the co-author of the well-known Aus dem Wörterbuch des Unmenschen (From the Dictionary of an Inhuman), a critical collection of essays on the language of the Nazi era. Patrick Süskind went to school in Holzhausen, a little Bavarian village. His mother worked as a sports trainer; his older brother Martin E. Süskind is also a journalist. \r\n\r\nSüskind studied Medieval and Modern History at the University of Munich and in Aix-en-Provence from 1968-1974, but never graduated. Financially supported by his parents, he moved to Paris where he wrote \"mainly short, unpublished fiction and longer screenplays which were not made into films.\" In 1981, he had his breakthrough with the play Der Kontrabaß (The Double Bass), which was originally conceived as a radio play. In the 1984-85 theatrical season, the play was performed more than 500 times. Süskind was also successful as a screenwriter for the TV productions Monaco Franze (1983) and Kir Royal (1987), among others. For his screenplay of Rossini, directed by Helmut Dietl, he won the Screenplay Prize of the German Department for Culture in 1996. He rejected other awards, like the FAZ-Literaturpreis, the Tukan-Preis (de), and the Gutenbergpreis.\r\n\r\nHis best-known work is the internationally acclaimed bestseller Perfume: The Story of a Murderer (1985). This was made into a film in 2006 by Tom Tykwer. Perfume was on the bestselling list of the German weekly news magazine Der Spiegel for nine years. Süskind lives as a recluse in Munich, in Seeheim (Lake Starnberg), and in France. The public knows little about Süskind. He has withdrawn from the literary scene in Germany and never grants interviews or allows photos.\r\n\r\nSource: Wikipedia'),(19,'John Milton',NULL,'fiction','John Milton was an English poet, author, polemicist and civil servant for the Commonwealth of England. He is best known for his epic poem Paradise Lost. \r\n([Source][1].)\r\n\r\n\r\n[1]: http://en.wikipedia.org/wiki/John_Milton'),(20,'Henry James',NULL,'fiction','Henry James, was an American writer, regarded as one of the key figures of 19th-century literary realism. He was the son of Henry James, Sr., a clergyman, and the brother of philosopher and psychologist William James and diarist Alice James.  ([Source][1].)\r\n\r\n[1]:http://en.wikipedia.org/wiki/Henry_James'),(21,'Sir Isaac Newton',NULL,'fiction','Sir Isaac Newton was an English physicist, mathematician, astronomer, natural philosopher, alchemist, and theologian who is considered by many scholars and members of the general public to be one of the most influential scientists in history. ([Source][1].)\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Isaac_Newton'),(22,'Boris Leonidovich Pasternak',NULL,'fiction','Boris Leonidovich Pasternak (Russian: Бори́с Леони́дович Пастерна́к) was a Russian poet, novelist, composer, and literary translator.'),(23,'Roald Dahl',NULL,'fiction','Roald Dahl was a British novelist, short story writer, and screenwriter.\r\n\r\nBorn in north Cardiff, Wales, to Norwegian parents, Dahl served in the Royal Air Force during the Second World War, in which he became a flying ace and intelligence agent. He rose to prominence in the 1940s with works for both children and adults, and became one of the world\'s bestselling authors. His short stories are known for their unexpected endings, and his children\'s books for their unsentimental, often very dark humour. ([Source][1].)\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Roald_Dahl'),(24,'Astrid Lindgren',NULL,'fiction','Astrid Lindgrens barndom på gården Näs i Vimmerby, Småland, strax efter sekelskiftet var en lycklig tid, med föräldrarnas kärlek som en ständig trygghet. Astrid och de tre syskonen lekte ivrigt på den fantastiska lekplats Näs var. Men dagarna bestod inte enbart av lek, all arbetskraft behövdes på ett lantbruk och barnen Ericsson delade slitet med pigor och drängar. Det var i köket hos lagårdskarlens dotter Edit Astrid fick höra den saga som först väckte hennes läshunger – en lust till böcker som varade livet igenom.\r\n\r\nI skolan är Astrid duktig på att skriva och blir kallad för Vimmerbys Selma Lagerlöf efter att ha fått en uppsats publicerad i Vimmerby Tidning – där hon senare också får arbete som volontär. Efter två år på tidningen slutar hon. Astrid är arton år och gravid, hon vill inte leva sitt liv med barnafadern och hon vill inte stanna i Vimmerby.\r\n\r\nEtt nytt liv börjar\r\nAstrid lämnar Vimmerby och skapar sig ett liv i Stockholm där hon utbildar sig till stenograf och maskinskriverska. Färdigheter hon skulle komma att få stor nytta av senare i livet.\r\n\r\nGenom arbetet som sekreterare på Kungliga Automobilklubben träffar Astrid 1928 sin blivande man, kontorschefen Sture Lindgren. Sture är en sällskapsmänniska, humoristisk och vänlig, och umgås gärna i glada vänners lag. Det händer att Astrid deltar i utelivet, men stannar lika gärna hemma med en god bok. Kärleken till böcker är något makarna delar, liksom humorn.\r\n\r\nEfter kriget blir det möjligt att resa ut i Europa igen, och Astrid följer gärna med Sture på hans arbetsresor. Ibland i bil med kollegorna och vännerna Hedner (varken Sture eller Astrid hade körkort!).\r\n\r\nDen lilla lägenheten på Vulcanusgatan blir snart för trång för familjen som nu består av Astrid och Sture och de två barnen Lasse och Karin. 1941 går flytten till den våning på Dalagatan där Astrid kommer att bo livet ut. Från fönstret i vardagsrummet kan man se ut över Vasaparken på andra sidan gatan och dit går Astrid och barnen ofta för att klättra i träd, gunga och åka kana. Astrid “var inte som andra mammor” utan är gärna med själv i lekarna. På somrarna är familjen i Furusund i Stockholms skärgård, den plats på jorden Astrid älskade mest. Det är här hon inspireras till berättelserna om Saltkråkan.\r\n\r\nDubbla roller – förlagsredaktören och författaren\r\nNär den första boken om Pippi Långstrump kommer ut på förlaget Rabén & Sjögren 1945 förändras Astrids liv. Boken blir en stor framgång, älskad av barn och vuxna världen över.\r\n\r\nNågot år senare börjar hon arbeta som barnboksredaktör på Rabén & Sjögren och blir snart ansvarig för barnboksutgivningen. Sina egna böcker stenograferar hon, fram till halv tolv på förmiddagen, i sängen hemma på Dalagatan. På eftermiddagen blir hon barnboksredaktör Lindgren och ägnar sig åt att träffa författare och illustratörer på förlaget, redigera manus och ta ställning till utgivningen. Hon stannar på Rabén & Sjögren fram till pensionen 1970.\r\n\r\nLivet under 50- och 60-talen är intensivt. Astrid Lindgren blandar ett produktivt författarskap med sin roll som barnboksförläggare. Hon hinner dessutom med mängder av officiella framträdanden, boklanseringar, filmpremiärer och ett rikt privatliv med familj och vänner.\r\nVid påsktiden 1950 blir Sture sjuk. Han avlider 1952, bara femtiotre år gammal.\r\n\r\nEn röst i samhällsdebatten\r\nFrån att ha levt som en vanlig hemmafru är Astrid Lindgren nu världsberömd författare. En berömmelse vars baksida är att ofta behöva stå i rampljuset. Det, för Astrid helt nödvändiga, privata livet får allt mindre utrymme, och många gånger önskar hon att hon kunde slippa all uppmärksamhet. Trots det sätter hon 1976 igång en debatt om skattepolitiken som medverkar till att fälla den socialdemokratiska regeringen, efter fyrtio år i maktposition.\r\n\r\nDet är första gången Astrid med kraft ger sig in i samhällsdebatten – men inte den sista. Två år senare får hon de tyska bokhandlarnas fredspris och hennes tacktal vid prisutdelningen blir startskottet för en internationell debatt om aga i barnuppfostran. Hon tar aktivt ställning för Nej-sidan i den svenska folkomröstningen om kärnkraft 1980 och engagerar sig en kampanj mot oetisk djurhållning, vilket senare leder till ny djurskyddslag.\r\n\r\nVid nittioett års ålder drabbas Astrid Lindgren av en stroke och får allt svårare att röra sig och delta i offentliga sammanhang. I januari 2002 avlider Astrid Lindgren i sitt hem på Dalagatan. Begravningen hålls den åttonde mars, på internationella kvinnodagen. Stockholms gator är fulla av människor som följer kistans färd genom staden på väg mot Storkyrkan i Gamla stan.\r\n\r\n([source][1])\r\n\r\n----------\r\n\r\n\r\nSwedish writer of fiction for children and young adults, most famous for Pippi Longstocking, Karlsson-on-the-roof and Emil\r\n\r\n\r\n  [1]: http://www.astridlindgren.com/manniskan/kort-biografi'),(25,'Erich Maria Remarque',NULL,'fiction','Erich Maria Remarque (born Erich Paul Remark; 22 June 1898 – 25 September 1970) was a German novelist. His landmark novel *Im Westen nichts Neues* (*All Quiet on the Western Front*) (1928), about the German military experience of World War I, was an international best-seller which created a new literary genre, and was adapted into a film in 1930.\r\n\r\n**Source**: [Erich Maria Remarque](https://en.wikipedia.org/wiki/Erich_Maria_Remarque) on Wikipedia.'),(26,'Charles Perrault',NULL,'fiction','The French author who laid the foundations for the fairy tale genre of literature. His collected \"Contes des fées\" (widely known as the Mother Goose stories) have been endlessly retold, most profitably by Disney. Every child knows \"Cinderella\", \"Beauty and the Beast\", \"Sleeping Beauty\", \"Snow White\", \"Puss in Boots\", \"Tom Thumb\", and \"Red Riding Hood\".\r\n\r\nCharles Perrault naquit a Paris le 12 janvier 1628, septieme enfant de Pierre Perrault, avocat au parlement de Paris. Apres d\'excellentes etudes au college de Beauvais, rue Jean-De-Beauvais a Paris, il fut recu avocat en 1651. Il abandonna bientot apres le barreau et devint commis de son frere aine, Pierre, receveur general des finances de Paris. Les loisirs que lui laissait sa place lui permirent de se livrer a la poesie : diverses pieces de circonstances, a la verite assez mediocrement versifiees, commencerent a le faire connaitre des hommes de lettres et des artistes de son temps. En 1663, il entra au service de Colbert et devint rapidement son homme de confiance : nomme secretaire de la \" petite academie \" , qui sera plus tard l\'academie des inscriptions et belles lettres, il prit ensuite une part active a l\'administration des batiments du roi, avec le titre de \"premier commis des batiments\" . En 1671, il fut elu a l\'academie francaise. La meme annee, il epousa une jeune fille de dix-neuf ans, Marie Guichon, qui lui donna quatre enfants et le laissa veuf en 1678.'),(27,'Willa Cather',NULL,'fiction','Willa Siebert Cather was an American author who grew up in Nebraska. She is best known for her depictions of frontier life on the Great Plains in novels such as O Pioneers!, My Ántonia, and The Song of the Lark.\r\n\r\nSource and more information: http://en.wikipedia.org/wiki/Willa_Cather'),(28,'Francis Bacon',NULL,'fiction','An English philosopher, statesman, scientist, lawyer, jurist and author known as the father of Empiricism.'),(29,'Brothers Grimm',NULL,'fiction','The Brothers Grimm (die Brüder Grimm or die Gebrüder Grimm), Jacob (1785–1863) and Wilhelm Grimm (1786–1859), were German academics, philologists, cultural researchers, lexicographers and authors who together specialized in collecting and publishing folklore during the 19th century. They were among the best-known storytellers of folk tales, and popularized stories such as \"Cinderella\" (\"Aschenputtel\"), \"The Frog Prince\" (\"Der Froschkönig\"), \"The Goose-Girl\" (\"Die Gänsemagd\"), \"Hansel and Gretel\" (\"Hänsel und Gretel\"), \"Rapunzel\", \"Rumpelstiltskin\" (\"Rumpelstilzchen\"),\"Sleeping Beauty\" (\"Dornröschen\"), and \"Snow White\" (\"Schneewittchen\"). Their first collection of folk tales, Children\'s and Household Tales (Kinder- und Hausmärchen), was published in 1812.'),(30,'Viktor E. Frankl',NULL,'fiction','Viktor Emil Frankl was an Austrian neurologist and psychiatrist as well as a Holocaust survivor. He was the founder of logotherapy, which is a form of existential analysis, the \"Third Viennese School of Psychotherapy\".'),(31,'George MacDonald',NULL,'fiction',''),(32,'Pablo Picasso',NULL,'fiction','Picasso was a Spanish painter, draughtsman, and sculptor. He is one of the most recognized figures in 20th-century art. Among his most famous works are the proto-Cubist Les Demoiselles d\'Avignon (1907) and Guernica (1937), his portrayal of the German bombing of Guernica during the Spanish Civil War.'),(33,'Jean-Louis Andral',NULL,'fiction',''),(34,'Pierre Daix',NULL,'fiction',''),(35,'Suzanne Collins',NULL,'fiction','American author of young adult literature, whose works include *The Hunger Games* trilogy and *The Underland Chronicles* series. The daughter of an Air Force officer, she lives in her native home of Connecticut.'),(36,'Günter Grass',NULL,'fiction','German novelist, poet, playwright, illustrator, graphic artist, and sculptor'),(37,'Ray Bradbury',NULL,'fiction','Ray Bradbury is one of those rare individuals whose writing has changed the way people think. His more than five hundred published works -- short stories, novels, plays, screenplays, television scripts, and verse -- exemplify the American imagination at its most creative. \r\n\r\nOnce read, his words are never forgotten. His best-known and most beloved books, *The Martian Chronicles*, *The Illustrated Man*, *Fahrenheit 451* and *Something Wicked This Way Comes*, are masterworks that readers carry with them over a lifetime. His timeless, constant appeal to audiences young and old has proven him to be one of the truly classic authors of the 20th Century -- and the 21st. \r\n\r\nIn recognition of his stature in the world of literature and the impact he has had on so many for so many years, Bradbury was awarded the National Book Foundation\'s 2000 Medal for Distinguished Contribution to American Letters, an the National Medal of Arts in 2004. \r\n\r\n([Source][1])\r\n\r\n\r\n  [1]: http://www.raybradbury.com/about.html'),(38,'Great Britain.',NULL,'fiction',''),(39,'Michael Ende',NULL,'fiction','Michael Andreas Helmuth Ende (12. November 1929 in Garmisch; 28. August 1995 in Filderstadt) war ein deutscher Schriftsteller. Er zählt zu den erfolgreichsten deutschen Jugendbuchautoren. Bücher wie *Die unendliche Geschichte, Momo* und *Jim Knopf und Lukas der Lokomotivführer* waren internationale Erfolge und wurden vielfach für Film, Fernsehen und Theater adaptiert. Endes Werke verkauften sich über 30 Millionen Mal und wurden in über 40 Sprachen übersetzt.\r\n\r\n---------\r\n\r\nMichael Andreas Helmuth Ende (12 November 1929 – 28 August 1995) was a German writer of fantasy and children\'s fiction. He is best known for his epic fantasy The Neverending Story; other famous works include *Momo* and *Jim Button and Luke the Engine Driver.* His works have been translated into more than 40 languages, sold more than 35 million copies, and adapted as motion pictures, stage plays, operas and audio books. Ende is one of the most popular and famous German authors of the 20th century, mostly due to the enormous success of his children\'s fiction. He was not strictly a children\'s writer, as he wrote books for adults as well. Ende\'s writing could be described as a surreal mixture of reality and fantasy.'),(40,'Arthur C. Clarke',NULL,'fiction','Sir Arthur Charles Clarke CBE FRAS was a British science fiction writer, science writer and futurist, inventor, undersea explorer, and television series host.\r\n\r\nHe is famous for being co-writer of the screenplay for the 1968 film 2001: A Space Odyssey, widely considered to be one of the most influential films of all time. Clarke was a science writer, who was both an avid populariser of space travel and a futurist of uncanny ability. On these subjects he wrote over a dozen books and many essays, which appeared in various popular magazines. In 1961 he was awarded the Kalinga Prize, an award which is given by UNESCO for popularising science. These along with his science fiction writings eventually earned him the moniker \"Prophet of the Space Age\". His other science fiction writings earned him a number of Hugo and Nebula awards, which along with a large readership made him one of the towering figures of science fiction. For many years Clarke, Robert Heinlein and Isaac Asimov were known as the \"Big Three\" of science fiction.\r\n\r\nClarke was a lifelong proponent of space travel. In 1934, while still a teenager, he joined the British Interplanetary Society. In 1945, he proposed a satellite communication system using geostationary orbits. He was the chairman of the British Interplanetary Society from 1946–1947 and again in 1951–1953.\r\n\r\nClarke emigrated from England to Sri Lanka (formerly Ceylon) in 1956, largely to pursue his interest in scuba diving. That year he discovered the underwater ruins of the ancient Koneswaram temple in Trincomalee. Clarke augmented his fame later on in the 1980s, from being the host of several television shows such as Arthur C. Clarke\'s Mysterious World. He lived in Sri Lanka until his death.\r\n\r\nClarke was appointed Commander of the Order of the British Empire (CBE) in 1989 \"for services to British cultural interests in Sri Lanka\". He was knighted in 1998 and was awarded Sri Lanka\'s highest civil honour, Sri Lankabhimanya, in 2005.\r\n\r\n---From Wikipedia'),(41,'Arnold J. Toynbee',NULL,'fiction','Arnold Joseph Toynbee (14 April 1889 – 22 October 1975) was a British historian, philosopher of history, research professor of International History at the London School of Economics and the University of London and author of numerous books.\r\n\r\n**Source**: [Arnold J. Toynbee](https://en.wikipedia.org/wiki/Arnold_J._Toynbee) on Wikipedia'),(42,'D.C Somervell',NULL,'fiction',''),(43,'Immanuel Kant',NULL,'fiction','Immanuel Kant was an 18th-century German philosopher from the Prussian city of Königsberg. Kant was the last influential philosopher of modern Europe in the classic sequence of the theory of knowledge during the Enlightenment beginning with thinkers John Locke, George Berkeley, and David Hume.\r\n\r\nKant created a new perspective in philosophy which had widespread influences on philosophy continuing through to the 21st century. He published important works on epistemology, as well as works relevant to religion, law, and history. One of his most prominent works is the *Critique of Pure Reason*, an investigation into the limitations and structure of reason itself. It encompasses an attack on traditional metaphysics and epistemology, and highlights Kant\'s own contribution to these areas. The other main works of his maturity are the *Critique of Practical Reason*, which concentrates on ethics, and the *Critique of Judgment*, which investigates aesthetics and teleology. <sup>[1][1]</sup>\r\n\r\n\r\n  [1]: https://en.wikipedia.org/wiki/Immanuel_Kant'),(44,'Church of England',NULL,'fiction',''),(45,'J. A. Maurault',NULL,'fiction',''),(46,'Truman Capote',NULL,'fiction','**Truman Capote** was an American writer, many of whose short stories, novels, plays, and nonfiction are recognized literary classics, including the novella *Breakfast at Tiffany\'s* (1958) and *In Cold Blood* (1965), which he labeled a \"nonfiction novel\".'),(47,'Avel.lí Artís Gener',NULL,'fiction',''),(48,'Jesús Zulaika Goicoechea',NULL,'fiction',''),(49,'Vincent van Gogh',NULL,'fiction',''),(50,'Colta Ives',NULL,'fiction',''),(51,'Sjraar van Heugten',NULL,'fiction',''),(52,'Marije Vellekoop',NULL,'fiction',''),(53,'Ingo F. Walther',NULL,'fiction',''),(54,'Rainer Metzger',NULL,'fiction',''),(55,'Louis van Tilborgh',NULL,'fiction',''),(56,'Johannes von Uitert',NULL,'fiction',''),(57,'Schapiro, Meyer',NULL,'fiction',''),(58,'Isabel Allende',NULL,'fiction','Isabel Angélica Allende Llona (Lima, Perú; 2 de agosto de 1942)​ es una escritora chilena con nacionalidad estadounidense, de ascendencia hispano-portuguesa y nacida en Perú. Desde 2004 es miembro de la Academia Estadounidense de las Artes y las Letras. Obtuvo el Premio Nacional de Literatura de su país en 2010. La venta total de sus libros alcanza 73 millones de ejemplares y sus obras han sido traducidas a 42 idiomas. Es considerada como la escritora viva más leída del mundo de la lengua española.\r\n\r\nSobrina y ahijada del expresidente chileno Salvador Allende (1970 - 1973), comenzó su carrera literaria como periodista. Tras el la muerte de su tío en el golpe militar de Chile en 1973 y el derrocamiento del gobierno de coalición, Isabel Allende abandonó Chile y se refugió en Venezuela. Su primera novela, *La casa de los espíritus* (1985), que surgió directamente de su exilio, se convirtió en un éxito de ventas y crítica mundial. A menudo entreteje elementos de mito y realismo, o lo que se conoce como \"realismo mágico\". Sus novelas a veces se basan en su propia infancia y experiencias vitales.\r\n\r\n\r\n----------\r\n\r\n\r\nIsabel Allende was born on 2 August 2 1942 in Lima, Peru. The niece and goddaughter of Salvador Allende, the former president of Chile from 1970 to 1973, she started her writing career as a journalist. Several months after her uncle\'s assassination and the overthrow of Chile\'s coalition government in 1973, Allende left Chile and found refuge in Venezuela. Her first novel, The House of the Spirits (1985), which arose directly out of her exile, became a worldwide bestseller and critical success. She often weaves together elements of myth and realism, or what is known as \"magic realist.\" Her novels are sometimes based on her own childhood and life experiences. Allende has been called \"the world\'s most widely read Spanish-language author.\"'),(59,'Michael Crichton',NULL,'fiction','An American writer and filmmaker.'),(60,'Edith Wharton',NULL,'fiction','Edith Wharton was a Pulitzer Prize-winning American novelist, short story writer and designer.\r\n\r\n*The Age of Innocence* (1920) won the 1921 Pulitzer Prize for literature, making her the first woman to win the award. She spoke fluent French as well as several other languages and many of her books were published in both French and English. ([Source][1])\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Edith_Wharton'),(61,'Martin Heidegger',NULL,'fiction','German philosopher'),(62,'John Macquarrie',NULL,'fiction',''),(63,'Edward S. Robinson',NULL,'fiction',''),(64,'Friedrich-Wilhelm von Herrmann',NULL,'fiction',''),(65,'Paul S. Boyer',NULL,'fiction','Paul S. Boyer, Merle Curti Professor of History Emeritus at the University of Wisconsin, Madison, earned his Ph.D. from Harvard University. An editor of NOTABLE AMERICAN WOMEN, 1607-1950 (1971), he also co-authored SALEM POSSESSED: THE SOCIAL ORIGINS OF WITCHCRAFT (1974), for which, with Stephen Nissenbaum, he received the John H. Dunning Prize of the American Historical Association. His other works include URBAN MASSES AND MORAL ORDER IN AMERICA, 1820-1920 (1978), BY THE BOMB\'S EARLY LIGHT: AMERICAN THOUGHT AND CULTURE AT THE DAWN OF THE ATOMIC AGE (1985), WHEN TIME SHALL BE NO MORE: PROPHECY BELIEF IN MODERN AMERICAN CULTURE (1992), and PROMISES TO KEEP: THE UNITED STATES SINCE WORLD WAR II (3e, 2003). He is also editor-in-chief of the OXFORD COMPANION TO UNITED STATES HISTORY (2001). His articles and essays have appeared in the \"American Quarterly,\" \"New Republic,\" and other journals. He has been a visiting professor at the University of California, Los Angeles; Northwestern University; and the College of William and Mary.'),(66,'Charles Darwin',NULL,'fiction',''),(67,'Theodore L. Brown',NULL,'fiction','Theodore L. Brown recibió su doctorado de la  Michigan State University en  1956. Desde entonces ha sido miembro del profesorado de la University of Illinois, Urbana-Champaign, en donde hasta el día de  hoy es profesor emérito de química. De 1980 a 1986, fungió como vicecanciller de investigación y decano en The Graduate College, y de 1987 a  1993 como director  fundador del Arnold y Mabel Beckman Institute for Advanced Science and Technology. El profesor Brown ha sido miembro de la Alfred P. Sloan Foundation Research y ha sido galardo­nado como miembro Guggenheim. En 1972 fue galardonado con el premio de Investigación en Química Inorgánica de la American Chemical Society, y en 1993 recibió el premio de la American Chemical Society por su distinguido servicio en favor de la química inorgánica. Fue elegido miembro de la American Association for the Advancement of Science y la American Academy of Arts and Sciences.'),(68,'H. Eugene Lemay',NULL,'fiction',''),(69,'Bruce E. Bursten',NULL,'fiction',''),(70,'Catherine Murphy',NULL,'fiction',''),(71,'Patrick Woodward',NULL,'fiction',''),(72,'Khaled Hosseini',NULL,'fiction','Hosseini was born in Kabul, Afghanistan, in 1965. In 1970 Hosseini and his family moved to Iran where his father worked for the Embassy of Afghanistan in Tehran. In 1976, when Hosseini was 11 years old, Hosseini\'s father obtained a job in Paris, France, and moved the family there. They were unable to return to Afghanistan because of the Saur Revolution. They sought political asylum in the United States and made their residence in San Jose, California.  Hosseini graduated from Independence High School in San Jose in 1984 and enrolled at Santa Clara University, where he earned a bachelor\'s degree in biology in 1988. The following year, he entered the University of California, San Diego, School of Medicine, where he earned his M.D. in 1993. He completed his residency in internal medicine at Cedars-Sinai Medical Center in Los Angeles in 1996. He practiced medicine for over ten years, until a year and a half after the release of The Kite Runner.\r\nHosseini is currently a Goodwill Envoy for the United Nations High Commissioner for Refugees (UNHCR). He has been working to provide humanitarian assistance in Afghanistan through the Khaled Hosseini Foundation. He lives in Northern California with his wife, Roya, and their two children (Harris and Farah).'),(73,'Anthony Burgess',NULL,'fiction','John Anthony Burgess Wilson, who published under the name Anthony Burgess, was an English writer and composer.\r\n\r\nAlthough Burgess was primarily a comic writer, his dystopian satire *A Clockwork Orange* remains his best-known novel. In 1971, it was adapted into a controversial film by Stanley Kubrick, which Burgess said was chiefly responsible for the popularity of the book. Burgess produced numerous other novels, including the Enderby quartet, and Earthly Powers. He wrote librettos and screenplays, including the 1977 television mini-series Jesus of Nazareth. He worked as a literary critic for several publications, including The Observer and The Guardian, and wrote studies of classic writers, notably James Joyce. A versatile linguist, Burgess lectured in phonetics, and translated Cyrano de Bergerac, Oedipus Rex, and the opera Carmen, among others.\r\n\r\nBurgess also composed over 250 musical works; he considered himself as much a composer as an author, although he achieved considerably more success in writing.'),(74,'Toni Morrison',NULL,'fiction','Toni Morrison is a Nobel Prize and Pulitzer Prize-winning American author, editor, and professor. Her novels are known for their epic themes, vivid dialogue, and richly detailed black characters. Among her best known novels are *The Bluest Eye*, *Song of Solomon*, and *Beloved*. ([Source][1].)\r\n\r\n[1]:https://en.wikipedia.org/wiki/Toni_Morrison'),(75,'Ken Kesey',NULL,'fiction','KEN KESEY was born in La Junta, Colorado, but his family later moved to Springfield, Oregon, where he attended public schools, and later the University of Oregon at Eugene. He has received the Woodrow Wilson scholarship to Stanford University and a Saxton Fellowship, and won the Fred Lowe Scholarship awarded to the outstanding wrestler in the Northwest. Mr. Kesey was king of the Merry Pranksters, a group which traveled the West Coast staging happenings; as a leader of this group, Mr. Kesey appeared as subject and star in the bestseller, THE ELECTRIC KOOL-AID ACID TEST, by Tom Wolfe.\r\nAt present he is \"scratching his athlete\'s foot on his farm in Oregon, watching his kids and blueberries grow.\"\r\n\r\nPhoto: By <span title=\"must have been published or publicly displayed outside Wikipedia\">Source</span> (<a href=\"//en.wikipedia.org/wiki/Wikipedia:Non-free_content_criteria#4\" title=\"Wikipedia:Non-free content criteria\">WP:NFCC#4</a>), <a href=\"//en.wikipedia.org/wiki/File:Ken_Kesey,_American_author,_1935-2001.jpg\" title=\"Fair use of copyrighted material in the context of Ken Kesey\">Fair use</a>, <a href=\"https://en.wikipedia.org/w/index.php?curid=54571568\">Link</a>'),(76,'Henry Gray F.R.S.',NULL,'fiction','http://viaf.org/viaf/57675618\r\n\r\nhttps://en.wikipedia.org/wiki/Henry_Gray'),(77,'Henry Vandyke Carter',NULL,'fiction','Best known as the illustrator of *Gray\'s Anatomy*'),(78,'Vālmīki',NULL,'fiction','legendary Indian poet, author of the Ramayana'),(79,'Robert P. Goldman',NULL,'fiction',''),(80,'Rosalind Lefeber',NULL,'fiction',''),(81,'Sheldon I. Pollock',NULL,'fiction',''),(82,'Фёдор Михайлович Достоевский',NULL,'fiction','Russian novelist Fyodor Mikhailovitch Dostoyevsky was a journalist and short-story writer, whose psychological penetration into the human soul profoundly influenced the 20th century novel. Dostoevsky\'s novels have much autobiographical elements, but ultimately they deal with moral and philosophical questions. He presented interacting characters with contrasting views or ideas about freedom of choice, Socialism, atheisms, good and evil, happiness and so forth. Dostoevsky\'s central obsession was God, whom his characters constantly search through painful errors and humiliations. ([Source][1])\r\n\r\nDostoyevsky\'s literary output explores human psychology in the troubled political, social and spiritual context of 19th-century Russian society. Considered by many as a founder or precursor of 20th-century existentialism, his *Notes from Underground* (1864), written in the embittered voice of the anonymous \"underground man\", was called by Walter Kaufmann the \"best overture for existentialism ever written.\" A prominent figure in world literature, Dostoyevsky is often acknowledged by critics as one of the greatest psychologists in world literature. ([Source][2])\r\n\r\n\r\nФёдор Миха́йлович Достое́вский (рус. дореф. Ѳедоръ Михайловичъ Достоевскій; 30 октября [11 ноября] 1821, Москва, Российская империя — 28 января [9 февраля] 1881, Санкт-Петербург, Российская империя) — русский писатель, мыслитель, философ и публицист. Член-корреспондент Петербургской АН с 1877 года. ([Source][3])\r\n\r\nКак в начале, так и в продолжении своего литературного творчества после четырёх лет каторги и ссылки за участие в кружке Петрашевского Достоевский выступал в качестве новатора в русле традиций русского реализма, что не получило должной оценки современников при жизни писателя. ([Source][3])\r\n\r\nПосле смерти Достоевский был признан классиком русской литературы и одним из лучших романистов мирового значения, считается первым представителем персонализма в России. Творчество русского писателя оказало воздействие на мировую литературу, в частности, на творчество ряда лауреатов Нобелевской премии по литературе, на становление экзистенциализма и фрейдизма. ([Source][3])\r\n\r\nК наиболее значительным произведениям писателя относятся романы «великого пятикнижия». Романы «Преступление и наказание», «Идиот», «Бесы» и «Братья Карамазовы» включены в список 100 лучших книг Норвежского книжного клуба 2002 года. Многие известные произведения Достоевского многократно экранизировались и инсценировались в театре, ставились балетные и оперные постановки. ([Source][3])\r\n\r\n  [1]: http://www.kirjasto.sci.fi/fdosto.htm\r\n  [2]: http://en.wikipedia.org/wiki/Fyodor_Dostoyevsky\r\n [3]: https://ru.wikipedia.org/wiki/%D0%94%D0%BE%D1%81%D1%82%D0%BE%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9,_%D0%A4%D1%91%D0%B4%D0%BE%D1%80_%D0%9C%D0%B8%D1%85%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%B8%D1%87'),(83,'Winston S. Churchill',NULL,'fiction','Sir Winston Leonard Spencer-Churchill, KG, OM, CH, TD, PC, FRS was a British politician known chiefly for his leadership of the United Kingdom during World War II. He is widely regarded as one of the great wartime leaders. He served as Prime Minister from 1940 to 1945 and again from 1951 to 1955. A noted statesman and orator, Churchill was also an officer in the British Army, a historian, writer and artist. To date, he is the only British Prime Minister to have received the Nobel Prize in Literature, and the first person to be recognised as an honorary citizen of the United States.'),(84,'Anne Frank',NULL,'fiction','German-born Dutch Jewish diarist and Holocaust victim'),(85,'Ben Jonson',NULL,'fiction','Jonson was an English playwright, poet and literary critic in the 17th century.'),(86,'Gaston Leroux',NULL,'fiction','Gaston Louis Alfred Leroux was born in Paris and worked there as an author and journalist (<a href=http://en.wikipedia.org/wiki/Gaston_Leroux>Wikipedia</a>).  His most famous work is <a href=http://en.wikipedia.org/wiki/The_Phantom_of_the_Opera>The Phantom of the Opera</a> as it has been made into films and a musical.'),(87,'Philip Pullman',NULL,'fiction','Philip Pullman CBE, FRSL is an English writer from Norwich. He is the best-selling author of several books, most notably his trilogy of fantasy novels, *His Dark Materials*, and his fictional biography of Jesus, *The Good Man Jesus and the Scoundrel Christ*. The first of *His Dark Materials* has been turned into the film The Golden Compass and the first two books from his Sally Lockhart series have been adapted for television.\r\n\r\nIn 2008, The Times named Pullman in their list of \"The 50 greatest British writers since 1945\".\r\n\r\n([Source][1])\r\n\r\n\r\n  [1]:  http://en.wikipedia.org/wiki/Philip_Pullman'),(88,'Johann Wolfgang von Goethe',NULL,'fiction','Johann Wolfgang von Goethe was a German writer and polymath. Goethe\'s works span the fields of poetry, drama, literature, theology, philosophy, pantheism, and science. His magnum opus, lauded as one of the peaks of world literature, is the two-part drama Faust. Goethe\'s other well-known literary works include his numerous poems, the Bildungsroman Wilhelm Meister\'s Apprenticeship and the epistolary novel The Sorrows of Young Werther. <sup>[1][1]</sup>\r\n\r\n\r\n  [1]: https://en.wikipedia.org/wiki/Johann_Wolfgang_von_Goethe'),(89,'René Descartes',NULL,'fiction','René Descartes, also known as Renatus Cartesius, was a French philosopher, mathematician, physicist, and writer who spent most of his adult life in the Dutch Republic. He has been dubbed the \"Father of Modern Philosophy\", and much of subsequent Western philosophy is a response to his writings, which continue to be studied closely to this day. In particular, his Meditations on First Philosophy continues to be a standard text at most university philosophy departments. Descartes\' influence in mathematics is also apparent; the Cartesian coordinate system—allowing geometric shapes to be expressed in algebraic equations—was named after him. He is credited as the father of analytical geometry. Descartes was also one of the key figures in the Scientific Revolution.\r\n\r\nDescartes frequently sets his views apart from those of his predecessors. In the opening section of the Passions of the Soul, a treatise on the Early Modern version of what are now commonly called emotions, Descartes goes so far as to assert that he will write on this topic \"as if no one had written on these matters before\". Many elements of his philosophy have precedents in late Aristotelianism, the revived Stoicism of the 16th century, or in earlier philosophers like St. Augustine. In his natural philosophy, he differs from the Schools on two major points: First, he rejects the analysis of corporeal substance into matter and form; second, he rejects any appeal to ends—divine or natural—in explaining natural phenomena. In his theology, he insists on the absolute freedom of God’s act of creation.<sup>[1][1]</sup>\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Descartes'),(90,'Jack Kerouac',NULL,'fiction','Jack Kerouac was an American novelist and poet of French-Canadian ancestry.\r\n\r\nHe is considered a literary iconoclast and, alongside William S. Burroughs and Allen Ginsberg, a pioneer of the Beat Generation Kerouac is recognized for his method of spontaneous prose. Thematically, his work covers topics such as Catholic spirituality, jazz, promiscuity, Buddhism, drugs, poverty, and travel. He became an underground celebrity and, with other beats, a progenitor of the hippie movement, although he remained antagonistic toward some of its politically radical elements.'),(91,'William Shakespeare',NULL,'fiction','William Shakespeare was an English poet and playwright, widely regarded as the greatest writer in the English language and the world\'s pre-eminent dramatist.  He is often called England\'s national poet and the \"Bard of Avon\".  His surviving works, including some collaborations, consist of 38 plays,[c]  154 sonnets, two long narrative poems, and several other poems. His plays have been translated into every major living language and are performed more often than those of any other playwright. He has invented over 1700 words and some of them are common, some of them are not. ([Source][1].)\r\n\r\n[1]:https://en.wikipedia.org/wiki/William_Shakespeare\r\n\r\nLooking for the \'[First Folio](https://openlibrary.org/works/OL362289W/Plays)\'?'),(92,'Carlo Collodi',NULL,'fiction','Carlo Collodi was a pseudonym of Carlo Lorenzini'),(93,'J.R.R. Tolkien',NULL,'fiction','John Ronald Reuel Tolkien (1892-1973) was a major scholar of the English language, specialising in Old and Middle English. Twice Professor of Anglo-Saxon (Old English) at the University of Oxford, he also wrote a number of stories, including most famously The Hobbit (1937) and The Lord of the Rings (1954-1955), which are set in a pre-historic era in an invented version of the world which he called by the Middle English name of Middle-earth. This was peopled by Men (and women), Elves, Dwarves, Trolls, Orcs (or Goblins) and of course Hobbits. He has regularly been condemned by the Eng. Lit. establishment, with honourable exceptions, but loved by literally millions of readers worldwide.\r\n\r\nIn the 1960s he was taken up by many members of the nascent \"counter-culture\" largely because of his concern with environmental issues. In 1997 he came top of three British polls, organised respectively by Channel 4 / Waterstone\'s, the Folio Society, and SFX, the UK\'s leading science fiction media magazine, amongst discerning readers asked to vote for the greatest book of the 20th century. \r\n\r\n([Source][1])\r\n\r\n\r\n  [1]: http://www.tolkiensociety.org/tolkien/biography.html'),(94,'Hermann Hesse',NULL,'fiction','Hermann Karl Hesse -pseudonym: Emil Sinclair- (* 2. Juli 1877 in Calw; † 9. August 1962 in Montagnola, Schweiz), war ein deutsch-schweizerischer Schriftsteller, Dichter und Maler. Bekanntheit erlangte er mit Prosawerken wie *Siddhartha, Demian, Der Steppenwolf* sowie auch *Narziß und Goldmund* und mit seinen Gedichten (z. B. *Stufen).* 1946 wurde ihm der Nobelpreis für Literatur und 1954 der Orden Pour le Mérite für Wissenschaften und Künste verliehen.\r\n\r\n\r\n----------\r\n\r\n\r\nHermann Karl Hesse (2 July 1877 – 9 August 1962) was a German-Swiss poet, novelist, and painter. His best-known works include *Demian, Steppenwolf, Siddhartha,* and *The Glass Bead Game,* each of which explores an individual\'s search for authenticity, self-knowledge and spirituality. In 1946, he received the Nobel Prize in Literature.'),(95,'Adam Smith',NULL,'fiction','Adam Smith (16 June 1723 – 17 July 1790) was aScottish social philosopher and a pioneer of political economy. Smith is best known for two classic works, *The Theory of Moral Sentiments* (1759) and *An Inquiry into the Nature and Causes of the Wealth of Nations* (1776). The latter, usually abbreviated as *The Wealth of Nations*, is considered his magnum opus and the first modern work of economics.\r\n\r\n**Source**: [Adam Smith](https://en.wikipedia.org/wiki/Adam_Smith) on Wikipedia.'),(96,'Aric Cushing',NULL,'fiction',''),(97,'Bookstar',NULL,'fiction',''),(98,'Adolf Hitler',NULL,'fiction','Adolf Hitler (German pronunciation: [ˈadɔlf ˈhɪtlɐ]) was an Austrian-born German politician and the leader of the National Socialist German Workers Party (German: Nationalsozialistische Deutsche Arbeiterpartei, abbreviated NSDAP), commonly known as the Nazi Party. He was Chancellor of Germany from 1933 to 1945 and, after 1934, also head of state as Führer und Reichskanzler, ruling the country as an absolute dictator.\r\n\r\nHitler ultimately wanted to establish a New Order of absolute Nazi German hegemony in continental Europe. To achieve this, he pursued a foreign policy with the declared goal of seizing Lebensraum (\"living space\") for the \"Aryan race\"; directing the resources of the state towards this goal. This included the rearmament of Germany, which culminated in 1939 when the Wehrmacht invaded Poland. In response, the United Kingdom and France declared war against Germany, leading to the outbreak of World War II in Europe. ([Source.][1])\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Adolf_hitler'),(99,'C.S. Lewis',NULL,'fiction','Clive Staples Lewis was an Irish-born British novelist, academic, medievalist, literary critic, essayist, lay theologian and Christian apologist.'),(100,'Will Durant',NULL,'fiction',''),(101,'Emily Dickinson',NULL,'fiction','Emily Dickinson was an American poet. Born in Amherst, Massachusetts, to a successful family with strong community ties, she lived a mostly introverted and reclusive life. After she studied at the Amherst Academy for seven years in her youth, she spent a short time at Mount Holyoke Female Seminary before returning to her family\'s house in Amherst. Thought of as an eccentric by the locals, she became known for her penchant for white clothing and her reluctance to greet guests or, later in life, even leave her room. Most of her friendships were therefore carried out by correspondence. ([Source][1].)\r\n\r\n[1]: http://en.wikipedia.org/wiki/Emily_Dickinson'),(102,'Victor Hugo',NULL,'fiction','Victor-Marie Hugo was a French poet, playwright, novelist, essayist, visual artist, statesman, human rights activist and exponent of the Romantic movement in France.\r\n\r\nIn France, Hugo\'s literary fame comes first from his poetry but also rests upon his novels and his dramatic achievements. Among many volumes of poetry, Les Contemplations and La Légende des siècles stand particularly high in critical esteem, and Hugo is sometimes identified as the greatest French poet. Outside France, his best-known works are the novels Les Misérables and Notre-Dame de Paris (known in English also as The Hunchback of Notre-Dame).\r\n\r\nThough a committed conservative royalist when he was young, Hugo grew more liberal as the decades passed; he became a passionate supporter of republicanism, and his work touches upon most of the political and social issues and artistic trends of his time. He is buried in the Panthéon.\r\n\r\n([Source][1])\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/Victor_Hugo'),(103,'Plutarch',NULL,'fiction','Plutarch, born Plutarchos (Greek: Πλούταρχος) then, on his becoming a Roman citizen, Lucius Mestrius Plutarchus (Μέστριος Πλούταρχος), c. 46 – 120 AD, was a Greek historian, biographer, essayist, and Middle Platonist known primarily for his Parallel Lives and Moralia. He was born to a prominent family in Chaeronea, Boeotia, a town about twenty miles east of Delphi. Plutarch died between the years AD 119 and 127.'),(104,'Stephen King',NULL,'fiction','Stephen Edwin King (born September 21, 1947) is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels. His books have sold more than 350 million copies, and many have been adapted into films, television series, miniseries, and comic books. King has published 63 novels, including seven under the pen name Richard Bachman, and five non-fiction books. He has also written approximately 200 short stories, most of which have been published in book collections.\r\n\r\nKing has received Bram Stoker Awards, World Fantasy Awards, and British Fantasy Society Awards. In 2003, the National Book Foundation awarded him the Medal for Distinguished Contribution to American Letters. He has also received awards for his contribution to literature for his entire bibliography, such as the 2004 World Fantasy Award for Life Achievement and the 2007 Grand Master Award from the Mystery Writers of America. In 2015, he was awarded with a National Medal of Arts from the U.S. National Endowment for the Arts for his contributions to literature. He has been described as the \"King of Horror\", a play on his surname and a reference to his high standing in pop culture.'),(105,'Stephen Hawking',NULL,'fiction','A British theoretical physicist and cosmologist. Researcher & explorer of black holes and the space-time continum.'),(106,'John Locke',NULL,'fiction','John Locke, widely known as the Father of Liberalism, was an English philosopher and physician regarded as one of the most influential of Enlightenment thinkers. Considered the first of the British empiricists, he is equally important to social contract theory. His work had a great impact upon the development of epistemology and political philosophy. His writings influenced Voltaire and Rousseau, many Scottish Enlightenment thinkers, as well as the American revolutionaries. His contributions to classical republicanism and liberal theory are reflected in the American Declaration of Independence.\r\n\r\nLocke\'s theory of mind is often cited as the origin of modern conceptions of identity and the self, figuring prominently in the work of later philosophers such as Hume, Rousseau and Kant. Locke was the first to define the self through a continuity of consciousness. He postulated that the mind was a blank slate or tabula rasa. Contrary to pre-existing Cartesian philosophy, he maintained that we are born without innate ideas, and that knowledge is instead determined only by experience derived from sense perception.<sup>[1][1]</sup>\r\n\r\n\r\n  [1]: http://en.wikipedia.org/wiki/John_Locke'),(107,'James Joyce',NULL,'fiction','James Augustine Aloysius Joyce was an Irish novelist and poet. He contributed to the modernist avant-garde and is regarded as one of the most influential and important authors of the 20th century.\r\n\r\nJoyce is best known for Ulysses (1922), a landmark work in which the episodes of Homer\'s Odyssey are paralleled in an array of contrasting literary styles, perhaps most prominent among these the stream of consciousness technique he utilised. Other well-known works are the short-story collection Dubliners (1914), and the novels A Portrait of the Artist as a Young Man (1916) and Finnegans Wake (1939). His other writings include three books of poetry, a play, occasional journalism and his published letters. [(Wikipedia][1])\r\n\r\n\r\n  [1]: https://en.wikipedia.org/wiki/James_Joyce');
/*!40000 ALTER TABLE `website_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_book`
--

DROP TABLE IF EXISTS `website_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `publication_year` smallint unsigned DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  `publisher_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `website_book_genre_id_ce95191d_fk_website_genre_id` (`genre_id`),
  KEY `website_book_publisher_id_4ea9d519_fk_website_publisher_id` (`publisher_id`),
  CONSTRAINT `website_book_genre_id_ce95191d_fk_website_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `website_genre` (`id`),
  CONSTRAINT `website_book_publisher_id_4ea9d519_fk_website_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `website_publisher` (`id`),
  CONSTRAINT `website_book_chk_1` CHECK ((`publication_year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_book`
--

LOCK TABLES `website_book` WRITE;
/*!40000 ALTER TABLE `website_book` DISABLE KEYS */;
INSERT INTO `website_book` VALUES (1,'English grammar','9780665474477',1795,1,1),(2,'Sparkling Cyanide','9780006110095',1945,1,1),(3,'They Do It with Mirrors','9788447369188',1952,1,1),(4,'The Catcher in the Rye','9788483023655',1900,1,1),(5,'Elements','9782130432401',1482,1,1),(6,'The Book Thief','9783837124019',1998,1,1),(7,'Gone With the Wind','9788482809007',1905,1,1),(8,'El túnel','9782020239288',1948,1,1),(9,'Arsène Lupin, gentleman-cambrioleur','9781647333744',1907,1,1),(10,'Guess How Much I Love You','9780763621063',1839,1,1),(11,'The Big Sleep','9780141189512',1939,1,1),(12,'The Big Four','9780061739095',1927,1,1),(13,'The Grapes of Wrath','9780749317805',1939,1,1),(14,'Max Ernst','9780871042903',1956,1,1),(15,'Perfume','9782213017426',1985,1,1),(16,'Curtain','9780008256043',1975,1,1),(17,'Paradise Lost','9780451524744',1667,1,1),(18,'Daisy Miller','9781434636263',1877,1,1),(19,'Philosophiae naturalis principia mathematica','9780521079600',1687,1,1),(20,'A Murder Is Announced','9788478713158',1950,1,1),(21,'Доктор Живаго','9788416734023',1957,1,1),(22,'Fantastic Mr Fox','9780141333205',1970,1,1),(23,'After the Funeral','9780062573209',1953,1,1),(24,'Pippi Långstrump','9788574060972',1945,1,1),(25,'Im Westen nichts Neues','9781101908082',1928,1,1),(26,'Les Contes de ma mère l\'Oye','9788466610537',1675,1,1),(27,'My Ántonia','9781582015705',1918,1,1),(28,'Essays','9781573920322',1618,1,1),(29,'The Mirror Crack\'d from Side to Side','9780061155390',1960,1,1),(30,'Kinder- und Hausmärchen','9780665585715',1800,1,1),(31,'... Trotzdem Ja zum Leben sagen','9780807014288',1946,1,1),(32,'The princess and the goblin','9781955382281',1907,1,1),(33,'Picasso','9783770159192',1926,1,1),(34,'The Hunger Games','9780545114073',2008,1,1),(35,'The Murder of Roger Ackroyd','9788477511328',1926,1,1),(36,'Die Blechtrommel','9789588940267',1959,1,1),(37,'The Martian Chronicles','9788497821292',1950,1,1),(38,'Laws, etc','9780118038768',1691,1,1),(39,'Momo oder Die seltsame Geschichte von den Zeit-Dieben und von dem Kind, das den Menschen die gestohlene Zeit zurückbrachte','9783570260968',1973,1,1),(40,'2001','9780091190507',1968,1,1),(41,'Hercule Poirot\'s Christmas','9788408195245',1939,1,1),(42,'A Study of History','9780192152091',1900,1,1),(43,'Murder in Three Acts','9789504908463',1934,1,1),(44,'Lord Edgware Dies','9781504763486',1933,1,1),(45,'Kritik der reinen Vernunft','9781404301269',1781,1,1),(46,'Book of common prayer','9780665146442',1537,1,1),(47,'In Cold Blood','9788402075314',1709,1,1),(48,'Frotiers Peace Treaties, and International Organization','9781579125868',1914,1,1),(49,'4:50 from Paddington','9788447369195',1957,1,1),(50,'La casa de los espíritus','9789755102160',1982,1,1),(51,'The Andromeda Strain','9780060541811',1751,1,1),(52,'The House of Mirth','9781548892777',1905,1,1),(53,'Sein und Zeit','9780631197706',1927,1,1),(54,'The Enduring Vision','9780618280650',1987,1,1),(55,'On the origin of species by means of natural selection','9788483061312',1859,1,1),(56,'Chemistry','9780130845108',1977,1,1),(57,'The Pearl','9788435008440',1945,1,1),(58,'Death on the Nile','9787100173605',1937,1,1),(59,'Appointment with Death','9782846343756',1938,1,1),(60,'The Kite Runner','9780786564743',2003,1,1),(61,'A Clockwork Orange','9780140188820',1962,1,1),(62,'A Caribbean Mystery','9785556016262',1964,1,1),(63,'Death in the Clouds','9780060746612',1935,1,1),(64,'Beloved','9781784878672',1987,1,1),(65,'Five Little Pigs','9788483003503',1942,1,1),(66,'One Flew Over the Cuckoo\'s Nest','9782253016076',1962,1,1),(67,'Evil Under the Sun','9780671706128',1941,1,1),(68,'Anatomy','9780443045608',1858,1,1),(69,'Ramayana, a Holy Bible of India','9780691065618',1823,1,1),(70,'Записки изъ подполья','9781535259767',1864,1,1),(71,'The Second World War','9787538708127',1948,1,1),(72,'Het Achterhuis','9789022307939',1944,1,1),(73,'The alchemist, 1612','9781976769023',1612,1,1),(74,'Le fantôme de l\'opéra','9780880292986',1911,1,1),(75,'Northern Lights','9780375842375',1995,1,1),(76,'The A.B.C. Murders','9782702401972',1936,1,1),(77,'Faust','9780671005214',1800,1,1),(78,'Discours de la méthode','9780023671609',1644,1,1),(79,'On The Road','9784309460062',1957,1,1),(80,'Murder on the Links','9798781849666',1923,1,1),(81,'Othello','9789683685452',1622,1,1),(82,'Le avventure di Pinocchio','9781775411413',1883,1,1),(83,'The Return of the King','9781565116696',1950,1,1),(84,'Der Steppenwolf','9798723625433',1927,1,1),(85,'Идіотъ','9781432526870',1880,1,1),(86,'The Wealth of Nations','9780872202047',1776,1,1),(87,'The Mysterious Affair at Styles','9798500234094',1920,1,1),(88,'Mein Kampf','9788187138662',1922,1,1),(89,'Prince Caspian','9780007325078',1951,1,1),(90,'The Story of Philosophy','9780671494155',1926,1,1),(91,'The Poems of Emily Dickinson Volume II','9781595400161',1890,1,1),(92,'Notre-Dame de Paris','9780899663821',1831,1,1),(93,'And Then There Were None','9780708914847',1939,1,1),(94,'Moralia','9782251004990',1500,1,1),(95,'\'Salem’s Lot','9780881037203',1975,1,1),(96,'A Brief History of Time','9788817019361',1988,1,1),(97,'Essay concerning human understanding','9780353167957',1689,1,1),(98,'Finnegans Wake','9780141192291',1928,1,1),(99,'Charlie and the Chocolate Factory','9780553121438',1964,1,1),(100,'At Bertram\'s Hotel','9789792293555',1965,1,1);
/*!40000 ALTER TABLE `website_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_book_authors`
--

DROP TABLE IF EXISTS `website_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_book_authors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_book_authors_book_id_author_id_c3dccdba_uniq` (`book_id`,`author_id`),
  KEY `website_book_authors_author_id_e5994a38_fk_website_author_id` (`author_id`),
  CONSTRAINT `website_book_authors_author_id_e5994a38_fk_website_author_id` FOREIGN KEY (`author_id`) REFERENCES `website_author` (`id`),
  CONSTRAINT `website_book_authors_book_id_2787f23c_fk_website_book_id` FOREIGN KEY (`book_id`) REFERENCES `website_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_book_authors`
--

LOCK TABLES `website_book_authors` WRITE;
/*!40000 ALTER TABLE `website_book_authors` DISABLE KEYS */;
INSERT INTO `website_book_authors` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,3),(5,5,4),(6,6,5),(7,7,6),(8,8,7),(9,9,8),(10,10,9),(11,10,10),(12,11,11),(13,12,2),(14,13,12),(15,14,13),(16,14,14),(17,14,15),(18,14,16),(19,14,17),(20,15,18),(21,16,2),(22,17,19),(23,18,20),(24,19,21),(25,20,2),(26,21,22),(27,22,23),(28,23,2),(29,24,24),(30,25,25),(31,26,26),(32,27,27),(33,28,28),(34,29,2),(35,30,29),(36,31,30),(37,32,31),(38,33,32),(39,33,33),(40,33,34),(41,34,35),(42,35,2),(43,36,36),(44,37,37),(45,38,38),(46,39,39),(47,40,40),(48,41,2),(49,42,41),(50,42,42),(51,43,2),(52,44,2),(53,45,43),(54,46,44),(55,46,45),(57,47,46),(58,47,47),(56,47,48),(59,48,49),(60,48,50),(61,48,51),(62,48,52),(63,48,53),(64,48,54),(65,48,55),(66,48,56),(67,48,57),(68,49,2),(69,50,58),(70,51,59),(71,52,60),(73,53,61),(74,53,62),(75,53,63),(72,53,64),(76,54,65),(77,55,66),(78,56,67),(79,56,68),(80,56,69),(81,56,70),(82,56,71),(83,57,12),(84,58,2),(85,59,2),(86,60,72),(87,61,73),(88,62,2),(89,63,2),(90,64,74),(91,65,2),(92,66,75),(93,67,2),(94,68,76),(95,68,77),(98,69,78),(99,69,79),(96,69,80),(97,69,81),(100,70,82),(101,71,83),(102,72,84),(103,73,85),(104,74,86),(105,75,87),(106,76,2),(107,77,88),(108,78,89),(109,79,90),(110,80,2),(111,81,91),(112,82,92),(113,83,93),(114,84,94),(115,85,82),(116,86,95),(119,87,2),(117,87,96),(118,87,97),(120,88,98),(121,89,99),(122,90,100),(123,91,101),(124,92,102),(125,93,2),(126,94,103),(127,95,104),(128,96,105),(129,97,106),(130,98,107),(131,99,23),(132,100,2);
/*!40000 ALTER TABLE `website_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_bookcopy`
--

DROP TABLE IF EXISTS `website_bookcopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_bookcopy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `copy_number` varchar(20) NOT NULL,
  `acquisition_date` date NOT NULL,
  `condition` varchar(10) NOT NULL,
  `book_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_book_copy` (`book_id`,`copy_number`),
  CONSTRAINT `website_bookcopy_book_id_cd91db9b_fk_website_book_id` FOREIGN KEY (`book_id`) REFERENCES `website_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_bookcopy`
--

LOCK TABLES `website_bookcopy` WRITE;
/*!40000 ALTER TABLE `website_bookcopy` DISABLE KEYS */;
INSERT INTO `website_bookcopy` VALUES (1,'001','2024-11-27','new',1),(2,'001','2024-11-27','new',2),(3,'001','2024-11-27','new',3),(4,'001','2024-11-27','new',4),(5,'001','2024-11-27','new',5),(6,'001','2024-11-27','new',6),(7,'001','2024-11-27','new',7),(8,'001','2024-11-27','new',8),(9,'001','2024-11-27','new',9),(10,'001','2024-11-27','new',10),(11,'001','2024-11-27','new',11),(12,'001','2024-11-27','new',12),(13,'001','2024-11-27','new',13),(14,'001','2024-11-27','new',14),(15,'001','2024-11-27','new',15),(16,'001','2024-11-27','new',16),(17,'001','2024-11-27','new',17),(18,'001','2024-11-27','new',18),(19,'001','2024-11-27','new',19),(20,'001','2024-11-27','new',20),(21,'001','2024-11-27','new',21),(22,'001','2024-11-27','new',22),(23,'001','2024-11-27','new',23),(24,'001','2024-11-27','new',24),(25,'001','2024-11-27','new',25),(26,'001','2024-11-27','new',26),(27,'001','2024-11-27','new',27),(28,'001','2024-11-27','new',28),(29,'001','2024-11-27','new',29),(30,'001','2024-11-27','new',30),(31,'001','2024-11-27','new',31),(32,'001','2024-11-27','new',32),(33,'001','2024-11-27','new',33),(34,'001','2024-11-27','new',34),(35,'001','2024-11-27','new',35),(36,'001','2024-11-27','new',36),(37,'001','2024-11-27','new',37),(38,'001','2024-11-27','new',38),(39,'001','2024-11-27','new',39),(40,'001','2024-11-27','new',40),(41,'001','2024-11-27','new',41),(42,'001','2024-11-27','new',42),(43,'001','2024-11-27','new',43),(44,'001','2024-11-27','new',44),(45,'001','2024-11-27','new',45),(46,'001','2024-11-27','new',46),(47,'001','2024-11-27','new',47),(48,'001','2024-11-27','new',48),(49,'001','2024-11-27','new',49),(50,'001','2024-11-27','new',50),(51,'001','2024-11-27','new',51),(52,'001','2024-11-27','new',52),(53,'001','2024-11-27','new',53),(54,'001','2024-11-27','new',54),(55,'001','2024-11-27','new',55),(56,'001','2024-11-27','new',56),(57,'001','2024-11-27','new',57),(58,'001','2024-11-27','new',58),(59,'001','2024-11-27','new',59),(60,'001','2024-11-27','new',60),(61,'001','2024-11-27','new',61),(62,'001','2024-11-27','new',62),(63,'001','2024-11-27','new',63),(64,'001','2024-11-27','new',64),(65,'001','2024-11-27','new',65),(66,'001','2024-11-27','new',66),(67,'001','2024-11-27','new',67),(68,'001','2024-11-27','new',68),(69,'001','2024-11-27','new',69),(70,'001','2024-11-27','new',70),(71,'001','2024-11-27','new',71),(72,'001','2024-11-27','new',72),(73,'001','2024-11-27','new',73),(74,'001','2024-11-27','new',74),(75,'001','2024-11-27','new',75),(76,'001','2024-11-27','new',76),(77,'001','2024-11-27','new',77),(78,'001','2024-11-27','new',78),(79,'001','2024-11-27','new',79),(80,'001','2024-11-27','new',80),(81,'001','2024-11-27','new',81),(82,'001','2024-11-27','new',82),(83,'001','2024-11-27','new',83),(84,'001','2024-11-27','new',84),(85,'001','2024-11-27','new',85),(86,'001','2024-11-27','new',86),(87,'001','2024-11-27','new',87),(88,'001','2024-11-27','new',88),(89,'001','2024-11-27','new',89),(90,'001','2024-11-27','new',90),(91,'001','2024-11-27','new',91),(92,'001','2024-11-27','new',92),(93,'001','2024-11-27','new',93),(94,'001','2024-11-27','new',94),(95,'001','2024-11-27','new',95),(96,'001','2024-11-27','new',96),(97,'001','2024-11-27','new',97),(98,'001','2024-11-27','new',98),(99,'001','2024-11-27','new',99),(100,'001','2024-11-27','new',100);
/*!40000 ALTER TABLE `website_bookcopy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_fine`
--

DROP TABLE IF EXISTS `website_fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_fine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,2) NOT NULL,
  `imposed_date` date NOT NULL,
  `paid_date` date DEFAULT NULL,
  `fine_reason_id` bigint DEFAULT NULL,
  `loan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loan_id` (`loan_id`),
  KEY `website_fine_fine_reason_id_e2dc99cc_fk_website_finereason_id` (`fine_reason_id`),
  CONSTRAINT `website_fine_fine_reason_id_e2dc99cc_fk_website_finereason_id` FOREIGN KEY (`fine_reason_id`) REFERENCES `website_finereason` (`id`),
  CONSTRAINT `website_fine_loan_id_6a5d3d0a_fk_website_loan_id` FOREIGN KEY (`loan_id`) REFERENCES `website_loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_fine`
--

LOCK TABLES `website_fine` WRITE;
/*!40000 ALTER TABLE `website_fine` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_finereason`
--

DROP TABLE IF EXISTS `website_finereason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_finereason` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reason` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reason` (`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_finereason`
--

LOCK TABLES `website_finereason` WRITE;
/*!40000 ALTER TABLE `website_finereason` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_finereason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_genre`
--

DROP TABLE IF EXISTS `website_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_genre`
--

LOCK TABLES `website_genre` WRITE;
/*!40000 ALTER TABLE `website_genre` DISABLE KEYS */;
INSERT INTO `website_genre` VALUES (1,'General','Unclassified book genre');
/*!40000 ALTER TABLE `website_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_loan`
--

DROP TABLE IF EXISTS `website_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_loan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `loan_date` date NOT NULL,
  `expected_return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `book_copy_id` bigint NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_loan_book_copy_id_bd1d0522_fk_website_bookcopy_id` (`book_copy_id`),
  KEY `website_loan_member_id_d284b3e1_fk_auth_user_id` (`member_id`),
  CONSTRAINT `website_loan_book_copy_id_bd1d0522_fk_website_bookcopy_id` FOREIGN KEY (`book_copy_id`) REFERENCES `website_bookcopy` (`id`),
  CONSTRAINT `website_loan_member_id_d284b3e1_fk_auth_user_id` FOREIGN KEY (`member_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_loan`
--

LOCK TABLES `website_loan` WRITE;
/*!40000 ALTER TABLE `website_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_member`
--

DROP TABLE IF EXISTS `website_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_member` (
  `phone` varchar(15) NOT NULL,
  `membership_date` date NOT NULL,
  `user_id` int NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(150) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `website_member_user_id_2efa75c6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_member`
--

LOCK TABLES `website_member` WRITE;
/*!40000 ALTER TABLE `website_member` DISABLE KEYS */;
INSERT INTO `website_member` VALUES ('08111708055','2024-11-26',6,'','');
/*!40000 ALTER TABLE `website_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_publisher`
--

DROP TABLE IF EXISTS `website_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_publisher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_publisher`
--

LOCK TABLES `website_publisher` WRITE;
/*!40000 ALTER TABLE `website_publisher` DISABLE KEYS */;
INSERT INTO `website_publisher` VALUES (1,'Unknown Publisher','Unspecified',NULL);
/*!40000 ALTER TABLE `website_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_reservation`
--

DROP TABLE IF EXISTS `website_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reservation_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `book_id` bigint NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_reservation_book_id_c53cf77d_fk_website_book_id` (`book_id`),
  KEY `website_reservation_member_id_df3b7305_fk_auth_user_id` (`member_id`),
  CONSTRAINT `website_reservation_book_id_c53cf77d_fk_website_book_id` FOREIGN KEY (`book_id`) REFERENCES `website_book` (`id`),
  CONSTRAINT `website_reservation_member_id_df3b7305_fk_auth_user_id` FOREIGN KEY (`member_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_reservation`
--

LOCK TABLES `website_reservation` WRITE;
/*!40000 ALTER TABLE `website_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dcrm'
--

--
-- Dumping routines for database 'dcrm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27  6:44:17
