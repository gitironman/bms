-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: iamironman.cn    Database: bms
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.14-MariaDB-1:10.3.14+maria~bionic

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
-- Table structure for table `app01_author`
--

DROP TABLE IF EXISTS `app01_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `au_detail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `au_detail_id` (`au_detail_id`),
  CONSTRAINT `app01_author_au_detail_id_440c948c_fk_app01_authordetail_id` FOREIGN KEY (`au_detail_id`) REFERENCES `app01_authordetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_author`
--

LOCK TABLES `app01_author` WRITE;
/*!40000 ALTER TABLE `app01_author` DISABLE KEYS */;
INSERT INTO `app01_author` VALUES (1,'root',18,1),(2,'ironman',20,2);
/*!40000 ALTER TABLE `app01_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_authordetail`
--

DROP TABLE IF EXISTS `app01_authordetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_authordetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(32) NOT NULL,
  `addr` varchar(64) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_authordetail`
--

LOCK TABLES `app01_authordetail` WRITE;
/*!40000 ALTER TABLE `app01_authordetail` DISABLE KEYS */;
INSERT INTO `app01_authordetail` VALUES (1,'188','南山区','2019-01-01'),(2,'166','福田区','2019-04-08');
/*!40000 ALTER TABLE `app01_authordetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_book`
--

DROP TABLE IF EXISTS `app01_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `pub_date` date NOT NULL,
  `publish_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_book_publish_id_d96d3535_fk_app01_publish_id` (`publish_id`),
  CONSTRAINT `app01_book_publish_id_d96d3535_fk_app01_publish_id` FOREIGN KEY (`publish_id`) REFERENCES `app01_publish` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_book`
--

LOCK TABLES `app01_book` WRITE;
/*!40000 ALTER TABLE `app01_book` DISABLE KEYS */;
INSERT INTO `app01_book` VALUES (1,'华山剑法',99.99,'2019-04-08',1),(5,'爆笑宠妃2',999.99,'2019-04-15',1);
/*!40000 ALTER TABLE `app01_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_book_authors`
--

DROP TABLE IF EXISTS `app01_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_book_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_book_authors_book_id_author_id_36f1e11a_uniq` (`book_id`,`author_id`),
  KEY `app01_book_authors_author_id_5acae95a_fk_app01_author_id` (`author_id`),
  CONSTRAINT `app01_book_authors_author_id_5acae95a_fk_app01_author_id` FOREIGN KEY (`author_id`) REFERENCES `app01_author` (`id`),
  CONSTRAINT `app01_book_authors_book_id_19c7077f_fk_app01_book_id` FOREIGN KEY (`book_id`) REFERENCES `app01_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_book_authors`
--

LOCK TABLES `app01_book_authors` WRITE;
/*!40000 ALTER TABLE `app01_book_authors` DISABLE KEYS */;
INSERT INTO `app01_book_authors` VALUES (5,1,1),(7,5,2);
/*!40000 ALTER TABLE `app01_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_publish`
--

DROP TABLE IF EXISTS `app01_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_publish`
--

LOCK TABLES `app01_publish` WRITE;
/*!40000 ALTER TABLE `app01_publish` DISABLE KEYS */;
INSERT INTO `app01_publish` VALUES (1,'华山出版社','华山','huashan@163.com'),(2,'明教出版社','明教','mingjiao@163.com');
/*!40000 ALTER TABLE `app01_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add author',7,'add_author'),(26,'Can change author',7,'change_author'),(27,'Can delete author',7,'delete_author'),(28,'Can view author',7,'view_author'),(29,'Can add author detail',8,'add_authordetail'),(30,'Can change author detail',8,'change_authordetail'),(31,'Can delete author detail',8,'delete_authordetail'),(32,'Can view author detail',8,'view_authordetail'),(33,'Can add book',9,'add_book'),(34,'Can change book',9,'change_book'),(35,'Can delete book',9,'delete_book'),(36,'Can view book',9,'view_book'),(37,'Can add publish',10,'add_publish'),(38,'Can change publish',10,'change_publish'),(39,'Can delete publish',10,'delete_publish'),(40,'Can view publish',10,'view_publish'),(41,'Can add user info',11,'add_userinfo'),(42,'Can change user info',11,'change_userinfo'),(43,'Can delete user info',11,'delete_userinfo'),(44,'Can view user info',11,'view_userinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$wGQAO5QB2Olt$zkEkVmP0k/i8aauw4vKqN5wQJjGuwsuvS0qwd3V/uaU=','2019-04-26 09:55:14.631736',0,'root','','','',0,1,'2019-04-02 00:34:32.887817'),(2,'pbkdf2_sha256$120000$WeYPdh3K4SiC$mKlQACeZWF3E8wReownlwf4uukrtdMYyqq4lNWqxbZo=','2019-04-15 14:50:38.420436',0,'ironman','','','',0,1,'2019-04-08 01:57:00.255749'),(3,'pbkdf2_sha256$120000$swR0CFlI6P5f$smonhtDetDRecwUAE86acaUFGASrH+/Edb1VCoi97Ss=','2019-04-08 14:09:25.439749',0,'ironman1','','','',0,1,'2019-04-08 14:09:25.142768'),(4,'pbkdf2_sha256$120000$NClcb8B8x0Il$+I7kgbI0DQ2a33jOqlf6/ydvSA6dlimZxuVuaGpoLLo=','2019-04-26 07:28:43.451079',0,'xiaolong','','','',0,1,'2019-04-26 07:27:59.371894'),(5,'pbkdf2_sha256$120000$tgC6zIrZniQS$usSznVcJKlL2+BQAuYLE9RBXsfNpzhvmKKUX677O5HI=','2019-04-26 08:02:02.158468',0,'admin','','','',0,1,'2019-04-26 07:28:53.440130'),(6,'pbkdf2_sha256$120000$UbHYLE4r5v67$tZx7ffyy0rwTRE5g7K/nX6d9vSLeCmbQ2mVNAcSVdms=','2019-04-26 07:44:55.848294',0,'tianyi','','','',0,1,'2019-04-26 07:44:55.722408');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app01','author'),(8,'app01','authordetail'),(9,'app01','book'),(10,'app01','publish'),(11,'app01','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-31 10:03:28.208190'),(2,'auth','0001_initial','2019-03-31 10:03:29.456108'),(3,'admin','0001_initial','2019-03-31 10:03:29.789089'),(4,'admin','0002_logentry_remove_auto_add','2019-03-31 10:03:29.812086'),(5,'admin','0003_logentry_add_action_flag_choices','2019-03-31 10:03:29.834084'),(6,'app01','0001_initial','2019-03-31 10:03:30.837022'),(7,'contenttypes','0002_remove_content_type_name','2019-03-31 10:03:31.067006'),(8,'auth','0002_alter_permission_name_max_length','2019-03-31 10:03:31.206999'),(9,'auth','0003_alter_user_email_max_length','2019-03-31 10:03:31.641974'),(10,'auth','0004_alter_user_username_opts','2019-03-31 10:03:31.668966'),(11,'auth','0005_alter_user_last_login_null','2019-03-31 10:03:31.785959'),(12,'auth','0006_require_contenttypes_0002','2019-03-31 10:03:31.794959'),(13,'auth','0007_alter_validators_add_error_messages','2019-03-31 10:03:31.819959'),(14,'auth','0008_alter_user_username_max_length','2019-03-31 10:03:31.905952'),(15,'auth','0009_alter_user_last_name_max_length','2019-03-31 10:03:32.018945'),(16,'sessions','0001_initial','2019-03-31 10:03:32.106942'),(17,'app01','0002_delete_userinfo','2019-04-08 14:10:43.311983');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0jjpve0un64qogt22vd6nfwhx9u9br5f','OWRhYWQxNmIwYjgzZjEwMTk5MGVlZjI4YzdlZjIxNDRmZjdmNzIwMzp7ImtlZXAiOiI2MjY0OCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMzQyY2RiYWQ1ZTM4NDM3ZTJjNmZjN2ExNmVmNGQwMDg0NjIzOTUzIn0=','2019-04-29 14:28:23.450547'),('0uy5tp07bdfokgy9qo1hshqz4gsgio24','NTFlMzQ4NGFlMjI5ZjdlODNlMjlkZGNlMzE0MWZhOGEyYzgyYjMyNzp7ImtlZXAiOiJnR290VSJ9','2019-05-10 07:30:24.959727'),('0vzp3jmtuzd3m79ap4qhhz2qbviisy5j','YWZjOTBjZWQ4YzU4OWViODUwMmNiOTk0MWQxNTcyMWUyMGY3NzNhZjp7ImtlZXAiOiJqQlA4MyJ9','2019-05-10 07:29:32.478382'),('1rihejmaq8sbo8wwzr8iapll6wlhb52q','Yzg0OTNjNzk1YWIxYTJhYjJmNGM3NDFmMTFmMDVhMGEyYTVkMjY4Mjp7ImtlZXAiOiJJOHFrMyIsImlzX2xvZ2luIjp0cnVlLCJ1c3IiOiJyb290In0=','2019-04-17 13:59:07.570674'),('2n35tdrq7d1wwcu9yyzce4p0p5619753','NTRkYmYwYzZjZmNlMWUxOGQ3YzYzZDNhYjkwNzJiZGRiNzczZTYzNDp7ImtlZXAiOiJDMm42ciJ9','2019-05-02 15:33:16.118864'),('2ys0psr8kkgp8b2cqjzunf9luts18xpe','NTM5MzU0NmEyMThmNTdjYTFmYTMwYjJkNzUxZTFiNjNmMjc1MDhlNDp7ImtlZXAiOiI2NTU4WiIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ODhlNGE3ZmJhOTllOTY0ZmEyZDI5MDVhZWJiNTZkOGYyNjllZmNkIn0=','2019-05-10 07:44:55.853316'),('30h9v0tsphfw8zn905sm1qq3sd8jhrcq','MWIzYmE1MGI1MmFmNWU1NzdlZWE5MjAzYmM3OTFmN2U4NjQxYzc5Mjp7ImtlZXAiOiJiNXZ2ZyJ9','2019-05-04 00:57:13.855011'),('3jridmx78hrni45h5mfx98xjce4pqj3j','M2EwZDE2MGI4YjBhNGQ2MmVhOTJlZGUxZjI4YzFiMjkyZDA2N2NiYzp7ImtlZXAiOiI5NDhiNyJ9','2019-04-29 14:48:24.854525'),('3vy3kyc5cbnz3q3mfomjojrslp755svw','ZDZlYjdkOTYyZmJhYmU3MmI2Mjg3ZjkwMDM1YmQ0MzRmYzUxZjUzZjp7ImtlZXAiOiI2UWplOSJ9','2019-05-10 07:11:53.975242'),('4buzddxyqswo1l9xtw3symjtng9m14yg','YmI5MzJmNTAzNDQ4ZGIzNDUzMzdiMWUyYjc0NmFiOTIwNzY4M2RkZTp7ImtlZXAiOiJvbW1uNCIsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzM4ZmIzOTg3Y2M0YWI4ZWQzM2Q5OTY0NTU0YWEwOTFkNmE5N2ZiIn0=','2019-05-10 08:02:02.164984'),('55fgb73tci91bltiw11vi003hm1h3a40','MDkyMDVlYzljM2IxNDZiODFiMzFjNjIwMmE1NmZmOTNjYjFjZjdiMzp7ImtlZXAiOiI4cjIySyJ9','2019-05-10 07:30:39.986121'),('5emcxnqdc52svtzppb0n2lbqeijurduq','NTgyODAyMjQ2NTY4NTNjYzY3YmNhZWM2YzA1NDY2ZTAyMWM3NTdhMjp7ImtlZXAiOiI4Z0d3OCJ9','2019-05-08 00:14:58.479503'),('67b30ibgio305l1tzful81yg2a8pog5o','MDE5Y2Y5YzNmYTcxMzljY2ZhMjJjNDg5NjgzNDE3OTJkMjIyMzRlODp7ImtlZXAiOiJrZjJBOCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 07:22:41.910832'),('6e011ufblif2qwftqiv3n1mmhgxi28co','ODkzMDNiNzgwNTExMWIwYmE0NzNiOWJmMzQ1NzgxY2QwNzMxZmUwZjp7ImtlZXAiOiJjMjllNyJ9','2019-05-10 07:13:34.209338'),('6g28kp5wtv5iqoi8m8mv0p7d6v1d8iyo','MzAxOTI2MTY2MDk0OWQyYWU0NzU1YTU4ZDk5NTI1ZDZiZDA0MWRlMzp7ImtlZXAiOiJMdWFLMiJ9','2019-04-29 14:52:48.287675'),('6vhcy0mnyoqd9bnwcix03cpwhbz0d8eq','Yjg2Mjc1M2MwODJmM2FmNjlkYzczOTIxODBkZjY0Y2UyZWY1MzU4MDp7ImtlZXAiOiI2OThnMyJ9','2019-05-10 10:55:21.730139'),('8qo3tn5amji8opx8046c7mcq5zneccd5','ZDIyZjVkZjk5OGE2NjQ2YjgwZWUxYjRhZGQ5YWExMzgyN2QwZGZhMDp7ImtlZXAiOiI0QkJQdCJ9','2019-05-10 07:17:07.974321'),('axqs3yqm6ho01gw01wb4hl69sed9gmwc','YmUxZWRkMzFlN2JjMTkzZDI1ODM1NmVjMDJjODFkYWQzM2FkYWY5Nzp7ImtlZXAiOiJIUHhGNiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 07:14:30.293254'),('bejbb3hyqam1djqvyh78ddr4olod2e6z','YmU1MDI0YzAyY2Y2ZGM4OGFjNDQzOGFjNzY2ZWE4ZTllMjQ5OTlhYzp7ImtlZXAiOiJhVjg2OSJ9','2019-05-10 00:23:40.044751'),('da44cdn58tqmfqpfn466j6tlu7v6o1ej','YmY1MDBkMDdiYjc0YzNlYWY0NDhmNWQyZDgyMDRhMDM2OWIyZWY2MDp7ImtlZXAiOiI0TW1QMyIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMzQyY2RiYWQ1ZTM4NDM3ZTJjNmZjN2ExNmVmNGQwMDg0NjIzOTUzIn0=','2019-04-29 14:44:09.823117'),('dq09lqia87wrnp51qo45ku5y09m8p4r8','YmQwMTQ4ZjE0YjIxZWMzZGVhMTMyNDkzZjU2YmY5NGVjODM2ZjhiYjp7ImtlZXAiOiI3NWkyNiJ9','2019-04-14 10:20:54.138909'),('f6bv8jvr162jdg5th2zh2eqhu8z9l7lb','NDA5ZTM0Mjc5MjYyZmQwMzcyODhiZWFlOTQzMjY2NDA5NDExZjE4OTp7ImtlZXAiOiJPSjNvNSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 07:24:04.649245'),('fmeiz7xboekrxiiz7ng903td62ml2ps4','NWI5YmVjZWJhMDYzNTg3ODA4NTFkMmRhYzFmYWI2YWY2ZWNkODVjZDp7ImtlZXAiOiJoblJOOSJ9','2019-04-29 18:01:52.889562'),('g1vdpzadlea4cj0lly6p3kdzhm3pbvqu','Yzc2Yjg4ZDU1NmQyMDZmNjgzMDM4MmE4OThmMDJiNzQ2YzgxMjQ3Njp7ImtlZXAiOiI1R082VSJ9','2019-04-14 10:27:23.361038'),('g1w7okea24lbkrc4t5ft3pg7jx3nxz3o','YzI0NjMxNzkwMjFkNmU0ZTJlYjIwOTdiMGNmNTNiMDEyOWNmNjhmZDp7ImtlZXAiOiJyWXd1VSJ9','2019-04-29 15:47:33.923589'),('gcacpb8hxqc687hj7xge21lgejhiwt05','OTAxYzA0MzExOGE2YWJmYjc3YjI3NTJlOTU4ODQ3NjkzOTRhMmIyNTp7ImtlZXAiOiJXa2lyOSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYjk5ZmExZTZjMTQ5OGRkNDBmNDJiNWY0NTRmMmE0ODI3MTkzOWFlIn0=','2019-04-22 14:27:28.946432'),('hx7k8w92tigls0ztee9v3kvro6ufu9le','NWFmZTg1NmE0ZTZlNzEzMDAyM2ZlYjk5YTdhMTkzYjVlNjQ4NjFjZTp7ImtlZXAiOiI5eVVLNSJ9','2019-05-02 07:45:55.487800'),('i27cmflm7sjkxxbct8z5ya69uvwebz14','YjVlZmE2ZWViMDFiZmVlZDhiYWVhZWUwMDliZTNlNjBhOWE3Y2YzODp7ImtlZXAiOiJlMmpzQSJ9','2019-04-14 10:16:07.119036'),('i6bn0atudt2krvyf66zjljrkgfiejzf1','NWI0ZTM2MDM0ODk5ZmEzODNhOTMzMjExZjgxY2VlMTM1NGZjZTE3OTp7ImtlZXAiOiJqOVpCNCJ9','2019-04-29 16:56:04.862515'),('if9kyf3ecys6z6c9abhn558y6cceczwu','MTcyNDhjMjg1NDRhY2RkZGFhMzgxZDkwMDAxMjQ1MzY1MjA3YTM5Mzp7ImtlZXAiOiI3elE1NCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 07:10:31.221119'),('innb6rz92nwpmvz6ffwjfgiojct4beb6','MjBmY2ZiMTc5Y2IyZDBjNzExZGIyYWZiNGQ1MzIzN2U4MDg4MGIyZDp7ImtlZXAiOiJBZ3ZBNSJ9','2019-04-29 14:27:00.575614'),('j9p0c9elg18pxy97fw5hwrxlfo1k3d5m','ZDQ0ZWFhODc1MTViMzNlY2QyNGRkMjdkNzQ3OTgyMTRkNGIyM2U3Nzp7ImtlZXAiOiJpanQ3NiJ9','2019-04-29 16:04:55.259703'),('jh1wrm1i39iob62hn8k3wgdh330jmmrq','YTkxMjRiMDlkYmE2MTRkOTYzMTFhYjA5YWNiZWVjOGZjMTMxYjRjYjp7ImtlZXAiOiIzREZBQSJ9','2019-04-29 19:53:44.003145'),('jradvidevpvo9dbexzqd9x2hvajk5zbj','MjIxMjg1Y2I4MDFiYWRiN2FhMzA4YjEzZTgxMWRjNDlkOWUxYjFhNzp7ImtlZXAiOiJDQlc1cyJ9','2019-05-10 07:16:51.686504'),('lep763xf904pnh1y22n92n9u2wld51q0','Nzc1ZmQ4NDJhYmY0OWE3NzA2ZmRiZWI1YmE5YzZmZjY2Mjc2OWIwYzp7ImtlZXAiOiJwOTQ2UyIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNjhlYjA3NjUzYTEzODlkMDVhNzlkZmExZDUwNjk1YmUxMjA2Y2RlIn0=','2019-05-10 07:28:43.456732'),('mfue0sshbkkgvdrp87wfd9m3bow8vsm2','NGYzZTY1MmFhMjljMWZjODI3ZjFhOTk1NDc2NzY0MjhmY2Y3ZGIwMTp7ImtlZXAiOiI0TUdTTyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 09:55:14.636941'),('mpwpp7zdz4scadu2voodcc8cs3jbtzsb','ZDRlMjRjMTA2NzY1YThlMmZlOGZmZGQzMzEyNTkyYWIwNmNmMjY1Yjp7ImtlZXAiOiI5bWIyQSJ9','2019-05-10 11:00:22.954002'),('o00q1hva3x91jgvmgl89ulz3yn82tzjq','MDA0N2IxZjAzZDVjMWJmYTk3M2I3ZmIzYThlMzFkNjdhYmJjZTBmYTp7ImtlZXAiOiJKdmc3MiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 07:23:44.135026'),('o4fiig85c48ll94lpi115drea1y9ujue','OGY3YTU2MmZhMTEwNGMyNDM0MGY3NmYwNWM5YzIxNzBiNWExMWY4Yzp7ImtlZXAiOiJFOUxEUiJ9','2019-04-30 01:41:36.934625'),('oajmz40smlxepz2wvl9erz0102rvnni6','ZWUxN2ZiNGZmNDljMjRkNzA0NzliYjdjYmI1YTE5MmJiZTNhNGRkMzp7ImtlZXAiOiJzakUzRiJ9','2019-05-10 07:16:05.951703'),('p2350kcq1vzcajev3degxcrr4pxc7z67','OWRiZDkzODc3YmFmMDk5NzhhYWYzZWJlNDdiNDYyMGM5NzE2NzlkYTp7ImtlZXAiOiI1MzM2eCIsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzM4ZmIzOTg3Y2M0YWI4ZWQzM2Q5OTY0NTU0YWEwOTFkNmE5N2ZiIn0=','2019-05-10 07:28:53.576394'),('pd02aiebk9lpfnf42x7ctjgqkrb0gogi','OTVhNmZiOWNhZTAzN2Y0ZWQzMmYwMjU1MjMyNTE0YTBjMzFjNjUwMzp7ImtlZXAiOiJjOTZzMiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-10 07:11:37.593808'),('q8wczspjh31bvxzjy8icgdafzrgc7fz0','N2IyYTE4NDI0NzE4NTA5MzQ0ZGI1MzY1NzQwYWU1MTI2YWY5Yzg1Nzp7ImtlZXAiOiJKWXV2QSJ9','2019-04-17 02:04:07.520230'),('rkhc4venpme9mylpeudnafztjj0znkql','MGZhYjIyNjhkNDk2OWFiYjc3YzMyMzEwZDc5ZWQ2MDQ2ZmZlZWVmNTp7ImtlZXAiOiJQN3BzcSJ9','2019-04-29 14:52:11.598951'),('s7noq6qt976lr641e1gy54dldmt29yp8','ODkwM2RiOTYxYjE3ODQzZTQ5MDAwYzVmN2E0OTk5ZmMxYjI0ZjRmNTp7ImtlZXAiOiI4NUFqMiJ9','2019-05-08 14:40:08.508923'),('t4u5va17n4b6luz7dttnhb1tr6cundar','YzcxZDU4MjY0NTUwMGQxYzhkMWMwYzE4MmU4Y2FhNDQxNDg5YmFmYTp7ImtlZXAiOiI0T043ciJ9','2019-05-08 08:47:24.907194'),('tb4a0ynr0mig34a8lvokhzge2e3m4xmp','NzRkYTc3ZDMxMjFjNDdkNDVhZjY3NjhjOTZiMWE4YjY3MDAwYTE4Yjp7ImtlZXAiOiJyNzgzVCJ9','2019-04-29 11:34:08.066461'),('vcjgwvapaym825ip3k37ggo6vplxsdsx','YTlhNDk3OTEwODRiYjUwODIyZTRlOTU1MDQzY2JhOGNiMzAyOGJiYTp7ImtlZXAiOiJSQWxJQiJ9','2019-05-10 08:09:47.140711'),('wc78tc8hibb7f34zukg8ijawau8xtn33','MjAzYmVjZWZkMWE1MzBjZmQzZDc5MTY2MDU5ZmRmMmUyMmExNWVlNjp7ImtlZXAiOiJWOHdQRCJ9','2019-04-29 15:40:40.850931'),('woygsf03vvm19va6shgefvm8n6zaqte9','NGYwZWQ5NjdjMzhkOGRlNjllMDlhZjY2ZmQ3NzgwZWU1ZWRiZmE3Yzp7ImtlZXAiOiI3cXUyNyJ9','2019-05-02 07:43:50.043253'),('wuq3pwd5ci8qxygtmwmp655rld4vz7g2','NzZhM2YwZGVmYWEzZGY1Y2U3MDAxYTliMjMyYzM4MGU2NGVhM2IxNTp7ImtlZXAiOiJGV1hFaSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjA0OTFhNDk3YTMyZTI2ODFiYTg5OTgyODk0OTcxNWIwNWVmNWVlIn0=','2019-05-02 15:34:02.238373'),('x7oxzy4b54ig463w3y55tzoventymruh','ODM1YjhkMmI0NDM5NDNlN2FiYjg4MTZjMTdjMzIwMzhiYTNkZmQ4ZDp7ImtlZXAiOiI0azNDYSJ9','2019-05-02 23:54:38.450349'),('xah45cjbaj7xksh4rhac2ly25x6e5gfe','Nzk0YjBkNDNiODA2MDVlYzRhZDU2NjRlYjM1MjA2OGI2YzY4Nzc4NDp7ImtlZXAiOiJIRk5ESSJ9','2019-05-10 07:30:08.335925'),('xbs1kbajmavjdfjct2w84nylb8sqlmsu','MjJkZmQyNzgyN2E0ZjhlZjIwMWFiMzBjMDZmMjgwNWE4NmIyYjdhNjp7ImtlZXAiOiJPNDlVaCJ9','2019-05-10 14:45:47.459776'),('ysbfs3e6hrmwdskmf2affh2ytqjqvwnr','NjI3YWVjYjJjZjdmYTBiYjM2ODZhN2VjNjFjYjYwYzdkNTM3ZjJhZjp7ImtlZXAiOiJ3TXJ5ZyJ9','2019-04-29 17:13:46.745206'),('z7p0q3qtgq5mv2m9jiqudro0idb9k4mi','N2ZiOGY5YTJjMjNkNDZmNjdiNzU1YjU1ZmQwMjkzMzNkYWI0ZjYwNjp7ImtlZXAiOiJSOGNNaSJ9','2019-04-29 13:47:51.818598'),('zsno2q33vl3jegudga8slrkv3jh0ui14','YWMwMmM3OTFmNjYyNGZhMzFhMDE5ZDMwNjc0ZTcwZTBkOWExYzc5NDp7ImtlZXAiOiI5YXJidSJ9','2019-05-08 11:29:32.144412'),('ztp69c2cshwfbc63doi848iea6eh7p56','NTE5ZTY3NTA2ODZjMzBiZTU0MjgwYmZjYTlmODJkNjVlNWQ5OTIzODp7ImtlZXAiOiI5elIzNCJ9','2019-05-10 07:15:53.266545');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-26  0:51:47
