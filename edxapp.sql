-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: edxapp
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Current Database: `edxapp`
--

/*!40000 DROP DATABASE IF EXISTS `edxapp`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `edxapp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `edxapp`;

--
-- Table structure for table `agreements_integritysignature`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreements_integritysignature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agreements_integritysignature_user_id_course_key_80bb4165_uniq` (`user_id`,`course_key`),
  KEY `agreements_integritysignature_course_key_0536c1fa` (`course_key`),
  CONSTRAINT `agreements_integritysignature_user_id_a4d26f65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreements_integritysignature`
--

LOCK TABLES `agreements_integritysignature` WRITE;
/*!40000 ALTER TABLE `agreements_integritysignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `agreements_integritysignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_announcement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_announcement`
--

LOCK TABLES `announcements_announcement` WRITE;
/*!40000 ALTER TABLE `announcements_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_admin_apiaccessconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_admin_apiaccessconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_admin_apiaccessconfig_changed_by_id_d2f4cd88_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `api_admin_apiaccessconfig_changed_by_id_d2f4cd88_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_admin_apiaccessconfig`
--

LOCK TABLES `api_admin_apiaccessconfig` WRITE;
/*!40000 ALTER TABLE `api_admin_apiaccessconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_admin_apiaccessconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_admin_apiaccessrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_admin_apiaccessrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `website` varchar(200) NOT NULL,
  `reason` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `contacted` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_admin_apiaccessrequest_user_id_eb0cc217_uniq` (`user_id`),
  KEY `api_admin_apiaccessrequest_status_f8039aea` (`status`),
  KEY `api_admin_apiaccessrequest_site_id_b78f5161_fk_django_site_id` (`site_id`),
  CONSTRAINT `api_admin_apiaccessrequest_site_id_b78f5161_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `api_admin_apiaccessrequest_user_id_eb0cc217_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_admin_apiaccessrequest`
--

LOCK TABLES `api_admin_apiaccessrequest` WRITE;
/*!40000 ALTER TABLE `api_admin_apiaccessrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_admin_apiaccessrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `scored_at` datetime(6) NOT NULL,
  `scorer_id` varchar(40) NOT NULL,
  `score_type` varchar(2) NOT NULL,
  `feedback` longtext NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessment_rubric_id_2ed0d5db_fk_assessment_rubric_id` (`rubric_id`),
  KEY `assessment_assessment_submission_uuid_cf5817c5` (`submission_uuid`),
  KEY `assessment_assessment_scored_at_a1a213d6` (`scored_at`),
  KEY `assessment_assessment_scorer_id_ad1a38cb` (`scorer_id`),
  CONSTRAINT `assessment_assessment_rubric_id_2ed0d5db_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessment`
--

LOCK TABLES `assessment_assessment` WRITE;
/*!40000 ALTER TABLE `assessment_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `feedback_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback`
--

LOCK TABLES `assessment_assessmentfeedback` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback_assessments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback_assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentfeedback_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_assessmentfee_assessmentfeedback_id_as_f8246578_uniq` (`assessmentfeedback_id`,`assessment_id`),
  KEY `assessment_assessmen_assessment_id_033f1121_fk_assessmen` (`assessment_id`),
  CONSTRAINT `assessment_assessmen_assessment_id_033f1121_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_assessmen_assessmentfeedback_i_6634a3b4_fk_assessmen` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback_assessments`
--

LOCK TABLES `assessment_assessmentfeedback_assessments` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback_options`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentfeedback_id` int(11) NOT NULL,
  `assessmentfeedbackoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_assessmentfee_assessmentfeedback_id_as_4e554cc7_uniq` (`assessmentfeedback_id`,`assessmentfeedbackoption_id`),
  KEY `assessment_assessmen_assessmentfeedbackop_a9af45f6_fk_assessmen` (`assessmentfeedbackoption_id`),
  CONSTRAINT `assessment_assessmen_assessmentfeedback_i_004e1bf0_fk_assessmen` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`),
  CONSTRAINT `assessment_assessmen_assessmentfeedbackop_a9af45f6_fk_assessmen` FOREIGN KEY (`assessmentfeedbackoption_id`) REFERENCES `assessment_assessmentfeedbackoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback_options`
--

LOCK TABLES `assessment_assessmentfeedback_options` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedbackoption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedbackoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedbackoption`
--

LOCK TABLES `assessment_assessmentfeedbackoption` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedbackoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedbackoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentpart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentpart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessmen_criterion_id_5bc40925_fk_assessmen` (`criterion_id`),
  KEY `assessment_assessmen_option_id_dd35c2c5_fk_assessmen` (`option_id`),
  KEY `assessment_assessmen_assessment_id_de1999cd_fk_assessmen` (`assessment_id`),
  CONSTRAINT `assessment_assessmen_assessment_id_de1999cd_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_assessmen_criterion_id_5bc40925_fk_assessmen` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`),
  CONSTRAINT `assessment_assessmen_option_id_dd35c2c5_fk_assessmen` FOREIGN KEY (`option_id`) REFERENCES `assessment_criterionoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentpart`
--

LOCK TABLES `assessment_assessmentpart` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criterion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_criterion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `prompt` longtext NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_criterion_rubric_id_fe236962_fk_assessment_rubric_id` (`rubric_id`),
  CONSTRAINT `assessment_criterion_rubric_id_fe236962_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterion`
--

LOCK TABLES `assessment_criterion` WRITE;
/*!40000 ALTER TABLE `assessment_criterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criterionoption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_criterionoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `explanation` longtext NOT NULL,
  `criterion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_criterion_criterion_id_53928be7_fk_assessmen` (`criterion_id`),
  CONSTRAINT `assessment_criterion_criterion_id_53928be7_fk_assessmen` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterionoption`
--

LOCK TABLES `assessment_criterionoption` WRITE;
/*!40000 ALTER TABLE `assessment_criterionoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_criterionoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_historicalsharedfileupload`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_historicalsharedfileupload` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `owner_id` varchar(255) NOT NULL,
  `file_key` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `size` bigint(20) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `assessment_historica_history_user_id_28fa87d9_fk_auth_user` (`history_user_id`),
  KEY `assessment_historicalsharedfileupload_id_34052991` (`id`),
  KEY `assessment_historicalsharedfileupload_team_id_e32268e1` (`team_id`),
  KEY `assessment_historicalsharedfileupload_course_id_7fd70b9d` (`course_id`),
  KEY `assessment_historicalsharedfileupload_item_id_b7bca199` (`item_id`),
  KEY `assessment_historicalsharedfileupload_owner_id_09b09e30` (`owner_id`),
  KEY `assessment_historicalsharedfileupload_file_key_03fbd3e7` (`file_key`),
  CONSTRAINT `assessment_historica_history_user_id_28fa87d9_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_historicalsharedfileupload`
--

LOCK TABLES `assessment_historicalsharedfileupload` WRITE;
/*!40000 ALTER TABLE `assessment_historicalsharedfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_historicalsharedfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_peerworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_peerworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `grading_completed_at` datetime(6) DEFAULT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_peerworkflow_student_id_9382ae54` (`student_id`),
  KEY `assessment_peerworkflow_item_id_c17d799e` (`item_id`),
  KEY `assessment_peerworkflow_course_id_875599e3` (`course_id`),
  KEY `assessment_peerworkflow_created_at_b8aaf4a5` (`created_at`),
  KEY `assessment_peerworkflow_completed_at_681f19e1` (`completed_at`),
  KEY `assessment_peerworkflow_grading_completed_at_33e2560c` (`grading_completed_at`),
  KEY `assessment_peerworkflow_cancelled_at_0e258929` (`cancelled_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_peerworkflow`
--

LOCK TABLES `assessment_peerworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_peerworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_peerworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_peerworkflowitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_peerworkflowitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `scored` tinyint(1) NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `scorer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_peerworkf_assessment_id_27f9ef1f_fk_assessmen` (`assessment_id`),
  KEY `assessment_peerworkf_author_id_0e3ed804_fk_assessmen` (`author_id`),
  KEY `assessment_peerworkf_scorer_id_27e47cd4_fk_assessmen` (`scorer_id`),
  KEY `assessment_peerworkflowitem_submission_uuid_edd446aa` (`submission_uuid`),
  KEY `assessment_peerworkflowitem_started_at_8644e7a0` (`started_at`),
  CONSTRAINT `assessment_peerworkf_assessment_id_27f9ef1f_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_peerworkf_author_id_0e3ed804_fk_assessmen` FOREIGN KEY (`author_id`) REFERENCES `assessment_peerworkflow` (`id`),
  CONSTRAINT `assessment_peerworkf_scorer_id_27e47cd4_fk_assessmen` FOREIGN KEY (`scorer_id`) REFERENCES `assessment_peerworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_peerworkflowitem`
--

LOCK TABLES `assessment_peerworkflowitem` WRITE;
/*!40000 ALTER TABLE `assessment_peerworkflowitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_peerworkflowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_rubric`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_rubric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_hash` varchar(40) NOT NULL,
  `structure_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_hash` (`content_hash`),
  KEY `assessment_rubric_structure_hash_fb456373` (`structure_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_rubric`
--

LOCK TABLES `assessment_rubric` WRITE;
/*!40000 ALTER TABLE `assessment_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_sharedfileupload`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_sharedfileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `owner_id` varchar(255) NOT NULL,
  `file_key` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `size` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_key` (`file_key`),
  KEY `assessment_sharedfileupload_team_id_dbdd3cb7` (`team_id`),
  KEY `assessment_sharedfileupload_course_id_73edb775` (`course_id`),
  KEY `assessment_sharedfileupload_item_id_b471d0c9` (`item_id`),
  KEY `assessment_sharedfileupload_owner_id_f4d7fe4f` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_sharedfileupload`
--

LOCK TABLES `assessment_sharedfileupload` WRITE;
/*!40000 ALTER TABLE `assessment_sharedfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_sharedfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_staffworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_staffworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorer_id` varchar(40) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `grading_completed_at` datetime(6) DEFAULT NULL,
  `grading_started_at` datetime(6) DEFAULT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  `assessment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_staffworkflow_scorer_id_ae799ebc` (`scorer_id`),
  KEY `assessment_staffworkflow_course_id_3f18693d` (`course_id`),
  KEY `assessment_staffworkflow_item_id_4fa3697b` (`item_id`),
  KEY `assessment_staffworkflow_created_at_a253bc02` (`created_at`),
  KEY `assessment_staffworkflow_grading_completed_at_acd0199f` (`grading_completed_at`),
  KEY `assessment_staffworkflow_grading_started_at_90f99005` (`grading_started_at`),
  KEY `assessment_staffworkflow_cancelled_at_bc8f93d5` (`cancelled_at`),
  KEY `assessment_staffworkflow_assessment_7c1dcc5d` (`assessment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_staffworkflow`
--

LOCK TABLES `assessment_staffworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_staffworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_staffworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_studenttrainingworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_studenttrainingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_studenttrainingworkflow_student_id_ea8fdfa8` (`student_id`),
  KEY `assessment_studenttrainingworkflow_item_id_f5812a25` (`item_id`),
  KEY `assessment_studenttrainingworkflow_course_id_a14d6cde` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_studenttrainingworkflow`
--

LOCK TABLES `assessment_studenttrainingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_studenttrainingworkflowitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_studenttrainingworkflowitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(10) unsigned NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `training_example_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_studenttraini_workflow_id_order_num_1ab60238_uniq` (`workflow_id`,`order_num`),
  KEY `assessment_studenttr_training_example_id_881dddbd_fk_assessmen` (`training_example_id`),
  CONSTRAINT `assessment_studenttr_training_example_id_881dddbd_fk_assessmen` FOREIGN KEY (`training_example_id`) REFERENCES `assessment_trainingexample` (`id`),
  CONSTRAINT `assessment_studenttr_workflow_id_a75a9a2e_fk_assessmen` FOREIGN KEY (`workflow_id`) REFERENCES `assessment_studenttrainingworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_studenttrainingworkflowitem`
--

LOCK TABLES `assessment_studenttrainingworkflowitem` WRITE;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflowitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_teamstaffworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_teamstaffworkflow` (
  `staffworkflow_ptr_id` int(11) NOT NULL,
  `team_submission_uuid` varchar(128) NOT NULL,
  PRIMARY KEY (`staffworkflow_ptr_id`),
  UNIQUE KEY `team_submission_uuid` (`team_submission_uuid`),
  CONSTRAINT `assessment_teamstaff_staffworkflow_ptr_id_e55a780c_fk_assessmen` FOREIGN KEY (`staffworkflow_ptr_id`) REFERENCES `assessment_staffworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_teamstaffworkflow`
--

LOCK TABLES `assessment_teamstaffworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_teamstaffworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_teamstaffworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_trainingexample`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_trainingexample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_answer` longtext NOT NULL,
  `content_hash` varchar(40) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_hash` (`content_hash`),
  KEY `assessment_traininge_rubric_id_cfb4afc3_fk_assessmen` (`rubric_id`),
  CONSTRAINT `assessment_traininge_rubric_id_cfb4afc3_fk_assessmen` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_trainingexample`
--

LOCK TABLES `assessment_trainingexample` WRITE;
/*!40000 ALTER TABLE `assessment_trainingexample` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_trainingexample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_trainingexample_options_selected`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_trainingexample_options_selected` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainingexample_id` int(11) NOT NULL,
  `criterionoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_trainingexamp_trainingexample_id_crite_4b6b8b90_uniq` (`trainingexample_id`,`criterionoption_id`),
  KEY `assessment_traininge_criterionoption_id_de6716f1_fk_assessmen` (`criterionoption_id`),
  CONSTRAINT `assessment_traininge_criterionoption_id_de6716f1_fk_assessmen` FOREIGN KEY (`criterionoption_id`) REFERENCES `assessment_criterionoption` (`id`),
  CONSTRAINT `assessment_traininge_trainingexample_id_7a04b572_fk_assessmen` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_trainingexample_options_selected`
--

LOCK TABLES `assessment_trainingexample_options_selected` WRITE;
/*!40000 ALTER TABLE `assessment_trainingexample_options_selected` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_trainingexample_options_selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_accountrecovery`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_accountrecovery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secondary_email` varchar(254) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `secondary_email` (`secondary_email`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_accountrecovery_user_id_0c61e73c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_accountrecovery`
--

LOCK TABLES `auth_accountrecovery` WRITE;
/*!40000 ALTER TABLE `auth_accountrecovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_accountrecovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'API Access Request Approvers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=1921 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',2,'add_permission'),(2,'Can change permission',2,'change_permission'),(3,'Can delete permission',2,'delete_permission'),(4,'Can view permission',2,'view_permission'),(5,'Can add group',3,'add_group'),(6,'Can change group',3,'change_group'),(7,'Can delete group',3,'delete_group'),(8,'Can view group',3,'view_group'),(9,'Can add user',4,'add_user'),(10,'Can change user',4,'change_user'),(11,'Can delete user',4,'delete_user'),(12,'Can view user',4,'view_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can view content type',5,'view_contenttype'),(17,'Can add redirect',6,'add_redirect'),(18,'Can change redirect',6,'change_redirect'),(19,'Can delete redirect',6,'delete_redirect'),(20,'Can view redirect',6,'view_redirect'),(21,'Can add session',7,'add_session'),(22,'Can change session',7,'change_session'),(23,'Can delete session',7,'delete_session'),(24,'Can view session',7,'view_session'),(25,'Can add site',8,'add_site'),(26,'Can change site',8,'change_site'),(27,'Can delete site',8,'delete_site'),(28,'Can view site',8,'view_site'),(29,'Can add task result',9,'add_taskresult'),(30,'Can change task result',9,'change_taskresult'),(31,'Can delete task result',9,'delete_taskresult'),(32,'Can view task result',9,'view_taskresult'),(33,'Can add chord counter',10,'add_chordcounter'),(34,'Can change chord counter',10,'change_chordcounter'),(35,'Can delete chord counter',10,'delete_chordcounter'),(36,'Can view chord counter',10,'view_chordcounter'),(37,'Can add group result',11,'add_groupresult'),(38,'Can change group result',11,'change_groupresult'),(39,'Can delete group result',11,'delete_groupresult'),(40,'Can view group result',11,'view_groupresult'),(41,'Can add Flag',12,'add_flag'),(42,'Can change Flag',12,'change_flag'),(43,'Can delete Flag',12,'delete_flag'),(44,'Can view Flag',12,'view_flag'),(45,'Can add Sample',13,'add_sample'),(46,'Can change Sample',13,'change_sample'),(47,'Can delete Sample',13,'delete_sample'),(48,'Can view Sample',13,'view_sample'),(49,'Can add Switch',14,'add_switch'),(50,'Can change Switch',14,'change_switch'),(51,'Can delete Switch',14,'delete_switch'),(52,'Can view Switch',14,'view_switch'),(53,'Can add course message',15,'add_coursemessage'),(54,'Can change course message',15,'change_coursemessage'),(55,'Can delete course message',15,'delete_coursemessage'),(56,'Can view course message',15,'view_coursemessage'),(57,'Can add global status message',16,'add_globalstatusmessage'),(58,'Can change global status message',16,'change_globalstatusmessage'),(59,'Can delete global status message',16,'delete_globalstatusmessage'),(60,'Can view global status message',16,'view_globalstatusmessage'),(61,'Can add asset base url config',17,'add_assetbaseurlconfig'),(62,'Can change asset base url config',17,'change_assetbaseurlconfig'),(63,'Can delete asset base url config',17,'delete_assetbaseurlconfig'),(64,'Can view asset base url config',17,'view_assetbaseurlconfig'),(65,'Can add asset excluded extensions config',18,'add_assetexcludedextensionsconfig'),(66,'Can change asset excluded extensions config',18,'change_assetexcludedextensionsconfig'),(67,'Can delete asset excluded extensions config',18,'delete_assetexcludedextensionsconfig'),(68,'Can view asset excluded extensions config',18,'view_assetexcludedextensionsconfig'),(69,'Can add course asset cache ttl config',19,'add_courseassetcachettlconfig'),(70,'Can change course asset cache ttl config',19,'change_courseassetcachettlconfig'),(71,'Can delete course asset cache ttl config',19,'delete_courseassetcachettlconfig'),(72,'Can view course asset cache ttl config',19,'view_courseassetcachettlconfig'),(73,'Can add cdn user agents config',20,'add_cdnuseragentsconfig'),(74,'Can change cdn user agents config',20,'change_cdnuseragentsconfig'),(75,'Can delete cdn user agents config',20,'delete_cdnuseragentsconfig'),(76,'Can view cdn user agents config',20,'view_cdnuseragentsconfig'),(77,'Can add site configuration',21,'add_siteconfiguration'),(78,'Can change site configuration',21,'change_siteconfiguration'),(79,'Can delete site configuration',21,'delete_siteconfiguration'),(80,'Can view site configuration',21,'view_siteconfiguration'),(81,'Can add site configuration history',22,'add_siteconfigurationhistory'),(82,'Can change site configuration history',22,'change_siteconfigurationhistory'),(83,'Can delete site configuration history',22,'delete_siteconfigurationhistory'),(84,'Can view site configuration history',22,'view_siteconfigurationhistory'),(85,'Can add course hls playback enabled flag',23,'add_coursehlsplaybackenabledflag'),(86,'Can change course hls playback enabled flag',23,'change_coursehlsplaybackenabledflag'),(87,'Can delete course hls playback enabled flag',23,'delete_coursehlsplaybackenabledflag'),(88,'Can view course hls playback enabled flag',23,'view_coursehlsplaybackenabledflag'),(89,'Can add hls playback enabled flag',24,'add_hlsplaybackenabledflag'),(90,'Can change hls playback enabled flag',24,'change_hlsplaybackenabledflag'),(91,'Can delete hls playback enabled flag',24,'delete_hlsplaybackenabledflag'),(92,'Can view hls playback enabled flag',24,'view_hlsplaybackenabledflag'),(93,'Can add course video transcript enabled flag',25,'add_coursevideotranscriptenabledflag'),(94,'Can change course video transcript enabled flag',25,'change_coursevideotranscriptenabledflag'),(95,'Can delete course video transcript enabled flag',25,'delete_coursevideotranscriptenabledflag'),(96,'Can view course video transcript enabled flag',25,'view_coursevideotranscriptenabledflag'),(97,'Can add video transcript enabled flag',26,'add_videotranscriptenabledflag'),(98,'Can change video transcript enabled flag',26,'change_videotranscriptenabledflag'),(99,'Can delete video transcript enabled flag',26,'delete_videotranscriptenabledflag'),(100,'Can view video transcript enabled flag',26,'view_videotranscriptenabledflag'),(101,'Can add transcript migration setting',27,'add_transcriptmigrationsetting'),(102,'Can change transcript migration setting',27,'change_transcriptmigrationsetting'),(103,'Can delete transcript migration setting',27,'delete_transcriptmigrationsetting'),(104,'Can view transcript migration setting',27,'view_transcriptmigrationsetting'),(105,'Can add migration enqueued course',28,'add_migrationenqueuedcourse'),(106,'Can change migration enqueued course',28,'change_migrationenqueuedcourse'),(107,'Can delete migration enqueued course',28,'delete_migrationenqueuedcourse'),(108,'Can view migration enqueued course',28,'view_migrationenqueuedcourse'),(109,'Can add updated course videos',29,'add_updatedcoursevideos'),(110,'Can change updated course videos',29,'change_updatedcoursevideos'),(111,'Can delete updated course videos',29,'delete_updatedcoursevideos'),(112,'Can view updated course videos',29,'view_updatedcoursevideos'),(113,'Can add video thumbnail setting',30,'add_videothumbnailsetting'),(114,'Can change video thumbnail setting',30,'change_videothumbnailsetting'),(115,'Can delete video thumbnail setting',30,'delete_videothumbnailsetting'),(116,'Can view video thumbnail setting',30,'view_videothumbnailsetting'),(117,'Can add course youtube blocked flag',31,'add_courseyoutubeblockedflag'),(118,'Can change course youtube blocked flag',31,'change_courseyoutubeblockedflag'),(119,'Can delete course youtube blocked flag',31,'delete_courseyoutubeblockedflag'),(120,'Can view course youtube blocked flag',31,'view_courseyoutubeblockedflag'),(121,'Can add course video uploads enabled by default',32,'add_coursevideouploadsenabledbydefault'),(122,'Can change course video uploads enabled by default',32,'change_coursevideouploadsenabledbydefault'),(123,'Can delete course video uploads enabled by default',32,'delete_coursevideouploadsenabledbydefault'),(124,'Can view course video uploads enabled by default',32,'view_coursevideouploadsenabledbydefault'),(125,'Can add video uploads enabled by default',33,'add_videouploadsenabledbydefault'),(126,'Can change video uploads enabled by default',33,'change_videouploadsenabledbydefault'),(127,'Can delete video uploads enabled by default',33,'delete_videouploadsenabledbydefault'),(128,'Can view video uploads enabled by default',33,'view_videouploadsenabledbydefault'),(129,'Can add vem pipeline integration',34,'add_vempipelineintegration'),(130,'Can change vem pipeline integration',34,'change_vempipelineintegration'),(131,'Can delete vem pipeline integration',34,'delete_vempipelineintegration'),(132,'Can view vem pipeline integration',34,'view_vempipelineintegration'),(133,'Can add offline computed grade',35,'add_offlinecomputedgrade'),(134,'Can change offline computed grade',35,'change_offlinecomputedgrade'),(135,'Can delete offline computed grade',35,'delete_offlinecomputedgrade'),(136,'Can view offline computed grade',35,'view_offlinecomputedgrade'),(137,'Can add offline computed grade log',36,'add_offlinecomputedgradelog'),(138,'Can change offline computed grade log',36,'change_offlinecomputedgradelog'),(139,'Can delete offline computed grade log',36,'delete_offlinecomputedgradelog'),(140,'Can view offline computed grade log',36,'view_offlinecomputedgradelog'),(141,'Can add student field override',37,'add_studentfieldoverride'),(142,'Can change student field override',37,'change_studentfieldoverride'),(143,'Can delete student field override',37,'delete_studentfieldoverride'),(144,'Can view student field override',37,'view_studentfieldoverride'),(145,'Can add student module',38,'add_studentmodule'),(146,'Can change student module',38,'change_studentmodule'),(147,'Can delete student module',38,'delete_studentmodule'),(148,'Can view student module',38,'view_studentmodule'),(149,'Can add student module history',39,'add_studentmodulehistory'),(150,'Can change student module history',39,'change_studentmodulehistory'),(151,'Can delete student module history',39,'delete_studentmodulehistory'),(152,'Can view student module history',39,'view_studentmodulehistory'),(153,'Can add x module student info field',40,'add_xmodulestudentinfofield'),(154,'Can change x module student info field',40,'change_xmodulestudentinfofield'),(155,'Can delete x module student info field',40,'delete_xmodulestudentinfofield'),(156,'Can view x module student info field',40,'view_xmodulestudentinfofield'),(157,'Can add x module student prefs field',41,'add_xmodulestudentprefsfield'),(158,'Can change x module student prefs field',41,'change_xmodulestudentprefsfield'),(159,'Can delete x module student prefs field',41,'delete_xmodulestudentprefsfield'),(160,'Can view x module student prefs field',41,'view_xmodulestudentprefsfield'),(161,'Can add x module user state summary field',42,'add_xmoduleuserstatesummaryfield'),(162,'Can change x module user state summary field',42,'change_xmoduleuserstatesummaryfield'),(163,'Can delete x module user state summary field',42,'delete_xmoduleuserstatesummaryfield'),(164,'Can view x module user state summary field',42,'view_xmoduleuserstatesummaryfield'),(165,'Can add course dynamic upgrade deadline configuration',43,'add_coursedynamicupgradedeadlineconfiguration'),(166,'Can change course dynamic upgrade deadline configuration',43,'change_coursedynamicupgradedeadlineconfiguration'),(167,'Can delete course dynamic upgrade deadline configuration',43,'delete_coursedynamicupgradedeadlineconfiguration'),(168,'Can view course dynamic upgrade deadline configuration',43,'view_coursedynamicupgradedeadlineconfiguration'),(169,'Can add dynamic upgrade deadline configuration',44,'add_dynamicupgradedeadlineconfiguration'),(170,'Can change dynamic upgrade deadline configuration',44,'change_dynamicupgradedeadlineconfiguration'),(171,'Can delete dynamic upgrade deadline configuration',44,'delete_dynamicupgradedeadlineconfiguration'),(172,'Can view dynamic upgrade deadline configuration',44,'view_dynamicupgradedeadlineconfiguration'),(173,'Can add org dynamic upgrade deadline configuration',45,'add_orgdynamicupgradedeadlineconfiguration'),(174,'Can change org dynamic upgrade deadline configuration',45,'change_orgdynamicupgradedeadlineconfiguration'),(175,'Can delete org dynamic upgrade deadline configuration',45,'delete_orgdynamicupgradedeadlineconfiguration'),(176,'Can view org dynamic upgrade deadline configuration',45,'view_orgdynamicupgradedeadlineconfiguration'),(177,'Can add last seen courseware timezone',46,'add_lastseencoursewaretimezone'),(178,'Can change last seen courseware timezone',46,'change_lastseencoursewaretimezone'),(179,'Can delete last seen courseware timezone',46,'delete_lastseencoursewaretimezone'),(180,'Can view last seen courseware timezone',46,'view_lastseencoursewaretimezone'),(181,'Can add financial assistance configuration',47,'add_financialassistanceconfiguration'),(182,'Can change financial assistance configuration',47,'change_financialassistanceconfiguration'),(183,'Can delete financial assistance configuration',47,'delete_financialassistanceconfiguration'),(184,'Can view financial assistance configuration',47,'view_financialassistanceconfiguration'),(185,'Can add student module history extended',48,'add_studentmodulehistoryextended'),(186,'Can change student module history extended',48,'change_studentmodulehistoryextended'),(187,'Can delete student module history extended',48,'delete_studentmodulehistoryextended'),(188,'Can view student module history extended',48,'view_studentmodulehistoryextended'),(189,'Can add anonymous user id',49,'add_anonymoususerid'),(190,'Can change anonymous user id',49,'change_anonymoususerid'),(191,'Can delete anonymous user id',49,'delete_anonymoususerid'),(192,'Can view anonymous user id',49,'view_anonymoususerid'),(193,'Can add course access role',50,'add_courseaccessrole'),(194,'Can change course access role',50,'change_courseaccessrole'),(195,'Can delete course access role',50,'delete_courseaccessrole'),(196,'Can view course access role',50,'view_courseaccessrole'),(197,'Can add course enrollment',51,'add_courseenrollment'),(198,'Can change course enrollment',51,'change_courseenrollment'),(199,'Can delete course enrollment',51,'delete_courseenrollment'),(200,'Can view course enrollment',51,'view_courseenrollment'),(201,'Can add course enrollment allowed',52,'add_courseenrollmentallowed'),(202,'Can change course enrollment allowed',52,'change_courseenrollmentallowed'),(203,'Can delete course enrollment allowed',52,'delete_courseenrollmentallowed'),(204,'Can view course enrollment allowed',52,'view_courseenrollmentallowed'),(205,'Can add course enrollment attribute',53,'add_courseenrollmentattribute'),(206,'Can change course enrollment attribute',53,'change_courseenrollmentattribute'),(207,'Can delete course enrollment attribute',53,'delete_courseenrollmentattribute'),(208,'Can view course enrollment attribute',53,'view_courseenrollmentattribute'),(209,'Can add dashboard configuration',54,'add_dashboardconfiguration'),(210,'Can change dashboard configuration',54,'change_dashboardconfiguration'),(211,'Can delete dashboard configuration',54,'delete_dashboardconfiguration'),(212,'Can view dashboard configuration',54,'view_dashboardconfiguration'),(213,'Can add enrollment refund configuration',55,'add_enrollmentrefundconfiguration'),(214,'Can change enrollment refund configuration',55,'change_enrollmentrefundconfiguration'),(215,'Can delete enrollment refund configuration',55,'delete_enrollmentrefundconfiguration'),(216,'Can view enrollment refund configuration',55,'view_enrollmentrefundconfiguration'),(217,'Can add entrance exam configuration',56,'add_entranceexamconfiguration'),(218,'Can change entrance exam configuration',56,'change_entranceexamconfiguration'),(219,'Can delete entrance exam configuration',56,'delete_entranceexamconfiguration'),(220,'Can view entrance exam configuration',56,'view_entranceexamconfiguration'),(221,'Can add language proficiency',57,'add_languageproficiency'),(222,'Can change language proficiency',57,'change_languageproficiency'),(223,'Can delete language proficiency',57,'delete_languageproficiency'),(224,'Can view language proficiency',57,'view_languageproficiency'),(225,'Can add linked in add to profile configuration',58,'add_linkedinaddtoprofileconfiguration'),(226,'Can change linked in add to profile configuration',58,'change_linkedinaddtoprofileconfiguration'),(227,'Can delete linked in add to profile configuration',58,'delete_linkedinaddtoprofileconfiguration'),(228,'Can view linked in add to profile configuration',58,'view_linkedinaddtoprofileconfiguration'),(229,'Can add Login Failure',59,'add_loginfailures'),(230,'Can change Login Failure',59,'change_loginfailures'),(231,'Can delete Login Failure',59,'delete_loginfailures'),(232,'Can view Login Failure',59,'view_loginfailures'),(233,'Can add manual enrollment audit',60,'add_manualenrollmentaudit'),(234,'Can change manual enrollment audit',60,'change_manualenrollmentaudit'),(235,'Can delete manual enrollment audit',60,'delete_manualenrollmentaudit'),(236,'Can view manual enrollment audit',60,'view_manualenrollmentaudit'),(237,'Can add pending email change',61,'add_pendingemailchange'),(238,'Can change pending email change',61,'change_pendingemailchange'),(239,'Can delete pending email change',61,'delete_pendingemailchange'),(240,'Can view pending email change',61,'view_pendingemailchange'),(241,'Can add pending name change',62,'add_pendingnamechange'),(242,'Can change pending name change',62,'change_pendingnamechange'),(243,'Can delete pending name change',62,'delete_pendingnamechange'),(244,'Can view pending name change',62,'view_pendingnamechange'),(245,'Can add registration',63,'add_registration'),(246,'Can change registration',63,'change_registration'),(247,'Can delete registration',63,'delete_registration'),(248,'Can view registration',63,'view_registration'),(249,'Can add user profile',64,'add_userprofile'),(250,'Can change user profile',64,'change_userprofile'),(251,'Can delete user profile',64,'delete_userprofile'),(252,'Can view user profile',64,'view_userprofile'),(253,'Can deactivate, but NOT delete users',64,'can_deactivate_users'),(254,'Can add user signup source',65,'add_usersignupsource'),(255,'Can change user signup source',65,'change_usersignupsource'),(256,'Can delete user signup source',65,'delete_usersignupsource'),(257,'Can view user signup source',65,'view_usersignupsource'),(258,'Can add user standing',66,'add_userstanding'),(259,'Can change user standing',66,'change_userstanding'),(260,'Can delete user standing',66,'delete_userstanding'),(261,'Can view user standing',66,'view_userstanding'),(262,'Can add user test group',67,'add_usertestgroup'),(263,'Can change user test group',67,'change_usertestgroup'),(264,'Can delete user test group',67,'delete_usertestgroup'),(265,'Can view user test group',67,'view_usertestgroup'),(266,'Can add user attribute',68,'add_userattribute'),(267,'Can change user attribute',68,'change_userattribute'),(268,'Can delete user attribute',68,'delete_userattribute'),(269,'Can view user attribute',68,'view_userattribute'),(270,'Can add registration cookie configuration',69,'add_registrationcookieconfiguration'),(271,'Can change registration cookie configuration',69,'change_registrationcookieconfiguration'),(272,'Can delete registration cookie configuration',69,'delete_registrationcookieconfiguration'),(273,'Can view registration cookie configuration',69,'view_registrationcookieconfiguration'),(274,'Can add social link',70,'add_sociallink'),(275,'Can change social link',70,'change_sociallink'),(276,'Can delete social link',70,'delete_sociallink'),(277,'Can view social link',70,'view_sociallink'),(278,'Can add account recovery',71,'add_accountrecovery'),(279,'Can change account recovery',71,'change_accountrecovery'),(280,'Can delete account recovery',71,'delete_accountrecovery'),(281,'Can view account recovery',71,'view_accountrecovery'),(282,'Can add pending secondary email change',72,'add_pendingsecondaryemailchange'),(283,'Can change pending secondary email change',72,'change_pendingsecondaryemailchange'),(284,'Can delete pending secondary email change',72,'delete_pendingsecondaryemailchange'),(285,'Can view pending secondary email change',72,'view_pendingsecondaryemailchange'),(286,'Can add historical course enrollment',73,'add_historicalcourseenrollment'),(287,'Can change historical course enrollment',73,'change_historicalcourseenrollment'),(288,'Can delete historical course enrollment',73,'delete_historicalcourseenrollment'),(289,'Can view historical course enrollment',73,'view_historicalcourseenrollment'),(290,'Can add bulk unenroll configuration',74,'add_bulkunenrollconfiguration'),(291,'Can change bulk unenroll configuration',74,'change_bulkunenrollconfiguration'),(292,'Can delete bulk unenroll configuration',74,'delete_bulkunenrollconfiguration'),(293,'Can view bulk unenroll configuration',74,'view_bulkunenrollconfiguration'),(294,'Can add fbe enrollment exclusion',75,'add_fbeenrollmentexclusion'),(295,'Can change fbe enrollment exclusion',75,'change_fbeenrollmentexclusion'),(296,'Can delete fbe enrollment exclusion',75,'delete_fbeenrollmentexclusion'),(297,'Can view fbe enrollment exclusion',75,'view_fbeenrollmentexclusion'),(298,'Can add allowed auth user',76,'add_allowedauthuser'),(299,'Can change allowed auth user',76,'change_allowedauthuser'),(300,'Can delete allowed auth user',76,'delete_allowedauthuser'),(301,'Can view allowed auth user',76,'view_allowedauthuser'),(302,'Can add historical manual enrollment audit',77,'add_historicalmanualenrollmentaudit'),(303,'Can change historical manual enrollment audit',77,'change_historicalmanualenrollmentaudit'),(304,'Can delete historical manual enrollment audit',77,'delete_historicalmanualenrollmentaudit'),(305,'Can view historical manual enrollment audit',77,'view_historicalmanualenrollmentaudit'),(306,'Can add account recovery configuration',78,'add_accountrecoveryconfiguration'),(307,'Can change account recovery configuration',78,'change_accountrecoveryconfiguration'),(308,'Can delete account recovery configuration',78,'delete_accountrecoveryconfiguration'),(309,'Can view account recovery configuration',78,'view_accountrecoveryconfiguration'),(310,'Can add course enrollment celebration',79,'add_courseenrollmentcelebration'),(311,'Can change course enrollment celebration',79,'change_courseenrollmentcelebration'),(312,'Can delete course enrollment celebration',79,'delete_courseenrollmentcelebration'),(313,'Can view course enrollment celebration',79,'view_courseenrollmentcelebration'),(314,'Can add bulk change enrollment configuration',80,'add_bulkchangeenrollmentconfiguration'),(315,'Can change bulk change enrollment configuration',80,'change_bulkchangeenrollmentconfiguration'),(316,'Can delete bulk change enrollment configuration',80,'delete_bulkchangeenrollmentconfiguration'),(317,'Can view bulk change enrollment configuration',80,'view_bulkchangeenrollmentconfiguration'),(318,'Can add user password toggle history',81,'add_userpasswordtogglehistory'),(319,'Can change user password toggle history',81,'change_userpasswordtogglehistory'),(320,'Can delete user password toggle history',81,'delete_userpasswordtogglehistory'),(321,'Can view user password toggle history',81,'view_userpasswordtogglehistory'),(322,'Can add user celebration',82,'add_usercelebration'),(323,'Can change user celebration',82,'change_usercelebration'),(324,'Can delete user celebration',82,'delete_usercelebration'),(325,'Can view user celebration',82,'view_usercelebration'),(326,'Can add split modulestore course index',83,'add_splitmodulestorecourseindex'),(327,'Can change split modulestore course index',83,'change_splitmodulestorecourseindex'),(328,'Can delete split modulestore course index',83,'delete_splitmodulestorecourseindex'),(329,'Can view split modulestore course index',83,'view_splitmodulestorecourseindex'),(330,'Can add historical split modulestore course index',84,'add_historicalsplitmodulestorecourseindex'),(331,'Can change historical split modulestore course index',84,'change_historicalsplitmodulestorecourseindex'),(332,'Can delete historical split modulestore course index',84,'delete_historicalsplitmodulestorecourseindex'),(333,'Can view historical split modulestore course index',84,'view_historicalsplitmodulestorecourseindex'),(334,'Can add rate limit configuration',85,'add_ratelimitconfiguration'),(335,'Can change rate limit configuration',85,'change_ratelimitconfiguration'),(336,'Can delete rate limit configuration',85,'delete_ratelimitconfiguration'),(337,'Can view rate limit configuration',85,'view_ratelimitconfiguration'),(338,'Can add certificate generation configuration',86,'add_certificategenerationconfiguration'),(339,'Can change certificate generation configuration',86,'change_certificategenerationconfiguration'),(340,'Can delete certificate generation configuration',86,'delete_certificategenerationconfiguration'),(341,'Can view certificate generation configuration',86,'view_certificategenerationconfiguration'),(342,'Can add certificate generation course setting',87,'add_certificategenerationcoursesetting'),(343,'Can change certificate generation course setting',87,'change_certificategenerationcoursesetting'),(344,'Can delete certificate generation course setting',87,'delete_certificategenerationcoursesetting'),(345,'Can view certificate generation course setting',87,'view_certificategenerationcoursesetting'),(346,'Can add certificate html view configuration',88,'add_certificatehtmlviewconfiguration'),(347,'Can change certificate html view configuration',88,'change_certificatehtmlviewconfiguration'),(348,'Can delete certificate html view configuration',88,'delete_certificatehtmlviewconfiguration'),(349,'Can view certificate html view configuration',88,'view_certificatehtmlviewconfiguration'),(350,'Can add certificate template',89,'add_certificatetemplate'),(351,'Can change certificate template',89,'change_certificatetemplate'),(352,'Can delete certificate template',89,'delete_certificatetemplate'),(353,'Can view certificate template',89,'view_certificatetemplate'),(354,'Can add certificate template asset',90,'add_certificatetemplateasset'),(355,'Can change certificate template asset',90,'change_certificatetemplateasset'),(356,'Can delete certificate template asset',90,'delete_certificatetemplateasset'),(357,'Can view certificate template asset',90,'view_certificatetemplateasset'),(358,'Can add example certificate',91,'add_examplecertificate'),(359,'Can change example certificate',91,'change_examplecertificate'),(360,'Can delete example certificate',91,'delete_examplecertificate'),(361,'Can view example certificate',91,'view_examplecertificate'),(362,'Can add example certificate set',92,'add_examplecertificateset'),(363,'Can change example certificate set',92,'change_examplecertificateset'),(364,'Can delete example certificate set',92,'delete_examplecertificateset'),(365,'Can view example certificate set',92,'view_examplecertificateset'),(366,'Can add generated certificate',93,'add_generatedcertificate'),(367,'Can change generated certificate',93,'change_generatedcertificate'),(368,'Can delete generated certificate',93,'delete_generatedcertificate'),(369,'Can view generated certificate',93,'view_generatedcertificate'),(370,'Can add certificate generation history',94,'add_certificategenerationhistory'),(371,'Can change certificate generation history',94,'change_certificategenerationhistory'),(372,'Can delete certificate generation history',94,'delete_certificategenerationhistory'),(373,'Can view certificate generation history',94,'view_certificategenerationhistory'),(374,'Can add certificate invalidation',95,'add_certificateinvalidation'),(375,'Can change certificate invalidation',95,'change_certificateinvalidation'),(376,'Can delete certificate invalidation',95,'delete_certificateinvalidation'),(377,'Can view certificate invalidation',95,'view_certificateinvalidation'),(378,'Can add historical generated certificate',96,'add_historicalgeneratedcertificate'),(379,'Can change historical generated certificate',96,'change_historicalgeneratedcertificate'),(380,'Can delete historical generated certificate',96,'delete_historicalgeneratedcertificate'),(381,'Can view historical generated certificate',96,'view_historicalgeneratedcertificate'),(382,'Can add historical certificate invalidation',97,'add_historicalcertificateinvalidation'),(383,'Can change historical certificate invalidation',97,'change_historicalcertificateinvalidation'),(384,'Can delete historical certificate invalidation',97,'delete_historicalcertificateinvalidation'),(385,'Can view historical certificate invalidation',97,'view_historicalcertificateinvalidation'),(386,'Can add cert_generation argument',98,'add_certificategenerationcommandconfiguration'),(387,'Can change cert_generation argument',98,'change_certificategenerationcommandconfiguration'),(388,'Can delete cert_generation argument',98,'delete_certificategenerationcommandconfiguration'),(389,'Can view cert_generation argument',98,'view_certificategenerationcommandconfiguration'),(390,'Can add certificate allowlist',99,'add_certificateallowlist'),(391,'Can change certificate allowlist',99,'change_certificateallowlist'),(392,'Can delete certificate allowlist',99,'delete_certificateallowlist'),(393,'Can view certificate allowlist',99,'view_certificateallowlist'),(394,'Can add historical certificate allowlist',100,'add_historicalcertificateallowlist'),(395,'Can change historical certificate allowlist',100,'change_historicalcertificateallowlist'),(396,'Can delete historical certificate allowlist',100,'delete_historicalcertificateallowlist'),(397,'Can view historical certificate allowlist',100,'view_historicalcertificateallowlist'),(398,'Can add historical certificate date override',101,'add_historicalcertificatedateoverride'),(399,'Can change historical certificate date override',101,'change_historicalcertificatedateoverride'),(400,'Can delete historical certificate date override',101,'delete_historicalcertificatedateoverride'),(401,'Can view historical certificate date override',101,'view_historicalcertificatedateoverride'),(402,'Can add certificate date override',102,'add_certificatedateoverride'),(403,'Can change certificate date override',102,'change_certificatedateoverride'),(404,'Can delete certificate date override',102,'delete_certificatedateoverride'),(405,'Can view certificate date override',102,'view_certificatedateoverride'),(406,'Can add instructor task',103,'add_instructortask'),(407,'Can change instructor task',103,'change_instructortask'),(408,'Can delete instructor task',103,'delete_instructortask'),(409,'Can view instructor task',103,'view_instructortask'),(410,'Can add grade report setting',104,'add_gradereportsetting'),(411,'Can change grade report setting',104,'change_gradereportsetting'),(412,'Can delete grade report setting',104,'delete_gradereportsetting'),(413,'Can view grade report setting',104,'view_gradereportsetting'),(414,'Can add instructor task schedule',105,'add_instructortaskschedule'),(415,'Can change instructor task schedule',105,'change_instructortaskschedule'),(416,'Can delete instructor task schedule',105,'delete_instructortaskschedule'),(417,'Can view instructor task schedule',105,'view_instructortaskschedule'),(418,'Can add historical instructor task schedule',106,'add_historicalinstructortaskschedule'),(419,'Can change historical instructor task schedule',106,'change_historicalinstructortaskschedule'),(420,'Can delete historical instructor task schedule',106,'delete_historicalinstructortaskschedule'),(421,'Can view historical instructor task schedule',106,'view_historicalinstructortaskschedule'),(422,'Can add cohort membership',107,'add_cohortmembership'),(423,'Can change cohort membership',107,'change_cohortmembership'),(424,'Can delete cohort membership',107,'delete_cohortmembership'),(425,'Can view cohort membership',107,'view_cohortmembership'),(426,'Can add course cohort',108,'add_coursecohort'),(427,'Can change course cohort',108,'change_coursecohort'),(428,'Can delete course cohort',108,'delete_coursecohort'),(429,'Can view course cohort',108,'view_coursecohort'),(430,'Can add course cohorts settings',109,'add_coursecohortssettings'),(431,'Can change course cohorts settings',109,'change_coursecohortssettings'),(432,'Can delete course cohorts settings',109,'delete_coursecohortssettings'),(433,'Can view course cohorts settings',109,'view_coursecohortssettings'),(434,'Can add course user group',110,'add_courseusergroup'),(435,'Can change course user group',110,'change_courseusergroup'),(436,'Can delete course user group',110,'delete_courseusergroup'),(437,'Can view course user group',110,'view_courseusergroup'),(438,'Can add course user group partition group',111,'add_courseusergrouppartitiongroup'),(439,'Can change course user group partition group',111,'change_courseusergrouppartitiongroup'),(440,'Can delete course user group partition group',111,'delete_courseusergrouppartitiongroup'),(441,'Can view course user group partition group',111,'view_courseusergrouppartitiongroup'),(442,'Can add unregistered learner cohort assignments',112,'add_unregisteredlearnercohortassignments'),(443,'Can change unregistered learner cohort assignments',112,'change_unregisteredlearnercohortassignments'),(444,'Can delete unregistered learner cohort assignments',112,'delete_unregisteredlearnercohortassignments'),(445,'Can view unregistered learner cohort assignments',112,'view_unregisteredlearnercohortassignments'),(446,'Can add course authorization',113,'add_courseauthorization'),(447,'Can change course authorization',113,'change_courseauthorization'),(448,'Can delete course authorization',113,'delete_courseauthorization'),(449,'Can view course authorization',113,'view_courseauthorization'),(450,'Can add course email',114,'add_courseemail'),(451,'Can change course email',114,'change_courseemail'),(452,'Can delete course email',114,'delete_courseemail'),(453,'Can view course email',114,'view_courseemail'),(454,'Can add course email template',115,'add_courseemailtemplate'),(455,'Can change course email template',115,'change_courseemailtemplate'),(456,'Can delete course email template',115,'delete_courseemailtemplate'),(457,'Can view course email template',115,'view_courseemailtemplate'),(458,'Can add optout',116,'add_optout'),(459,'Can change optout',116,'change_optout'),(460,'Can delete optout',116,'delete_optout'),(461,'Can view optout',116,'view_optout'),(462,'Can add bulk email flag',117,'add_bulkemailflag'),(463,'Can change bulk email flag',117,'change_bulkemailflag'),(464,'Can delete bulk email flag',117,'delete_bulkemailflag'),(465,'Can view bulk email flag',117,'view_bulkemailflag'),(466,'Can add target',118,'add_target'),(467,'Can change target',118,'change_target'),(468,'Can delete target',118,'delete_target'),(469,'Can view target',118,'view_target'),(470,'Can add cohort target',119,'add_cohorttarget'),(471,'Can change cohort target',119,'change_cohorttarget'),(472,'Can delete cohort target',119,'delete_cohorttarget'),(473,'Can view cohort target',119,'view_cohorttarget'),(474,'Can add course mode target',120,'add_coursemodetarget'),(475,'Can change course mode target',120,'change_coursemodetarget'),(476,'Can delete course mode target',120,'delete_coursemodetarget'),(477,'Can view course mode target',120,'view_coursemodetarget'),(478,'Can add disabled course',121,'add_disabledcourse'),(479,'Can change disabled course',121,'change_disabledcourse'),(480,'Can delete disabled course',121,'delete_disabledcourse'),(481,'Can view disabled course',121,'view_disabledcourse'),(482,'Can add branding api config',122,'add_brandingapiconfig'),(483,'Can change branding api config',122,'change_brandingapiconfig'),(484,'Can delete branding api config',122,'delete_brandingapiconfig'),(485,'Can view branding api config',122,'view_brandingapiconfig'),(486,'Can add branding info config',123,'add_brandinginfoconfig'),(487,'Can change branding info config',123,'change_brandinginfoconfig'),(488,'Can delete branding info config',123,'delete_brandinginfoconfig'),(489,'Can view branding info config',123,'view_brandinginfoconfig'),(490,'Can add disable progress page stacked config',124,'add_disableprogresspagestackedconfig'),(491,'Can change disable progress page stacked config',124,'change_disableprogresspagestackedconfig'),(492,'Can delete disable progress page stacked config',124,'delete_disableprogresspagestackedconfig'),(493,'Can view disable progress page stacked config',124,'view_disableprogresspagestackedconfig'),(494,'Can add user tour',125,'add_usertour'),(495,'Can change user tour',125,'change_usertour'),(496,'Can delete user tour',125,'delete_usertour'),(497,'Can view user tour',125,'view_usertour'),(498,'Can add user discussions tours',126,'add_userdiscussionstours'),(499,'Can change user discussions tours',126,'change_userdiscussionstours'),(500,'Can delete user discussions tours',126,'delete_userdiscussionstours'),(501,'Can view user discussions tours',126,'view_userdiscussionstours'),(502,'Can add historical user social auth',127,'add_historicalusersocialauth'),(503,'Can change historical user social auth',127,'change_historicalusersocialauth'),(504,'Can delete historical user social auth',127,'delete_historicalusersocialauth'),(505,'Can view historical user social auth',127,'view_historicalusersocialauth'),(506,'Can add application',128,'add_application'),(507,'Can change application',128,'change_application'),(508,'Can delete application',128,'delete_application'),(509,'Can view application',128,'view_application'),(510,'Can add access token',129,'add_accesstoken'),(511,'Can change access token',129,'change_accesstoken'),(512,'Can delete access token',129,'delete_accesstoken'),(513,'Can view access token',129,'view_accesstoken'),(514,'Can add grant',130,'add_grant'),(515,'Can change grant',130,'change_grant'),(516,'Can delete grant',130,'delete_grant'),(517,'Can view grant',130,'view_grant'),(518,'Can add refresh token',131,'add_refreshtoken'),(519,'Can change refresh token',131,'change_refreshtoken'),(520,'Can delete refresh token',131,'delete_refreshtoken'),(521,'Can view refresh token',131,'view_refreshtoken'),(522,'Can add restricted application',132,'add_restrictedapplication'),(523,'Can change restricted application',132,'change_restrictedapplication'),(524,'Can delete restricted application',132,'delete_restrictedapplication'),(525,'Can view restricted application',132,'view_restrictedapplication'),(526,'Can add application access',133,'add_applicationaccess'),(527,'Can change application access',133,'change_applicationaccess'),(528,'Can delete application access',133,'delete_applicationaccess'),(529,'Can view application access',133,'view_applicationaccess'),(530,'Can add application organization',134,'add_applicationorganization'),(531,'Can change application organization',134,'change_applicationorganization'),(532,'Can delete application organization',134,'delete_applicationorganization'),(533,'Can view application organization',134,'view_applicationorganization'),(534,'Can add SAML Provider Data',135,'add_samlproviderdata'),(535,'Can change SAML Provider Data',135,'change_samlproviderdata'),(536,'Can delete SAML Provider Data',135,'delete_samlproviderdata'),(537,'Can view SAML Provider Data',135,'view_samlproviderdata'),(538,'Can add SAML Configuration',136,'add_samlconfiguration'),(539,'Can change SAML Configuration',136,'change_samlconfiguration'),(540,'Can delete SAML Configuration',136,'delete_samlconfiguration'),(541,'Can view SAML Configuration',136,'view_samlconfiguration'),(542,'Can add Provider Configuration (OAuth)',137,'add_oauth2providerconfig'),(543,'Can change Provider Configuration (OAuth)',137,'change_oauth2providerconfig'),(544,'Can delete Provider Configuration (OAuth)',137,'delete_oauth2providerconfig'),(545,'Can view Provider Configuration (OAuth)',137,'view_oauth2providerconfig'),(546,'Can add Provider Configuration (LTI)',138,'add_ltiproviderconfig'),(547,'Can change Provider Configuration (LTI)',138,'change_ltiproviderconfig'),(548,'Can delete Provider Configuration (LTI)',138,'delete_ltiproviderconfig'),(549,'Can view Provider Configuration (LTI)',138,'view_ltiproviderconfig'),(550,'Can add Provider Configuration (SAML IdP)',139,'add_samlproviderconfig'),(551,'Can change Provider Configuration (SAML IdP)',139,'change_samlproviderconfig'),(552,'Can delete Provider Configuration (SAML IdP)',139,'delete_samlproviderconfig'),(553,'Can view Provider Configuration (SAML IdP)',139,'view_samlproviderconfig'),(554,'Can add system wide role',140,'add_systemwiderole'),(555,'Can change system wide role',140,'change_systemwiderole'),(556,'Can delete system wide role',140,'delete_systemwiderole'),(557,'Can view system wide role',140,'view_systemwiderole'),(558,'Can add system wide role assignment',141,'add_systemwideroleassignment'),(559,'Can change system wide role assignment',141,'change_systemwideroleassignment'),(560,'Can delete system wide role assignment',141,'delete_systemwideroleassignment'),(561,'Can view system wide role assignment',141,'view_systemwideroleassignment'),(562,'Can add article',142,'add_article'),(563,'Can change article',142,'change_article'),(564,'Can delete article',142,'delete_article'),(565,'Can view article',142,'view_article'),(566,'Can edit all articles and lock/unlock/restore',142,'moderate'),(567,'Can change ownership of any article',142,'assign'),(568,'Can assign permissions to other users',142,'grant'),(569,'Can add Article for object',143,'add_articleforobject'),(570,'Can change Article for object',143,'change_articleforobject'),(571,'Can delete Article for object',143,'delete_articleforobject'),(572,'Can view Article for object',143,'view_articleforobject'),(573,'Can add article plugin',144,'add_articleplugin'),(574,'Can change article plugin',144,'change_articleplugin'),(575,'Can delete article plugin',144,'delete_articleplugin'),(576,'Can view article plugin',144,'view_articleplugin'),(577,'Can add article revision',145,'add_articlerevision'),(578,'Can change article revision',145,'change_articlerevision'),(579,'Can delete article revision',145,'delete_articlerevision'),(580,'Can view article revision',145,'view_articlerevision'),(581,'Can add reusable plugin',146,'add_reusableplugin'),(582,'Can change reusable plugin',146,'change_reusableplugin'),(583,'Can delete reusable plugin',146,'delete_reusableplugin'),(584,'Can view reusable plugin',146,'view_reusableplugin'),(585,'Can add revision plugin',147,'add_revisionplugin'),(586,'Can change revision plugin',147,'change_revisionplugin'),(587,'Can delete revision plugin',147,'delete_revisionplugin'),(588,'Can view revision plugin',147,'view_revisionplugin'),(589,'Can add revision plugin revision',148,'add_revisionpluginrevision'),(590,'Can change revision plugin revision',148,'change_revisionpluginrevision'),(591,'Can delete revision plugin revision',148,'delete_revisionpluginrevision'),(592,'Can view revision plugin revision',148,'view_revisionpluginrevision'),(593,'Can add simple plugin',149,'add_simpleplugin'),(594,'Can change simple plugin',149,'change_simpleplugin'),(595,'Can delete simple plugin',149,'delete_simpleplugin'),(596,'Can view simple plugin',149,'view_simpleplugin'),(597,'Can add URL path',150,'add_urlpath'),(598,'Can change URL path',150,'change_urlpath'),(599,'Can delete URL path',150,'delete_urlpath'),(600,'Can view URL path',150,'view_urlpath'),(601,'Can add notification',151,'add_notification'),(602,'Can change notification',151,'change_notification'),(603,'Can delete notification',151,'delete_notification'),(604,'Can view notification',151,'view_notification'),(605,'Can add type',152,'add_notificationtype'),(606,'Can change type',152,'change_notificationtype'),(607,'Can delete type',152,'delete_notificationtype'),(608,'Can view type',152,'view_notificationtype'),(609,'Can add settings',153,'add_settings'),(610,'Can change settings',153,'change_settings'),(611,'Can delete settings',153,'delete_settings'),(612,'Can view settings',153,'view_settings'),(613,'Can add subscription',154,'add_subscription'),(614,'Can change subscription',154,'change_subscription'),(615,'Can delete subscription',154,'delete_subscription'),(616,'Can view subscription',154,'view_subscription'),(617,'Can add log entry',155,'add_logentry'),(618,'Can change log entry',155,'change_logentry'),(619,'Can delete log entry',155,'delete_logentry'),(620,'Can view log entry',155,'view_logentry'),(621,'Can add permission',156,'add_permission'),(622,'Can change permission',156,'change_permission'),(623,'Can delete permission',156,'delete_permission'),(624,'Can view permission',156,'view_permission'),(625,'Can add role',157,'add_role'),(626,'Can change role',157,'change_role'),(627,'Can delete role',157,'delete_role'),(628,'Can view role',157,'view_role'),(629,'Can add forums config',158,'add_forumsconfig'),(630,'Can change forums config',158,'change_forumsconfig'),(631,'Can delete forums config',158,'delete_forumsconfig'),(632,'Can view forums config',158,'view_forumsconfig'),(633,'Can add course discussion settings',159,'add_coursediscussionsettings'),(634,'Can change course discussion settings',159,'change_coursediscussionsettings'),(635,'Can delete course discussion settings',159,'delete_coursediscussionsettings'),(636,'Can view course discussion settings',159,'view_coursediscussionsettings'),(637,'Can add discussions id mapping',160,'add_discussionsidmapping'),(638,'Can change discussions id mapping',160,'change_discussionsidmapping'),(639,'Can delete discussions id mapping',160,'delete_discussionsidmapping'),(640,'Can view discussions id mapping',160,'view_discussionsidmapping'),(641,'Can add splash config',161,'add_splashconfig'),(642,'Can change splash config',161,'change_splashconfig'),(643,'Can delete splash config',161,'delete_splashconfig'),(644,'Can view splash config',161,'view_splashconfig'),(645,'Can add user course tag',162,'add_usercoursetag'),(646,'Can change user course tag',162,'change_usercoursetag'),(647,'Can delete user course tag',162,'delete_usercoursetag'),(648,'Can view user course tag',162,'view_usercoursetag'),(649,'Can add user org tag',163,'add_userorgtag'),(650,'Can change user org tag',163,'change_userorgtag'),(651,'Can delete user org tag',163,'delete_userorgtag'),(652,'Can view user org tag',163,'view_userorgtag'),(653,'Can add user preference',164,'add_userpreference'),(654,'Can change user preference',164,'change_userpreference'),(655,'Can delete user preference',164,'delete_userpreference'),(656,'Can view user preference',164,'view_userpreference'),(657,'Can add retirement state',165,'add_retirementstate'),(658,'Can change retirement state',165,'change_retirementstate'),(659,'Can delete retirement state',165,'delete_retirementstate'),(660,'Can view retirement state',165,'view_retirementstate'),(661,'Can add User Retirement Status',166,'add_userretirementstatus'),(662,'Can change User Retirement Status',166,'change_userretirementstatus'),(663,'Can delete User Retirement Status',166,'delete_userretirementstatus'),(664,'Can view User Retirement Status',166,'view_userretirementstatus'),(665,'Can add User Retirement Request',167,'add_userretirementrequest'),(666,'Can change User Retirement Request',167,'change_userretirementrequest'),(667,'Can delete User Retirement Request',167,'delete_userretirementrequest'),(668,'Can view User Retirement Request',167,'view_userretirementrequest'),(669,'Can add User Retirement Reporting Status',168,'add_userretirementpartnerreportingstatus'),(670,'Can change User Retirement Reporting Status',168,'change_userretirementpartnerreportingstatus'),(671,'Can delete User Retirement Reporting Status',168,'delete_userretirementpartnerreportingstatus'),(672,'Can view User Retirement Reporting Status',168,'view_userretirementpartnerreportingstatus'),(673,'Can add course mode',169,'add_coursemode'),(674,'Can change course mode',169,'change_coursemode'),(675,'Can delete course mode',169,'delete_coursemode'),(676,'Can view course mode',169,'view_coursemode'),(677,'Can add course modes archive',170,'add_coursemodesarchive'),(678,'Can change course modes archive',170,'change_coursemodesarchive'),(679,'Can delete course modes archive',170,'delete_coursemodesarchive'),(680,'Can view course modes archive',170,'view_coursemodesarchive'),(681,'Can add course mode expiration config',171,'add_coursemodeexpirationconfig'),(682,'Can change course mode expiration config',171,'change_coursemodeexpirationconfig'),(683,'Can delete course mode expiration config',171,'delete_coursemodeexpirationconfig'),(684,'Can view course mode expiration config',171,'view_coursemodeexpirationconfig'),(685,'Can add historical course mode',172,'add_historicalcoursemode'),(686,'Can change historical course mode',172,'change_historicalcoursemode'),(687,'Can delete historical course mode',172,'delete_historicalcoursemode'),(688,'Can view historical course mode',172,'view_historicalcoursemode'),(689,'Can add course entitlement',173,'add_courseentitlement'),(690,'Can change course entitlement',173,'change_courseentitlement'),(691,'Can delete course entitlement',173,'delete_courseentitlement'),(692,'Can view course entitlement',173,'view_courseentitlement'),(693,'Can add course entitlement policy',174,'add_courseentitlementpolicy'),(694,'Can change course entitlement policy',174,'change_courseentitlementpolicy'),(695,'Can delete course entitlement policy',174,'delete_courseentitlementpolicy'),(696,'Can view course entitlement policy',174,'view_courseentitlementpolicy'),(697,'Can add course entitlement support detail',175,'add_courseentitlementsupportdetail'),(698,'Can change course entitlement support detail',175,'change_courseentitlementsupportdetail'),(699,'Can delete course entitlement support detail',175,'delete_courseentitlementsupportdetail'),(700,'Can view course entitlement support detail',175,'view_courseentitlementsupportdetail'),(701,'Can add historical course entitlement',176,'add_historicalcourseentitlement'),(702,'Can change historical course entitlement',176,'change_historicalcourseentitlement'),(703,'Can delete historical course entitlement',176,'delete_historicalcourseentitlement'),(704,'Can view historical course entitlement',176,'view_historicalcourseentitlement'),(705,'Can add historical course entitlement support detail',177,'add_historicalcourseentitlementsupportdetail'),(706,'Can change historical course entitlement support detail',177,'change_historicalcourseentitlementsupportdetail'),(707,'Can delete historical course entitlement support detail',177,'delete_historicalcourseentitlementsupportdetail'),(708,'Can view historical course entitlement support detail',177,'view_historicalcourseentitlementsupportdetail'),(709,'Can add software secure photo verification',178,'add_softwaresecurephotoverification'),(710,'Can change software secure photo verification',178,'change_softwaresecurephotoverification'),(711,'Can delete software secure photo verification',178,'delete_softwaresecurephotoverification'),(712,'Can view software secure photo verification',178,'view_softwaresecurephotoverification'),(713,'Can add verification deadline',179,'add_verificationdeadline'),(714,'Can change verification deadline',179,'change_verificationdeadline'),(715,'Can delete verification deadline',179,'delete_verificationdeadline'),(716,'Can view verification deadline',179,'view_verificationdeadline'),(717,'Can add sso verification',180,'add_ssoverification'),(718,'Can change sso verification',180,'change_ssoverification'),(719,'Can delete sso verification',180,'delete_ssoverification'),(720,'Can view sso verification',180,'view_ssoverification'),(721,'Can add manual verification',181,'add_manualverification'),(722,'Can change manual verification',181,'change_manualverification'),(723,'Can delete manual verification',181,'delete_manualverification'),(724,'Can view manual verification',181,'view_manualverification'),(725,'Can add sspv retry student argument',182,'add_sspverificationretryconfig'),(726,'Can change sspv retry student argument',182,'change_sspverificationretryconfig'),(727,'Can delete sspv retry student argument',182,'delete_sspverificationretryconfig'),(728,'Can view sspv retry student argument',182,'view_sspverificationretryconfig'),(729,'Can add dark lang config',183,'add_darklangconfig'),(730,'Can change dark lang config',183,'change_darklangconfig'),(731,'Can delete dark lang config',183,'delete_darklangconfig'),(732,'Can view dark lang config',183,'view_darklangconfig'),(733,'Can add whitelisted rss url',184,'add_whitelistedrssurl'),(734,'Can change whitelisted rss url',184,'change_whitelistedrssurl'),(735,'Can delete whitelisted rss url',184,'delete_whitelistedrssurl'),(736,'Can view whitelisted rss url',184,'view_whitelistedrssurl'),(737,'Can add country',185,'add_country'),(738,'Can change country',185,'change_country'),(739,'Can delete country',185,'delete_country'),(740,'Can view country',185,'view_country'),(741,'Can add country access rule',186,'add_countryaccessrule'),(742,'Can change country access rule',186,'change_countryaccessrule'),(743,'Can delete country access rule',186,'delete_countryaccessrule'),(744,'Can view country access rule',186,'view_countryaccessrule'),(745,'Can add course access rule history',187,'add_courseaccessrulehistory'),(746,'Can change course access rule history',187,'change_courseaccessrulehistory'),(747,'Can delete course access rule history',187,'delete_courseaccessrulehistory'),(748,'Can view course access rule history',187,'view_courseaccessrulehistory'),(749,'Can add embargoed course',188,'add_embargoedcourse'),(750,'Can change embargoed course',188,'change_embargoedcourse'),(751,'Can delete embargoed course',188,'delete_embargoedcourse'),(752,'Can view embargoed course',188,'view_embargoedcourse'),(753,'Can add embargoed state',189,'add_embargoedstate'),(754,'Can change embargoed state',189,'change_embargoedstate'),(755,'Can delete embargoed state',189,'delete_embargoedstate'),(756,'Can view embargoed state',189,'view_embargoedstate'),(757,'Can add ip filter',190,'add_ipfilter'),(758,'Can change ip filter',190,'change_ipfilter'),(759,'Can delete ip filter',190,'delete_ipfilter'),(760,'Can view ip filter',190,'view_ipfilter'),(761,'Can add restricted course',191,'add_restrictedcourse'),(762,'Can change restricted course',191,'change_restrictedcourse'),(763,'Can delete restricted course',191,'delete_restrictedcourse'),(764,'Can view restricted course',191,'view_restrictedcourse'),(765,'Can add course rerun state',192,'add_coursererunstate'),(766,'Can change course rerun state',192,'change_coursererunstate'),(767,'Can delete course rerun state',192,'delete_coursererunstate'),(768,'Can view course rerun state',192,'view_coursererunstate'),(769,'Can add mobile api config',193,'add_mobileapiconfig'),(770,'Can change mobile api config',193,'change_mobileapiconfig'),(771,'Can delete mobile api config',193,'delete_mobileapiconfig'),(772,'Can view mobile api config',193,'view_mobileapiconfig'),(773,'Can add app version config',194,'add_appversionconfig'),(774,'Can change app version config',194,'change_appversionconfig'),(775,'Can delete app version config',194,'delete_appversionconfig'),(776,'Can view app version config',194,'view_appversionconfig'),(777,'Can add ignore mobile available flag config',195,'add_ignoremobileavailableflagconfig'),(778,'Can change ignore mobile available flag config',195,'change_ignoremobileavailableflagconfig'),(779,'Can delete ignore mobile available flag config',195,'delete_ignoremobileavailableflagconfig'),(780,'Can view ignore mobile available flag config',195,'view_ignoremobileavailableflagconfig'),(781,'Can add mobile config',196,'add_mobileconfig'),(782,'Can change mobile config',196,'change_mobileconfig'),(783,'Can delete mobile config',196,'delete_mobileconfig'),(784,'Can view mobile config',196,'view_mobileconfig'),(785,'Can add association',197,'add_association'),(786,'Can change association',197,'change_association'),(787,'Can delete association',197,'delete_association'),(788,'Can view association',197,'view_association'),(789,'Can add code',198,'add_code'),(790,'Can change code',198,'change_code'),(791,'Can delete code',198,'delete_code'),(792,'Can view code',198,'view_code'),(793,'Can add nonce',199,'add_nonce'),(794,'Can change nonce',199,'change_nonce'),(795,'Can delete nonce',199,'delete_nonce'),(796,'Can view nonce',199,'view_nonce'),(797,'Can add user social auth',200,'add_usersocialauth'),(798,'Can change user social auth',200,'change_usersocialauth'),(799,'Can delete user social auth',200,'delete_usersocialauth'),(800,'Can view user social auth',200,'view_usersocialauth'),(801,'Can add partial',201,'add_partial'),(802,'Can change partial',201,'change_partial'),(803,'Can delete partial',201,'delete_partial'),(804,'Can view partial',201,'view_partial'),(805,'Can add survey answer',202,'add_surveyanswer'),(806,'Can change survey answer',202,'change_surveyanswer'),(807,'Can delete survey answer',202,'delete_surveyanswer'),(808,'Can view survey answer',202,'view_surveyanswer'),(809,'Can add survey form',203,'add_surveyform'),(810,'Can change survey form',203,'change_surveyform'),(811,'Can delete survey form',203,'delete_surveyform'),(812,'Can view survey form',203,'view_surveyform'),(813,'Can add x block asides config',204,'add_xblockasidesconfig'),(814,'Can change x block asides config',204,'change_xblockasidesconfig'),(815,'Can delete x block asides config',204,'delete_xblockasidesconfig'),(816,'Can view x block asides config',204,'view_xblockasidesconfig'),(817,'Can add score',205,'add_score'),(818,'Can change score',205,'change_score'),(819,'Can delete score',205,'delete_score'),(820,'Can view score',205,'view_score'),(821,'Can add student item',206,'add_studentitem'),(822,'Can change student item',206,'change_studentitem'),(823,'Can delete student item',206,'delete_studentitem'),(824,'Can view student item',206,'view_studentitem'),(825,'Can add submission',207,'add_submission'),(826,'Can change submission',207,'change_submission'),(827,'Can delete submission',207,'delete_submission'),(828,'Can view submission',207,'view_submission'),(829,'Can add score summary',208,'add_scoresummary'),(830,'Can change score summary',208,'change_scoresummary'),(831,'Can delete score summary',208,'delete_scoresummary'),(832,'Can view score summary',208,'view_scoresummary'),(833,'Can add score annotation',209,'add_scoreannotation'),(834,'Can change score annotation',209,'change_scoreannotation'),(835,'Can delete score annotation',209,'delete_scoreannotation'),(836,'Can view score annotation',209,'view_scoreannotation'),(837,'Can add team submission',210,'add_teamsubmission'),(838,'Can change team submission',210,'change_teamsubmission'),(839,'Can delete team submission',210,'delete_teamsubmission'),(840,'Can view team submission',210,'view_teamsubmission'),(841,'Can add assessment',211,'add_assessment'),(842,'Can change assessment',211,'change_assessment'),(843,'Can delete assessment',211,'delete_assessment'),(844,'Can view assessment',211,'view_assessment'),(845,'Can add assessment feedback',212,'add_assessmentfeedback'),(846,'Can change assessment feedback',212,'change_assessmentfeedback'),(847,'Can delete assessment feedback',212,'delete_assessmentfeedback'),(848,'Can view assessment feedback',212,'view_assessmentfeedback'),(849,'Can add assessment feedback option',213,'add_assessmentfeedbackoption'),(850,'Can change assessment feedback option',213,'change_assessmentfeedbackoption'),(851,'Can delete assessment feedback option',213,'delete_assessmentfeedbackoption'),(852,'Can view assessment feedback option',213,'view_assessmentfeedbackoption'),(853,'Can add assessment part',214,'add_assessmentpart'),(854,'Can change assessment part',214,'change_assessmentpart'),(855,'Can delete assessment part',214,'delete_assessmentpart'),(856,'Can view assessment part',214,'view_assessmentpart'),(857,'Can add criterion',215,'add_criterion'),(858,'Can change criterion',215,'change_criterion'),(859,'Can delete criterion',215,'delete_criterion'),(860,'Can view criterion',215,'view_criterion'),(861,'Can add criterion option',216,'add_criterionoption'),(862,'Can change criterion option',216,'change_criterionoption'),(863,'Can delete criterion option',216,'delete_criterionoption'),(864,'Can view criterion option',216,'view_criterionoption'),(865,'Can add peer workflow',217,'add_peerworkflow'),(866,'Can change peer workflow',217,'change_peerworkflow'),(867,'Can delete peer workflow',217,'delete_peerworkflow'),(868,'Can view peer workflow',217,'view_peerworkflow'),(869,'Can add peer workflow item',218,'add_peerworkflowitem'),(870,'Can change peer workflow item',218,'change_peerworkflowitem'),(871,'Can delete peer workflow item',218,'delete_peerworkflowitem'),(872,'Can view peer workflow item',218,'view_peerworkflowitem'),(873,'Can add rubric',219,'add_rubric'),(874,'Can change rubric',219,'change_rubric'),(875,'Can delete rubric',219,'delete_rubric'),(876,'Can view rubric',219,'view_rubric'),(877,'Can add student training workflow',220,'add_studenttrainingworkflow'),(878,'Can change student training workflow',220,'change_studenttrainingworkflow'),(879,'Can delete student training workflow',220,'delete_studenttrainingworkflow'),(880,'Can view student training workflow',220,'view_studenttrainingworkflow'),(881,'Can add student training workflow item',221,'add_studenttrainingworkflowitem'),(882,'Can change student training workflow item',221,'change_studenttrainingworkflowitem'),(883,'Can delete student training workflow item',221,'delete_studenttrainingworkflowitem'),(884,'Can view student training workflow item',221,'view_studenttrainingworkflowitem'),(885,'Can add training example',222,'add_trainingexample'),(886,'Can change training example',222,'change_trainingexample'),(887,'Can delete training example',222,'delete_trainingexample'),(888,'Can view training example',222,'view_trainingexample'),(889,'Can add staff workflow',223,'add_staffworkflow'),(890,'Can change staff workflow',223,'change_staffworkflow'),(891,'Can delete staff workflow',223,'delete_staffworkflow'),(892,'Can view staff workflow',223,'view_staffworkflow'),(893,'Can add historical shared file upload',224,'add_historicalsharedfileupload'),(894,'Can change historical shared file upload',224,'change_historicalsharedfileupload'),(895,'Can delete historical shared file upload',224,'delete_historicalsharedfileupload'),(896,'Can view historical shared file upload',224,'view_historicalsharedfileupload'),(897,'Can add shared file upload',225,'add_sharedfileupload'),(898,'Can change shared file upload',225,'change_sharedfileupload'),(899,'Can delete shared file upload',225,'delete_sharedfileupload'),(900,'Can view shared file upload',225,'view_sharedfileupload'),(901,'Can add team staff workflow',226,'add_teamstaffworkflow'),(902,'Can change team staff workflow',226,'change_teamstaffworkflow'),(903,'Can delete team staff workflow',226,'delete_teamstaffworkflow'),(904,'Can view team staff workflow',226,'view_teamstaffworkflow'),(905,'Can add submission grading lock',227,'add_submissiongradinglock'),(906,'Can change submission grading lock',227,'change_submissiongradinglock'),(907,'Can delete submission grading lock',227,'delete_submissiongradinglock'),(908,'Can view submission grading lock',227,'view_submissiongradinglock'),(909,'Can add assessment workflow',228,'add_assessmentworkflow'),(910,'Can change assessment workflow',228,'change_assessmentworkflow'),(911,'Can delete assessment workflow',228,'delete_assessmentworkflow'),(912,'Can view assessment workflow',228,'view_assessmentworkflow'),(913,'Can add assessment workflow cancellation',229,'add_assessmentworkflowcancellation'),(914,'Can change assessment workflow cancellation',229,'change_assessmentworkflowcancellation'),(915,'Can delete assessment workflow cancellation',229,'delete_assessmentworkflowcancellation'),(916,'Can view assessment workflow cancellation',229,'view_assessmentworkflowcancellation'),(917,'Can add assessment workflow step',230,'add_assessmentworkflowstep'),(918,'Can change assessment workflow step',230,'change_assessmentworkflowstep'),(919,'Can delete assessment workflow step',230,'delete_assessmentworkflowstep'),(920,'Can view assessment workflow step',230,'view_assessmentworkflowstep'),(921,'Can add team assessment workflow',231,'add_teamassessmentworkflow'),(922,'Can change team assessment workflow',231,'change_teamassessmentworkflow'),(923,'Can delete team assessment workflow',231,'delete_teamassessmentworkflow'),(924,'Can view team assessment workflow',231,'view_teamassessmentworkflow'),(925,'Can add profile',232,'add_profile'),(926,'Can change profile',232,'change_profile'),(927,'Can delete profile',232,'delete_profile'),(928,'Can view profile',232,'view_profile'),(929,'Can add video',233,'add_video'),(930,'Can change video',233,'change_video'),(931,'Can delete video',233,'delete_video'),(932,'Can view video',233,'view_video'),(933,'Can add encoded video',234,'add_encodedvideo'),(934,'Can change encoded video',234,'change_encodedvideo'),(935,'Can delete encoded video',234,'delete_encodedvideo'),(936,'Can view encoded video',234,'view_encodedvideo'),(937,'Can add course video',235,'add_coursevideo'),(938,'Can change course video',235,'change_coursevideo'),(939,'Can delete course video',235,'delete_coursevideo'),(940,'Can view course video',235,'view_coursevideo'),(941,'Can add video image',236,'add_videoimage'),(942,'Can change video image',236,'change_videoimage'),(943,'Can delete video image',236,'delete_videoimage'),(944,'Can view video image',236,'view_videoimage'),(945,'Can add transcript preference',237,'add_transcriptpreference'),(946,'Can change transcript preference',237,'change_transcriptpreference'),(947,'Can delete transcript preference',237,'delete_transcriptpreference'),(948,'Can view transcript preference',237,'view_transcriptpreference'),(949,'Can add video transcript',238,'add_videotranscript'),(950,'Can change video transcript',238,'change_videotranscript'),(951,'Can delete video transcript',238,'delete_videotranscript'),(952,'Can view video transcript',238,'view_videotranscript'),(953,'Can add third party transcript credentials state',239,'add_thirdpartytranscriptcredentialsstate'),(954,'Can change third party transcript credentials state',239,'change_thirdpartytranscriptcredentialsstate'),(955,'Can delete third party transcript credentials state',239,'delete_thirdpartytranscriptcredentialsstate'),(956,'Can view third party transcript credentials state',239,'view_thirdpartytranscriptcredentialsstate'),(957,'Can add course overview',240,'add_courseoverview'),(958,'Can change course overview',240,'change_courseoverview'),(959,'Can delete course overview',240,'delete_courseoverview'),(960,'Can view course overview',240,'view_courseoverview'),(961,'Can add course overview tab',241,'add_courseoverviewtab'),(962,'Can change course overview tab',241,'change_courseoverviewtab'),(963,'Can delete course overview tab',241,'delete_courseoverviewtab'),(964,'Can view course overview tab',241,'view_courseoverviewtab'),(965,'Can add course overview image set',242,'add_courseoverviewimageset'),(966,'Can change course overview image set',242,'change_courseoverviewimageset'),(967,'Can delete course overview image set',242,'delete_courseoverviewimageset'),(968,'Can view course overview image set',242,'view_courseoverviewimageset'),(969,'Can add course overview image config',243,'add_courseoverviewimageconfig'),(970,'Can change course overview image config',243,'change_courseoverviewimageconfig'),(971,'Can delete course overview image config',243,'delete_courseoverviewimageconfig'),(972,'Can view course overview image config',243,'view_courseoverviewimageconfig'),(973,'Can add historical course overview',244,'add_historicalcourseoverview'),(974,'Can change historical course overview',244,'change_historicalcourseoverview'),(975,'Can delete historical course overview',244,'delete_historicalcourseoverview'),(976,'Can view historical course overview',244,'view_historicalcourseoverview'),(977,'Can add simulate_publish argument',245,'add_simulatecoursepublishconfig'),(978,'Can change simulate_publish argument',245,'change_simulatecoursepublishconfig'),(979,'Can delete simulate_publish argument',245,'delete_simulatecoursepublishconfig'),(980,'Can view simulate_publish argument',245,'view_simulatecoursepublishconfig'),(981,'Can add block structure configuration',246,'add_blockstructureconfiguration'),(982,'Can change block structure configuration',246,'change_blockstructureconfiguration'),(983,'Can delete block structure configuration',246,'delete_blockstructureconfiguration'),(984,'Can view block structure configuration',246,'view_blockstructureconfiguration'),(985,'Can add block structure model',247,'add_blockstructuremodel'),(986,'Can change block structure model',247,'change_blockstructuremodel'),(987,'Can delete block structure model',247,'delete_blockstructuremodel'),(988,'Can view block structure model',247,'view_blockstructuremodel'),(989,'Can add x domain proxy configuration',248,'add_xdomainproxyconfiguration'),(990,'Can change x domain proxy configuration',248,'change_xdomainproxyconfiguration'),(991,'Can delete x domain proxy configuration',248,'delete_xdomainproxyconfiguration'),(992,'Can view x domain proxy configuration',248,'view_xdomainproxyconfiguration'),(993,'Can add commerce configuration',249,'add_commerceconfiguration'),(994,'Can change commerce configuration',249,'change_commerceconfiguration'),(995,'Can delete commerce configuration',249,'delete_commerceconfiguration'),(996,'Can view commerce configuration',249,'view_commerceconfiguration'),(997,'Can add credit course',250,'add_creditcourse'),(998,'Can change credit course',250,'change_creditcourse'),(999,'Can delete credit course',250,'delete_creditcourse'),(1000,'Can view credit course',250,'view_creditcourse'),(1001,'Can add credit eligibility',251,'add_crediteligibility'),(1002,'Can change credit eligibility',251,'change_crediteligibility'),(1003,'Can delete credit eligibility',251,'delete_crediteligibility'),(1004,'Can view credit eligibility',251,'view_crediteligibility'),(1005,'Can add credit provider',252,'add_creditprovider'),(1006,'Can change credit provider',252,'change_creditprovider'),(1007,'Can delete credit provider',252,'delete_creditprovider'),(1008,'Can view credit provider',252,'view_creditprovider'),(1009,'Can add credit request',253,'add_creditrequest'),(1010,'Can change credit request',253,'change_creditrequest'),(1011,'Can delete credit request',253,'delete_creditrequest'),(1012,'Can view credit request',253,'view_creditrequest'),(1013,'Can add credit requirement',254,'add_creditrequirement'),(1014,'Can change credit requirement',254,'change_creditrequirement'),(1015,'Can delete credit requirement',254,'delete_creditrequirement'),(1016,'Can view credit requirement',254,'view_creditrequirement'),(1017,'Can add credit requirement status',255,'add_creditrequirementstatus'),(1018,'Can change credit requirement status',255,'change_creditrequirementstatus'),(1019,'Can delete credit requirement status',255,'delete_creditrequirementstatus'),(1020,'Can view credit requirement status',255,'view_creditrequirementstatus'),(1021,'Can add credit config',256,'add_creditconfig'),(1022,'Can change credit config',256,'change_creditconfig'),(1023,'Can delete credit config',256,'delete_creditconfig'),(1024,'Can view credit config',256,'view_creditconfig'),(1025,'Can add course team',257,'add_courseteam'),(1026,'Can change course team',257,'change_courseteam'),(1027,'Can delete course team',257,'delete_courseteam'),(1028,'Can view course team',257,'view_courseteam'),(1029,'Can add course team membership',258,'add_courseteammembership'),(1030,'Can change course team membership',258,'change_courseteammembership'),(1031,'Can delete course team membership',258,'delete_courseteammembership'),(1032,'Can view course team membership',258,'view_courseteammembership'),(1033,'Can add x block configuration',259,'add_xblockconfiguration'),(1034,'Can change x block configuration',259,'change_xblockconfiguration'),(1035,'Can delete x block configuration',259,'delete_xblockconfiguration'),(1036,'Can view x block configuration',259,'view_xblockconfiguration'),(1037,'Can add x block studio configuration',260,'add_xblockstudioconfiguration'),(1038,'Can change x block studio configuration',260,'change_xblockstudioconfiguration'),(1039,'Can delete x block studio configuration',260,'delete_xblockstudioconfiguration'),(1040,'Can view x block studio configuration',260,'view_xblockstudioconfiguration'),(1041,'Can add x block studio configuration flag',261,'add_xblockstudioconfigurationflag'),(1042,'Can change x block studio configuration flag',261,'change_xblockstudioconfigurationflag'),(1043,'Can delete x block studio configuration flag',261,'delete_xblockstudioconfigurationflag'),(1044,'Can view x block studio configuration flag',261,'view_xblockstudioconfigurationflag'),(1045,'Can add programs api config',262,'add_programsapiconfig'),(1046,'Can change programs api config',262,'change_programsapiconfig'),(1047,'Can delete programs api config',262,'delete_programsapiconfig'),(1048,'Can view programs api config',262,'view_programsapiconfig'),(1049,'Can add program live configuration',263,'add_programliveconfiguration'),(1050,'Can change program live configuration',263,'change_programliveconfiguration'),(1051,'Can delete program live configuration',263,'delete_programliveconfiguration'),(1052,'Can view program live configuration',263,'view_programliveconfiguration'),(1053,'Can add program discussions configuration',264,'add_programdiscussionsconfiguration'),(1054,'Can change program discussions configuration',264,'change_programdiscussionsconfiguration'),(1055,'Can delete program discussions configuration',264,'delete_programdiscussionsconfiguration'),(1056,'Can view program discussions configuration',264,'view_programdiscussionsconfiguration'),(1057,'Can add historical program live configuration',265,'add_historicalprogramliveconfiguration'),(1058,'Can change historical program live configuration',265,'change_historicalprogramliveconfiguration'),(1059,'Can delete historical program live configuration',265,'delete_historicalprogramliveconfiguration'),(1060,'Can view historical program live configuration',265,'view_historicalprogramliveconfiguration'),(1061,'Can add historical program discussions configuration',266,'add_historicalprogramdiscussionsconfiguration'),(1062,'Can change historical program discussions configuration',266,'change_historicalprogramdiscussionsconfiguration'),(1063,'Can delete historical program discussions configuration',266,'delete_historicalprogramdiscussionsconfiguration'),(1064,'Can view historical program discussions configuration',266,'view_historicalprogramdiscussionsconfiguration'),(1065,'Can add catalog integration',267,'add_catalogintegration'),(1066,'Can change catalog integration',267,'change_catalogintegration'),(1067,'Can delete catalog integration',267,'delete_catalogintegration'),(1068,'Can view catalog integration',267,'view_catalogintegration'),(1069,'Can add kv store',268,'add_kvstore'),(1070,'Can change kv store',268,'change_kvstore'),(1071,'Can delete kv store',268,'delete_kvstore'),(1072,'Can view kv store',268,'view_kvstore'),(1073,'Can add course content milestone',269,'add_coursecontentmilestone'),(1074,'Can change course content milestone',269,'change_coursecontentmilestone'),(1075,'Can delete course content milestone',269,'delete_coursecontentmilestone'),(1076,'Can view course content milestone',269,'view_coursecontentmilestone'),(1077,'Can add course milestone',270,'add_coursemilestone'),(1078,'Can change course milestone',270,'change_coursemilestone'),(1079,'Can delete course milestone',270,'delete_coursemilestone'),(1080,'Can view course milestone',270,'view_coursemilestone'),(1081,'Can add milestone',271,'add_milestone'),(1082,'Can change milestone',271,'change_milestone'),(1083,'Can delete milestone',271,'delete_milestone'),(1084,'Can view milestone',271,'view_milestone'),(1085,'Can add milestone relationship type',272,'add_milestonerelationshiptype'),(1086,'Can change milestone relationship type',272,'change_milestonerelationshiptype'),(1087,'Can delete milestone relationship type',272,'delete_milestonerelationshiptype'),(1088,'Can view milestone relationship type',272,'view_milestonerelationshiptype'),(1089,'Can add user milestone',273,'add_usermilestone'),(1090,'Can change user milestone',273,'change_usermilestone'),(1091,'Can delete user milestone',273,'delete_usermilestone'),(1092,'Can view user milestone',273,'view_usermilestone'),(1093,'Can add api access request',1,'add_apiaccessrequest'),(1094,'Can change api access request',1,'change_apiaccessrequest'),(1095,'Can delete api access request',1,'delete_apiaccessrequest'),(1096,'Can view api access request',1,'view_apiaccessrequest'),(1097,'Can add api access config',274,'add_apiaccessconfig'),(1098,'Can change api access config',274,'change_apiaccessconfig'),(1099,'Can delete api access config',274,'delete_apiaccessconfig'),(1100,'Can view api access config',274,'view_apiaccessconfig'),(1101,'Can add catalog',275,'add_catalog'),(1102,'Can change catalog',275,'change_catalog'),(1103,'Can delete catalog',275,'delete_catalog'),(1104,'Can view catalog',275,'view_catalog'),(1105,'Can add badge assertion',276,'add_badgeassertion'),(1106,'Can change badge assertion',276,'change_badgeassertion'),(1107,'Can delete badge assertion',276,'delete_badgeassertion'),(1108,'Can view badge assertion',276,'view_badgeassertion'),(1109,'Can add badge class',277,'add_badgeclass'),(1110,'Can change badge class',277,'change_badgeclass'),(1111,'Can delete badge class',277,'delete_badgeclass'),(1112,'Can view badge class',277,'view_badgeclass'),(1113,'Can add course complete image configuration',278,'add_coursecompleteimageconfiguration'),(1114,'Can change course complete image configuration',278,'change_coursecompleteimageconfiguration'),(1115,'Can delete course complete image configuration',278,'delete_coursecompleteimageconfiguration'),(1116,'Can view course complete image configuration',278,'view_coursecompleteimageconfiguration'),(1117,'Can add course event badges configuration',279,'add_courseeventbadgesconfiguration'),(1118,'Can change course event badges configuration',279,'change_courseeventbadgesconfiguration'),(1119,'Can delete course event badges configuration',279,'delete_courseeventbadgesconfiguration'),(1120,'Can view course event badges configuration',279,'view_courseeventbadgesconfiguration'),(1121,'Can add failed task',280,'add_failedtask'),(1122,'Can change failed task',280,'change_failedtask'),(1123,'Can delete failed task',280,'delete_failedtask'),(1124,'Can view failed task',280,'view_failedtask'),(1125,'Can add crawlers config',281,'add_crawlersconfig'),(1126,'Can change crawlers config',281,'change_crawlersconfig'),(1127,'Can delete crawlers config',281,'delete_crawlersconfig'),(1128,'Can view crawlers config',281,'view_crawlersconfig'),(1129,'Can add Waffle flag course override',282,'add_waffleflagcourseoverridemodel'),(1130,'Can change Waffle flag course override',282,'change_waffleflagcourseoverridemodel'),(1131,'Can delete Waffle flag course override',282,'delete_waffleflagcourseoverridemodel'),(1132,'Can view Waffle flag course override',282,'view_waffleflagcourseoverridemodel'),(1133,'Can add Waffle flag org override',283,'add_waffleflagorgoverridemodel'),(1134,'Can change Waffle flag org override',283,'change_waffleflagorgoverridemodel'),(1135,'Can delete Waffle flag org override',283,'delete_waffleflagorgoverridemodel'),(1136,'Can view Waffle flag org override',283,'view_waffleflagorgoverridemodel'),(1137,'Can add course goal',284,'add_coursegoal'),(1138,'Can change course goal',284,'change_coursegoal'),(1139,'Can delete course goal',284,'delete_coursegoal'),(1140,'Can view course goal',284,'view_coursegoal'),(1141,'Can add historical course goal',285,'add_historicalcoursegoal'),(1142,'Can change historical course goal',285,'change_historicalcoursegoal'),(1143,'Can delete historical course goal',285,'delete_historicalcoursegoal'),(1144,'Can view historical course goal',285,'view_historicalcoursegoal'),(1145,'Can add user activity',286,'add_useractivity'),(1146,'Can change user activity',286,'change_useractivity'),(1147,'Can delete user activity',286,'delete_useractivity'),(1148,'Can view user activity',286,'view_useractivity'),(1149,'Can add course goal reminder status',287,'add_coursegoalreminderstatus'),(1150,'Can change course goal reminder status',287,'change_coursegoalreminderstatus'),(1151,'Can delete course goal reminder status',287,'delete_coursegoalreminderstatus'),(1152,'Can view course goal reminder status',287,'view_coursegoalreminderstatus'),(1153,'Can add historical user calendar sync config',288,'add_historicalusercalendarsyncconfig'),(1154,'Can change historical user calendar sync config',288,'change_historicalusercalendarsyncconfig'),(1155,'Can delete historical user calendar sync config',288,'delete_historicalusercalendarsyncconfig'),(1156,'Can view historical user calendar sync config',288,'view_historicalusercalendarsyncconfig'),(1157,'Can add user calendar sync config',289,'add_usercalendarsyncconfig'),(1158,'Can change user calendar sync config',289,'change_usercalendarsyncconfig'),(1159,'Can delete user calendar sync config',289,'delete_usercalendarsyncconfig'),(1160,'Can view user calendar sync config',289,'view_usercalendarsyncconfig'),(1161,'Can add course duration limit config',290,'add_coursedurationlimitconfig'),(1162,'Can change course duration limit config',290,'change_coursedurationlimitconfig'),(1163,'Can delete course duration limit config',290,'delete_coursedurationlimitconfig'),(1164,'Can view course duration limit config',290,'view_coursedurationlimitconfig'),(1165,'Can add content type gating config',291,'add_contenttypegatingconfig'),(1166,'Can change content type gating config',291,'change_contenttypegatingconfig'),(1167,'Can delete content type gating config',291,'delete_contenttypegatingconfig'),(1168,'Can view content type gating config',291,'view_contenttypegatingconfig'),(1169,'Can add discount restriction config',292,'add_discountrestrictionconfig'),(1170,'Can change discount restriction config',292,'change_discountrestrictionconfig'),(1171,'Can delete discount restriction config',292,'delete_discountrestrictionconfig'),(1172,'Can view discount restriction config',292,'view_discountrestrictionconfig'),(1173,'Can add discount percentage config',293,'add_discountpercentageconfig'),(1174,'Can change discount percentage config',293,'change_discountpercentageconfig'),(1175,'Can delete discount percentage config',293,'delete_discountpercentageconfig'),(1176,'Can view discount percentage config',293,'view_discountpercentageconfig'),(1177,'Can add Experiment Data',294,'add_experimentdata'),(1178,'Can change Experiment Data',294,'change_experimentdata'),(1179,'Can delete Experiment Data',294,'delete_experimentdata'),(1180,'Can view Experiment Data',294,'view_experimentdata'),(1181,'Can add Experiment Key-Value Pair',295,'add_experimentkeyvalue'),(1182,'Can change Experiment Key-Value Pair',295,'change_experimentkeyvalue'),(1183,'Can delete Experiment Key-Value Pair',295,'delete_experimentkeyvalue'),(1184,'Can view Experiment Key-Value Pair',295,'view_experimentkeyvalue'),(1185,'Can add historical Experiment Key-Value Pair',296,'add_historicalexperimentkeyvalue'),(1186,'Can change historical Experiment Key-Value Pair',296,'change_historicalexperimentkeyvalue'),(1187,'Can delete historical Experiment Key-Value Pair',296,'delete_historicalexperimentkeyvalue'),(1188,'Can view historical Experiment Key-Value Pair',296,'view_historicalexperimentkeyvalue'),(1189,'Can add self paced relative dates config',297,'add_selfpacedrelativedatesconfig'),(1190,'Can change self paced relative dates config',297,'change_selfpacedrelativedatesconfig'),(1191,'Can delete self paced relative dates config',297,'delete_selfpacedrelativedatesconfig'),(1192,'Can view self paced relative dates config',297,'view_selfpacedrelativedatesconfig'),(1193,'Can add external id',298,'add_externalid'),(1194,'Can change external id',298,'change_externalid'),(1195,'Can delete external id',298,'delete_externalid'),(1196,'Can view external id',298,'view_externalid'),(1197,'Can add external id type',299,'add_externalidtype'),(1198,'Can change external id type',299,'change_externalidtype'),(1199,'Can delete external id type',299,'delete_externalidtype'),(1200,'Can view external id type',299,'view_externalidtype'),(1201,'Can add historical external id',300,'add_historicalexternalid'),(1202,'Can change historical external id',300,'change_historicalexternalid'),(1203,'Can delete historical external id',300,'delete_historicalexternalid'),(1204,'Can view historical external id',300,'view_historicalexternalid'),(1205,'Can add historical external id type',301,'add_historicalexternalidtype'),(1206,'Can change historical external id type',301,'change_historicalexternalidtype'),(1207,'Can delete historical external id type',301,'delete_historicalexternalidtype'),(1208,'Can view historical external id type',301,'view_historicalexternalidtype'),(1209,'Can add user demographic',302,'add_userdemographics'),(1210,'Can change user demographic',302,'change_userdemographics'),(1211,'Can delete user demographic',302,'delete_userdemographics'),(1212,'Can view user demographic',302,'view_userdemographics'),(1213,'Can add historical user demographic',303,'add_historicaluserdemographics'),(1214,'Can change historical user demographic',303,'change_historicaluserdemographics'),(1215,'Can delete historical user demographic',303,'delete_historicaluserdemographics'),(1216,'Can view historical user demographic',303,'view_historicaluserdemographics'),(1217,'Can add Schedule',304,'add_schedule'),(1218,'Can change Schedule',304,'change_schedule'),(1219,'Can delete Schedule',304,'delete_schedule'),(1220,'Can view Schedule',304,'view_schedule'),(1221,'Can add schedule config',305,'add_scheduleconfig'),(1222,'Can change schedule config',305,'change_scheduleconfig'),(1223,'Can delete schedule config',305,'delete_scheduleconfig'),(1224,'Can view schedule config',305,'view_scheduleconfig'),(1225,'Can add schedule experience',306,'add_scheduleexperience'),(1226,'Can change schedule experience',306,'change_scheduleexperience'),(1227,'Can delete schedule experience',306,'delete_scheduleexperience'),(1228,'Can view schedule experience',306,'view_scheduleexperience'),(1229,'Can add historical Schedule',307,'add_historicalschedule'),(1230,'Can change historical Schedule',307,'change_historicalschedule'),(1231,'Can delete historical Schedule',307,'delete_historicalschedule'),(1232,'Can view historical Schedule',307,'view_historicalschedule'),(1233,'Can add course section',308,'add_coursesection'),(1234,'Can change course section',308,'change_coursesection'),(1235,'Can delete course section',308,'delete_coursesection'),(1236,'Can view course section',308,'view_coursesection'),(1237,'Can add Course Sequence',309,'add_coursesectionsequence'),(1238,'Can change Course Sequence',309,'change_coursesectionsequence'),(1239,'Can delete Course Sequence',309,'delete_coursesectionsequence'),(1240,'Can view Course Sequence',309,'view_coursesectionsequence'),(1241,'Can add learning context',310,'add_learningcontext'),(1242,'Can change learning context',310,'change_learningcontext'),(1243,'Can delete learning context',310,'delete_learningcontext'),(1244,'Can view learning context',310,'view_learningcontext'),(1245,'Can add learning sequence',311,'add_learningsequence'),(1246,'Can change learning sequence',311,'change_learningsequence'),(1247,'Can delete learning sequence',311,'delete_learningsequence'),(1248,'Can view learning sequence',311,'view_learningsequence'),(1249,'Can add Course',312,'add_coursecontext'),(1250,'Can change Course',312,'change_coursecontext'),(1251,'Can delete Course',312,'delete_coursecontext'),(1252,'Can view Course',312,'view_coursecontext'),(1253,'Can add course sequence exam',313,'add_coursesequenceexam'),(1254,'Can change course sequence exam',313,'change_coursesequenceexam'),(1255,'Can delete course sequence exam',313,'delete_coursesequenceexam'),(1256,'Can view course sequence exam',313,'view_coursesequenceexam'),(1257,'Can add publish report',314,'add_publishreport'),(1258,'Can change publish report',314,'change_publishreport'),(1259,'Can delete publish report',314,'delete_publishreport'),(1260,'Can view publish report',314,'view_publishreport'),(1261,'Can add content error',315,'add_contenterror'),(1262,'Can change content error',315,'change_contenterror'),(1263,'Can delete content error',315,'delete_contenterror'),(1264,'Can view content error',315,'view_contenterror'),(1265,'Can add user partition group',316,'add_userpartitiongroup'),(1266,'Can change user partition group',316,'change_userpartitiongroup'),(1267,'Can delete user partition group',316,'delete_userpartitiongroup'),(1268,'Can view user partition group',316,'view_userpartitiongroup'),(1269,'Can add section sequence partition group',317,'add_sectionsequencepartitiongroup'),(1270,'Can change section sequence partition group',317,'change_sectionsequencepartitiongroup'),(1271,'Can delete section sequence partition group',317,'delete_sectionsequencepartitiongroup'),(1272,'Can view section sequence partition group',317,'view_sectionsequencepartitiongroup'),(1273,'Can add section partition group',318,'add_sectionpartitiongroup'),(1274,'Can change section partition group',318,'change_sectionpartitiongroup'),(1275,'Can delete section partition group',318,'delete_sectionpartitiongroup'),(1276,'Can view section partition group',318,'view_sectionpartitiongroup'),(1277,'Can add organization',319,'add_organization'),(1278,'Can change organization',319,'change_organization'),(1279,'Can delete organization',319,'delete_organization'),(1280,'Can view organization',319,'view_organization'),(1281,'Can add Link Course',320,'add_organizationcourse'),(1282,'Can change Link Course',320,'change_organizationcourse'),(1283,'Can delete Link Course',320,'delete_organizationcourse'),(1284,'Can view Link Course',320,'view_organizationcourse'),(1285,'Can add historical organization',321,'add_historicalorganization'),(1286,'Can change historical organization',321,'change_historicalorganization'),(1287,'Can delete historical organization',321,'delete_historicalorganization'),(1288,'Can view historical organization',321,'view_historicalorganization'),(1289,'Can add historical Link Course',322,'add_historicalorganizationcourse'),(1290,'Can change historical Link Course',322,'change_historicalorganizationcourse'),(1291,'Can delete historical Link Course',322,'delete_historicalorganizationcourse'),(1292,'Can view historical Link Course',322,'view_historicalorganizationcourse'),(1293,'Can add integrity signature',323,'add_integritysignature'),(1294,'Can change integrity signature',323,'change_integritysignature'),(1295,'Can delete integrity signature',323,'delete_integritysignature'),(1296,'Can view integrity signature',323,'view_integritysignature'),(1297,'Can add survey report',324,'add_surveyreport'),(1298,'Can change survey report',324,'change_surveyreport'),(1299,'Can delete survey report',324,'delete_surveyreport'),(1300,'Can view survey report',324,'view_surveyreport'),(1301,'Can add lti 1.3 tool key',325,'add_ltitoolkey'),(1302,'Can change lti 1.3 tool key',325,'change_ltitoolkey'),(1303,'Can delete lti 1.3 tool key',325,'delete_ltitoolkey'),(1304,'Can view lti 1.3 tool key',325,'view_ltitoolkey'),(1305,'Can add lti 1.3 tool',326,'add_ltitool'),(1306,'Can change lti 1.3 tool',326,'change_ltitool'),(1307,'Can delete lti 1.3 tool',326,'delete_ltitool'),(1308,'Can view lti 1.3 tool',326,'view_ltitool'),(1309,'Can add saved program',327,'add_savedprogram'),(1310,'Can change saved program',327,'change_savedprogram'),(1311,'Can delete saved program',327,'delete_savedprogram'),(1312,'Can view saved program',327,'view_savedprogram'),(1313,'Can add saved course',328,'add_savedcourse'),(1314,'Can change saved course',328,'change_savedcourse'),(1315,'Can delete saved course',328,'delete_savedcourse'),(1316,'Can view saved course',328,'view_savedcourse'),(1317,'Can add bundle',329,'add_bundle'),(1318,'Can change bundle',329,'change_bundle'),(1319,'Can delete bundle',329,'delete_bundle'),(1320,'Can view bundle',329,'view_bundle'),(1321,'Can add bundle link',330,'add_bundlelink'),(1322,'Can change bundle link',330,'change_bundlelink'),(1323,'Can delete bundle link',330,'delete_bundlelink'),(1324,'Can view bundle link',330,'view_bundlelink'),(1325,'Can add bundle version',331,'add_bundleversion'),(1326,'Can change bundle version',331,'change_bundleversion'),(1327,'Can delete bundle version',331,'delete_bundleversion'),(1328,'Can view bundle version',331,'view_bundleversion'),(1329,'Can add collection',332,'add_collection'),(1330,'Can change collection',332,'change_collection'),(1331,'Can delete collection',332,'delete_collection'),(1332,'Can view collection',332,'view_collection'),(1333,'Can add draft',333,'add_draft'),(1334,'Can change draft',333,'change_draft'),(1335,'Can delete draft',333,'delete_draft'),(1336,'Can view draft',333,'view_draft'),(1337,'Can add enrollment notification email template',334,'add_enrollmentnotificationemailtemplate'),(1338,'Can change enrollment notification email template',334,'change_enrollmentnotificationemailtemplate'),(1339,'Can delete enrollment notification email template',334,'delete_enrollmentnotificationemailtemplate'),(1340,'Can view enrollment notification email template',334,'view_enrollmentnotificationemailtemplate'),(1341,'Can add Enterprise Catalog Query',335,'add_enterprisecatalogquery'),(1342,'Can change Enterprise Catalog Query',335,'change_enterprisecatalogquery'),(1343,'Can delete Enterprise Catalog Query',335,'delete_enterprisecatalogquery'),(1344,'Can view Enterprise Catalog Query',335,'view_enterprisecatalogquery'),(1345,'Can add Enterprise Customer',336,'add_enterprisecustomer'),(1346,'Can change Enterprise Customer',336,'change_enterprisecustomer'),(1347,'Can delete Enterprise Customer',336,'delete_enterprisecustomer'),(1348,'Can view Enterprise Customer',336,'view_enterprisecustomer'),(1349,'Can add Branding Configuration',337,'add_enterprisecustomerbrandingconfiguration'),(1350,'Can change Branding Configuration',337,'change_enterprisecustomerbrandingconfiguration'),(1351,'Can delete Branding Configuration',337,'delete_enterprisecustomerbrandingconfiguration'),(1352,'Can view Branding Configuration',337,'view_enterprisecustomerbrandingconfiguration'),(1353,'Can add Enterprise Customer Catalog',338,'add_enterprisecustomercatalog'),(1354,'Can change Enterprise Customer Catalog',338,'change_enterprisecustomercatalog'),(1355,'Can delete Enterprise Customer Catalog',338,'delete_enterprisecustomercatalog'),(1356,'Can view Enterprise Customer Catalog',338,'view_enterprisecustomercatalog'),(1357,'Can add enterprise customer identity provider',339,'add_enterprisecustomeridentityprovider'),(1358,'Can change enterprise customer identity provider',339,'change_enterprisecustomeridentityprovider'),(1359,'Can delete enterprise customer identity provider',339,'delete_enterprisecustomeridentityprovider'),(1360,'Can view enterprise customer identity provider',339,'view_enterprisecustomeridentityprovider'),(1361,'Can add enterprise customer reporting configuration',340,'add_enterprisecustomerreportingconfiguration'),(1362,'Can change enterprise customer reporting configuration',340,'change_enterprisecustomerreportingconfiguration'),(1363,'Can delete enterprise customer reporting configuration',340,'delete_enterprisecustomerreportingconfiguration'),(1364,'Can view enterprise customer reporting configuration',340,'view_enterprisecustomerreportingconfiguration'),(1365,'Can add Enterprise Customer Type',341,'add_enterprisecustomertype'),(1366,'Can change Enterprise Customer Type',341,'change_enterprisecustomertype'),(1367,'Can delete Enterprise Customer Type',341,'delete_enterprisecustomertype'),(1368,'Can view Enterprise Customer Type',341,'view_enterprisecustomertype'),(1369,'Can add Enterprise Customer Learner',342,'add_enterprisecustomeruser'),(1370,'Can change Enterprise Customer Learner',342,'change_enterprisecustomeruser'),(1371,'Can delete Enterprise Customer Learner',342,'delete_enterprisecustomeruser'),(1372,'Can view Enterprise Customer Learner',342,'view_enterprisecustomeruser'),(1373,'Can add enterprise course enrollment',343,'add_enterprisecourseenrollment'),(1374,'Can change enterprise course enrollment',343,'change_enterprisecourseenrollment'),(1375,'Can delete enterprise course enrollment',343,'delete_enterprisecourseenrollment'),(1376,'Can view enterprise course enrollment',343,'view_enterprisecourseenrollment'),(1377,'Can add enterprise enrollment source',344,'add_enterpriseenrollmentsource'),(1378,'Can change enterprise enrollment source',344,'change_enterpriseenrollmentsource'),(1379,'Can delete enterprise enrollment source',344,'delete_enterpriseenrollmentsource'),(1380,'Can view enterprise enrollment source',344,'view_enterpriseenrollmentsource'),(1381,'Can add enterprise feature role',345,'add_enterprisefeaturerole'),(1382,'Can change enterprise feature role',345,'change_enterprisefeaturerole'),(1383,'Can delete enterprise feature role',345,'delete_enterprisefeaturerole'),(1384,'Can view enterprise feature role',345,'view_enterprisefeaturerole'),(1385,'Can add enterprise feature user role assignment',346,'add_enterprisefeatureuserroleassignment'),(1386,'Can change enterprise feature user role assignment',346,'change_enterprisefeatureuserroleassignment'),(1387,'Can delete enterprise feature user role assignment',346,'delete_enterprisefeatureuserroleassignment'),(1388,'Can view enterprise feature user role assignment',346,'view_enterprisefeatureuserroleassignment'),(1389,'Can add historical enrollment notification email template',347,'add_historicalenrollmentnotificationemailtemplate'),(1390,'Can change historical enrollment notification email template',347,'change_historicalenrollmentnotificationemailtemplate'),(1391,'Can delete historical enrollment notification email template',347,'delete_historicalenrollmentnotificationemailtemplate'),(1392,'Can view historical enrollment notification email template',347,'view_historicalenrollmentnotificationemailtemplate'),(1393,'Can add historical enterprise course enrollment',348,'add_historicalenterprisecourseenrollment'),(1394,'Can change historical enterprise course enrollment',348,'change_historicalenterprisecourseenrollment'),(1395,'Can delete historical enterprise course enrollment',348,'delete_historicalenterprisecourseenrollment'),(1396,'Can view historical enterprise course enrollment',348,'view_historicalenterprisecourseenrollment'),(1397,'Can add historical Enterprise Customer',349,'add_historicalenterprisecustomer'),(1398,'Can change historical Enterprise Customer',349,'change_historicalenterprisecustomer'),(1399,'Can delete historical Enterprise Customer',349,'delete_historicalenterprisecustomer'),(1400,'Can view historical Enterprise Customer',349,'view_historicalenterprisecustomer'),(1401,'Can add historical Enterprise Customer Catalog',350,'add_historicalenterprisecustomercatalog'),(1402,'Can change historical Enterprise Customer Catalog',350,'change_historicalenterprisecustomercatalog'),(1403,'Can delete historical Enterprise Customer Catalog',350,'delete_historicalenterprisecustomercatalog'),(1404,'Can view historical Enterprise Customer Catalog',350,'view_historicalenterprisecustomercatalog'),(1405,'Can add historical pending enrollment',351,'add_historicalpendingenrollment'),(1406,'Can change historical pending enrollment',351,'change_historicalpendingenrollment'),(1407,'Can delete historical pending enrollment',351,'delete_historicalpendingenrollment'),(1408,'Can view historical pending enrollment',351,'view_historicalpendingenrollment'),(1409,'Can add historical pending enterprise customer user',352,'add_historicalpendingenterprisecustomeruser'),(1410,'Can change historical pending enterprise customer user',352,'change_historicalpendingenterprisecustomeruser'),(1411,'Can delete historical pending enterprise customer user',352,'delete_historicalpendingenterprisecustomeruser'),(1412,'Can view historical pending enterprise customer user',352,'view_historicalpendingenterprisecustomeruser'),(1413,'Can add pending enrollment',353,'add_pendingenrollment'),(1414,'Can change pending enrollment',353,'change_pendingenrollment'),(1415,'Can delete pending enrollment',353,'delete_pendingenrollment'),(1416,'Can view pending enrollment',353,'view_pendingenrollment'),(1417,'Can add pending enterprise customer user',354,'add_pendingenterprisecustomeruser'),(1418,'Can change pending enterprise customer user',354,'change_pendingenterprisecustomeruser'),(1419,'Can delete pending enterprise customer user',354,'delete_pendingenterprisecustomeruser'),(1420,'Can view pending enterprise customer user',354,'view_pendingenterprisecustomeruser'),(1421,'Can add system wide enterprise role',355,'add_systemwideenterpriserole'),(1422,'Can change system wide enterprise role',355,'change_systemwideenterpriserole'),(1423,'Can delete system wide enterprise role',355,'delete_systemwideenterpriserole'),(1424,'Can view system wide enterprise role',355,'view_systemwideenterpriserole'),(1425,'Can add system wide enterprise user role assignment',356,'add_systemwideenterpriseuserroleassignment'),(1426,'Can change system wide enterprise user role assignment',356,'change_systemwideenterpriseuserroleassignment'),(1427,'Can delete system wide enterprise user role assignment',356,'delete_systemwideenterpriseuserroleassignment'),(1428,'Can view system wide enterprise user role assignment',356,'view_systemwideenterpriseuserroleassignment'),(1429,'Can add licensed enterprise course enrollment',357,'add_licensedenterprisecourseenrollment'),(1430,'Can change licensed enterprise course enrollment',357,'change_licensedenterprisecourseenrollment'),(1431,'Can delete licensed enterprise course enrollment',357,'delete_licensedenterprisecourseenrollment'),(1432,'Can view licensed enterprise course enrollment',357,'view_licensedenterprisecourseenrollment'),(1433,'Can add historical licensed enterprise course enrollment',358,'add_historicallicensedenterprisecourseenrollment'),(1434,'Can change historical licensed enterprise course enrollment',358,'change_historicallicensedenterprisecourseenrollment'),(1435,'Can delete historical licensed enterprise course enrollment',358,'delete_historicallicensedenterprisecourseenrollment'),(1436,'Can view historical licensed enterprise course enrollment',358,'view_historicallicensedenterprisecourseenrollment'),(1437,'Can add historical pending enterprise customer admin user',359,'add_historicalpendingenterprisecustomeradminuser'),(1438,'Can change historical pending enterprise customer admin user',359,'change_historicalpendingenterprisecustomeradminuser'),(1439,'Can delete historical pending enterprise customer admin user',359,'delete_historicalpendingenterprisecustomeradminuser'),(1440,'Can view historical pending enterprise customer admin user',359,'view_historicalpendingenterprisecustomeradminuser'),(1441,'Can add pending enterprise customer admin user',360,'add_pendingenterprisecustomeradminuser'),(1442,'Can change pending enterprise customer admin user',360,'change_pendingenterprisecustomeradminuser'),(1443,'Can delete pending enterprise customer admin user',360,'delete_pendingenterprisecustomeradminuser'),(1444,'Can view pending enterprise customer admin user',360,'view_pendingenterprisecustomeradminuser'),(1445,'Can add update role assignments with customers config',361,'add_updateroleassignmentswithcustomersconfig'),(1446,'Can change update role assignments with customers config',361,'change_updateroleassignmentswithcustomersconfig'),(1447,'Can delete update role assignments with customers config',361,'delete_updateroleassignmentswithcustomersconfig'),(1448,'Can view update role assignments with customers config',361,'view_updateroleassignmentswithcustomersconfig'),(1449,'Can add Admin Notification Filter',362,'add_adminnotificationfilter'),(1450,'Can change Admin Notification Filter',362,'change_adminnotificationfilter'),(1451,'Can delete Admin Notification Filter',362,'delete_adminnotificationfilter'),(1452,'Can view Admin Notification Filter',362,'view_adminnotificationfilter'),(1453,'Can add Admin Notification',363,'add_adminnotification'),(1454,'Can change Admin Notification',363,'change_adminnotification'),(1455,'Can delete Admin Notification',363,'delete_adminnotification'),(1456,'Can view Admin Notification',363,'view_adminnotification'),(1457,'Can add Admin Notification Read',364,'add_adminnotificationread'),(1458,'Can change Admin Notification Read',364,'change_adminnotificationread'),(1459,'Can delete Admin Notification Read',364,'delete_adminnotificationread'),(1460,'Can view Admin Notification Read',364,'view_adminnotificationread'),(1461,'Can add historical system wide enterprise user role assignment',365,'add_historicalsystemwideenterpriseuserroleassignment'),(1462,'Can change historical system wide enterprise user role assignment',365,'change_historicalsystemwideenterpriseuserroleassignment'),(1463,'Can delete historical system wide enterprise user role assignment',365,'delete_historicalsystemwideenterpriseuserroleassignment'),(1464,'Can view historical system wide enterprise user role assignment',365,'view_historicalsystemwideenterpriseuserroleassignment'),(1465,'Can add historical Enterprise Customer Learner',366,'add_historicalenterprisecustomeruser'),(1466,'Can change historical Enterprise Customer Learner',366,'change_historicalenterprisecustomeruser'),(1467,'Can delete historical Enterprise Customer Learner',366,'delete_historicalenterprisecustomeruser'),(1468,'Can view historical Enterprise Customer Learner',366,'view_historicalenterprisecustomeruser'),(1469,'Can add bulk_update_catalog_query_id argument',367,'add_bulkcatalogqueryupdatecommandconfiguration'),(1470,'Can change bulk_update_catalog_query_id argument',367,'change_bulkcatalogqueryupdatecommandconfiguration'),(1471,'Can delete bulk_update_catalog_query_id argument',367,'delete_bulkcatalogqueryupdatecommandconfiguration'),(1472,'Can view bulk_update_catalog_query_id argument',367,'view_bulkcatalogqueryupdatecommandconfiguration'),(1473,'Can add historical enterprise customer invite key',368,'add_historicalenterprisecustomerinvitekey'),(1474,'Can change historical enterprise customer invite key',368,'change_historicalenterprisecustomerinvitekey'),(1475,'Can delete historical enterprise customer invite key',368,'delete_historicalenterprisecustomerinvitekey'),(1476,'Can view historical enterprise customer invite key',368,'view_historicalenterprisecustomerinvitekey'),(1477,'Can add enterprise customer invite key',369,'add_enterprisecustomerinvitekey'),(1478,'Can change enterprise customer invite key',369,'change_enterprisecustomerinvitekey'),(1479,'Can delete enterprise customer invite key',369,'delete_enterprisecustomerinvitekey'),(1480,'Can view enterprise customer invite key',369,'view_enterprisecustomerinvitekey'),(1481,'Can add Data Sharing Consent Record',370,'add_datasharingconsent'),(1482,'Can change Data Sharing Consent Record',370,'change_datasharingconsent'),(1483,'Can delete Data Sharing Consent Record',370,'delete_datasharingconsent'),(1484,'Can view Data Sharing Consent Record',370,'view_datasharingconsent'),(1485,'Can add historical Data Sharing Consent Record',371,'add_historicaldatasharingconsent'),(1486,'Can change historical Data Sharing Consent Record',371,'change_historicaldatasharingconsent'),(1487,'Can delete historical Data Sharing Consent Record',371,'delete_historicaldatasharingconsent'),(1488,'Can view historical Data Sharing Consent Record',371,'view_historicaldatasharingconsent'),(1489,'Can add data sharing consent text overrides',372,'add_datasharingconsenttextoverrides'),(1490,'Can change data sharing consent text overrides',372,'change_datasharingconsenttextoverrides'),(1491,'Can delete data sharing consent text overrides',372,'delete_datasharingconsenttextoverrides'),(1492,'Can view data sharing consent text overrides',372,'view_datasharingconsenttextoverrides'),(1493,'Can add content metadata item transmission',373,'add_contentmetadataitemtransmission'),(1494,'Can change content metadata item transmission',373,'change_contentmetadataitemtransmission'),(1495,'Can delete content metadata item transmission',373,'delete_contentmetadataitemtransmission'),(1496,'Can view content metadata item transmission',373,'view_contentmetadataitemtransmission'),(1497,'Can add generic learner data transmission audit',374,'add_genericlearnerdatatransmissionaudit'),(1498,'Can change generic learner data transmission audit',374,'change_genericlearnerdatatransmissionaudit'),(1499,'Can delete generic learner data transmission audit',374,'delete_genericlearnerdatatransmissionaudit'),(1500,'Can view generic learner data transmission audit',374,'view_genericlearnerdatatransmissionaudit'),(1501,'Can add generic enterprise customer plugin configuration',375,'add_genericenterprisecustomerpluginconfiguration'),(1502,'Can change generic enterprise customer plugin configuration',375,'change_genericenterprisecustomerpluginconfiguration'),(1503,'Can delete generic enterprise customer plugin configuration',375,'delete_genericenterprisecustomerpluginconfiguration'),(1504,'Can view generic enterprise customer plugin configuration',375,'view_genericenterprisecustomerpluginconfiguration'),(1505,'Can add api response record',376,'add_apiresponserecord'),(1506,'Can change api response record',376,'change_apiresponserecord'),(1507,'Can delete api response record',376,'delete_apiresponserecord'),(1508,'Can view api response record',376,'view_apiresponserecord'),(1509,'Can add degreed enterprise customer configuration',377,'add_degreedenterprisecustomerconfiguration'),(1510,'Can change degreed enterprise customer configuration',377,'change_degreedenterprisecustomerconfiguration'),(1511,'Can delete degreed enterprise customer configuration',377,'delete_degreedenterprisecustomerconfiguration'),(1512,'Can view degreed enterprise customer configuration',377,'view_degreedenterprisecustomerconfiguration'),(1513,'Can add degreed global configuration',378,'add_degreedglobalconfiguration'),(1514,'Can change degreed global configuration',378,'change_degreedglobalconfiguration'),(1515,'Can delete degreed global configuration',378,'delete_degreedglobalconfiguration'),(1516,'Can view degreed global configuration',378,'view_degreedglobalconfiguration'),(1517,'Can add degreed learner data transmission audit',379,'add_degreedlearnerdatatransmissionaudit'),(1518,'Can change degreed learner data transmission audit',379,'change_degreedlearnerdatatransmissionaudit'),(1519,'Can delete degreed learner data transmission audit',379,'delete_degreedlearnerdatatransmissionaudit'),(1520,'Can view degreed learner data transmission audit',379,'view_degreedlearnerdatatransmissionaudit'),(1521,'Can add historical degreed enterprise customer configuration',380,'add_historicaldegreedenterprisecustomerconfiguration'),(1522,'Can change historical degreed enterprise customer configuration',380,'change_historicaldegreedenterprisecustomerconfiguration'),(1523,'Can delete historical degreed enterprise customer configuration',380,'delete_historicaldegreedenterprisecustomerconfiguration'),(1524,'Can view historical degreed enterprise customer configuration',380,'view_historicaldegreedenterprisecustomerconfiguration'),(1525,'Can add degreed2 learner data transmission audit',381,'add_degreed2learnerdatatransmissionaudit'),(1526,'Can change degreed2 learner data transmission audit',381,'change_degreed2learnerdatatransmissionaudit'),(1527,'Can delete degreed2 learner data transmission audit',381,'delete_degreed2learnerdatatransmissionaudit'),(1528,'Can view degreed2 learner data transmission audit',381,'view_degreed2learnerdatatransmissionaudit'),(1529,'Can add historical degreed2 enterprise customer configuration',382,'add_historicaldegreed2enterprisecustomerconfiguration'),(1530,'Can change historical degreed2 enterprise customer configuration',382,'change_historicaldegreed2enterprisecustomerconfiguration'),(1531,'Can delete historical degreed2 enterprise customer configuration',382,'delete_historicaldegreed2enterprisecustomerconfiguration'),(1532,'Can view historical degreed2 enterprise customer configuration',382,'view_historicaldegreed2enterprisecustomerconfiguration'),(1533,'Can add degreed2 enterprise customer configuration',383,'add_degreed2enterprisecustomerconfiguration'),(1534,'Can change degreed2 enterprise customer configuration',383,'change_degreed2enterprisecustomerconfiguration'),(1535,'Can delete degreed2 enterprise customer configuration',383,'delete_degreed2enterprisecustomerconfiguration'),(1536,'Can view degreed2 enterprise customer configuration',383,'view_degreed2enterprisecustomerconfiguration'),(1537,'Can add sap success factors global configuration',384,'add_sapsuccessfactorsglobalconfiguration'),(1538,'Can change sap success factors global configuration',384,'change_sapsuccessfactorsglobalconfiguration'),(1539,'Can delete sap success factors global configuration',384,'delete_sapsuccessfactorsglobalconfiguration'),(1540,'Can view sap success factors global configuration',384,'view_sapsuccessfactorsglobalconfiguration'),(1541,'Can add sap success factors enterprise customer configuration',385,'add_sapsuccessfactorsenterprisecustomerconfiguration'),(1542,'Can change sap success factors enterprise customer configuration',385,'change_sapsuccessfactorsenterprisecustomerconfiguration'),(1543,'Can delete sap success factors enterprise customer configuration',385,'delete_sapsuccessfactorsenterprisecustomerconfiguration'),(1544,'Can view sap success factors enterprise customer configuration',385,'view_sapsuccessfactorsenterprisecustomerconfiguration'),(1545,'Can add sap success factors learner data transmission audit',386,'add_sapsuccessfactorslearnerdatatransmissionaudit'),(1546,'Can change sap success factors learner data transmission audit',386,'change_sapsuccessfactorslearnerdatatransmissionaudit'),(1547,'Can delete sap success factors learner data transmission audit',386,'delete_sapsuccessfactorslearnerdatatransmissionaudit'),(1548,'Can view sap success factors learner data transmission audit',386,'view_sapsuccessfactorslearnerdatatransmissionaudit'),(1549,'Can add cornerstone enterprise customer configuration',387,'add_cornerstoneenterprisecustomerconfiguration'),(1550,'Can change cornerstone enterprise customer configuration',387,'change_cornerstoneenterprisecustomerconfiguration'),(1551,'Can delete cornerstone enterprise customer configuration',387,'delete_cornerstoneenterprisecustomerconfiguration'),(1552,'Can view cornerstone enterprise customer configuration',387,'view_cornerstoneenterprisecustomerconfiguration'),(1553,'Can add cornerstone global configuration',388,'add_cornerstoneglobalconfiguration'),(1554,'Can change cornerstone global configuration',388,'change_cornerstoneglobalconfiguration'),(1555,'Can delete cornerstone global configuration',388,'delete_cornerstoneglobalconfiguration'),(1556,'Can view cornerstone global configuration',388,'view_cornerstoneglobalconfiguration'),(1557,'Can add cornerstone learner data transmission audit',389,'add_cornerstonelearnerdatatransmissionaudit'),(1558,'Can change cornerstone learner data transmission audit',389,'change_cornerstonelearnerdatatransmissionaudit'),(1559,'Can delete cornerstone learner data transmission audit',389,'delete_cornerstonelearnerdatatransmissionaudit'),(1560,'Can view cornerstone learner data transmission audit',389,'view_cornerstonelearnerdatatransmissionaudit'),(1561,'Can add historical cornerstone enterprise customer configuration',390,'add_historicalcornerstoneenterprisecustomerconfiguration'),(1562,'Can change historical cornerstone enterprise customer configuration',390,'change_historicalcornerstoneenterprisecustomerconfiguration'),(1563,'Can delete historical cornerstone enterprise customer configuration',390,'delete_historicalcornerstoneenterprisecustomerconfiguration'),(1564,'Can view historical cornerstone enterprise customer configuration',390,'view_historicalcornerstoneenterprisecustomerconfiguration'),(1565,'Can add cornerstone course key',391,'add_cornerstonecoursekey'),(1566,'Can change cornerstone course key',391,'change_cornerstonecoursekey'),(1567,'Can delete cornerstone course key',391,'delete_cornerstonecoursekey'),(1568,'Can view cornerstone course key',391,'view_cornerstonecoursekey'),(1569,'Can add xapilrs configuration',392,'add_xapilrsconfiguration'),(1570,'Can change xapilrs configuration',392,'change_xapilrsconfiguration'),(1571,'Can delete xapilrs configuration',392,'delete_xapilrsconfiguration'),(1572,'Can view xapilrs configuration',392,'view_xapilrsconfiguration'),(1573,'Can add xapi learner data transmission audit',393,'add_xapilearnerdatatransmissionaudit'),(1574,'Can change xapi learner data transmission audit',393,'change_xapilearnerdatatransmissionaudit'),(1575,'Can delete xapi learner data transmission audit',393,'delete_xapilearnerdatatransmissionaudit'),(1576,'Can view xapi learner data transmission audit',393,'view_xapilearnerdatatransmissionaudit'),(1577,'Can add blackboard learner data transmission audit',394,'add_blackboardlearnerdatatransmissionaudit'),(1578,'Can change blackboard learner data transmission audit',394,'change_blackboardlearnerdatatransmissionaudit'),(1579,'Can delete blackboard learner data transmission audit',394,'delete_blackboardlearnerdatatransmissionaudit'),(1580,'Can view blackboard learner data transmission audit',394,'view_blackboardlearnerdatatransmissionaudit'),(1581,'Can add blackboard learner assessment data transmission audit',395,'add_blackboardlearnerassessmentdatatransmissionaudit'),(1582,'Can change blackboard learner assessment data transmission audit',395,'change_blackboardlearnerassessmentdatatransmissionaudit'),(1583,'Can delete blackboard learner assessment data transmission audit',395,'delete_blackboardlearnerassessmentdatatransmissionaudit'),(1584,'Can view blackboard learner assessment data transmission audit',395,'view_blackboardlearnerassessmentdatatransmissionaudit'),(1585,'Can add blackboard enterprise customer configuration',396,'add_blackboardenterprisecustomerconfiguration'),(1586,'Can change blackboard enterprise customer configuration',396,'change_blackboardenterprisecustomerconfiguration'),(1587,'Can delete blackboard enterprise customer configuration',396,'delete_blackboardenterprisecustomerconfiguration'),(1588,'Can view blackboard enterprise customer configuration',396,'view_blackboardenterprisecustomerconfiguration'),(1589,'Can add historical blackboard enterprise customer configuration',397,'add_historicalblackboardenterprisecustomerconfiguration'),(1590,'Can change historical blackboard enterprise customer configuration',397,'change_historicalblackboardenterprisecustomerconfiguration'),(1591,'Can delete historical blackboard enterprise customer configuration',397,'delete_historicalblackboardenterprisecustomerconfiguration'),(1592,'Can view historical blackboard enterprise customer configuration',397,'view_historicalblackboardenterprisecustomerconfiguration'),(1593,'Can add blackboard global configuration',398,'add_blackboardglobalconfiguration'),(1594,'Can change blackboard global configuration',398,'change_blackboardglobalconfiguration'),(1595,'Can delete blackboard global configuration',398,'delete_blackboardglobalconfiguration'),(1596,'Can view blackboard global configuration',398,'view_blackboardglobalconfiguration'),(1597,'Can add historical canvas enterprise customer configuration',399,'add_historicalcanvasenterprisecustomerconfiguration'),(1598,'Can change historical canvas enterprise customer configuration',399,'change_historicalcanvasenterprisecustomerconfiguration'),(1599,'Can delete historical canvas enterprise customer configuration',399,'delete_historicalcanvasenterprisecustomerconfiguration'),(1600,'Can view historical canvas enterprise customer configuration',399,'view_historicalcanvasenterprisecustomerconfiguration'),(1601,'Can add canvas enterprise customer configuration',400,'add_canvasenterprisecustomerconfiguration'),(1602,'Can change canvas enterprise customer configuration',400,'change_canvasenterprisecustomerconfiguration'),(1603,'Can delete canvas enterprise customer configuration',400,'delete_canvasenterprisecustomerconfiguration'),(1604,'Can view canvas enterprise customer configuration',400,'view_canvasenterprisecustomerconfiguration'),(1605,'Can add canvas learner data transmission audit',401,'add_canvaslearnerdatatransmissionaudit'),(1606,'Can change canvas learner data transmission audit',401,'change_canvaslearnerdatatransmissionaudit'),(1607,'Can delete canvas learner data transmission audit',401,'delete_canvaslearnerdatatransmissionaudit'),(1608,'Can view canvas learner data transmission audit',401,'view_canvaslearnerdatatransmissionaudit'),(1609,'Can add canvas learner assessment data transmission audit',402,'add_canvaslearnerassessmentdatatransmissionaudit'),(1610,'Can change canvas learner assessment data transmission audit',402,'change_canvaslearnerassessmentdatatransmissionaudit'),(1611,'Can delete canvas learner assessment data transmission audit',402,'delete_canvaslearnerassessmentdatatransmissionaudit'),(1612,'Can view canvas learner assessment data transmission audit',402,'view_canvaslearnerassessmentdatatransmissionaudit'),(1613,'Can add moodle enterprise customer configuration',403,'add_moodleenterprisecustomerconfiguration'),(1614,'Can change moodle enterprise customer configuration',403,'change_moodleenterprisecustomerconfiguration'),(1615,'Can delete moodle enterprise customer configuration',403,'delete_moodleenterprisecustomerconfiguration'),(1616,'Can view moodle enterprise customer configuration',403,'view_moodleenterprisecustomerconfiguration'),(1617,'Can add historical moodle enterprise customer configuration',404,'add_historicalmoodleenterprisecustomerconfiguration'),(1618,'Can change historical moodle enterprise customer configuration',404,'change_historicalmoodleenterprisecustomerconfiguration'),(1619,'Can delete historical moodle enterprise customer configuration',404,'delete_historicalmoodleenterprisecustomerconfiguration'),(1620,'Can view historical moodle enterprise customer configuration',404,'view_historicalmoodleenterprisecustomerconfiguration'),(1621,'Can add moodle learner data transmission audit',405,'add_moodlelearnerdatatransmissionaudit'),(1622,'Can change moodle learner data transmission audit',405,'change_moodlelearnerdatatransmissionaudit'),(1623,'Can delete moodle learner data transmission audit',405,'delete_moodlelearnerdatatransmissionaudit'),(1624,'Can view moodle learner data transmission audit',405,'view_moodlelearnerdatatransmissionaudit'),(1625,'Can add announcement',406,'add_announcement'),(1626,'Can change announcement',406,'change_announcement'),(1627,'Can delete announcement',406,'delete_announcement'),(1628,'Can view announcement',406,'view_announcement'),(1629,'Can add bookmark',407,'add_bookmark'),(1630,'Can change bookmark',407,'change_bookmark'),(1631,'Can delete bookmark',407,'delete_bookmark'),(1632,'Can view bookmark',407,'view_bookmark'),(1633,'Can add x block cache',408,'add_xblockcache'),(1634,'Can change x block cache',408,'change_xblockcache'),(1635,'Can delete x block cache',408,'delete_xblockcache'),(1636,'Can view x block cache',408,'view_xblockcache'),(1637,'Can add content library',409,'add_contentlibrary'),(1638,'Can change content library',409,'change_contentlibrary'),(1639,'Can delete content library',409,'delete_contentlibrary'),(1640,'Can view content library',409,'view_contentlibrary'),(1641,'Can add content library permission',410,'add_contentlibrarypermission'),(1642,'Can change content library permission',410,'change_contentlibrarypermission'),(1643,'Can delete content library permission',410,'delete_contentlibrarypermission'),(1644,'Can view content library permission',410,'view_contentlibrarypermission'),(1645,'Can add lti profile',411,'add_ltiprofile'),(1646,'Can change lti profile',411,'change_ltiprofile'),(1647,'Can delete lti profile',411,'delete_ltiprofile'),(1648,'Can view lti profile',411,'view_ltiprofile'),(1649,'Can add lti graded resource',412,'add_ltigradedresource'),(1650,'Can change lti graded resource',412,'change_ltigradedresource'),(1651,'Can delete lti graded resource',412,'delete_ltigradedresource'),(1652,'Can view lti graded resource',412,'view_ltigradedresource'),(1653,'Can add content library block import task',413,'add_contentlibraryblockimporttask'),(1654,'Can change content library block import task',413,'change_contentlibraryblockimporttask'),(1655,'Can delete content library block import task',413,'delete_contentlibraryblockimporttask'),(1656,'Can view content library block import task',413,'view_contentlibraryblockimporttask'),(1657,'Can add course app status',414,'add_courseappstatus'),(1658,'Can change course app status',414,'change_courseappstatus'),(1659,'Can delete course app status',414,'delete_courseappstatus'),(1660,'Can view course app status',414,'view_courseappstatus'),(1661,'Can add historical course app status',415,'add_historicalcourseappstatus'),(1662,'Can change historical course app status',415,'change_historicalcourseappstatus'),(1663,'Can delete historical course app status',415,'delete_historicalcourseappstatus'),(1664,'Can view historical course app status',415,'view_historicalcourseappstatus'),(1665,'Can add historical course live configuration',416,'add_historicalcourseliveconfiguration'),(1666,'Can change historical course live configuration',416,'change_historicalcourseliveconfiguration'),(1667,'Can delete historical course live configuration',416,'delete_historicalcourseliveconfiguration'),(1668,'Can view historical course live configuration',416,'view_historicalcourseliveconfiguration'),(1669,'Can add course live configuration',417,'add_courseliveconfiguration'),(1670,'Can change course live configuration',417,'change_courseliveconfiguration'),(1671,'Can delete course live configuration',417,'delete_courseliveconfiguration'),(1672,'Can view course live configuration',417,'view_courseliveconfiguration'),(1673,'Can add credentials api config',418,'add_credentialsapiconfig'),(1674,'Can change credentials api config',418,'change_credentialsapiconfig'),(1675,'Can delete credentials api config',418,'delete_credentialsapiconfig'),(1676,'Can view credentials api config',418,'view_credentialsapiconfig'),(1677,'Can add notify_credentials argument',419,'add_notifycredentialsconfig'),(1678,'Can change notify_credentials argument',419,'change_notifycredentialsconfig'),(1679,'Can delete notify_credentials argument',419,'delete_notifycredentialsconfig'),(1680,'Can view notify_credentials argument',419,'view_notifycredentialsconfig'),(1681,'Can add historical discussions configuration',420,'add_historicaldiscussionsconfiguration'),(1682,'Can change historical discussions configuration',420,'change_historicaldiscussionsconfiguration'),(1683,'Can delete historical discussions configuration',420,'delete_historicaldiscussionsconfiguration'),(1684,'Can view historical discussions configuration',420,'view_historicaldiscussionsconfiguration'),(1685,'Can add discussions configuration',421,'add_discussionsconfiguration'),(1686,'Can change discussions configuration',421,'change_discussionsconfiguration'),(1687,'Can delete discussions configuration',421,'delete_discussionsconfiguration'),(1688,'Can view discussions configuration',421,'view_discussionsconfiguration'),(1689,'Can add provider filter',422,'add_providerfilter'),(1690,'Can change provider filter',422,'change_providerfilter'),(1691,'Can delete provider filter',422,'delete_providerfilter'),(1692,'Can view provider filter',422,'view_providerfilter'),(1693,'Can add discussion topic link',423,'add_discussiontopiclink'),(1694,'Can change discussion topic link',423,'change_discussiontopiclink'),(1695,'Can delete discussion topic link',423,'delete_discussiontopiclink'),(1696,'Can view discussion topic link',423,'view_discussiontopiclink'),(1697,'Can add persistent subsection grade',424,'add_persistentsubsectiongrade'),(1698,'Can change persistent subsection grade',424,'change_persistentsubsectiongrade'),(1699,'Can delete persistent subsection grade',424,'delete_persistentsubsectiongrade'),(1700,'Can view persistent subsection grade',424,'view_persistentsubsectiongrade'),(1701,'Can add visible blocks',425,'add_visibleblocks'),(1702,'Can change visible blocks',425,'change_visibleblocks'),(1703,'Can delete visible blocks',425,'delete_visibleblocks'),(1704,'Can view visible blocks',425,'view_visibleblocks'),(1705,'Can add persistent course grade',426,'add_persistentcoursegrade'),(1706,'Can change persistent course grade',426,'change_persistentcoursegrade'),(1707,'Can delete persistent course grade',426,'delete_persistentcoursegrade'),(1708,'Can view persistent course grade',426,'view_persistentcoursegrade'),(1709,'Can add compute grades setting',427,'add_computegradessetting'),(1710,'Can change compute grades setting',427,'change_computegradessetting'),(1711,'Can delete compute grades setting',427,'delete_computegradessetting'),(1712,'Can view compute grades setting',427,'view_computegradessetting'),(1713,'Can add persistent subsection grade override',428,'add_persistentsubsectiongradeoverride'),(1714,'Can change persistent subsection grade override',428,'change_persistentsubsectiongradeoverride'),(1715,'Can delete persistent subsection grade override',428,'delete_persistentsubsectiongradeoverride'),(1716,'Can view persistent subsection grade override',428,'view_persistentsubsectiongradeoverride'),(1717,'Can add historical persistent subsection grade override',429,'add_historicalpersistentsubsectiongradeoverride'),(1718,'Can change historical persistent subsection grade override',429,'change_historicalpersistentsubsectiongradeoverride'),(1719,'Can delete historical persistent subsection grade override',429,'delete_historicalpersistentsubsectiongradeoverride'),(1720,'Can view historical persistent subsection grade override',429,'view_historicalpersistentsubsectiongradeoverride'),(1721,'Can add historical program enrollment',430,'add_historicalprogramenrollment'),(1722,'Can change historical program enrollment',430,'change_historicalprogramenrollment'),(1723,'Can delete historical program enrollment',430,'delete_historicalprogramenrollment'),(1724,'Can view historical program enrollment',430,'view_historicalprogramenrollment'),(1725,'Can add program enrollment',431,'add_programenrollment'),(1726,'Can change program enrollment',431,'change_programenrollment'),(1727,'Can delete program enrollment',431,'delete_programenrollment'),(1728,'Can view program enrollment',431,'view_programenrollment'),(1729,'Can add historical program course enrollment',432,'add_historicalprogramcourseenrollment'),(1730,'Can change historical program course enrollment',432,'change_historicalprogramcourseenrollment'),(1731,'Can delete historical program course enrollment',432,'delete_historicalprogramcourseenrollment'),(1732,'Can view historical program course enrollment',432,'view_historicalprogramcourseenrollment'),(1733,'Can add program course enrollment',433,'add_programcourseenrollment'),(1734,'Can change program course enrollment',433,'change_programcourseenrollment'),(1735,'Can delete program course enrollment',433,'delete_programcourseenrollment'),(1736,'Can view program course enrollment',433,'view_programcourseenrollment'),(1737,'Can add course access role assignment',434,'add_courseaccessroleassignment'),(1738,'Can change course access role assignment',434,'change_courseaccessroleassignment'),(1739,'Can delete course access role assignment',434,'delete_courseaccessroleassignment'),(1740,'Can view course access role assignment',434,'view_courseaccessroleassignment'),(1741,'Can add site theme',435,'add_sitetheme'),(1742,'Can change site theme',435,'change_sitetheme'),(1743,'Can delete site theme',435,'delete_sitetheme'),(1744,'Can view site theme',435,'view_sitetheme'),(1745,'Can add historical learner pathway progress',436,'add_historicallearnerpathwayprogress'),(1746,'Can change historical learner pathway progress',436,'change_historicallearnerpathwayprogress'),(1747,'Can delete historical learner pathway progress',436,'delete_historicallearnerpathwayprogress'),(1748,'Can view historical learner pathway progress',436,'view_historicallearnerpathwayprogress'),(1749,'Can add learner pathway progress',437,'add_learnerpathwayprogress'),(1750,'Can change learner pathway progress',437,'change_learnerpathwayprogress'),(1751,'Can delete learner pathway progress',437,'delete_learnerpathwayprogress'),(1752,'Can view learner pathway progress',437,'view_learnerpathwayprogress'),(1753,'Can add learner enterprise pathway membership',438,'add_learnerenterprisepathwaymembership'),(1754,'Can change learner enterprise pathway membership',438,'change_learnerenterprisepathwaymembership'),(1755,'Can delete learner enterprise pathway membership',438,'delete_learnerenterprisepathwaymembership'),(1756,'Can view learner enterprise pathway membership',438,'view_learnerenterprisepathwaymembership'),(1757,'Can add score overrider',439,'add_scoreoverrider'),(1758,'Can change score overrider',439,'change_scoreoverrider'),(1759,'Can delete score overrider',439,'delete_scoreoverrider'),(1760,'Can view score overrider',439,'view_scoreoverrider'),(1761,'Can add proctored exam',440,'add_proctoredexam'),(1762,'Can change proctored exam',440,'change_proctoredexam'),(1763,'Can delete proctored exam',440,'delete_proctoredexam'),(1764,'Can view proctored exam',440,'view_proctoredexam'),(1765,'Can add Proctored exam review policy',441,'add_proctoredexamreviewpolicy'),(1766,'Can change Proctored exam review policy',441,'change_proctoredexamreviewpolicy'),(1767,'Can delete Proctored exam review policy',441,'delete_proctoredexamreviewpolicy'),(1768,'Can view Proctored exam review policy',441,'view_proctoredexamreviewpolicy'),(1769,'Can add proctored exam review policy history',442,'add_proctoredexamreviewpolicyhistory'),(1770,'Can change proctored exam review policy history',442,'change_proctoredexamreviewpolicyhistory'),(1771,'Can delete proctored exam review policy history',442,'delete_proctoredexamreviewpolicyhistory'),(1772,'Can view proctored exam review policy history',442,'view_proctoredexamreviewpolicyhistory'),(1773,'Can add proctored exam software secure comment',443,'add_proctoredexamsoftwaresecurecomment'),(1774,'Can change proctored exam software secure comment',443,'change_proctoredexamsoftwaresecurecomment'),(1775,'Can delete proctored exam software secure comment',443,'delete_proctoredexamsoftwaresecurecomment'),(1776,'Can view proctored exam software secure comment',443,'view_proctoredexamsoftwaresecurecomment'),(1777,'Can add Proctored exam software secure review',444,'add_proctoredexamsoftwaresecurereview'),(1778,'Can change Proctored exam software secure review',444,'change_proctoredexamsoftwaresecurereview'),(1779,'Can delete Proctored exam software secure review',444,'delete_proctoredexamsoftwaresecurereview'),(1780,'Can view Proctored exam software secure review',444,'view_proctoredexamsoftwaresecurereview'),(1781,'Can add Proctored exam review archive',445,'add_proctoredexamsoftwaresecurereviewhistory'),(1782,'Can change Proctored exam review archive',445,'change_proctoredexamsoftwaresecurereviewhistory'),(1783,'Can delete Proctored exam review archive',445,'delete_proctoredexamsoftwaresecurereviewhistory'),(1784,'Can view Proctored exam review archive',445,'view_proctoredexamsoftwaresecurereviewhistory'),(1785,'Can add proctored allowance',446,'add_proctoredexamstudentallowance'),(1786,'Can change proctored allowance',446,'change_proctoredexamstudentallowance'),(1787,'Can delete proctored allowance',446,'delete_proctoredexamstudentallowance'),(1788,'Can view proctored allowance',446,'view_proctoredexamstudentallowance'),(1789,'Can add proctored allowance history',447,'add_proctoredexamstudentallowancehistory'),(1790,'Can change proctored allowance history',447,'change_proctoredexamstudentallowancehistory'),(1791,'Can delete proctored allowance history',447,'delete_proctoredexamstudentallowancehistory'),(1792,'Can view proctored allowance history',447,'view_proctoredexamstudentallowancehistory'),(1793,'Can add proctored exam attempt',448,'add_proctoredexamstudentattempt'),(1794,'Can change proctored exam attempt',448,'change_proctoredexamstudentattempt'),(1795,'Can delete proctored exam attempt',448,'delete_proctoredexamstudentattempt'),(1796,'Can view proctored exam attempt',448,'view_proctoredexamstudentattempt'),(1797,'Can add historical proctored exam attempt',449,'add_historicalproctoredexamstudentattempt'),(1798,'Can change historical proctored exam attempt',449,'change_historicalproctoredexamstudentattempt'),(1799,'Can delete historical proctored exam attempt',449,'delete_historicalproctoredexamstudentattempt'),(1800,'Can view historical proctored exam attempt',449,'view_historicalproctoredexamstudentattempt'),(1801,'Can add historical proctored exam',450,'add_historicalproctoredexam'),(1802,'Can change historical proctored exam',450,'change_historicalproctoredexam'),(1803,'Can delete historical proctored exam',450,'delete_historicalproctoredexam'),(1804,'Can view historical proctored exam',450,'view_historicalproctoredexam'),(1805,'Can add lti configuration',451,'add_lticonfiguration'),(1806,'Can change lti configuration',451,'change_lticonfiguration'),(1807,'Can delete lti configuration',451,'delete_lticonfiguration'),(1808,'Can view lti configuration',451,'view_lticonfiguration'),(1809,'Can add lti ags line item',452,'add_ltiagslineitem'),(1810,'Can change lti ags line item',452,'change_ltiagslineitem'),(1811,'Can delete lti ags line item',452,'delete_ltiagslineitem'),(1812,'Can view lti ags line item',452,'view_ltiagslineitem'),(1813,'Can add lti ags score',453,'add_ltiagsscore'),(1814,'Can change lti ags score',453,'change_ltiagsscore'),(1815,'Can delete lti ags score',453,'delete_ltiagsscore'),(1816,'Can view lti ags score',453,'view_ltiagsscore'),(1817,'Can add lti dl content item',454,'add_ltidlcontentitem'),(1818,'Can change lti dl content item',454,'change_ltidlcontentitem'),(1819,'Can delete lti dl content item',454,'delete_ltidlcontentitem'),(1820,'Can view lti dl content item',454,'view_ltidlcontentitem'),(1821,'Can add course allow pii sharing in lti flag',455,'add_courseallowpiisharinginltiflag'),(1822,'Can change course allow pii sharing in lti flag',455,'change_courseallowpiisharinginltiflag'),(1823,'Can delete course allow pii sharing in lti flag',455,'delete_courseallowpiisharinginltiflag'),(1824,'Can view course allow pii sharing in lti flag',455,'view_courseallowpiisharinginltiflag'),(1825,'Can add block completion',456,'add_blockcompletion'),(1826,'Can change block completion',456,'change_blockcompletion'),(1827,'Can delete block completion',456,'delete_blockcompletion'),(1828,'Can view block completion',456,'view_blockcompletion'),(1829,'Can add csv operation',457,'add_csvoperation'),(1830,'Can change csv operation',457,'change_csvoperation'),(1831,'Can delete csv operation',457,'delete_csvoperation'),(1832,'Can view csv operation',457,'view_csvoperation'),(1833,'Can add verified name',458,'add_verifiedname'),(1834,'Can change verified name',458,'change_verifiedname'),(1835,'Can delete verified name',458,'delete_verifiedname'),(1836,'Can view verified name',458,'view_verifiedname'),(1837,'Can add verified name config',459,'add_verifiednameconfig'),(1838,'Can change verified name config',459,'change_verifiednameconfig'),(1839,'Can delete verified name config',459,'delete_verifiednameconfig'),(1840,'Can view verified name config',459,'view_verifiednameconfig'),(1841,'Can add historical verified name',460,'add_historicalverifiedname'),(1842,'Can change historical verified name',460,'change_historicalverifiedname'),(1843,'Can delete historical verified name',460,'delete_historicalverifiedname'),(1844,'Can view historical verified name',460,'view_historicalverifiedname'),(1845,'Can add learner course event',461,'add_learnercourseevent'),(1846,'Can change learner course event',461,'change_learnercourseevent'),(1847,'Can delete learner course event',461,'delete_learnercourseevent'),(1848,'Can view learner course event',461,'view_learnercourseevent'),(1849,'Can add multi choice response',462,'add_multichoiceresponse'),(1850,'Can change multi choice response',462,'change_multichoiceresponse'),(1851,'Can delete multi choice response',462,'delete_multichoiceresponse'),(1852,'Can view multi choice response',462,'view_multichoiceresponse'),(1853,'Can add survey export',463,'add_surveyexport'),(1854,'Can change survey export',463,'change_surveyexport'),(1855,'Can delete survey export',463,'delete_surveyexport'),(1856,'Can view survey export',463,'view_surveyexport'),(1857,'Can add course reflection',464,'add_coursereflection'),(1858,'Can change course reflection',464,'change_coursereflection'),(1859,'Can delete course reflection',464,'delete_coursereflection'),(1860,'Can view course reflection',464,'view_coursereflection'),(1861,'Can add course goal',465,'add_coursegoal'),(1862,'Can change course goal',465,'change_coursegoal'),(1863,'Can delete course goal',465,'delete_coursegoal'),(1864,'Can view course goal',465,'view_coursegoal'),(1865,'Can add content date',466,'add_contentdate'),(1866,'Can change content date',466,'change_contentdate'),(1867,'Can delete content date',466,'delete_contentdate'),(1868,'Can view content date',466,'view_contentdate'),(1869,'Can add date policy',467,'add_datepolicy'),(1870,'Can change date policy',467,'change_datepolicy'),(1871,'Can delete date policy',467,'delete_datepolicy'),(1872,'Can view date policy',467,'view_datepolicy'),(1873,'Can add user date',468,'add_userdate'),(1874,'Can change user date',468,'change_userdate'),(1875,'Can delete user date',468,'delete_userdate'),(1876,'Can view user date',468,'view_userdate'),(1877,'Can add video upload config',469,'add_videouploadconfig'),(1878,'Can change video upload config',469,'change_videouploadconfig'),(1879,'Can delete video upload config',469,'delete_videouploadconfig'),(1880,'Can view video upload config',469,'view_videouploadconfig'),(1881,'Can add course outline regenerate',470,'add_courseoutlineregenerate'),(1882,'Can change course outline regenerate',470,'change_courseoutlineregenerate'),(1883,'Can delete course outline regenerate',470,'delete_courseoutlineregenerate'),(1884,'Can view course outline regenerate',470,'view_courseoutlineregenerate'),(1885,'Can add Arguments for backfill_course_tabs',471,'add_backfillcoursetabsconfig'),(1886,'Can change Arguments for backfill_course_tabs',471,'change_backfillcoursetabsconfig'),(1887,'Can delete Arguments for backfill_course_tabs',471,'delete_backfillcoursetabsconfig'),(1888,'Can view Arguments for backfill_course_tabs',471,'view_backfillcoursetabsconfig'),(1889,'Can add Arguments for \'clean_stale_certificate_availability_dates\'',472,'add_cleanstalecertificateavailabilitydatesconfig'),(1890,'Can change Arguments for \'clean_stale_certificate_availability_dates\'',472,'change_cleanstalecertificateavailabilitydatesconfig'),(1891,'Can delete Arguments for \'clean_stale_certificate_availability_dates\'',472,'delete_cleanstalecertificateavailabilitydatesconfig'),(1892,'Can view Arguments for \'clean_stale_certificate_availability_dates\'',472,'view_cleanstalecertificateavailabilitydatesconfig'),(1893,'Can add course creator',473,'add_coursecreator'),(1894,'Can change course creator',473,'change_coursecreator'),(1895,'Can delete course creator',473,'delete_coursecreator'),(1896,'Can view course creator',473,'view_coursecreator'),(1897,'Can add studio config',474,'add_studioconfig'),(1898,'Can change studio config',474,'change_studioconfig'),(1899,'Can delete studio config',474,'delete_studioconfig'),(1900,'Can view studio config',474,'view_studioconfig'),(1901,'Can add course graph course dump',475,'add_coursegraphcoursedump'),(1902,'Can change course graph course dump',475,'change_coursegraphcoursedump'),(1903,'Can delete course graph course dump',475,'delete_coursegraphcoursedump'),(1904,'Can view course graph course dump',475,'view_coursegraphcoursedump'),(1905,'Can add available tag value',476,'add_tagavailablevalues'),(1906,'Can change available tag value',476,'change_tagavailablevalues'),(1907,'Can delete available tag value',476,'delete_tagavailablevalues'),(1908,'Can view available tag value',476,'view_tagavailablevalues'),(1909,'Can add tag category',477,'add_tagcategories'),(1910,'Can change tag category',477,'change_tagcategories'),(1911,'Can delete tag category',477,'delete_tagcategories'),(1912,'Can view tag category',477,'view_tagcategories'),(1913,'Can add user task artifact',478,'add_usertaskartifact'),(1914,'Can change user task artifact',478,'change_usertaskartifact'),(1915,'Can delete user task artifact',478,'delete_usertaskartifact'),(1916,'Can view user task artifact',478,'view_usertaskartifact'),(1917,'Can add user task status',479,'add_usertaskstatus'),(1918,'Can change user task status',479,'change_usertaskstatus'),(1919,'Can delete user task status',479,'delete_usertaskstatus'),(1920,'Can view user task status',479,'view_usertaskstatus');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_registration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activation_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_registration_user_id_f99bc297_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_registration`
--

LOCK TABLES `auth_registration` WRITE;
/*!40000 ALTER TABLE `auth_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'!uZe7veOu1UhOq1Wo3r4KZvGm6LP9uheJsSN8i5Gw',NULL,0,'login_service_user','','','login_service_user@fake.email',0,1,'2023-02-21 14:10:50.949700'),(3,'pbkdf2_sha256$260000$mXsh1ZGHTrThJgsu4ZYJUx$JKXXutNGi3F4wQC+oj8FiWqYaLxoe0GBLm6PtxsKzxw=',NULL,1,'edx','','','edx@example.com',1,1,'2023-02-21 14:19:07.911310'),(4,'pbkdf2_sha256$260000$c8VjJNRGVFYzXikMFKkiGz$llv8kyjpRux+b2A4V4bfOToUzS69XmWygVJGTOtq8zA=',NULL,0,'enterprise_worker','','','enterprise_worker@example.com',1,1,'2023-02-21 14:19:26.427539'),(5,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'honor','','','honor@example.com',0,1,'2023-02-21 14:20:05.276063'),(6,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'audit','','','audit@example.com',0,1,'2023-02-21 14:20:15.876544'),(7,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'verified','','','verified@example.com',0,1,'2023-02-21 14:20:25.877637'),(8,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'staff','','','staff@example.com',1,1,'2023-02-21 14:20:36.511198'),(9,'pbkdf2_sha256$260000$XgJe7l0CuAcVbHGa2Lxq3y$1zU/EGibXC/qNAcJkXgxnBdMW2gwJOdV3JlRB7wB7/U=',NULL,1,'studio_worker','','','studio_worker@example.com',1,1,'2023-02-21 14:29:20.592741'),(10,'pbkdf2_sha256$260000$9rs2VbJvRiXX7OsYLRx6iX$TboW23cyjqxguPFDRajW0SQtE1QwreV+80I4hxUNwDA=',NULL,1,'retirement_service_worker','','','retirement_service_worker@example.com',1,1,'2023-02-21 14:29:52.624097'),(11,'pbkdf2_sha256$260000$riAoCVaz1hahRnyfL43FyJ$U3xXuH2homS286nMWnBQiUHmBDgMMv8dkQ3hNbUaTCE=',NULL,1,'ecommerce_worker','','','ecommerce_worker@example.com',1,1,'2023-02-21 14:38:44.158127');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,4,1337),(2,4,1338),(3,4,1339),(4,4,1340),(5,4,1341),(6,4,1342),(7,4,1343),(8,4,1344),(9,4,1345),(10,4,1346),(11,4,1347),(12,4,1348),(13,4,1349),(14,4,1350),(15,4,1351),(16,4,1352),(17,4,1353),(18,4,1354),(19,4,1355),(20,4,1356),(21,4,1357),(22,4,1358),(23,4,1359),(24,4,1360),(25,4,1361),(26,4,1362),(27,4,1363),(28,4,1364),(29,4,1365),(30,4,1366),(31,4,1367),(32,4,1368),(33,4,1369),(34,4,1370),(35,4,1371),(36,4,1372),(37,4,1373),(38,4,1374),(39,4,1375),(40,4,1376),(41,4,1377),(42,4,1378),(43,4,1379),(44,4,1380),(45,4,1381),(46,4,1382),(47,4,1383),(48,4,1384),(49,4,1385),(50,4,1386),(51,4,1387),(52,4,1388),(53,4,1389),(54,4,1390),(55,4,1391),(56,4,1392),(57,4,1393),(58,4,1394),(59,4,1395),(60,4,1396),(61,4,1397),(62,4,1398),(63,4,1399),(64,4,1400),(65,4,1401),(66,4,1402),(67,4,1403),(68,4,1404),(69,4,1405),(70,4,1406),(71,4,1407),(72,4,1408),(73,4,1409),(74,4,1410),(75,4,1411),(76,4,1412),(77,4,1413),(78,4,1414),(79,4,1415),(80,4,1416),(81,4,1417),(82,4,1418),(83,4,1419),(84,4,1420),(85,4,1421),(86,4,1422),(87,4,1423),(88,4,1424),(89,4,1425),(90,4,1426),(91,4,1427),(92,4,1428),(93,4,1429),(94,4,1430),(95,4,1431),(96,4,1432),(97,4,1433),(98,4,1434),(99,4,1435),(100,4,1436),(101,4,1437),(102,4,1438),(103,4,1439),(104,4,1440),(105,4,1441),(106,4,1442),(107,4,1443),(108,4,1444),(109,4,1445),(110,4,1446),(111,4,1447),(112,4,1448),(113,4,1449),(114,4,1450),(115,4,1451),(116,4,1452),(117,4,1453),(118,4,1454),(119,4,1455),(120,4,1456),(121,4,1457),(122,4,1458),(123,4,1459),(124,4,1460),(125,4,1461),(126,4,1462),(127,4,1463),(128,4,1464),(129,4,1465),(130,4,1466),(131,4,1467),(132,4,1468),(133,4,1469),(134,4,1470),(135,4,1471),(136,4,1472),(137,4,1473),(138,4,1474),(139,4,1475),(140,4,1476),(141,4,1477),(142,4,1478),(143,4,1479),(144,4,1480);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_userprofile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `meta` longtext NOT NULL,
  `courseware` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `year_of_birth` int(11) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `level_of_education` varchar(6) DEFAULT NULL,
  `mailing_address` longtext,
  `city` longtext,
  `country` varchar(2) DEFAULT NULL,
  `goals` longtext,
  `bio` varchar(3000) DEFAULT NULL,
  `profile_image_uploaded_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_name_50909f10` (`name`),
  KEY `auth_userprofile_language_8948d814` (`language`),
  KEY `auth_userprofile_location_ca92e4f6` (`location`),
  KEY `auth_userprofile_year_of_birth_6559b9a5` (`year_of_birth`),
  KEY `auth_userprofile_gender_44a122fb` (`gender`),
  KEY `auth_userprofile_level_of_education_93927e04` (`level_of_education`),
  CONSTRAINT `auth_userprofile_user_id_62634b27_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (1,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(2,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(3,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(4,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(5,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),(6,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(7,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL),(8,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL),(9,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL);
/*!40000 ALTER TABLE `auth_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badgeassertion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badgeassertion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  `backend` varchar(50) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `assertion_url` varchar(200) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `badge_class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badges_badgeassertio_badge_class_id_902ac30e_fk_badges_ba` (`badge_class_id`),
  KEY `badges_badgeassertion_user_id_13665630_fk_auth_user_id` (`user_id`),
  KEY `badges_badgeassertion_created_d098832e` (`created`),
  CONSTRAINT `badges_badgeassertio_badge_class_id_902ac30e_fk_badges_ba` FOREIGN KEY (`badge_class_id`) REFERENCES `badges_badgeclass` (`id`),
  CONSTRAINT `badges_badgeassertion_user_id_13665630_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badgeassertion`
--

LOCK TABLES `badges_badgeassertion` WRITE;
/*!40000 ALTER TABLE `badges_badgeassertion` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badgeassertion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badgeclass`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badgeclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `issuing_component` varchar(50) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `criteria` longtext NOT NULL,
  `mode` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `badgr_server_slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badges_badgeclass_slug_issuing_component_course_id_92cd3912_uniq` (`slug`,`issuing_component`,`course_id`),
  KEY `badges_badgeclass_slug_5f420f6f` (`slug`),
  KEY `badges_badgeclass_issuing_component_85b6d93d` (`issuing_component`),
  KEY `badges_badgeclass_badgr_server_slug_701a8bf1` (`badgr_server_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badgeclass`
--

LOCK TABLES `badges_badgeclass` WRITE;
/*!40000 ALTER TABLE `badges_badgeclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badgeclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_coursecompleteimageconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_coursecompleteimageconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(125) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_coursecompleteimageconfiguration`
--

LOCK TABLES `badges_coursecompleteimageconfiguration` WRITE;
/*!40000 ALTER TABLE `badges_coursecompleteimageconfiguration` DISABLE KEYS */;
INSERT INTO `badges_coursecompleteimageconfiguration` VALUES (1,'honor','badges/badges/honor.png',0),(2,'verified','badges/badges/verified.png',0),(3,'professional','badges/badges/professional.png',0);
/*!40000 ALTER TABLE `badges_coursecompleteimageconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_courseeventbadgesconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_courseeventbadgesconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `courses_completed` longtext NOT NULL,
  `courses_enrolled` longtext NOT NULL,
  `course_groups` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `badges_courseeventba_changed_by_id_db04ed01_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `badges_courseeventba_changed_by_id_db04ed01_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_courseeventbadgesconfiguration`
--

LOCK TABLES `badges_courseeventbadgesconfiguration` WRITE;
/*!40000 ALTER TABLE `badges_courseeventbadgesconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_courseeventbadgesconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `blackboard_base_url` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `uuid` char(32) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blackboard_blackboardent_uuid_ff12f26c_uniq` (`uuid`),
  KEY `blackboard_blackboar_enterprise_customer__39f883b0_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `blackboard_blackboar_enterprise_customer__39f883b0_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardenterprisecustomerconfiguration`
--

LOCK TABLES `blackboard_blackboardenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `app_key` varchar(255) NOT NULL,
  `app_secret` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blackboard_blackboar_changed_by_id_20c18fd5_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `blackboard_blackboar_changed_by_id_20c18fd5_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardglobalconfiguration`
--

LOCK TABLES `blackboard_blackboardglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardlearnerassessmentdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardlearnerassessmentdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blackboard_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `grade_point_score` double NOT NULL,
  `grade_points_possible` double NOT NULL,
  `grade` double DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `blackboard_blackboardlearne_enterprise_course_enrollmen_4d99c86b` (`enterprise_course_enrollment_id`),
  KEY `blackboard_blackboardlearne_subsection_id_6ddb999b` (`subsection_id`),
  CONSTRAINT `blackboard_blackboar_api_record_id_3a698fd1_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardlearnerassessmentdatatransmissionaudit`
--

LOCK TABLES `blackboard_blackboardlearnerassessmentdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerassessmentdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerassessmentdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardlearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardlearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blackboard_user_email` varchar(255) NOT NULL,
  `blackboard_completed_timestamp` varchar(10) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `error_message` longtext,
  `status` varchar(100) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `blackboard_blackboardlearne_enterprise_course_enrollmen_941ea543` (`enterprise_course_enrollment_id`),
  KEY `blackboard_blackboardlearne_subsection_id_1d6d8dd3` (`subsection_id`),
  KEY `blackboard_bldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `blackboard_blackboar_api_record_id_def01b3a_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardlearnerdatatransmissionaudit`
--

LOCK TABLES `blackboard_blackboardlearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_historicalblackboardenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_historicalblackboardenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `blackboard_base_url` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `uuid` char(32) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `blackboard_historica_history_user_id_099f295b_fk_auth_user` (`history_user_id`),
  KEY `blackboard_historicalblackb_id_7675c06f` (`id`),
  KEY `blackboard_historicalblackb_enterprise_customer_id_b9053e9a` (`enterprise_customer_id`),
  KEY `blackboard_historicalblackb_uuid_8670688b` (`uuid`),
  CONSTRAINT `blackboard_historica_history_user_id_099f295b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_historicalblackboardenterprisecustomerconfiguration`
--

LOCK TABLES `blackboard_historicalblackboardenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `blackboard_historicalblackboardenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_historicalblackboardenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_structure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `data_usage_key` varchar(255) NOT NULL,
  `data_version` varchar(255) DEFAULT NULL,
  `data_edit_timestamp` datetime(6) DEFAULT NULL,
  `transformers_schema_version` varchar(255) NOT NULL,
  `block_structure_schema_version` varchar(255) NOT NULL,
  `data` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_usage_key` (`data_usage_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_structure`
--

LOCK TABLES `block_structure` WRITE;
/*!40000 ALTER TABLE `block_structure` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_structure_config`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_structure_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `num_versions_to_keep` int(11) DEFAULT NULL,
  `cache_timeout_in_seconds` int(11) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_structure_config_changed_by_id_45af0b10_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `block_structure_config_changed_by_id_45af0b10_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_structure_config`
--

LOCK TABLES `block_structure_config` WRITE;
/*!40000 ALTER TABLE `block_structure_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_structure_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_bookmark`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `usage_key` varchar(255) NOT NULL,
  `path` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `xblock_cache_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookmarks_bookmark_user_id_usage_key_61eac24b_uniq` (`user_id`,`usage_key`),
  KEY `bookmarks_bookmark_xblock_cache_id_808a7639_fk_bookmarks` (`xblock_cache_id`),
  KEY `bookmarks_bookmark_course_key_46609583` (`course_key`),
  KEY `bookmarks_bookmark_usage_key_d07927c9` (`usage_key`),
  CONSTRAINT `bookmarks_bookmark_user_id_a26bf17c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bookmarks_bookmark_xblock_cache_id_808a7639_fk_bookmarks` FOREIGN KEY (`xblock_cache_id`) REFERENCES `bookmarks_xblockcache` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_bookmark`
--

LOCK TABLES `bookmarks_bookmark` WRITE;
/*!40000 ALTER TABLE `bookmarks_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_xblockcache`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_xblockcache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `usage_key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `paths` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usage_key` (`usage_key`),
  KEY `bookmarks_xblockcache_course_key_5297fa77` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_xblockcache`
--

LOCK TABLES `bookmarks_xblockcache` WRITE;
/*!40000 ALTER TABLE `bookmarks_xblockcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_xblockcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branding_brandingapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branding_brandingapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branding_brandingapi_changed_by_id_bab2730f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `branding_brandingapi_changed_by_id_bab2730f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branding_brandingapiconfig`
--

LOCK TABLES `branding_brandingapiconfig` WRITE;
/*!40000 ALTER TABLE `branding_brandingapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `branding_brandingapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branding_brandinginfoconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branding_brandinginfoconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branding_brandinginf_changed_by_id_616dd172_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `branding_brandinginf_changed_by_id_616dd172_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branding_brandinginfoconfig`
--

LOCK TABLES `branding_brandinginfoconfig` WRITE;
/*!40000 ALTER TABLE `branding_brandinginfoconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `branding_brandinginfoconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_bulkemailflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_bulkemailflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `require_course_email_auth` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_email_bulkemailflag_changed_by_id_c510754b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `bulk_email_bulkemailflag_changed_by_id_c510754b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_bulkemailflag`
--

LOCK TABLES `bulk_email_bulkemailflag` WRITE;
/*!40000 ALTER TABLE `bulk_email_bulkemailflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_bulkemailflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_cohorttarget`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_cohorttarget` (
  `target_ptr_id` int(11) NOT NULL,
  `cohort_id` int(11) NOT NULL,
  PRIMARY KEY (`target_ptr_id`),
  KEY `bulk_email_cohorttar_cohort_id_096f39c9_fk_course_gr` (`cohort_id`),
  CONSTRAINT `bulk_email_cohorttar_cohort_id_096f39c9_fk_course_gr` FOREIGN KEY (`cohort_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `bulk_email_cohorttar_target_ptr_id_7e1a1a40_fk_bulk_emai` FOREIGN KEY (`target_ptr_id`) REFERENCES `bulk_email_target` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_cohorttarget`
--

LOCK TABLES `bulk_email_cohorttarget` WRITE;
/*!40000 ALTER TABLE `bulk_email_cohorttarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_cohorttarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseauthorization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseauthorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `email_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseauthorization`
--

LOCK TABLES `bulk_email_courseauthorization` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseauthorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseauthorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `html_message` longtext,
  `text_message` longtext,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `to_option` varchar(64) NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_email_courseemail_sender_id_865f6979_fk_auth_user_id` (`sender_id`),
  KEY `bulk_email_courseemail_slug_bd25801f` (`slug`),
  KEY `bulk_email_courseemail_course_id_b7b8a9a2` (`course_id`),
  CONSTRAINT `bulk_email_courseemail_sender_id_865f6979_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemail`
--

LOCK TABLES `bulk_email_courseemail` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemail_targets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemail_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseemail_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_courseemail_t_courseemail_id_target_id_e0440acc_uniq` (`courseemail_id`,`target_id`),
  KEY `bulk_email_courseema_target_id_52b11fa9_fk_bulk_emai` (`target_id`),
  CONSTRAINT `bulk_email_courseema_courseemail_id_83f5bdcd_fk_bulk_emai` FOREIGN KEY (`courseemail_id`) REFERENCES `bulk_email_courseemail` (`id`),
  CONSTRAINT `bulk_email_courseema_target_id_52b11fa9_fk_bulk_emai` FOREIGN KEY (`target_id`) REFERENCES `bulk_email_target` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemail_targets`
--

LOCK TABLES `bulk_email_courseemail_targets` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemail_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseemail_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemailtemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html_template` longtext,
  `plain_template` longtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemailtemplate`
--

LOCK TABLES `bulk_email_courseemailtemplate` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemailtemplate` DISABLE KEYS */;
INSERT INTO `bulk_email_courseemailtemplate` VALUES (1,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br><br><a href=\'{unsubscribe_link}\'>unsubscribe</a>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','{course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n{unsubscribe_link}\r\n',NULL),(2,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        THIS IS A BRANDED HTML TEMPLATE <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br><br><a href=\'{unsubscribe_link}\'>unsubscribe</a>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','THIS IS A BRANDED TEXT TEMPLATE. {course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n{unsubscribe_link}\r\n','branded.template');
/*!40000 ALTER TABLE `bulk_email_courseemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_coursemodetarget`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_coursemodetarget` (
  `target_ptr_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`target_ptr_id`),
  KEY `bulk_email_coursemod_track_id_2b68bb43_fk_course_mo` (`track_id`),
  CONSTRAINT `bulk_email_coursemod_target_ptr_id_f2f054ce_fk_bulk_emai` FOREIGN KEY (`target_ptr_id`) REFERENCES `bulk_email_target` (`id`),
  CONSTRAINT `bulk_email_coursemod_track_id_2b68bb43_fk_course_mo` FOREIGN KEY (`track_id`) REFERENCES `course_modes_coursemode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_coursemodetarget`
--

LOCK TABLES `bulk_email_coursemodetarget` WRITE;
/*!40000 ALTER TABLE `bulk_email_coursemodetarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_coursemodetarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_disabledcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_disabledcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_disabledcourse`
--

LOCK TABLES `bulk_email_disabledcourse` WRITE;
/*!40000 ALTER TABLE `bulk_email_disabledcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_disabledcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_optout`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_optout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_optout_user_id_course_id_e0e2d6a6_uniq` (`user_id`,`course_id`),
  KEY `bulk_email_optout_course_id_5c5836a8` (`course_id`),
  CONSTRAINT `bulk_email_optout_user_id_ff6223d6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_optout`
--

LOCK TABLES `bulk_email_optout` WRITE;
/*!40000 ALTER TABLE `bulk_email_optout` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_optout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_target`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_target`
--

LOCK TABLES `bulk_email_target` WRITE;
/*!40000 ALTER TABLE `bulk_email_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_grades_scoreoverrider`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_grades_scoreoverrider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_grades_scoreove_module_id_33617068_fk_coursewar` (`module_id`),
  KEY `bulk_grades_scoreoverrider_user_id_9768d9f6_fk_auth_user_id` (`user_id`),
  KEY `bulk_grades_scoreoverrider_created_2d9c74a5` (`created`),
  CONSTRAINT `bulk_grades_scoreoverrider_user_id_9768d9f6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_grades_scoreoverrider`
--

LOCK TABLES `bulk_grades_scoreoverrider` WRITE;
/*!40000 ALTER TABLE `bulk_grades_scoreoverrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_grades_scoreoverrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles_bundle`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles_bundle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `title` varchar(180) CHARACTER SET utf8mb4 DEFAULT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4,
  `collection_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `bundles_bundle_collection_id_7bbee084_fk_bundles_collection_id` (`collection_id`),
  KEY `bundles_bundle_title_4fb0d07c` (`title`),
  KEY `bundles_bundle_slug_2ecea44e` (`slug`),
  CONSTRAINT `bundles_bundle_collection_id_7bbee084_fk_bundles_collection_id` FOREIGN KEY (`collection_id`) REFERENCES `bundles_collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles_bundle`
--

LOCK TABLES `bundles_bundle` WRITE;
/*!40000 ALTER TABLE `bundles_bundle` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles_bundlelink`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles_bundlelink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uses_latest` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles_bundlelink`
--

LOCK TABLES `bundles_bundlelink` WRITE;
/*!40000 ALTER TABLE `bundles_bundlelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles_bundlelink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles_bundleversion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles_bundleversion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_num` int(10) unsigned NOT NULL,
  `snapshot_digest` varchar(40) NOT NULL,
  `change_description` longtext CHARACTER SET utf8mb4,
  `bundle_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundles_bundleversion_bundle_id_version_num_60ae090e_uniq` (`bundle_id`,`version_num`),
  KEY `bundles_bundleversion_snapshot_digest_53518161` (`snapshot_digest`),
  CONSTRAINT `bundles_bundleversion_bundle_id_8a76e2ca_fk_bundles_bundle_id` FOREIGN KEY (`bundle_id`) REFERENCES `bundles_bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles_bundleversion`
--

LOCK TABLES `bundles_bundleversion` WRITE;
/*!40000 ALTER TABLE `bundles_bundleversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles_bundleversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles_collection`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `title` varchar(180) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `bundles_collection_title_ca2abfeb` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles_collection`
--

LOCK TABLES `bundles_collection` WRITE;
/*!40000 ALTER TABLE `bundles_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles_draft`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles_draft` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `name` varchar(180) CHARACTER SET utf8mb4 DEFAULT NULL,
  `bundle_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `bundles_draft_bundle_id_name_55dbe3ed_uniq` (`bundle_id`,`name`),
  CONSTRAINT `bundles_draft_bundle_id_20fb78ec_fk_bundles_bundle_id` FOREIGN KEY (`bundle_id`) REFERENCES `bundles_bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles_draft`
--

LOCK TABLES `bundles_draft` WRITE;
/*!40000 ALTER TABLE `bundles_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_sync_historicalusercalendarsyncconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_sync_historicalusercalendarsyncconfig` (
  `id` int(11) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ics_sequence` int(11) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `calendar_sync_histor_history_user_id_e696e2d5_fk_auth_user` (`history_user_id`),
  KEY `calendar_sync_historicalusercalendarsyncconfig_id_2b36f9ae` (`id`),
  KEY `calendar_sync_historicaluse_course_key_0f40c91a` (`course_key`),
  KEY `calendar_sync_historicalusercalendarsyncconfig_user_id_c2855120` (`user_id`),
  CONSTRAINT `calendar_sync_histor_history_user_id_e696e2d5_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_sync_historicalusercalendarsyncconfig`
--

LOCK TABLES `calendar_sync_historicalusercalendarsyncconfig` WRITE;
/*!40000 ALTER TABLE `calendar_sync_historicalusercalendarsyncconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_sync_historicalusercalendarsyncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_sync_usercalendarsyncconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_sync_usercalendarsyncconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ics_sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_sync_usercalend_user_id_course_key_57c343ab_uniq` (`user_id`,`course_key`),
  KEY `calendar_sync_usercalendarsyncconfig_course_key_86657ca7` (`course_key`),
  CONSTRAINT `calendar_sync_userca_user_id_5dd14ead_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_sync_usercalendarsyncconfig`
--

LOCK TABLES `calendar_sync_usercalendarsyncconfig` WRITE;
/*!40000 ALTER TABLE `calendar_sync_usercalendarsyncconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_sync_usercalendarsyncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_canvasenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_canvasenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `canvas_account_id` bigint(20) DEFAULT NULL,
  `canvas_base_url` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `uuid` char(32) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canvas_canvasenterprisecustomerconfiguration_uuid_c3419677_uniq` (`uuid`),
  KEY `canvas_canvasenterprisecust_enterprise_customer_id_b2e73393` (`enterprise_customer_id`),
  CONSTRAINT `canvas_canvasenterpr_enterprise_customer__b2e73393_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_canvasenterprisecustomerconfiguration`
--

LOCK TABLES `canvas_canvasenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `canvas_canvasenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_canvasenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_canvaslearnerassessmentdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_canvaslearnerassessmentdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canvas_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `grade_point_score` double NOT NULL,
  `grade_points_possible` double NOT NULL,
  `grade` double DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `canvas_canvaslearnerassessm_enterprise_course_enrollmen_d9dba2b4` (`enterprise_course_enrollment_id`),
  KEY `canvas_canvaslearnerassessm_subsection_id_b3450f75` (`subsection_id`),
  CONSTRAINT `canvas_canvaslearner_api_record_id_c5b55bc9_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_canvaslearnerassessmentdatatransmissionaudit`
--

LOCK TABLES `canvas_canvaslearnerassessmentdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `canvas_canvaslearnerassessmentdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_canvaslearnerassessmentdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_canvaslearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_canvaslearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canvas_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `canvas_completed_timestamp` varchar(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `canvas_canvaslearnerdatatra_enterprise_course_enrollmen_c2a9800c` (`enterprise_course_enrollment_id`),
  KEY `canvas_canvaslearnerdatatransmissionaudit_subsection_id_00bcb67f` (`subsection_id`),
  KEY `canvas_cldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `canvas_canvaslearner_api_record_id_ba315c1c_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_canvaslearnerdatatransmissionaudit`
--

LOCK TABLES `canvas_canvaslearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `canvas_canvaslearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_canvaslearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_historicalcanvasenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_historicalcanvasenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `canvas_account_id` bigint(20) DEFAULT NULL,
  `canvas_base_url` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `uuid` char(32) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `canvas_historicalcan_history_user_id_615fc2a2_fk_auth_user` (`history_user_id`),
  KEY `canvas_historicalcanvasente_id_8769e0b6` (`id`),
  KEY `canvas_historicalcanvasente_enterprise_customer_id_8bd0d3ec` (`enterprise_customer_id`),
  KEY `canvas_historicalcanvasente_uuid_cc9ae6b2` (`uuid`),
  CONSTRAINT `canvas_historicalcan_history_user_id_615fc2a2_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_historicalcanvasenterprisecustomerconfiguration`
--

LOCK TABLES `canvas_historicalcanvasenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `canvas_historicalcanvasenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_historicalcanvasenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_catalogintegration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_catalogintegration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `internal_api_url` varchar(200) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `service_username` varchar(100) NOT NULL,
  `page_size` int(10) unsigned NOT NULL,
  `long_term_cache_ttl` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_cataloginteg_changed_by_id_cde406de_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `catalog_cataloginteg_changed_by_id_cde406de_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_catalogintegration`
--

LOCK TABLES `catalog_catalogintegration` WRITE;
/*!40000 ALTER TABLE `catalog_catalogintegration` DISABLE KEYS */;
INSERT INTO `catalog_catalogintegration` VALUES (1,'2023-02-21 14:30:11.143952',1,'https://example.com/api',0,NULL,'discovery_worker',100,86400);
/*!40000 ALTER TABLE `catalog_catalogintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_utils_failedtask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_utils_failedtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `exc` varchar(255) NOT NULL,
  `datetime_resolved` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `celery_utils_failedtask_task_name_exc_efb8c9be_idx` (`task_name`,`exc`),
  KEY `celery_utils_failedtask_task_id_37af0933` (`task_id`),
  KEY `celery_utils_failedtask_datetime_resolved_8160e407` (`datetime_resolved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_utils_failedtask`
--

LOCK TABLES `celery_utils_failedtask` WRITE;
/*!40000 ALTER TABLE `celery_utils_failedtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_utils_failedtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificateallowlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificateallowlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `allowlist` tinyint(1) NOT NULL,
  `notes` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificate_course_id_user_id_660abede_uniq` (`course_id`,`user_id`),
  KEY `certificates_certifi_user_id_6c4d38f7_fk_auth_user` (`user_id`),
  CONSTRAINT `certificates_certifi_user_id_6c4d38f7_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificateallowlist`
--

LOCK TABLES `certificates_certificateallowlist` WRITE;
/*!40000 ALTER TABLE `certificates_certificateallowlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificateallowlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatedateoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatedateoverride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `reason` longtext NOT NULL,
  `generated_certificate_id` int(11) NOT NULL,
  `overridden_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `generated_certificate_id` (`generated_certificate_id`),
  KEY `certificates_certifi_overridden_by_id_a0ebad2d_fk_auth_user` (`overridden_by_id`),
  CONSTRAINT `certificates_certifi_generated_certificat_d69ae0ac_fk_certifica` FOREIGN KEY (`generated_certificate_id`) REFERENCES `certificates_generatedcertificate` (`id`),
  CONSTRAINT `certificates_certifi_overridden_by_id_a0ebad2d_fk_auth_user` FOREIGN KEY (`overridden_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatedateoverride`
--

LOCK TABLES `certificates_certificatedateoverride` WRITE;
/*!40000 ALTER TABLE `certificates_certificatedateoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatedateoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationcommandconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationcommandconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_changed_by_id_a2950eaa_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `certificates_certifi_changed_by_id_a2950eaa_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationcommandconfiguration`
--

LOCK TABLES `certificates_certificategenerationcommandconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationcommandconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationcommandconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_changed_by_id_a6d06e99_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `certificates_certifi_changed_by_id_a6d06e99_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationconfiguration`
--

LOCK TABLES `certificates_certificategenerationconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationcoursesetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationcoursesetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `language_specific_templates_enabled` tinyint(1) NOT NULL,
  `self_generation_enabled` tinyint(1) NOT NULL,
  `include_hours_of_effort` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificategen_course_key_dd10af41` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationcoursesetting`
--

LOCK TABLES `certificates_certificategenerationcoursesetting` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationcoursesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationcoursesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `is_regeneration` tinyint(1) NOT NULL,
  `generated_by_id` int(11) NOT NULL,
  `instructor_task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_generated_by_id_e9d4b7f2_fk_auth_user` (`generated_by_id`),
  KEY `certificates_certifi_instructor_task_id_8f7176a6_fk_instructo` (`instructor_task_id`),
  CONSTRAINT `certificates_certifi_generated_by_id_e9d4b7f2_fk_auth_user` FOREIGN KEY (`generated_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `certificates_certifi_instructor_task_id_8f7176a6_fk_instructo` FOREIGN KEY (`instructor_task_id`) REFERENCES `instructor_task_instructortask` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationhistory`
--

LOCK TABLES `certificates_certificategenerationhistory` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatehtmlviewconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatehtmlviewconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_changed_by_id_bcf656f2_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `certificates_certifi_changed_by_id_bcf656f2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatehtmlviewconfiguration`
--

LOCK TABLES `certificates_certificatehtmlviewconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` DISABLE KEYS */;
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2023-02-21 13:26:01.071913',0,'{\"default\": {\"accomplishment_class_append\": \"accomplishment-certificate\", \"platform_name\": \"Your Platform Name Here\", \"company_about_url\": \"http://www.example.com/about-us\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"logo_src\": \"/static/certificates/images/logo.png\", \"logo_url\": \"http://www.example.com\"}, \"honor\": {\"certificate_type\": \"Honor Code\", \"certificate_title\": \"Certificate of Achievement\"}, \"verified\": {\"certificate_type\": \"Verified\", \"certificate_title\": \"Verified Certificate of Achievement\"}}',NULL);
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificateinvalidation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificateinvalidation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `notes` longtext,
  `active` tinyint(1) NOT NULL,
  `generated_certificate_id` int(11) NOT NULL,
  `invalidated_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_generated_certificat_31bed498_fk_certifica` (`generated_certificate_id`),
  KEY `certificates_certifi_invalidated_by_id_e3c101f1_fk_auth_user` (`invalidated_by_id`),
  CONSTRAINT `certificates_certifi_generated_certificat_31bed498_fk_certifica` FOREIGN KEY (`generated_certificate_id`) REFERENCES `certificates_generatedcertificate` (`id`),
  CONSTRAINT `certificates_certifi_invalidated_by_id_e3c101f1_fk_auth_user` FOREIGN KEY (`invalidated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificateinvalidation`
--

LOCK TABLES `certificates_certificateinvalidation` WRITE;
/*!40000 ALTER TABLE `certificates_certificateinvalidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificateinvalidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatetemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `template` longtext NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `course_key` varchar(255) DEFAULT NULL,
  `mode` varchar(125) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `language` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificate_organization_id_course_k_88e26c0d_uniq` (`organization_id`,`course_key`,`mode`,`language`),
  KEY `certificates_certificatetemplate_organization_id_030a747d` (`organization_id`),
  KEY `certificates_certificatetemplate_course_key_9a6a823d` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatetemplate`
--

LOCK TABLES `certificates_certificatetemplate` WRITE;
/*!40000 ALTER TABLE `certificates_certificatetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatetemplateasset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatetemplateasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `asset` varchar(255) NOT NULL,
  `asset_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_slug` (`asset_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatetemplateasset`
--

LOCK TABLES `certificates_certificatetemplateasset` WRITE;
/*!40000 ALTER TABLE `certificates_certificatetemplateasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatetemplateasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_examplecertificate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_examplecertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `description` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `access_key` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_reason` longtext,
  `download_url` varchar(255) DEFAULT NULL,
  `example_cert_set_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `certificates_example_example_cert_set_id_7e660917_fk_certifica` (`example_cert_set_id`),
  KEY `certificates_examplecertificate_access_key_8b745a5d` (`access_key`),
  CONSTRAINT `certificates_example_example_cert_set_id_7e660917_fk_certifica` FOREIGN KEY (`example_cert_set_id`) REFERENCES `certificates_examplecertificateset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_examplecertificate`
--

LOCK TABLES `certificates_examplecertificate` WRITE;
/*!40000 ALTER TABLE `certificates_examplecertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_examplecertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_examplecertificateset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_examplecertificateset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_examplecertificateset_course_key_16497ee9` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_examplecertificateset`
--

LOCK TABLES `certificates_examplecertificateset` WRITE;
/*!40000 ALTER TABLE `certificates_examplecertificateset` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_examplecertificateset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_generatedcertificate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_generatedcertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `verify_uuid` varchar(32) NOT NULL,
  `download_uuid` varchar(32) NOT NULL,
  `download_url` varchar(128) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `key` varchar(32) NOT NULL,
  `distinction` tinyint(1) NOT NULL,
  `status` varchar(32) NOT NULL,
  `mode` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `error_reason` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_generatedce_user_id_course_id_fc1bb3ee_uniq` (`user_id`,`course_id`),
  KEY `certificates_generatedcertificate_verify_uuid_97405316` (`verify_uuid`),
  CONSTRAINT `certificates_generat_user_id_54119d22_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_generatedcertificate`
--

LOCK TABLES `certificates_generatedcertificate` WRITE;
/*!40000 ALTER TABLE `certificates_generatedcertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_generatedcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalcertificateallowlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalcertificateallowlist` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `allowlist` tinyint(1) NOT NULL,
  `notes` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_016a68db_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalcertificateallowlist_id_c3818cd9` (`id`),
  KEY `certificates_historicalcertificateallowlist_user_id_4d17e30a` (`user_id`),
  CONSTRAINT `certificates_histori_history_user_id_016a68db_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalcertificateallowlist`
--

LOCK TABLES `certificates_historicalcertificateallowlist` WRITE;
/*!40000 ALTER TABLE `certificates_historicalcertificateallowlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalcertificateallowlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalcertificatedateoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalcertificatedateoverride` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `reason` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `generated_certificate_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `overridden_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_dc57d369_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalcertificatedateoverride_id_fa1513b4` (`id`),
  KEY `certificates_historicalcert_generated_certificate_id_1090e033` (`generated_certificate_id`),
  KEY `certificates_historicalcert_overridden_by_id_ff0a830f` (`overridden_by_id`),
  CONSTRAINT `certificates_histori_history_user_id_dc57d369_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalcertificatedateoverride`
--

LOCK TABLES `certificates_historicalcertificatedateoverride` WRITE;
/*!40000 ALTER TABLE `certificates_historicalcertificatedateoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalcertificatedateoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalcertificateinvalidation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalcertificateinvalidation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `notes` longtext,
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `generated_certificate_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `invalidated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_67c7d840_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalcertificateinvalidation_id_fae092a9` (`id`),
  KEY `certificates_historicalcert_generated_certificate_id_35f5becb` (`generated_certificate_id`),
  KEY `certificates_historicalcert_invalidated_by_id_5f2eff10` (`invalidated_by_id`),
  CONSTRAINT `certificates_histori_history_user_id_67c7d840_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalcertificateinvalidation`
--

LOCK TABLES `certificates_historicalcertificateinvalidation` WRITE;
/*!40000 ALTER TABLE `certificates_historicalcertificateinvalidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalcertificateinvalidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalgeneratedcertificate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalgeneratedcertificate` (
  `id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `verify_uuid` varchar(32) NOT NULL,
  `download_uuid` varchar(32) NOT NULL,
  `download_url` varchar(128) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `key` varchar(32) NOT NULL,
  `distinction` tinyint(1) NOT NULL,
  `status` varchar(32) NOT NULL,
  `mode` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `error_reason` varchar(512) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_1b53bb5f_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalgeneratedcertificate_id_269c8929` (`id`),
  KEY `certificates_historicalgeneratedcertificate_verify_uuid_783d764e` (`verify_uuid`),
  KEY `certificates_historicalgeneratedcertificate_user_id_e7970938` (`user_id`),
  CONSTRAINT `certificates_histori_history_user_id_1b53bb5f_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalgeneratedcertificate`
--

LOCK TABLES `certificates_historicalgeneratedcertificate` WRITE;
/*!40000 ALTER TABLE `certificates_historicalgeneratedcertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalgeneratedcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_commerceconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_commerceconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `checkout_on_ecommerce_service` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `receipt_page` varchar(255) NOT NULL,
  `enable_automatic_refund_approval` tinyint(1) NOT NULL,
  `basket_checkout_page` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_commercecon_changed_by_id_2c9a6f14_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `commerce_commercecon_changed_by_id_2c9a6f14_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_commerceconfiguration`
--

LOCK TABLES `commerce_commerceconfiguration` WRITE;
/*!40000 ALTER TABLE `commerce_commerceconfiguration` DISABLE KEYS */;
INSERT INTO `commerce_commerceconfiguration` VALUES (1,'2023-02-21 14:19:55.352934',1,1,NULL,0,'/checkout/receipt/?order_number=',1,'/basket/add/');
/*!40000 ALTER TABLE `commerce_commerceconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completion_blockcompletion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completion_blockcompletion` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `block_key` varchar(255) NOT NULL,
  `block_type` varchar(64) NOT NULL,
  `completion` double NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `completion_blockcompleti_course_key_block_key_use_b15bac54_uniq` (`course_key`,`block_key`,`user_id`),
  KEY `completion_blockcompletio_user_id_course_key_modifi_ed54291e_idx` (`user_id`,`course_key`,`modified`),
  KEY `completion_blockcompletio_course_key_block_type_use_0f0d4d2d_idx` (`course_key`,`block_type`,`user_id`),
  CONSTRAINT `completion_blockcompletion_user_id_20994c23_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completion_blockcompletion`
--

LOCK TABLES `completion_blockcompletion` WRITE;
/*!40000 ALTER TABLE `completion_blockcompletion` DISABLE KEYS */;
/*!40000 ALTER TABLE `completion_blockcompletion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_datasharingconsent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_datasharingconsent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `granted` tinyint(1) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consent_datasharingconse_enterprise_customer_id_u_8bdd34e4_uniq` (`enterprise_customer_id`,`username`,`course_id`),
  CONSTRAINT `consent_datasharingc_enterprise_customer__f46c6b77_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_datasharingconsent`
--

LOCK TABLES `consent_datasharingconsent` WRITE;
/*!40000 ALTER TABLE `consent_datasharingconsent` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent_datasharingconsent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_datasharingconsenttextoverrides`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_datasharingconsenttextoverrides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `left_sidebar_text` longtext,
  `top_paragraph` longtext,
  `agreement_text` longtext,
  `continue_text` varchar(255) NOT NULL,
  `abort_text` varchar(255) NOT NULL,
  `policy_dropdown_header` varchar(255) DEFAULT NULL,
  `policy_paragraph` longtext,
  `confirmation_modal_header` varchar(255) NOT NULL,
  `confirmation_modal_text` longtext NOT NULL,
  `modal_affirm_decline_text` varchar(255) NOT NULL,
  `modal_abort_decline_text` varchar(255) NOT NULL,
  `declined_notification_title` longtext NOT NULL,
  `declined_notification_message` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `consent_datasharingc_enterprise_customer__b979dfc1_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_datasharingconsenttextoverrides`
--

LOCK TABLES `consent_datasharingconsenttextoverrides` WRITE;
/*!40000 ALTER TABLE `consent_datasharingconsenttextoverrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent_datasharingconsenttextoverrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_historicaldatasharingconsent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_historicaldatasharingconsent` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `granted` tinyint(1) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `consent_historicalda_history_user_id_08d7bf89_fk_auth_user` (`history_user_id`),
  KEY `consent_historicaldatasharingconsent_id_69bef37e` (`id`),
  KEY `consent_historicaldatashari_enterprise_customer_id_35c184bf` (`enterprise_customer_id`),
  CONSTRAINT `consent_historicalda_history_user_id_08d7bf89_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_historicaldatasharingconsent`
--

LOCK TABLES `consent_historicaldatasharingconsent` WRITE;
/*!40000 ALTER TABLE `consent_historicaldatasharingconsent` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent_historicaldatasharingconsent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_contentlibrary`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_contentlibrary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `bundle_uuid` char(32) NOT NULL,
  `allow_public_learning` tinyint(1) NOT NULL,
  `allow_public_read` tinyint(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `license` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_uuid` (`bundle_uuid`),
  UNIQUE KEY `content_libraries_contentlibrary_org_id_slug_2b964108_uniq` (`org_id`,`slug`),
  KEY `content_libraries_contentlibrary_slug_30d5507f` (`slug`),
  CONSTRAINT `content_libraries_co_org_id_b945a402_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_contentlibrary`
--

LOCK TABLES `content_libraries_contentlibrary` WRITE;
/*!40000 ALTER TABLE `content_libraries_contentlibrary` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_contentlibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_contentlibrary_authorized_lti_configs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_contentlibrary_authorized_lti_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentlibrary_id` int(11) NOT NULL,
  `ltitool_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_libraries_conten_contentlibrary_id_ltitoo_5bb55a86_uniq` (`contentlibrary_id`,`ltitool_id`),
  KEY `content_libraries_co_ltitool_id_38e2ba78_fk_lti1p3_to` (`ltitool_id`),
  CONSTRAINT `content_libraries_co_contentlibrary_id_75800081_fk_content_l` FOREIGN KEY (`contentlibrary_id`) REFERENCES `content_libraries_contentlibrary` (`id`),
  CONSTRAINT `content_libraries_co_ltitool_id_38e2ba78_fk_lti1p3_to` FOREIGN KEY (`ltitool_id`) REFERENCES `lti1p3_tool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_contentlibrary_authorized_lti_configs`
--

LOCK TABLES `content_libraries_contentlibrary_authorized_lti_configs` WRITE;
/*!40000 ALTER TABLE `content_libraries_contentlibrary_authorized_lti_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_contentlibrary_authorized_lti_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_contentlibraryblockimporttask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_contentlibraryblockimporttask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(30) NOT NULL,
  `progress` double NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `library_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_libraries_co_library_id_ccd48c48_fk_content_l` (`library_id`),
  KEY `content_libraries_contentli_course_id_ae110694` (`course_id`),
  CONSTRAINT `content_libraries_co_library_id_ccd48c48_fk_content_l` FOREIGN KEY (`library_id`) REFERENCES `content_libraries_contentlibrary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_contentlibraryblockimporttask`
--

LOCK TABLES `content_libraries_contentlibraryblockimporttask` WRITE;
/*!40000 ALTER TABLE `content_libraries_contentlibraryblockimporttask` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_contentlibraryblockimporttask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_contentlibrarypermission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_contentlibrarypermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_level` varchar(30) NOT NULL,
  `library_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_libraries_conten_library_id_group_id_3ecc38b9_uniq` (`library_id`,`group_id`),
  UNIQUE KEY `content_libraries_conten_library_id_user_id_81babe29_uniq` (`library_id`,`user_id`),
  KEY `content_libraries_co_group_id_c2a4b6a1_fk_auth_grou` (`group_id`),
  KEY `content_libraries_co_user_id_b071c54d_fk_auth_user` (`user_id`),
  CONSTRAINT `content_libraries_co_group_id_c2a4b6a1_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `content_libraries_co_library_id_51247096_fk_content_l` FOREIGN KEY (`library_id`) REFERENCES `content_libraries_contentlibrary` (`id`),
  CONSTRAINT `content_libraries_co_user_id_b071c54d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_contentlibrarypermission`
--

LOCK TABLES `content_libraries_contentlibrarypermission` WRITE;
/*!40000 ALTER TABLE `content_libraries_contentlibrarypermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_contentlibrarypermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_ltigradedresource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_ltigradedresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usage_key` varchar(255) NOT NULL,
  `resource_id` varchar(255) NOT NULL,
  `resource_title` varchar(255) DEFAULT NULL,
  `ags_lineitem` varchar(255) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_libraries_ltigra_usage_key_profile_id_20a2f94c_uniq` (`usage_key`,`profile_id`),
  KEY `content_libraries_lt_profile_id_a46c16cc_fk_content_l` (`profile_id`),
  CONSTRAINT `content_libraries_lt_profile_id_a46c16cc_fk_content_l` FOREIGN KEY (`profile_id`) REFERENCES `content_libraries_ltiprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_ltigradedresource`
--

LOCK TABLES `content_libraries_ltigradedresource` WRITE;
/*!40000 ALTER TABLE `content_libraries_ltigradedresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_ltigradedresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_ltiprofile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_ltiprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_id` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `subject_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_libraries_ltipro_platform_id_client_id_su_9b6cf002_uniq` (`platform_id`,`client_id`,`subject_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `content_libraries_ltiprofile_user_id_a54fb7a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_ltiprofile`
--

LOCK TABLES `content_libraries_ltiprofile` WRITE;
/*!40000 ALTER TABLE `content_libraries_ltiprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_ltiprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_type_gating_contenttypegatingconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_gating_contenttypegatingconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `enabled_as_of` datetime(6) DEFAULT NULL,
  `studio_override_enabled` tinyint(1) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_gating__changed_by_id_e1754c4b_fk_auth_user` (`changed_by_id`),
  KEY `content_type_gating__course_id_f19cc50d_fk_course_ov` (`course_id`),
  KEY `content_type_gating_contenttypegatingconfig_org_043e72a9` (`org`),
  KEY `content_typ_site_id_e91576_idx` (`site_id`,`org`,`course_id`),
  KEY `content_typ_site_id_650310_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `content_type_gating_contenttypegatingconfig_org_course_70742f9e` (`org_course`),
  CONSTRAINT `content_type_gating__changed_by_id_e1754c4b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_gating__course_id_f19cc50d_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `content_type_gating__site_id_c9f3bc6a_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_type_gating_contenttypegatingconfig`
--

LOCK TABLES `content_type_gating_contenttypegatingconfig` WRITE;
/*!40000 ALTER TABLE `content_type_gating_contenttypegatingconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_type_gating_contenttypegatingconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentserver_cdnuseragentsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentserver_cdnuseragentsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cdn_user_agents` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentserver_cdnuse_changed_by_id_19d8cb94_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentserver_cdnuse_changed_by_id_19d8cb94_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentserver_cdnuseragentsconfig`
--

LOCK TABLES `contentserver_cdnuseragentsconfig` WRITE;
/*!40000 ALTER TABLE `contentserver_cdnuseragentsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentserver_cdnuseragentsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentserver_courseassetcachettlconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentserver_courseassetcachettlconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentserver_course_changed_by_id_a9213047_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentserver_course_changed_by_id_a9213047_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentserver_courseassetcachettlconfig`
--

LOCK TABLES `contentserver_courseassetcachettlconfig` WRITE;
/*!40000 ALTER TABLE `contentserver_courseassetcachettlconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentserver_courseassetcachettlconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_backfillcoursetabsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_backfillcoursetabsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `start_index` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_backfil_changed_by_id_dd8278ae_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentstore_backfil_changed_by_id_dd8278ae_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_backfillcoursetabsconfig`
--

LOCK TABLES `contentstore_backfillcoursetabsconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_backfillcoursetabsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_backfillcoursetabsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_cleanstalecertificateavailabilitydatesconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_cleanstalecertificateavailabilitydatesconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_cleanst_changed_by_id_eca4c67b_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentstore_cleanst_changed_by_id_eca4c67b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_cleanstalecertificateavailabilitydatesconfig`
--

LOCK TABLES `contentstore_cleanstalecertificateavailabilitydatesconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_cleanstalecertificateavailabilitydatesconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_cleanstalecertificateavailabilitydatesconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_videouploadconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_videouploadconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `profile_whitelist` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_videoup_changed_by_id_e7352cb2_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentstore_videoup_changed_by_id_e7352cb2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_videouploadconfig`
--

LOCK TABLES `contentstore_videouploadconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_videouploadconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_videouploadconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstonecoursekey`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstonecoursekey` (
  `internal_course_id` varchar(255) NOT NULL,
  `external_course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`internal_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstonecoursekey`
--

LOCK TABLES `cornerstone_cornerstonecoursekey` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstonecoursekey` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstonecoursekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstoneenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstoneenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `cornerstone_base_url` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `session_token_modified` datetime(6) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cornerstone_cornerstoneente_enterprise_customer_id_5b56887b` (`enterprise_customer_id`),
  CONSTRAINT `cornerstone_cornerst_enterprise_customer__5b56887b_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstoneenterprisecustomerconfiguration`
--

LOCK TABLES `cornerstone_cornerstoneenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstoneenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstoneenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstoneglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstoneglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `subject_mapping` longtext NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `languages` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cornerstone_cornerst_changed_by_id_117db502_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `cornerstone_cornerst_changed_by_id_117db502_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstoneglobalconfiguration`
--

LOCK TABLES `cornerstone_cornerstoneglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstoneglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstoneglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstonelearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstonelearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_guid` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `user_id` int(11) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cornerstone_cornerstonel_user_id_course_id_c975cc5f_uniq` (`user_id`,`course_id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `cornerstone_cornerstonelear_enterprise_course_enrollmen_e3b05dac` (`enterprise_course_enrollment_id`),
  KEY `cornerstone_cornerstonelear_subsection_id_7c3be322` (`subsection_id`),
  KEY `cornerstone_cldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `cornerstone_cornerst_api_record_id_a825c06d_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`),
  CONSTRAINT `cornerstone_cornerst_user_id_43bd15bf_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstonelearnerdatatransmissionaudit`
--

LOCK TABLES `cornerstone_cornerstonelearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstonelearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstonelearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_historicalcornerstoneenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `cornerstone_base_url` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `session_token_modified` datetime(6) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `cornerstone_historic_history_user_id_1ded83c5_fk_auth_user` (`history_user_id`),
  KEY `cornerstone_historicalcorne_id_513efd93` (`id`),
  KEY `cornerstone_historicalcorne_enterprise_customer_id_7f1c53b1` (`enterprise_customer_id`),
  CONSTRAINT `cornerstone_historic_history_user_id_1ded83c5_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_historicalcornerstoneenterprisecustomerconfiguration`
--

LOCK TABLES `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cors_csrf_xdomainproxyconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cors_csrf_xdomainproxyconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `whitelist` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cors_csrf_xdomainpro_changed_by_id_b8e97ec3_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `cors_csrf_xdomainpro_changed_by_id_b8e97ec3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cors_csrf_xdomainproxyconfiguration`
--

LOCK TABLES `cors_csrf_xdomainproxyconfiguration` WRITE;
/*!40000 ALTER TABLE `cors_csrf_xdomainproxyconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cors_csrf_xdomainproxyconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_action_state_coursererunstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_action_state_coursererunstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `action` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `should_display` tinyint(1) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `source_course_key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_action_state_cour_course_key_action_2a8434fb_uniq` (`course_key`,`action`),
  KEY `course_action_state__created_user_id_5373c218_fk_auth_user` (`created_user_id`),
  KEY `course_action_state__updated_user_id_3689fe4b_fk_auth_user` (`updated_user_id`),
  KEY `course_action_state_coursererunstate_course_key_f87bef79` (`course_key`),
  KEY `course_action_state_coursererunstate_action_149773f1` (`action`),
  KEY `course_action_state_coursererunstate_source_course_key_b5037317` (`source_course_key`),
  CONSTRAINT `course_action_state__created_user_id_5373c218_fk_auth_user` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_action_state__updated_user_id_3689fe4b_fk_auth_user` FOREIGN KEY (`updated_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_action_state_coursererunstate`
--

LOCK TABLES `course_action_state_coursererunstate` WRITE;
/*!40000 ALTER TABLE `course_action_state_coursererunstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_action_state_coursererunstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_apps_courseappstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_apps_courseappstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_app_config_for_course` (`app_id`,`course_key`),
  KEY `course_apps_app_id_b3df8c_idx` (`app_id`,`course_key`),
  KEY `course_apps_courseappstatus_app_id_f6c41464` (`app_id`),
  KEY `course_apps_courseappstatus_course_key_5c04010e` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_apps_courseappstatus`
--

LOCK TABLES `course_apps_courseappstatus` WRITE;
/*!40000 ALTER TABLE `course_apps_courseappstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_apps_courseappstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_apps_historicalcourseappstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_apps_historicalcourseappstatus` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_apps_historic_history_user_id_970c6a3a_fk_auth_user` (`history_user_id`),
  KEY `course_apps_historicalcourseappstatus_id_7dab7ce1` (`id`),
  KEY `course_apps_historicalcourseappstatus_app_id_42a9f580` (`app_id`),
  KEY `course_apps_historicalcourseappstatus_course_key_9db183df` (`course_key`),
  CONSTRAINT `course_apps_historic_history_user_id_970c6a3a_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_apps_historicalcourseappstatus`
--

LOCK TABLES `course_apps_historicalcourseappstatus` WRITE;
/*!40000 ALTER TABLE `course_apps_historicalcourseappstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_apps_historicalcourseappstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_creators_coursecreator`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_creators_coursecreator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_changed` datetime(6) NOT NULL,
  `state` varchar(24) NOT NULL,
  `note` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  `all_organizations` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `course_creators_coursecreator_user_id_e4da548d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_creators_coursecreator`
--

LOCK TABLES `course_creators_coursecreator` WRITE;
/*!40000 ALTER TABLE `course_creators_coursecreator` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_creators_coursecreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_creators_coursecreator_organizations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_creators_coursecreator_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursecreator_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_creators_coursecr_coursecreator_id_organiz_4c4765a1_uniq` (`coursecreator_id`,`organization_id`),
  KEY `course_creators_cour_organization_id_f561fb6c_fk_organizat` (`organization_id`),
  CONSTRAINT `course_creators_cour_coursecreator_id_cd9dbd7f_fk_course_cr` FOREIGN KEY (`coursecreator_id`) REFERENCES `course_creators_coursecreator` (`id`),
  CONSTRAINT `course_creators_cour_organization_id_f561fb6c_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_creators_coursecreator_organizations`
--

LOCK TABLES `course_creators_coursecreator_organizations` WRITE;
/*!40000 ALTER TABLE `course_creators_coursecreator_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_creators_coursecreator_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_date_signals_selfpacedrelativedatesconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_date_signals_selfpacedrelativedatesconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_date_site_id_a44836_idx` (`site_id`,`org`,`course_id`),
  KEY `course_date_site_id_c0164a_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `course_date_signals__changed_by_id_5f8228f2_fk_auth_user` (`changed_by_id`),
  KEY `course_date_signals__course_id_361d8ca8_fk_course_ov` (`course_id`),
  KEY `course_date_signals_selfpacedrelativedatesconfig_org_9c13e820` (`org`),
  KEY `course_date_signals_selfpac_org_course_b7041c4f` (`org_course`),
  CONSTRAINT `course_date_signals__changed_by_id_5f8228f2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_date_signals__course_id_361d8ca8_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `course_date_signals__site_id_29483878_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_date_signals_selfpacedrelativedatesconfig`
--

LOCK TABLES `course_date_signals_selfpacedrelativedatesconfig` WRITE;
/*!40000 ALTER TABLE `course_date_signals_selfpacedrelativedatesconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_date_signals_selfpacedrelativedatesconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_duration_limits_coursedurationlimitconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_duration_limits_coursedurationlimitconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `enabled_as_of` datetime(6) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_duration_limi_changed_by_id_f320fd76_fk_auth_user` (`changed_by_id`),
  KEY `course_duration_limi_course_id_97b7a8e9_fk_course_ov` (`course_id`),
  KEY `course_duration_limits_coursedurationlimitconfig_org_c2cc0091` (`org`),
  KEY `course_dura_site_id_424016_idx` (`site_id`,`org`,`course_id`),
  KEY `course_dura_site_id_b5bbcd_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `course_duration_limits_cour_org_course_bcd05764` (`org_course`),
  CONSTRAINT `course_duration_limi_changed_by_id_f320fd76_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_duration_limi_course_id_97b7a8e9_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `course_duration_limi_site_id_cb492296_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_duration_limits_coursedurationlimitconfig`
--

LOCK TABLES `course_duration_limits_coursedurationlimitconfig` WRITE;
/*!40000 ALTER TABLE `course_duration_limits_coursedurationlimitconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_duration_limits_coursedurationlimitconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals_coursegoal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_coursegoal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `goal_key` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `days_per_week` int(10) unsigned NOT NULL,
  `subscribed_to_reminders` tinyint(1) NOT NULL,
  `unsubscribe_token` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_goals_coursegoal_user_id_course_key_052bc0d3_uniq` (`user_id`,`course_key`),
  UNIQUE KEY `unsubscribe_token` (`unsubscribe_token`),
  KEY `course_goals_coursegoal_course_key_5585ca51` (`course_key`),
  CONSTRAINT `course_goals_coursegoal_user_id_0a07e3db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals_coursegoal`
--

LOCK TABLES `course_goals_coursegoal` WRITE;
/*!40000 ALTER TABLE `course_goals_coursegoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_goals_coursegoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals_coursegoalreminderstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_coursegoalreminderstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email_reminder_sent` tinyint(1) NOT NULL,
  `goal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goal_id` (`goal_id`),
  CONSTRAINT `course_goals_courseg_goal_id_8a7932cf_fk_course_go` FOREIGN KEY (`goal_id`) REFERENCES `course_goals_coursegoal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals_coursegoalreminderstatus`
--

LOCK TABLES `course_goals_coursegoalreminderstatus` WRITE;
/*!40000 ALTER TABLE `course_goals_coursegoalreminderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_goals_coursegoalreminderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals_historicalcoursegoal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_historicalcoursegoal` (
  `id` int(11) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `goal_key` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `days_per_week` int(10) unsigned NOT NULL,
  `subscribed_to_reminders` tinyint(1) NOT NULL,
  `unsubscribe_token` char(32) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_goals_histori_history_user_id_b20abbc7_fk_auth_user` (`history_user_id`),
  KEY `course_goals_historicalcoursegoal_id_ae96ee01` (`id`),
  KEY `course_goals_historicalcoursegoal_course_key_a8e29f00` (`course_key`),
  KEY `course_goals_historicalcoursegoal_user_id_3aef8b4b` (`user_id`),
  KEY `course_goals_historicalcoursegoal_unsubscribe_token_96b31785` (`unsubscribe_token`),
  CONSTRAINT `course_goals_histori_history_user_id_b20abbc7_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals_historicalcoursegoal`
--

LOCK TABLES `course_goals_historicalcoursegoal` WRITE;
/*!40000 ALTER TABLE `course_goals_historicalcoursegoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_goals_historicalcoursegoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals_useractivity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_useractivity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_course_date` (`user_id`,`course_key`,`date`),
  KEY `user_course_index` (`user_id`,`course_key`),
  CONSTRAINT `course_goals_useractivity_user_id_aed932d9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals_useractivity`
--

LOCK TABLES `course_goals_useractivity` WRITE;
/*!40000 ALTER TABLE `course_goals_useractivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_goals_useractivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_cohortmembership`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_cohortmembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_cohortmembership_user_id_course_id_c247eb7f_uniq` (`user_id`,`course_id`),
  KEY `course_groups_cohort_course_user_group_id_6ea50b45_fk_course_gr` (`course_user_group_id`),
  CONSTRAINT `course_groups_cohort_course_user_group_id_6ea50b45_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `course_groups_cohortmembership_user_id_aae5b8e7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_cohortmembership`
--

LOCK TABLES `course_groups_cohortmembership` WRITE;
/*!40000 ALTER TABLE `course_groups_cohortmembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_cohortmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_coursecohort`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_coursecohort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_type` varchar(20) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_user_group_id` (`course_user_group_id`),
  CONSTRAINT `course_groups_course_course_user_group_id_ec5703ee_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_coursecohort`
--

LOCK TABLES `course_groups_coursecohort` WRITE;
/*!40000 ALTER TABLE `course_groups_coursecohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_coursecohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_coursecohortssettings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_coursecohortssettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_cohorted` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `cohorted_discussions` longtext,
  `always_cohort_inline_discussions` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_coursecohortssettings`
--

LOCK TABLES `course_groups_coursecohortssettings` WRITE;
/*!40000 ALTER TABLE `course_groups_coursecohortssettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_coursecohortssettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `group_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_courseusergroup_name_course_id_b767231d_uniq` (`name`,`course_id`),
  KEY `course_groups_courseusergroup_course_id_902aea4c` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergroup`
--

LOCK TABLES `course_groups_courseusergroup` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergroup_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseusergroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_courseuser_courseusergroup_id_user__694e8c30_uniq` (`courseusergroup_id`,`user_id`),
  KEY `course_groups_course_user_id_28aff981_fk_auth_user` (`user_id`),
  CONSTRAINT `course_groups_course_courseusergroup_id_26a7966f_fk_course_gr` FOREIGN KEY (`courseusergroup_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `course_groups_course_user_id_28aff981_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergroup_users`
--

LOCK TABLES `course_groups_courseusergroup_users` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergrouppartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergrouppartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_user_group_id` (`course_user_group_id`),
  CONSTRAINT `course_groups_course_course_user_group_id_6032d512_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergrouppartitiongroup`
--

LOCK TABLES `course_groups_courseusergrouppartitiongroup` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergrouppartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergrouppartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_unregisteredlearnercohortassignments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_unregisteredlearnercohortassignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_unregister_course_id_email_81a9d1db_uniq` (`course_id`,`email`),
  KEY `course_groups_unregi_course_user_group_id_c1c8a247_fk_course_gr` (`course_user_group_id`),
  KEY `course_groups_unregisteredl_email_05d0e40e` (`email`),
  CONSTRAINT `course_groups_unregi_course_user_group_id_c1c8a247_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_unregisteredlearnercohortassignments`
--

LOCK TABLES `course_groups_unregisteredlearnercohortassignments` WRITE;
/*!40000 ALTER TABLE `course_groups_unregisteredlearnercohortassignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_unregisteredlearnercohortassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_home_api_disableprogresspagestackedconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_home_api_disableprogresspagestackedconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_home_site_id_6988e4_idx` (`site_id`,`org`,`course_id`),
  KEY `course_home_site_id_23dec6_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `course_home_api_disa_changed_by_id_2a8c1176_fk_auth_user` (`changed_by_id`),
  KEY `course_home_api_disa_course_id_815633f2_fk_course_ov` (`course_id`),
  KEY `course_home_api_disableprogresspagestackedconfig_org_d6dd0056` (`org`),
  KEY `course_home_api_disableprog_org_course_b4b94c97` (`org_course`),
  CONSTRAINT `course_home_api_disa_changed_by_id_2a8c1176_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_home_api_disa_course_id_815633f2_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `course_home_api_disa_site_id_81e5e9d3_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_home_api_disableprogresspagestackedconfig`
--

LOCK TABLES `course_home_api_disableprogresspagestackedconfig` WRITE;
/*!40000 ALTER TABLE `course_home_api_disableprogresspagestackedconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_home_api_disableprogresspagestackedconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_live_courseliveconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_live_courseliveconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_type` varchar(50) NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  `free_tier` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_live_courseli_lti_configuration_id_ec442587_fk_lti_consu` (`lti_configuration_id`),
  KEY `course_live_courseliveconfiguration_course_key_ff15afd8` (`course_key`),
  CONSTRAINT `course_live_courseli_lti_configuration_id_ec442587_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_live_courseliveconfiguration`
--

LOCK TABLES `course_live_courseliveconfiguration` WRITE;
/*!40000 ALTER TABLE `course_live_courseliveconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_live_courseliveconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_live_historicalcourseliveconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_live_historicalcourseliveconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_type` varchar(50) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  `free_tier` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_live_historic_history_user_id_eb9f8dda_fk_auth_user` (`history_user_id`),
  KEY `course_live_historicalcourseliveconfiguration_id_45a9db2e` (`id`),
  KEY `course_live_historicalcours_course_key_1453fa63` (`course_key`),
  KEY `course_live_historicalcours_lti_configuration_id_62cf6306` (`lti_configuration_id`),
  CONSTRAINT `course_live_historic_history_user_id_eb9f8dda_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_live_historicalcourseliveconfiguration`
--

LOCK TABLES `course_live_historicalcourseliveconfiguration` WRITE;
/*!40000 ALTER TABLE `course_live_historicalcourseliveconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_live_historicalcourseliveconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemode`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_datetime` datetime(6) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `description` longtext,
  `sku` varchar(255) DEFAULT NULL,
  `expiration_datetime_is_explicit` tinyint(1) NOT NULL,
  `bulk_sku` varchar(255) DEFAULT NULL,
  `android_sku` varchar(255) DEFAULT NULL,
  `ios_sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_modes_coursemode_course_id_mode_slug_curr_56f8e675_uniq` (`course_id`,`mode_slug`,`currency`),
  KEY `course_modes_coursemode_course_id_3daf3b9d` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemode`
--

LOCK TABLES `course_modes_coursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemode` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemodeexpirationconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemodeexpirationconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `verification_window` bigint(20) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_modes_coursem_changed_by_id_208463ee_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `course_modes_coursem_changed_by_id_208463ee_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemodeexpirationconfig`
--

LOCK TABLES `course_modes_coursemodeexpirationconfig` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemodeexpirationconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemodeexpirationconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemodesarchive`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemodesarchive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `expiration_datetime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_modes_coursemodesarchive_course_id_f67bbd35` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemodesarchive`
--

LOCK TABLES `course_modes_coursemodesarchive` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemodesarchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemodesarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_historicalcoursemode`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_historicalcoursemode` (
  `id` int(11) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_datetime` datetime(6) DEFAULT NULL,
  `expiration_datetime_is_explicit` tinyint(1) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `description` longtext,
  `sku` varchar(255) DEFAULT NULL,
  `bulk_sku` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `android_sku` varchar(255) DEFAULT NULL,
  `ios_sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_modes_histori_history_user_id_d92d6b6e_fk_auth_user` (`history_user_id`),
  KEY `course_modes_historicalcoursemode_id_14918a77` (`id`),
  KEY `course_modes_historicalcoursemode_course_id_e8de13cd` (`course_id`),
  CONSTRAINT `course_modes_histori_history_user_id_d92d6b6e_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_historicalcoursemode`
--

LOCK TABLES `course_modes_historicalcoursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_historicalcoursemode` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_historicalcoursemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverview` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `version` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `_location` varchar(255) NOT NULL,
  `display_name` longtext,
  `display_number_with_default` longtext NOT NULL,
  `display_org_with_default` longtext NOT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `advertised_start` longtext,
  `course_image_url` longtext NOT NULL,
  `social_sharing_url` longtext,
  `end_of_course_survey_url` longtext,
  `certificates_display_behavior` longtext,
  `certificates_show_before_end` tinyint(1) NOT NULL,
  `cert_html_view_enabled` tinyint(1) NOT NULL,
  `has_any_active_web_certificate` tinyint(1) NOT NULL,
  `cert_name_short` longtext NOT NULL,
  `cert_name_long` longtext NOT NULL,
  `lowest_passing_grade` decimal(5,2) DEFAULT NULL,
  `days_early_for_beta` double DEFAULT NULL,
  `mobile_available` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `_pre_requisite_courses_json` longtext NOT NULL,
  `enrollment_start` datetime(6) DEFAULT NULL,
  `enrollment_end` datetime(6) DEFAULT NULL,
  `enrollment_domain` longtext,
  `invitation_only` tinyint(1) NOT NULL,
  `max_student_enrollments_allowed` int(11) DEFAULT NULL,
  `announcement` datetime(6) DEFAULT NULL,
  `catalog_visibility` longtext,
  `course_video_url` longtext,
  `effort` longtext,
  `short_description` longtext,
  `org` longtext NOT NULL,
  `self_paced` tinyint(1) NOT NULL,
  `marketing_url` longtext,
  `eligible_for_financial_aid` tinyint(1) NOT NULL,
  `language` longtext,
  `certificate_available_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `banner_image_url` longtext NOT NULL,
  `has_highlights` tinyint(1) DEFAULT NULL,
  `allow_proctoring_opt_out` tinyint(1) NOT NULL,
  `enable_proctored_exams` tinyint(1) NOT NULL,
  `proctoring_escalation_email` longtext,
  `proctoring_provider` longtext,
  `entrance_exam_enabled` tinyint(1) NOT NULL,
  `entrance_exam_id` varchar(255) NOT NULL,
  `entrance_exam_minimum_score_pct` double NOT NULL,
  `external_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverview`
--

LOCK TABLES `course_overviews_courseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverview` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_courseoverview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverviewimageconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverviewimageconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `small_width` int(11) NOT NULL,
  `small_height` int(11) NOT NULL,
  `large_width` int(11) NOT NULL,
  `large_height` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_overviews_cou_changed_by_id_b60ae39a_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `course_overviews_cou_changed_by_id_b60ae39a_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewimageconfig`
--

LOCK TABLES `course_overviews_courseoverviewimageconfig` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverviewimageset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverviewimageset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `small_url` longtext NOT NULL,
  `large_url` longtext NOT NULL,
  `course_overview_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_overview_id` (`course_overview_id`),
  CONSTRAINT `course_overviews_cou_course_overview_id_ef7aa548_fk_course_ov` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewimageset`
--

LOCK TABLES `course_overviews_courseoverviewimageset` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageset` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverviewtab`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverviewtab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_id` varchar(50) NOT NULL,
  `course_overview_id` varchar(255) NOT NULL,
  `course_staff_only` tinyint(1) NOT NULL,
  `name` longtext,
  `type` varchar(50) DEFAULT NULL,
  `url_slug` longtext,
  `link` longtext,
  `is_hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_overviews_cou_course_overview_id_71fa6321_fk_course_ov` (`course_overview_id`),
  CONSTRAINT `course_overviews_cou_course_overview_id_71fa6321_fk_course_ov` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewtab`
--

LOCK TABLES `course_overviews_courseoverviewtab` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewtab` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_courseoverviewtab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_historicalcourseoverview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_historicalcourseoverview` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `version` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `_location` varchar(255) NOT NULL,
  `org` longtext NOT NULL,
  `display_name` longtext,
  `display_number_with_default` longtext NOT NULL,
  `display_org_with_default` longtext NOT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `advertised_start` longtext,
  `announcement` datetime(6) DEFAULT NULL,
  `course_image_url` longtext NOT NULL,
  `social_sharing_url` longtext,
  `end_of_course_survey_url` longtext,
  `certificates_display_behavior` longtext,
  `certificates_show_before_end` tinyint(1) NOT NULL,
  `cert_html_view_enabled` tinyint(1) NOT NULL,
  `has_any_active_web_certificate` tinyint(1) NOT NULL,
  `cert_name_short` longtext NOT NULL,
  `cert_name_long` longtext NOT NULL,
  `certificate_available_date` datetime(6) DEFAULT NULL,
  `lowest_passing_grade` decimal(5,2) DEFAULT NULL,
  `days_early_for_beta` double DEFAULT NULL,
  `mobile_available` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `_pre_requisite_courses_json` longtext NOT NULL,
  `enrollment_start` datetime(6) DEFAULT NULL,
  `enrollment_end` datetime(6) DEFAULT NULL,
  `enrollment_domain` longtext,
  `invitation_only` tinyint(1) NOT NULL,
  `max_student_enrollments_allowed` int(11) DEFAULT NULL,
  `catalog_visibility` longtext,
  `short_description` longtext,
  `course_video_url` longtext,
  `effort` longtext,
  `self_paced` tinyint(1) NOT NULL,
  `marketing_url` longtext,
  `eligible_for_financial_aid` tinyint(1) NOT NULL,
  `language` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `banner_image_url` longtext NOT NULL,
  `has_highlights` tinyint(1) DEFAULT NULL,
  `allow_proctoring_opt_out` tinyint(1) NOT NULL,
  `enable_proctored_exams` tinyint(1) NOT NULL,
  `proctoring_escalation_email` longtext,
  `proctoring_provider` longtext,
  `entrance_exam_enabled` tinyint(1) NOT NULL,
  `entrance_exam_id` varchar(255) NOT NULL,
  `entrance_exam_minimum_score_pct` double NOT NULL,
  `external_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_overviews_his_history_user_id_e21063d9_fk_auth_user` (`history_user_id`),
  KEY `course_overviews_historicalcourseoverview_id_647043f0` (`id`),
  CONSTRAINT `course_overviews_his_history_user_id_e21063d9_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_historicalcourseoverview`
--

LOCK TABLES `course_overviews_historicalcourseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_historicalcourseoverview` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_historicalcourseoverview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_simulatecoursepublishconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_simulatecoursepublishconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_overviews_sim_changed_by_id_3413c118_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `course_overviews_sim_changed_by_id_3413c118_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_simulatecoursepublishconfig`
--

LOCK TABLES `course_overviews_simulatecoursepublishconfig` WRITE;
/*!40000 ALTER TABLE `course_overviews_simulatecoursepublishconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_simulatecoursepublishconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_coursedynamicupgradedeadlineconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_coursedynamicupgradedeadlineconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `deadline_days` smallint(5) unsigned NOT NULL,
  `opt_out` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_coursedyn_changed_by_id_2c4efc3a_fk_auth_user` (`changed_by_id`),
  KEY `courseware_coursedynamicupg_course_id_60b88041` (`course_id`),
  CONSTRAINT `courseware_coursedyn_changed_by_id_2c4efc3a_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_coursedynamicupgradedeadlineconfiguration`
--

LOCK TABLES `courseware_coursedynamicupgradedeadlineconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_coursedynamicupgradedeadlineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_coursedynamicupgradedeadlineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_dynamicupgradedeadlineconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_dynamicupgradedeadlineconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `deadline_days` smallint(5) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_dynamicup_changed_by_id_6a450e2c_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `courseware_dynamicup_changed_by_id_6a450e2c_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_dynamicupgradedeadlineconfiguration`
--

LOCK TABLES `courseware_dynamicupgradedeadlineconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_dynamicupgradedeadlineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_dynamicupgradedeadlineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_financialassistanceconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_financialassistanceconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `api_base_url` varchar(200) NOT NULL,
  `service_username` varchar(100) NOT NULL,
  `fa_backend_enabled_courses_percentage` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_financial_changed_by_id_acb152e5_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `courseware_financial_changed_by_id_acb152e5_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_financialassistanceconfiguration`
--

LOCK TABLES `courseware_financialassistanceconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_financialassistanceconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_financialassistanceconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_lastseencoursewaretimezone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_lastseencoursewaretimezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_seen_courseware_timezone` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `courseware_lastseencoursewa_last_seen_courseware_timezo_39c8f549` (`last_seen_courseware_timezone`),
  CONSTRAINT `courseware_lastseenc_user_id_b3deb845_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_lastseencoursewaretimezone`
--

LOCK TABLES `courseware_lastseencoursewaretimezone` WRITE;
/*!40000 ALTER TABLE `courseware_lastseencoursewaretimezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_lastseencoursewaretimezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_offlinecomputedgrade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_offlinecomputedgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `gradeset` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_offlinecomputedgrade_user_id_course_id_18dfd343_uniq` (`user_id`,`course_id`),
  KEY `courseware_offlinecomputedgrade_course_id_03e21ba7` (`course_id`),
  KEY `courseware_offlinecomputedgrade_created_b5bca47f` (`created`),
  KEY `courseware_offlinecomputedgrade_updated_6f3faff6` (`updated`),
  CONSTRAINT `courseware_offlinecomputedgrade_user_id_14864cea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_offlinecomputedgrade`
--

LOCK TABLES `courseware_offlinecomputedgrade` WRITE;
/*!40000 ALTER TABLE `courseware_offlinecomputedgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_offlinecomputedgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_offlinecomputedgradelog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_offlinecomputedgradelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `seconds` int(11) NOT NULL,
  `nstudents` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_offlinecomputedgradelog_course_id_1014e127` (`course_id`),
  KEY `courseware_offlinecomputedgradelog_created_33076a1a` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_offlinecomputedgradelog`
--

LOCK TABLES `courseware_offlinecomputedgradelog` WRITE;
/*!40000 ALTER TABLE `courseware_offlinecomputedgradelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_offlinecomputedgradelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_orgdynamicupgradedeadlineconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_orgdynamicupgradedeadlineconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `org_id` varchar(255) NOT NULL,
  `deadline_days` smallint(5) unsigned NOT NULL,
  `opt_out` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_orgdynami_changed_by_id_b557a1ea_fk_auth_user` (`changed_by_id`),
  KEY `courseware_orgdynamicupgrad_org_id_85d3cbe4` (`org_id`),
  CONSTRAINT `courseware_orgdynami_changed_by_id_b557a1ea_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_orgdynamicupgradedeadlineconfiguration`
--

LOCK TABLES `courseware_orgdynamicupgradedeadlineconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_orgdynamicupgradedeadlineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_orgdynamicupgradedeadlineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentfieldoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentfieldoverride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_studentfieldo_course_id_field_location_a1f7da25_uniq` (`course_id`,`field`,`location`,`student_id`),
  KEY `courseware_studentfi_student_id_7a972765_fk_auth_user` (`student_id`),
  KEY `courseware_studentfieldoverride_course_id_7ca0051c` (`course_id`),
  KEY `courseware_studentfieldoverride_location_95ad5047` (`location`),
  CONSTRAINT `courseware_studentfi_student_id_7a972765_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentfieldoverride`
--

LOCK TABLES `courseware_studentfieldoverride` WRITE;
/*!40000 ALTER TABLE `courseware_studentfieldoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentfieldoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentmodule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentmodule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_type` varchar(32) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `state` longtext,
  `grade` double DEFAULT NULL,
  `max_grade` double DEFAULT NULL,
  `done` varchar(8) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_studentmodule_student_id_module_id_cou_48e8deef_uniq` (`student_id`,`module_id`,`course_id`),
  KEY `courseware_studentmodule_module_type_f4f8863f` (`module_type`),
  KEY `courseware_studentmodule_course_id_0637cb49` (`course_id`),
  KEY `courseware_studentmodule_grade_adac1ba7` (`grade`),
  KEY `courseware_studentmodule_created_9976b4ad` (`created`),
  KEY `courseware_studentmodule_modified_f6a0b0cc` (`modified`),
  KEY `courseware_stats` (`module_id`,`grade`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodule`
--

LOCK TABLES `courseware_studentmodule` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentmodulehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentmodulehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `state` longtext,
  `grade` double DEFAULT NULL,
  `max_grade` double DEFAULT NULL,
  `student_module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_studentmo_student_module_id_6efc64cf_fk_coursewar` (`student_module_id`),
  KEY `courseware_studentmodulehistory_version_d3823ad1` (`version`),
  KEY `courseware_studentmodulehistory_created_19cb94d2` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodulehistory`
--

LOCK TABLES `courseware_studentmodulehistory` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmodulestudentinfofield`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmodulestudentinfofield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulestuden_student_id_field_name_2f3a4ee8_uniq` (`student_id`,`field_name`),
  KEY `courseware_xmodulestudentinfofield_field_name_191b762e` (`field_name`),
  KEY `courseware_xmodulestudentinfofield_created_beada63d` (`created`),
  KEY `courseware_xmodulestudentinfofield_modified_b53f9c88` (`modified`),
  CONSTRAINT `courseware_xmodulest_student_id_b78d39b4_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentinfofield`
--

LOCK TABLES `courseware_xmodulestudentinfofield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmodulestudentprefsfield`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmodulestudentprefsfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `module_type` varchar(64) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulestuden_student_id_module_type_f_1c218850_uniq` (`student_id`,`module_type`,`field_name`),
  KEY `courseware_xmodulestudentprefsfield_field_name_68d5e66e` (`field_name`),
  KEY `courseware_xmodulestudentprefsfield_created_16090241` (`created`),
  KEY `courseware_xmodulestudentprefsfield_modified_5b4e5525` (`modified`),
  KEY `courseware_xmodulestudentprefsfield_module_type_45b994b9` (`module_type`),
  CONSTRAINT `courseware_xmodulest_student_id_3c60ec8a_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentprefsfield`
--

LOCK TABLES `courseware_xmodulestudentprefsfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentprefsfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmodulestudentprefsfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmoduleuserstatesummaryfield`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmoduleuserstatesummaryfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `usage_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmoduleuserst_usage_id_field_name_e4e34c44_uniq` (`usage_id`,`field_name`),
  KEY `courseware_xmoduleuserstatesummaryfield_field_name_395cd2a6` (`field_name`),
  KEY `courseware_xmoduleuserstatesummaryfield_created_57d773a1` (`created`),
  KEY `courseware_xmoduleuserstatesummaryfield_modified_b4277a5d` (`modified`),
  KEY `courseware_xmoduleuserstatesummaryfield_usage_id_9f239d1f` (`usage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmoduleuserstatesummaryfield`
--

LOCK TABLES `courseware_xmoduleuserstatesummaryfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawlers_crawlersconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crawlers_crawlersconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `known_user_agents` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crawlers_crawlersconfig_changed_by_id_544af924_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `crawlers_crawlersconfig_changed_by_id_544af924_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawlers_crawlersconfig`
--

LOCK TABLES `crawlers_crawlersconfig` WRITE;
/*!40000 ALTER TABLE `crawlers_crawlersconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `crawlers_crawlersconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials_credentialsapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials_credentialsapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `internal_service_url` varchar(200) NOT NULL,
  `public_service_url` varchar(200) NOT NULL,
  `enable_learner_issuance` tinyint(1) NOT NULL,
  `enable_studio_authoring` tinyint(1) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credentials_credenti_changed_by_id_9e145a81_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `credentials_credenti_changed_by_id_9e145a81_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials_credentialsapiconfig`
--

LOCK TABLES `credentials_credentialsapiconfig` WRITE;
/*!40000 ALTER TABLE `credentials_credentialsapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_credentialsapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials_notifycredentialsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials_notifycredentialsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credentials_notifycr_changed_by_id_e31cde0e_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `credentials_notifycr_changed_by_id_e31cde0e_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials_notifycredentialsconfig`
--

LOCK TABLES `credentials_notifycredentialsconfig` WRITE;
/*!40000 ALTER TABLE `credentials_notifycredentialsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_notifycredentialsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_creditconfig_changed_by_id_72e1eca9_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `credit_creditconfig_changed_by_id_72e1eca9_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditconfig`
--

LOCK TABLES `credit_creditconfig` WRITE;
/*!40000 ALTER TABLE `credit_creditconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditcourse`
--

LOCK TABLES `credit_creditcourse` WRITE;
/*!40000 ALTER TABLE `credit_creditcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_crediteligibility`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_crediteligibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_crediteligibility_username_course_id_7906b4c1_uniq` (`username`,`course_id`),
  KEY `credit_crediteligibi_course_id_d86f481f_fk_credit_cr` (`course_id`),
  KEY `credit_crediteligibility_username_4c275fb5` (`username`),
  CONSTRAINT `credit_crediteligibi_course_id_d86f481f_fk_credit_cr` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_crediteligibility`
--

LOCK TABLES `credit_crediteligibility` WRITE;
/*!40000 ALTER TABLE `credit_crediteligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_crediteligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditprovider`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditprovider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `enable_integration` tinyint(1) NOT NULL,
  `provider_url` varchar(200) NOT NULL,
  `provider_status_url` varchar(200) NOT NULL,
  `provider_description` longtext NOT NULL,
  `fulfillment_instructions` longtext,
  `eligibility_email_message` longtext NOT NULL,
  `receipt_email_message` longtext NOT NULL,
  `thumbnail_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditprovider`
--

LOCK TABLES `credit_creditprovider` WRITE;
/*!40000 ALTER TABLE `credit_creditprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `parameters` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `credit_creditrequest_username_course_id_provi_3b019afe_uniq` (`username`,`course_id`,`provider_id`),
  KEY `credit_creditrequest_course_id_5478ceaf_fk_credit_cr` (`course_id`),
  KEY `credit_creditrequest_provider_id_5465ab8b_fk_credit_cr` (`provider_id`),
  KEY `credit_creditrequest_username_bd5623e4` (`username`),
  CONSTRAINT `credit_creditrequest_course_id_5478ceaf_fk_credit_cr` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`),
  CONSTRAINT `credit_creditrequest_provider_id_5465ab8b_fk_credit_cr` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequest`
--

LOCK TABLES `credit_creditrequest` WRITE;
/*!40000 ALTER TABLE `credit_creditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequirement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `criteria` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `sort_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirement_namespace_name_course_id_87c301e6_uniq` (`namespace`,`name`,`course_id`),
  KEY `credit_creditrequire_course_id_b6aa812a_fk_credit_cr` (`course_id`),
  CONSTRAINT `credit_creditrequire_course_id_b6aa812a_fk_credit_cr` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequirement`
--

LOCK TABLES `credit_creditrequirement` WRITE;
/*!40000 ALTER TABLE `credit_creditrequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequirementstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequirementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `reason` longtext NOT NULL,
  `requirement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirement_username_requirement_id_f761eba5_uniq` (`username`,`requirement_id`),
  KEY `credit_creditrequire_requirement_id_cde25c76_fk_credit_cr` (`requirement_id`),
  KEY `credit_creditrequirementstatus_username_4c2511ed` (`username`),
  CONSTRAINT `credit_creditrequire_requirement_id_cde25c76_fk_credit_cr` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequirementstatus`
--

LOCK TABLES `credit_creditrequirementstatus` WRITE;
/*!40000 ALTER TABLE `credit_creditrequirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dark_lang_darklangconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dark_lang_darklangconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `released_languages` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `beta_languages` longtext NOT NULL,
  `enable_beta_languages` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dark_lang_darklangconfig_changed_by_id_9a7df899_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `dark_lang_darklangconfig_changed_by_id_9a7df899_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dark_lang_darklangconfig`
--

LOCK TABLES `dark_lang_darklangconfig` WRITE;
/*!40000 ALTER TABLE `dark_lang_darklangconfig` DISABLE KEYS */;
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2023-02-21 13:28:15.724018',1,'',NULL,'',0);
/*!40000 ALTER TABLE `dark_lang_darklangconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed2_degreed2enterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed2_degreed2enterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `degreed_base_url` varchar(255) NOT NULL,
  `degreed_token_fetch_base_url` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreed2_degreed2enterprise_enterprise_customer_id_93516183` (`enterprise_customer_id`),
  CONSTRAINT `degreed2_degreed2ent_enterprise_customer__93516183_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed2_degreed2enterprisecustomerconfiguration`
--

LOCK TABLES `degreed2_degreed2enterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed2_degreed2enterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed2_degreed2enterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed2_degreed2learnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed2_degreed2learnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degreed_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `degreed_completed_timestamp` varchar(19) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `degreed2_degreed2learnerdat_enterprise_course_enrollmen_c093fa2b` (`enterprise_course_enrollment_id`),
  KEY `degreed2_degreed2learnerdat_subsection_id_b8501613` (`subsection_id`),
  KEY `degreed2_dldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `degreed2_degreed2lea_api_record_id_0d632eab_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed2_degreed2learnerdatatransmissionaudit`
--

LOCK TABLES `degreed2_degreed2learnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `degreed2_degreed2learnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed2_degreed2learnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed2_historicaldegreed2enterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed2_historicaldegreed2enterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `degreed_base_url` varchar(255) NOT NULL,
  `degreed_token_fetch_base_url` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `degreed2_historicald_history_user_id_35a20f8c_fk_auth_user` (`history_user_id`),
  KEY `degreed2_historicaldegreed2_id_4a50fac9` (`id`),
  KEY `degreed2_historicaldegreed2_enterprise_customer_id_513db5d3` (`enterprise_customer_id`),
  CONSTRAINT `degreed2_historicald_history_user_id_35a20f8c_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed2_historicaldegreed2enterprisecustomerconfiguration`
--

LOCK TABLES `degreed2_historicaldegreed2enterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed2_historicaldegreed2enterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed2_historicaldegreed2enterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_degreedenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_degreedenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `degreed_company_id` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `degreed_base_url` varchar(255) NOT NULL,
  `degreed_user_id` varchar(255) NOT NULL,
  `degreed_user_password` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreed_degreedenterprisecu_enterprise_customer_id_86f16a0d` (`enterprise_customer_id`),
  CONSTRAINT `degreed_degreedenter_enterprise_customer__86f16a0d_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_degreedenterprisecustomerconfiguration`
--

LOCK TABLES `degreed_degreedenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed_degreedenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_degreedenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_degreedglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_degreedglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `course_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreed_degreedgloba_changed_by_id_00a8a7be_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `degreed_degreedgloba_changed_by_id_00a8a7be_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_degreedglobalconfiguration`
--

LOCK TABLES `degreed_degreedglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed_degreedglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_degreedglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_degreedlearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_degreedlearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degreed_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `degreed_completed_timestamp` varchar(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `degreed_degreedlearnerdatat_enterprise_course_enrollmen_2b4fe278` (`enterprise_course_enrollment_id`),
  KEY `degreed_degreedlearnerdatat_subsection_id_17780106` (`subsection_id`),
  KEY `degreed_dldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `degreed_degreedlearn_api_record_id_670a6fb9_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_degreedlearnerdatatransmissionaudit`
--

LOCK TABLES `degreed_degreedlearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `degreed_degreedlearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_degreedlearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_historicaldegreedenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_historicaldegreedenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `degreed_company_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `degreed_base_url` varchar(255) NOT NULL,
  `degreed_user_id` varchar(255) NOT NULL,
  `degreed_user_password` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `degreed_historicalde_history_user_id_5b4776d8_fk_auth_user` (`history_user_id`),
  KEY `degreed_historicaldegreeden_id_756f1445` (`id`),
  KEY `degreed_historicaldegreeden_enterprise_customer_id_12129e6f` (`enterprise_customer_id`),
  CONSTRAINT `degreed_historicalde_history_user_id_5b4776d8_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_historicaldegreedenterprisecustomerconfiguration`
--

LOCK TABLES `degreed_historicaldegreedenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed_historicaldegreedenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_historicaldegreedenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographics_historicaluserdemographics`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographics_historicaluserdemographics` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `show_call_to_action` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `demographics_histori_history_user_id_a05d5af3_fk_auth_user` (`history_user_id`),
  KEY `demographics_historicaluserdemographics_id_7a2d6c8f` (`id`),
  KEY `demographics_historicaluserdemographics_user_id_4fb8f26b` (`user_id`),
  CONSTRAINT `demographics_histori_history_user_id_a05d5af3_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographics_historicaluserdemographics`
--

LOCK TABLES `demographics_historicaluserdemographics` WRITE;
/*!40000 ALTER TABLE `demographics_historicaluserdemographics` DISABLE KEYS */;
/*!40000 ALTER TABLE `demographics_historicaluserdemographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographics_userdemographics`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographics_userdemographics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `show_call_to_action` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `demographics_userdemographics_user_id_e435d5d5_uniq` (`user_id`),
  CONSTRAINT `demographics_userdemographics_user_id_e435d5d5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographics_userdemographics`
--

LOCK TABLES `demographics_userdemographics` WRITE;
/*!40000 ALTER TABLE `demographics_userdemographics` DISABLE KEYS */;
/*!40000 ALTER TABLE `demographics_userdemographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discountpercentageconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_discountpercentageconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `percentage` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_d_site_id_f87020_idx` (`site_id`,`org`,`course_id`),
  KEY `discounts_d_site_id_9fe8d6_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `discounts_discountpe_changed_by_id_b00d7aa3_fk_auth_user` (`changed_by_id`),
  KEY `discounts_discountpe_course_id_19913d92_fk_course_ov` (`course_id`),
  KEY `discounts_discountpercentageconfig_org_294e22dd` (`org`),
  KEY `discounts_discountpercentageconfig_org_course_31d0939e` (`org_course`),
  CONSTRAINT `discounts_discountpe_changed_by_id_b00d7aa3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `discounts_discountpe_course_id_19913d92_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `discounts_discountpe_site_id_b103a2af_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discountpercentageconfig`
--

LOCK TABLES `discounts_discountpercentageconfig` WRITE;
/*!40000 ALTER TABLE `discounts_discountpercentageconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discountpercentageconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discountrestrictionconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_discountrestrictionconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_d_site_id_d67da3_idx` (`site_id`,`org`,`course_id`),
  KEY `discounts_d_site_id_f83727_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `discounts_discountre_changed_by_id_f18a5c1b_fk_auth_user` (`changed_by_id`),
  KEY `discounts_discountre_course_id_d7f6674b_fk_course_ov` (`course_id`),
  KEY `discounts_discountrestrictionconfig_org_010f786f` (`org`),
  KEY `discounts_discountrestrictionconfig_org_course_bb36b3cd` (`org_course`),
  CONSTRAINT `discounts_discountre_changed_by_id_f18a5c1b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `discounts_discountre_course_id_d7f6674b_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `discounts_discountre_site_id_3f4c1be6_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discountrestrictionconfig`
--

LOCK TABLES `discounts_discountrestrictionconfig` WRITE;
/*!40000 ALTER TABLE `discounts_discountrestrictionconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discountrestrictionconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_discussionsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_discussionsconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `context_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `plugin_configuration` longtext NOT NULL,
  `provider_type` varchar(100) NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  `enable_graded_units` tinyint(1) NOT NULL,
  `enable_in_context` tinyint(1) NOT NULL,
  `unit_level_visibility` tinyint(1) NOT NULL,
  PRIMARY KEY (`context_key`),
  KEY `discussions_discussi_lti_configuration_id_7088d266_fk_lti_consu` (`lti_configuration_id`),
  CONSTRAINT `discussions_discussi_lti_configuration_id_7088d266_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_discussionsconfiguration`
--

LOCK TABLES `discussions_discussionsconfiguration` WRITE;
/*!40000 ALTER TABLE `discussions_discussionsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_discussionsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_discussiontopiclink`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_discussiontopiclink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context_key` varchar(255) NOT NULL,
  `usage_key` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `provider_id` varchar(32) NOT NULL,
  `external_id` varchar(255) NOT NULL,
  `enabled_in_context` tinyint(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `context` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_discussi_group_id_2f8afa34_fk_course_gr` (`group_id`),
  KEY `discussions_discussiontopiclink_context_key_07c00652` (`context_key`),
  KEY `discussions_discussiontopiclink_usage_key_ea381cf9` (`usage_key`),
  KEY `discussions_discussiontopiclink_external_id_719d30fc` (`external_id`),
  CONSTRAINT `discussions_discussi_group_id_2f8afa34_fk_course_gr` FOREIGN KEY (`group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_discussiontopiclink`
--

LOCK TABLES `discussions_discussiontopiclink` WRITE;
/*!40000 ALTER TABLE `discussions_discussiontopiclink` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_discussiontopiclink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_historicaldiscussionsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_historicaldiscussionsconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `context_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `plugin_configuration` longtext NOT NULL,
  `provider_type` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  `enable_graded_units` tinyint(1) NOT NULL,
  `enable_in_context` tinyint(1) NOT NULL,
  `unit_level_visibility` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `discussions_historic_history_user_id_df7ddb62_fk_auth_user` (`history_user_id`),
  KEY `discussions_historicaldiscu_context_key_7c3bca39` (`context_key`),
  KEY `discussions_historicaldiscu_lti_configuration_id_a6693472` (`lti_configuration_id`),
  CONSTRAINT `discussions_historic_history_user_id_df7ddb62_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_historicaldiscussionsconfiguration`
--

LOCK TABLES `discussions_historicaldiscussionsconfiguration` WRITE;
/*!40000 ALTER TABLE `discussions_historicaldiscussionsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_historicaldiscussionsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_providerfilter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_providerfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `allow` varchar(63) NOT NULL,
  `deny` varchar(63) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_site_id_48e4b2_idx` (`site_id`,`org`,`course_id`),
  KEY `discussions_site_id_0f23d5_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `discussions_provider_changed_by_id_771ce4d3_fk_auth_user` (`changed_by_id`),
  KEY `discussions_provider_course_id_7b7d915c_fk_course_ov` (`course_id`),
  KEY `discussions_providerfilter_org_c5365456` (`org`),
  KEY `discussions_providerfilter_org_course_7b77bd87` (`org_course`),
  CONSTRAINT `discussions_provider_changed_by_id_771ce4d3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `discussions_provider_course_id_7b7d915c_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `discussions_providerfilter_site_id_9c77a203_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_providerfilter`
--

LOCK TABLES `discussions_providerfilter` WRITE;
/*!40000 ALTER TABLE `discussions_providerfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_providerfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
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
-- Table structure for table `django_celery_results_chordcounter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_chordcounter`
--

LOCK TABLES `django_celery_results_chordcounter` WRITE;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_groupresult`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_groupresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  KEY `django_cele_date_cr_bd6c1d_idx` (`date_created`),
  KEY `django_cele_date_do_caae0e_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_groupresult`
--

LOCK TABLES `django_celery_results_groupresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_groupresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_groupresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `periodic_task_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  KEY `django_cele_status_9b6201_idx` (`status`),
  KEY `django_cele_worker_d54dd8_idx` (`worker`),
  KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  KEY `django_cele_date_do_f59aad_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_permission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_permission` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission`
--

LOCK TABLES `django_comment_client_permission` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_client_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_permission_roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_permission_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_client_pe_permission_id_role_id_d3680ec3_uniq` (`permission_id`,`role_id`),
  KEY `django_comment_clien_role_id_d2cb08a2_fk_django_co` (`role_id`),
  CONSTRAINT `django_comment_clien_permission_id_f9f47fd2_fk_django_co` FOREIGN KEY (`permission_id`) REFERENCES `django_comment_client_permission` (`name`),
  CONSTRAINT `django_comment_clien_role_id_d2cb08a2_fk_django_co` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission_roles`
--

LOCK TABLES `django_comment_client_permission_roles` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_client_permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comment_client_role_course_id_08a9c1d1` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role`
--

LOCK TABLES `django_comment_client_role` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_client_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_role_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_client_role_users_role_id_user_id_93ab4289_uniq` (`role_id`,`user_id`),
  KEY `dcc_role_users_user_role_idx` (`user_id`,`role_id`),
  CONSTRAINT `django_comment_clien_role_id_baec77f6_fk_django_co` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`),
  CONSTRAINT `django_comment_clien_user_id_5d7991df_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role_users`
--

LOCK TABLES `django_comment_client_role_users` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_client_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_common_coursediscussionsettings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_common_coursediscussionsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `always_divide_inline_discussions` tinyint(1) NOT NULL,
  `divided_discussions` longtext,
  `division_scheme` varchar(20) NOT NULL,
  `discussions_id_map` longtext,
  `reported_content_email_notifications` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_coursediscussionsettings`
--

LOCK TABLES `django_comment_common_coursediscussionsettings` WRITE;
/*!40000 ALTER TABLE `django_comment_common_coursediscussionsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_common_coursediscussionsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_common_discussionsidmapping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_common_discussionsidmapping` (
  `course_id` varchar(255) NOT NULL,
  `mapping` longtext NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_discussionsidmapping`
--

LOCK TABLES `django_comment_common_discussionsidmapping` WRITE;
/*!40000 ALTER TABLE `django_comment_common_discussionsidmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_common_discussionsidmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_common_forumsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_common_forumsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `connection_timeout` double NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comment_commo_changed_by_id_9292e296_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `django_comment_commo_changed_by_id_9292e296_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_forumsconfig`
--

LOCK TABLES `django_comment_common_forumsconfig` WRITE;
/*!40000 ALTER TABLE `django_comment_common_forumsconfig` DISABLE KEYS */;
INSERT INTO `django_comment_common_forumsconfig` VALUES (1,'2023-02-21 13:29:10.049796',1,5,NULL);
/*!40000 ALTER TABLE `django_comment_common_forumsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (155,'admin','logentry'),(323,'agreements','integritysignature'),(406,'announcements','announcement'),(274,'api_admin','apiaccessconfig'),(1,'api_admin','apiaccessrequest'),(275,'api_admin','catalog'),(211,'assessment','assessment'),(212,'assessment','assessmentfeedback'),(213,'assessment','assessmentfeedbackoption'),(214,'assessment','assessmentpart'),(215,'assessment','criterion'),(216,'assessment','criterionoption'),(224,'assessment','historicalsharedfileupload'),(217,'assessment','peerworkflow'),(218,'assessment','peerworkflowitem'),(219,'assessment','rubric'),(225,'assessment','sharedfileupload'),(223,'assessment','staffworkflow'),(220,'assessment','studenttrainingworkflow'),(221,'assessment','studenttrainingworkflowitem'),(226,'assessment','teamstaffworkflow'),(222,'assessment','trainingexample'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(276,'badges','badgeassertion'),(277,'badges','badgeclass'),(278,'badges','coursecompleteimageconfiguration'),(279,'badges','courseeventbadgesconfiguration'),(396,'blackboard','blackboardenterprisecustomerconfiguration'),(398,'blackboard','blackboardglobalconfiguration'),(395,'blackboard','blackboardlearnerassessmentdatatransmissionaudit'),(394,'blackboard','blackboardlearnerdatatransmissionaudit'),(397,'blackboard','historicalblackboardenterprisecustomerconfiguration'),(246,'block_structure','blockstructureconfiguration'),(247,'block_structure','blockstructuremodel'),(407,'bookmarks','bookmark'),(408,'bookmarks','xblockcache'),(122,'branding','brandingapiconfig'),(123,'branding','brandinginfoconfig'),(117,'bulk_email','bulkemailflag'),(119,'bulk_email','cohorttarget'),(113,'bulk_email','courseauthorization'),(114,'bulk_email','courseemail'),(115,'bulk_email','courseemailtemplate'),(120,'bulk_email','coursemodetarget'),(121,'bulk_email','disabledcourse'),(116,'bulk_email','optout'),(118,'bulk_email','target'),(439,'bulk_grades','scoreoverrider'),(329,'bundles','bundle'),(330,'bundles','bundlelink'),(331,'bundles','bundleversion'),(332,'bundles','collection'),(333,'bundles','draft'),(288,'calendar_sync','historicalusercalendarsyncconfig'),(289,'calendar_sync','usercalendarsyncconfig'),(400,'canvas','canvasenterprisecustomerconfiguration'),(402,'canvas','canvaslearnerassessmentdatatransmissionaudit'),(401,'canvas','canvaslearnerdatatransmissionaudit'),(399,'canvas','historicalcanvasenterprisecustomerconfiguration'),(267,'catalog','catalogintegration'),(280,'celery_utils','failedtask'),(99,'certificates','certificateallowlist'),(102,'certificates','certificatedateoverride'),(98,'certificates','certificategenerationcommandconfiguration'),(86,'certificates','certificategenerationconfiguration'),(87,'certificates','certificategenerationcoursesetting'),(94,'certificates','certificategenerationhistory'),(88,'certificates','certificatehtmlviewconfiguration'),(95,'certificates','certificateinvalidation'),(89,'certificates','certificatetemplate'),(90,'certificates','certificatetemplateasset'),(91,'certificates','examplecertificate'),(92,'certificates','examplecertificateset'),(93,'certificates','generatedcertificate'),(100,'certificates','historicalcertificateallowlist'),(101,'certificates','historicalcertificatedateoverride'),(97,'certificates','historicalcertificateinvalidation'),(96,'certificates','historicalgeneratedcertificate'),(249,'commerce','commerceconfiguration'),(456,'completion','blockcompletion'),(370,'consent','datasharingconsent'),(372,'consent','datasharingconsenttextoverrides'),(371,'consent','historicaldatasharingconsent'),(20,'contentserver','cdnuseragentsconfig'),(19,'contentserver','courseassetcachettlconfig'),(471,'contentstore','backfillcoursetabsconfig'),(472,'contentstore','cleanstalecertificateavailabilitydatesconfig'),(470,'contentstore','courseoutlineregenerate'),(469,'contentstore','videouploadconfig'),(5,'contenttypes','contenttype'),(409,'content_libraries','contentlibrary'),(413,'content_libraries','contentlibraryblockimporttask'),(410,'content_libraries','contentlibrarypermission'),(412,'content_libraries','ltigradedresource'),(411,'content_libraries','ltiprofile'),(291,'content_type_gating','contenttypegatingconfig'),(391,'cornerstone','cornerstonecoursekey'),(387,'cornerstone','cornerstoneenterprisecustomerconfiguration'),(388,'cornerstone','cornerstoneglobalconfiguration'),(389,'cornerstone','cornerstonelearnerdatatransmissionaudit'),(390,'cornerstone','historicalcornerstoneenterprisecustomerconfiguration'),(248,'cors_csrf','xdomainproxyconfiguration'),(475,'coursegraph','coursegraphcoursedump'),(43,'courseware','coursedynamicupgradedeadlineconfiguration'),(44,'courseware','dynamicupgradedeadlineconfiguration'),(47,'courseware','financialassistanceconfiguration'),(46,'courseware','lastseencoursewaretimezone'),(35,'courseware','offlinecomputedgrade'),(36,'courseware','offlinecomputedgradelog'),(45,'courseware','orgdynamicupgradedeadlineconfiguration'),(37,'courseware','studentfieldoverride'),(38,'courseware','studentmodule'),(39,'courseware','studentmodulehistory'),(40,'courseware','xmodulestudentinfofield'),(41,'courseware','xmodulestudentprefsfield'),(42,'courseware','xmoduleuserstatesummaryfield'),(48,'coursewarehistoryextended','studentmodulehistoryextended'),(192,'course_action_state','coursererunstate'),(414,'course_apps','courseappstatus'),(415,'course_apps','historicalcourseappstatus'),(473,'course_creators','coursecreator'),(297,'course_date_signals','selfpacedrelativedatesconfig'),(290,'course_duration_limits','coursedurationlimitconfig'),(284,'course_goals','coursegoal'),(287,'course_goals','coursegoalreminderstatus'),(285,'course_goals','historicalcoursegoal'),(286,'course_goals','useractivity'),(107,'course_groups','cohortmembership'),(108,'course_groups','coursecohort'),(109,'course_groups','coursecohortssettings'),(110,'course_groups','courseusergroup'),(111,'course_groups','courseusergrouppartitiongroup'),(112,'course_groups','unregisteredlearnercohortassignments'),(124,'course_home_api','disableprogresspagestackedconfig'),(417,'course_live','courseliveconfiguration'),(416,'course_live','historicalcourseliveconfiguration'),(169,'course_modes','coursemode'),(171,'course_modes','coursemodeexpirationconfig'),(170,'course_modes','coursemodesarchive'),(172,'course_modes','historicalcoursemode'),(240,'course_overviews','courseoverview'),(243,'course_overviews','courseoverviewimageconfig'),(242,'course_overviews','courseoverviewimageset'),(241,'course_overviews','courseoverviewtab'),(244,'course_overviews','historicalcourseoverview'),(245,'course_overviews','simulatecoursepublishconfig'),(281,'crawlers','crawlersconfig'),(418,'credentials','credentialsapiconfig'),(419,'credentials','notifycredentialsconfig'),(256,'credit','creditconfig'),(250,'credit','creditcourse'),(251,'credit','crediteligibility'),(252,'credit','creditprovider'),(253,'credit','creditrequest'),(254,'credit','creditrequirement'),(255,'credit','creditrequirementstatus'),(183,'dark_lang','darklangconfig'),(377,'degreed','degreedenterprisecustomerconfiguration'),(378,'degreed','degreedglobalconfiguration'),(379,'degreed','degreedlearnerdatatransmissionaudit'),(380,'degreed','historicaldegreedenterprisecustomerconfiguration'),(383,'degreed2','degreed2enterprisecustomerconfiguration'),(381,'degreed2','degreed2learnerdatatransmissionaudit'),(382,'degreed2','historicaldegreed2enterprisecustomerconfiguration'),(303,'demographics','historicaluserdemographics'),(302,'demographics','userdemographics'),(293,'discounts','discountpercentageconfig'),(292,'discounts','discountrestrictionconfig'),(421,'discussions','discussionsconfiguration'),(423,'discussions','discussiontopiclink'),(420,'discussions','historicaldiscussionsconfiguration'),(422,'discussions','providerfilter'),(10,'django_celery_results','chordcounter'),(11,'django_celery_results','groupresult'),(9,'django_celery_results','taskresult'),(159,'django_comment_common','coursediscussionsettings'),(160,'django_comment_common','discussionsidmapping'),(158,'django_comment_common','forumsconfig'),(156,'django_comment_common','permission'),(157,'django_comment_common','role'),(151,'django_notify','notification'),(152,'django_notify','notificationtype'),(153,'django_notify','settings'),(154,'django_notify','subscription'),(235,'edxval','coursevideo'),(234,'edxval','encodedvideo'),(232,'edxval','profile'),(239,'edxval','thirdpartytranscriptcredentialsstate'),(237,'edxval','transcriptpreference'),(233,'edxval','video'),(236,'edxval','videoimage'),(238,'edxval','videotranscript'),(460,'edx_name_affirmation','historicalverifiedname'),(458,'edx_name_affirmation','verifiedname'),(459,'edx_name_affirmation','verifiednameconfig'),(450,'edx_proctoring','historicalproctoredexam'),(449,'edx_proctoring','historicalproctoredexamstudentattempt'),(440,'edx_proctoring','proctoredexam'),(441,'edx_proctoring','proctoredexamreviewpolicy'),(442,'edx_proctoring','proctoredexamreviewpolicyhistory'),(443,'edx_proctoring','proctoredexamsoftwaresecurecomment'),(444,'edx_proctoring','proctoredexamsoftwaresecurereview'),(445,'edx_proctoring','proctoredexamsoftwaresecurereviewhistory'),(446,'edx_proctoring','proctoredexamstudentallowance'),(447,'edx_proctoring','proctoredexamstudentallowancehistory'),(448,'edx_proctoring','proctoredexamstudentattempt'),(466,'edx_when','contentdate'),(467,'edx_when','datepolicy'),(468,'edx_when','userdate'),(185,'embargo','country'),(186,'embargo','countryaccessrule'),(187,'embargo','courseaccessrulehistory'),(188,'embargo','embargoedcourse'),(189,'embargo','embargoedstate'),(190,'embargo','ipfilter'),(191,'embargo','restrictedcourse'),(363,'enterprise','adminnotification'),(362,'enterprise','adminnotificationfilter'),(364,'enterprise','adminnotificationread'),(367,'enterprise','bulkcatalogqueryupdatecommandconfiguration'),(334,'enterprise','enrollmentnotificationemailtemplate'),(335,'enterprise','enterprisecatalogquery'),(343,'enterprise','enterprisecourseenrollment'),(336,'enterprise','enterprisecustomer'),(337,'enterprise','enterprisecustomerbrandingconfiguration'),(338,'enterprise','enterprisecustomercatalog'),(339,'enterprise','enterprisecustomeridentityprovider'),(369,'enterprise','enterprisecustomerinvitekey'),(340,'enterprise','enterprisecustomerreportingconfiguration'),(341,'enterprise','enterprisecustomertype'),(342,'enterprise','enterprisecustomeruser'),(344,'enterprise','enterpriseenrollmentsource'),(345,'enterprise','enterprisefeaturerole'),(346,'enterprise','enterprisefeatureuserroleassignment'),(347,'enterprise','historicalenrollmentnotificationemailtemplate'),(348,'enterprise','historicalenterprisecourseenrollment'),(349,'enterprise','historicalenterprisecustomer'),(350,'enterprise','historicalenterprisecustomercatalog'),(368,'enterprise','historicalenterprisecustomerinvitekey'),(366,'enterprise','historicalenterprisecustomeruser'),(358,'enterprise','historicallicensedenterprisecourseenrollment'),(351,'enterprise','historicalpendingenrollment'),(359,'enterprise','historicalpendingenterprisecustomeradminuser'),(352,'enterprise','historicalpendingenterprisecustomeruser'),(365,'enterprise','historicalsystemwideenterpriseuserroleassignment'),(357,'enterprise','licensedenterprisecourseenrollment'),(353,'enterprise','pendingenrollment'),(360,'enterprise','pendingenterprisecustomeradminuser'),(354,'enterprise','pendingenterprisecustomeruser'),(355,'enterprise','systemwideenterpriserole'),(356,'enterprise','systemwideenterpriseuserroleassignment'),(361,'enterprise','updateroleassignmentswithcustomersconfig'),(173,'entitlements','courseentitlement'),(174,'entitlements','courseentitlementpolicy'),(175,'entitlements','courseentitlementsupportdetail'),(176,'entitlements','historicalcourseentitlement'),(177,'entitlements','historicalcourseentitlementsupportdetail'),(294,'experiments','experimentdata'),(295,'experiments','experimentkeyvalue'),(296,'experiments','historicalexperimentkeyvalue'),(298,'external_user_ids','externalid'),(299,'external_user_ids','externalidtype'),(300,'external_user_ids','historicalexternalid'),(301,'external_user_ids','historicalexternalidtype'),(427,'grades','computegradessetting'),(429,'grades','historicalpersistentsubsectiongradeoverride'),(426,'grades','persistentcoursegrade'),(424,'grades','persistentsubsectiongrade'),(428,'grades','persistentsubsectiongradeoverride'),(425,'grades','visibleblocks'),(104,'instructor_task','gradereportsetting'),(106,'instructor_task','historicalinstructortaskschedule'),(103,'instructor_task','instructortask'),(105,'instructor_task','instructortaskschedule'),(376,'integrated_channel','apiresponserecord'),(373,'integrated_channel','contentmetadataitemtransmission'),(375,'integrated_channel','genericenterprisecustomerpluginconfiguration'),(374,'integrated_channel','genericlearnerdatatransmissionaudit'),(436,'learner_pathway_progress','historicallearnerpathwayprogress'),(438,'learner_pathway_progress','learnerenterprisepathwaymembership'),(437,'learner_pathway_progress','learnerpathwayprogress'),(315,'learning_sequences','contenterror'),(312,'learning_sequences','coursecontext'),(308,'learning_sequences','coursesection'),(309,'learning_sequences','coursesectionsequence'),(313,'learning_sequences','coursesequenceexam'),(310,'learning_sequences','learningcontext'),(311,'learning_sequences','learningsequence'),(314,'learning_sequences','publishreport'),(318,'learning_sequences','sectionpartitiongroup'),(317,'learning_sequences','sectionsequencepartitiongroup'),(316,'learning_sequences','userpartitiongroup'),(204,'lms_xblock','xblockasidesconfig'),(326,'lti1p3_tool_config','ltitool'),(325,'lti1p3_tool_config','ltitoolkey'),(455,'lti_consumer','courseallowpiisharinginltiflag'),(452,'lti_consumer','ltiagslineitem'),(453,'lti_consumer','ltiagsscore'),(451,'lti_consumer','lticonfiguration'),(454,'lti_consumer','ltidlcontentitem'),(269,'milestones','coursecontentmilestone'),(270,'milestones','coursemilestone'),(271,'milestones','milestone'),(272,'milestones','milestonerelationshiptype'),(273,'milestones','usermilestone'),(194,'mobile_api','appversionconfig'),(195,'mobile_api','ignoremobileavailableflagconfig'),(193,'mobile_api','mobileapiconfig'),(196,'mobile_api','mobileconfig'),(404,'moodle','historicalmoodleenterprisecustomerconfiguration'),(403,'moodle','moodleenterprisecustomerconfiguration'),(405,'moodle','moodlelearnerdatatransmissionaudit'),(129,'oauth2_provider','accesstoken'),(128,'oauth2_provider','application'),(130,'oauth2_provider','grant'),(131,'oauth2_provider','refreshtoken'),(133,'oauth_dispatch','applicationaccess'),(134,'oauth_dispatch','applicationorganization'),(132,'oauth_dispatch','restrictedapplication'),(321,'organizations','historicalorganization'),(322,'organizations','historicalorganizationcourse'),(319,'organizations','organization'),(320,'organizations','organizationcourse'),(465,'outcome_surveys','coursegoal'),(464,'outcome_surveys','coursereflection'),(461,'outcome_surveys','learnercourseevent'),(462,'outcome_surveys','multichoiceresponse'),(463,'outcome_surveys','surveyexport'),(266,'programs','historicalprogramdiscussionsconfiguration'),(265,'programs','historicalprogramliveconfiguration'),(264,'programs','programdiscussionsconfiguration'),(263,'programs','programliveconfiguration'),(262,'programs','programsapiconfig'),(434,'program_enrollments','courseaccessroleassignment'),(432,'program_enrollments','historicalprogramcourseenrollment'),(430,'program_enrollments','historicalprogramenrollment'),(433,'program_enrollments','programcourseenrollment'),(431,'program_enrollments','programenrollment'),(6,'redirects','redirect'),(184,'rss_proxy','whitelistedrssurl'),(385,'sap_success_factors','sapsuccessfactorsenterprisecustomerconfiguration'),(384,'sap_success_factors','sapsuccessfactorsglobalconfiguration'),(386,'sap_success_factors','sapsuccessfactorslearnerdatatransmissionaudit'),(328,'save_for_later','savedcourse'),(327,'save_for_later','savedprogram'),(307,'schedules','historicalschedule'),(304,'schedules','schedule'),(305,'schedules','scheduleconfig'),(306,'schedules','scheduleexperience'),(7,'sessions','session'),(8,'sites','site'),(21,'site_configuration','siteconfiguration'),(22,'site_configuration','siteconfigurationhistory'),(197,'social_django','association'),(198,'social_django','code'),(199,'social_django','nonce'),(201,'social_django','partial'),(200,'social_django','usersocialauth'),(161,'splash','splashconfig'),(84,'split_modulestore_django','historicalsplitmodulestorecourseindex'),(83,'split_modulestore_django','splitmodulestorecourseindex'),(227,'staffgrader','submissiongradinglock'),(17,'static_replace','assetbaseurlconfig'),(18,'static_replace','assetexcludedextensionsconfig'),(15,'status','coursemessage'),(16,'status','globalstatusmessage'),(71,'student','accountrecovery'),(78,'student','accountrecoveryconfiguration'),(76,'student','allowedauthuser'),(49,'student','anonymoususerid'),(80,'student','bulkchangeenrollmentconfiguration'),(74,'student','bulkunenrollconfiguration'),(50,'student','courseaccessrole'),(51,'student','courseenrollment'),(52,'student','courseenrollmentallowed'),(53,'student','courseenrollmentattribute'),(79,'student','courseenrollmentcelebration'),(54,'student','dashboardconfiguration'),(55,'student','enrollmentrefundconfiguration'),(56,'student','entranceexamconfiguration'),(75,'student','fbeenrollmentexclusion'),(73,'student','historicalcourseenrollment'),(77,'student','historicalmanualenrollmentaudit'),(57,'student','languageproficiency'),(58,'student','linkedinaddtoprofileconfiguration'),(59,'student','loginfailures'),(60,'student','manualenrollmentaudit'),(61,'student','pendingemailchange'),(62,'student','pendingnamechange'),(72,'student','pendingsecondaryemailchange'),(63,'student','registration'),(69,'student','registrationcookieconfiguration'),(70,'student','sociallink'),(68,'student','userattribute'),(82,'student','usercelebration'),(81,'student','userpasswordtogglehistory'),(64,'student','userprofile'),(65,'student','usersignupsource'),(66,'student','userstanding'),(67,'student','usertestgroup'),(205,'submissions','score'),(209,'submissions','scoreannotation'),(208,'submissions','scoresummary'),(206,'submissions','studentitem'),(207,'submissions','submission'),(210,'submissions','teamsubmission'),(457,'super_csv','csvoperation'),(127,'support','historicalusersocialauth'),(202,'survey','surveyanswer'),(203,'survey','surveyform'),(324,'survey_report','surveyreport'),(140,'system_wide_roles','systemwiderole'),(141,'system_wide_roles','systemwideroleassignment'),(476,'tagging','tagavailablevalues'),(477,'tagging','tagcategories'),(257,'teams','courseteam'),(258,'teams','courseteammembership'),(435,'theming','sitetheme'),(138,'third_party_auth','ltiproviderconfig'),(137,'third_party_auth','oauth2providerconfig'),(136,'third_party_auth','samlconfiguration'),(139,'third_party_auth','samlproviderconfig'),(135,'third_party_auth','samlproviderdata'),(268,'thumbnail','kvstore'),(165,'user_api','retirementstate'),(162,'user_api','usercoursetag'),(163,'user_api','userorgtag'),(164,'user_api','userpreference'),(168,'user_api','userretirementpartnerreportingstatus'),(167,'user_api','userretirementrequest'),(166,'user_api','userretirementstatus'),(478,'user_tasks','usertaskartifact'),(479,'user_tasks','usertaskstatus'),(126,'user_tours','userdiscussionstours'),(125,'user_tours','usertour'),(85,'util','ratelimitconfiguration'),(181,'verify_student','manualverification'),(178,'verify_student','softwaresecurephotoverification'),(180,'verify_student','ssoverification'),(182,'verify_student','sspverificationretryconfig'),(179,'verify_student','verificationdeadline'),(23,'video_config','coursehlsplaybackenabledflag'),(25,'video_config','coursevideotranscriptenabledflag'),(31,'video_config','courseyoutubeblockedflag'),(24,'video_config','hlsplaybackenabledflag'),(28,'video_config','migrationenqueuedcourse'),(27,'video_config','transcriptmigrationsetting'),(29,'video_config','updatedcoursevideos'),(30,'video_config','videothumbnailsetting'),(26,'video_config','videotranscriptenabledflag'),(32,'video_pipeline','coursevideouploadsenabledbydefault'),(34,'video_pipeline','vempipelineintegration'),(33,'video_pipeline','videouploadsenabledbydefault'),(12,'waffle','flag'),(13,'waffle','sample'),(14,'waffle','switch'),(282,'waffle_utils','waffleflagcourseoverridemodel'),(283,'waffle_utils','waffleflagorgoverridemodel'),(142,'wiki','article'),(143,'wiki','articleforobject'),(144,'wiki','articleplugin'),(145,'wiki','articlerevision'),(146,'wiki','reusableplugin'),(147,'wiki','revisionplugin'),(148,'wiki','revisionpluginrevision'),(149,'wiki','simpleplugin'),(150,'wiki','urlpath'),(228,'workflow','assessmentworkflow'),(229,'workflow','assessmentworkflowcancellation'),(230,'workflow','assessmentworkflowstep'),(231,'workflow','teamassessmentworkflow'),(393,'xapi','xapilearnerdatatransmissionaudit'),(392,'xapi','xapilrsconfiguration'),(474,'xblock_config','studioconfig'),(259,'xblock_django','xblockconfiguration'),(260,'xblock_django','xblockstudioconfiguration'),(261,'xblock_django','xblockstudioconfigurationflag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-21 13:25:56.515519'),(2,'auth','0001_initial','2023-02-21 13:25:56.917190'),(3,'admin','0001_initial','2023-02-21 13:25:57.088156'),(4,'admin','0002_logentry_remove_auto_add','2023-02-21 13:25:57.116676'),(5,'admin','0003_logentry_add_action_flag_choices','2023-02-21 13:25:57.144684'),(6,'agreements','0001_initial','2023-02-21 13:25:57.233093'),(7,'announcements','0001_initial','2023-02-21 13:25:57.254680'),(8,'sites','0001_initial','2023-02-21 13:25:57.252974'),(9,'contenttypes','0002_remove_content_type_name','2023-02-21 13:25:57.329155'),(10,'api_admin','0001_initial','2023-02-21 13:25:57.526850'),(11,'api_admin','0002_auto_20160325_1604','2023-02-21 13:25:57.592562'),(12,'api_admin','0003_auto_20160404_1618','2023-02-21 13:25:57.907332'),(13,'api_admin','0004_auto_20160412_1506','2023-02-21 13:25:58.087213'),(14,'api_admin','0005_auto_20160414_1232','2023-02-21 13:25:58.105684'),(15,'api_admin','0006_catalog','2023-02-21 13:25:58.112898'),(16,'api_admin','0007_delete_historical_api_records','2023-02-21 13:25:58.279264'),(17,'assessment','0001_initial','2023-02-21 13:25:59.321882'),(18,'assessment','0002_staffworkflow','2023-02-21 13:25:59.439420'),(19,'assessment','0003_expand_course_id','2023-02-21 13:25:59.564211'),(20,'assessment','0004_historicalsharedfileupload_sharedfileupload','2023-02-21 13:25:59.767874'),(21,'assessment','0005_add_filename_to_sharedupload','2023-02-21 13:25:59.863571'),(22,'assessment','0006_TeamWorkflows','2023-02-21 13:25:59.910984'),(23,'assessment','0007_staff_workflow_blank','2023-02-21 13:25:59.939215'),(24,'auth','0002_alter_permission_name_max_length','2023-02-21 13:25:59.987705'),(25,'auth','0003_alter_user_email_max_length','2023-02-21 13:26:00.037137'),(26,'auth','0004_alter_user_username_opts','2023-02-21 13:26:00.054875'),(27,'auth','0005_alter_user_last_login_null','2023-02-21 13:26:00.095664'),(28,'auth','0006_require_contenttypes_0002','2023-02-21 13:26:00.098374'),(29,'auth','0007_alter_validators_add_error_messages','2023-02-21 13:26:00.117388'),(30,'auth','0008_alter_user_username_max_length','2023-02-21 13:26:00.160763'),(31,'auth','0009_alter_user_last_name_max_length','2023-02-21 13:26:00.199667'),(32,'auth','0010_alter_group_name_max_length','2023-02-21 13:26:00.252906'),(33,'auth','0011_update_proxy_permissions','2023-02-21 13:26:00.288350'),(34,'auth','0012_alter_user_first_name_max_length','2023-02-21 13:26:00.332967'),(35,'instructor_task','0001_initial','2023-02-21 13:26:00.434359'),(36,'certificates','0001_initial','2023-02-21 13:26:01.015197'),(37,'certificates','0002_data__certificatehtmlviewconfiguration_data','2023-02-21 13:26:01.075768'),(38,'certificates','0003_data__default_modes','2023-02-21 13:26:01.146237'),(39,'certificates','0004_certificategenerationhistory','2023-02-21 13:26:01.249994'),(40,'certificates','0005_auto_20151208_0801','2023-02-21 13:26:01.288635'),(41,'certificates','0006_certificatetemplateasset_asset_slug','2023-02-21 13:26:01.320236'),(42,'certificates','0007_certificateinvalidation','2023-02-21 13:26:01.428182'),(43,'badges','0001_initial','2023-02-21 13:26:01.901081'),(44,'badges','0002_data__migrate_assertions','2023-02-21 13:26:01.961444'),(45,'badges','0003_schema__add_event_configuration','2023-02-21 13:26:02.043811'),(46,'badges','0004_badgeclass_badgr_server_slug','2023-02-21 13:26:02.093753'),(47,'waffle','0001_initial','2023-02-21 13:26:02.376088'),(48,'sites','0002_alter_domain_unique','2023-02-21 13:26:02.400242'),(49,'enterprise','0001_squashed_0092_auto_20200312_1650','2023-02-21 13:26:05.990195'),(50,'enterprise','0093_add_use_enterprise_catalog_flag','2023-02-21 13:26:06.128096'),(51,'enterprise','0094_add_use_enterprise_catalog_sample','2023-02-21 13:26:06.363282'),(52,'integrated_channel','0001_squashed_0007_auto_20190925_0730','2023-02-21 13:26:06.816522'),(53,'integrated_channel','0002_learnerdatatransmissionaudit_subsection_id','2023-02-21 13:26:06.844445'),(54,'integrated_channel','0003_contentmetadataitemtransmission_content_last_changed','2023-02-21 13:26:06.903132'),(55,'integrated_channel','0004_contentmetadataitemtransmission_enterprise_customer_catalog_uuid','2023-02-21 13:26:06.960962'),(56,'integrated_channel','0005_auto_20211005_1052','2023-02-21 13:26:07.003333'),(57,'integrated_channel','0006_contentmetadataitemtransmission_deleted_at','2023-02-21 13:26:07.062420'),(58,'integrated_channel','0007_delete_learnerdatatransmissionaudit','2023-02-21 13:26:07.075731'),(59,'integrated_channel','0008_genericlearnerdatatransmissionaudit','2023-02-21 13:26:07.112935'),(60,'integrated_channel','0009_auto_20220325_1757','2023-02-21 13:26:07.196652'),(61,'enterprise','0095_auto_20200507_1138','2023-02-21 13:26:07.389074'),(62,'enterprise','0096_enterprise_catalog_admin_role','2023-02-21 13:26:07.507528'),(63,'enterprise','0097_auto_20200619_1130','2023-02-21 13:26:07.745764'),(64,'enterprise','0098_auto_20200629_1756','2023-02-21 13:26:07.925725'),(65,'enterprise','0099_auto_20200702_1537','2023-02-21 13:26:08.101620'),(66,'enterprise','0100_add_licensed_enterprise_course_enrollment','2023-02-21 13:26:08.445488'),(67,'enterprise','0101_move_data_to_saved_for_later','2023-02-21 13:26:08.625974'),(68,'enterprise','0102_auto_20200708_1615','2023-02-21 13:26:08.872572'),(69,'enterprise','0103_remove_marked_done','2023-02-21 13:26:09.046375'),(70,'enterprise','0104_sync_query_field','2023-02-21 13:26:09.268357'),(71,'enterprise','0105_add_branding_config_color_fields','2023-02-21 13:26:09.441852'),(72,'enterprise','0106_move_branding_config_colors','2023-02-21 13:26:09.549711'),(73,'enterprise','0107_remove_branding_config_banner_fields','2023-02-21 13:26:09.659715'),(74,'enterprise','0108_add_licensed_enrollment_is_revoked','2023-02-21 13:26:09.777200'),(75,'enterprise','0109_remove_use_enterprise_catalog_sample','2023-02-21 13:26:09.888001'),(76,'enterprise','0110_add_default_contract_discount','2023-02-21 13:26:10.081410'),(77,'enterprise','0111_pendingenterprisecustomeradminuser','2023-02-21 13:26:10.355117'),(78,'enterprise','0112_auto_20200914_0926','2023-02-21 13:26:10.531518'),(79,'enterprise','0113_auto_20200914_2054','2023-02-21 13:26:11.037320'),(80,'enterprise','0114_auto_20201020_0142','2023-02-21 13:26:11.247946'),(81,'enterprise','0115_enterpriseanalyticsuser_historicalenterpriseanalyticsuser','2023-02-21 13:26:11.502309'),(82,'enterprise','0116_auto_20201116_0400','2023-02-21 13:26:11.541124'),(83,'enterprise','0116_auto_20201208_1759','2023-02-21 13:26:11.723927'),(84,'enterprise','0117_auto_20201215_0258','2023-02-21 13:26:11.850833'),(85,'enterprise','unique_constraints_pending_users','2023-02-21 13:26:12.340525'),(86,'enterprise','0001_auto_20210111_1253','2023-02-21 13:26:12.514222'),(87,'enterprise','0120_systemwiderole_applies_to_all_contexts','2023-02-21 13:26:12.669213'),(88,'enterprise','0121_systemwiderole_add_ent_cust_field','2023-02-21 13:26:12.785496'),(89,'enterprise','0122_remove_field_sync_enterprise_catalog_query','2023-02-21 13:26:12.951690'),(90,'enterprise','0123_enterprisecustomeridentityprovider_default_provider','2023-02-21 13:26:13.016656'),(91,'enterprise','0124_auto_20210301_1309','2023-02-21 13:26:13.169012'),(92,'enterprise','0125_add_config_for_role_assign_backfill','2023-02-21 13:26:13.334801'),(93,'enterprise','0126_auto_20210308_1522','2023-02-21 13:26:13.557838'),(94,'enterprise','0127_enterprisecatalogquery_uuid','2023-02-21 13:26:13.610668'),(95,'enterprise','0128_enterprisecatalogquery_generate_uuids','2023-02-21 13:26:13.727939'),(96,'enterprise','0129_enterprisecatalogquery_uuid_unique','2023-02-21 13:26:13.775978'),(97,'enterprise','0130_lms_customer_lp_search_help_text','2023-02-21 13:26:13.908065'),(98,'enterprise','0131_auto_20210517_0924','2023-02-21 13:26:14.103147'),(99,'enterprise','0132_auto_20210608_1921','2023-02-21 13:26:14.701649'),(100,'enterprise','0133_auto_20210608_1931','2023-02-21 13:26:14.826785'),(101,'enterprise','0134_enterprisecustomerreportingconfiguration_enable_compression','2023-02-21 13:26:14.891942'),(102,'enterprise','0135_adminnotification_adminnotificationfilter_adminnotificationread','2023-02-21 13:26:15.169981'),(103,'enterprise','0136_auto_20210629_2129','2023-02-21 13:26:15.587773'),(104,'enterprise','0137_enrollment_email_update','2023-02-21 13:26:15.734531'),(105,'enterprise','0138_bulkcatalogqueryupdatecommandconfiguration','2023-02-21 13:26:15.905546'),(106,'enterprise','0139_auto_20210803_1854','2023-02-21 13:26:15.962103'),(107,'enterprise','0140_update_enrollment_sources','2023-02-21 13:26:16.087113'),(108,'enterprise','0141_make_enterprisecatalogquery_title_unique','2023-02-21 13:26:16.246216'),(109,'enterprise','0142_auto_20210907_2059','2023-02-21 13:26:16.294887'),(110,'enterprise','0143_auto_20210908_0559','2023-02-21 13:26:16.657715'),(111,'enterprise','0144_auto_20211011_1030','2023-02-21 13:26:16.678647'),(112,'enterprise','0145_auto_20211013_1018','2023-02-21 13:26:16.877501'),(113,'enterprise','0146_enterprise_customer_invite_key','2023-02-21 13:26:17.816780'),(114,'enterprise','0147_auto_20211129_1949','2023-02-21 13:26:18.019623'),(115,'enterprise','0148_auto_20211129_2114','2023-02-21 13:26:18.223580'),(116,'enterprise','0149_invite_key_required_default_expiry_backfill','2023-02-21 13:26:18.356873'),(117,'enterprise','0150_invite_key_expiry_required','2023-02-21 13:26:18.574343'),(118,'enterprise','0151_add_is_active_to_invite_key','2023-02-21 13:26:18.795636'),(119,'enterprise','0152_add_should_inactivate_other_customers','2023-02-21 13:26:18.996586'),(120,'enterprise','0153_add_enable_browse_and_request','2023-02-21 13:26:19.264691'),(121,'integrated_channel','0010_genericenterprisecustomerpluginconfiguration','2023-02-21 13:26:19.422661'),(122,'integrated_channel','0011_contentmetadataitemtransmission_plugin_configuration_id','2023-02-21 13:26:19.487746'),(123,'integrated_channel','0012_alter_contentmetadataitemtransmission_unique_together','2023-02-21 13:26:19.555083'),(124,'integrated_channel','0013_auto_20220405_2311','2023-02-21 13:26:19.626636'),(125,'integrated_channel','0014_genericenterprisecustomerpluginconfiguration_dry_run_mode_enabled','2023-02-21 13:26:19.696612'),(126,'integrated_channel','0015_auto_20220718_2113','2023-02-21 13:26:20.042364'),(127,'integrated_channel','0016_contentmetadataitemtransmission_content_title','2023-02-21 13:26:20.108112'),(128,'integrated_channel','0017_contentmetadataitemtransmission_friendly_status_message','2023-02-21 13:26:20.179863'),(129,'integrated_channel','0018_genericlearnerdatatransmissionaudit_friendly_status_message','2023-02-21 13:26:20.215341'),(130,'integrated_channel','0016_contentmetadataitemtransmission_marked_for','2023-02-21 13:26:20.284318'),(131,'integrated_channel','0019_merge_20220928_1842','2023-02-21 13:26:20.288055'),(132,'integrated_channel','0020_auto_20220929_1712','2023-02-21 13:26:20.574496'),(133,'integrated_channel','0021_remove_contentmetadataitemtransmission_api_response_body','2023-02-21 13:26:20.644017'),(134,'blackboard','0001_initial','2023-02-21 13:26:23.204837'),(135,'blackboard','0002_auto_20200930_1723','2023-02-21 13:26:23.208163'),(136,'blackboard','0003_blackboardlearnerdatatransmissionaudit','2023-02-21 13:26:23.211386'),(137,'blackboard','0004_blackboard_tx_chunk_size_default_1','2023-02-21 13:26:23.215405'),(138,'blackboard','0005_blackboardlearnerassessmentdatatransmissionaudit','2023-02-21 13:26:23.218942'),(139,'blackboard','0006_auto_20210708_1446','2023-02-21 13:26:23.223978'),(140,'blackboard','0007_auto_20210909_1536','2023-02-21 13:26:23.227628'),(141,'blackboard','0008_auto_20210923_1727','2023-02-21 13:26:23.231094'),(142,'blackboard','0009_alter_blackboardenterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:26:23.236111'),(143,'blackboard','0010_auto_20211221_1532','2023-02-21 13:26:23.239549'),(144,'blackboard','0011_auto_20220126_1837','2023-02-21 13:26:23.243109'),(145,'blackboard','0012_auto_20220131_1539','2023-02-21 13:26:23.247077'),(146,'blackboard','0013_blacboardglobalconfiguration','2023-02-21 13:26:23.250527'),(147,'blackboard','0014_alter_blackboardlearnerassessmentdatatransmissionaudit_enterprise_course_enrollment_id','2023-02-21 13:26:23.254047'),(148,'blackboard','0002_auto_20220302_2231','2023-02-21 13:26:23.502542'),(149,'blackboard','0003_alter_blackboardlearnerdatatransmissionaudit_completed_timestamp','2023-02-21 13:26:23.545414'),(150,'blackboard','0004_auto_20220324_1550','2023-02-21 13:26:23.946330'),(151,'blackboard','0005_auto_20220325_1757','2023-02-21 13:26:24.099605'),(152,'blackboard','0006_auto_20220405_2311','2023-02-21 13:26:24.646943'),(153,'blackboard','0007_auto_20220523_1625','2023-02-21 13:26:24.858351'),(154,'blackboard','0008_auto_20220913_2018','2023-02-21 13:26:24.931789'),(155,'blackboard','0009_auto_20220929_1720','2023-02-21 13:26:25.485409'),(156,'blackboard','0010_auto_20221021_0159','2023-02-21 13:26:25.716239'),(157,'blackboard','0011_auto_20221031_1855','2023-02-21 13:26:25.899829'),(158,'blackboard','0012_move_and_recrete_completed_timestamp','2023-02-21 13:26:25.957062'),(159,'blackboard','0013_alter_blackboardlearnerdatatransmissionaudit_index_together','2023-02-21 13:26:25.991023'),(160,'blackboard','0014_auto_20230105_2122','2023-02-21 13:26:27.264925'),(161,'blackboard','0015_auto_20230112_2002','2023-02-21 13:26:27.487469'),(162,'block_structure','0001_config','2023-02-21 13:26:27.678185'),(163,'block_structure','0002_blockstructuremodel','2023-02-21 13:26:27.710139'),(164,'block_structure','0003_blockstructuremodel_storage','2023-02-21 13:26:27.722227'),(165,'block_structure','0004_blockstructuremodel_usagekeywithrun','2023-02-21 13:26:27.736831'),(166,'block_structure','0005_trim_leading_slashes_in_data_path','2023-02-21 13:26:27.750471'),(167,'bookmarks','0001_initial','2023-02-21 13:26:28.208067'),(168,'branding','0001_initial','2023-02-21 13:26:28.879779'),(169,'course_modes','0001_initial','2023-02-21 13:26:28.973901'),(170,'course_modes','0002_coursemode_expiration_datetime_is_explicit','2023-02-21 13:26:29.022463'),(171,'course_modes','0003_auto_20151113_1443','2023-02-21 13:26:29.039712'),(172,'course_modes','0004_auto_20151113_1457','2023-02-21 13:26:29.296707'),(173,'course_modes','0005_auto_20151217_0958','2023-02-21 13:26:29.316997'),(174,'course_modes','0006_auto_20160208_1407','2023-02-21 13:26:29.404926'),(175,'course_modes','0007_coursemode_bulk_sku','2023-02-21 13:26:29.440595'),(176,'course_groups','0001_initial','2023-02-21 13:26:30.518311'),(177,'bulk_email','0001_initial','2023-02-21 13:26:31.004841'),(178,'bulk_email','0002_data__load_course_email_template','2023-02-21 13:26:31.234861'),(179,'bulk_email','0003_config_model_feature_flag','2023-02-21 13:26:31.688788'),(180,'bulk_email','0004_add_email_targets','2023-02-21 13:26:32.265621'),(181,'bulk_email','0005_move_target_data','2023-02-21 13:26:32.425499'),(182,'bulk_email','0006_course_mode_targets','2023-02-21 13:26:32.762154'),(183,'bulk_email','0007_disabledcourse','2023-02-21 13:26:32.788004'),(184,'courseware','0001_initial','2023-02-21 13:26:35.305727'),(185,'bulk_grades','0001_initial','2023-02-21 13:26:35.577748'),(186,'bulk_grades','0002_auto_20190703_1526','2023-02-21 13:26:35.758899'),(187,'bundles','0001_initial','2023-02-21 13:26:35.983931'),(188,'bundles','0002_create_drafts','2023-02-21 13:26:36.068981'),(189,'bundles','0003_update_character_set','2023-02-21 13:26:36.349430'),(190,'calendar_sync','0001_initial','2023-02-21 13:26:36.887529'),(191,'calendar_sync','0002_auto_20200709_1743','2023-02-21 13:26:37.169366'),(192,'canvas','0001_initial','2023-02-21 13:26:37.728621'),(193,'canvas','0002_auto_20200806_1632','2023-02-21 13:26:38.245883'),(194,'canvas','0003_delete_canvasglobalconfiguration','2023-02-21 13:26:38.263663'),(195,'canvas','0004_adding_learner_data_to_canvas','2023-02-21 13:26:38.302307'),(196,'canvas','0005_auto_20200909_1534','2023-02-21 13:26:38.326895'),(197,'canvas','0006_canvaslearnerassessmentdatatransmissionaudit','2023-02-21 13:26:38.380243'),(198,'canvas','0007_auto_20210222_2225','2023-02-21 13:26:38.616248'),(199,'canvas','0008_auto_20210707_0815','2023-02-21 13:26:38.792669'),(200,'canvas','0009_auto_20210708_1639','2023-02-21 13:26:38.975343'),(201,'canvas','0010_auto_20210909_1536','2023-02-21 13:26:39.312376'),(202,'canvas','0011_auto_20210923_1727','2023-02-21 13:26:39.560092'),(203,'canvas','0012_alter_canvasenterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:26:39.788306'),(204,'canvas','0013_auto_20211221_1535','2023-02-21 13:26:40.435534'),(205,'canvas','0014_auto_20220126_1837','2023-02-21 13:26:42.042883'),(206,'canvas','0015_auto_20220127_1605','2023-02-21 13:26:42.219199'),(207,'canvas','0016_auto_20220131_1539','2023-02-21 13:26:42.438659'),(208,'canvas','0017_auto_20220302_2231','2023-02-21 13:26:42.680176'),(209,'canvas','0018_alter_canvaslearnerdatatransmissionaudit_completed_timestamp','2023-02-21 13:26:42.712927'),(210,'canvas','0019_auto_20220324_1550','2023-02-21 13:26:42.995018'),(211,'canvas','0020_auto_20220325_1757','2023-02-21 13:26:43.069474'),(212,'canvas','0021_auto_20220405_2311','2023-02-21 13:26:43.689632'),(213,'canvas','0022_auto_20220523_1625','2023-02-21 13:26:43.963380'),(214,'canvas','0023_auto_20220913_2018','2023-02-21 13:26:44.037178'),(215,'canvas','0024_auto_20220929_1720','2023-02-21 13:26:44.714169'),(216,'canvas','0025_auto_20221021_0159','2023-02-21 13:26:45.085198'),(217,'canvas','0026_auto_20221031_1855','2023-02-21 13:26:45.338767'),(218,'canvas','0027_move_and_recrete_completed_timestamp','2023-02-21 13:26:45.413982'),(219,'canvas','0028_alter_canvaslearnerdatatransmissionaudit_index_together','2023-02-21 13:26:45.453826'),(220,'canvas','0029_auto_20230105_2122','2023-02-21 13:26:46.789463'),(221,'canvas','0030_auto_20230112_2002','2023-02-21 13:26:47.005991'),(222,'catalog','0001_initial','2023-02-21 13:26:47.203199'),(223,'catalog','0002_catalogintegration_username','2023-02-21 13:26:47.631672'),(224,'catalog','0003_catalogintegration_page_size','2023-02-21 13:26:47.746873'),(225,'catalog','0004_auto_20170616_0618','2023-02-21 13:26:47.838797'),(226,'catalog','0005_catalogintegration_long_term_cache_ttl','2023-02-21 13:26:47.954221'),(227,'celery_utils','0001_initial','2023-02-21 13:26:48.020078'),(228,'celery_utils','0002_chordable_django_backend','2023-02-21 13:26:48.024744'),(229,'certificates','0008_schema__remove_badges','2023-02-21 13:26:48.331017'),(230,'certificates','0009_certificategenerationcoursesetting_language_self_generation','2023-02-21 13:26:48.611809'),(231,'certificates','0010_certificatetemplate_language','2023-02-21 13:26:48.652984'),(232,'certificates','0011_certificatetemplate_alter_unique','2023-02-21 13:26:48.881912'),(233,'certificates','0012_certificategenerationcoursesetting_include_hours_of_effort','2023-02-21 13:26:48.918509'),(234,'certificates','0013_remove_certificategenerationcoursesetting_enabled','2023-02-21 13:26:48.954461'),(235,'certificates','0014_change_eligible_certs_manager','2023-02-21 13:26:49.045462'),(236,'certificates','0015_add_masters_choice','2023-02-21 13:26:49.150093'),(237,'certificates','0016_historicalgeneratedcertificate','2023-02-21 13:26:49.540111'),(238,'certificates','0017_add_mode_20201118_1725','2023-02-21 13:26:49.904341'),(239,'certificates','0018_historicalcertificateinvalidation','2023-02-21 13:26:50.165382'),(240,'certificates','0019_allowlistgenerationconfiguration','2023-02-21 13:26:50.710649'),(241,'certificates','0020_remove_existing_mgmt_cmd_args','2023-02-21 13:26:50.911376'),(242,'certificates','0021_remove_certificate_allowlist_duplicate_records','2023-02-21 13:26:51.102154'),(243,'certificates','0022_add_unique_constraints_to_certificatewhitelist_model','2023-02-21 13:26:51.208120'),(244,'certificates','0023_certificategenerationcommandconfiguration','2023-02-21 13:26:51.400743'),(245,'certificates','0024_delete_allowlistgenerationconfiguration','2023-02-21 13:26:51.418326'),(246,'certificates','0025_cleanup_certificate_errors','2023-02-21 13:26:51.681026'),(247,'certificates','0026_certificateallowlist','2023-02-21 13:26:51.934533'),(248,'certificates','0027_historicalcertificateallowlist','2023-02-21 13:26:52.167872'),(249,'certificates','0028_allowlist_data_20210615_2033','2023-02-21 13:26:52.360233'),(250,'certificates','0029_allowlist_created_20210623_1417','2023-02-21 13:26:52.608654'),(251,'certificates','0030_delete_certificatewhitelist','2023-02-21 13:26:52.629414'),(252,'certificates','0031_certificatedateoverride_historicalcertificatedateoverride','2023-02-21 13:26:53.858205'),(253,'certificates','0032_change_certificatedateoverride_date','2023-02-21 13:26:54.209413'),(254,'certificates','0033_auto_20220307_1100','2023-02-21 13:26:54.621078'),(255,'certificates','0034_auto_20220401_1213','2023-02-21 13:26:54.887153'),(256,'user_api','0001_initial','2023-02-21 13:26:56.829772'),(257,'user_api','0002_retirementstate_userretirementstatus','2023-02-21 13:26:57.454904'),(258,'commerce','0001_data__add_ecommerce_service_user','2023-02-21 13:26:57.747060'),(259,'commerce','0002_commerceconfiguration','2023-02-21 13:26:57.987834'),(260,'commerce','0003_auto_20160329_0709','2023-02-21 13:26:58.109471'),(261,'commerce','0004_auto_20160531_0950','2023-02-21 13:26:58.448693'),(262,'commerce','0005_commerceconfiguration_enable_automatic_refund_approval','2023-02-21 13:26:58.592323'),(263,'commerce','0006_auto_20170424_1734','2023-02-21 13:26:58.707091'),(264,'commerce','0007_auto_20180313_0609','2023-02-21 13:26:58.992023'),(265,'commerce','0008_auto_20191024_2048','2023-02-21 13:26:59.243096'),(266,'completion','0001_initial','2023-02-21 13:27:00.159040'),(267,'completion','0002_auto_20180125_1510','2023-02-21 13:27:00.277050'),(268,'completion','0003_learning_context','2023-02-21 13:27:00.788809'),(269,'consent','0001_initial','2023-02-21 13:27:01.576027'),(270,'consent','0002_migrate_to_new_data_sharing_consent','2023-02-21 13:27:01.877484'),(271,'consent','0003_historicaldatasharingconsent_history_change_reason','2023-02-21 13:27:02.138842'),(272,'consent','0004_datasharingconsenttextoverrides','2023-02-21 13:27:02.542290'),(273,'lti1p3_tool_config','0001_initial','2023-02-21 13:27:02.704997'),(274,'organizations','0001_initial','2023-02-21 13:27:03.894996'),(275,'organizations','0002_auto_20170117_1434','2023-02-21 13:27:03.908950'),(276,'organizations','0003_auto_20170221_1138','2023-02-21 13:27:03.921348'),(277,'organizations','0004_auto_20170413_2315','2023-02-21 13:27:03.932518'),(278,'organizations','0005_auto_20171116_0640','2023-02-21 13:27:03.939505'),(279,'organizations','0006_auto_20171207_0259','2023-02-21 13:27:03.945876'),(280,'organizations','0007_historicalorganization','2023-02-21 13:27:03.955441'),(281,'content_libraries','0001_initial','2023-02-21 13:27:05.067894'),(282,'content_libraries','0002_group_permissions','2023-02-21 13:27:07.289155'),(283,'content_libraries','0003_contentlibrary_type','2023-02-21 13:27:07.371161'),(284,'content_libraries','0004_contentlibrary_license','2023-02-21 13:27:07.463512'),(285,'content_libraries','0005_ltigradedresource_ltiprofile','2023-02-21 13:27:08.857898'),(286,'content_libraries','0006_auto_20210615_1916','2023-02-21 13:27:09.527888'),(287,'content_libraries','0005_contentlibraryblockimporttask','2023-02-21 13:27:09.907940'),(288,'content_libraries','0007_merge_20210818_0614','2023-02-21 13:27:09.917783'),(289,'content_libraries','0008_auto_20210818_2148','2023-02-21 13:27:11.452407'),(290,'content_libraries','0009_alter_contentlibrary_authorized_lti_configs','2023-02-21 13:27:12.302756'),(291,'course_overviews','0001_initial','2023-02-21 13:27:12.407673'),(292,'course_overviews','0002_add_course_catalog_fields','2023-02-21 13:27:12.631931'),(293,'course_overviews','0003_courseoverviewgeneratedhistory','2023-02-21 13:27:12.695077'),(294,'course_overviews','0004_courseoverview_org','2023-02-21 13:27:12.778862'),(295,'course_overviews','0005_delete_courseoverviewgeneratedhistory','2023-02-21 13:27:12.886333'),(296,'course_overviews','0006_courseoverviewimageset','2023-02-21 13:27:13.020097'),(297,'course_overviews','0007_courseoverviewimageconfig','2023-02-21 13:27:13.466085'),(298,'course_overviews','0008_remove_courseoverview_facebook_url','2023-02-21 13:27:13.473512'),(299,'course_overviews','0009_readd_facebook_url','2023-02-21 13:27:13.479831'),(300,'course_overviews','0010_auto_20160329_2317','2023-02-21 13:27:13.566137'),(301,'course_overviews','0011_courseoverview_marketing_url','2023-02-21 13:27:13.607661'),(302,'course_overviews','0012_courseoverview_eligible_for_financial_aid','2023-02-21 13:27:13.652748'),(303,'course_overviews','0013_courseoverview_language','2023-02-21 13:27:13.696826'),(304,'course_overviews','0014_courseoverview_certificate_available_date','2023-02-21 13:27:13.746864'),(305,'content_type_gating','0001_initial','2023-02-21 13:27:14.126622'),(306,'content_type_gating','0002_auto_20181119_0959','2023-02-21 13:27:14.460302'),(307,'content_type_gating','0003_auto_20181128_1407','2023-02-21 13:27:14.718950'),(308,'content_type_gating','0004_auto_20181128_1521','2023-02-21 13:27:14.861280'),(309,'content_type_gating','0005_auto_20190306_1547','2023-02-21 13:27:15.013581'),(310,'content_type_gating','0006_auto_20190308_1447','2023-02-21 13:27:15.175450'),(311,'content_type_gating','0007_auto_20190311_1919','2023-02-21 13:27:16.615487'),(312,'content_type_gating','0008_auto_20190313_1634','2023-02-21 13:27:16.786484'),(313,'contentserver','0001_initial','2023-02-21 13:27:17.127029'),(314,'contentserver','0002_cdnuseragentsconfig','2023-02-21 13:27:17.483985'),(315,'cornerstone','0001_initial','2023-02-21 13:27:19.562043'),(316,'cornerstone','0002_cornerstoneglobalconfiguration_subject_mapping','2023-02-21 13:27:19.695856'),(317,'cornerstone','0003_auto_20190621_1000','2023-02-21 13:27:20.263443'),(318,'cornerstone','0004_cornerstoneglobalconfiguration_languages','2023-02-21 13:27:20.420393'),(319,'cornerstone','0005_auto_20190925_0730','2023-02-21 13:27:20.850892'),(320,'cornerstone','0006_auto_20191001_0742','2023-02-21 13:27:21.121074'),(321,'cornerstone','0007_auto_20210708_1446','2023-02-21 13:27:21.340752'),(322,'cornerstone','0008_auto_20210909_1536','2023-02-21 13:27:21.607689'),(323,'cornerstone','0009_auto_20210923_1727','2023-02-21 13:27:22.266597'),(324,'cornerstone','0010_cornerstonecoursekey','2023-02-21 13:27:22.295509'),(325,'cornerstone','0011_auto_20211103_1855','2023-02-21 13:27:22.927646'),(326,'cornerstone','0012_alter_cornerstoneenterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:27:23.346588'),(327,'cornerstone','0013_auto_20220126_1837','2023-02-21 13:27:24.261676'),(328,'cornerstone','0014_auto_20220131_1539','2023-02-21 13:27:24.586899'),(329,'cornerstone','0015_auto_20220302_2231','2023-02-21 13:27:25.236192'),(330,'cornerstone','0016_auto_20220324_1550','2023-02-21 13:27:26.281995'),(331,'cornerstone','0017_alter_cornerstonelearnerdatatransmissionaudit_course_completed','2023-02-21 13:27:26.436128'),(332,'cornerstone','0018_auto_20220325_1757','2023-02-21 13:27:26.757575'),(333,'cornerstone','0019_auto_20220405_2311','2023-02-21 13:27:27.169783'),(334,'cornerstone','0020_auto_20220523_1625','2023-02-21 13:27:27.858674'),(335,'cornerstone','0021_cornerstonelearnerdatatransmissionaudit_friendly_status_message','2023-02-21 13:27:28.051742'),(336,'cornerstone','0022_cornerstonelearnerdatatransmissionaudit_api_record','2023-02-21 13:27:28.385690'),(337,'cornerstone','0023_auto_20221021_0159','2023-02-21 13:27:28.940336'),(338,'cornerstone','0024_auto_20221031_1855','2023-02-21 13:27:29.249696'),(339,'cornerstone','0025_alter_cornerstonelearnerdatatransmissionaudit_index_together','2023-02-21 13:27:29.411943'),(340,'cornerstone','0026_auto_20230105_2122','2023-02-21 13:27:31.306820'),(341,'cornerstone','0027_auto_20230112_2002','2023-02-21 13:27:31.601917'),(342,'cors_csrf','0001_initial','2023-02-21 13:27:31.853139'),(343,'course_action_state','0001_initial','2023-02-21 13:27:32.310045'),(344,'course_apps','0001_initial','2023-02-21 13:27:32.729685'),(345,'course_overviews','0015_historicalcourseoverview','2023-02-21 13:27:33.574489'),(346,'course_overviews','0016_simulatecoursepublishconfig','2023-02-21 13:27:33.928290'),(347,'course_overviews','0017_auto_20191002_0823','2023-02-21 13:27:34.145994'),(348,'course_overviews','0018_add_start_end_in_CourseOverview','2023-02-21 13:27:34.680763'),(349,'course_overviews','0019_improve_courseoverviewtab','2023-02-21 13:27:35.032080'),(350,'course_date_signals','0001_initial','2023-02-21 13:27:35.671640'),(351,'course_duration_limits','0001_initial','2023-02-21 13:27:36.293368'),(352,'course_duration_limits','0002_auto_20181119_0959','2023-02-21 13:27:36.433223'),(353,'course_duration_limits','0003_auto_20181128_1407','2023-02-21 13:27:36.597125'),(354,'course_duration_limits','0004_auto_20181128_1521','2023-02-21 13:27:36.755808'),(355,'course_duration_limits','0005_auto_20190306_1546','2023-02-21 13:27:36.914406'),(356,'course_duration_limits','0006_auto_20190308_1447','2023-02-21 13:27:37.071858'),(357,'course_duration_limits','0007_auto_20190311_1919','2023-02-21 13:27:38.099179'),(358,'course_duration_limits','0008_auto_20190313_1634','2023-02-21 13:27:38.272983'),(359,'course_goals','0001_initial','2023-02-21 13:27:39.176482'),(360,'course_goals','0002_auto_20171010_1129','2023-02-21 13:27:39.445319'),(361,'course_goals','0003_historicalcoursegoal','2023-02-21 13:27:40.176055'),(362,'course_goals','0004_auto_20210806_0137','2023-02-21 13:27:41.235332'),(363,'course_goals','0005_useractivity','2023-02-21 13:27:42.785553'),(364,'course_goals','0006_add_unsubscribe_token','2023-02-21 13:27:43.681761'),(365,'course_goals','0007_set_unsubscribe_token_default','2023-02-21 13:27:44.342990'),(366,'course_goals','0008_coursegoalreminderstatus','2023-02-21 13:27:44.854265'),(367,'course_groups','0002_change_inline_default_cohort_value','2023-02-21 13:27:44.882390'),(368,'course_groups','0003_auto_20170609_1455','2023-02-21 13:27:45.477247'),(369,'course_overviews','0020_courseoverviewtab_url_slug','2023-02-21 13:27:45.571360'),(370,'course_overviews','0021_courseoverviewtab_link','2023-02-21 13:27:45.729883'),(371,'course_overviews','0022_courseoverviewtab_is_hidden','2023-02-21 13:27:45.836469'),(372,'course_overviews','0023_courseoverview_banner_image_url','2023-02-21 13:27:46.244701'),(373,'course_overviews','0024_overview_adds_has_highlights','2023-02-21 13:27:46.794912'),(374,'course_home_api','0001_initial','2023-02-21 13:27:48.474245'),(375,'lti_consumer','0001_initial','2023-02-21 13:27:48.537284'),(376,'lti_consumer','0002_ltiagslineitem','2023-02-21 13:27:48.674930'),(377,'lti_consumer','0003_ltiagsscore','2023-02-21 13:27:48.787493'),(378,'lti_consumer','0004_keyset_mgmt_to_model','2023-02-21 13:27:48.978197'),(379,'lti_consumer','0005_migrate_keyset_to_model','2023-02-21 13:27:49.309237'),(380,'lti_consumer','0006_add_on_model_config_for_lti_1p1','2023-02-21 13:27:49.919997'),(381,'lti_consumer','0007_ltidlcontentitem','2023-02-21 13:27:50.002868'),(382,'lti_consumer','0008_fix_uuid_backfill','2023-02-21 13:27:50.399228'),(383,'lti_consumer','0009_backfill-empty-string-config-id','2023-02-21 13:27:50.865817'),(384,'lti_consumer','0010_backfill-empty-string-lti-config','2023-02-21 13:27:51.211238'),(385,'lti_consumer','0011_courseeditltifieldsenabledflag','2023-02-21 13:27:51.815863'),(386,'lti_consumer','0012_rename_courseeditltifieldsenabledflag_model','2023-02-21 13:27:52.258065'),(387,'lti_consumer','0013_auto_20210712_1352','2023-02-21 13:27:52.308137'),(388,'course_live','0001_initial','2023-02-21 13:27:52.961638'),(389,'course_live','0002_auto_20220617_1822','2023-02-21 13:27:53.205681'),(390,'course_modes','0008_course_key_field_to_foreign_key','2023-02-21 13:27:53.537364'),(391,'course_modes','0009_suggested_prices_to_charfield','2023-02-21 13:27:53.574035'),(392,'course_modes','0010_archived_suggested_prices_to_charfield','2023-02-21 13:27:53.597564'),(393,'course_modes','0011_change_regex_for_comma_separated_ints','2023-02-21 13:27:53.644210'),(394,'course_modes','0012_historicalcoursemode','2023-02-21 13:27:54.461433'),(395,'course_modes','0013_auto_20200115_2022','2023-02-21 13:27:54.755340'),(396,'course_modes','0014_auto_20230207_1212','2023-02-21 13:27:55.581046'),(397,'course_overviews','0025_auto_20210702_1602','2023-02-21 13:27:56.886709'),(398,'course_overviews','0026_courseoverview_entrance_exam','2023-02-21 13:27:59.079890'),(399,'course_overviews','0027_auto_20221102_1109','2023-02-21 13:27:59.427447'),(400,'coursewarehistoryextended','0001_initial','2023-02-21 13:28:00.135617'),(401,'coursewarehistoryextended','0002_force_studentmodule_index','2023-02-21 13:28:00.174814'),(402,'courseware','0002_coursedynamicupgradedeadlineconfiguration_dynamicupgradedeadlineconfiguration','2023-02-21 13:28:01.035587'),(403,'courseware','0003_auto_20170825_0935','2023-02-21 13:28:01.239765'),(404,'courseware','0004_auto_20171010_1639','2023-02-21 13:28:01.444491'),(405,'courseware','0005_orgdynamicupgradedeadlineconfiguration','2023-02-21 13:28:02.380592'),(406,'courseware','0006_remove_module_id_index','2023-02-21 13:28:02.537498'),(407,'courseware','0007_remove_done_index','2023-02-21 13:28:02.732434'),(408,'courseware','0008_move_idde_to_edx_when','2023-02-21 13:28:02.964366'),(409,'courseware','0009_auto_20190703_1955','2023-02-21 13:28:03.179276'),(410,'courseware','0010_auto_20190709_1559','2023-02-21 13:28:03.409582'),(411,'courseware','0011_csm_id_bigint','2023-02-21 13:28:03.699063'),(412,'courseware','0012_adjust_fields','2023-02-21 13:28:04.181895'),(413,'courseware','0013_auto_20191001_1858','2023-02-21 13:28:04.810544'),(414,'courseware','0014_fix_nan_value_for_global_speed','2023-02-21 13:28:05.123415'),(415,'courseware','0015_add_courseware_stats_index','2023-02-21 13:28:05.306730'),(416,'courseware','0016_lastseencoursewaretimezone','2023-02-21 13:28:05.796764'),(417,'courseware','0017_financialassistanceconfiguration','2023-02-21 13:28:06.164551'),(418,'crawlers','0001_initial','2023-02-21 13:28:06.711146'),(419,'crawlers','0002_auto_20170419_0018','2023-02-21 13:28:06.952864'),(420,'credentials','0001_initial','2023-02-21 13:28:07.790707'),(421,'credentials','0002_auto_20160325_0631','2023-02-21 13:28:08.094382'),(422,'credentials','0003_auto_20170525_1109','2023-02-21 13:28:08.610594'),(423,'credentials','0004_notifycredentialsconfig','2023-02-21 13:28:09.009955'),(424,'credentials','0005_remove_existing_mgmt_cmd_args','2023-02-21 13:28:09.359287'),(425,'credit','0001_initial','2023-02-21 13:28:11.044313'),(426,'credit','0002_creditconfig','2023-02-21 13:28:11.759953'),(427,'credit','0003_auto_20160511_2227','2023-02-21 13:28:11.784726'),(428,'credit','0004_delete_historical_credit_records','2023-02-21 13:28:13.491762'),(429,'credit','0005_creditrequirement_sort_value','2023-02-21 13:28:13.682982'),(430,'credit','0006_creditrequirement_alter_ordering','2023-02-21 13:28:13.736124'),(431,'credit','0007_creditrequirement_copy_values','2023-02-21 13:28:14.232701'),(432,'credit','0008_creditrequirement_remove_order','2023-02-21 13:28:14.316355'),(433,'dark_lang','0001_initial','2023-02-21 13:28:15.395440'),(434,'dark_lang','0002_data__enable_on_install','2023-02-21 13:28:15.731664'),(435,'dark_lang','0003_auto_20180425_0359','2023-02-21 13:28:16.206386'),(436,'database_fixups','0001_initial','2023-02-21 13:28:16.590174'),(437,'degreed','0001_initial','2023-02-21 13:28:18.083313'),(438,'degreed','0002_auto_20180104_0103','2023-02-21 13:28:18.674554'),(439,'degreed','0003_auto_20180109_0712','2023-02-21 13:28:19.094970'),(440,'degreed','0004_auto_20180306_1251','2023-02-21 13:28:19.454574'),(441,'degreed','0005_auto_20180807_1302','2023-02-21 13:28:22.027018'),(442,'degreed','0006_upgrade_django_simple_history','2023-02-21 13:28:22.261573'),(443,'degreed','0007_auto_20190925_0730','2023-02-21 13:28:22.678810'),(444,'degreed','0008_auto_20191001_0742','2023-02-21 13:28:23.404359'),(445,'degreed','0009_auto_20210119_1546','2023-02-21 13:28:25.349180'),(446,'degreed','0010_auto_20210708_1446','2023-02-21 13:28:25.984683'),(447,'degreed','0011_auto_20210909_1536','2023-02-21 13:28:26.570496'),(448,'degreed','0012_auto_20210923_1727','2023-02-21 13:28:26.957377'),(449,'degreed','0013_alter_degreedenterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:28:27.352462'),(450,'degreed','0014_auto_20220126_1837','2023-02-21 13:28:30.658957'),(451,'degreed','0015_auto_20220131_1539','2023-02-21 13:28:31.414364'),(452,'degreed','0016_auto_20220302_2231','2023-02-21 13:28:31.805510'),(453,'degreed','0017_alter_degreedlearnerdatatransmissionaudit_completed_timestamp','2023-02-21 13:28:31.865517'),(454,'degreed','0018_auto_20220324_1550','2023-02-21 13:28:32.442313'),(455,'degreed','0019_auto_20220325_1757','2023-02-21 13:28:32.558009'),(456,'degreed','0020_auto_20220405_2311','2023-02-21 13:28:32.668738'),(457,'degreed','0021_auto_20220523_1625','2023-02-21 13:28:33.039682'),(458,'degreed','0022_degreedlearnerdatatransmissionaudit_friendly_status_message','2023-02-21 13:28:33.085631'),(459,'degreed','0023_degreedlearnerdatatransmissionaudit_api_record','2023-02-21 13:28:33.350573'),(460,'degreed','0024_auto_20221021_0159','2023-02-21 13:28:33.738859'),(461,'degreed','0025_auto_20221031_1855','2023-02-21 13:28:34.062820'),(462,'degreed','0026_move_and_recrete_completed_timestamp','2023-02-21 13:28:34.153601'),(463,'degreed','0027_alter_degreedlearnerdatatransmissionaudit_index_together','2023-02-21 13:28:34.221197'),(464,'degreed','0028_auto_20230105_2122','2023-02-21 13:28:37.084787'),(465,'degreed','0029_auto_20230112_2002','2023-02-21 13:28:37.488010'),(466,'degreed2','0001_initial','2023-02-21 13:28:38.690076'),(467,'degreed2','0002_auto_20211101_2021','2023-02-21 13:28:39.337591'),(468,'degreed2','0003_alter_degreed2enterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:28:39.644931'),(469,'degreed2','0004_auto_20220126_1837','2023-02-21 13:28:42.993844'),(470,'degreed2','0005_auto_20220131_1539','2023-02-21 13:28:43.472012'),(471,'degreed2','0006_auto_20220214_1627','2023-02-21 13:28:43.942039'),(472,'degreed2','0007_auto_20220302_2231','2023-02-21 13:28:44.839984'),(473,'degreed2','0008_degreed2learnerdatatransmissionaudit_course_completed','2023-02-21 13:28:44.954750'),(474,'degreed2','0009_alter_degreed2learnerdatatransmissionaudit_completed_timestamp','2023-02-21 13:28:45.024850'),(475,'degreed2','0010_auto_20220324_1550','2023-02-21 13:28:45.469788'),(476,'degreed2','0011_auto_20220325_1757','2023-02-21 13:28:45.563172'),(477,'degreed2','0012_auto_20220405_2311','2023-02-21 13:28:45.671912'),(478,'degreed2','0013_auto_20220523_1625','2023-02-21 13:28:46.109092'),(479,'degreed2','0014_degreed2learnerdatatransmissionaudit_friendly_status_message','2023-02-21 13:28:46.196262'),(480,'degreed2','0015_degreed2learnerdatatransmissionaudit_api_record','2023-02-21 13:28:46.563114'),(481,'degreed2','0016_auto_20221021_0159','2023-02-21 13:28:46.754324'),(482,'degreed2','0017_auto_20221031_1855','2023-02-21 13:28:47.255946'),(483,'degreed2','0018_move_and_recrete_completed_timestamp','2023-02-21 13:28:47.374713'),(484,'degreed2','0019_alter_degreed2learnerdatatransmissionaudit_index_together','2023-02-21 13:28:47.454528'),(485,'degreed2','0020_auto_20230105_2122','2023-02-21 13:28:50.490292'),(486,'degreed2','0021_auto_20230112_2002','2023-02-21 13:28:50.972293'),(487,'demographics','0001_initial','2023-02-21 13:28:52.364209'),(488,'demographics','0002_clean_duplicate_entries','2023-02-21 13:28:52.824021'),(489,'demographics','0003_auto_20200827_1949','2023-02-21 13:28:53.205431'),(490,'discounts','0001_initial','2023-02-21 13:28:54.131239'),(491,'discounts','0002_auto_20191022_1720','2023-02-21 13:28:55.408395'),(492,'discussions','0001_initial','2023-02-21 13:28:56.161291'),(493,'discussions','0002_add_provider_filter','2023-02-21 13:28:57.117551'),(494,'discussions','0003_alter_provider_filter_list','2023-02-21 13:28:57.953891'),(495,'discussions','0004_historicalprogramdiscussionsconfiguration_programdiscussionsconfiguration','2023-02-21 13:28:58.800560'),(496,'discussions','0005_auto_20210910_0940','2023-02-21 13:28:59.063515'),(497,'discussions','0006_auto_20211006_0441','2023-02-21 13:29:01.005045'),(498,'discussions','0007_add_discussion_topic_link','2023-02-21 13:29:01.819152'),(499,'discussions','0008_auto_20220119_0746','2023-02-21 13:29:03.121823'),(500,'discussions','0009_discussiontopiclink_ordering','2023-02-21 13:29:03.558904'),(501,'discussions','0010_auto_20220203_2134','2023-02-21 13:29:04.936502'),(502,'discussions','0011_auto_20220510_0716','2023-02-21 13:29:05.451957'),(503,'discussions','0012_auto_20220511_0827','2023-02-21 13:29:05.893913'),(504,'discussions','0013_auto_20220802_1154','2023-02-21 13:29:06.125881'),(505,'discussions','0014_auto_20220826_1107','2023-02-21 13:29:06.715666'),(506,'discussions','0015_discussiontopiclink_context','2023-02-21 13:29:06.774073'),(507,'django_celery_results','0001_initial','2023-02-21 13:29:06.838172'),(508,'django_celery_results','0002_add_task_name_args_kwargs','2023-02-21 13:29:06.975665'),(509,'django_celery_results','0003_auto_20181106_1101','2023-02-21 13:29:07.003930'),(510,'django_celery_results','0004_auto_20190516_0412','2023-02-21 13:29:07.264748'),(511,'django_celery_results','0005_taskresult_worker','2023-02-21 13:29:07.360902'),(512,'django_celery_results','0006_taskresult_date_created','2023-02-21 13:29:07.767967'),(513,'django_celery_results','0007_remove_taskresult_hidden','2023-02-21 13:29:07.839493'),(514,'django_celery_results','0008_chordcounter','2023-02-21 13:29:07.875613'),(515,'django_celery_results','0009_groupresult','2023-02-21 13:29:08.400871'),(516,'django_celery_results','0010_remove_duplicate_indices','2023-02-21 13:29:08.467819'),(517,'django_celery_results','0011_taskresult_periodic_task_name','2023-02-21 13:29:08.532897'),(518,'django_comment_common','0001_initial','2023-02-21 13:29:09.274032'),(519,'django_comment_common','0002_forumsconfig','2023-02-21 13:29:09.653827'),(520,'django_comment_common','0003_enable_forums','2023-02-21 13:29:10.057705'),(521,'django_comment_common','0004_auto_20161117_1209','2023-02-21 13:29:10.243472'),(522,'django_comment_common','0005_coursediscussionsettings','2023-02-21 13:29:10.291708'),(523,'django_comment_common','0006_coursediscussionsettings_discussions_id_map','2023-02-21 13:29:10.343762'),(524,'django_comment_common','0007_discussionsidmapping','2023-02-21 13:29:10.377788'),(525,'django_comment_common','0008_role_user_index','2023-02-21 13:29:10.406939'),(526,'django_comment_common','0009_coursediscussionsettings_reported_content_email_notifications','2023-02-21 13:29:10.453327'),(527,'django_notify','0001_initial','2023-02-21 13:29:12.930924'),(528,'edx_name_affirmation','0001_initial','2023-02-21 13:29:13.308096'),(529,'edx_name_affirmation','0002_verifiednameconfig','2023-02-21 13:29:13.755916'),(530,'edx_name_affirmation','0003_verifiedname_status','2023-02-21 13:29:13.983282'),(531,'edx_name_affirmation','0004_auto_20210816_0958','2023-02-21 13:29:14.245083'),(532,'edx_name_affirmation','0005_remove_verifiedname_is_verified','2023-02-21 13:29:14.577336'),(533,'edx_name_affirmation','0006_auto_20210830_2029','2023-02-21 13:29:15.076032'),(534,'edx_name_affirmation','0007_historicalverifiedname','2023-02-21 13:29:15.944644'),(535,'edx_proctoring','0001_initial','2023-02-21 13:29:21.087161'),(536,'edx_proctoring','0002_proctoredexamstudentattempt_is_status_acknowledged','2023-02-21 13:29:21.374294'),(537,'edx_proctoring','0003_auto_20160101_0525','2023-02-21 13:29:21.708099'),(538,'edx_proctoring','0004_auto_20160201_0523','2023-02-21 13:29:21.905941'),(539,'edx_proctoring','0005_proctoredexam_hide_after_due','2023-02-21 13:29:21.968000'),(540,'edx_proctoring','0006_allowed_time_limit_mins','2023-02-21 13:29:22.411360'),(541,'edx_proctoring','0007_proctoredexam_backend','2023-02-21 13:29:22.465993'),(542,'edx_proctoring','0008_auto_20181116_1551','2023-02-21 13:29:23.554342'),(543,'edx_proctoring','0009_proctoredexamreviewpolicy_remove_rules','2023-02-21 13:29:23.974841'),(544,'edx_proctoring','0010_update_backend','2023-02-21 13:29:24.389682'),(545,'edx_proctoring','0011_allow_multiple_attempts','2023-02-21 13:29:24.610255'),(546,'edx_proctoring','0012_proctoredexamstudentattempt_time_remaining_seconds','2023-02-21 13:29:24.877303'),(547,'edx_proctoring','0013_proctoredexamsoftwaresecurereview_is_active_attempt','2023-02-21 13:29:25.313469'),(548,'edx_proctoring','0014_add_is_resumable_to_proctoredexamstudentattempt','2023-02-21 13:29:25.803967'),(549,'edx_proctoring','0015_rm_proctoredexamstudentattempt_ips','2023-02-21 13:29:27.197660'),(550,'edx_proctoring','0016_nullable_proctoredexamstudentattempt_name','2023-02-21 13:29:27.627947'),(551,'edx_proctoring','0017_rm_proctoredexamstudentattempt_name','2023-02-21 13:29:28.020242'),(552,'edx_proctoring','0018_historicalproctoredexamstudentattempt','2023-02-21 13:29:28.463490'),(553,'edx_proctoring','0019_proctoredexamsoftwaresecurereview_encrypted_video_url','2023-02-21 13:29:28.698903'),(554,'edx_proctoring','0020_auto_20211028_1915','2023-02-21 13:29:29.210323'),(555,'edx_proctoring','0021_auto_20211029_1353','2023-02-21 13:29:30.466896'),(556,'edx_proctoring','0022_proctoredexamstudentattempt_add_readytoresume_resumed','2023-02-21 13:29:31.462699'),(557,'edx_proctoring','0023_historicalproctoredexam','2023-02-21 13:29:31.899407'),(558,'edx_proctoring','0024_delete_proctoredexamstudentattempthistory','2023-02-21 13:29:31.922555'),(559,'edx_when','0001_initial','2023-02-21 13:29:32.701268'),(560,'edx_when','0002_auto_20190318_1736','2023-02-21 13:29:33.961648'),(561,'edx_when','0003_auto_20190402_1501','2023-02-21 13:29:34.830228'),(562,'edx_when','0004_datepolicy_rel_date','2023-02-21 13:29:34.916765'),(563,'edx_when','0005_auto_20190911_1056','2023-02-21 13:29:35.169726'),(564,'edx_when','0006_drop_active_index','2023-02-21 13:29:35.202871'),(565,'edx_when','0007_meta_tweaks','2023-02-21 13:29:35.231312'),(566,'edx_when','0008_courseversion_block_type','2023-02-21 13:29:35.310381'),(567,'edxval','0001_squashed_0016_add_transcript_credentials_model','2023-02-21 13:29:36.304519'),(568,'edxval','0002_add_error_description_field','2023-02-21 13:29:36.357143'),(569,'edxval','0003_delete_transcriptcredentials','2023-02-21 13:29:36.403523'),(570,'email_marketing','0001_initial','2023-02-21 13:29:36.790199'),(571,'email_marketing','0002_auto_20160623_1656','2023-02-21 13:29:40.559325'),(572,'email_marketing','0003_auto_20160715_1145','2023-02-21 13:29:41.812160'),(573,'email_marketing','0004_emailmarketingconfiguration_welcome_email_send_delay','2023-02-21 13:29:42.768311'),(574,'email_marketing','0005_emailmarketingconfiguration_user_registration_cookie_timeout_delay','2023-02-21 13:29:43.075856'),(575,'email_marketing','0006_auto_20170711_0615','2023-02-21 13:29:43.355772'),(576,'email_marketing','0007_auto_20170809_0653','2023-02-21 13:29:44.103798'),(577,'email_marketing','0008_auto_20170809_0539','2023-02-21 13:29:44.442880'),(578,'email_marketing','0009_remove_emailmarketingconfiguration_sailthru_activation_template','2023-02-21 13:29:44.636037'),(579,'email_marketing','0010_auto_20180425_0800','2023-02-21 13:29:45.110428'),(580,'email_marketing','0011_delete_emailmarketingconfiguration','2023-02-21 13:29:45.133563'),(581,'embargo','0001_initial','2023-02-21 13:29:46.952062'),(582,'embargo','0002_data__add_countries','2023-02-21 13:29:48.027251'),(583,'enterprise','0154_alter_systemwideenterpriseuserroleassignment_unique_together','2023-02-21 13:29:48.680808'),(584,'enterprise','0155_add_is_relinkable_to_enterprise_customer_user','2023-02-21 13:29:49.138958'),(585,'enterprise','0156_add_is_active_role_assignment','2023-02-21 13:29:49.718385'),(586,'enterprise','0157_make_field_nullable_before_removal','2023-02-21 13:29:50.784514'),(587,'enterprise','0158_remove_is_active_from_role_assignment','2023-02-21 13:29:51.298337'),(588,'enterprise','0159_add_enable_learner_portal_offers','2023-02-21 13:29:51.688151'),(589,'enterprise','0160_add_enable_portal_learner_credit_management_screen','2023-02-21 13:29:52.087821'),(590,'enterprise','0161_alter_enterprisecustomerreportingconfiguration_data_type','2023-02-21 13:29:52.585893'),(591,'enterprise','0162_add_enable_executive_education_2U_fulfillment','2023-02-21 13:29:52.975691'),(592,'enterprise','0163_auto_20220928_1611','2023-02-21 13:29:53.527825'),(593,'enterprise','0164_enterprisecatalogquery_include_exec_ed_2u_courses','2023-02-21 13:29:53.629212'),(594,'enterprise','0165_alter_enterprisecustomerreportingconfiguration_pgp_encryption_key','2023-02-21 13:29:53.779854'),(595,'enterprise','0166_auto_20221209_0819','2023-02-21 13:29:55.389520'),(596,'experiments','0001_initial','2023-02-21 13:29:56.227338'),(597,'student','0001_squashed_0031_auto_20200317_1122','2023-02-21 13:30:18.424435'),(598,'entitlements','0001_initial','2023-02-21 13:30:19.563061'),(599,'entitlements','0002_auto_20171102_0719','2023-02-21 13:30:20.706140'),(600,'entitlements','0003_auto_20171205_1431','2023-02-21 13:30:22.189841'),(601,'entitlements','0004_auto_20171206_1729','2023-02-21 13:30:23.231185'),(602,'entitlements','0005_courseentitlementsupportdetail','2023-02-21 13:30:23.919348'),(603,'entitlements','0006_courseentitlementsupportdetail_action','2023-02-21 13:30:24.341373'),(604,'entitlements','0007_change_expiration_period_default','2023-02-21 13:30:24.443395'),(605,'entitlements','0008_auto_20180328_1107','2023-02-21 13:30:25.199097'),(606,'entitlements','0009_courseentitlement_refund_locked','2023-02-21 13:30:25.617843'),(607,'entitlements','0010_backfill_refund_lock','2023-02-21 13:30:26.215642'),(608,'entitlements','0011_historicalcourseentitlement','2023-02-21 13:30:26.821317'),(609,'entitlements','0012_allow_blank_order_number_values','2023-02-21 13:30:28.204758'),(610,'entitlements','0013_historicalcourseentitlementsupportdetail','2023-02-21 13:30:29.554868'),(611,'entitlements','0014_auto_20200115_2022','2023-02-21 13:30:30.312453'),(612,'entitlements','0015_add_unique_together_constraint','2023-02-21 13:30:31.910043'),(613,'experiments','0002_auto_20170627_1402','2023-02-21 13:30:32.024909'),(614,'experiments','0003_auto_20170713_1148','2023-02-21 13:30:32.056496'),(615,'experiments','0004_historicalexperimentkeyvalue','2023-02-21 13:30:33.669942'),(616,'external_user_ids','0001_initial','2023-02-21 13:30:43.458984'),(617,'external_user_ids','0002_mb_coaching_20200210_1754','2023-02-21 13:30:45.961895'),(618,'external_user_ids','0003_auto_20200224_1836','2023-02-21 13:30:47.988746'),(619,'external_user_ids','0004_add_lti_type','2023-02-21 13:30:50.762505'),(620,'grades','0001_initial','2023-02-21 13:30:51.202988'),(621,'grades','0002_rename_last_edited_field','2023-02-21 13:30:51.356716'),(622,'grades','0003_coursepersistentgradesflag_persistentgradesenabledflag','2023-02-21 13:30:57.570056'),(623,'grades','0004_visibleblocks_course_id','2023-02-21 13:30:57.689630'),(624,'grades','0005_multiple_course_flags','2023-02-21 13:30:58.614217'),(625,'grades','0006_persistent_course_grades','2023-02-21 13:30:58.857840'),(626,'grades','0007_add_passed_timestamp_column','2023-02-21 13:30:59.092364'),(627,'grades','0008_persistentsubsectiongrade_first_attempted','2023-02-21 13:30:59.199988'),(628,'grades','0009_auto_20170111_1507','2023-02-21 13:30:59.383864'),(629,'grades','0010_auto_20170112_1156','2023-02-21 13:30:59.505750'),(630,'grades','0011_null_edited_time','2023-02-21 13:30:59.745275'),(631,'grades','0012_computegradessetting','2023-02-21 13:31:00.998037'),(632,'grades','0013_persistentsubsectiongradeoverride','2023-02-21 13:31:01.224686'),(633,'grades','0014_persistentsubsectiongradeoverridehistory','2023-02-21 13:31:02.805902'),(634,'grades','0015_historicalpersistentsubsectiongradeoverride','2023-02-21 13:31:03.899059'),(635,'grades','0016_auto_20190703_1446','2023-02-21 13:31:05.200160'),(636,'grades','0017_delete_manual_psgoverride_table','2023-02-21 13:31:07.244124'),(637,'grades','0018_add_waffle_flag_defaults','2023-02-21 13:31:07.971538'),(638,'grades','0019_auto_20220912_0855','2023-02-21 13:31:08.761252'),(639,'instructor_task','0002_gradereportsetting','2023-02-21 13:31:09.500065'),(640,'instructor_task','0003_alter_task_input_field','2023-02-21 13:31:10.112142'),(641,'instructor_task','0004_historicalinstructortaskschedule_instructortaskschedule','2023-02-21 13:31:11.634923'),(642,'instructor_task','0005_alter_instructortaskschedule_task','2023-02-21 13:31:13.907848'),(643,'integrated_channel','0022_alter_contentmetadataitemtransmission_index_together','2023-02-21 13:31:14.117988'),(644,'integrated_channel','0023_auto_20221021_0159','2023-02-21 13:31:14.384081'),(645,'integrated_channel','0024_genericenterprisecustomerpluginconfiguration_deleted_at','2023-02-21 13:31:14.522826'),(646,'integrated_channel','0025_auto_20230105_2122','2023-02-21 13:31:15.338522'),(647,'integrated_channel','0026_genericenterprisecustomerpluginconfiguration_last_modified_at','2023-02-21 13:31:15.465456'),(648,'learner_pathway_progress','0001_initial','2023-02-21 13:31:16.091789'),(649,'learner_pathway_progress','0002_historicallearnerpathwayprogress_learnerpathwayprogress','2023-02-21 13:31:17.152875'),(650,'learner_pathway_progress','0003_auto_20220901_0616','2023-02-21 13:31:18.314082'),(651,'learner_pathway_progress','0004_auto_20220907_0316','2023-02-21 13:31:19.037070'),(652,'learner_pathway_progress','0005_auto_20221007_0758','2023-02-21 13:31:19.568836'),(653,'learning_sequences','0001_initial','2023-02-21 13:31:20.402621'),(654,'learning_sequences','0002_coursesectionsequence_inaccessible_after_due','2023-02-21 13:31:20.487304'),(655,'learning_sequences','0003_create_course_context_for_course_specific_models','2023-02-21 13:31:21.122249'),(656,'learning_sequences','0004_coursecontext_self_paced','2023-02-21 13:31:21.200705'),(657,'learning_sequences','0005_coursecontext_days_early_for_beta','2023-02-21 13:31:21.263386'),(658,'learning_sequences','0006_coursecontext_entrance_exam_id','2023-02-21 13:31:21.319152'),(659,'learning_sequences','0007_coursesequenceexam','2023-02-21 13:31:21.411621'),(660,'learning_sequences','0008_add_learning_context_title_index','2023-02-21 13:31:21.460786'),(661,'learning_sequences','0009_contenterror_publishreport','2023-02-21 13:31:21.652050'),(662,'learning_sequences','0010_add_publishreport_indexes','2023-02-21 13:31:21.790076'),(663,'learning_sequences','0011_course_meta_names','2023-02-21 13:31:21.852784'),(664,'learning_sequences','0012_add_user_partition_group','2023-02-21 13:31:22.234122'),(665,'learning_sequences','0013_through_model_for_user_partition_groups_1','2023-02-21 13:31:22.621786'),(666,'learning_sequences','0014_remove_user_partition_group_duplicates','2023-02-21 13:31:23.112303'),(667,'learning_sequences','0015_add_user_partition_group_unique_constraint','2023-02-21 13:31:23.158032'),(668,'learning_sequences','0016_through_model_for_user_partition_groups_2','2023-02-21 13:31:23.252987'),(669,'lms_xblock','0001_initial','2023-02-21 13:31:24.190432'),(670,'lti_consumer','0014_adds_external_id','2023-02-21 13:31:24.269804'),(671,'lti_consumer','0015_add_additional_1p3_fields','2023-02-21 13:31:24.779537'),(672,'lti_consumer','0016_lticonfiguration_lti_1p3_proctoring_enabled','2023-02-21 13:31:24.849247'),(673,'milestones','0001_initial','2023-02-21 13:31:25.613678'),(674,'milestones','0002_data__seed_relationship_types','2023-02-21 13:31:26.117524'),(675,'milestones','0003_coursecontentmilestone_requirements','2023-02-21 13:31:26.187665'),(676,'milestones','0004_auto_20151221_1445','2023-02-21 13:31:26.343048'),(677,'mobile_api','0001_initial','2023-02-21 13:31:26.876745'),(678,'mobile_api','0002_auto_20160406_0904','2023-02-21 13:31:27.038271'),(679,'mobile_api','0003_ignore_mobile_available_flag','2023-02-21 13:31:27.868075'),(680,'mobile_api','0004_mobileconfig','2023-02-21 13:31:27.917278'),(681,'moodle','0001_initial','2023-02-21 13:31:29.824384'),(682,'moodle','0002_moodlelearnerdatatransmissionaudit','2023-02-21 13:31:29.873964'),(683,'moodle','0003_auto_20201006_1706','2023-02-21 13:31:30.263844'),(684,'moodle','0004_auto_20201105_1921','2023-02-21 13:31:30.713189'),(685,'moodle','0005_auto_20210708_1446','2023-02-21 13:31:31.094816'),(686,'moodle','0006_auto_20210909_1536','2023-02-21 13:31:31.617750'),(687,'moodle','0007_auto_20210923_1727','2023-02-21 13:31:32.119807'),(688,'moodle','0008_alter_moodleenterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:31:33.175241'),(689,'moodle','0009_auto_20220126_1837','2023-02-21 13:31:38.299647'),(690,'moodle','0010_auto_20220131_1539','2023-02-21 13:31:39.437324'),(691,'moodle','0011_auto_20220302_2231','2023-02-21 13:31:40.567101'),(692,'moodle','0012_alter_moodlelearnerdatatransmissionaudit_completed_timestamp','2023-02-21 13:31:40.707533'),(693,'moodle','0013_auto_20220324_1550','2023-02-21 13:31:41.666180'),(694,'moodle','0014_auto_20220325_1757','2023-02-21 13:31:41.863793'),(695,'moodle','0015_auto_20220405_2311','2023-02-21 13:31:42.167398'),(696,'moodle','0016_auto_20220523_1625','2023-02-21 13:31:43.150225'),(697,'moodle','0017_moodlelearnerdatatransmissionaudit_friendly_status_message','2023-02-21 13:31:43.272426'),(698,'moodle','0018_moodlelearnerdatatransmissionaudit_api_record','2023-02-21 13:31:45.318206'),(699,'moodle','0019_auto_20221021_0159','2023-02-21 13:31:45.979698'),(700,'moodle','0020_auto_20221031_1855','2023-02-21 13:31:46.935863'),(701,'moodle','0021_move_and_recrete_completed_timestamp','2023-02-21 13:31:47.097900'),(702,'moodle','0022_auto_20221220_1527','2023-02-21 13:31:48.361092'),(703,'moodle','0023_alter_moodlelearnerdatatransmissionaudit_index_together','2023-02-21 13:31:48.467938'),(704,'moodle','0024_auto_20230105_2122','2023-02-21 13:31:52.137578'),(705,'moodle','0025_auto_20230112_2002','2023-02-21 13:31:52.591638'),(706,'oauth2_provider','0001_initial','2023-02-21 13:31:55.988452'),(707,'oauth2_provider','0002_auto_20190406_1805','2023-02-21 13:31:56.766355'),(708,'oauth_dispatch','0001_initial','2023-02-21 13:31:57.246115'),(709,'oauth_dispatch','0002_scopedapplication_scopedapplicationorganization','2023-02-21 13:31:58.854739'),(710,'oauth_dispatch','0003_application_data','2023-02-21 13:31:59.835459'),(711,'oauth_dispatch','0004_auto_20180626_1349','2023-02-21 13:32:02.797766'),(712,'oauth_dispatch','0005_applicationaccess_type','2023-02-21 13:32:03.926387'),(713,'oauth_dispatch','0006_drop_application_id_constraints','2023-02-21 13:32:05.487720'),(714,'oauth_dispatch','0007_restore_application_id_constraints','2023-02-21 13:32:07.619338'),(715,'oauth_dispatch','0008_applicationaccess_filters','2023-02-21 13:32:07.699250'),(716,'oauth_dispatch','0009_delete_enable_scopes_waffle_switch','2023-02-21 13:32:08.314658'),(717,'oauth_dispatch','0010_noop_migration_to_test_rollback','2023-02-21 13:32:08.336086'),(718,'oauth_dispatch','0011_noop_migration_to_test_rollback','2023-02-21 13:32:08.358385'),(719,'oauth_dispatch','0012_noop_migration_to_test_rollback','2023-02-21 13:32:08.379724'),(720,'organizations','0002_unique_short_name','2023-02-21 13:32:08.798633'),(721,'organizations','0003_historicalorganizationcourse','2023-02-21 13:32:09.414523'),(722,'outcome_surveys','0001_initial','2023-02-21 13:32:09.564751'),(723,'outcome_surveys','0002_learnercourseevent_already_sent','2023-02-21 13:32:09.650779'),(724,'outcome_surveys','0003_auto_20230130_0352','2023-02-21 13:32:10.231579'),(725,'outcome_surveys','0004_auto_20230203_0147','2023-02-21 13:32:10.865118'),(726,'program_enrollments','0001_initial','2023-02-21 13:32:13.809959'),(727,'program_enrollments','0002_historicalprogramcourseenrollment_programcourseenrollment','2023-02-21 13:32:16.017503'),(728,'program_enrollments','0003_auto_20190424_1622','2023-02-21 13:32:16.508229'),(729,'program_enrollments','0004_add_programcourseenrollment_relatedname','2023-02-21 13:32:17.502682'),(730,'program_enrollments','0005_canceled_not_withdrawn','2023-02-21 13:32:18.971444'),(731,'program_enrollments','0006_add_the_correct_constraints','2023-02-21 13:32:19.810833'),(732,'program_enrollments','0007_waiting_programcourseenrollment_constraint','2023-02-21 13:32:19.945335'),(733,'program_enrollments','0008_add_ended_programenrollment_status','2023-02-21 13:32:22.050233'),(734,'program_enrollments','0009_update_course_enrollment_field_to_foreign_key','2023-02-21 13:32:23.092716'),(735,'program_enrollments','0010_add_courseaccessroleassignment','2023-02-21 13:32:24.347493'),(736,'programs','0001_initial','2023-02-21 13:32:25.277602'),(737,'programs','0002_programsapiconfig_cache_ttl','2023-02-21 13:32:25.847180'),(738,'programs','0003_auto_20151120_1613','2023-02-21 13:32:30.848753'),(739,'programs','0004_programsapiconfig_enable_certification','2023-02-21 13:32:31.280048'),(740,'programs','0005_programsapiconfig_max_retries','2023-02-21 13:32:31.952805'),(741,'programs','0006_programsapiconfig_xseries_ad_enabled','2023-02-21 13:32:32.348092'),(742,'programs','0007_programsapiconfig_program_listing_enabled','2023-02-21 13:32:32.674958'),(743,'programs','0008_programsapiconfig_program_details_enabled','2023-02-21 13:32:32.982953'),(744,'programs','0009_programsapiconfig_marketing_path','2023-02-21 13:32:33.412048'),(745,'programs','0010_auto_20170204_2332','2023-02-21 13:32:34.717929'),(746,'programs','0011_auto_20170301_1844','2023-02-21 13:32:40.663707'),(747,'programs','0012_auto_20170419_0018','2023-02-21 13:32:41.023871'),(748,'programs','0013_customprogramsconfig','2023-02-21 13:32:41.765965'),(749,'programs','0014_delete_customprogramsconfig','2023-02-21 13:32:41.802969'),(750,'programs','0015_historicalprogramdiscussionsconfiguration_historicalprogramliveconfiguration_programdiscussionsconfi','2023-02-21 13:32:45.256858'),(751,'redirects','0001_initial','2023-02-21 13:32:45.923158'),(752,'redirects','0002_alter_redirect_new_path_help_text','2023-02-21 13:32:46.010499'),(753,'rss_proxy','0001_initial','2023-02-21 13:32:46.049805'),(754,'sap_success_factors','0001_squashed_0022_auto_20200206_1046','2023-02-21 13:32:47.985654'),(755,'sap_success_factors','0002_sapsuccessfactorslearnerdatatransmissionaudit_credit_hours','2023-02-21 13:32:47.995587'),(756,'sap_success_factors','0003_auto_20210701_1556','2023-02-21 13:32:48.006286'),(757,'sap_success_factors','0004_auto_20210708_1639','2023-02-21 13:32:48.015277'),(758,'sap_success_factors','0005_sapsuccessfactorsenterprisecustomerconfiguration_prevent_learner_self_submit_grades','2023-02-21 13:32:48.026394'),(759,'sap_success_factors','0006_sapsuccessfactorsenterprisecustomerconfiguration_idp_id','2023-02-21 13:32:48.036515'),(760,'sap_success_factors','0007_sapsuccessfactorsenterprisecustomerconfiguration_disable_learner_data_transmissions','2023-02-21 13:32:48.048715'),(761,'sap_success_factors','0008_alter_sapsuccessfactorsenterprisecustomerconfiguration_enterprise_customer','2023-02-21 13:32:48.057603'),(762,'sap_success_factors','0009_auto_20220126_1837','2023-02-21 13:32:48.066139'),(763,'sap_success_factors','0010_sapsuccessfactorsenterprisecustomerconfiguration_display_name','2023-02-21 13:32:48.074574'),(764,'sap_success_factors','0011_alter_sapsuccessfactorslearnerdatatransmissionaudit_enterprise_course_enrollment_id','2023-02-21 13:32:48.083163'),(765,'sap_success_factors','0002_alter_sapsuccessfactorsenterprisecustomerconfiguration_display_name','2023-02-21 13:32:48.231857'),(766,'sap_success_factors','0003_alter_sapsuccessfactorslearnerdatatransmissionaudit_completed_timestamp','2023-02-21 13:32:48.291908'),(767,'sap_success_factors','0004_auto_20220324_1550','2023-02-21 13:32:48.971190'),(768,'sap_success_factors','0005_auto_20220325_1757','2023-02-21 13:32:48.983820'),(769,'sap_success_factors','0006_auto_20220330_1157','2023-02-21 13:32:48.994768'),(770,'sap_success_factors','0005_sapsuccessfactorsenterprisecustomerconfiguration_dry_run_mode_enabled','2023-02-21 13:32:49.162235'),(771,'sap_success_factors','0006_sapsuccessfactorslearnerdatatransmissionaudit_friendly_status_message','2023-02-21 13:32:49.920952'),(772,'sap_success_factors','0007_sapsuccessfactorslearnerdatatransmissionaudit_api_record','2023-02-21 13:32:50.609389'),(773,'sap_success_factors','0008_auto_20221021_0159','2023-02-21 13:32:50.972687'),(774,'sap_success_factors','0009_sapsuccessfactorsenterprisecustomerconfiguration_deleted_at','2023-02-21 13:32:51.145926'),(775,'sap_success_factors','0010_move_and_recrete_completed_timestamp','2023-02-21 13:32:51.362970'),(776,'sap_success_factors','0011_alter_sapsuccessfactorslearnerdatatransmissionaudit_index_together','2023-02-21 13:32:51.531850'),(777,'sap_success_factors','0012_auto_20230105_2122','2023-02-21 13:32:52.645546'),(778,'sap_success_factors','0013_sapsuccessfactorsenterprisecustomerconfiguration_last_modified_at','2023-02-21 13:32:52.801849'),(779,'save_for_later','0001_initial','2023-02-21 13:32:52.918717'),(780,'save_for_later','0002_auto_20220322_1621','2023-02-21 13:32:53.482988'),(781,'schedules','0001_initial','2023-02-21 13:32:54.230119'),(782,'schedules','0002_auto_20170816_1532','2023-02-21 13:32:54.351707'),(783,'schedules','0003_scheduleconfig','2023-02-21 13:32:55.491223'),(784,'schedules','0004_auto_20170922_1428','2023-02-21 13:32:56.245603'),(785,'schedules','0005_auto_20171010_1722','2023-02-21 13:32:57.106924'),(786,'schedules','0006_scheduleexperience','2023-02-21 13:32:57.858943'),(787,'schedules','0007_scheduleconfig_hold_back_ratio','2023-02-21 13:32:58.323136'),(788,'schedules','0008_add_new_start_date_field','2023-02-21 13:32:58.428949'),(789,'schedules','0009_schedule_copy_column_values','2023-02-21 13:32:59.684998'),(790,'schedules','0010_remove_null_blank_from_schedules_date','2023-02-21 13:32:59.766597'),(791,'schedules','0011_auto_20200228_2018','2023-02-21 13:33:00.343625'),(792,'schedules','0012_auto_20200302_1914','2023-02-21 13:33:00.949962'),(793,'schedules','0013_historicalschedule','2023-02-21 13:33:01.591467'),(794,'schedules','0014_historicalschedule_drop_fk','2023-02-21 13:33:02.156121'),(795,'schedules','0015_schedules_start_nullable','2023-02-21 13:33:02.675453'),(796,'schedules','0016_remove_start_from_schedules','2023-02-21 13:33:02.775714'),(797,'schedules','0017_remove_start_from_historicalschedule','2023-02-21 13:33:03.225790'),(798,'schedules','0018_readd_historicalschedule_fks','2023-02-21 13:33:04.980123'),(799,'schedules','0019_auto_20200316_1935','2023-02-21 13:33:06.263128'),(800,'schedules','0020_remove_config_rollout_fields','2023-02-21 13:33:07.157752'),(801,'sessions','0001_initial','2023-02-21 13:33:07.239613'),(802,'site_configuration','0001_initial','2023-02-21 13:33:09.217142'),(803,'site_configuration','0002_auto_20160720_0231','2023-02-21 13:33:09.591052'),(804,'site_configuration','0003_auto_20200217_1058','2023-02-21 13:33:09.918713'),(805,'site_configuration','0004_add_site_values_field','2023-02-21 13:33:10.241872'),(806,'site_configuration','0005_populate_siteconfig_history_site_values','2023-02-21 13:33:10.278027'),(807,'site_configuration','0006_copy_values_to_site_values','2023-02-21 13:33:11.242068'),(808,'site_configuration','0007_remove_values_field','2023-02-21 13:33:11.478036'),(809,'site_configuration','0008_auto_20210910_0940','2023-02-21 13:33:11.660046'),(810,'default','0001_initial','2023-02-21 13:33:12.838816'),(811,'social_auth','0001_initial','2023-02-21 13:33:12.850773'),(812,'default','0002_add_related_name','2023-02-21 13:33:13.338829'),(813,'social_auth','0002_add_related_name','2023-02-21 13:33:13.347587'),(814,'default','0003_alter_email_max_length','2023-02-21 13:33:13.455902'),(815,'social_auth','0003_alter_email_max_length','2023-02-21 13:33:13.465163'),(816,'default','0004_auto_20160423_0400','2023-02-21 13:33:14.475355'),(817,'social_auth','0004_auto_20160423_0400','2023-02-21 13:33:14.488613'),(818,'social_auth','0005_auto_20160727_2333','2023-02-21 13:33:14.545730'),(819,'social_django','0006_partial','2023-02-21 13:33:14.610483'),(820,'social_django','0007_code_timestamp','2023-02-21 13:33:14.704075'),(821,'social_django','0008_partial_timestamp','2023-02-21 13:33:14.799950'),(822,'social_django','0009_auto_20191118_0520','2023-02-21 13:33:15.623973'),(823,'social_django','0010_uid_db_index','2023-02-21 13:33:16.082527'),(824,'splash','0001_initial','2023-02-21 13:33:16.766738'),(825,'split_modulestore_django','0001_initial','2023-02-21 13:33:17.731081'),(826,'split_modulestore_django','0002_data_migration','2023-02-21 14:10:20.881045'),(827,'staffgrader','0001_initial','2023-02-21 14:10:20.916647'),(828,'static_replace','0001_initial','2023-02-21 14:10:21.301704'),(829,'static_replace','0002_assetexcludedextensionsconfig','2023-02-21 14:10:21.756292'),(830,'status','0001_initial','2023-02-21 14:10:22.870588'),(831,'status','0002_update_help_text','2023-02-21 14:10:23.102211'),(832,'student','0032_removed_logout_view_configuration','2023-02-21 14:10:23.475584'),(833,'student','0033_userprofile_state','2023-02-21 14:10:23.749998'),(834,'student','0034_courseenrollmentcelebration','2023-02-21 14:10:24.125040'),(835,'student','0035_bulkchangeenrollmentconfiguration','2023-02-21 14:10:24.868911'),(836,'student','0036_userpasswordtogglehistory','2023-02-21 14:10:25.273793'),(837,'student','0037_linkedinaddtoprofileconfiguration_updates','2023-02-21 14:10:25.961403'),(838,'student','0038_auto_20201021_1256','2023-02-21 14:10:26.218616'),(839,'student','0039_anon_id_context','2023-02-21 14:10:26.460312'),(840,'student','0040_usercelebration','2023-02-21 14:10:27.219142'),(841,'student','0041_registration_activation_timestamp','2023-02-21 14:10:27.471997'),(842,'student','0042_allow_certificate_null_20210427_1519','2023-02-21 14:10:27.727679'),(843,'student','0043_remove_userprofile_allow_certificate','2023-02-21 14:10:27.991614'),(844,'student','0044_courseenrollmentcelebration_celebrate_weekly_goal','2023-02-21 14:10:28.053153'),(845,'submissions','0001_initial','2023-02-21 14:10:29.610191'),(846,'submissions','0002_auto_20151119_0913','2023-02-21 14:10:29.618239'),(847,'submissions','0003_submission_status','2023-02-21 14:10:29.626122'),(848,'submissions','0004_remove_django_extensions','2023-02-21 14:10:29.634702'),(849,'submissions','0005_CreateTeamModel','2023-02-21 14:10:29.643844'),(850,'submissions','0002_team_submission_optional','2023-02-21 14:10:29.990975'),(851,'submissions','0003_ensure_ascii','2023-02-21 14:10:30.028478'),(852,'super_csv','0001_initial','2023-02-21 14:10:30.077884'),(853,'super_csv','0002_csvoperation_user','2023-02-21 14:10:30.448776'),(854,'super_csv','0003_csvoperation_original_filename','2023-02-21 14:10:30.732477'),(855,'support','0001_initial','2023-02-21 14:10:31.503512'),(856,'survey','0001_initial','2023-02-21 14:10:32.010787'),(857,'survey_report','0001_initial','2023-02-21 14:10:32.047023'),(858,'survey_report','0002_auto_20221130_1533','2023-02-21 14:10:32.183084'),(859,'survey_report','0003_add_state_field_and_add_default_values_to_fields','2023-02-21 14:10:32.332036'),(860,'system_wide_roles','0001_SystemWideRole_SystemWideRoleAssignment','2023-02-21 14:10:32.765748'),(861,'system_wide_roles','0002_add_system_wide_student_support_role','2023-02-21 14:10:33.275684'),(862,'system_wide_roles','0003_systemwideroleassignment_applies_to_all_contexts','2023-02-21 14:10:33.905984'),(863,'teams','0001_initial','2023-02-21 14:10:35.039510'),(864,'teams','0002_slug_field_ids','2023-02-21 14:10:35.555941'),(865,'teams','0003_courseteam_organization_protected','2023-02-21 14:10:36.224064'),(866,'teams','0004_alter_defaults','2023-02-21 14:10:37.235544'),(867,'theming','0001_initial','2023-02-21 14:10:37.663130'),(868,'third_party_auth','0001_squashed_0026_auto_20200401_1932','2023-02-21 14:10:39.967730'),(869,'third_party_auth','0002_samlproviderconfig_country','2023-02-21 14:10:40.627800'),(870,'third_party_auth','0002_auto_20200721_1650','2023-02-21 14:10:41.773551'),(871,'third_party_auth','0003_samlconfiguration_is_public','2023-02-21 14:10:42.079806'),(872,'third_party_auth','0004_auto_20200919_0955','2023-02-21 14:10:43.526877'),(873,'third_party_auth','0005_auto_20210723_1527','2023-02-21 14:10:44.457979'),(874,'third_party_auth','0006_auto_20220314_1551','2023-02-21 14:10:47.770521'),(875,'third_party_auth','0007_samlproviderconfig_was_valid_at','2023-02-21 14:10:48.079123'),(876,'third_party_auth','0008_auto_20220324_1422','2023-02-21 14:10:48.672412'),(877,'third_party_auth','0009_historicalusersocialauth','2023-02-21 14:10:49.468870'),(878,'third_party_auth','0010_delete_historicalusersocialauth','2023-02-21 14:10:49.494847'),(879,'thumbnail','0001_initial','2023-02-21 14:10:49.526935'),(880,'track','0001_initial','2023-02-21 14:10:49.561379'),(881,'track','0002_delete_trackinglog','2023-02-21 14:10:49.587183'),(882,'user_api','0003_userretirementrequest','2023-02-21 14:10:50.014807'),(883,'user_api','0004_userretirementpartnerreportingstatus','2023-02-21 14:10:50.455161'),(884,'user_authn','0001_data__add_login_service','2023-02-21 14:10:50.974710'),(885,'user_tours','0001_initial','2023-02-21 14:10:51.755505'),(886,'user_tours','0002_auto_20230110_0905','2023-02-21 14:10:52.427559'),(887,'util','0001_initial','2023-02-21 14:10:52.875374'),(888,'util','0002_data__default_rate_limit_config','2023-02-21 14:10:53.731957'),(889,'verify_student','0001_initial','2023-02-21 14:10:58.168830'),(890,'verify_student','0002_auto_20151124_1024','2023-02-21 14:10:58.511158'),(891,'verify_student','0003_auto_20151113_1443','2023-02-21 14:10:58.800255'),(892,'verify_student','0004_delete_historical_records','2023-02-21 14:10:59.248141'),(893,'verify_student','0005_remove_deprecated_models','2023-02-21 14:11:03.203469'),(894,'verify_student','0006_ssoverification','2023-02-21 14:11:03.643558'),(895,'verify_student','0007_idverificationaggregate','2023-02-21 14:11:04.562794'),(896,'verify_student','0008_populate_idverificationaggregate','2023-02-21 14:11:05.020978'),(897,'verify_student','0009_remove_id_verification_aggregate','2023-02-21 14:11:05.850684'),(898,'verify_student','0010_manualverification','2023-02-21 14:11:06.624210'),(899,'verify_student','0011_add_fields_to_sspv','2023-02-21 14:11:07.258092'),(900,'verify_student','0012_sspverificationretryconfig','2023-02-21 14:11:07.662944'),(901,'verify_student','0013_add_expiration_date_field','2023-02-21 14:11:08.891581'),(902,'verify_student','0014_remove_softwaresecurephotoverification_expiry_date','2023-02-21 14:11:09.200409'),(903,'video_config','0001_initial','2023-02-21 14:11:10.038916'),(904,'video_config','0002_coursevideotranscriptenabledflag_videotranscriptenabledflag','2023-02-21 14:11:11.223934'),(905,'video_config','0003_transcriptmigrationsetting','2023-02-21 14:11:11.668173'),(906,'video_config','0004_transcriptmigrationsetting_command_run','2023-02-21 14:11:11.952099'),(907,'video_config','0005_auto_20180719_0752','2023-02-21 14:11:12.606497'),(908,'video_config','0006_videothumbnailetting_updatedcoursevideos','2023-02-21 14:11:13.119594'),(909,'video_config','0007_videothumbnailsetting_offset','2023-02-21 14:11:13.422260'),(910,'video_config','0008_courseyoutubeblockedflag','2023-02-21 14:11:13.868743'),(911,'video_pipeline','0001_initial','2023-02-21 14:11:14.705048'),(912,'video_pipeline','0002_auto_20171114_0704','2023-02-21 14:11:15.294207'),(913,'video_pipeline','0003_coursevideouploadsenabledbydefault_videouploadsenabledbydefault','2023-02-21 14:11:16.134650'),(914,'video_pipeline','0004_vempipelineintegration','2023-02-21 14:11:16.952185'),(915,'video_pipeline','0005_add_vem_course_percentage','2023-02-21 14:11:17.242518'),(916,'video_pipeline','0006_remove_vempipelineintegration_vem_enabled_courses_percentage','2023-02-21 14:11:17.566297'),(917,'video_pipeline','0007_delete_videopipelineintegration','2023-02-21 14:11:17.594962'),(918,'waffle','0002_auto_20161201_0958','2023-02-21 14:11:17.624685'),(919,'waffle','0003_update_strings_for_i18n','2023-02-21 14:11:23.292034'),(920,'waffle','0004_update_everyone_nullbooleanfield','2023-02-21 14:11:23.578121'),(921,'waffle_utils','0001_initial','2023-02-21 14:11:24.006111'),(922,'waffle_utils','0002_waffleflagcourseoverridemodel_note','2023-02-21 14:11:24.314659'),(923,'waffle_utils','0003_add_org_level_waffle_override','2023-02-21 14:11:25.410227'),(924,'wiki','0001_initial','2023-02-21 14:11:37.902916'),(925,'wiki','0002_remove_article_subscription','2023-02-21 14:11:37.961869'),(926,'wiki','0003_ip_address_conv','2023-02-21 14:11:38.867136'),(927,'wiki','0004_increase_slug_size','2023-02-21 14:11:38.983566'),(928,'wiki','0005_remove_attachments_and_images','2023-02-21 14:11:41.199279'),(929,'wiki','0006_auto_20200110_1003','2023-02-21 14:11:41.500053'),(930,'workflow','0001_initial','2023-02-21 14:11:41.701847'),(931,'workflow','0002_remove_django_extensions','2023-02-21 14:11:41.747989'),(932,'workflow','0003_TeamWorkflows','2023-02-21 14:11:41.832405'),(933,'workflow','0004_assessmentworkflowstep_skipped','2023-02-21 14:11:41.898662'),(934,'xapi','0001_initial','2023-02-21 14:11:42.760106'),(935,'xapi','0002_auto_20180726_0142','2023-02-21 14:11:43.019627'),(936,'xapi','0003_auto_20190807_1006','2023-02-21 14:11:43.761012'),(937,'xapi','0004_auto_20190830_0710','2023-02-21 14:11:44.056852'),(938,'xapi','0005_auto_20220324_1550','2023-02-21 14:11:47.137287'),(939,'xapi','0006_auto_20220325_1757','2023-02-21 14:11:47.731109'),(940,'xapi','0007_auto_20220405_2311','2023-02-21 14:11:48.330598'),(941,'xapi','0008_xapilearnerdatatransmissionaudit_friendly_status_message','2023-02-21 14:11:49.003812'),(942,'xapi','0009_xapilearnerdatatransmissionaudit_api_record','2023-02-21 14:11:49.453709'),(943,'xapi','0010_auto_20221021_0159','2023-02-21 14:11:50.386209'),(944,'xapi','0011_alter_xapilearnerdatatransmissionaudit_index_together','2023-02-21 14:11:51.088828'),(945,'xblock_django','0001_initial','2023-02-21 14:11:51.520782'),(946,'xblock_django','0002_auto_20160204_0809','2023-02-21 14:11:51.831989'),(947,'xblock_django','0003_add_new_config_models','2023-02-21 14:11:53.469781'),(948,'xblock_django','0004_delete_xblock_disable_config','2023-02-21 14:11:53.936302'),(949,'social_django','0004_auto_20160423_0400','2023-02-21 14:11:53.968948'),(950,'social_django','0001_initial','2023-02-21 14:11:53.978002'),(951,'social_django','0003_alter_email_max_length','2023-02-21 14:11:53.986483'),(952,'social_django','0002_add_related_name','2023-02-21 14:11:53.995365'),(953,'social_django','0005_auto_20160727_2333','2023-02-21 14:11:54.004187'),(954,'submissions','0001_squashed_0005_CreateTeamModel','2023-02-21 14:11:54.012795'),(955,'organizations','0001_squashed_0007_historicalorganization','2023-02-21 14:11:54.022870'),(956,'sap_success_factors','0004_auto_20220324_1550_squashed_0006_auto_20220330_1157','2023-02-21 14:11:54.030905'),(957,'sap_success_factors','0001_squashed_0022_auto_20200206_1046_squashed_0011_alter_sapsuccessfactorslearnerdatatransmissionaudit_enterprise_course_enrollment_id','2023-02-21 14:11:54.039666'),(958,'blackboard','0001_initial_squashed_0014_alter_blackboardlearnerassessmentdatatransmissionaudit_enterprise_course_enrollment_id','2023-02-21 14:11:54.047924'),(959,'contentstore','0001_initial','2023-02-21 14:18:20.728696'),(960,'contentstore','0002_add_assets_page_flag','2023-02-21 14:18:21.758959'),(961,'contentstore','0003_remove_assets_page_flag','2023-02-21 14:18:22.616383'),(962,'contentstore','0004_remove_push_notification_configmodel_table','2023-02-21 14:18:23.311983'),(963,'contentstore','0005_add_enable_checklists_quality_waffle_flag','2023-02-21 14:18:23.339689'),(964,'contentstore','0006_courseoutlineregenerate','2023-02-21 14:18:23.363687'),(965,'contentstore','0007_backfillcoursetabsconfig','2023-02-21 14:18:23.906393'),(966,'contentstore','0008_cleanstalecertificateavailabilitydatesconfig','2023-02-21 14:18:24.319837'),(967,'course_creators','0001_initial','2023-02-21 14:18:24.750847'),(968,'course_creators','0002_add_org_support_for_course_creators','2023-02-21 14:18:25.716990'),(969,'tagging','0001_initial','2023-02-21 14:18:25.828483'),(970,'tagging','0002_auto_20170116_1541','2023-02-21 14:18:25.870431'),(971,'user_tasks','0001_initial','2023-02-21 14:18:26.657025'),(972,'user_tasks','0002_artifact_file_storage','2023-02-21 14:18:26.693002'),(973,'user_tasks','0003_url_max_length','2023-02-21 14:18:26.731443'),(974,'user_tasks','0004_url_textfield','2023-02-21 14:18:26.789843'),(975,'xblock_config','0001_initial','2023-02-21 14:18:27.169784'),(976,'xblock_config','0002_courseeditltifieldsenabledflag','2023-02-21 14:18:27.179255'),(977,'xblock_config','0003_move_course_edit_lti_fields_enabled_flag_model_to_lti_consumer','2023-02-21 14:18:27.187571'),(978,'xblock_config','0001_squashed_0003_move_course_edit_lti_fields_enabled_flag_model_to_lti_consumer','2023-02-21 14:18:27.222866');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_redirect`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `old_path` varchar(200) NOT NULL,
  `new_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_redirect_site_id_old_path_ac5dd16b_uniq` (`site_id`,`old_path`),
  KEY `django_redirect_old_path_c6cc94d3` (`old_path`),
  CONSTRAINT `django_redirect_site_id_c3e37341_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_redirect`
--

LOCK TABLES `django_redirect` WRITE;
/*!40000 ALTER TABLE `django_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_name_affirmation_historicalverifiedname`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_name_affirmation_historicalverifiedname` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `verified_name` varchar(255) NOT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `verification_attempt_id` int(10) unsigned DEFAULT NULL,
  `proctored_exam_attempt_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `edx_name_affirmation_history_user_id_00f2a1d8_fk_auth_user` (`history_user_id`),
  KEY `edx_name_affirmation_historicalverifiedname_id_18379bb4` (`id`),
  KEY `edx_name_affirmation_histor_verified_name_9a18834a` (`verified_name`),
  KEY `edx_name_affirmation_historicalverifiedname_user_id_b0ad4bb5` (`user_id`),
  CONSTRAINT `edx_name_affirmation_history_user_id_00f2a1d8_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_name_affirmation_historicalverifiedname`
--

LOCK TABLES `edx_name_affirmation_historicalverifiedname` WRITE;
/*!40000 ALTER TABLE `edx_name_affirmation_historicalverifiedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_name_affirmation_historicalverifiedname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_when_contentdate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_when_contentdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `policy_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `field` varchar(255) NOT NULL,
  `block_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_when_contentdate_policy_id_location_field_a26790ec_uniq` (`policy_id`,`location`,`field`),
  KEY `edx_when_contentdate_course_id_e6c39fdc` (`course_id`),
  KEY `edx_when_contentdate_location_485206ea` (`location`),
  KEY `edx_when_contentdate_policy_id_af2bcaf4` (`policy_id`),
  KEY `edx_when_course_block_type_idx` (`course_id`,`block_type`),
  CONSTRAINT `edx_when_contentdate_policy_id_af2bcaf4_fk_edx_when_` FOREIGN KEY (`policy_id`) REFERENCES `edx_when_datepolicy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_when_contentdate`
--

LOCK TABLES `edx_when_contentdate` WRITE;
/*!40000 ALTER TABLE `edx_when_contentdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_when_contentdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_when_datepolicy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_when_datepolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `abs_date` datetime(6) DEFAULT NULL,
  `rel_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edx_when_datepolicy_abs_date_1a510cd3` (`abs_date`),
  KEY `edx_when_datepolicy_rel_date_836d6051` (`rel_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_when_datepolicy`
--

LOCK TABLES `edx_when_datepolicy` WRITE;
/*!40000 ALTER TABLE `edx_when_datepolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_when_datepolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_when_userdate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_when_userdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `abs_date` datetime(6) DEFAULT NULL,
  `rel_date` bigint(20) DEFAULT NULL,
  `reason` longtext NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `content_date_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edx_when_userdate_actor_id_cbef1cdc_fk_auth_user_id` (`actor_id`),
  KEY `edx_when_userdate_user_id_46e8cc36_fk_auth_user_id` (`user_id`),
  KEY `edx_when_userdate_content_date_id_35c5e2e2_fk_edx_when_` (`content_date_id`),
  KEY `edx_when_userdate_rel_date_954ee5b4` (`rel_date`),
  CONSTRAINT `edx_when_userdate_actor_id_cbef1cdc_fk_auth_user_id` FOREIGN KEY (`actor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `edx_when_userdate_content_date_id_35c5e2e2_fk_edx_when_` FOREIGN KEY (`content_date_id`) REFERENCES `edx_when_contentdate` (`id`),
  CONSTRAINT `edx_when_userdate_user_id_46e8cc36_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_when_userdate`
--

LOCK TABLES `edx_when_userdate` WRITE;
/*!40000 ALTER TABLE `edx_when_userdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_when_userdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_coursevideo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_coursevideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `video_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_coursevideo_course_id_video_id_ebd82f35_uniq` (`course_id`,`video_id`),
  KEY `edxval_coursevideo_video_id_85dfcf76_fk_edxval_video_id` (`video_id`),
  CONSTRAINT `edxval_coursevideo_video_id_85dfcf76_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_coursevideo`
--

LOCK TABLES `edxval_coursevideo` WRITE;
/*!40000 ALTER TABLE `edxval_coursevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_coursevideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_encodedvideo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_encodedvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `url` varchar(200) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  `profile_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edxval_encodedvideo_profile_id_d9f3e086_fk_edxval_profile_id` (`profile_id`),
  KEY `edxval_encodedvideo_video_id_d8857acb_fk_edxval_video_id` (`video_id`),
  CONSTRAINT `edxval_encodedvideo_profile_id_d9f3e086_fk_edxval_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `edxval_profile` (`id`),
  CONSTRAINT `edxval_encodedvideo_video_id_d8857acb_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_encodedvideo`
--

LOCK TABLES `edxval_encodedvideo` WRITE;
/*!40000 ALTER TABLE `edxval_encodedvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_encodedvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_profile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name` (`profile_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_profile`
--

LOCK TABLES `edxval_profile` WRITE;
/*!40000 ALTER TABLE `edxval_profile` DISABLE KEYS */;
INSERT INTO `edxval_profile` VALUES (1,'audio_mp3'),(3,'desktop_mp4'),(4,'desktop_webm'),(2,'hls'),(5,'mobile_high'),(6,'mobile_low'),(7,'youtube');
/*!40000 ALTER TABLE `edxval_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_thirdpartytranscriptcredentialsstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_thirdpartytranscriptcredentialsstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `org` varchar(32) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `has_creds` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_thirdpartytranscr_org_provider_188f7ddf_uniq` (`org`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_thirdpartytranscriptcredentialsstate`
--

LOCK TABLES `edxval_thirdpartytranscriptcredentialsstate` WRITE;
/*!40000 ALTER TABLE `edxval_thirdpartytranscriptcredentialsstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_thirdpartytranscriptcredentialsstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_transcriptpreference`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_transcriptpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `cielo24_fidelity` varchar(20) DEFAULT NULL,
  `cielo24_turnaround` varchar(20) DEFAULT NULL,
  `three_play_turnaround` varchar(20) DEFAULT NULL,
  `preferred_languages` longtext NOT NULL,
  `video_source_language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_transcriptpreference`
--

LOCK TABLES `edxval_transcriptpreference` WRITE;
/*!40000 ALTER TABLE `edxval_transcriptpreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_transcriptpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_video`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `edx_video_id` varchar(100) NOT NULL,
  `client_video_id` varchar(255) NOT NULL,
  `duration` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_video_id` (`edx_video_id`),
  KEY `edxval_video_client_video_id_2b668312` (`client_video_id`),
  KEY `edxval_video_status_5f33a104` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_video`
--

LOCK TABLES `edxval_video` WRITE;
/*!40000 ALTER TABLE `edxval_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_videoimage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_videoimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `generated_images` longtext NOT NULL,
  `course_video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_video_id` (`course_video_id`),
  CONSTRAINT `edxval_videoimage_course_video_id_06855d34_fk_edxval_co` FOREIGN KEY (`course_video_id`) REFERENCES `edxval_coursevideo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_videoimage`
--

LOCK TABLES `edxval_videoimage` WRITE;
/*!40000 ALTER TABLE `edxval_videoimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_videoimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_videotranscript`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_videotranscript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `transcript` varchar(255) DEFAULT NULL,
  `language_code` varchar(50) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `file_format` varchar(20) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_videotranscript_video_id_language_code_37532906_uniq` (`video_id`,`language_code`),
  KEY `edxval_videotranscript_language_code_d78ce3d1` (`language_code`),
  KEY `edxval_videotranscript_file_format_3adddaf7` (`file_format`),
  CONSTRAINT `edxval_videotranscript_video_id_6ffdfb56_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_videotranscript`
--

LOCK TABLES `edxval_videotranscript` WRITE;
/*!40000 ALTER TABLE `edxval_videotranscript` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_videotranscript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_country`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_country`
--

LOCK TABLES `embargo_country` WRITE;
/*!40000 ALTER TABLE `embargo_country` DISABLE KEYS */;
INSERT INTO `embargo_country` VALUES (6,'AD'),(235,'AE'),(1,'AF'),(10,'AG'),(8,'AI'),(3,'AL'),(12,'AM'),(7,'AO'),(9,'AQ'),(11,'AR'),(5,'AS'),(15,'AT'),(14,'AU'),(13,'AW'),(2,'AX'),(16,'AZ'),(29,'BA'),(20,'BB'),(19,'BD'),(22,'BE'),(36,'BF'),(35,'BG'),(18,'BH'),(37,'BI'),(24,'BJ'),(186,'BL'),(25,'BM'),(34,'BN'),(27,'BO'),(28,'BQ'),(32,'BR'),(17,'BS'),(26,'BT'),(31,'BV'),(30,'BW'),(21,'BY'),(23,'BZ'),(41,'CA'),(48,'CC'),(52,'CD'),(43,'CF'),(51,'CG'),(217,'CH'),(55,'CI'),(53,'CK'),(45,'CL'),(40,'CM'),(46,'CN'),(49,'CO'),(54,'CR'),(57,'CU'),(38,'CV'),(58,'CW'),(47,'CX'),(59,'CY'),(60,'CZ'),(84,'DE'),(62,'DJ'),(61,'DK'),(63,'DM'),(64,'DO'),(4,'DZ'),(65,'EC'),(70,'EE'),(66,'EG'),(247,'EH'),(69,'ER'),(211,'ES'),(72,'ET'),(76,'FI'),(75,'FJ'),(73,'FK'),(144,'FM'),(74,'FO'),(77,'FR'),(81,'GA'),(236,'GB'),(89,'GD'),(83,'GE'),(78,'GF'),(93,'GG'),(85,'GH'),(86,'GI'),(88,'GL'),(82,'GM'),(94,'GN'),(90,'GP'),(68,'GQ'),(87,'GR'),(208,'GS'),(92,'GT'),(91,'GU'),(95,'GW'),(96,'GY'),(101,'HK'),(98,'HM'),(100,'HN'),(56,'HR'),(97,'HT'),(102,'HU'),(105,'ID'),(108,'IE'),(110,'IL'),(109,'IM'),(104,'IN'),(33,'IO'),(107,'IQ'),(106,'IR'),(103,'IS'),(111,'IT'),(114,'JE'),(112,'JM'),(115,'JO'),(113,'JP'),(117,'KE'),(121,'KG'),(39,'KH'),(118,'KI'),(50,'KM'),(188,'KN'),(164,'KP'),(209,'KR'),(120,'KW'),(42,'KY'),(116,'KZ'),(122,'LA'),(124,'LB'),(189,'LC'),(128,'LI'),(212,'LK'),(126,'LR'),(125,'LS'),(129,'LT'),(130,'LU'),(123,'LV'),(127,'LY'),(150,'MA'),(146,'MC'),(145,'MD'),(148,'ME'),(190,'MF'),(132,'MG'),(138,'MH'),(165,'MK'),(136,'ML'),(152,'MM'),(147,'MN'),(131,'MO'),(166,'MP'),(139,'MQ'),(140,'MR'),(149,'MS'),(137,'MT'),(141,'MU'),(135,'MV'),(133,'MW'),(143,'MX'),(134,'MY'),(151,'MZ'),(153,'NA'),(157,'NC'),(160,'NE'),(163,'NF'),(161,'NG'),(159,'NI'),(156,'NL'),(167,'NO'),(155,'NP'),(154,'NR'),(162,'NU'),(158,'NZ'),(168,'OM'),(172,'PA'),(175,'PE'),(79,'PF'),(173,'PG'),(176,'PH'),(169,'PK'),(178,'PL'),(191,'PM'),(177,'PN'),(180,'PR'),(171,'PS'),(179,'PT'),(170,'PW'),(174,'PY'),(181,'QA'),(182,'RE'),(183,'RO'),(198,'RS'),(184,'RU'),(185,'RW'),(196,'SA'),(205,'SB'),(199,'SC'),(213,'SD'),(216,'SE'),(201,'SG'),(187,'SH'),(204,'SI'),(215,'SJ'),(203,'SK'),(200,'SL'),(194,'SM'),(197,'SN'),(206,'SO'),(214,'SR'),(210,'SS'),(195,'ST'),(67,'SV'),(202,'SX'),(218,'SY'),(71,'SZ'),(231,'TC'),(44,'TD'),(80,'TF'),(224,'TG'),(222,'TH'),(220,'TJ'),(225,'TK'),(223,'TL'),(230,'TM'),(228,'TN'),(226,'TO'),(229,'TR'),(227,'TT'),(232,'TV'),(219,'TW'),(221,'TZ'),(234,'UA'),(233,'UG'),(237,'UM'),(238,'US'),(239,'UY'),(240,'UZ'),(99,'VA'),(192,'VC'),(242,'VE'),(244,'VG'),(245,'VI'),(243,'VN'),(241,'VU'),(246,'WF'),(193,'WS'),(119,'XK'),(248,'YE'),(142,'YT'),(207,'ZA'),(249,'ZM'),(250,'ZW');
/*!40000 ALTER TABLE `embargo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_countryaccessrule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_countryaccessrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `restricted_course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `embargo_countryaccessrul_restricted_course_id_cou_477b6bb1_uniq` (`restricted_course_id`,`country_id`),
  KEY `embargo_countryacces_country_id_6af33e89_fk_embargo_c` (`country_id`),
  CONSTRAINT `embargo_countryacces_country_id_6af33e89_fk_embargo_c` FOREIGN KEY (`country_id`) REFERENCES `embargo_country` (`id`),
  CONSTRAINT `embargo_countryacces_restricted_course_id_eedb3d21_fk_embargo_r` FOREIGN KEY (`restricted_course_id`) REFERENCES `embargo_restrictedcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_countryaccessrule`
--

LOCK TABLES `embargo_countryaccessrule` WRITE;
/*!40000 ALTER TABLE `embargo_countryaccessrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_countryaccessrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_courseaccessrulehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_courseaccessrulehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `snapshot` longtext,
  PRIMARY KEY (`id`),
  KEY `embargo_courseaccessrulehistory_timestamp_0267f0e6` (`timestamp`),
  KEY `embargo_courseaccessrulehistory_course_key_6f7a7a06` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_courseaccessrulehistory`
--

LOCK TABLES `embargo_courseaccessrulehistory` WRITE;
/*!40000 ALTER TABLE `embargo_courseaccessrulehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_courseaccessrulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_embargoedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_embargoedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `embargoed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_embargoedcourse`
--

LOCK TABLES `embargo_embargoedcourse` WRITE;
/*!40000 ALTER TABLE `embargo_embargoedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_embargoedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_embargoedstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_embargoedstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `embargoed_countries` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `embargo_embargoedstate_changed_by_id_f7763260_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `embargo_embargoedstate_changed_by_id_f7763260_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_embargoedstate`
--

LOCK TABLES `embargo_embargoedstate` WRITE;
/*!40000 ALTER TABLE `embargo_embargoedstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_embargoedstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_ipfilter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_ipfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `whitelist` longtext NOT NULL,
  `blacklist` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `embargo_ipfilter_changed_by_id_39e4eed2_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `embargo_ipfilter_changed_by_id_39e4eed2_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_ipfilter`
--

LOCK TABLES `embargo_ipfilter` WRITE;
/*!40000 ALTER TABLE `embargo_ipfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_ipfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_restrictedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_restrictedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enroll_msg_key` varchar(255) NOT NULL,
  `access_msg_key` varchar(255) NOT NULL,
  `disable_access_check` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_restrictedcourse`
--

LOCK TABLES `embargo_restrictedcourse` WRITE;
/*!40000 ALTER TABLE `embargo_restrictedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_restrictedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `text` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotification`
--

LOCK TABLES `enterprise_adminnotification` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotification_admin_notification_filter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotification_admin_notification_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminnotification_id` int(11) NOT NULL,
  `adminnotificationfilter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_adminnotifica_adminnotification_id_adm_d4f4da63_uniq` (`adminnotification_id`,`adminnotificationfilter_id`),
  KEY `enterprise_adminnoti_adminnotificationfil_276acc56_fk_enterpris` (`adminnotificationfilter_id`),
  CONSTRAINT `enterprise_adminnoti_adminnotification_id_6ab95bff_fk_enterpris` FOREIGN KEY (`adminnotification_id`) REFERENCES `enterprise_adminnotification` (`id`),
  CONSTRAINT `enterprise_adminnoti_adminnotificationfil_276acc56_fk_enterpris` FOREIGN KEY (`adminnotificationfilter_id`) REFERENCES `enterprise_adminnotificationfilter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotification_admin_notification_filter`
--

LOCK TABLES `enterprise_adminnotification_admin_notification_filter` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotification_admin_notification_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotification_admin_notification_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotificationfilter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotificationfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `filter` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotificationfilter`
--

LOCK TABLES `enterprise_adminnotificationfilter` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotificationfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotificationfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotificationread`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotificationread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `admin_notification_id` int(11) NOT NULL,
  `enterprise_customer_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_adminnotifica_enterprise_customer_user_767d1bcc_uniq` (`enterprise_customer_user_id`,`admin_notification_id`),
  KEY `enterprise_adminnoti_admin_notification_i_77267771_fk_enterpris` (`admin_notification_id`),
  CONSTRAINT `enterprise_adminnoti_admin_notification_i_77267771_fk_enterpris` FOREIGN KEY (`admin_notification_id`) REFERENCES `enterprise_adminnotification` (`id`),
  CONSTRAINT `enterprise_adminnoti_enterprise_customer__4a67a03f_fk_enterpris` FOREIGN KEY (`enterprise_customer_user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotificationread`
--

LOCK TABLES `enterprise_adminnotificationread` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotificationread` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotificationread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_bulkcatalogqueryupdatecommandconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_bulkcatalogqueryupdatecommandconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_bulkcatal_changed_by_id_accb978f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `enterprise_bulkcatal_changed_by_id_accb978f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_bulkcatalogqueryupdatecommandconfiguration`
--

LOCK TABLES `enterprise_bulkcatalogqueryupdatecommandconfiguration` WRITE;
/*!40000 ALTER TABLE `enterprise_bulkcatalogqueryupdatecommandconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_bulkcatalogqueryupdatecommandconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enrollmentnotificationemailtemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enrollmentnotificationemailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plaintext_template` longtext NOT NULL,
  `html_template` longtext NOT NULL,
  `subject_line` varchar(100) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `template_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enrollmen_enterprise_customer__df17d9ff_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enrollmentnotificationemailtemplate`
--

LOCK TABLES `enterprise_enrollmentnotificationemailtemplate` WRITE;
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` DISABLE KEYS */;
INSERT INTO `enterprise_enrollmentnotificationemailtemplate` VALUES (1,'2023-02-21 13:26:14.814149','2023-02-21 13:26:14.814149','\n        {% load i18n %}{% if user_name %}{% blocktrans %}Dear {{ user_name }},{% endblocktrans %}{% else %}{% blocktrans %}Hi!{% endblocktrans %}{% endif %}\n        {% if enrolled_in.type == \"program\" %}\n        {% blocktrans with program_url=enrolled_in.url program_name=enrolled_in.name program_branding=enrolled_in.branding start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in {{ program_name }}, a {{ program_branding }} program offered by {{ organization_name }}. This program begins {{ start_date }}. For more information, see the following link:\n\n        {{ program_url }}{% endblocktrans %}{% else %}\n        {% blocktrans with course_url=enrolled_in.url course_name=enrolled_in.name start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in {{ course_name }}, a course offered by {{ organization_name }}. This course begins {{ start_date }}. For more information, see the following link:\n\n        {{ course_url }}{% endblocktrans %}{% endif %}\n        {% blocktrans with enrolled_in_name=enrolled_in.name %}\n        Thanks,\n\n        The {{enrolled_in_name}} team{% endblocktrans %}\n        ','\n        {% load i18n %}<html>\n        <body>\n        <p>{% if user_name %}{% blocktrans %}Dear {{ user_name }},{% endblocktrans %}{% else %}{% blocktrans %}Hi!{% endblocktrans %}{% endif %}</p>\n        <p>{% if enrolled_in.type == \"program\" %}\n        {% blocktrans with program_url=enrolled_in.url program_name=enrolled_in.name program_branding=enrolled_in.branding start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in <a href=\"{{ program_url }}\">{{ program_name }}</a>, a {{ program_branding }} program offered by {{ organization_name }}. This program begins {{ start_date }}. For more information, see <a href=\"{{ program_url }}\">{{ program_name }}</a>.{% endblocktrans %}{% else %}\n        {% blocktrans with course_url=enrolled_in.url course_name=enrolled_in.name start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in <a href=\"{{ course_url }}\">{{ course_name }}</a>, a course offered by {{ organization_name }}. This course begins {{ start_date }}. For more information, see <a href=\"{{ course_url }}\">{{ course_name }}</a>.{% endblocktrans %}{% endif %}\n        </p>\n        {% blocktrans with enrolled_in_name=enrolled_in.name %}<p>\n        Thanks,\n        </p>\n        <p>\n        The {{enrolled_in_name}} team\n        </p>{% endblocktrans %}\n        </body>\n        </html>','',NULL,'SELF_ENROLL'),(2,'2023-02-21 13:26:14.819248','2023-02-21 13:26:15.724587','\n        Great News! You\'ve been enrolled in {{enrolled_in.name}} by {{organization_name}}\n\n        This course is a free benefit offered especially for you, and we are excited for you to meet your learning community on edX.\n\n        Visit this link to see and enroll in your course, {{enrolled_in.url}}\n\n        The {{enrolled_in.name}} team\n        ','\n<html>\n<head>\n    <style type=\"text/css\">\n        a, a:visited, a:hover, a:active {\n            text-decoration: none;\n            color: #00262b;\n        }\n    </style>\n</head>\n<body>\n    <table style=\"max-width: 650;\" align=\"center\">\n        <tbody>\n            <tr>\n            <td>\n                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"left\" valign=\"top\" style=\"padding:8px;Margin:0;width:560px\">\n                            <img src=\"https://ci3.googleusercontent.com/proxy/ZAml-YgIIJEht-OBl6GqLNIUeVKLyPvs_ldFo9FShp-andj1YQxvliJXv_s_Tmh6cg1-5avJJmvXmzxbQp06sB_WUeYYkN9kzV6jtVUvYKPPjUX_8_iFJAZqsNqYakl4nQyHnl0dClFzxiaLuULSPoqGPLBfJmNOEXIBYkvKYa95640xvHwDiQ22bZ16=s0-d-e1-ft#https://appboy-images.com/appboy/communication/assets/image_assets/images/5fc568622213594dcbda2623/original.png?1606772834\" width=\"110\" height=\"57\" border=\"0\" style=\"display:block\" alt=\"edX\" id=\"m_-37988256656304111logo\" class=\"CToWUd\">\n                        </td>\n                        <td align=\"right\" valign=\"top\" style=\"white-space:nowrap;text-decoration:none;color:#00262b;font-family:\'inter\',Arial,sans-serif;font-size:18px;line-height:21px\">\n                            <a href=\"{{dashboard_url}}\">My Dashboard</a> \n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td align=\"left\" bgcolor=\"#002b2b\" style=\"Margin:0;padding-left:20px;padding-right:20px;padding-top:40px;padding-bottom:40px;background-color:#002b2b;background-image:url(https://ci3.googleusercontent.com/proxy/2CLnc9QL2u1L0MsUErVcQVBOz6OlDew2A5O8umOI9v7PGI3ip8YnJqYPRcexkjGsbNvNa6kUFyuHAMp7LlVBKKa7bxaKUjEO566AyX4M_6PhDtwz-QpLXLg9eQZQ93LIwP-5SbUtfxd203xXFTVBatJrN9P2hsuJSWFwd9k2pooiea6Qsg=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/53481614126118338.png);background-repeat:no-repeat;background-position:left top\" background=\"https://ci3.googleusercontent.com/proxy/2CLnc9QL2u1L0MsUErVcQVBOz6OlDew2A5O8umOI9v7PGI3ip8YnJqYPRcexkjGsbNvNa6kUFyuHAMp7LlVBKKa7bxaKUjEO566AyX4M_6PhDtwz-QpLXLg9eQZQ93LIwP-5SbUtfxd203xXFTVBatJrN9P2hsuJSWFwd9k2pooiea6Qsg=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/53481614126118338.png\">\n                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:560px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0\">\n                                        <p style=\"Margin:0;font-size:32px;font-family:helvetica,\'helvetica neue\',arial,verdana,sans-serif;line-height:48px;color:#ffffff\"><strong><span class=\"il\">Congratulations</span>, Restless Learner</strong></p>\n                                    </td>\n                                    </tr>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0\">\n                                        <p style=\"Margin:0;font-size:20px;font-family:arial,\'helvetica neue\',helvetica,sans-serif;line-height:30px;color:#ffffff\">Great News! You\'ve been <span class=\"il\">Enrolled</span> in {{enrolled_in.name}} by {{organization_name}}</p>\n                                    </td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px\">\n                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:560px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0\">\n                                        <p style=\"Margin:0;font-size:14px;font-family:arial,\'helvetica neue\',helvetica,sans-serif;line-height:21px;color:#333333\">\n                                            This course is a free benefit offered especially for you, and we are excited for you to meet your learning community on edX.\n                                        </p>\n                                    </td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td>\n                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding:0;Margin:0;padding-top:10px;padding-left:10px;padding-bottom:15px\"><span class=\"m_-37988256656304111es-button-border\" style=\"border-style:solid;border-color:#d03529;background:#d03529;border-width:0px 0px 2px 0px;display:inline-block;border-radius:0px;width:auto\"><a href=\"{{enrolled_in.url}}\" class=\"m_-37988256656304111es-button\" style=\"text-decoration:none;font-family:helvetica,\'helvetica neue\',arial,verdana,sans-serif;font-size:18px;color:#ffffff;border-style:solid;border-color:#d03529;border-width:10px 15px;display:inline-block;background:#d03529;border-radius:0px;font-weight:normal;font-style:normal;line-height:22px;width:auto;text-align:center\" target=\"_blank\">Start my course</a></span></td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding:20px;Margin:0;background-color:#ffffff\">\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px;\">\n                    <tbody>\n                        <tr>\n                        <td class=\"m_-37988256656304111es-m-p0r\" align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://www.facebook.com/edX\"><img src=\"https://ci3.googleusercontent.com/proxy/2EBI4EepyVUk0cIRxzfMGmsBqU6TKjJsw7CqB8hSM0zRlLb0-BL0Y_JXhu-E6b1DiMGQ-4NHHem0qkjDgG_0xHNTYSsmJ0Rv9qBXCj2SJyT-yFlrkA7SYr4YkGg8CdkRYlkwZsQzU0DiZIDWZopRyOkPvcHWVTLwzCdJMKZcFc57HfR-eQ=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/71001614127047298.png\" alt=\"facebook logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px;\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://twitter.com/edXOnline\"><img src=\"https://ci4.googleusercontent.com/proxy/yPnmVX7UE9sXw9LbZmrtTLvkrZVy9NJurDVqU6aByY871Dj0GMzEmJZOQm5kTImdMT_qNIIvpVpTpTpboYZB6wPyZuOUKwd49j6Q7yTB9IM0DWSMdldQ4XiOHReWms7Mw7HL9rRGk1iRLwmx0IT5frUGIcmc4ulwvQcjBFSHUBcMBDrAvQ=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/19131614127052508.png\" alt=\"twitter logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://www.linkedin.com/school/edx/\"><img src=\"https://ci6.googleusercontent.com/proxy/GT773Vs37lIPuUvoTpVMvtQ8sSuiC9sGLGtWGNti6nwmrZGrcewvoO_zFG4XJadUV-xPRYqf9zbLEshuVcSQMZiI1yUuM5VKxTF9lLfuzDWV1ZbMPEpk2cAWEZcDAW8mD3VFxY5l0y1Gxvcc_2bB4L-ApvPHnnIw7rXB_XDe1o37B4xPaA=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/42721614127058646.png\" alt=\"linkedin logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://www.reddit.com/r/edX/\"><img src=\"https://ci6.googleusercontent.com/proxy/hVT_30jYZguhmOyUAcTTZhCNDjjlivo3GAljGnyt_nNnjp0A0zcheoKw-XgM2NSD7M-CemzJEui6RIte_cH0YyJXUwCJWFpZ6j96QCB3T2UeQddtN1_VrVyQoDnAR1G82cHdJnq6Ysc-KQPvBKngjYaaPYSvcvMuHR0QS7dcnlGK35dUlA=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/23371614127063365.png\" alt=\"reddit logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px;\">\n                    <tbody>\n                        <tr>\n                        <td align=\"left\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://api.whatsapp.com/send?text=edX\"><img src=\"https://ci4.googleusercontent.com/proxy/9UmWL708u3GDWbf_b3dzLoavIieL1kLHnipq6vGF06ZpMlLEQe9WkHJZsNVHfBwYZhpp71tbA8EJgf2_mhGV2RwDBIiUox83T4sP6uZKF3rw6QGEtQY2Ou16eR6v39Quf2AHsnh78t6JK6PMqlxGVSVKB2WkmUX37_2jtgfIqVtOLlV1bw=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/18781614127069989.png\" alt=\"whatsapp logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td>\n                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                    <tbody>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td align=\"left\" valign=\"top\"><a href=\"https://business.edx.org\" style=\"font-family:\'Open Sans\',Arial,sans-serif;font-size:14px;line-height:17px;text-decoration:none;color:#707070\" target=\"_blank\"><span style=\"color:#00262b\">edX for Business</span><span style=\"color:#707070\"> — eLearning Solutions for Your Company</span></a></td>\n                        </tr>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td align=\"left\" style=\"font-family:\'Open Sans\',Arial,sans-serif;color:#707070;font-size:14px;line-height:17px\" valign=\"top\">© 2021 edX Inc. All rights reserved.</td>\n                        </tr>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td align=\"left\" style=\"font-family:\'Open Sans\',Arial,sans-serif;color:#707070;font-size:14px;line-height:17px\" valign=\"top\">141 Portland St. 9th Floor, Cambridge, MA 02139</td>\n                        </tr>\n                        <tr>\n                        <td height=\"30\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n        </tbody>\n    </table>\n</body>\n</html>\n         ','',NULL,'ADMIN_ENROLL');
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecatalogquery`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecatalogquery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_filter` longtext,
  `uuid` char(32) NOT NULL,
  `include_exec_ed_2u_courses` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecatalogquery_uuid_4fdf5c5a_uniq` (`uuid`),
  UNIQUE KEY `enterprise_enterprisecatalogquery_title_7a5a0a9d_uniq` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecatalogquery`
--

LOCK TABLES `enterprise_enterprisecatalogquery` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecatalogquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecatalogquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecourseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `enterprise_customer_user_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `saved_for_later` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecou_enterprise_customer_user_71fe301a_uniq` (`enterprise_customer_user_id`,`course_id`),
  KEY `enterprise_enterpris_source_id_c347bfa6_fk_enterpris` (`source_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__cf423e59_fk_enterpris` FOREIGN KEY (`enterprise_customer_user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`),
  CONSTRAINT `enterprise_enterpris_source_id_c347bfa6_fk_enterpris` FOREIGN KEY (`source_id`) REFERENCES `enterprise_enterpriseenrollmentsource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecourseenrollment`
--

LOCK TABLES `enterprise_enterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomer` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `hide_course_original_price` tinyint(1) NOT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `replace_sensitive_sso_username` tinyint(1) NOT NULL,
  `enable_autocohorting` tinyint(1) NOT NULL,
  `enable_portal_code_management_screen` tinyint(1) NOT NULL,
  `enable_portal_reporting_config_screen` tinyint(1) NOT NULL,
  `enable_portal_subscription_management_screen` tinyint(1) NOT NULL,
  `enable_learner_portal` tinyint(1) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `customer_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `enable_slug_login` tinyint(1) NOT NULL,
  `enable_portal_saml_configuration_screen` tinyint(1) NOT NULL,
  `default_contract_discount` decimal(8,5) DEFAULT NULL,
  `enable_analytics_screen` tinyint(1) NOT NULL,
  `enable_integrated_customer_learner_portal_search` tinyint(1) NOT NULL,
  `default_language` varchar(25) DEFAULT NULL,
  `enable_portal_lms_configurations_screen` tinyint(1) NOT NULL,
  `sender_alias` varchar(255) DEFAULT NULL,
  `reply_to` varchar(254) DEFAULT NULL,
  `hide_labor_market_data` tinyint(1) NOT NULL,
  `enable_universal_link` tinyint(1) NOT NULL,
  `enable_browse_and_request` tinyint(1) NOT NULL,
  `enable_learner_portal_offers` tinyint(1) NOT NULL,
  `enable_portal_learner_credit_management_screen` tinyint(1) NOT NULL,
  `enable_executive_education_2U_fulfillment` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enterprise_enterpris_customer_type_id_4b1ee315_fk_enterpris` (`customer_type_id`),
  KEY `enterprise_enterprisecustomer_site_id_947ed084_fk_django_site_id` (`site_id`),
  CONSTRAINT `enterprise_enterpris_customer_type_id_4b1ee315_fk_enterpris` FOREIGN KEY (`customer_type_id`) REFERENCES `enterprise_enterprisecustomertype` (`id`),
  CONSTRAINT `enterprise_enterprisecustomer_site_id_947ed084_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomer`
--

LOCK TABLES `enterprise_enterprisecustomer` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerbrandingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerbrandingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `primary_color` varchar(7) DEFAULT NULL,
  `secondary_color` varchar(7) DEFAULT NULL,
  `tertiary_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__09c1ee14_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerbrandingconfiguration`
--

LOCK TABLES `enterprise_enterprisecustomerbrandingconfiguration` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerbrandingconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerbrandingconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomercatalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomercatalog` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_filter` longtext,
  `enabled_course_modes` longtext NOT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  `enterprise_catalog_query_id` int(11) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `enterprise_enterpris_enterprise_catalog_q_aa53eb7d_fk_enterpris` (`enterprise_catalog_query_id`),
  KEY `enterprise_enterpris_enterprise_customer__3b4660ad_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_catalog_q_aa53eb7d_fk_enterpris` FOREIGN KEY (`enterprise_catalog_query_id`) REFERENCES `enterprise_enterprisecatalogquery` (`id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__3b4660ad_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomercatalog`
--

LOCK TABLES `enterprise_enterprisecustomercatalog` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomercatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomercatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomeridentityprovider`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomeridentityprovider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `provider_id` varchar(50) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `default_provider` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`),
  KEY `enterprise_enterprisecustom_enterprise_customer_id_40b39097` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__40b39097_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomeridentityprovider`
--

LOCK TABLES `enterprise_enterprisecustomeridentityprovider` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeridentityprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeridentityprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerinvitekey`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerinvitekey` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `uuid` char(32) NOT NULL,
  `usage_limit` int(10) unsigned NOT NULL,
  `expiration_date` datetime(6) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `enterprise_enterpris_enterprise_customer__2d339ecc_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__2d339ecc_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerinvitekey`
--

LOCK TABLES `enterprise_enterprisecustomerinvitekey` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerinvitekey` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerinvitekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerreportingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerreportingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `include_date` tinyint(1) NOT NULL,
  `delivery_method` varchar(20) NOT NULL,
  `pgp_encryption_key` longtext,
  `data_type` varchar(20) NOT NULL,
  `report_type` varchar(20) NOT NULL,
  `email` longtext NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `day_of_month` smallint(6) DEFAULT NULL,
  `day_of_week` smallint(6) DEFAULT NULL,
  `hour_of_day` smallint(6) NOT NULL,
  `decrypted_password` longblob,
  `sftp_hostname` varchar(256) DEFAULT NULL,
  `sftp_port` int(10) unsigned DEFAULT NULL,
  `sftp_username` varchar(256) DEFAULT NULL,
  `decrypted_sftp_password` longblob,
  `sftp_file_path` varchar(256) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `enable_compression` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `enterprise_enterpris_enterprise_customer__d5b55543_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__d5b55543_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerreportingconfiguration`
--

LOCK TABLES `enterprise_enterprisecustomerreportingconfiguration` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerreportingconfiguration_enterpricf00`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprisecustomerreportingconfiguration_id` int(11) NOT NULL,
  `enterprisecustomercatalog_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecus_enterprisecustomerreport_cc87ab4c_uniq` (`enterprisecustomerreportingconfiguration_id`,`enterprisecustomercatalog_id`),
  KEY `enterprise_enterpris_enterprisecustomerca_ebdae525_fk_enterpris` (`enterprisecustomercatalog_id`),
  CONSTRAINT `enterprise_enterpris_enterprisecustomerca_ebdae525_fk_enterpris` FOREIGN KEY (`enterprisecustomercatalog_id`) REFERENCES `enterprise_enterprisecustomercatalog` (`uuid`),
  CONSTRAINT `enterprise_enterpris_enterprisecustomerre_66147101_fk_enterpris` FOREIGN KEY (`enterprisecustomerreportingconfiguration_id`) REFERENCES `enterprise_enterprisecustomerreportingconfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerreportingconfiguration_enterpricf00`
--

LOCK TABLES `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomertype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomertype`
--

LOCK TABLES `enterprise_enterprisecustomertype` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomertype` DISABLE KEYS */;
INSERT INTO `enterprise_enterprisecustomertype` VALUES (1,'2023-02-21 13:26:04.298519','2023-02-21 13:26:04.298519','Enterprise');
/*!40000 ALTER TABLE `enterprise_enterprisecustomertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomeruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `linked` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `invite_key_id` char(32) DEFAULT NULL,
  `should_inactivate_other_customers` tinyint(1) NOT NULL,
  `is_relinkable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecus_enterprise_customer_id_u_ffddc29f_uniq` (`enterprise_customer_id`,`user_id`),
  KEY `enterprise_enterprisecustomeruser_user_id_aa8d772f` (`user_id`),
  KEY `enterprise_enterpris_invite_key_id_41c8641f_fk_enterpris` (`invite_key_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__f0fea924_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`),
  CONSTRAINT `enterprise_enterpris_invite_key_id_41c8641f_fk_enterpris` FOREIGN KEY (`invite_key_id`) REFERENCES `enterprise_enterprisecustomerinvitekey` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomeruser`
--

LOCK TABLES `enterprise_enterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterpriseenrollmentsource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterpriseenrollmentsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterpriseenrollmentsource`
--

LOCK TABLES `enterprise_enterpriseenrollmentsource` WRITE;
/*!40000 ALTER TABLE `enterprise_enterpriseenrollmentsource` DISABLE KEYS */;
INSERT INTO `enterprise_enterpriseenrollmentsource` VALUES (1,'2023-02-21 13:26:05.071551','2023-02-21 13:26:05.071551','Manual Enterprise Enrollment','manual'),(2,'2023-02-21 13:26:05.076859','2023-02-21 13:26:05.076859','Enterprise API Enrollment','enterprise_api'),(3,'2023-02-21 13:26:05.083123','2023-02-21 13:26:05.083123','Enterprise Enrollment URL','enrollment_url'),(4,'2023-02-21 13:26:05.085828','2023-02-21 13:26:05.085828','Enterprise Offer Redemption','offer_redemption'),(5,'2023-02-21 13:26:05.089048','2023-02-21 13:26:05.089048','Enterprise User Enrollment Background Task','enrollment_task'),(6,'2023-02-21 13:26:05.092349','2023-02-21 13:26:05.092349','Enterprise management command enrollment','management_command'),(7,'2023-02-21 13:26:16.080455','2023-02-21 13:26:16.080455','Customer Admin Enrollment','customer_admin');
/*!40000 ALTER TABLE `enterprise_enterpriseenrollmentsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisefeaturerole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisefeaturerole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisefeaturerole`
--

LOCK TABLES `enterprise_enterprisefeaturerole` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisefeaturerole` DISABLE KEYS */;
INSERT INTO `enterprise_enterprisefeaturerole` VALUES (1,'2023-02-21 13:26:04.941346','2023-02-21 13:26:04.941346','catalog_admin',NULL),(2,'2023-02-21 13:26:04.944783','2023-02-21 13:26:04.944783','dashboard_admin',NULL),(3,'2023-02-21 13:26:04.952356','2023-02-21 13:26:04.952356','enrollment_api_admin',NULL),(4,'2023-02-21 13:26:04.957911','2023-02-21 13:26:04.957911','reporting_config_admin',NULL);
/*!40000 ALTER TABLE `enterprise_enterprisefeaturerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisefeatureuserroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisefeatureuserroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_enterpris_role_id_5e8cff42_fk_enterpris` (`role_id`),
  KEY `enterprise_enterpris_user_id_2d335bd4_fk_auth_user` (`user_id`),
  CONSTRAINT `enterprise_enterpris_role_id_5e8cff42_fk_enterpris` FOREIGN KEY (`role_id`) REFERENCES `enterprise_enterprisefeaturerole` (`id`),
  CONSTRAINT `enterprise_enterpris_user_id_2d335bd4_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisefeatureuserroleassignment`
--

LOCK TABLES `enterprise_enterprisefeatureuserroleassignment` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisefeatureuserroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisefeatureuserroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenrollmentnotificationemailtemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenrollmentnotificationemailtemplate` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plaintext_template` longtext NOT NULL,
  `html_template` longtext NOT NULL,
  `subject_line` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `template_type` varchar(255) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_f2a6d605_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenroll_id_d4b3fed2` (`id`),
  KEY `enterprise_historicalenroll_enterprise_customer_id_bc826535` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_f2a6d605_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenrollmentnotificationemailtemplate`
--

LOCK TABLES `enterprise_historicalenrollmentnotificationemailtemplate` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenrollmentnotificationemailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenrollmentnotificationemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecourseenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_user_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `saved_for_later` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_a7d84786_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecourseenrollment_id_452a4b04` (`id`),
  KEY `enterprise_historicalenterp_enterprise_customer_user_id_380ecc4e` (`enterprise_customer_user_id`),
  KEY `enterprise_historicalenterp_source_id_015c9e9c` (`source_id`),
  CONSTRAINT `enterprise_historica_history_user_id_a7d84786_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecourseenrollment`
--

LOCK TABLES `enterprise_historicalenterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomer` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `hide_course_original_price` tinyint(1) NOT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `replace_sensitive_sso_username` tinyint(1) NOT NULL,
  `enable_autocohorting` tinyint(1) NOT NULL,
  `enable_portal_code_management_screen` tinyint(1) NOT NULL,
  `enable_portal_reporting_config_screen` tinyint(1) NOT NULL,
  `enable_portal_subscription_management_screen` tinyint(1) NOT NULL,
  `enable_learner_portal` tinyint(1) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `customer_type_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `enable_slug_login` tinyint(1) NOT NULL,
  `enable_portal_saml_configuration_screen` tinyint(1) NOT NULL,
  `default_contract_discount` decimal(8,5) DEFAULT NULL,
  `enable_analytics_screen` tinyint(1) NOT NULL,
  `enable_integrated_customer_learner_portal_search` tinyint(1) NOT NULL,
  `default_language` varchar(25) DEFAULT NULL,
  `enable_portal_lms_configurations_screen` tinyint(1) NOT NULL,
  `sender_alias` varchar(255) DEFAULT NULL,
  `reply_to` varchar(254) DEFAULT NULL,
  `hide_labor_market_data` tinyint(1) NOT NULL,
  `enable_universal_link` tinyint(1) NOT NULL,
  `enable_browse_and_request` tinyint(1) NOT NULL,
  `enable_learner_portal_offers` tinyint(1) NOT NULL,
  `enable_portal_learner_credit_management_screen` tinyint(1) NOT NULL,
  `enable_executive_education_2U_fulfillment` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_bbd9b0d6_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomer_uuid_75c3528e` (`uuid`),
  KEY `enterprise_historicalenterprisecustomer_slug_04622dd4` (`slug`),
  KEY `enterprise_historicalenterp_customer_type_id_8fbc8526` (`customer_type_id`),
  KEY `enterprise_historicalenterprisecustomer_site_id_2463b5d7` (`site_id`),
  CONSTRAINT `enterprise_historica_history_user_id_bbd9b0d6_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomer`
--

LOCK TABLES `enterprise_historicalenterprisecustomer` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomercatalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomercatalog` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_filter` longtext,
  `enabled_course_modes` longtext NOT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_catalog_query_id` int(11) DEFAULT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_31eab231_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomercatalog_uuid_42403101` (`uuid`),
  KEY `enterprise_historicalenterp_enterprise_catalog_query_id_bf435a3a` (`enterprise_catalog_query_id`),
  KEY `enterprise_historicalenterp_enterprise_customer_id_664f4480` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_31eab231_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomercatalog`
--

LOCK TABLES `enterprise_historicalenterprisecustomercatalog` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomercatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomercatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomerinvitekey`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomerinvitekey` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `uuid` char(32) NOT NULL,
  `usage_limit` int(10) unsigned NOT NULL,
  `expiration_date` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_b0abba8d_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomerinvitekey_uuid_3e79330b` (`uuid`),
  KEY `enterprise_historicalenterp_enterprise_customer_id_808a040d` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_b0abba8d_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomerinvitekey`
--

LOCK TABLES `enterprise_historicalenterprisecustomerinvitekey` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomerinvitekey` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomerinvitekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomeruser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `linked` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `invite_key_id` char(32) DEFAULT NULL,
  `should_inactivate_other_customers` tinyint(1) NOT NULL,
  `is_relinkable` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_22dafe08_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomeruser_id_fa66f378` (`id`),
  KEY `enterprise_historicalenterprisecustomeruser_user_id_6262547b` (`user_id`),
  KEY `enterprise_historicalenterp_enterprise_customer_id_4b5807fa` (`enterprise_customer_id`),
  KEY `enterprise_historicalenterp_invite_key_id_701be209` (`invite_key_id`),
  CONSTRAINT `enterprise_historica_history_user_id_22dafe08_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomeruser`
--

LOCK TABLES `enterprise_historicalenterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicallicensedenterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicallicensedenterprisecourseenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `license_uuid` char(32) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `is_revoked` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_1db87766_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicallicens_id_ff4cfd4f` (`id`),
  KEY `enterprise_historicallicens_enterprise_course_enrollmen_1b0d3427` (`enterprise_course_enrollment_id`),
  CONSTRAINT `enterprise_historica_history_user_id_1db87766_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicallicensedenterprisecourseenrollment`
--

LOCK TABLES `enterprise_historicallicensedenterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicallicensedenterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicallicensedenterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalpendingenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalpendingenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_mode` varchar(25) NOT NULL,
  `cohort_name` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(8,5) NOT NULL,
  `sales_force_id` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `license_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_894ad7d0_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendingenrollment_id_27077b0b` (`id`),
  KEY `enterprise_historicalpendingenrollment_source_id_3a208cd2` (`source_id`),
  KEY `enterprise_historicalpendingenrollment_user_id_97ded265` (`user_id`),
  CONSTRAINT `enterprise_historica_history_user_id_894ad7d0_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalpendingenrollment`
--

LOCK TABLES `enterprise_historicalpendingenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalpendingenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalpendingenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalpendingenterprisecustomeradminuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalpendingenterprisecustomeradminuser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_3a051cc8_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendin_id_46b9ceba` (`id`),
  KEY `enterprise_historicalpendin_enterprise_customer_id_885a7c1b` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_3a051cc8_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalpendingenterprisecustomeradminuser`
--

LOCK TABLES `enterprise_historicalpendingenterprisecustomeradminuser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeradminuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeradminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalpendingenterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalpendingenterprisecustomeruser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_c491461b_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendingenterprisecustomeruser_id_3cf88198` (`id`),
  KEY `enterprise_historicalpendin_enterprise_customer_id_6c02ed95` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_c491461b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalpendingenterprisecustomeruser`
--

LOCK TABLES `enterprise_historicalpendingenterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalsystemwideenterpriseuserroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalsystemwideenterpriseuserroleassignment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_628729af_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalsystem_id_56efe6ab` (`id`),
  KEY `enterprise_historicalsystem_enterprise_customer_id_69fcca18` (`enterprise_customer_id`),
  KEY `enterprise_historicalsystem_role_id_6931bef0` (`role_id`),
  KEY `enterprise_historicalsystem_user_id_b184c15e` (`user_id`),
  CONSTRAINT `enterprise_historica_history_user_id_628729af_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalsystemwideenterpriseuserroleassignment`
--

LOCK TABLES `enterprise_historicalsystemwideenterpriseuserroleassignment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalsystemwideenterpriseuserroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalsystemwideenterpriseuserroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_licensedenterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_licensedenterprisecourseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `license_uuid` char(32) NOT NULL,
  `enterprise_course_enrollment_id` int(11) NOT NULL,
  `is_revoked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_course_enrollment_id` (`enterprise_course_enrollment_id`),
  CONSTRAINT `enterprise_licensede_enterprise_course_en_db2f5a9f_fk_enterpris` FOREIGN KEY (`enterprise_course_enrollment_id`) REFERENCES `enterprise_enterprisecourseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_licensedenterprisecourseenrollment`
--

LOCK TABLES `enterprise_licensedenterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_licensedenterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_licensedenterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_pendingenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_pendingenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_mode` varchar(25) NOT NULL,
  `cohort_name` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(8,5) NOT NULL,
  `sales_force_id` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `license_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_pendingenrollment_user_id_course_id_6d4141c7_uniq` (`user_id`,`course_id`),
  KEY `enterprise_pendingen_source_id_7b6fed0c_fk_enterpris` (`source_id`),
  CONSTRAINT `enterprise_pendingen_source_id_7b6fed0c_fk_enterpris` FOREIGN KEY (`source_id`) REFERENCES `enterprise_enterpriseenrollmentsource` (`id`),
  CONSTRAINT `enterprise_pendingen_user_id_12d21b1a_fk_enterpris` FOREIGN KEY (`user_id`) REFERENCES `enterprise_pendingenterprisecustomeruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_pendingenrollment`
--

LOCK TABLES `enterprise_pendingenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_pendingenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_pendingenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_pendingenterprisecustomeradminuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_pendingenterprisecustomeradminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique pending admin user and EnterpriseCustomer` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise_pendingenterpris_enterprise_customer_id_aae02661` (`enterprise_customer_id`),
  KEY `enterprise__user_em_fead22_idx` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise__user_em_6e1f5b_idx` (`user_email`),
  CONSTRAINT `enterprise_pendingen_enterprise_customer__aae02661_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_pendingenterprisecustomeradminuser`
--

LOCK TABLES `enterprise_pendingenterprisecustomeradminuser` WRITE;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeradminuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeradminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_pendingenterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_pendingenterprisecustomeruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique user and EnterpriseCustomer` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise_pendingen_enterprise_customer__a858ce2d_fk_enterpris` (`enterprise_customer_id`),
  KEY `enterprise__user_em_f98d36_idx` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise__user_em_488930_idx` (`user_email`),
  CONSTRAINT `enterprise_pendingen_enterprise_customer__a858ce2d_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_pendingenterprisecustomeruser`
--

LOCK TABLES `enterprise_pendingenterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_systemwideenterpriserole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_systemwideenterpriserole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_systemwideenterpriserole`
--

LOCK TABLES `enterprise_systemwideenterpriserole` WRITE;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriserole` DISABLE KEYS */;
INSERT INTO `enterprise_systemwideenterpriserole` VALUES (1,'2023-02-21 13:26:04.928596','2023-02-21 13:26:04.928596','enterprise_admin',NULL),(2,'2023-02-21 13:26:04.933431','2023-02-21 13:26:04.933431','enterprise_learner',NULL),(3,'2023-02-21 13:26:04.936997','2023-02-21 13:26:04.936997','enterprise_openedx_operator',NULL),(4,'2023-02-21 13:26:07.500896','2023-02-21 13:26:07.500896','enterprise_catalog_admin','Role for access to endpoints in the enterprise catalog service');
/*!40000 ALTER TABLE `enterprise_systemwideenterpriserole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_systemwideenterpriseuserroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_systemwideenterpriseuserroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_systemwideent_enterprise_customer_id_r_970babc4_uniq` (`enterprise_customer_id`,`role_id`,`user_id`),
  KEY `enterprise_systemwid_role_id_bc7092f0_fk_enterpris` (`role_id`),
  KEY `enterprise_systemwid_user_id_e890aef2_fk_auth_user` (`user_id`),
  CONSTRAINT `enterprise_systemwid_enterprise_customer__0136c565_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`),
  CONSTRAINT `enterprise_systemwid_role_id_bc7092f0_fk_enterpris` FOREIGN KEY (`role_id`) REFERENCES `enterprise_systemwideenterpriserole` (`id`),
  CONSTRAINT `enterprise_systemwid_user_id_e890aef2_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_systemwideenterpriseuserroleassignment`
--

LOCK TABLES `enterprise_systemwideenterpriseuserroleassignment` WRITE;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriseuserroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriseuserroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_updateroleassignmentswithcustomersconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_updateroleassignmentswithcustomersconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `role` varchar(100) NOT NULL,
  `batch_size` int(11) NOT NULL,
  `enterprise_customer_uuid` varchar(36) NOT NULL,
  `dry_run` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_updaterol_changed_by_id_1053fb4d_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `enterprise_updaterol_changed_by_id_1053fb4d_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_updateroleassignmentswithcustomersconfig`
--

LOCK TABLES `enterprise_updateroleassignmentswithcustomersconfig` WRITE;
/*!40000 ALTER TABLE `enterprise_updateroleassignmentswithcustomersconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_updateroleassignmentswithcustomersconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_courseentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_courseentitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `course_uuid` char(32) NOT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `mode` varchar(100) NOT NULL,
  `order_number` varchar(128) DEFAULT NULL,
  `enrollment_course_run_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `_policy_id` int(11) DEFAULT NULL,
  `refund_locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entitlements_courseentitlement_uuid_2228ffad_uniq` (`uuid`),
  UNIQUE KEY `entitlements_courseentit_course_uuid_order_number_b37c9e13_uniq` (`course_uuid`,`order_number`),
  KEY `entitlements_coursee_enrollment_course_ru_3fc796af_fk_student_c` (`enrollment_course_run_id`),
  KEY `entitlements_courseentitlement_user_id_a518a225_fk_auth_user_id` (`user_id`),
  KEY `entitlements_coursee__policy_id_37bd7c13_fk_entitleme` (`_policy_id`),
  CONSTRAINT `entitlements_coursee__policy_id_37bd7c13_fk_entitleme` FOREIGN KEY (`_policy_id`) REFERENCES `entitlements_courseentitlementpolicy` (`id`),
  CONSTRAINT `entitlements_coursee_enrollment_course_ru_3fc796af_fk_student_c` FOREIGN KEY (`enrollment_course_run_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `entitlements_courseentitlement_user_id_a518a225_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_courseentitlement`
--

LOCK TABLES `entitlements_courseentitlement` WRITE;
/*!40000 ALTER TABLE `entitlements_courseentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_courseentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_courseentitlementpolicy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_courseentitlementpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expiration_period` bigint(20) NOT NULL,
  `refund_period` bigint(20) NOT NULL,
  `regain_period` bigint(20) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlements_coursee_site_id_c7a9e107_fk_django_si` (`site_id`),
  CONSTRAINT `entitlements_coursee_site_id_c7a9e107_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_courseentitlementpolicy`
--

LOCK TABLES `entitlements_courseentitlementpolicy` WRITE;
/*!40000 ALTER TABLE `entitlements_courseentitlementpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_courseentitlementpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_courseentitlementsupportdetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_courseentitlementsupportdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `reason` varchar(15) NOT NULL,
  `comments` longtext,
  `entitlement_id` int(11) NOT NULL,
  `support_user_id` int(11) NOT NULL,
  `unenrolled_run_id` varchar(255) DEFAULT NULL,
  `action` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlements_coursee_entitlement_id_93b9020b_fk_entitleme` (`entitlement_id`),
  KEY `entitlements_coursee_support_user_id_97d3095e_fk_auth_user` (`support_user_id`),
  KEY `entitlements_courseentitlem_unenrolled_run_id_d72860e3` (`unenrolled_run_id`),
  CONSTRAINT `entitlements_coursee_entitlement_id_93b9020b_fk_entitleme` FOREIGN KEY (`entitlement_id`) REFERENCES `entitlements_courseentitlement` (`id`),
  CONSTRAINT `entitlements_coursee_support_user_id_97d3095e_fk_auth_user` FOREIGN KEY (`support_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_courseentitlementsupportdetail`
--

LOCK TABLES `entitlements_courseentitlementsupportdetail` WRITE;
/*!40000 ALTER TABLE `entitlements_courseentitlementsupportdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_courseentitlementsupportdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_historicalcourseentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_historicalcourseentitlement` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `course_uuid` char(32) NOT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `mode` varchar(100) NOT NULL,
  `order_number` varchar(128) DEFAULT NULL,
  `refund_locked` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `_policy_id` int(11) DEFAULT NULL,
  `enrollment_course_run_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `entitlements_histori_history_user_id_a3bc1823_fk_auth_user` (`history_user_id`),
  KEY `entitlements_historicalcourseentitlement_id_e3740062` (`id`),
  KEY `entitlements_historicalcourseentitlement_uuid_54fd331f` (`uuid`),
  KEY `entitlements_historicalcourseentitlement__policy_id_71c21d43` (`_policy_id`),
  KEY `entitlements_historicalcour_enrollment_course_run_id_1b92719b` (`enrollment_course_run_id`),
  KEY `entitlements_historicalcourseentitlement_user_id_c770997b` (`user_id`),
  CONSTRAINT `entitlements_histori_history_user_id_a3bc1823_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_historicalcourseentitlement`
--

LOCK TABLES `entitlements_historicalcourseentitlement` WRITE;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_historicalcourseentitlementsupportdetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_historicalcourseentitlementsupportdetail` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `reason` varchar(15) NOT NULL,
  `action` varchar(15) NOT NULL,
  `comments` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `entitlement_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `support_user_id` int(11) DEFAULT NULL,
  `unenrolled_run_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `entitlements_histori_history_user_id_b00a74ce_fk_auth_user` (`history_user_id`),
  KEY `entitlements_historicalcour_id_d019368b` (`id`),
  KEY `entitlements_historicalcour_entitlement_id_a5a6c6cc` (`entitlement_id`),
  KEY `entitlements_historicalcour_support_user_id_8788841f` (`support_user_id`),
  KEY `entitlements_historicalcour_unenrolled_run_id_67b11a08` (`unenrolled_run_id`),
  CONSTRAINT `entitlements_histori_history_user_id_b00a74ce_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_historicalcourseentitlementsupportdetail`
--

LOCK TABLES `entitlements_historicalcourseentitlementsupportdetail` WRITE;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlementsupportdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlementsupportdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments_experimentdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments_experimentdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `experiment_id` smallint(5) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experiments_experimentda_user_id_experiment_id_ke_0ff27a32_uniq` (`user_id`,`experiment_id`,`key`),
  KEY `experiments_experimentdata_user_id_experiment_id_15bd1b30_idx` (`user_id`,`experiment_id`),
  KEY `experiments_experimentdata_experiment_id_e816cee5` (`experiment_id`),
  CONSTRAINT `experiments_experimentdata_user_id_bd6f4720_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_experimentdata`
--

LOCK TABLES `experiments_experimentdata` WRITE;
/*!40000 ALTER TABLE `experiments_experimentdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiments_experimentdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments_experimentkeyvalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments_experimentkeyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `experiment_id` smallint(5) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experiments_experimentkeyvalue_experiment_id_key_15347f43_uniq` (`experiment_id`,`key`),
  KEY `experiments_experimentkeyvalue_experiment_id_741d1a4b` (`experiment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_experimentkeyvalue`
--

LOCK TABLES `experiments_experimentkeyvalue` WRITE;
/*!40000 ALTER TABLE `experiments_experimentkeyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiments_experimentkeyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments_historicalexperimentkeyvalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments_historicalexperimentkeyvalue` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `experiment_id` smallint(5) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `experiments_historic_history_user_id_3892eb1a_fk_auth_user` (`history_user_id`),
  KEY `experiments_historicalexperimentkeyvalue_id_13f6f6d3` (`id`),
  KEY `experiments_historicalexperimentkeyvalue_experiment_id_6a3c1624` (`experiment_id`),
  CONSTRAINT `experiments_historic_history_user_id_3892eb1a_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_historicalexperimentkeyvalue`
--

LOCK TABLES `experiments_historicalexperimentkeyvalue` WRITE;
/*!40000 ALTER TABLE `experiments_historicalexperimentkeyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiments_historicalexperimentkeyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_externalid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_externalid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_id` char(32) NOT NULL,
  `external_id_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_user_id` (`external_user_id`),
  UNIQUE KEY `external_user_ids_extern_user_id_external_id_type_cf1d16bc_uniq` (`user_id`,`external_id_type_id`),
  KEY `external_user_ids_ex_external_id_type_id_421db1af_fk_external_` (`external_id_type_id`),
  CONSTRAINT `external_user_ids_ex_external_id_type_id_421db1af_fk_external_` FOREIGN KEY (`external_id_type_id`) REFERENCES `external_user_ids_externalidtype` (`id`),
  CONSTRAINT `external_user_ids_externalid_user_id_7789441b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_externalid`
--

LOCK TABLES `external_user_ids_externalid` WRITE;
/*!40000 ALTER TABLE `external_user_ids_externalid` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_user_ids_externalid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_externalidtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_externalidtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_externalidtype`
--

LOCK TABLES `external_user_ids_externalidtype` WRITE;
/*!40000 ALTER TABLE `external_user_ids_externalidtype` DISABLE KEYS */;
INSERT INTO `external_user_ids_externalidtype` VALUES (1,'2023-02-21 13:30:45.884511','2023-02-21 13:30:45.884511','mb_coaching','MicroBachelors Coaching'),(2,'2023-02-21 13:30:50.619141','2023-02-21 13:30:50.619141','lti','LTI Xblock launches');
/*!40000 ALTER TABLE `external_user_ids_externalidtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_historicalexternalid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_historicalexternalid` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_id` char(32) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `external_id_type_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `external_user_ids_hi_history_user_id_fd67f897_fk_auth_user` (`history_user_id`),
  KEY `external_user_ids_historicalexternalid_id_1444e43e` (`id`),
  KEY `external_user_ids_historicalexternalid_external_user_id_03a5f871` (`external_user_id`),
  KEY `external_user_ids_historica_external_id_type_id_74b65da9` (`external_id_type_id`),
  KEY `external_user_ids_historicalexternalid_user_id_64337ddb` (`user_id`),
  CONSTRAINT `external_user_ids_hi_history_user_id_fd67f897_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_historicalexternalid`
--

LOCK TABLES `external_user_ids_historicalexternalid` WRITE;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalid` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_historicalexternalidtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_historicalexternalidtype` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `external_user_ids_hi_history_user_id_6a2c78fc_fk_auth_user` (`history_user_id`),
  KEY `external_user_ids_historicalexternalidtype_id_4cc44c83` (`id`),
  KEY `external_user_ids_historicalexternalidtype_name_a2e9fa4e` (`name`),
  CONSTRAINT `external_user_ids_hi_history_user_id_6a2c78fc_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_historicalexternalidtype`
--

LOCK TABLES `external_user_ids_historicalexternalidtype` WRITE;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalidtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalidtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_computegradessetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_computegradessetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `batch_size` int(11) NOT NULL,
  `course_ids` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_computegrades_changed_by_id_f2bf3678_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `grades_computegrades_changed_by_id_f2bf3678_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_computegradessetting`
--

LOCK TABLES `grades_computegradessetting` WRITE;
/*!40000 ALTER TABLE `grades_computegradessetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_computegradessetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_historicalpersistentsubsectiongradeoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_historicalpersistentsubsectiongradeoverride` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `earned_all_override` double DEFAULT NULL,
  `possible_all_override` double DEFAULT NULL,
  `earned_graded_override` double DEFAULT NULL,
  `possible_graded_override` double DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `grade_id` bigint(20) unsigned DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `override_reason` varchar(300) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `grades_historicalper_history_user_id_05000562_fk_auth_user` (`history_user_id`),
  KEY `grades_historicalpersistentsubsectiongradeoverride_id_e30d8953` (`id`),
  KEY `grades_historicalpersistent_created_e5fb4d96` (`created`),
  KEY `grades_historicalpersistent_modified_7355e846` (`modified`),
  KEY `grades_historicalpersistent_grade_id_ecfb45cc` (`grade_id`),
  CONSTRAINT `grades_historicalper_history_user_id_05000562_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_historicalpersistentsubsectiongradeoverride`
--

LOCK TABLES `grades_historicalpersistentsubsectiongradeoverride` WRITE;
/*!40000 ALTER TABLE `grades_historicalpersistentsubsectiongradeoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_historicalpersistentsubsectiongradeoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentcoursegrade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentcoursegrade` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_edited_timestamp` datetime(6) DEFAULT NULL,
  `course_version` varchar(255) NOT NULL,
  `grading_policy_hash` varchar(255) NOT NULL,
  `percent_grade` double NOT NULL,
  `letter_grade` varchar(255) NOT NULL,
  `passed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_persistentcoursegrade_course_id_user_id_d7b585c9_uniq` (`course_id`,`user_id`),
  KEY `grades_persistentcoursegrade_user_id_b2296589` (`user_id`),
  KEY `grades_persistentcoursegr_passed_timestamp_course_i_27d4396e_idx` (`passed_timestamp`,`course_id`),
  KEY `grades_persistentcoursegrade_modified_course_id_0e2ef09a_idx` (`modified`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentcoursegrade`
--

LOCK TABLES `grades_persistentcoursegrade` WRITE;
/*!40000 ALTER TABLE `grades_persistentcoursegrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentcoursegrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentsubsectiongrade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentsubsectiongrade` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `usage_key` varchar(255) NOT NULL,
  `subtree_edited_timestamp` datetime(6) DEFAULT NULL,
  `course_version` varchar(255) NOT NULL,
  `earned_all` double NOT NULL,
  `possible_all` double NOT NULL,
  `earned_graded` double NOT NULL,
  `possible_graded` double NOT NULL,
  `visible_blocks_hash` varchar(100) NOT NULL,
  `first_attempted` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_persistentsubsect_course_id_user_id_usage__42820224_uniq` (`course_id`,`user_id`,`usage_key`),
  KEY `grades_persistentsub_visible_blocks_hash_20836274_fk_grades_vi` (`visible_blocks_hash`),
  KEY `grades_persistentsubsecti_modified_course_id_usage__80ab6572_idx` (`modified`,`course_id`,`usage_key`),
  KEY `grades_persistentsubsecti_first_attempted_course_id_f59f063c_idx` (`first_attempted`,`course_id`,`user_id`),
  CONSTRAINT `grades_persistentsub_visible_blocks_hash_20836274_fk_grades_vi` FOREIGN KEY (`visible_blocks_hash`) REFERENCES `grades_visibleblocks` (`hashed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentsubsectiongrade`
--

LOCK TABLES `grades_persistentsubsectiongrade` WRITE;
/*!40000 ALTER TABLE `grades_persistentsubsectiongrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentsubsectiongrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentsubsectiongradeoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentsubsectiongradeoverride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `earned_all_override` double DEFAULT NULL,
  `possible_all_override` double DEFAULT NULL,
  `earned_graded_override` double DEFAULT NULL,
  `possible_graded_override` double DEFAULT NULL,
  `grade_id` bigint(20) unsigned NOT NULL,
  `override_reason` varchar(300) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_id` (`grade_id`),
  KEY `grades_persistentsubsectiongradeoverride_created_f80819d0` (`created`),
  KEY `grades_persistentsubsectiongradeoverride_modified_21efde2a` (`modified`),
  CONSTRAINT `grades_persistentsub_grade_id_74123016_fk_grades_pe` FOREIGN KEY (`grade_id`) REFERENCES `grades_persistentsubsectiongrade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentsubsectiongradeoverride`
--

LOCK TABLES `grades_persistentsubsectiongradeoverride` WRITE;
/*!40000 ALTER TABLE `grades_persistentsubsectiongradeoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentsubsectiongradeoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_visibleblocks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_visibleblocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blocks_json` longtext NOT NULL,
  `hashed` varchar(100) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashed` (`hashed`),
  KEY `grades_visibleblocks_course_id_d5f8e206` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_visibleblocks`
--

LOCK TABLES `grades_visibleblocks` WRITE;
/*!40000 ALTER TABLE `grades_visibleblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_visibleblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_gradereportsetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_gradereportsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `batch_size` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_task_grad_changed_by_id_dae9a995_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `instructor_task_grad_changed_by_id_dae9a995_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_gradereportsetting`
--

LOCK TABLES `instructor_task_gradereportsetting` WRITE;
/*!40000 ALTER TABLE `instructor_task_gradereportsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_gradereportsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_historicalinstructortaskschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_historicalinstructortaskschedule` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `task_args` longtext NOT NULL,
  `task_due` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `instructor_task_hist_history_user_id_4a50d181_fk_auth_user` (`history_user_id`),
  KEY `instructor_task_historicalinstructortaskschedule_id_e5476408` (`id`),
  KEY `instructor_task_historicali_task_id_c3ace79c` (`task_id`),
  CONSTRAINT `instructor_task_hist_history_user_id_4a50d181_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_historicalinstructortaskschedule`
--

LOCK TABLES `instructor_task_historicalinstructortaskschedule` WRITE;
/*!40000 ALTER TABLE `instructor_task_historicalinstructortaskschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_historicalinstructortaskschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_instructortask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_instructortask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(50) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `task_key` varchar(255) NOT NULL,
  `task_input` longtext NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `task_state` varchar(50) DEFAULT NULL,
  `task_output` varchar(1024) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `subtasks` longtext NOT NULL,
  `requester_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_task_inst_requester_id_307f955d_fk_auth_user` (`requester_id`),
  KEY `instructor_task_instructortask_task_type_cefe183d` (`task_type`),
  KEY `instructor_task_instructortask_course_id_b160f709` (`course_id`),
  KEY `instructor_task_instructortask_task_key_c1af3961` (`task_key`),
  KEY `instructor_task_instructortask_task_id_4aa92d04` (`task_id`),
  KEY `instructor_task_instructortask_task_state_3ee4e9cb` (`task_state`),
  CONSTRAINT `instructor_task_inst_requester_id_307f955d_fk_auth_user` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_instructortask`
--

LOCK TABLES `instructor_task_instructortask` WRITE;
/*!40000 ALTER TABLE `instructor_task_instructortask` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_instructortask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_instructortaskschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_instructortaskschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `task_args` longtext NOT NULL,
  `task_due` datetime(6) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  CONSTRAINT `instructor_task_inst_task_id_7564a79b_fk_instructo` FOREIGN KEY (`task_id`) REFERENCES `instructor_task_instructortask` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_instructortaskschedule`
--

LOCK TABLES `instructor_task_instructortaskschedule` WRITE;
/*!40000 ALTER TABLE `instructor_task_instructortaskschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_instructortaskschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_apiresponserecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_apiresponserecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status_code` int(10) unsigned DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_apiresponserecord`
--

LOCK TABLES `integrated_channel_apiresponserecord` WRITE;
/*!40000 ALTER TABLE `integrated_channel_apiresponserecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_apiresponserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_contentmetadataitemtransmission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_contentmetadataitemtransmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `integrated_channel_code` varchar(30) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `channel_metadata` longtext NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `content_last_changed` datetime(6) DEFAULT NULL,
  `enterprise_customer_catalog_uuid` char(32) DEFAULT NULL,
  `remote_deleted_at` datetime(6) DEFAULT NULL,
  `plugin_configuration_id` int(10) unsigned DEFAULT NULL,
  `api_response_status_code` int(10) unsigned DEFAULT NULL,
  `remote_created_at` datetime(6) DEFAULT NULL,
  `remote_updated_at` datetime(6) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `marked_for` varchar(32) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `integrated_channel_contentm_enterprise_customer_id_f6439bfb` (`enterprise_customer_id`),
  KEY `integrated_channel_conten_enterprise_customer_id_in_d0b69e31_idx` (`enterprise_customer_id`,`integrated_channel_code`,`plugin_configuration_id`,`content_id`),
  CONSTRAINT `integrated_channel_c_api_record_id_9f45970e_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`),
  CONSTRAINT `integrated_channel_c_enterprise_customer__f6439bfb_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_contentmetadataitemtransmission`
--

LOCK TABLES `integrated_channel_contentmetadataitemtransmission` WRITE;
/*!40000 ALTER TABLE `integrated_channel_contentmetadataitemtransmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_contentmetadataitemtransmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_genericenterprisecustomerpluginconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_genericenterprisecustomerpluginconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `integrated_channel_g_enterprise_customer__662cf9ac_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `integrated_channel_g_enterprise_customer__662cf9ac_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_genericenterprisecustomerpluginconfiguration`
--

LOCK TABLES `integrated_channel_genericenterprisecustomerpluginconfiguration` WRITE;
/*!40000 ALTER TABLE `integrated_channel_genericenterprisecustomerpluginconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_genericenterprisecustomerpluginconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_genericlearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_genericlearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `grade` double DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `integrated_channel_genericl_enterprise_course_enrollmen_4f9a5a2a` (`enterprise_course_enrollment_id`),
  KEY `integrated_channel_genericl_subsection_id_e1451a08` (`subsection_id`),
  CONSTRAINT `integrated_channel_g_api_record_id_5b5e9dfb_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_genericlearnerdatatransmissionaudit`
--

LOCK TABLES `integrated_channel_genericlearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `integrated_channel_genericlearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_genericlearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learner_pathway_progress_historicallearnerpathwayprogress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learner_pathway_progress_historicallearnerpathwayprogress` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `learner_pathway_uuid` char(32) NOT NULL,
  `learner_pathway_progress` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `learner_pathway_prog_history_user_id_72cbc5ff_fk_auth_user` (`history_user_id`),
  KEY `learner_pathway_progress_hi_id_4032af49` (`id`),
  KEY `learner_pathway_progress_hi_user_id_9b76ad23` (`user_id`),
  CONSTRAINT `learner_pathway_prog_history_user_id_72cbc5ff_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learner_pathway_progress_historicallearnerpathwayprogress`
--

LOCK TABLES `learner_pathway_progress_historicallearnerpathwayprogress` WRITE;
/*!40000 ALTER TABLE `learner_pathway_progress_historicallearnerpathwayprogress` DISABLE KEYS */;
/*!40000 ALTER TABLE `learner_pathway_progress_historicallearnerpathwayprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learner_pathway_progress_learnerenterprisepathwaymembership`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learner_pathway_progress_learnerenterprisepathwaymembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_customer_uuid` char(32) NOT NULL,
  `learner_pathway_uuid` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learner_pathway_progress_user_id_learner_pathway__bd6dc3ce_uniq` (`user_id`,`learner_pathway_uuid`,`enterprise_customer_uuid`),
  KEY `learner_pathway_progress_le_enterprise_customer_uuid_bb253771` (`enterprise_customer_uuid`),
  CONSTRAINT `learner_pathway_prog_user_id_86dea5e8_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learner_pathway_progress_learnerenterprisepathwaymembership`
--

LOCK TABLES `learner_pathway_progress_learnerenterprisepathwaymembership` WRITE;
/*!40000 ALTER TABLE `learner_pathway_progress_learnerenterprisepathwaymembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `learner_pathway_progress_learnerenterprisepathwaymembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learner_pathway_progress_learnerpathwayprogress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learner_pathway_progress_learnerpathwayprogress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `learner_pathway_uuid` char(32) NOT NULL,
  `learner_pathway_progress` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learner_pathway_progress_user_id_learner_pathway__056d35ab_uniq` (`user_id`,`learner_pathway_uuid`),
  CONSTRAINT `learner_pathway_prog_user_id_97c147db_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learner_pathway_progress_learnerpathwayprogress`
--

LOCK TABLES `learner_pathway_progress_learnerpathwayprogress` WRITE;
/*!40000 ALTER TABLE `learner_pathway_progress_learnerpathwayprogress` DISABLE KEYS */;
/*!40000 ALTER TABLE `learner_pathway_progress_learnerpathwayprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_contenterror`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_contenterror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usage_key` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `publish_report_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_sequences_c_publish_report_id_d0ec7d1b_fk_learning_` (`publish_report_id`),
  CONSTRAINT `learning_sequences_c_publish_report_id_d0ec7d1b_fk_learning_` FOREIGN KEY (`publish_report_id`) REFERENCES `learning_sequences_publishreport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_contenterror`
--

LOCK TABLES `learning_sequences_contenterror` WRITE;
/*!40000 ALTER TABLE `learning_sequences_contenterror` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_contenterror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursecontext`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursecontext` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `learning_context_id` bigint(20) NOT NULL,
  `course_visibility` varchar(32) NOT NULL,
  `self_paced` tinyint(1) NOT NULL,
  `days_early_for_beta` int(11) DEFAULT NULL,
  `entrance_exam_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`learning_context_id`),
  CONSTRAINT `learning_sequences_c_learning_context_id_fe16b41d_fk_learning_` FOREIGN KEY (`learning_context_id`) REFERENCES `learning_sequences_learningcontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursecontext`
--

LOCK TABLES `learning_sequences_coursecontext` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursecontext` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_coursecontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursesection`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursesection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordering` int(10) unsigned NOT NULL,
  `usage_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `hide_from_toc` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_cours_course_context_id_usage__0df8eb59_uniq` (`course_context_id`,`usage_key`),
  KEY `learning_sequences_course_course_context_id_orderin_ee5cfc42_idx` (`course_context_id`,`ordering`),
  CONSTRAINT `learning_sequences_c_course_context_id_f9845b47_fk_learning_` FOREIGN KEY (`course_context_id`) REFERENCES `learning_sequences_coursecontext` (`learning_context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursesection`
--

LOCK TABLES `learning_sequences_coursesection` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_coursesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursesectionsequence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursesectionsequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordering` int(10) unsigned NOT NULL,
  `hide_from_toc` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `sequence_id` bigint(20) NOT NULL,
  `inaccessible_after_due` tinyint(1) NOT NULL,
  `course_context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_cours_course_context_id_orderi_f233743c_uniq` (`course_context_id`,`ordering`),
  KEY `learning_sequences_c_section_id_646c2074_fk_learning_` (`section_id`),
  KEY `learning_sequences_c_sequence_id_e6a12a64_fk_learning_` (`sequence_id`),
  CONSTRAINT `learning_sequences_c_course_context_id_bb2762af_fk_learning_` FOREIGN KEY (`course_context_id`) REFERENCES `learning_sequences_coursecontext` (`learning_context_id`),
  CONSTRAINT `learning_sequences_c_section_id_646c2074_fk_learning_` FOREIGN KEY (`section_id`) REFERENCES `learning_sequences_coursesection` (`id`),
  CONSTRAINT `learning_sequences_c_sequence_id_e6a12a64_fk_learning_` FOREIGN KEY (`sequence_id`) REFERENCES `learning_sequences_learningsequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursesectionsequence`
--

LOCK TABLES `learning_sequences_coursesectionsequence` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursesectionsequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_coursesectionsequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursesequenceexam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursesequenceexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_practice_exam` tinyint(1) NOT NULL,
  `is_proctored_enabled` tinyint(1) NOT NULL,
  `is_time_limited` tinyint(1) NOT NULL,
  `course_section_sequence_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_section_sequence_id` (`course_section_sequence_id`),
  CONSTRAINT `learning_sequences_c_course_section_seque_89ce42a5_fk_learning_` FOREIGN KEY (`course_section_sequence_id`) REFERENCES `learning_sequences_coursesectionsequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursesequenceexam`
--

LOCK TABLES `learning_sequences_coursesequenceexam` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursesequenceexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_coursesequenceexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_learningcontext`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_learningcontext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `published_at` datetime(6) NOT NULL,
  `published_version` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context_key` (`context_key`),
  KEY `learning_se_publish_62319b_idx` (`published_at`),
  KEY `learning_sequences_learningcontext_title_5a70c4cd` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_learningcontext`
--

LOCK TABLES `learning_sequences_learningcontext` WRITE;
/*!40000 ALTER TABLE `learning_sequences_learningcontext` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_learningcontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_learningsequence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_learningsequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `learning_context_id` bigint(20) NOT NULL,
  `usage_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_learn_learning_context_id_usag_6a13230f_uniq` (`learning_context_id`,`usage_key`),
  CONSTRAINT `learning_sequences_l_learning_context_id_25f3e4ab_fk_learning_` FOREIGN KEY (`learning_context_id`) REFERENCES `learning_sequences_learningcontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_learningsequence`
--

LOCK TABLES `learning_sequences_learningsequence` WRITE;
/*!40000 ALTER TABLE `learning_sequences_learningsequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_learningsequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_publishreport`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_publishreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_errors` int(10) unsigned NOT NULL,
  `num_sections` int(10) unsigned NOT NULL,
  `num_sequences` int(10) unsigned NOT NULL,
  `learning_context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_context_id` (`learning_context_id`),
  KEY `learning_sequences_publishreport_num_errors_118a5f55` (`num_errors`),
  KEY `learning_sequences_publishreport_num_sections_ad9e0ae2` (`num_sections`),
  KEY `learning_sequences_publishreport_num_sequences_51743c92` (`num_sequences`),
  CONSTRAINT `learning_sequences_p_learning_context_id_dd7a29fd_fk_learning_` FOREIGN KEY (`learning_context_id`) REFERENCES `learning_sequences_learningcontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_publishreport`
--

LOCK TABLES `learning_sequences_publishreport` WRITE;
/*!40000 ALTER TABLE `learning_sequences_publishreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_publishreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_sectionpartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_sectionpartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_section_id` bigint(20) NOT NULL,
  `user_partition_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_secti_user_partition_group_id__bf44a405_uniq` (`user_partition_group_id`,`course_section_id`),
  KEY `learning_sequences_s_course_section_id_1e04b4f2_fk_learning_` (`course_section_id`),
  CONSTRAINT `learning_sequences_s_course_section_id_1e04b4f2_fk_learning_` FOREIGN KEY (`course_section_id`) REFERENCES `learning_sequences_coursesection` (`id`),
  CONSTRAINT `learning_sequences_s_user_partition_group_39a895cd_fk_learning_` FOREIGN KEY (`user_partition_group_id`) REFERENCES `learning_sequences_userpartitiongroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_sectionpartitiongroup`
--

LOCK TABLES `learning_sequences_sectionpartitiongroup` WRITE;
/*!40000 ALTER TABLE `learning_sequences_sectionpartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_sectionpartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_sectionsequencepartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_sectionsequencepartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_section_sequence_id` bigint(20) NOT NULL,
  `user_partition_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_secti_user_partition_group_id__44a79d57_uniq` (`user_partition_group_id`,`course_section_sequence_id`),
  KEY `learning_sequences_s_course_section_seque_555798e5_fk_learning_` (`course_section_sequence_id`),
  CONSTRAINT `learning_sequences_s_course_section_seque_555798e5_fk_learning_` FOREIGN KEY (`course_section_sequence_id`) REFERENCES `learning_sequences_coursesectionsequence` (`id`),
  CONSTRAINT `learning_sequences_s_user_partition_group_28eb4c91_fk_learning_` FOREIGN KEY (`user_partition_group_id`) REFERENCES `learning_sequences_userpartitiongroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_sectionsequencepartitiongroup`
--

LOCK TABLES `learning_sequences_sectionsequencepartitiongroup` WRITE;
/*!40000 ALTER TABLE `learning_sequences_sectionsequencepartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_sectionsequencepartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_userpartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_userpartitiongroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partition_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_userp_partition_id_group_id_a152e36f_uniq` (`partition_id`,`group_id`),
  KEY `learning_se_partiti_6e2d28_idx` (`partition_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_userpartitiongroup`
--

LOCK TABLES `learning_sequences_userpartitiongroup` WRITE;
/*!40000 ALTER TABLE `learning_sequences_userpartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_userpartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lms_xblock_xblockasidesconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lms_xblock_xblockasidesconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lms_xblock_xblockasi_changed_by_id_71928be3_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `lms_xblock_xblockasi_changed_by_id_71928be3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lms_xblock_xblockasidesconfig`
--

LOCK TABLES `lms_xblock_xblockasidesconfig` WRITE;
/*!40000 ALTER TABLE `lms_xblock_xblockasidesconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `lms_xblock_xblockasidesconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti1p3_tool`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti1p3_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `issuer` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `use_by_default` tinyint(1) NOT NULL,
  `auth_login_url` varchar(1024) NOT NULL,
  `auth_token_url` varchar(1024) NOT NULL,
  `auth_audience` varchar(1024) DEFAULT NULL,
  `key_set_url` varchar(1024) DEFAULT NULL,
  `key_set` longtext,
  `deployment_ids` longtext NOT NULL,
  `tool_key_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lti1p3_tool_issuer_client_id_b3116be4_uniq` (`issuer`,`client_id`),
  KEY `lti1p3_tool_tool_key_id_608be89f_fk_lti1p3_tool_key_id` (`tool_key_id`),
  CONSTRAINT `lti1p3_tool_tool_key_id_608be89f_fk_lti1p3_tool_key_id` FOREIGN KEY (`tool_key_id`) REFERENCES `lti1p3_tool_key` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti1p3_tool`
--

LOCK TABLES `lti1p3_tool` WRITE;
/*!40000 ALTER TABLE `lti1p3_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti1p3_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti1p3_tool_key`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti1p3_tool_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `private_key` longtext NOT NULL,
  `public_key` longtext,
  `public_jwk` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti1p3_tool_key`
--

LOCK TABLES `lti1p3_tool_key` WRITE;
/*!40000 ALTER TABLE `lti1p3_tool_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti1p3_tool_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_ltiagslineitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_ltiagslineitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` varchar(100) NOT NULL,
  `resource_link_id` varchar(255) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `score_maximum` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `start_date_time` datetime(6) DEFAULT NULL,
  `end_date_time` datetime(6) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lti_consumer_ltiagsl_lti_configuration_id_03e605a4_fk_lti_consu` (`lti_configuration_id`),
  KEY `lti_consumer_ltiagslineitem_resource_link_id_39f87e2f` (`resource_link_id`),
  CONSTRAINT `lti_consumer_ltiagsl_lti_configuration_id_03e605a4_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_ltiagslineitem`
--

LOCK TABLES `lti_consumer_ltiagslineitem` WRITE;
/*!40000 ALTER TABLE `lti_consumer_ltiagslineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_ltiagslineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_ltiagsscore`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_ltiagsscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `score_given` double DEFAULT NULL,
  `score_maximum` double DEFAULT NULL,
  `comment` longtext,
  `activity_progress` varchar(20) NOT NULL,
  `grading_progress` varchar(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `line_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lti_consumer_ltiagsscore_line_item_id_user_id_887a73e4_uniq` (`line_item_id`,`user_id`),
  CONSTRAINT `lti_consumer_ltiagss_line_item_id_168433dc_fk_lti_consu` FOREIGN KEY (`line_item_id`) REFERENCES `lti_consumer_ltiagslineitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_ltiagsscore`
--

LOCK TABLES `lti_consumer_ltiagsscore` WRITE;
/*!40000 ALTER TABLE `lti_consumer_ltiagsscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_ltiagsscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_lticonfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_lticonfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  `config_store` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lti_1p3_internal_private_key` longtext NOT NULL,
  `lti_1p3_internal_private_key_id` varchar(255) NOT NULL,
  `lti_1p3_internal_public_jwk` longtext NOT NULL,
  `lti_1p3_client_id` varchar(255) NOT NULL,
  `config_id` char(32) NOT NULL,
  `lti_1p1_client_key` varchar(255) NOT NULL,
  `lti_1p1_client_secret` varchar(255) NOT NULL,
  `lti_1p1_launch_url` varchar(255) NOT NULL,
  `lti_config` longtext NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `lti_1p3_launch_url` varchar(255) NOT NULL,
  `lti_1p3_oidc_url` varchar(255) NOT NULL,
  `lti_1p3_tool_keyset_url` varchar(255) NOT NULL,
  `lti_1p3_tool_public_key` longtext NOT NULL,
  `lti_advantage_ags_mode` varchar(20) NOT NULL,
  `lti_advantage_deep_linking_enabled` tinyint(1) NOT NULL,
  `lti_advantage_deep_linking_launch_url` varchar(225) NOT NULL,
  `lti_advantage_enable_nrps` tinyint(1) NOT NULL,
  `lti_1p3_proctoring_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lti_consumer_lticonfiguration_config_id_7e375962_uniq` (`config_id`),
  KEY `lti_consumer_lticonfiguration_location_e7e37735` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_lticonfiguration`
--

LOCK TABLES `lti_consumer_lticonfiguration` WRITE;
/*!40000 ALTER TABLE `lti_consumer_lticonfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_lticonfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_ltidlcontentitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_ltidlcontentitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) NOT NULL,
  `attributes` longtext NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lti_consumer_ltidlco_lti_configuration_id_887d35fa_fk_lti_consu` (`lti_configuration_id`),
  CONSTRAINT `lti_consumer_ltidlco_lti_configuration_id_887d35fa_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_ltidlcontentitem`
--

LOCK TABLES `lti_consumer_ltidlcontentitem` WRITE;
/*!40000 ALTER TABLE `lti_consumer_ltidlcontentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_ltidlcontentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_coursecontentmilestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_coursecontentmilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `milestone_relationship_type_id` int(11) NOT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursecontent_course_id_content_id_mil_7caa5ba5_uniq` (`course_id`,`content_id`,`milestone_id`),
  KEY `milestones_coursecon_milestone_id_bd7a608b_fk_milestone` (`milestone_id`),
  KEY `milestones_coursecon_milestone_relationsh_31556ebf_fk_milestone` (`milestone_relationship_type_id`),
  KEY `milestones_coursecontentmilestone_course_id_6fd3fad0` (`course_id`),
  KEY `milestones_coursecontentmilestone_content_id_21f4c95f` (`content_id`),
  KEY `milestones_coursecontentmilestone_active_b7ab709d` (`active`),
  CONSTRAINT `milestones_coursecon_milestone_id_bd7a608b_fk_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestones_coursecon_milestone_relationsh_31556ebf_fk_milestone` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_coursecontentmilestone`
--

LOCK TABLES `milestones_coursecontentmilestone` WRITE;
/*!40000 ALTER TABLE `milestones_coursecontentmilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_coursecontentmilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_coursemilestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_coursemilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `milestone_relationship_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursemilestone_course_id_milestone_id_36b21ae8_uniq` (`course_id`,`milestone_id`),
  KEY `milestones_coursemil_milestone_id_03d9ef01_fk_milestone` (`milestone_id`),
  KEY `milestones_coursemil_milestone_relationsh_6c64b782_fk_milestone` (`milestone_relationship_type_id`),
  KEY `milestones_coursemilestone_course_id_ce46a0fc` (`course_id`),
  KEY `milestones_coursemilestone_active_c590442e` (`active`),
  CONSTRAINT `milestones_coursemil_milestone_id_03d9ef01_fk_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestones_coursemil_milestone_relationsh_6c64b782_fk_milestone` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_coursemilestone`
--

LOCK TABLES `milestones_coursemilestone` WRITE;
/*!40000 ALTER TABLE `milestones_coursemilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_coursemilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_milestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_milestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_milestone_namespace_name_0b80f867_uniq` (`namespace`,`name`),
  KEY `milestones_milestone_namespace_a8e8807c` (`namespace`),
  KEY `milestones_milestone_name_23fb0698` (`name`),
  KEY `milestones_milestone_active_9a6c1703` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_milestone`
--

LOCK TABLES `milestones_milestone` WRITE;
/*!40000 ALTER TABLE `milestones_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_milestonerelationshiptype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_milestonerelationshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_milestonerelationshiptype`
--

LOCK TABLES `milestones_milestonerelationshiptype` WRITE;
/*!40000 ALTER TABLE `milestones_milestonerelationshiptype` DISABLE KEYS */;
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2023-02-21 13:31:26.094047','2023-02-21 13:31:26.094047','requires','Autogenerated milestone relationship type \"requires\"',1),(2,'2023-02-21 13:31:26.105500','2023-02-21 13:31:26.105500','fulfills','Autogenerated milestone relationship type \"fulfills\"',1);
/*!40000 ALTER TABLE `milestones_milestonerelationshiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_usermilestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_usermilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` longtext NOT NULL,
  `collected` datetime(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_usermilestone_user_id_milestone_id_02197f01_uniq` (`user_id`,`milestone_id`),
  KEY `milestones_usermiles_milestone_id_f90f9430_fk_milestone` (`milestone_id`),
  KEY `milestones_usermilestone_user_id_b3e9aef4` (`user_id`),
  KEY `milestones_usermilestone_active_93a18e7f` (`active`),
  CONSTRAINT `milestones_usermiles_milestone_id_f90f9430_fk_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_usermilestone`
--

LOCK TABLES `milestones_usermilestone` WRITE;
/*!40000 ALTER TABLE `milestones_usermilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_usermilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_appversionconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_appversionconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `major_version` int(11) NOT NULL,
  `minor_version` int(11) NOT NULL,
  `patch_version` int(11) NOT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_api_appversionconfig_platform_version_6b577430_uniq` (`platform`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_appversionconfig`
--

LOCK TABLES `mobile_api_appversionconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_appversionconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_appversionconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_ignoremobileavailableflagconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_ignoremobileavailableflagconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_api_ignoremob_changed_by_id_4ca9c0d6_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `mobile_api_ignoremob_changed_by_id_4ca9c0d6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_ignoremobileavailableflagconfig`
--

LOCK TABLES `mobile_api_ignoremobileavailableflagconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_ignoremobileavailableflagconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_ignoremobileavailableflagconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_mobileapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_mobileapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `video_profiles` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_api_mobileapi_changed_by_id_8799981a_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `mobile_api_mobileapi_changed_by_id_8799981a_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_mobileapiconfig`
--

LOCK TABLES `mobile_api_mobileapiconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_mobileconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_mobileconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_mobileconfig`
--

LOCK TABLES `mobile_api_mobileconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_mobileconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_mobileconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodle_historicalmoodleenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodle_historicalmoodleenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `moodle_base_url` varchar(255) NOT NULL,
  `service_short_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `grade_assignment_name` varchar(255) NOT NULL,
  `grade_scale` int(11) NOT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `moodle_historicalmoo_history_user_id_22017ee9_fk_auth_user` (`history_user_id`),
  KEY `moodle_historicalmoodleente_id_71ddc422` (`id`),
  KEY `moodle_historicalmoodleente_enterprise_customer_id_a816d974` (`enterprise_customer_id`),
  CONSTRAINT `moodle_historicalmoo_history_user_id_22017ee9_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodle_historicalmoodleenterprisecustomerconfiguration`
--

LOCK TABLES `moodle_historicalmoodleenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `moodle_historicalmoodleenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `moodle_historicalmoodleenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodle_moodleenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodle_moodleenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `moodle_base_url` varchar(255) NOT NULL,
  `service_short_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `grade_assignment_name` varchar(255) NOT NULL,
  `grade_scale` int(11) NOT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `moodle_moodleenterprisecust_enterprise_customer_id_6668537b` (`enterprise_customer_id`),
  CONSTRAINT `moodle_moodleenterpr_enterprise_customer__6668537b_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodle_moodleenterprisecustomerconfiguration`
--

LOCK TABLES `moodle_moodleenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `moodle_moodleenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `moodle_moodleenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodle_moodlelearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodle_moodlelearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moodle_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `grade` double DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `moodle_completed_timestamp` varchar(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `moodle_moodlelearnerdatatra_enterprise_course_enrollmen_70fa10d7` (`enterprise_course_enrollment_id`),
  KEY `moodle_moodlelearnerdatatransmissionaudit_subsection_id_fcac3b8c` (`subsection_id`),
  KEY `moodle_mldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `moodle_moodlelearner_api_record_id_749298db_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodle_moodlelearnerdatatransmissionaudit`
--

LOCK TABLES `moodle_moodlelearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `moodle_moodlelearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `moodle_moodlelearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nameaffirmation_verifiedname`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nameaffirmation_verifiedname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `verified_name` varchar(255) NOT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `verification_attempt_id` int(10) unsigned DEFAULT NULL,
  `proctored_exam_attempt_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nameaffirmation_verifiedname_user_id_e272fb19_fk_auth_user_id` (`user_id`),
  KEY `nameaffirmation_verifiedname_verified_name_7097d450` (`verified_name`),
  CONSTRAINT `nameaffirmation_verifiedname_user_id_e272fb19_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nameaffirmation_verifiedname`
--

LOCK TABLES `nameaffirmation_verifiedname` WRITE;
/*!40000 ALTER TABLE `nameaffirmation_verifiedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `nameaffirmation_verifiedname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nameaffirmation_verifiednameconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nameaffirmation_verifiednameconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `use_verified_name_for_certs` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nameaffirmation_veri_changed_by_id_e6d2f562_fk_auth_user` (`changed_by_id`),
  KEY `nameaffirmation_veri_user_id_5b5e177e_fk_auth_user` (`user_id`),
  CONSTRAINT `nameaffirmation_veri_changed_by_id_e6d2f562_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `nameaffirmation_veri_user_id_5b5e177e_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nameaffirmation_verifiednameconfig`
--

LOCK TABLES `nameaffirmation_verifiednameconfig` WRITE;
/*!40000 ALTER TABLE `nameaffirmation_verifiednameconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `nameaffirmation_verifiednameconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_notification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `is_viewed` tinyint(1) NOT NULL,
  `is_emailed` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_notification_subscription_id_0eae0084_fk_notify_su` (`subscription_id`),
  CONSTRAINT `notify_notification_subscription_id_0eae0084_fk_notify_su` FOREIGN KEY (`subscription_id`) REFERENCES `notify_subscription` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_notification`
--

LOCK TABLES `notify_notification` WRITE;
/*!40000 ALTER TABLE `notify_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_notificationtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_notificationtype` (
  `key` varchar(128) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  KEY `notify_notificationt_content_type_id_f575bac5_fk_django_co` (`content_type_id`),
  CONSTRAINT `notify_notificationt_content_type_id_f575bac5_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_notificationtype`
--

LOCK TABLES `notify_notificationtype` WRITE;
/*!40000 ALTER TABLE `notify_notificationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_notificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interval` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_settings_user_id_088ebffc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notify_settings_user_id_088ebffc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_settings`
--

LOCK TABLES `notify_settings` WRITE;
/*!40000 ALTER TABLE `notify_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_subscription`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(64) DEFAULT NULL,
  `send_emails` tinyint(1) NOT NULL,
  `notification_type_id` varchar(128) NOT NULL,
  `settings_id` int(11) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `notify_subscription_notification_type_id_f73a8b13_fk_notify_no` (`notification_type_id`),
  KEY `notify_subscription_settings_id_dbc3961d_fk_notify_settings_id` (`settings_id`),
  CONSTRAINT `notify_subscription_notification_type_id_f73a8b13_fk_notify_no` FOREIGN KEY (`notification_type_id`) REFERENCES `notify_notificationtype` (`key`),
  CONSTRAINT `notify_subscription_settings_id_dbc3961d_fk_notify_settings_id` FOREIGN KEY (`settings_id`) REFERENCES `notify_settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_subscription`
--

LOCK TABLES `notify_subscription` WRITE;
/*!40000 ALTER TABLE `notify_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'9LmBvHCdRKOEsXVPqgregDgaacclKC','2023-02-22 00:41:59.864879','read write email profile',7,11,'2023-02-21 14:41:59.840767','2023-02-21 14:41:59.869501',NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'login-service-client-id','','public','password','pvZnl8tp2fTy8OahmJOwZ72b92glVVB8igFF5wOy1KE9HCCvH1pqebamJ1mVBcp1MnrsRcCIjt9rnh4N1XR0ToHW85k5ah9XkicRKpaUHAth3EVghTEe0SXq1HCE4kUt','Login Service for JWT Cookies',2,0,'2023-02-21 14:10:50.956718','2023-02-21 14:10:50.956749'),(2,'enterprise-backend-service-key','','confidential','client-credentials','enterprise-backend-service-secret','enterprise-backend-service',4,0,'2023-02-21 14:19:44.951695','2023-02-21 14:19:44.951755'),(3,'studio-sso-key','http://localhost:18010/complete/edx-oauth2/','confidential','authorization-code','studio-sso-secret','studio-sso',9,1,'2023-02-21 14:29:32.045802','2023-02-21 14:29:32.045858'),(4,'studio-backend-service-key','','confidential','client-credentials','studio-backend-service-secret','studio-backend-service',9,0,'2023-02-21 14:29:42.672176','2023-02-21 14:29:42.672228'),(5,'48JirUwtsCgfpuOCK5RKP1rIpvGQHWK6c3zyvsMf','','confidential','client-credentials','WTYWhvtfCKmkX5Qh3pCWqLn5RAW8I8V9aEhpcwIYk5LTTwRzc1VYQmYMeAOlsetU8hky2RObZt32dtuSo1ILGLhap5VyyFIYn5UXPrW0SiyZoMv6ZK6USFKDTkmkSHpx','retirement',10,0,'2023-02-21 14:30:03.200959','2023-02-21 14:30:03.201010'),(6,'ecommerce-sso-key','http://localhost:18130/complete/edx-oauth2/','confidential','authorization-code','ecommerce-sso-secret','ecommerce-sso',11,1,'2023-02-21 14:39:13.815179','2023-02-21 14:39:13.815235'),(7,'ecommerce-backend-service-key','','confidential','client-credentials','ecommerce-backend-service-secret','ecommerce-backend-service',11,0,'2023-02-21 14:39:29.303725','2023-02-21 14:39:29.303778');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) NOT NULL,
  `code_challenge_method` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_applicationaccess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_applicationaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scopes` varchar(825) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `filters` varchar(825) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`),
  CONSTRAINT `oauth_dispatch_appli_application_id_dcddee6e_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_applicationaccess`
--

LOCK TABLES `oauth_dispatch_applicationaccess` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_applicationaccess` DISABLE KEYS */;
INSERT INTO `oauth_dispatch_applicationaccess` VALUES (1,'user_id',3,NULL),(2,'user_id',6,NULL);
/*!40000 ALTER TABLE `oauth_dispatch_applicationaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_applicationorganization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_applicationorganization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_type` varchar(32) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_dispatch_applicati_application_id_relation__1b4017f2_uniq` (`application_id`,`relation_type`,`organization_id`),
  KEY `oauth_dispatch_appli_organization_id_fe63a7f2_fk_organizat` (`organization_id`),
  CONSTRAINT `oauth_dispatch_appli_application_id_dea619c6_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth_dispatch_appli_organization_id_fe63a7f2_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_applicationorganization`
--

LOCK TABLES `oauth_dispatch_applicationorganization` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_applicationorganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_dispatch_applicationorganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_restrictedapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_restrictedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_dispatch_restr_application_id_6b8d0930_fk_oauth2_pr` (`application_id`),
  CONSTRAINT `oauth_dispatch_restr_application_id_6b8d0930_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_restrictedapplication`
--

LOCK TABLES `oauth_dispatch_restrictedapplication` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_restrictedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_dispatch_restrictedapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_historicalorganization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_historicalorganization` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `description` longtext,
  `logo` longtext,
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `organizations_histor_history_user_id_bb516493_fk_auth_user` (`history_user_id`),
  KEY `organizations_historicalorganization_id_4327d8f9` (`id`),
  KEY `organizations_historicalorganization_name_5f4e354b` (`name`),
  KEY `organizations_historicalorganization_short_name_07087b46` (`short_name`),
  CONSTRAINT `organizations_histor_history_user_id_bb516493_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_historicalorganization`
--

LOCK TABLES `organizations_historicalorganization` WRITE;
/*!40000 ALTER TABLE `organizations_historicalorganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_historicalorganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_historicalorganizationcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_historicalorganizationcourse` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `organizations_histor_history_user_id_0f165c1b_fk_auth_user` (`history_user_id`),
  KEY `organizations_historicalorganizationcourse_id_9a1564c8` (`id`),
  KEY `organizations_historicalorganizationcourse_course_id_4c93708c` (`course_id`),
  KEY `organizations_historicalorg_organization_id_7cc0ed83` (`organization_id`),
  CONSTRAINT `organizations_histor_history_user_id_0f165c1b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_historicalorganizationcourse`
--

LOCK TABLES `organizations_historicalorganizationcourse` WRITE;
/*!40000 ALTER TABLE `organizations_historicalorganizationcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_historicalorganizationcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `description` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organization_short_name_ef338963_uniq` (`short_name`),
  KEY `organizations_organization_name_71edc74b` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organization`
--

LOCK TABLES `organizations_organization` WRITE;
/*!40000 ALTER TABLE `organizations_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organizationcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_organizationcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organizati_course_id_organization_i_06b1db31_uniq` (`course_id`,`organization_id`),
  KEY `organizations_organi_organization_id_99e77fe0_fk_organizat` (`organization_id`),
  KEY `organizations_organizationcourse_course_id_227b73bc` (`course_id`),
  CONSTRAINT `organizations_organi_organization_id_99e77fe0_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organizationcourse`
--

LOCK TABLES `organizations_organizationcourse` WRITE;
/*!40000 ALTER TABLE `organizations_organizationcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organizationcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_coursegoal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_coursegoal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `survey_response_id` bigint(20) NOT NULL,
  `enrollment_type` varchar(16) DEFAULT NULL,
  `lms_enrollment_id` int(11) DEFAULT NULL,
  `goal_achieved` tinyint(1) DEFAULT NULL,
  `online_learning_goal` longtext,
  `open_to_outreach` tinyint(1) DEFAULT NULL,
  `salary_change` tinyint(1) DEFAULT NULL,
  `job_promotion` tinyint(1) DEFAULT NULL,
  `learning_experience_importance` varchar(256) DEFAULT NULL,
  `experience_impacted_goals` longtext,
  `close_to_goal` varchar(256) DEFAULT NULL,
  `factors_influenced_timeline` longtext,
  `achieve_goal_sooner` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outcome_surveys_coursego_survey_id_survey_respons_cb97bf9e_uniq` (`survey_id`,`survey_response_id`),
  KEY `outcome_sur_lms_enr_9c26bd_idx` (`lms_enrollment_id`),
  KEY `outcome_sur_survey__8d827f_idx` (`survey_id`,`survey_response_id`),
  KEY `outcome_sur_survey__f64c25_idx` (`survey_response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_coursegoal`
--

LOCK TABLES `outcome_surveys_coursegoal` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_coursegoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_coursegoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_coursegoal_online_learning_goals`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_coursegoal_online_learning_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursegoal_id` int(11) NOT NULL,
  `multichoiceresponse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outcome_surveys_coursego_coursegoal_id_multichoic_bb8f094a_uniq` (`coursegoal_id`,`multichoiceresponse_id`),
  KEY `outcome_surveys_cour_multichoiceresponse__332c96b0_fk_outcome_s` (`multichoiceresponse_id`),
  CONSTRAINT `outcome_surveys_cour_coursegoal_id_4f4f26d1_fk_outcome_s` FOREIGN KEY (`coursegoal_id`) REFERENCES `outcome_surveys_coursegoal` (`id`),
  CONSTRAINT `outcome_surveys_cour_multichoiceresponse__332c96b0_fk_outcome_s` FOREIGN KEY (`multichoiceresponse_id`) REFERENCES `outcome_surveys_multichoiceresponse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_coursegoal_online_learning_goals`
--

LOCK TABLES `outcome_surveys_coursegoal_online_learning_goals` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_coursegoal_online_learning_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_coursegoal_online_learning_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_coursereflection`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_coursereflection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `survey_response_id` bigint(20) NOT NULL,
  `enrollment_type` varchar(16) DEFAULT NULL,
  `lms_enrollment_id` int(11) DEFAULT NULL,
  `help_reach_goal` varchar(256) DEFAULT NULL,
  `course_rating` int(11) DEFAULT NULL,
  `course_experience` longtext,
  `open_to_outreach` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outcome_surveys_coursere_survey_id_survey_respons_150db796_uniq` (`survey_id`,`survey_response_id`),
  KEY `outcome_sur_lms_enr_245902_idx` (`lms_enrollment_id`),
  KEY `outcome_sur_survey__8a6a99_idx` (`survey_id`,`survey_response_id`),
  KEY `outcome_sur_survey__16601f_idx` (`survey_response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_coursereflection`
--

LOCK TABLES `outcome_surveys_coursereflection` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_coursereflection` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_coursereflection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_coursereflection_goal_decisions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_coursereflection_goal_decisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursereflection_id` int(11) NOT NULL,
  `multichoiceresponse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outcome_surveys_coursere_coursereflection_id_mult_89d1af54_uniq` (`coursereflection_id`,`multichoiceresponse_id`),
  KEY `outcome_surveys_cour_multichoiceresponse__b3e6a8b6_fk_outcome_s` (`multichoiceresponse_id`),
  CONSTRAINT `outcome_surveys_cour_coursereflection_id_3806b9ae_fk_outcome_s` FOREIGN KEY (`coursereflection_id`) REFERENCES `outcome_surveys_coursereflection` (`id`),
  CONSTRAINT `outcome_surveys_cour_multichoiceresponse__b3e6a8b6_fk_outcome_s` FOREIGN KEY (`multichoiceresponse_id`) REFERENCES `outcome_surveys_multichoiceresponse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_coursereflection_goal_decisions`
--

LOCK TABLES `outcome_surveys_coursereflection_goal_decisions` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_coursereflection_goal_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_coursereflection_goal_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_coursereflection_online_learning_goals`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_coursereflection_online_learning_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursereflection_id` int(11) NOT NULL,
  `multichoiceresponse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `outcome_surveys_coursere_coursereflection_id_mult_d674a28b_uniq` (`coursereflection_id`,`multichoiceresponse_id`),
  KEY `outcome_surveys_cour_multichoiceresponse__0e4d8322_fk_outcome_s` (`multichoiceresponse_id`),
  CONSTRAINT `outcome_surveys_cour_coursereflection_id_5ae3ab28_fk_outcome_s` FOREIGN KEY (`coursereflection_id`) REFERENCES `outcome_surveys_coursereflection` (`id`),
  CONSTRAINT `outcome_surveys_cour_multichoiceresponse__0e4d8322_fk_outcome_s` FOREIGN KEY (`multichoiceresponse_id`) REFERENCES `outcome_surveys_multichoiceresponse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_coursereflection_online_learning_goals`
--

LOCK TABLES `outcome_surveys_coursereflection_online_learning_goals` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_coursereflection_online_learning_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_coursereflection_online_learning_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_learnercourseevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_learnercourseevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `follow_up_date` date NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `already_sent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `outcome_sur_follow__a60cf0_idx` (`follow_up_date`),
  KEY `outcome_sur_created_80c513_idx` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_learnercourseevent`
--

LOCK TABLES `outcome_surveys_learnercourseevent` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_learnercourseevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_learnercourseevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_multichoiceresponse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_multichoiceresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `answer` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_multichoiceresponse`
--

LOCK TABLES `outcome_surveys_multichoiceresponse` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_multichoiceresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_multichoiceresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_surveys_surveyexport`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_surveys_surveyexport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `last_successfull_export_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_surveys_surveyexport`
--

LOCK TABLES `outcome_surveys_surveyexport` WRITE;
/*!40000 ALTER TABLE `outcome_surveys_surveyexport` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_surveys_surveyexport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `exam_name` longtext NOT NULL,
  `time_limit_mins` int(11) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `is_proctored` tinyint(1) NOT NULL,
  `is_practice_exam` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `hide_after_due` tinyint(1) NOT NULL,
  `backend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_course_id_content_id_1d8358cc_uniq` (`course_id`,`content_id`),
  KEY `proctoring_proctoredexam_course_id_8787b34f` (`course_id`),
  KEY `proctoring_proctoredexam_content_id_13d3bec4` (`content_id`),
  KEY `proctoring_proctoredexam_external_id_0181c110` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexam`
--

LOCK TABLES `proctoring_proctoredexam` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamhistory` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `exam_name` longtext NOT NULL,
  `time_limit_mins` int(11) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `is_proctored` tinyint(1) NOT NULL,
  `is_practice_exam` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `hide_after_due` tinyint(1) NOT NULL,
  `backend` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `proctoring_proctored_history_user_id_f11ddc53_fk_auth_user` (`history_user_id`),
  KEY `proctoring_proctoredexamhistory_id_bcb725e3` (`id`),
  KEY `proctoring_proctoredexamhistory_course_id_66a57818` (`course_id`),
  KEY `proctoring_proctoredexamhistory_content_id_ac9543fc` (`content_id`),
  KEY `proctoring_proctoredexamhistory_external_id_711a44cd` (`external_id`),
  CONSTRAINT `proctoring_proctored_history_user_id_f11ddc53_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamhistory`
--

LOCK TABLES `proctoring_proctoredexamhistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamreviewpolicy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamreviewpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `review_policy` longtext NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `set_by_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_57f9ce30_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_set_by_user_id_7c101300_fk_auth_user` (`set_by_user_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_57f9ce30_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_set_by_user_id_7c101300_fk_auth_user` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamreviewpolicy`
--

LOCK TABLES `proctoring_proctoredexamreviewpolicy` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamreviewpolicyhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamreviewpolicyhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `original_id` int(11) NOT NULL,
  `review_policy` longtext NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `set_by_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_8126b616_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_set_by_user_id_42ce126e_fk_auth_user` (`set_by_user_id`),
  KEY `proctoring_proctoredexamreviewpolicyhistory_original_id_ca04913d` (`original_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_8126b616_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_set_by_user_id_42ce126e_fk_auth_user` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamreviewpolicyhistory`
--

LOCK TABLES `proctoring_proctoredexamreviewpolicyhistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicyhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicyhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamsoftwaresecurereview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamsoftwaresecurereview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `attempt_code` varchar(255) NOT NULL,
  `review_status` varchar(255) NOT NULL,
  `raw_data` longtext NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `is_attempt_active` tinyint(1) NOT NULL,
  `encrypted_video_url` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_attempt_code_706d3717_uniq` (`attempt_code`),
  KEY `proctoring_proctored_exam_id_ea6095a3_fk_proctorin` (`exam_id`),
  KEY `proctoring_proctored_reviewed_by_id_546b4204_fk_auth_user` (`reviewed_by_id`),
  KEY `proctoring_proctored_student_id_7e197288_fk_auth_user` (`student_id`),
  CONSTRAINT `proctoring_proctored_exam_id_ea6095a3_fk_proctorin` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_reviewed_by_id_546b4204_fk_auth_user` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `proctoring_proctored_student_id_7e197288_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamsoftwaresecurereview`
--

LOCK TABLES `proctoring_proctoredexamsoftwaresecurereview` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamsoftwaresecurereviewhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `attempt_code` varchar(255) NOT NULL,
  `review_status` varchar(255) NOT NULL,
  `raw_data` longtext NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `is_attempt_active` tinyint(1) NOT NULL,
  `encrypted_video_url` longblob,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_exam_id_380d8588_fk_proctorin` (`exam_id`),
  KEY `proctoring_proctored_reviewed_by_id_bb993b3a_fk_auth_user` (`reviewed_by_id`),
  KEY `proctoring_proctored_student_id_97a63653_fk_auth_user` (`student_id`),
  KEY `proctoring_proctoredexamsof_attempt_code_695faa63` (`attempt_code`),
  CONSTRAINT `proctoring_proctored_exam_id_380d8588_fk_proctorin` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_reviewed_by_id_bb993b3a_fk_auth_user` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `proctoring_proctored_student_id_97a63653_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamsoftwaresecurereviewhistory`
--

LOCK TABLES `proctoring_proctoredexamsoftwaresecurereviewhistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentallowance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentallowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_user_id_proctored_exam_i_56de5b8f_uniq` (`user_id`,`proctored_exam_id`,`key`),
  KEY `proctoring_proctored_proctored_exam_id_9baf5a64_fk_proctorin` (`proctored_exam_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_9baf5a64_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_f21ce9b6_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentallowance`
--

LOCK TABLES `proctoring_proctoredexamstudentallowance` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowance` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentallowancehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentallowancehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `allowance_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_a4c8237c_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_user_id_29b863c1_fk_auth_user` (`user_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_a4c8237c_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_29b863c1_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentallowancehistory`
--

LOCK TABLES `proctoring_proctoredexamstudentallowancehistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattempt`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_status_acknowledged` tinyint(1) NOT NULL,
  `time_remaining_seconds` int(11) DEFAULT NULL,
  `is_resumable` tinyint(1) NOT NULL,
  `ready_to_resume` tinyint(1) NOT NULL,
  `resumed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_0732c688_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctoredexamstudentattempt_attempt_code_b10ad854` (`attempt_code`),
  KEY `proctoring_proctoredexamstudentattempt_external_id_9c302af3` (`external_id`),
  KEY `proctoring_proctoredexamstudentattempt_user_id_2b58b7ed` (`user_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_0732c688_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_2b58b7ed_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattempt`
--

LOCK TABLES `proctoring_proctoredexamstudentattempt` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattempt_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattempt_history` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `is_status_acknowledged` tinyint(1) NOT NULL,
  `time_remaining_seconds` int(11) DEFAULT NULL,
  `is_resumable` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `proctored_exam_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ready_to_resume` tinyint(1) NOT NULL,
  `resumed` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `proctoring_proctored_history_user_id_8594589b_fk_auth_user` (`history_user_id`),
  KEY `proctoring_proctoredexamstudentattempt_history_id_849280b0` (`id`),
  KEY `proctoring_proctoredexamstu_attempt_code_2719f85f` (`attempt_code`),
  KEY `proctoring_proctoredexamstu_external_id_210c6def` (`external_id`),
  KEY `proctoring_proctoredexamstu_proctored_exam_id_446aaba3` (`proctored_exam_id`),
  KEY `proctoring_proctoredexamstudentattempt_history_user_id_ea9fa127` (`user_id`),
  CONSTRAINT `proctoring_proctored_history_user_id_8594589b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattempt_history`
--

LOCK TABLES `proctoring_proctoredexamstudentattempt_history` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattemptcomment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattemptcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `start_time` int(11) NOT NULL,
  `stop_time` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `review_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_review_id_7f4eec67_fk_proctorin` (`review_id`),
  CONSTRAINT `proctoring_proctored_review_id_7f4eec67_fk_proctorin` FOREIGN KEY (`review_id`) REFERENCES `proctoring_proctoredexamsoftwaresecurereview` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattemptcomment`
--

LOCK TABLES `proctoring_proctoredexamstudentattemptcomment` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_courseaccessroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_courseaccessroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role` varchar(64) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_enrollments_cour_role_enrollment_id_5a7bfa63_uniq` (`role`,`enrollment_id`),
  KEY `program_enrollments__enrollment_id_4e0853f0_fk_program_e` (`enrollment_id`),
  CONSTRAINT `program_enrollments__enrollment_id_4e0853f0_fk_program_e` FOREIGN KEY (`enrollment_id`) REFERENCES `program_enrollments_programcourseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_courseaccessroleassignment`
--

LOCK TABLES `program_enrollments_courseaccessroleassignment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_courseaccessroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_courseaccessroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_historicalprogramcourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_historicalprogramcourseenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `status` varchar(9) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `program_enrollment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `program_enrollments__history_user_id_428d002e_fk_auth_user` (`history_user_id`),
  KEY `program_enrollments_histori_id_fe3a72a7` (`id`),
  KEY `program_enrollments_histori_course_enrollment_id_4014ff73` (`course_enrollment_id`),
  KEY `program_enrollments_histori_program_enrollment_id_ebb94d42` (`program_enrollment_id`),
  CONSTRAINT `program_enrollments__history_user_id_428d002e_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_historicalprogramcourseenrollment`
--

LOCK TABLES `program_enrollments_historicalprogramcourseenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramcourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramcourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_historicalprogramenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_historicalprogramenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_key` varchar(255) DEFAULT NULL,
  `program_uuid` char(32) NOT NULL,
  `curriculum_uuid` char(32) NOT NULL,
  `status` varchar(9) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `program_enrollments__history_user_id_abf2d584_fk_auth_user` (`history_user_id`),
  KEY `program_enrollments_historicalprogramenrollment_id_947c385f` (`id`),
  KEY `program_enrollments_histori_external_user_key_5cd8d804` (`external_user_key`),
  KEY `program_enrollments_histori_program_uuid_4c520e40` (`program_uuid`),
  KEY `program_enrollments_histori_curriculum_uuid_a8325208` (`curriculum_uuid`),
  KEY `program_enrollments_historicalprogramenrollment_user_id_e205ccdf` (`user_id`),
  CONSTRAINT `program_enrollments__history_user_id_abf2d584_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_historicalprogramenrollment`
--

LOCK TABLES `program_enrollments_historicalprogramenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_programcourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_programcourseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `status` varchar(9) NOT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  `program_enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_enrollments_prog_program_enrollment_id_co_7d2701fb_uniq` (`program_enrollment_id`,`course_key`),
  KEY `program_enrollments_program_course_enrollment_id_d7890690` (`course_enrollment_id`),
  CONSTRAINT `program_enrollments__course_enrollment_id_d7890690_fk_student_c` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `program_enrollments__program_enrollment_i_02ce2c32_fk_program_e` FOREIGN KEY (`program_enrollment_id`) REFERENCES `program_enrollments_programenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_programcourseenrollment`
--

LOCK TABLES `program_enrollments_programcourseenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_programcourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_programcourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_programenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_programenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_key` varchar(255) DEFAULT NULL,
  `program_uuid` char(32) NOT NULL,
  `curriculum_uuid` char(32) NOT NULL,
  `status` varchar(9) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_enrollments_prog_user_id_program_uuid_cur_ecf769fd_uniq` (`user_id`,`program_uuid`,`curriculum_uuid`),
  UNIQUE KEY `program_enrollments_prog_external_user_key_progra_ec52a567_uniq` (`external_user_key`,`program_uuid`,`curriculum_uuid`),
  KEY `program_enrollments_programenrollment_external_user_key_c27b83c5` (`external_user_key`),
  KEY `program_enrollments_programenrollment_program_uuid_131378e0` (`program_uuid`),
  KEY `program_enrollments_programenrollment_curriculum_uuid_da64e123` (`curriculum_uuid`),
  KEY `program_enrollments_programenrollment_user_id_dcfde442` (`user_id`),
  CONSTRAINT `program_enrollments__user_id_dcfde442_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_programenrollment`
--

LOCK TABLES `program_enrollments_programenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_programenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_programenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_historicalprogramdiscussionsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_historicalprogramdiscussionsconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `program_uuid` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_type` varchar(50) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `programs_historicalp_history_user_id_f7f2a83d_fk_auth_user` (`history_user_id`),
  KEY `programs_historicalprogramd_program_uuid_688a7a3b` (`program_uuid`),
  KEY `programs_historicalprogramd_lti_configuration_id_d06284f6` (`lti_configuration_id`),
  CONSTRAINT `programs_historicalp_history_user_id_f7f2a83d_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_historicalprogramdiscussionsconfiguration`
--

LOCK TABLES `programs_historicalprogramdiscussionsconfiguration` WRITE;
/*!40000 ALTER TABLE `programs_historicalprogramdiscussionsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs_historicalprogramdiscussionsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_historicalprogramliveconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_historicalprogramliveconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `program_uuid` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_type` varchar(50) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `programs_historicalp_history_user_id_80056ec3_fk_auth_user` (`history_user_id`),
  KEY `programs_historicalprograml_program_uuid_61256da7` (`program_uuid`),
  KEY `programs_historicalprograml_lti_configuration_id_db7b44b9` (`lti_configuration_id`),
  CONSTRAINT `programs_historicalp_history_user_id_80056ec3_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_historicalprogramliveconfiguration`
--

LOCK TABLES `programs_historicalprogramliveconfiguration` WRITE;
/*!40000 ALTER TABLE `programs_historicalprogramliveconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs_historicalprogramliveconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_programdiscussionsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_programdiscussionsconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `program_uuid` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_type` varchar(50) NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`program_uuid`),
  KEY `programs_programdisc_lti_configuration_id_822f71be_fk_lti_consu` (`lti_configuration_id`),
  CONSTRAINT `programs_programdisc_lti_configuration_id_822f71be_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_programdiscussionsconfiguration`
--

LOCK TABLES `programs_programdiscussionsconfiguration` WRITE;
/*!40000 ALTER TABLE `programs_programdiscussionsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs_programdiscussionsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_programliveconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_programliveconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `program_uuid` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_type` varchar(50) NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`program_uuid`),
  KEY `programs_programlive_lti_configuration_id_c72e8df4_fk_lti_consu` (`lti_configuration_id`),
  CONSTRAINT `programs_programlive_lti_configuration_id_c72e8df4_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_programliveconfiguration`
--

LOCK TABLES `programs_programliveconfiguration` WRITE;
/*!40000 ALTER TABLE `programs_programliveconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs_programliveconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_programsapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_programsapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `marketing_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programs_programsapi_changed_by_id_93e09d74_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `programs_programsapi_changed_by_id_93e09d74_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_programsapiconfig`
--

LOCK TABLES `programs_programsapiconfig` WRITE;
/*!40000 ALTER TABLE `programs_programsapiconfig` DISABLE KEYS */;
INSERT INTO `programs_programsapiconfig` VALUES (1,'2023-02-21 14:30:11.135179',1,NULL,'');
/*!40000 ALTER TABLE `programs_programsapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_proxy_whitelistedrssurl`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_proxy_whitelistedrssurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_proxy_whitelistedrssurl`
--

LOCK TABLES `rss_proxy_whitelistedrssurl` WRITE;
/*!40000 ALTER TABLE `rss_proxy_whitelistedrssurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_proxy_whitelistedrssurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) NOT NULL,
  `catalogs_to_transmit` longtext NOT NULL,
  `key` varchar(255) NOT NULL,
  `sapsf_base_url` varchar(255) NOT NULL,
  `sapsf_company_id` varchar(255) NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `additional_locales` longtext NOT NULL,
  `show_course_price` tinyint(1) NOT NULL,
  `transmit_total_hours` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `prevent_self_submit_grades` tinyint(1) NOT NULL,
  `idp_id` varchar(255) NOT NULL,
  `disable_learner_data_transmissions` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `dry_run_mode_enabled` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_content_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_learner_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_sync_attempted_at` datetime(6) DEFAULT NULL,
  `last_sync_errored_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sap_success_factors__enterprise_customer__4819a28c_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `sap_success_factors__enterprise_customer__4819a28c_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_sapsuccessfactorsglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorsglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `course_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `search_student_api_path` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sap_success_factors__changed_by_id_e3241cc9_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `sap_success_factors__changed_by_id_e3241cc9_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_sapsuccessfactorsglobalconfiguration`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorsglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sapsf_user_id` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `total_hours` double DEFAULT NULL,
  `sap_completed_timestamp` bigint(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `created` datetime(6) NOT NULL,
  `credit_hours` double DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `modified` datetime(6) NOT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `sap_success_factors_sapsucc_enterprise_course_enrollmen_99be77d5` (`enterprise_course_enrollment_id`),
  KEY `sap_success_factors_sapsucc_subsection_id_16d4fa9f` (`subsection_id`),
  KEY `sapsf_sldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `sap_success_factors__api_record_id_17e80380_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save_for_later_savedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `save_for_later_savedcourse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `marketing_url` varchar(255) DEFAULT NULL,
  `max_effort` int(11) DEFAULT NULL,
  `min_effort` int(11) DEFAULT NULL,
  `org_img_url` varchar(255) DEFAULT NULL,
  `weeks_to_complete` int(11) DEFAULT NULL,
  `email_sent_count` int(11) DEFAULT NULL,
  `reminder_email_sent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `save_for_later_savedcourse_email_course_id_1f83cc89_uniq` (`email`,`course_id`),
  KEY `save_for_later_savedcourse_email_a7a78246` (`email`),
  KEY `save_for_later_savedcourse_course_id_563c1de2` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save_for_later_savedcourse`
--

LOCK TABLES `save_for_later_savedcourse` WRITE;
/*!40000 ALTER TABLE `save_for_later_savedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `save_for_later_savedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save_for_later_savedprogram`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `save_for_later_savedprogram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `program_uuid` char(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email_sent_count` int(11) DEFAULT NULL,
  `reminder_email_sent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `save_for_later_savedprogram_email_program_uuid_2ea5e0c1_uniq` (`email`,`program_uuid`),
  KEY `save_for_later_savedprogram_email_af38009b` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save_for_later_savedprogram`
--

LOCK TABLES `save_for_later_savedprogram` WRITE;
/*!40000 ALTER TABLE `save_for_later_savedprogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `save_for_later_savedprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_historicalschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_historicalschedule` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `schedules_historicalschedule_id_f1648c81` (`id`),
  KEY `schedules_historicalschedule_start_date_8c02ff20` (`start_date`),
  KEY `schedules_historicalschedule_upgrade_deadline_ba67bbd9` (`upgrade_deadline`),
  KEY `schedules_historicalschedule_enrollment_id_cd620413` (`enrollment_id`),
  KEY `schedules_historical_history_user_id_6f5d6d7b_fk_auth_user` (`history_user_id`),
  CONSTRAINT `schedules_historical_history_user_id_6f5d6d7b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_historicalschedule`
--

LOCK TABLES `schedules_historicalschedule` WRITE;
/*!40000 ALTER TABLE `schedules_historicalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules_historicalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `enrollment_id` int(11) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  KEY `schedules_schedule_upgrade_deadline_0079081d` (`upgrade_deadline`),
  KEY `schedules_schedule_start_date_3a1c341e` (`start_date`),
  CONSTRAINT `schedules_schedule_enrollment_id_91bf8152_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_schedule`
--

LOCK TABLES `schedules_schedule` WRITE;
/*!40000 ALTER TABLE `schedules_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_scheduleconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_scheduleconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enqueue_recurring_nudge` tinyint(1) NOT NULL,
  `deliver_recurring_nudge` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `deliver_upgrade_reminder` tinyint(1) NOT NULL,
  `enqueue_upgrade_reminder` tinyint(1) NOT NULL,
  `deliver_course_update` tinyint(1) NOT NULL,
  `enqueue_course_update` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_scheduleconfig_changed_by_id_38ef599b_fk_auth_user_id` (`changed_by_id`),
  KEY `schedules_scheduleconfig_site_id_44296ee1_fk_django_site_id` (`site_id`),
  CONSTRAINT `schedules_scheduleconfig_changed_by_id_38ef599b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `schedules_scheduleconfig_site_id_44296ee1_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_scheduleconfig`
--

LOCK TABLES `schedules_scheduleconfig` WRITE;
/*!40000 ALTER TABLE `schedules_scheduleconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules_scheduleconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_scheduleexperience`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_scheduleexperience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experience_type` smallint(5) unsigned NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `schedules_scheduleex_schedule_id_ed95c8e7_fk_schedules` FOREIGN KEY (`schedule_id`) REFERENCES `schedules_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_scheduleexperience`
--

LOCK TABLES `schedules_scheduleexperience` WRITE;
/*!40000 ALTER TABLE `schedules_scheduleexperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules_scheduleexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_siteconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_siteconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `site_values` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `site_configuration_s_site_id_84302d1f_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_siteconfiguration`
--

LOCK TABLES `site_configuration_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `site_configuration_siteconfiguration` DISABLE KEYS */;
INSERT INTO `site_configuration_siteconfiguration` VALUES (1,1,1,'{\n    \"COURSE_CATALOG_API_URL\": \"http://edx.devstack.discovery:18381/api/v1/\"\n}');
/*!40000 ALTER TABLE `site_configuration_siteconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_siteconfigurationhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_siteconfigurationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `site_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `site_values` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_configuration_s_site_id_272f5c1a_fk_django_si` (`site_id`),
  CONSTRAINT `site_configuration_s_site_id_272f5c1a_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_siteconfigurationhistory`
--

LOCK TABLES `site_configuration_siteconfigurationhistory` WRITE;
/*!40000 ALTER TABLE `site_configuration_siteconfigurationhistory` DISABLE KEYS */;
INSERT INTO `site_configuration_siteconfigurationhistory` VALUES (1,'2023-02-21 14:30:11.153776','2023-02-21 14:30:11.153776',1,1,'{\n    \"COURSE_CATALOG_API_URL\": \"http://edx.devstack.discovery:18381/api/v1/\"\n}');
/*!40000 ALTER TABLE `site_configuration_siteconfigurationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splash_splashconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splash_splashconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cookie_name` longtext NOT NULL,
  `cookie_allowed_values` longtext NOT NULL,
  `unaffected_usernames` longtext NOT NULL,
  `unaffected_url_paths` longtext NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `splash_splashconfig_changed_by_id_883b17ba_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `splash_splashconfig_changed_by_id_883b17ba_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splash_splashconfig`
--

LOCK TABLES `splash_splashconfig` WRITE;
/*!40000 ALTER TABLE `splash_splashconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `splash_splashconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `split_modulestore_django_historicalsplitmodulestorecourseindex`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `split_modulestore_django_historicalsplitmodulestorecourseindex` (
  `id` int(11) NOT NULL,
  `objectid` varchar(24) NOT NULL,
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `org` varchar(255) NOT NULL,
  `draft_version` varchar(24) NOT NULL,
  `published_version` varchar(24) NOT NULL,
  `library_version` varchar(24) NOT NULL,
  `wiki_slug` varchar(255) NOT NULL,
  `base_store` varchar(20) NOT NULL,
  `edited_on` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `edited_by_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `split_modulestore_dj_history_user_id_754e3954_fk_auth_user` (`history_user_id`),
  KEY `split_modulestore_django_hi_id_cca5b74e` (`id`),
  KEY `split_modulestore_django_hi_objectid_9082e8b9` (`objectid`),
  KEY `split_modulestore_django_hi_course_id_5d260730` (`course_id`),
  KEY `split_modulestore_django_hi_org_fa289e5d` (`org`),
  KEY `split_modulestore_django_hi_wiki_slug_74bcb405` (`wiki_slug`),
  CONSTRAINT `split_modulestore_dj_history_user_id_754e3954_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `split_modulestore_django_historicalsplitmodulestorecourseindex`
--

LOCK TABLES `split_modulestore_django_historicalsplitmodulestorecourseindex` WRITE;
/*!40000 ALTER TABLE `split_modulestore_django_historicalsplitmodulestorecourseindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `split_modulestore_django_historicalsplitmodulestorecourseindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `split_modulestore_django_splitmodulestorecourseindex`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `split_modulestore_django_splitmodulestorecourseindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` varchar(24) NOT NULL,
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `org` varchar(255) NOT NULL,
  `draft_version` varchar(24) NOT NULL,
  `published_version` varchar(24) NOT NULL,
  `library_version` varchar(24) NOT NULL,
  `wiki_slug` varchar(255) NOT NULL,
  `base_store` varchar(20) NOT NULL,
  `edited_on` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `edited_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectid` (`objectid`),
  UNIQUE KEY `course_id` (`course_id`),
  UNIQUE KEY `course_id_2` (`course_id`),
  KEY `split_modulestore_django_sp_org_47b4a2ef` (`org`),
  KEY `split_modulestore_django_sp_wiki_slug_20040736` (`wiki_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `split_modulestore_django_splitmodulestorecourseindex`
--

LOCK TABLES `split_modulestore_django_splitmodulestorecourseindex` WRITE;
/*!40000 ALTER TABLE `split_modulestore_django_splitmodulestorecourseindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `split_modulestore_django_splitmodulestorecourseindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffgrader_submissiongradinglock`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffgrader_submissiongradinglock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `owner_id` varchar(40) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffgrader_submissiongradinglock`
--

LOCK TABLES `staffgrader_submissiongradinglock` WRITE;
/*!40000 ALTER TABLE `staffgrader_submissiongradinglock` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffgrader_submissiongradinglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_replace_assetbaseurlconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_replace_assetbaseurlconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `base_url` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `static_replace_asset_changed_by_id_f592e050_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `static_replace_asset_changed_by_id_f592e050_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_replace_assetbaseurlconfig`
--

LOCK TABLES `static_replace_assetbaseurlconfig` WRITE;
/*!40000 ALTER TABLE `static_replace_assetbaseurlconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_replace_assetbaseurlconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_replace_assetexcludedextensionsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_replace_assetexcludedextensionsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `excluded_extensions` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `static_replace_asset_changed_by_id_e58299b3_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `static_replace_asset_changed_by_id_e58299b3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_replace_assetexcludedextensionsconfig`
--

LOCK TABLES `static_replace_assetexcludedextensionsconfig` WRITE;
/*!40000 ALTER TABLE `static_replace_assetexcludedextensionsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_replace_assetexcludedextensionsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_coursemessage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_coursemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `message` longtext,
  `global_message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_coursemessage_global_message_id_01bbfbe6_fk_status_gl` (`global_message_id`),
  KEY `status_coursemessage_course_key_90c77a2e` (`course_key`),
  CONSTRAINT `status_coursemessage_global_message_id_01bbfbe6_fk_status_gl` FOREIGN KEY (`global_message_id`) REFERENCES `status_globalstatusmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_coursemessage`
--

LOCK TABLES `status_coursemessage` WRITE;
/*!40000 ALTER TABLE `status_coursemessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_coursemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_globalstatusmessage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_globalstatusmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `message` longtext,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_globalstatusm_changed_by_id_3c627848_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `status_globalstatusm_changed_by_id_3c627848_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_globalstatusmessage`
--

LOCK TABLES `status_globalstatusmessage` WRITE;
/*!40000 ALTER TABLE `status_globalstatusmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_globalstatusmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_accountrecoveryconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_accountrecoveryconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `csv_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_accountrecov_changed_by_id_d9d1ddf6_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_accountrecov_changed_by_id_d9d1ddf6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_accountrecoveryconfiguration`
--

LOCK TABLES `student_accountrecoveryconfiguration` WRITE;
/*!40000 ALTER TABLE `student_accountrecoveryconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_accountrecoveryconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_allowedauthuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_allowedauthuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `student_allowedauthuser_site_id_9a6aae9b_fk_django_site_id` (`site_id`),
  CONSTRAINT `student_allowedauthuser_site_id_9a6aae9b_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_allowedauthuser`
--

LOCK TABLES `student_allowedauthuser` WRITE;
/*!40000 ALTER TABLE `student_allowedauthuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_allowedauthuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_anonymoususerid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_anonymoususerid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anonymous_user_id` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anonymous_user_id` (`anonymous_user_id`),
  KEY `student_anonymoususerid_user_id_0fb2ad5c_fk_auth_user_id` (`user_id`),
  KEY `student_anonymoususerid_course_id_99cc6a18` (`course_id`),
  CONSTRAINT `student_anonymoususerid_user_id_0fb2ad5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
INSERT INTO `student_anonymoususerid` VALUES (1,'c9eac113d5ec22b2e5c36ea75b380659','',11);
/*!40000 ALTER TABLE `student_anonymoususerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_bulkchangeenrollmentconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_bulkchangeenrollmentconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `csv_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_bulkchangeen_changed_by_id_38bf23de_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_bulkchangeen_changed_by_id_38bf23de_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_bulkchangeenrollmentconfiguration`
--

LOCK TABLES `student_bulkchangeenrollmentconfiguration` WRITE;
/*!40000 ALTER TABLE `student_bulkchangeenrollmentconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_bulkchangeenrollmentconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_bulkunenrollconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_bulkunenrollconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `csv_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_bulkunenroll_changed_by_id_7b6131b9_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_bulkunenroll_changed_by_id_7b6131b9_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_bulkunenrollconfiguration`
--

LOCK TABLES `student_bulkunenrollconfiguration` WRITE;
/*!40000 ALTER TABLE `student_bulkunenrollconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_bulkunenrollconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseaccessrole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseaccessrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org` varchar(64) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `role` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseaccessrole_user_id_org_course_id_ro_bbf71126_uniq` (`user_id`,`org`,`course_id`,`role`),
  KEY `student_courseaccessrole_org_6d2dbb7a` (`org`),
  KEY `student_courseaccessrole_course_id_60fb355e` (`course_id`),
  KEY `student_courseaccessrole_role_1ac888ea` (`role`),
  CONSTRAINT `student_courseaccessrole_user_id_90cf21fe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseaccessrole`
--

LOCK TABLES `student_courseaccessrole` WRITE;
/*!40000 ALTER TABLE `student_courseaccessrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseaccessrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollment_user_id_course_id_5d34a47f_uniq` (`user_id`,`course_id`),
  KEY `student_courseenrollment_user_id_4263a8e2` (`user_id`),
  KEY `student_cou_user_id_b19dcd_idx` (`user_id`,`created`),
  KEY `student_courseenrollment_course_id_a6f93be8` (`course_id`),
  KEY `student_courseenrollment_created_79829893` (`created`),
  CONSTRAINT `student_courseenrollment_user_id_4263a8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollment_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollment_history` (
  `id` int(11) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `history_id` char(32) NOT NULL,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `student_courseenroll_history_user_id_7065c772_fk_auth_user` (`history_user_id`),
  KEY `student_courseenrollment_history_id_2d80b9b3` (`id`),
  KEY `student_courseenrollment_history_created_6b3154af` (`created`),
  KEY `student_courseenrollment_history_course_id_98f13917` (`course_id`),
  KEY `student_courseenrollment_history_user_id_5f94c628` (`user_id`),
  CONSTRAINT `student_courseenroll_history_user_id_7065c772_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment_history`
--

LOCK TABLES `student_courseenrollment_history` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentallowed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `auto_enroll` tinyint(1) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollmentallowed_email_course_id_1e23ed5e_uniq` (`email`,`course_id`),
  KEY `student_courseenrollmentallowed_user_id_5875cce6_fk_auth_user_id` (`user_id`),
  KEY `student_courseenrollmentallowed_email_969706a0` (`email`),
  KEY `student_courseenrollmentallowed_course_id_67eff667` (`course_id`),
  KEY `student_courseenrollmentallowed_created_b2066658` (`created`),
  CONSTRAINT `student_courseenrollmentallowed_user_id_5875cce6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentallowed`
--

LOCK TABLES `student_courseenrollmentallowed` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_courseenroll_enrollment_id_b2173db0_fk_student_c` (`enrollment_id`),
  CONSTRAINT `student_courseenroll_enrollment_id_b2173db0_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentattribute`
--

LOCK TABLES `student_courseenrollmentattribute` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentcelebration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentcelebration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `celebrate_first_section` tinyint(1) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `celebrate_weekly_goal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  CONSTRAINT `student_courseenroll_enrollment_id_c697e4ce_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentcelebration`
--

LOCK TABLES `student_courseenrollmentcelebration` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentcelebration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentcelebration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_dashboardconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_dashboardconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `recent_enrollment_time_delta` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_dashboardcon_changed_by_id_1960484b_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_dashboardcon_changed_by_id_1960484b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_dashboardconfiguration`
--

LOCK TABLES `student_dashboardconfiguration` WRITE;
/*!40000 ALTER TABLE `student_dashboardconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_dashboardconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_enrollmentrefundconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_enrollmentrefundconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `refund_window_microseconds` bigint(20) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_enrollmentre_changed_by_id_082b4f6f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_enrollmentre_changed_by_id_082b4f6f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_enrollmentrefundconfiguration`
--

LOCK TABLES `student_enrollmentrefundconfiguration` WRITE;
/*!40000 ALTER TABLE `student_enrollmentrefundconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_enrollmentrefundconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_entranceexamconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_entranceexamconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `skip_entrance_exam` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_entranceexamconf_user_id_course_id_23bbcf9b_uniq` (`user_id`,`course_id`),
  KEY `student_entranceexamconfiguration_course_id_eca5c3d4` (`course_id`),
  KEY `student_entranceexamconfiguration_created_27e80637` (`created`),
  KEY `student_entranceexamconfiguration_updated_d560d552` (`updated`),
  CONSTRAINT `student_entranceexam_user_id_387a35d6_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_entranceexamconfiguration`
--

LOCK TABLES `student_entranceexamconfiguration` WRITE;
/*!40000 ALTER TABLE `student_entranceexamconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_entranceexamconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_fbeenrollmentexclusion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_fbeenrollmentexclusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  CONSTRAINT `student_fbeenrollmen_enrollment_id_28537ff8_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_fbeenrollmentexclusion`
--

LOCK TABLES `student_fbeenrollmentexclusion` WRITE;
/*!40000 ALTER TABLE `student_fbeenrollmentexclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_fbeenrollmentexclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_historicalmanualenrollmentaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_historicalmanualenrollmentaudit` (
  `id` int(11) NOT NULL,
  `enrolled_email` varchar(255) NOT NULL,
  `time_stamp` datetime(6) DEFAULT NULL,
  `state_transition` varchar(255) NOT NULL,
  `reason` longtext,
  `role` varchar(64) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enrolled_by_id` int(11) DEFAULT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `student_historicalma_history_user_id_b5f488c2_fk_auth_user` (`history_user_id`),
  KEY `student_historicalmanualenrollmentaudit_id_18eb7e98` (`id`),
  KEY `student_historicalmanualenrollmentaudit_enrolled_email_bfaa34b3` (`enrolled_email`),
  KEY `student_historicalmanualenrollmentaudit_enrolled_by_id_0838a44b` (`enrolled_by_id`),
  KEY `student_historicalmanualenrollmentaudit_enrollment_id_b74f8923` (`enrollment_id`),
  CONSTRAINT `student_historicalma_history_user_id_b5f488c2_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_historicalmanualenrollmentaudit`
--

LOCK TABLES `student_historicalmanualenrollmentaudit` WRITE;
/*!40000 ALTER TABLE `student_historicalmanualenrollmentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_historicalmanualenrollmentaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_languageproficiency`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_languageproficiency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_languageproficiency_code_user_profile_id_9aa4e2f5_uniq` (`code`,`user_profile_id`),
  KEY `student_languageprof_user_profile_id_768cd3eb_fk_auth_user` (`user_profile_id`),
  CONSTRAINT `student_languageprof_user_profile_id_768cd3eb_fk_auth_user` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_languageproficiency`
--

LOCK TABLES `student_languageproficiency` WRITE;
/*!40000 ALTER TABLE `student_languageproficiency` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_languageproficiency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_linkedinaddtoprofileconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_linkedinaddtoprofileconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `company_identifier` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_linkedinaddt_changed_by_id_dc1c453f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_linkedinaddt_changed_by_id_dc1c453f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_linkedinaddtoprofileconfiguration`
--

LOCK TABLES `student_linkedinaddtoprofileconfiguration` WRITE;
/*!40000 ALTER TABLE `student_linkedinaddtoprofileconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_linkedinaddtoprofileconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_loginfailures`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_loginfailures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `failure_count` int(11) NOT NULL,
  `lockout_until` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_loginfailures_user_id_50d85202_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_loginfailures_user_id_50d85202_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_loginfailures`
--

LOCK TABLES `student_loginfailures` WRITE;
/*!40000 ALTER TABLE `student_loginfailures` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_loginfailures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_manualenrollmentaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_manualenrollmentaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrolled_email` varchar(255) NOT NULL,
  `time_stamp` datetime(6) DEFAULT NULL,
  `state_transition` varchar(255) NOT NULL,
  `reason` longtext,
  `enrolled_by_id` int(11) DEFAULT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_manualenroll_enrolled_by_id_1217a0dc_fk_auth_user` (`enrolled_by_id`),
  KEY `student_manualenroll_enrollment_id_decc94fe_fk_student_c` (`enrollment_id`),
  KEY `student_manualenrollmentaudit_enrolled_email_47ce6524` (`enrolled_email`),
  CONSTRAINT `student_manualenroll_enrolled_by_id_1217a0dc_fk_auth_user` FOREIGN KEY (`enrolled_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_manualenroll_enrollment_id_decc94fe_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_manualenrollmentaudit`
--

LOCK TABLES `student_manualenrollmentaudit` WRITE;
/*!40000 ALTER TABLE `student_manualenrollmentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_manualenrollmentaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingemailchange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingemailchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_email` varchar(255) NOT NULL,
  `activation_key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_pendingemailchange_new_email_6887bdea` (`new_email`),
  CONSTRAINT `student_pendingemailchange_user_id_8f2778c5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingemailchange`
--

LOCK TABLES `student_pendingemailchange` WRITE;
/*!40000 ALTER TABLE `student_pendingemailchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingemailchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingnamechange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingnamechange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_name` varchar(255) NOT NULL,
  `rationale` varchar(1024) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `student_pendingnamechange_user_id_e2cd8b70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingnamechange`
--

LOCK TABLES `student_pendingnamechange` WRITE;
/*!40000 ALTER TABLE `student_pendingnamechange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingnamechange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingsecondaryemailchange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingsecondaryemailchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_secondary_email` varchar(255) NOT NULL,
  `activation_key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_pendingsecondaryemailchange_new_secondary_email_5e79db59` (`new_secondary_email`),
  CONSTRAINT `student_pendingsecon_user_id_deacc54f_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingsecondaryemailchange`
--

LOCK TABLES `student_pendingsecondaryemailchange` WRITE;
/*!40000 ALTER TABLE `student_pendingsecondaryemailchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingsecondaryemailchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_registrationcookieconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_registrationcookieconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `utm_cookie_name` varchar(255) NOT NULL,
  `affiliate_cookie_name` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_registration_changed_by_id_52ac88b0_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_registration_changed_by_id_52ac88b0_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_registrationcookieconfiguration`
--

LOCK TABLES `student_registrationcookieconfiguration` WRITE;
/*!40000 ALTER TABLE `student_registrationcookieconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_registrationcookieconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_sociallink`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_sociallink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(30) NOT NULL,
  `social_link` varchar(100) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_sociallink_user_profile_id_19f54475_fk_auth_user` (`user_profile_id`),
  CONSTRAINT `student_sociallink_user_profile_id_19f54475_fk_auth_user` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_sociallink`
--

LOCK TABLES `student_sociallink` WRITE;
/*!40000 ALTER TABLE `student_sociallink` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_sociallink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_userattribute_user_id_name_70e18f46_uniq` (`user_id`,`name`),
  KEY `student_userattribute_name_a55155e3` (`name`),
  CONSTRAINT `student_userattribute_user_id_19c01f5e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userattribute`
--

LOCK TABLES `student_userattribute` WRITE;
/*!40000 ALTER TABLE `student_userattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usercelebration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usercelebration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `last_day_of_streak` date DEFAULT NULL,
  `streak_length` int(11) NOT NULL,
  `longest_ever_streak` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `student_usercelebration_user_id_8682222f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usercelebration`
--

LOCK TABLES `student_usercelebration` WRITE;
/*!40000 ALTER TABLE `student_usercelebration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usercelebration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userpasswordtogglehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userpasswordtogglehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_userpassword_created_by_id_f7092add_fk_auth_user` (`created_by_id`),
  KEY `student_userpassword_user_id_1e2a09c9_fk_auth_user` (`user_id`),
  CONSTRAINT `student_userpassword_created_by_id_f7092add_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_userpassword_user_id_1e2a09c9_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userpasswordtogglehistory`
--

LOCK TABLES `student_userpasswordtogglehistory` WRITE;
/*!40000 ALTER TABLE `student_userpasswordtogglehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userpasswordtogglehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usersignupsource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usersignupsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usersignupsource_user_id_4979dd6e_fk_auth_user_id` (`user_id`),
  KEY `student_usersignupsource_site_beb4d383` (`site`),
  CONSTRAINT `student_usersignupsource_user_id_4979dd6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usersignupsource`
--

LOCK TABLES `student_usersignupsource` WRITE;
/*!40000 ALTER TABLE `student_usersignupsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usersignupsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userstanding`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userstanding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_status` varchar(31) NOT NULL,
  `standing_last_changed_at` datetime(6) NOT NULL,
  `changed_by_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_userstanding_changed_by_id_469252b4_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_userstanding_changed_by_id_469252b4_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_userstanding_user_id_00b147e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userstanding`
--

LOCK TABLES `student_userstanding` WRITE;
/*!40000 ALTER TABLE `student_userstanding` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userstanding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usertestgroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usertestgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usertestgroup_name_94f48ddb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usertestgroup`
--

LOCK TABLES `student_usertestgroup` WRITE;
/*!40000 ALTER TABLE `student_usertestgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usertestgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usertestgroup_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usertestgroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertestgroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_usertestgroup_us_usertestgroup_id_user_id_2bbf095a_uniq` (`usertestgroup_id`,`user_id`),
  KEY `student_usertestgroup_users_user_id_81b93062_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_usertestgrou_usertestgroup_id_a9097958_fk_student_u` FOREIGN KEY (`usertestgroup_id`) REFERENCES `student_usertestgroup` (`id`),
  CONSTRAINT `student_usertestgroup_users_user_id_81b93062_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usertestgroup_users`
--

LOCK TABLES `student_usertestgroup_users` WRITE;
/*!40000 ALTER TABLE `student_usertestgroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usertestgroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_score`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points_earned` int(10) unsigned NOT NULL,
  `points_possible` int(10) unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `reset` tinyint(1) NOT NULL,
  `student_item_id` int(11) NOT NULL,
  `submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_score_student_item_id_de4f5954_fk_submissio` (`student_item_id`),
  KEY `submissions_score_submission_id_ba095829_fk_submissio` (`submission_id`),
  KEY `submissions_score_created_at_b65f0390` (`created_at`),
  CONSTRAINT `submissions_score_student_item_id_de4f5954_fk_submissio` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submissions_score_submission_id_ba095829_fk_submissio` FOREIGN KEY (`submission_id`) REFERENCES `submissions_submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_score`
--

LOCK TABLES `submissions_score` WRITE;
/*!40000 ALTER TABLE `submissions_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_scoreannotation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_scoreannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annotation_type` varchar(255) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `score_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_scoreann_score_id_2dda6e02_fk_submissio` (`score_id`),
  KEY `submissions_scoreannotation_annotation_type_117a2607` (`annotation_type`),
  KEY `submissions_scoreannotation_creator_5cc126cc` (`creator`),
  CONSTRAINT `submissions_scoreann_score_id_2dda6e02_fk_submissio` FOREIGN KEY (`score_id`) REFERENCES `submissions_score` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_scoreannotation`
--

LOCK TABLES `submissions_scoreannotation` WRITE;
/*!40000 ALTER TABLE `submissions_scoreannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_scoreannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_scoresummary`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_scoresummary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `highest_id` int(11) NOT NULL,
  `latest_id` int(11) NOT NULL,
  `student_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_item_id` (`student_item_id`),
  KEY `submissions_scoresum_highest_id_3efe897d_fk_submissio` (`highest_id`),
  KEY `submissions_scoresum_latest_id_dd8a17bb_fk_submissio` (`latest_id`),
  CONSTRAINT `submissions_scoresum_highest_id_3efe897d_fk_submissio` FOREIGN KEY (`highest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `submissions_scoresum_latest_id_dd8a17bb_fk_submissio` FOREIGN KEY (`latest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `submissions_scoresum_student_item_id_35f8ef06_fk_submissio` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_scoresummary`
--

LOCK TABLES `submissions_scoresummary` WRITE;
/*!40000 ALTER TABLE `submissions_scoresummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_scoresummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_studentitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_studentitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submissions_studentitem_course_id_student_id_ite_5b02ecf8_uniq` (`course_id`,`student_id`,`item_id`),
  KEY `submissions_studentitem_student_id_8e72bcd9` (`student_id`),
  KEY `submissions_studentitem_course_id_05ee1efe` (`course_id`),
  KEY `submissions_studentitem_item_id_6c409784` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_studentitem`
--

LOCK TABLES `submissions_studentitem` WRITE;
/*!40000 ALTER TABLE `submissions_studentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_studentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_submission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `attempt_number` int(10) unsigned NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `raw_answer` longtext NOT NULL,
  `student_item_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `team_submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_submissi_team_submission_id_40e6bc97_fk_submissio` (`team_submission_id`),
  KEY `submissions_submissi_student_item_id_9d087470_fk_submissio` (`student_item_id`),
  KEY `submissions_submission_uuid_210428ab` (`uuid`),
  KEY `submissions_submission_submitted_at_9653124d` (`submitted_at`),
  KEY `submissions_submission_created_at_01c4bf22` (`created_at`),
  CONSTRAINT `submissions_submissi_student_item_id_9d087470_fk_submissio` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submissions_submissi_team_submission_id_40e6bc97_fk_submissio` FOREIGN KEY (`team_submission_id`) REFERENCES `submissions_teamsubmission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_submission`
--

LOCK TABLES `submissions_submission` WRITE;
/*!40000 ALTER TABLE `submissions_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_teamsubmission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_teamsubmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `attempt_number` int(10) unsigned NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `submitted_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_teamsubm_submitted_by_id_5a27162a_fk_auth_user` (`submitted_by_id`),
  KEY `submissions_teamsubmission_uuid_4d1aef87` (`uuid`),
  KEY `submissions_teamsubmission_submitted_at_74e28ed6` (`submitted_at`),
  KEY `submissions_teamsubmission_course_id_68c6908d` (`course_id`),
  KEY `submissions_teamsubmission_item_id_2bdcb26c` (`item_id`),
  KEY `submissions_teamsubmission_team_id_5fda0e54` (`team_id`),
  CONSTRAINT `submissions_teamsubm_submitted_by_id_5a27162a_fk_auth_user` FOREIGN KEY (`submitted_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_teamsubmission`
--

LOCK TABLES `submissions_teamsubmission` WRITE;
/*!40000 ALTER TABLE `submissions_teamsubmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_teamsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_csv_csvoperation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_csv_csvoperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `original_filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `super_csv_csvoperation_class_name_c8b5b4e2` (`class_name`),
  KEY `super_csv_csvoperation_unique_id_08aa974e` (`unique_id`),
  KEY `super_csv_csvoperation_user_id_f87de59a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `super_csv_csvoperation_user_id_f87de59a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_csv_csvoperation`
--

LOCK TABLES `super_csv_csvoperation` WRITE;
/*!40000 ALTER TABLE `super_csv_csvoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_csv_csvoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_historicalusersocialauth`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_historicalusersocialauth` (
  `id` int(11) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `support_historicalus_history_user_id_a54cd5b3_fk_auth_user` (`history_user_id`),
  KEY `support_historicalusersocialauth_id_979b8a3c` (`id`),
  KEY `support_historicalusersocialauth_uid_9f2e466e` (`uid`),
  KEY `support_historicalusersocialauth_user_id_95d74953` (`user_id`),
  CONSTRAINT `support_historicalus_history_user_id_a54cd5b3_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_historicalusersocialauth`
--

LOCK TABLES `support_historicalusersocialauth` WRITE;
/*!40000 ALTER TABLE `support_historicalusersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_historicalusersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_report_surveyreport`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_report_surveyreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `courses_offered` bigint(20) NOT NULL,
  `learners` bigint(20) NOT NULL,
  `registered_learners` bigint(20) NOT NULL,
  `enrollments` bigint(20) NOT NULL,
  `generated_certificates` bigint(20) NOT NULL,
  `extra_data` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `state` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_report_surveyreport`
--

LOCK TABLES `survey_report_surveyreport` WRITE;
/*!40000 ALTER TABLE `survey_report_surveyreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_report_surveyreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveyanswer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveyanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_value` varchar(1024) NOT NULL,
  `course_key` varchar(255) DEFAULT NULL,
  `form_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_surveyanswer_form_id_7f0df59f_fk_survey_surveyform_id` (`form_id`),
  KEY `survey_surveyanswer_user_id_4c028d25_fk_auth_user_id` (`user_id`),
  KEY `survey_surveyanswer_field_name_7123dc3d` (`field_name`),
  KEY `survey_surveyanswer_course_key_497ade68` (`course_key`),
  CONSTRAINT `survey_surveyanswer_form_id_7f0df59f_fk_survey_surveyform_id` FOREIGN KEY (`form_id`) REFERENCES `survey_surveyform` (`id`),
  CONSTRAINT `survey_surveyanswer_user_id_4c028d25_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveyanswer`
--

LOCK TABLES `survey_surveyanswer` WRITE;
/*!40000 ALTER TABLE `survey_surveyanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveyanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveyform`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveyform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `form` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveyform`
--

LOCK TABLES `survey_surveyform` WRITE;
/*!40000 ALTER TABLE `survey_surveyform` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveyform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_wide_roles_systemwiderole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_wide_roles_systemwiderole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_wide_roles_systemwiderole`
--

LOCK TABLES `system_wide_roles_systemwiderole` WRITE;
/*!40000 ALTER TABLE `system_wide_roles_systemwiderole` DISABLE KEYS */;
INSERT INTO `system_wide_roles_systemwiderole` VALUES (1,'2023-02-21 14:10:33.255201','2023-02-21 14:10:33.255201','student_support_admin',NULL);
/*!40000 ALTER TABLE `system_wide_roles_systemwiderole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_wide_roles_systemwideroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_wide_roles_systemwideroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_wide_roles_sy_role_id_b553068b_fk_system_wi` (`role_id`),
  KEY `system_wide_roles_sy_user_id_8ec7ad0d_fk_auth_user` (`user_id`),
  CONSTRAINT `system_wide_roles_sy_role_id_b553068b_fk_system_wi` FOREIGN KEY (`role_id`) REFERENCES `system_wide_roles_systemwiderole` (`id`),
  CONSTRAINT `system_wide_roles_sy_user_id_8ec7ad0d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_wide_roles_systemwideroleassignment`
--

LOCK TABLES `system_wide_roles_systemwideroleassignment` WRITE;
/*!40000 ALTER TABLE `system_wide_roles_systemwideroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_wide_roles_systemwideroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tagavailablevalues`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tagavailablevalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tagavailable_category_id_9cc60a44_fk_tagging_t` (`category_id`),
  CONSTRAINT `tagging_tagavailable_category_id_9cc60a44_fk_tagging_t` FOREIGN KEY (`category_id`) REFERENCES `tagging_tagcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tagavailablevalues`
--

LOCK TABLES `tagging_tagavailablevalues` WRITE;
/*!40000 ALTER TABLE `tagging_tagavailablevalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tagavailablevalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tagcategories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tagcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tagcategories`
--

LOCK TABLES `tagging_tagcategories` WRITE;
/*!40000 ALTER TABLE `tagging_tagcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tagcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_courseteam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_courseteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` varchar(255) NOT NULL,
  `discussion_topic_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `topic_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `description` varchar(300) NOT NULL,
  `country` varchar(2) NOT NULL,
  `language` varchar(16) NOT NULL,
  `last_activity_at` datetime(6) NOT NULL,
  `team_size` int(11) NOT NULL,
  `organization_protected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_id` (`team_id`),
  UNIQUE KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `teams_courseteam_name_3bef5f8c` (`name`),
  KEY `teams_courseteam_course_id_1e7dbede` (`course_id`),
  KEY `teams_courseteam_topic_id_4d4f5d0d` (`topic_id`),
  KEY `teams_courseteam_last_activity_at_376db5d3` (`last_activity_at`),
  KEY `teams_courseteam_team_size_d264574e` (`team_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_courseteam`
--

LOCK TABLES `teams_courseteam` WRITE;
/*!40000 ALTER TABLE `teams_courseteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_courseteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_courseteammembership`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_courseteammembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_joined` datetime(6) NOT NULL,
  `last_activity_at` datetime(6) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teams_courseteammembership_user_id_team_id_aa45a20c_uniq` (`user_id`,`team_id`),
  KEY `teams_courseteammemb_team_id_b021eccd_fk_teams_cou` (`team_id`),
  CONSTRAINT `teams_courseteammemb_team_id_b021eccd_fk_teams_cou` FOREIGN KEY (`team_id`) REFERENCES `teams_courseteam` (`id`),
  CONSTRAINT `teams_courseteammembership_user_id_18f9ff5d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_courseteammembership`
--

LOCK TABLES `teams_courseteammembership` WRITE;
/*!40000 ALTER TABLE `teams_courseteammembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_courseteammembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theming_sitetheme`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theming_sitetheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_dir_name` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theming_sitetheme_site_id_fe93d039_fk_django_site_id` (`site_id`),
  CONSTRAINT `theming_sitetheme_site_id_fe93d039_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theming_sitetheme`
--

LOCK TABLES `theming_sitetheme` WRITE;
/*!40000 ALTER TABLE `theming_sitetheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theming_sitetheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_ltiproviderconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_ltiproviderconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `lti_consumer_key` varchar(255) NOT NULL,
  `lti_hostname` varchar(255) NOT NULL,
  `lti_consumer_secret` varchar(255) NOT NULL,
  `lti_max_timestamp_age` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `send_welcome_email` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `enable_sso_id_verification` tinyint(1) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `disable_for_enterprise_sso` tinyint(1) NOT NULL,
  `was_valid_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_lti_changed_by_id_7b39c829_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_lti_site_id_c8442a80_fk_django_si` (`site_id`),
  KEY `third_party_auth_lti_organization_id_7494c417_fk_organizat` (`organization_id`),
  KEY `third_party_auth_ltiproviderconfig_lti_hostname_540ce676` (`lti_hostname`),
  KEY `third_party_auth_ltiproviderconfig_slug_9cd23a79` (`slug`),
  CONSTRAINT `third_party_auth_lti_changed_by_id_7b39c829_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_lti_organization_id_7494c417_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `third_party_auth_lti_site_id_c8442a80_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_ltiproviderconfig`
--

LOCK TABLES `third_party_auth_ltiproviderconfig` WRITE;
/*!40000 ALTER TABLE `third_party_auth_ltiproviderconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_ltiproviderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_oauth2providerconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_oauth2providerconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `secondary` tinyint(1) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `backend_name` varchar(50) NOT NULL,
  `key` longtext NOT NULL,
  `secret` longtext NOT NULL,
  `other_settings` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `icon_image` varchar(100) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `send_welcome_email` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `enable_sso_id_verification` tinyint(1) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `disable_for_enterprise_sso` tinyint(1) NOT NULL,
  `was_valid_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_oau_changed_by_id_55219296_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_oau_site_id_a4ae3e66_fk_django_si` (`site_id`),
  KEY `third_party_auth_oau_organization_id_cc8874ba_fk_organizat` (`organization_id`),
  KEY `third_party_auth_oauth2providerconfig_backend_name_0c14d294` (`backend_name`),
  KEY `third_party_auth_oauth2providerconfig_slug_226038d8` (`slug`),
  CONSTRAINT `third_party_auth_oau_changed_by_id_55219296_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_oau_organization_id_cc8874ba_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `third_party_auth_oau_site_id_a4ae3e66_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_oauth2providerconfig`
--

LOCK TABLES `third_party_auth_oauth2providerconfig` WRITE;
/*!40000 ALTER TABLE `third_party_auth_oauth2providerconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_oauth2providerconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_samlconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_samlconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `private_key` longtext NOT NULL,
  `public_key` longtext NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  `org_info_str` longtext NOT NULL,
  `other_config_str` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_sam_changed_by_id_c9343fb9_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_sam_site_id_8fab01ee_fk_django_si` (`site_id`),
  KEY `third_party_auth_samlconfiguration_slug_f9008e26` (`slug`),
  CONSTRAINT `third_party_auth_sam_changed_by_id_c9343fb9_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_sam_site_id_8fab01ee_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_samlconfiguration`
--

LOCK TABLES `third_party_auth_samlconfiguration` WRITE;
/*!40000 ALTER TABLE `third_party_auth_samlconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_samlconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_samlproviderconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_samlproviderconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `secondary` tinyint(1) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `backend_name` varchar(50) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  `metadata_source` varchar(255) NOT NULL,
  `attr_user_permanent_id` varchar(128) NOT NULL,
  `attr_full_name` varchar(128) NOT NULL,
  `attr_first_name` varchar(128) NOT NULL,
  `attr_last_name` varchar(128) NOT NULL,
  `attr_username` varchar(128) NOT NULL,
  `attr_email` varchar(128) NOT NULL,
  `other_settings` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `icon_image` varchar(100) NOT NULL,
  `debug_mode` tinyint(1) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `automatic_refresh_enabled` tinyint(1) NOT NULL,
  `identity_provider_type` varchar(128) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `saml_configuration_id` int(11) DEFAULT NULL,
  `send_welcome_email` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `enable_sso_id_verification` tinyint(1) NOT NULL,
  `default_email` varchar(255) NOT NULL,
  `default_first_name` varchar(255) NOT NULL,
  `default_full_name` varchar(255) NOT NULL,
  `default_last_name` varchar(255) NOT NULL,
  `default_username` varchar(255) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `country` varchar(128) NOT NULL,
  `disable_for_enterprise_sso` tinyint(1) NOT NULL,
  `display_name` varchar(35) NOT NULL,
  `was_valid_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_sam_changed_by_id_4c8fa8c0_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_sam_site_id_b7e2af73_fk_django_si` (`site_id`),
  KEY `third_party_auth_sam_saml_configuration_i_eeb9fe72_fk_third_par` (`saml_configuration_id`),
  KEY `third_party_auth_sam_organization_id_8a7f5596_fk_organizat` (`organization_id`),
  KEY `third_party_auth_samlproviderconfig_slug_95883dea` (`slug`),
  CONSTRAINT `third_party_auth_sam_changed_by_id_4c8fa8c0_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_sam_organization_id_8a7f5596_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `third_party_auth_sam_saml_configuration_i_eeb9fe72_fk_third_par` FOREIGN KEY (`saml_configuration_id`) REFERENCES `third_party_auth_samlconfiguration` (`id`),
  CONSTRAINT `third_party_auth_sam_site_id_b7e2af73_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_samlproviderconfig`
--

LOCK TABLES `third_party_auth_samlproviderconfig` WRITE;
/*!40000 ALTER TABLE `third_party_auth_samlproviderconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_samlproviderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_samlproviderdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_samlproviderdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fetched_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `entity_id` varchar(255) NOT NULL,
  `sso_url` varchar(200) NOT NULL,
  `public_key` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_samlproviderdata_fetched_at_2286ac32` (`fetched_at`),
  KEY `third_party_auth_samlproviderdata_expires_at_eaf594c7` (`expires_at`),
  KEY `third_party_auth_samlproviderdata_entity_id_b163c6fc` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_samlproviderdata`
--

LOCK TABLES `third_party_auth_samlproviderdata` WRITE;
/*!40000 ALTER TABLE `third_party_auth_samlproviderdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_samlproviderdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_retirementstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_retirementstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(30) NOT NULL,
  `state_execution_order` smallint(6) NOT NULL,
  `is_dead_end_state` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_name` (`state_name`),
  UNIQUE KEY `state_execution_order` (`state_execution_order`),
  KEY `user_api_retirementstate_is_dead_end_state_62eaf9b7` (`is_dead_end_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_retirementstate`
--

LOCK TABLES `user_api_retirementstate` WRITE;
/*!40000 ALTER TABLE `user_api_retirementstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_retirementstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_usercoursetag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_usercoursetag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_usercoursetag_user_id_course_id_key_d73150ab_uniq` (`user_id`,`course_id`,`key`),
  KEY `user_api_usercoursetag_key_d6420575` (`key`),
  KEY `user_api_usercoursetag_course_id_a336d583` (`course_id`),
  CONSTRAINT `user_api_usercoursetag_user_id_106a4cbc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_usercoursetag`
--

LOCK TABLES `user_api_usercoursetag` WRITE;
/*!40000 ALTER TABLE `user_api_usercoursetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_usercoursetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userorgtag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userorgtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `key` varchar(255) NOT NULL,
  `org` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_userorgtag_user_id_org_key_d4df9ac1_uniq` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_key_b1f2bafe` (`key`),
  KEY `user_api_userorgtag_org_41caa15c` (`org`),
  CONSTRAINT `user_api_userorgtag_user_id_cc0d415d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userorgtag`
--

LOCK TABLES `user_api_userorgtag` WRITE;
/*!40000 ALTER TABLE `user_api_userorgtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userorgtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userpreference`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_userpreference_user_id_key_17924c0d_uniq` (`user_id`,`key`),
  KEY `user_api_userpreference_key_9c8a8f6b` (`key`),
  CONSTRAINT `user_api_userpreference_user_id_68f8a34b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userpreference`
--

LOCK TABLES `user_api_userpreference` WRITE;
/*!40000 ALTER TABLE `user_api_userpreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userretirementpartnerreportingstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userretirementpartnerreportingstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `original_username` varchar(150) NOT NULL,
  `original_email` varchar(254) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `is_being_processed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_api_userretirementpart_original_username_6bf5d3d1` (`original_username`),
  KEY `user_api_userretirementpart_original_email_aaab0bc9` (`original_email`),
  KEY `user_api_userretirementpart_original_name_9aedd7f0` (`original_name`),
  CONSTRAINT `user_api_userretirem_user_id_272c8f78_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userretirementpartnerreportingstatus`
--

LOCK TABLES `user_api_userretirementpartnerreportingstatus` WRITE;
/*!40000 ALTER TABLE `user_api_userretirementpartnerreportingstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userretirementpartnerreportingstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userretirementrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userretirementrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_api_userretirementrequest_user_id_7f7ca22f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userretirementrequest`
--

LOCK TABLES `user_api_userretirementrequest` WRITE;
/*!40000 ALTER TABLE `user_api_userretirementrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userretirementrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userretirementstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userretirementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `original_username` varchar(150) NOT NULL,
  `original_email` varchar(254) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `retired_username` varchar(150) NOT NULL,
  `retired_email` varchar(254) NOT NULL,
  `responses` longtext NOT NULL,
  `current_state_id` int(11) NOT NULL,
  `last_state_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_api_userretirem_current_state_id_e37bb094_fk_user_api_` (`current_state_id`),
  KEY `user_api_userretirem_last_state_id_359e74cd_fk_user_api_` (`last_state_id`),
  KEY `user_api_userretirementstatus_original_username_fa5d4a21` (`original_username`),
  KEY `user_api_userretirementstatus_original_email_a7203bff` (`original_email`),
  KEY `user_api_userretirementstatus_original_name_17c2846b` (`original_name`),
  KEY `user_api_userretirementstatus_retired_username_52067a53` (`retired_username`),
  KEY `user_api_userretirementstatus_retired_email_ee7c1579` (`retired_email`),
  CONSTRAINT `user_api_userretirem_current_state_id_e37bb094_fk_user_api_` FOREIGN KEY (`current_state_id`) REFERENCES `user_api_retirementstate` (`id`),
  CONSTRAINT `user_api_userretirem_last_state_id_359e74cd_fk_user_api_` FOREIGN KEY (`last_state_id`) REFERENCES `user_api_retirementstate` (`id`),
  CONSTRAINT `user_api_userretirementstatus_user_id_aca4dc7b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userretirementstatus`
--

LOCK TABLES `user_api_userretirementstatus` WRITE;
/*!40000 ALTER TABLE `user_api_userretirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userretirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks_usertaskartifact`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks_usertaskartifact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `url` longtext NOT NULL,
  `text` longtext NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `user_tasks_usertaska_status_id_641f31be_fk_user_task` (`status_id`),
  CONSTRAINT `user_tasks_usertaska_status_id_641f31be_fk_user_task` FOREIGN KEY (`status_id`) REFERENCES `user_tasks_usertaskstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tasks_usertaskartifact`
--

LOCK TABLES `user_tasks_usertaskartifact` WRITE;
/*!40000 ALTER TABLE `user_tasks_usertaskartifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tasks_usertaskartifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks_usertaskstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks_usertaskstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `task_id` varchar(128) NOT NULL,
  `is_container` tinyint(1) NOT NULL,
  `task_class` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` varchar(128) NOT NULL,
  `completed_steps` smallint(5) unsigned NOT NULL,
  `total_steps` smallint(5) unsigned NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `user_tasks_usertasks_parent_id_5009f727_fk_user_task` (`parent_id`),
  KEY `user_tasks_usertaskstatus_user_id_5bec3d4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_tasks_usertasks_parent_id_5009f727_fk_user_task` FOREIGN KEY (`parent_id`) REFERENCES `user_tasks_usertaskstatus` (`id`),
  CONSTRAINT `user_tasks_usertaskstatus_user_id_5bec3d4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tasks_usertaskstatus`
--

LOCK TABLES `user_tasks_usertaskstatus` WRITE;
/*!40000 ALTER TABLE `user_tasks_usertaskstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tasks_usertaskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tours_userdiscussionstours`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tours_userdiscussionstours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_name` varchar(255) NOT NULL,
  `show_tour` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_tours__user_id_0397d5_idx` (`user_id`,`tour_name`),
  CONSTRAINT `user_tours_userdiscussionstours_user_id_4d286074_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tours_userdiscussionstours`
--

LOCK TABLES `user_tours_userdiscussionstours` WRITE;
/*!40000 ALTER TABLE `user_tours_userdiscussionstours` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tours_userdiscussionstours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tours_usertour`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tours_usertour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_home_tour_status` varchar(50) NOT NULL,
  `show_courseware_tour` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_tours_usertour_user_id_723c222b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tours_usertour`
--

LOCK TABLES `user_tours_usertour` WRITE;
/*!40000 ALTER TABLE `user_tours_usertour` DISABLE KEYS */;
INSERT INTO `user_tours_usertour` VALUES (1,'show-new-user-tour',1,3),(2,'show-new-user-tour',1,4),(3,'show-new-user-tour',1,5),(4,'show-new-user-tour',1,6),(5,'show-new-user-tour',1,7),(6,'show-new-user-tour',1,8),(7,'show-new-user-tour',1,9),(8,'show-new-user-tour',1,10),(9,'show-new-user-tour',1,11);
/*!40000 ALTER TABLE `user_tours_usertour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `util_ratelimitconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `util_ratelimitconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `util_ratelimitconfig_changed_by_id_794ac118_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `util_ratelimitconfig_changed_by_id_794ac118_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `util_ratelimitconfiguration`
--

LOCK TABLES `util_ratelimitconfiguration` WRITE;
/*!40000 ALTER TABLE `util_ratelimitconfiguration` DISABLE KEYS */;
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2023-02-21 14:10:53.721223',1,NULL);
/*!40000 ALTER TABLE `util_ratelimitconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_manualverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_manualverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_manua_user_id_f38b72b4_fk_auth_user` (`user_id`),
  KEY `verify_student_manualverification_created_at_e4e3731a` (`created_at`),
  KEY `verify_student_manualverification_updated_at_1a350690` (`updated_at`),
  KEY `verify_student_manualverification_expiration_date_d2feae82` (`expiration_date`),
  CONSTRAINT `verify_student_manua_user_id_f38b72b4_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_manualverification`
--

LOCK TABLES `verify_student_manualverification` WRITE;
/*!40000 ALTER TABLE `verify_student_manualverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_manualverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_softwaresecurephotoverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_softwaresecurephotoverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `face_image_url` varchar(255) NOT NULL,
  `photo_id_image_url` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `display` tinyint(1) NOT NULL,
  `submitted_at` datetime(6) DEFAULT NULL,
  `reviewing_service` varchar(255) NOT NULL,
  `error_msg` longtext NOT NULL,
  `error_code` varchar(50) NOT NULL,
  `photo_id_key` longtext NOT NULL,
  `copy_id_photo_from_id` int(11) DEFAULT NULL,
  `reviewing_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `expiry_email_date` datetime(6) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_softw_copy_id_photo_from_i_059e40b6_fk_verify_st` (`copy_id_photo_from_id`),
  KEY `verify_student_softw_reviewing_user_id_55fd003a_fk_auth_user` (`reviewing_user_id`),
  KEY `verify_student_softw_user_id_66ca4f6d_fk_auth_user` (`user_id`),
  KEY `verify_student_softwaresecu_receipt_id_2160ce88` (`receipt_id`),
  KEY `verify_student_softwaresecu_created_at_566f779f` (`created_at`),
  KEY `verify_student_softwaresecu_updated_at_8f5cf2d7` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_display_287287f8` (`display`),
  KEY `verify_student_softwaresecu_submitted_at_f3d5cd03` (`submitted_at`),
  KEY `verify_student_softwaresecu_expiry_email_date_6ae6d6c9` (`expiry_email_date`),
  KEY `verify_student_softwaresecu_expiration_date_f7f2d890` (`expiration_date`),
  CONSTRAINT `verify_student_softw_copy_id_photo_from_i_059e40b6_fk_verify_st` FOREIGN KEY (`copy_id_photo_from_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`),
  CONSTRAINT `verify_student_softw_reviewing_user_id_55fd003a_fk_auth_user` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `verify_student_softw_user_id_66ca4f6d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_softwaresecurephotoverification`
--

LOCK TABLES `verify_student_softwaresecurephotoverification` WRITE;
/*!40000 ALTER TABLE `verify_student_softwaresecurephotoverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_softwaresecurephotoverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_ssoverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_ssoverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `identity_provider_type` varchar(100) NOT NULL,
  `identity_provider_slug` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_ssoverification_user_id_5e6186eb_fk_auth_user_id` (`user_id`),
  KEY `verify_student_ssoverification_created_at_6381e5a4` (`created_at`),
  KEY `verify_student_ssoverification_updated_at_9d6cc952` (`updated_at`),
  KEY `verify_student_ssoverification_identity_provider_slug_56c53eb6` (`identity_provider_slug`),
  KEY `verify_student_ssoverification_expiration_date_26ec549d` (`expiration_date`),
  CONSTRAINT `verify_student_ssoverification_user_id_5e6186eb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_ssoverification`
--

LOCK TABLES `verify_student_ssoverification` WRITE;
/*!40000 ALTER TABLE `verify_student_ssoverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_ssoverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_sspverificationretryconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_sspverificationretryconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_sspve_changed_by_id_c035fbe5_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `verify_student_sspve_changed_by_id_c035fbe5_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_sspverificationretryconfig`
--

LOCK TABLES `verify_student_sspverificationretryconfig` WRITE;
/*!40000 ALTER TABLE `verify_student_sspverificationretryconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_sspverificationretryconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationdeadline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationdeadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  `deadline_is_explicit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationdeadline`
--

LOCK TABLES `verify_student_verificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_coursehlsplaybackenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_coursehlsplaybackenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_courseh_changed_by_id_fa268d53_fk_auth_user` (`changed_by_id`),
  KEY `video_config_coursehlsplaybackenabledflag_course_id_c0fcaead` (`course_id`),
  CONSTRAINT `video_config_courseh_changed_by_id_fa268d53_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_coursehlsplaybackenabledflag`
--

LOCK TABLES `video_config_coursehlsplaybackenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_coursehlsplaybackenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_coursehlsplaybackenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_coursevideotranscriptenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_coursevideotranscriptenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_coursev_changed_by_id_3bdcf2a6_fk_auth_user` (`changed_by_id`),
  KEY `video_config_coursevideotranscriptenabledflag_course_id_fcfacf5b` (`course_id`),
  CONSTRAINT `video_config_coursev_changed_by_id_3bdcf2a6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_coursevideotranscriptenabledflag`
--

LOCK TABLES `video_config_coursevideotranscriptenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_coursevideotranscriptenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_coursevideotranscriptenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_courseyoutubeblockedflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_courseyoutubeblockedflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_coursey_changed_by_id_3496713f_fk_auth_user` (`changed_by_id`),
  KEY `video_config_courseyoutubeblockedflag_course_id_4c9395c6` (`course_id`),
  CONSTRAINT `video_config_coursey_changed_by_id_3496713f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_courseyoutubeblockedflag`
--

LOCK TABLES `video_config_courseyoutubeblockedflag` WRITE;
/*!40000 ALTER TABLE `video_config_courseyoutubeblockedflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_courseyoutubeblockedflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_hlsplaybackenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_hlsplaybackenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_hlsplay_changed_by_id_d93f2234_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_hlsplay_changed_by_id_d93f2234_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_hlsplaybackenabledflag`
--

LOCK TABLES `video_config_hlsplaybackenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_hlsplaybackenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_hlsplaybackenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_migrationenqueuedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_migrationenqueuedcourse` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `command_run` int(10) unsigned NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_migrationenqueuedcourse`
--

LOCK TABLES `video_config_migrationenqueuedcourse` WRITE;
/*!40000 ALTER TABLE `video_config_migrationenqueuedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_migrationenqueuedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_transcriptmigrationsetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_transcriptmigrationsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `force_update` tinyint(1) NOT NULL,
  `commit` tinyint(1) NOT NULL,
  `all_courses` tinyint(1) NOT NULL,
  `course_ids` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `command_run` int(10) unsigned NOT NULL,
  `batch_size` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_transcr_changed_by_id_4c7817bd_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_transcr_changed_by_id_4c7817bd_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_transcriptmigrationsetting`
--

LOCK TABLES `video_config_transcriptmigrationsetting` WRITE;
/*!40000 ALTER TABLE `video_config_transcriptmigrationsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_transcriptmigrationsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_updatedcoursevideos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_updatedcoursevideos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `edx_video_id` varchar(100) NOT NULL,
  `command_run` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_config_updatedcour_course_id_edx_video_id_455a73ff_uniq` (`course_id`,`edx_video_id`),
  KEY `video_config_updatedcoursevideos_course_id_e72703a3` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_updatedcoursevideos`
--

LOCK TABLES `video_config_updatedcoursevideos` WRITE;
/*!40000 ALTER TABLE `video_config_updatedcoursevideos` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_updatedcoursevideos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_videothumbnailsetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_videothumbnailsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `command_run` int(10) unsigned NOT NULL,
  `batch_size` int(10) unsigned NOT NULL,
  `videos_per_task` int(10) unsigned NOT NULL,
  `commit` tinyint(1) NOT NULL,
  `all_course_videos` tinyint(1) NOT NULL,
  `course_ids` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `offset` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_videoth_changed_by_id_9385a0b2_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_videoth_changed_by_id_9385a0b2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_videothumbnailsetting`
--

LOCK TABLES `video_config_videothumbnailsetting` WRITE;
/*!40000 ALTER TABLE `video_config_videothumbnailsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_videothumbnailsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_videotranscriptenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_videotranscriptenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_videotr_changed_by_id_9f0afd7f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_videotr_changed_by_id_9f0afd7f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_videotranscriptenabledflag`
--

LOCK TABLES `video_config_videotranscriptenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_videotranscriptenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_videotranscriptenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_pipeline_coursevideouploadsenabledbydefault`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_coursevideouploadsenabledbydefault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_cours_changed_by_id_84ec1a58_fk_auth_user` (`changed_by_id`),
  KEY `video_pipeline_coursevideou_course_id_9fd1b18b` (`course_id`),
  CONSTRAINT `video_pipeline_cours_changed_by_id_84ec1a58_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_coursevideouploadsenabledbydefault`
--

LOCK TABLES `video_pipeline_coursevideouploadsenabledbydefault` WRITE;
/*!40000 ALTER TABLE `video_pipeline_coursevideouploadsenabledbydefault` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_coursevideouploadsenabledbydefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_pipeline_vempipelineintegration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_vempipelineintegration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `api_url` varchar(200) NOT NULL,
  `service_username` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_vempi_changed_by_id_cadc1895_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_pipeline_vempi_changed_by_id_cadc1895_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_vempipelineintegration`
--

LOCK TABLES `video_pipeline_vempipelineintegration` WRITE;
/*!40000 ALTER TABLE `video_pipeline_vempipelineintegration` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_vempipelineintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_pipeline_videouploadsenabledbydefault`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_videouploadsenabledbydefault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_video_changed_by_id_3d066822_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_pipeline_video_changed_by_id_3d066822_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_videouploadsenabledbydefault`
--

LOCK TABLES `video_pipeline_videouploadsenabledbydefault` WRITE;
/*!40000 ALTER TABLE `video_pipeline_videouploadsenabledbydefault` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_videouploadsenabledbydefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `everyone` tinyint(1) DEFAULT NULL,
  `percent` decimal(3,1) DEFAULT NULL,
  `testing` tinyint(1) NOT NULL,
  `superusers` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  `languages` longtext NOT NULL,
  `rollout` tinyint(1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_flag_created_4a6e8cef` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
INSERT INTO `waffle_flag` VALUES (2,'grades.rejected_exam_overrides_grade',1,NULL,0,1,0,0,'',0,'','2023-02-21 13:31:07.946574','2023-02-21 13:31:07.946591'),(3,'grades.enforce_freeze_grade_after_course_end',1,NULL,0,1,0,0,'',0,'','2023-02-21 13:31:07.951895','2023-02-21 13:31:07.951908'),(4,'grades.writable_gradebook',1,NULL,0,1,0,0,'',0,'','2023-02-21 13:31:07.957214','2023-02-21 13:31:07.957227'),(5,'studio.enable_checklists_quality',1,NULL,0,1,0,0,'',0,'','2023-02-21 14:18:23.327344','2023-02-21 14:18:23.327354');
/*!40000 ALTER TABLE `waffle_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waffle_flag_groups_flag_id_group_id_8ba0c71b_uniq` (`flag_id`,`group_id`),
  KEY `waffle_flag_groups_group_id_a97c4f66_fk_auth_group_id` (`group_id`),
  CONSTRAINT `waffle_flag_groups_flag_id_c11c0c05_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_groups_group_id_a97c4f66_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_groups`
--

LOCK TABLES `waffle_flag_groups` WRITE;
/*!40000 ALTER TABLE `waffle_flag_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waffle_flag_users_flag_id_user_id_b46f76b0_uniq` (`flag_id`,`user_id`),
  KEY `waffle_flag_users_user_id_8026df9b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `waffle_flag_users_flag_id_833c37b0_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_users_user_id_8026df9b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_users`
--

LOCK TABLES `waffle_flag_users` WRITE;
/*!40000 ALTER TABLE `waffle_flag_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_sample`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` decimal(4,1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_sample_created_76198bd5` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample`
--

LOCK TABLES `waffle_sample` WRITE;
/*!40000 ALTER TABLE `waffle_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_switch`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_switch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_switch_created_c004e77e` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch`
--

LOCK TABLES `waffle_switch` WRITE;
/*!40000 ALTER TABLE `waffle_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_utils_waffleflagcourseoverridemodel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_utils_waffleflagcourseoverridemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `waffle_flag` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `override_choice` varchar(3) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `waffle_utils_wafflef_changed_by_id_28429bf5_fk_auth_user` (`changed_by_id`),
  KEY `waffle_utils_waffleflagcourseoverridemodel_waffle_flag_d261aad1` (`waffle_flag`),
  KEY `waffle_utils_waffleflagcourseoverridemodel_course_id_e94a9fc3` (`course_id`),
  CONSTRAINT `waffle_utils_wafflef_changed_by_id_28429bf5_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_utils_waffleflagcourseoverridemodel`
--

LOCK TABLES `waffle_utils_waffleflagcourseoverridemodel` WRITE;
/*!40000 ALTER TABLE `waffle_utils_waffleflagcourseoverridemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_utils_waffleflagcourseoverridemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_utils_waffleflagorgoverridemodel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_utils_waffleflagorgoverridemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `waffle_flag` varchar(255) NOT NULL,
  `org` varchar(255) NOT NULL,
  `override_choice` varchar(3) NOT NULL,
  `note` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `waffle_org_and_waffle_flag` (`org`,`waffle_flag`),
  KEY `waffle_utils_wafflef_changed_by_id_01495c88_fk_auth_user` (`changed_by_id`),
  KEY `waffle_utils_waffleflagorgoverridemodel_waffle_flag_1569d94e` (`waffle_flag`),
  KEY `waffle_utils_waffleflagorgoverridemodel_org_8ffe16cd` (`org`),
  CONSTRAINT `waffle_utils_wafflef_changed_by_id_01495c88_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_utils_waffleflagorgoverridemodel`
--

LOCK TABLES `waffle_utils_waffleflagorgoverridemodel` WRITE;
/*!40000 ALTER TABLE `waffle_utils_waffleflagorgoverridemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_utils_waffleflagorgoverridemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_article`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `group_read` tinyint(1) NOT NULL,
  `group_write` tinyint(1) NOT NULL,
  `other_read` tinyint(1) NOT NULL,
  `other_write` tinyint(1) NOT NULL,
  `current_revision_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  KEY `wiki_article_group_id_bf035c83_fk_auth_group_id` (`group_id`),
  KEY `wiki_article_owner_id_956bc94a_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `wiki_article_current_revision_id_fc83ea0a_fk_wiki_arti` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_article_group_id_bf035c83_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wiki_article_owner_id_956bc94a_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_article`
--

LOCK TABLES `wiki_article` WRITE;
/*!40000 ALTER TABLE `wiki_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articleforobject`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articleforobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `is_mptt` tinyint(1) NOT NULL,
  `article_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_articleforobject_content_type_id_object_id_046be756_uniq` (`content_type_id`,`object_id`),
  KEY `wiki_articleforobject_article_id_7d67d809_fk_wiki_article_id` (`article_id`),
  CONSTRAINT `wiki_articleforobjec_content_type_id_ba569059_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wiki_articleforobject_article_id_7d67d809_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articleforobject`
--

LOCK TABLES `wiki_articleforobject` WRITE;
/*!40000 ALTER TABLE `wiki_articleforobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articleforobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articleplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articleplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_articleplugin_article_id_9ab0e854_fk_wiki_article_id` (`article_id`),
  CONSTRAINT `wiki_articleplugin_article_id_9ab0e854_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articleplugin`
--

LOCK TABLES `wiki_articleplugin` WRITE;
/*!40000 ALTER TABLE `wiki_articleplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articleplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articlerevision`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articlerevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(512) NOT NULL,
  `article_id` int(11) NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_articlerevision_article_id_revision_number_5bcd5334_uniq` (`article_id`,`revision_number`),
  KEY `wiki_articlerevision_previous_revision_id_bcfaf4c9_fk_wiki_arti` (`previous_revision_id`),
  KEY `wiki_articlerevision_user_id_c687e4de_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wiki_articlerevision_article_id_e0fb2474_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_articlerevision_previous_revision_id_bcfaf4c9_fk_wiki_arti` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_articlerevision_user_id_c687e4de_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articlerevision`
--

LOCK TABLES `wiki_articlerevision` WRITE;
/*!40000 ALTER TABLE `wiki_articlerevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articlerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  CONSTRAINT `wiki_reusableplugin_articleplugin_ptr_id_c1737239_fk_wiki_arti` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_reusableplugin`
--

LOCK TABLES `wiki_reusableplugin` WRITE;
/*!40000 ALTER TABLE `wiki_reusableplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_reusableplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin_articles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reusableplugin_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_reusableplugin_arti_reusableplugin_id_articl_302a7a01_uniq` (`reusableplugin_id`,`article_id`),
  KEY `wiki_reusableplugin__article_id_8a09d39e_fk_wiki_arti` (`article_id`),
  CONSTRAINT `wiki_reusableplugin__article_id_8a09d39e_fk_wiki_arti` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_reusableplugin__reusableplugin_id_52618a1c_fk_wiki_reus` FOREIGN KEY (`reusableplugin_id`) REFERENCES `wiki_reusableplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_reusableplugin_articles`
--

LOCK TABLES `wiki_reusableplugin_articles` WRITE;
/*!40000 ALTER TABLE `wiki_reusableplugin_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_reusableplugin_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisionplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisionplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  `current_revision_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  CONSTRAINT `wiki_revisionplugin_articleplugin_ptr_id_95c295f2_fk_wiki_arti` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
  CONSTRAINT `wiki_revisionplugin_current_revision_id_46514536_fk_wiki_revi` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisionplugin`
--

LOCK TABLES `wiki_revisionplugin` WRITE;
/*!40000 ALTER TABLE `wiki_revisionplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisionplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisionpluginrevision`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisionpluginrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `plugin_id` int(11) NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_revisionpluginr_plugin_id_c8f4475b_fk_wiki_revi` (`plugin_id`),
  KEY `wiki_revisionpluginr_previous_revision_id_38c877c0_fk_wiki_revi` (`previous_revision_id`),
  KEY `wiki_revisionpluginrevision_user_id_ee40f729_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wiki_revisionpluginr_plugin_id_c8f4475b_fk_wiki_revi` FOREIGN KEY (`plugin_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`),
  CONSTRAINT `wiki_revisionpluginr_previous_revision_id_38c877c0_fk_wiki_revi` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`),
  CONSTRAINT `wiki_revisionpluginrevision_user_id_ee40f729_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisionpluginrevision`
--

LOCK TABLES `wiki_revisionpluginrevision` WRITE;
/*!40000 ALTER TABLE `wiki_revisionpluginrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisionpluginrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_simpleplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_simpleplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  `article_revision_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  KEY `wiki_simpleplugin_article_revision_id_cff7df92_fk_wiki_arti` (`article_revision_id`),
  CONSTRAINT `wiki_simpleplugin_article_revision_id_cff7df92_fk_wiki_arti` FOREIGN KEY (`article_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_simpleplugin_articleplugin_ptr_id_2b99b828_fk_wiki_arti` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_simpleplugin`
--

LOCK TABLES `wiki_simpleplugin` WRITE;
/*!40000 ALTER TABLE `wiki_simpleplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_simpleplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_urlpath`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_urlpath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_urlpath_site_id_parent_id_slug_e4942e5d_uniq` (`site_id`,`parent_id`,`slug`),
  KEY `wiki_urlpath_article_id_9ef0c0fb_fk_wiki_article_id` (`article_id`),
  KEY `wiki_urlpath_slug_39d212eb` (`slug`),
  KEY `wiki_urlpath_tree_id_090b475d` (`tree_id`),
  KEY `wiki_urlpath_parent_id_a6e675ac` (`parent_id`),
  CONSTRAINT `wiki_urlpath_article_id_9ef0c0fb_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_urlpath_parent_id_a6e675ac_fk_wiki_urlpath_id` FOREIGN KEY (`parent_id`) REFERENCES `wiki_urlpath` (`id`),
  CONSTRAINT `wiki_urlpath_site_id_319be912_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_urlpath`
--

LOCK TABLES `wiki_urlpath` WRITE;
/*!40000 ALTER TABLE `wiki_urlpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_urlpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `submission_uuid` varchar(36) NOT NULL,
  `uuid` char(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `workflow_assessmentworkflow_course_id_8c2d171b` (`course_id`),
  KEY `workflow_assessmentworkflow_item_id_3ad0d291` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflow`
--

LOCK TABLES `workflow_assessmentworkflow` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflowcancellation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflowcancellation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` longtext NOT NULL,
  `cancelled_by_id` varchar(40) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_assessmentw_workflow_id_5e534711_fk_workflow_` (`workflow_id`),
  KEY `workflow_assessmentworkflowcancellation_cancelled_by_id_8467736a` (`cancelled_by_id`),
  KEY `workflow_assessmentworkflowcancellation_created_at_9da54d83` (`created_at`),
  CONSTRAINT `workflow_assessmentw_workflow_id_5e534711_fk_workflow_` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflowcancellation`
--

LOCK TABLES `workflow_assessmentworkflowcancellation` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflowcancellation` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflowcancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflowstep`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflowstep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `submitter_completed_at` datetime(6) DEFAULT NULL,
  `assessment_completed_at` datetime(6) DEFAULT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `skipped` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_assessmentw_workflow_id_fe52b4aa_fk_workflow_` (`workflow_id`),
  CONSTRAINT `workflow_assessmentw_workflow_id_fe52b4aa_fk_workflow_` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflowstep`
--

LOCK TABLES `workflow_assessmentworkflowstep` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflowstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflowstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_teamassessmentworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_teamassessmentworkflow` (
  `assessmentworkflow_ptr_id` int(11) NOT NULL,
  `team_submission_uuid` varchar(128) NOT NULL,
  PRIMARY KEY (`assessmentworkflow_ptr_id`),
  UNIQUE KEY `team_submission_uuid` (`team_submission_uuid`),
  CONSTRAINT `workflow_teamassessm_assessmentworkflow_p_53110fc3_fk_workflow_` FOREIGN KEY (`assessmentworkflow_ptr_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_teamassessmentworkflow`
--

LOCK TABLES `workflow_teamassessmentworkflow` WRITE;
/*!40000 ALTER TABLE `workflow_teamassessmentworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_teamassessmentworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xapi_xapilearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xapi_xapilearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `user_id` int(11) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `plugin_configuration_id` int(11) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `friendly_status_message` varchar(255) DEFAULT NULL,
  `api_record_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `progress_status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xapi_xapilearnerdatatran_user_id_course_id_557488b4_uniq` (`user_id`,`course_id`),
  UNIQUE KEY `api_record_id` (`api_record_id`),
  KEY `xapi_xapilearnerdatatransmi_enterprise_course_enrollmen_0a180d75` (`enterprise_course_enrollment_id`),
  KEY `xapi_xapilearnerdatatransmissionaudit_subsection_id_3dec030e` (`subsection_id`),
  KEY `xapi_xldta_85936b55_idx` (`enterprise_customer_uuid`,`plugin_configuration_id`),
  CONSTRAINT `xapi_xapilearnerdata_api_record_id_7a66c373_fk_integrate` FOREIGN KEY (`api_record_id`) REFERENCES `integrated_channel_apiresponserecord` (`id`),
  CONSTRAINT `xapi_xapilearnerdata_user_id_6a49eb25_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xapi_xapilearnerdatatransmissionaudit`
--

LOCK TABLES `xapi_xapilearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `xapi_xapilearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `xapi_xapilearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xapi_xapilrsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xapi_xapilrsconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `version` varchar(16) NOT NULL,
  `endpoint` varchar(200) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `xapi_xapilrsconfigur_enterprise_customer__90c03ad5_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xapi_xapilrsconfiguration`
--

LOCK TABLES `xapi_xapilrsconfiguration` WRITE;
/*!40000 ALTER TABLE `xapi_xapilrsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `xapi_xapilrsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_config_courseeditltifieldsenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_config_courseeditltifieldsenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_config_course_changed_by_id_09761e15_fk_auth_user` (`changed_by_id`),
  KEY `xblock_config_courseeditltifieldsenabledflag_course_id_4f2393b4` (`course_id`),
  CONSTRAINT `xblock_config_course_changed_by_id_09761e15_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_config_courseeditltifieldsenabledflag`
--

LOCK TABLES `xblock_config_courseeditltifieldsenabledflag` WRITE;
/*!40000 ALTER TABLE `xblock_config_courseeditltifieldsenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_config_courseeditltifieldsenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_config_studioconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_config_studioconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_config_studio_changed_by_id_8e87ad07_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `xblock_config_studio_changed_by_id_8e87ad07_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_config_studioconfig`
--

LOCK TABLES `xblock_config_studioconfig` WRITE;
/*!40000 ALTER TABLE `xblock_config_studioconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_config_studioconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deprecated` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblock_changed_by_id_221b9d0e_fk_auth_user` (`changed_by_id`),
  KEY `xblock_django_xblockconfiguration_name_9596c362` (`name`),
  CONSTRAINT `xblock_django_xblock_changed_by_id_221b9d0e_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockconfiguration`
--

LOCK TABLES `xblock_django_xblockconfiguration` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockstudioconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockstudioconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `support_level` varchar(2) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblock_changed_by_id_641b0905_fk_auth_user` (`changed_by_id`),
  KEY `xblock_django_xblockstudioconfiguration_name_1450bfa3` (`name`),
  CONSTRAINT `xblock_django_xblock_changed_by_id_641b0905_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockstudioconfiguration`
--

LOCK TABLES `xblock_django_xblockstudioconfiguration` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockstudioconfigurationflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockstudioconfigurationflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblock_changed_by_id_fdf047b8_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `xblock_django_xblock_changed_by_id_fdf047b8_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockstudioconfigurationflag`
--

LOCK TABLES `xblock_django_xblockstudioconfigurationflag` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfigurationflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfigurationflag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 14:42:10
