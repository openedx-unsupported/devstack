-- MySQL dump 10.13  Distrib 5.6.36, for Linux (x86_64)
--
-- Host: localhost    Database: edxapp
-- ------------------------------------------------------
-- Server version	5.6.36

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
  KEY `api_admin_apiacce_changed_by_id_771a504ee92a076c_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `api_admin_apiacce_changed_by_id_771a504ee92a076c_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `api_admin_apiaccessrequest_user_id_6753e50e296cabc7_uniq` (`user_id`),
  KEY `api_admin_apiaccessrequest_9acb4454` (`status`),
  KEY `api_admin_apiaccessrequest_9365d6e7` (`site_id`),
  CONSTRAINT `api_admin_apiaccessre_site_id_7963330a765f8041_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `api_admin_apiaccessrequ_user_id_6753e50e296cabc7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `api_admin_historicalapiaccessrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_admin_historicalapiaccessrequest` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `website` varchar(200) NOT NULL,
  `reason` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `contacted` tinyint(1) NOT NULL,
  `site_id` int(11),
  PRIMARY KEY (`history_id`),
  KEY `api_admin_histo_history_user_id_73c59297a81bcd02_fk_auth_user_id` (`history_user_id`),
  KEY `api_admin_historicalapiaccessrequest_b80bb774` (`id`),
  KEY `api_admin_historicalapiaccessrequest_9acb4454` (`status`),
  KEY `api_admin_historicalapiaccessrequest_9365d6e7` (`site_id`),
  CONSTRAINT `api_admin_histo_history_user_id_73c59297a81bcd02_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_admin_historicalapiaccessrequest`
--

LOCK TABLES `api_admin_historicalapiaccessrequest` WRITE;
/*!40000 ALTER TABLE `api_admin_historicalapiaccessrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_admin_historicalapiaccessrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aiclassifier`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aiclassifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classifier_data` varchar(100) NOT NULL,
  `classifier_set_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_aiclassifier_962f069f` (`classifier_set_id`),
  KEY `assessment_aiclassifier_385b00a3` (`criterion_id`),
  CONSTRAINT `D3bd45d5e3c9cfdc4f3b442119adebe8` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`),
  CONSTRAINT `assessm_criterion_id_275db29f2a0e1711_fk_assessment_criterion_id` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aiclassifier`
--

LOCK TABLES `assessment_aiclassifier` WRITE;
/*!40000 ALTER TABLE `assessment_aiclassifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aiclassifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aiclassifierset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aiclassifierset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `algorithm_id` varchar(128) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_aiclassifierset_fde81f11` (`created_at`),
  KEY `assessment_aiclassifierset_65143c91` (`algorithm_id`),
  KEY `assessment_aiclassifierset_ea134da7` (`course_id`),
  KEY `assessment_aiclassifierset_82bfda79` (`item_id`),
  KEY `assessment_aiclassifierset_8980b7ae` (`rubric_id`),
  CONSTRAINT `assessment_ai_rubric_id_45488be94ea0aea5_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aiclassifierset`
--

LOCK TABLES `assessment_aiclassifierset` WRITE;
/*!40000 ALTER TABLE `assessment_aiclassifierset` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aiclassifierset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aigradingworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aigradingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `scheduled_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `algorithm_id` varchar(128) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `essay_text` longtext NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `classifier_set_id` int(11) DEFAULT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `assessment_aigradingworkflow_ea134da7` (`course_id`),
  KEY `assessment_aigradingworkflow_82bfda79` (`item_id`),
  KEY `assessment_aigradingworkflow_96e4551c` (`scheduled_at`),
  KEY `assessment_aigradingworkflow_4430a679` (`completed_at`),
  KEY `assessment_aigradingworkflow_65143c91` (`algorithm_id`),
  KEY `assessment_aigradingworkflow_ab5b2b73` (`submission_uuid`),
  KEY `assessment_aigradingworkflow_30a811f6` (`student_id`),
  KEY `assessment_aigradingworkflow_a4079fcf` (`assessment_id`),
  KEY `assessment_aigradingworkflow_962f069f` (`classifier_set_id`),
  KEY `assessment_aigradingworkflow_8980b7ae` (`rubric_id`),
  CONSTRAINT `D4d9bca115376aeb07fd970155499db3` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`),
  CONSTRAINT `asses_assessment_id_68b86880a7f62f1c_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_ai_rubric_id_3fc938e9e3ae7b2d_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aigradingworkflow`
--

LOCK TABLES `assessment_aigradingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_aigradingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aigradingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aitrainingworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aitrainingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `scheduled_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `algorithm_id` varchar(128) NOT NULL,
  `classifier_set_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fb3b73b224dc39eb386f5d3ec67998b7` (`classifier_set_id`),
  KEY `assessment_aitrainingworkflow_ea134da7` (`course_id`),
  KEY `assessment_aitrainingworkflow_82bfda79` (`item_id`),
  KEY `assessment_aitrainingworkflow_96e4551c` (`scheduled_at`),
  KEY `assessment_aitrainingworkflow_4430a679` (`completed_at`),
  KEY `assessment_aitrainingworkflow_65143c91` (`algorithm_id`),
  CONSTRAINT `fb3b73b224dc39eb386f5d3ec67998b7` FOREIGN KEY (`classifier_set_id`) REFERENCES `assessment_aiclassifierset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aitrainingworkflow`
--

LOCK TABLES `assessment_aitrainingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_aitrainingworkflow_training_examples`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_aitrainingworkflow_training_examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aitrainingworkflow_id` int(11) NOT NULL,
  `trainingexample_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aitrainingworkflow_id` (`aitrainingworkflow_id`,`trainingexample_id`),
  KEY `ff4ddecc43bd06c0d85785a61e955133` (`trainingexample_id`),
  CONSTRAINT `da55be90caee21d95136e40c53e5c754` FOREIGN KEY (`aitrainingworkflow_id`) REFERENCES `assessment_aitrainingworkflow` (`id`),
  CONSTRAINT `ff4ddecc43bd06c0d85785a61e955133` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_aitrainingworkflow_training_examples`
--

LOCK TABLES `assessment_aitrainingworkflow_training_examples` WRITE;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow_training_examples` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_aitrainingworkflow_training_examples` ENABLE KEYS */;
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
  KEY `assessment_assessment_ab5b2b73` (`submission_uuid`),
  KEY `assessment_assessment_ef4c53ff` (`scored_at`),
  KEY `assessment_assessment_7b0042c0` (`scorer_id`),
  KEY `assessment_assessment_8980b7ae` (`rubric_id`),
  CONSTRAINT `assessment_as_rubric_id_7997f01dcbd05633_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
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
  UNIQUE KEY `assessmentfeedback_id` (`assessmentfeedback_id`,`assessment_id`),
  KEY `asses_assessment_id_392d354eca2e0c87_fk_assessment_assessment_id` (`assessment_id`),
  CONSTRAINT `D1fc3fa7cd7be79d20561668a95a9fc1` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`),
  CONSTRAINT `asses_assessment_id_392d354eca2e0c87_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`)
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
  UNIQUE KEY `assessmentfeedback_id` (`assessmentfeedback_id`,`assessmentfeedbackoption_id`),
  KEY `cc7028abc88c431df3172c9b2d6422e4` (`assessmentfeedbackoption_id`),
  CONSTRAINT `cba12ac98c4a04d67d5edaa2223f4fe5` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`),
  CONSTRAINT `cc7028abc88c431df3172c9b2d6422e4` FOREIGN KEY (`assessmentfeedbackoption_id`) REFERENCES `assessment_assessmentfeedbackoption` (`id`)
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
  `option_id` int(11),
  PRIMARY KEY (`id`),
  KEY `asses_assessment_id_1d752290138ce479_fk_assessment_assessment_id` (`assessment_id`),
  KEY `assessment_assessmentpart_385b00a3` (`criterion_id`),
  KEY `assessment_assessmentpart_28df3725` (`option_id`),
  CONSTRAINT `asse_option_id_2508a14feeabf4ce_fk_assessment_criterionoption_id` FOREIGN KEY (`option_id`) REFERENCES `assessment_criterionoption` (`id`),
  CONSTRAINT `asses_assessment_id_1d752290138ce479_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessm_criterion_id_2061f2359fd292bf_fk_assessment_criterion_id` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
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
  KEY `assessment_criterion_8980b7ae` (`rubric_id`),
  CONSTRAINT `assessment_cr_rubric_id_30b7422eb7f191cd_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
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
  KEY `assessm_criterion_id_4d0f74d959b454af_fk_assessment_criterion_id` (`criterion_id`),
  CONSTRAINT `assessm_criterion_id_4d0f74d959b454af_fk_assessment_criterion_id` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
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
  KEY `assessment_peerworkflow_30a811f6` (`student_id`),
  KEY `assessment_peerworkflow_82bfda79` (`item_id`),
  KEY `assessment_peerworkflow_ea134da7` (`course_id`),
  KEY `assessment_peerworkflow_fde81f11` (`created_at`),
  KEY `assessment_peerworkflow_4430a679` (`completed_at`),
  KEY `assessment_peerworkflow_85d183d8` (`grading_completed_at`),
  KEY `assessment_peerworkflow_740da1db` (`cancelled_at`)
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
  KEY `asses_assessment_id_15cadfae90ddcc2a_fk_assessment_assessment_id` (`assessment_id`),
  KEY `assessm_author_id_1948f89dea6d2b5f_fk_assessment_peerworkflow_id` (`author_id`),
  KEY `assessm_scorer_id_2d803ee2d52c0e2c_fk_assessment_peerworkflow_id` (`scorer_id`),
  KEY `assessment_peerworkflowitem_ab5b2b73` (`submission_uuid`),
  KEY `assessment_peerworkflowitem_ff1ae11b` (`started_at`),
  CONSTRAINT `asses_assessment_id_15cadfae90ddcc2a_fk_assessment_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessm_author_id_1948f89dea6d2b5f_fk_assessment_peerworkflow_id` FOREIGN KEY (`author_id`) REFERENCES `assessment_peerworkflow` (`id`),
  CONSTRAINT `assessm_scorer_id_2d803ee2d52c0e2c_fk_assessment_peerworkflow_id` FOREIGN KEY (`scorer_id`) REFERENCES `assessment_peerworkflow` (`id`)
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
  KEY `assessment_rubric_873e9e2d` (`structure_hash`)
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
  KEY `assessment_staffworkflow_7b0042c0` (`scorer_id`),
  KEY `assessment_staffworkflow_ea134da7` (`course_id`),
  KEY `assessment_staffworkflow_82bfda79` (`item_id`),
  KEY `assessment_staffworkflow_fde81f11` (`created_at`),
  KEY `assessment_staffworkflow_85d183d8` (`grading_completed_at`),
  KEY `assessment_staffworkflow_0af9deae` (`grading_started_at`),
  KEY `assessment_staffworkflow_740da1db` (`cancelled_at`),
  KEY `assessment_staffworkflow_5096c410` (`assessment`)
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
  KEY `assessment_studenttrainingworkflow_30a811f6` (`student_id`),
  KEY `assessment_studenttrainingworkflow_82bfda79` (`item_id`),
  KEY `assessment_studenttrainingworkflow_ea134da7` (`course_id`)
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
  UNIQUE KEY `assessment_studenttrainingwork_workflow_id_484e930feb86ad74_uniq` (`workflow_id`,`order_num`),
  KEY `assessment_studenttrainingworkflowitem_9cc97abc` (`training_example_id`),
  KEY `assessment_studenttrainingworkflowitem_846c77cf` (`workflow_id`),
  CONSTRAINT `D74ce3e30635de397fef41ac869640c7` FOREIGN KEY (`training_example_id`) REFERENCES `assessment_trainingexample` (`id`),
  CONSTRAINT `f9c080ebc7ad16394edda963ed3f280f` FOREIGN KEY (`workflow_id`) REFERENCES `assessment_studenttrainingworkflow` (`id`)
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
  KEY `assessment_tr_rubric_id_33664d383bafcaaa_fk_assessment_rubric_id` (`rubric_id`),
  CONSTRAINT `assessment_tr_rubric_id_33664d383bafcaaa_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
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
  UNIQUE KEY `trainingexample_id` (`trainingexample_id`,`criterionoption_id`),
  KEY `D0b4a450eed0c653d223e489254ed8a1` (`criterionoption_id`),
  CONSTRAINT `D0b4a450eed0c653d223e489254ed8a1` FOREIGN KEY (`criterionoption_id`) REFERENCES `assessment_criterionoption` (`id`),
  CONSTRAINT `ae406d6687690bb9277287984729cfd8` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`)
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
-- Table structure for table `auth_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',2,'add_permission'),(2,'Can change permission',2,'change_permission'),(3,'Can delete permission',2,'delete_permission'),(4,'Can add group',3,'add_group'),(5,'Can change group',3,'change_group'),(6,'Can delete group',3,'delete_group'),(7,'Can add user',4,'add_user'),(8,'Can change user',4,'change_user'),(9,'Can delete user',4,'delete_user'),(10,'Can add content type',5,'add_contenttype'),(11,'Can change content type',5,'change_contenttype'),(12,'Can delete content type',5,'delete_contenttype'),(13,'Can add redirect',6,'add_redirect'),(14,'Can change redirect',6,'change_redirect'),(15,'Can delete redirect',6,'delete_redirect'),(16,'Can add session',7,'add_session'),(17,'Can change session',7,'change_session'),(18,'Can delete session',7,'delete_session'),(19,'Can add site',8,'add_site'),(20,'Can change site',8,'change_site'),(21,'Can delete site',8,'delete_site'),(22,'Can add task state',9,'add_taskmeta'),(23,'Can change task state',9,'change_taskmeta'),(24,'Can delete task state',9,'delete_taskmeta'),(25,'Can add saved group result',10,'add_tasksetmeta'),(26,'Can change saved group result',10,'change_tasksetmeta'),(27,'Can delete saved group result',10,'delete_tasksetmeta'),(28,'Can add interval',11,'add_intervalschedule'),(29,'Can change interval',11,'change_intervalschedule'),(30,'Can delete interval',11,'delete_intervalschedule'),(31,'Can add crontab',12,'add_crontabschedule'),(32,'Can change crontab',12,'change_crontabschedule'),(33,'Can delete crontab',12,'delete_crontabschedule'),(34,'Can add periodic tasks',13,'add_periodictasks'),(35,'Can change periodic tasks',13,'change_periodictasks'),(36,'Can delete periodic tasks',13,'delete_periodictasks'),(37,'Can add periodic task',14,'add_periodictask'),(38,'Can change periodic task',14,'change_periodictask'),(39,'Can delete periodic task',14,'delete_periodictask'),(40,'Can add worker',15,'add_workerstate'),(41,'Can change worker',15,'change_workerstate'),(42,'Can delete worker',15,'delete_workerstate'),(43,'Can add task',16,'add_taskstate'),(44,'Can change task',16,'change_taskstate'),(45,'Can delete task',16,'delete_taskstate'),(46,'Can add flag',17,'add_flag'),(47,'Can change flag',17,'change_flag'),(48,'Can delete flag',17,'delete_flag'),(49,'Can add switch',18,'add_switch'),(50,'Can change switch',18,'change_switch'),(51,'Can delete switch',18,'delete_switch'),(52,'Can add sample',19,'add_sample'),(53,'Can change sample',19,'change_sample'),(54,'Can delete sample',19,'delete_sample'),(55,'Can add global status message',20,'add_globalstatusmessage'),(56,'Can change global status message',20,'change_globalstatusmessage'),(57,'Can delete global status message',20,'delete_globalstatusmessage'),(58,'Can add course message',21,'add_coursemessage'),(59,'Can change course message',21,'change_coursemessage'),(60,'Can delete course message',21,'delete_coursemessage'),(61,'Can add asset base url config',22,'add_assetbaseurlconfig'),(62,'Can change asset base url config',22,'change_assetbaseurlconfig'),(63,'Can delete asset base url config',22,'delete_assetbaseurlconfig'),(64,'Can add asset excluded extensions config',23,'add_assetexcludedextensionsconfig'),(65,'Can change asset excluded extensions config',23,'change_assetexcludedextensionsconfig'),(66,'Can delete asset excluded extensions config',23,'delete_assetexcludedextensionsconfig'),(67,'Can add course asset cache ttl config',24,'add_courseassetcachettlconfig'),(68,'Can change course asset cache ttl config',24,'change_courseassetcachettlconfig'),(69,'Can delete course asset cache ttl config',24,'delete_courseassetcachettlconfig'),(70,'Can add cdn user agents config',25,'add_cdnuseragentsconfig'),(71,'Can change cdn user agents config',25,'change_cdnuseragentsconfig'),(72,'Can delete cdn user agents config',25,'delete_cdnuseragentsconfig'),(73,'Can add site theme',26,'add_sitetheme'),(74,'Can change site theme',26,'change_sitetheme'),(75,'Can delete site theme',26,'delete_sitetheme'),(76,'Can add site configuration',27,'add_siteconfiguration'),(77,'Can change site configuration',27,'change_siteconfiguration'),(78,'Can delete site configuration',27,'delete_siteconfiguration'),(79,'Can add site configuration history',28,'add_siteconfigurationhistory'),(80,'Can change site configuration history',28,'change_siteconfigurationhistory'),(81,'Can delete site configuration history',28,'delete_siteconfigurationhistory'),(82,'Can add student module',29,'add_studentmodule'),(83,'Can change student module',29,'change_studentmodule'),(84,'Can delete student module',29,'delete_studentmodule'),(85,'Can add student module history',30,'add_studentmodulehistory'),(86,'Can change student module history',30,'change_studentmodulehistory'),(87,'Can delete student module history',30,'delete_studentmodulehistory'),(88,'Can add x module user state summary field',31,'add_xmoduleuserstatesummaryfield'),(89,'Can change x module user state summary field',31,'change_xmoduleuserstatesummaryfield'),(90,'Can delete x module user state summary field',31,'delete_xmoduleuserstatesummaryfield'),(91,'Can add x module student prefs field',32,'add_xmodulestudentprefsfield'),(92,'Can change x module student prefs field',32,'change_xmodulestudentprefsfield'),(93,'Can delete x module student prefs field',32,'delete_xmodulestudentprefsfield'),(94,'Can add x module student info field',33,'add_xmodulestudentinfofield'),(95,'Can change x module student info field',33,'change_xmodulestudentinfofield'),(96,'Can delete x module student info field',33,'delete_xmodulestudentinfofield'),(97,'Can add offline computed grade',34,'add_offlinecomputedgrade'),(98,'Can change offline computed grade',34,'change_offlinecomputedgrade'),(99,'Can delete offline computed grade',34,'delete_offlinecomputedgrade'),(100,'Can add offline computed grade log',35,'add_offlinecomputedgradelog'),(101,'Can change offline computed grade log',35,'change_offlinecomputedgradelog'),(102,'Can delete offline computed grade log',35,'delete_offlinecomputedgradelog'),(103,'Can add student field override',36,'add_studentfieldoverride'),(104,'Can change student field override',36,'change_studentfieldoverride'),(105,'Can delete student field override',36,'delete_studentfieldoverride'),(106,'Can add anonymous user id',37,'add_anonymoususerid'),(107,'Can change anonymous user id',37,'change_anonymoususerid'),(108,'Can delete anonymous user id',37,'delete_anonymoususerid'),(109,'Can add user standing',38,'add_userstanding'),(110,'Can change user standing',38,'change_userstanding'),(111,'Can delete user standing',38,'delete_userstanding'),(112,'Can add user profile',39,'add_userprofile'),(113,'Can change user profile',39,'change_userprofile'),(114,'Can delete user profile',39,'delete_userprofile'),(115,'Can deactivate, but NOT delete users',39,'can_deactivate_users'),(116,'Can add user signup source',40,'add_usersignupsource'),(117,'Can change user signup source',40,'change_usersignupsource'),(118,'Can delete user signup source',40,'delete_usersignupsource'),(119,'Can add user test group',41,'add_usertestgroup'),(120,'Can change user test group',41,'change_usertestgroup'),(121,'Can delete user test group',41,'delete_usertestgroup'),(122,'Can add registration',42,'add_registration'),(123,'Can change registration',42,'change_registration'),(124,'Can delete registration',42,'delete_registration'),(125,'Can add pending name change',43,'add_pendingnamechange'),(126,'Can change pending name change',43,'change_pendingnamechange'),(127,'Can delete pending name change',43,'delete_pendingnamechange'),(128,'Can add pending email change',44,'add_pendingemailchange'),(129,'Can change pending email change',44,'change_pendingemailchange'),(130,'Can delete pending email change',44,'delete_pendingemailchange'),(131,'Can add password history',45,'add_passwordhistory'),(132,'Can change password history',45,'change_passwordhistory'),(133,'Can delete password history',45,'delete_passwordhistory'),(134,'Can add login failures',46,'add_loginfailures'),(135,'Can change login failures',46,'change_loginfailures'),(136,'Can delete login failures',46,'delete_loginfailures'),(137,'Can add historical course enrollment',47,'add_historicalcourseenrollment'),(138,'Can change historical course enrollment',47,'change_historicalcourseenrollment'),(139,'Can delete historical course enrollment',47,'delete_historicalcourseenrollment'),(140,'Can add course enrollment',48,'add_courseenrollment'),(141,'Can change course enrollment',48,'change_courseenrollment'),(142,'Can delete course enrollment',48,'delete_courseenrollment'),(143,'Can add manual enrollment audit',49,'add_manualenrollmentaudit'),(144,'Can change manual enrollment audit',49,'change_manualenrollmentaudit'),(145,'Can delete manual enrollment audit',49,'delete_manualenrollmentaudit'),(146,'Can add course enrollment allowed',50,'add_courseenrollmentallowed'),(147,'Can change course enrollment allowed',50,'change_courseenrollmentallowed'),(148,'Can delete course enrollment allowed',50,'delete_courseenrollmentallowed'),(149,'Can add course access role',51,'add_courseaccessrole'),(150,'Can change course access role',51,'change_courseaccessrole'),(151,'Can delete course access role',51,'delete_courseaccessrole'),(152,'Can add dashboard configuration',52,'add_dashboardconfiguration'),(153,'Can change dashboard configuration',52,'change_dashboardconfiguration'),(154,'Can delete dashboard configuration',52,'delete_dashboardconfiguration'),(155,'Can add linked in add to profile configuration',53,'add_linkedinaddtoprofileconfiguration'),(156,'Can change linked in add to profile configuration',53,'change_linkedinaddtoprofileconfiguration'),(157,'Can delete linked in add to profile configuration',53,'delete_linkedinaddtoprofileconfiguration'),(158,'Can add entrance exam configuration',54,'add_entranceexamconfiguration'),(159,'Can change entrance exam configuration',54,'change_entranceexamconfiguration'),(160,'Can delete entrance exam configuration',54,'delete_entranceexamconfiguration'),(161,'Can add language proficiency',55,'add_languageproficiency'),(162,'Can change language proficiency',55,'change_languageproficiency'),(163,'Can delete language proficiency',55,'delete_languageproficiency'),(164,'Can add course enrollment attribute',56,'add_courseenrollmentattribute'),(165,'Can change course enrollment attribute',56,'change_courseenrollmentattribute'),(166,'Can delete course enrollment attribute',56,'delete_courseenrollmentattribute'),(167,'Can add enrollment refund configuration',57,'add_enrollmentrefundconfiguration'),(168,'Can change enrollment refund configuration',57,'change_enrollmentrefundconfiguration'),(169,'Can delete enrollment refund configuration',57,'delete_enrollmentrefundconfiguration'),(170,'Can add registration cookie configuration',58,'add_registrationcookieconfiguration'),(171,'Can change registration cookie configuration',58,'change_registrationcookieconfiguration'),(172,'Can delete registration cookie configuration',58,'delete_registrationcookieconfiguration'),(173,'Can add user attribute',59,'add_userattribute'),(174,'Can change user attribute',59,'change_userattribute'),(175,'Can delete user attribute',59,'delete_userattribute'),(176,'Can add logout view configuration',60,'add_logoutviewconfiguration'),(177,'Can change logout view configuration',60,'change_logoutviewconfiguration'),(178,'Can delete logout view configuration',60,'delete_logoutviewconfiguration'),(179,'Can add tracking log',61,'add_trackinglog'),(180,'Can change tracking log',61,'change_trackinglog'),(181,'Can delete tracking log',61,'delete_trackinglog'),(182,'Can add rate limit configuration',62,'add_ratelimitconfiguration'),(183,'Can change rate limit configuration',62,'change_ratelimitconfiguration'),(184,'Can delete rate limit configuration',62,'delete_ratelimitconfiguration'),(185,'Can add certificate whitelist',63,'add_certificatewhitelist'),(186,'Can change certificate whitelist',63,'change_certificatewhitelist'),(187,'Can delete certificate whitelist',63,'delete_certificatewhitelist'),(188,'Can add generated certificate',64,'add_generatedcertificate'),(189,'Can change generated certificate',64,'change_generatedcertificate'),(190,'Can delete generated certificate',64,'delete_generatedcertificate'),(191,'Can add certificate generation history',65,'add_certificategenerationhistory'),(192,'Can change certificate generation history',65,'change_certificategenerationhistory'),(193,'Can delete certificate generation history',65,'delete_certificategenerationhistory'),(194,'Can add certificate invalidation',66,'add_certificateinvalidation'),(195,'Can change certificate invalidation',66,'change_certificateinvalidation'),(196,'Can delete certificate invalidation',66,'delete_certificateinvalidation'),(197,'Can add example certificate set',67,'add_examplecertificateset'),(198,'Can change example certificate set',67,'change_examplecertificateset'),(199,'Can delete example certificate set',67,'delete_examplecertificateset'),(200,'Can add example certificate',68,'add_examplecertificate'),(201,'Can change example certificate',68,'change_examplecertificate'),(202,'Can delete example certificate',68,'delete_examplecertificate'),(203,'Can add certificate generation course setting',69,'add_certificategenerationcoursesetting'),(204,'Can change certificate generation course setting',69,'change_certificategenerationcoursesetting'),(205,'Can delete certificate generation course setting',69,'delete_certificategenerationcoursesetting'),(206,'Can add certificate generation configuration',70,'add_certificategenerationconfiguration'),(207,'Can change certificate generation configuration',70,'change_certificategenerationconfiguration'),(208,'Can delete certificate generation configuration',70,'delete_certificategenerationconfiguration'),(209,'Can add certificate html view configuration',71,'add_certificatehtmlviewconfiguration'),(210,'Can change certificate html view configuration',71,'change_certificatehtmlviewconfiguration'),(211,'Can delete certificate html view configuration',71,'delete_certificatehtmlviewconfiguration'),(212,'Can add certificate template',72,'add_certificatetemplate'),(213,'Can change certificate template',72,'change_certificatetemplate'),(214,'Can delete certificate template',72,'delete_certificatetemplate'),(215,'Can add certificate template asset',73,'add_certificatetemplateasset'),(216,'Can change certificate template asset',73,'change_certificatetemplateasset'),(217,'Can delete certificate template asset',73,'delete_certificatetemplateasset'),(218,'Can add instructor task',74,'add_instructortask'),(219,'Can change instructor task',74,'change_instructortask'),(220,'Can delete instructor task',74,'delete_instructortask'),(221,'Can add grade report setting',75,'add_gradereportsetting'),(222,'Can change grade report setting',75,'change_gradereportsetting'),(223,'Can delete grade report setting',75,'delete_gradereportsetting'),(224,'Can add course user group',76,'add_courseusergroup'),(225,'Can change course user group',76,'change_courseusergroup'),(226,'Can delete course user group',76,'delete_courseusergroup'),(227,'Can add cohort membership',77,'add_cohortmembership'),(228,'Can change cohort membership',77,'change_cohortmembership'),(229,'Can delete cohort membership',77,'delete_cohortmembership'),(230,'Can add course user group partition group',78,'add_courseusergrouppartitiongroup'),(231,'Can change course user group partition group',78,'change_courseusergrouppartitiongroup'),(232,'Can delete course user group partition group',78,'delete_courseusergrouppartitiongroup'),(233,'Can add course cohorts settings',79,'add_coursecohortssettings'),(234,'Can change course cohorts settings',79,'change_coursecohortssettings'),(235,'Can delete course cohorts settings',79,'delete_coursecohortssettings'),(236,'Can add course cohort',80,'add_coursecohort'),(237,'Can change course cohort',80,'change_coursecohort'),(238,'Can delete course cohort',80,'delete_coursecohort'),(239,'Can add unregistered learner cohort assignments',81,'add_unregisteredlearnercohortassignments'),(240,'Can change unregistered learner cohort assignments',81,'change_unregisteredlearnercohortassignments'),(241,'Can delete unregistered learner cohort assignments',81,'delete_unregisteredlearnercohortassignments'),(242,'Can add target',82,'add_target'),(243,'Can change target',82,'change_target'),(244,'Can delete target',82,'delete_target'),(245,'Can add cohort target',83,'add_cohorttarget'),(246,'Can change cohort target',83,'change_cohorttarget'),(247,'Can delete cohort target',83,'delete_cohorttarget'),(248,'Can add course mode target',84,'add_coursemodetarget'),(249,'Can change course mode target',84,'change_coursemodetarget'),(250,'Can delete course mode target',84,'delete_coursemodetarget'),(251,'Can add course email',85,'add_courseemail'),(252,'Can change course email',85,'change_courseemail'),(253,'Can delete course email',85,'delete_courseemail'),(254,'Can add optout',86,'add_optout'),(255,'Can change optout',86,'change_optout'),(256,'Can delete optout',86,'delete_optout'),(257,'Can add course email template',87,'add_courseemailtemplate'),(258,'Can change course email template',87,'change_courseemailtemplate'),(259,'Can delete course email template',87,'delete_courseemailtemplate'),(260,'Can add course authorization',88,'add_courseauthorization'),(261,'Can change course authorization',88,'change_courseauthorization'),(262,'Can delete course authorization',88,'delete_courseauthorization'),(263,'Can add bulk email flag',89,'add_bulkemailflag'),(264,'Can change bulk email flag',89,'change_bulkemailflag'),(265,'Can delete bulk email flag',89,'delete_bulkemailflag'),(266,'Can add branding info config',90,'add_brandinginfoconfig'),(267,'Can change branding info config',90,'change_brandinginfoconfig'),(268,'Can delete branding info config',90,'delete_brandinginfoconfig'),(269,'Can add branding api config',91,'add_brandingapiconfig'),(270,'Can change branding api config',91,'change_brandingapiconfig'),(271,'Can delete branding api config',91,'delete_brandingapiconfig'),(272,'Can add persistent grades enabled flag',92,'add_persistentgradesenabledflag'),(273,'Can change persistent grades enabled flag',92,'change_persistentgradesenabledflag'),(274,'Can delete persistent grades enabled flag',92,'delete_persistentgradesenabledflag'),(275,'Can add course persistent grades flag',93,'add_coursepersistentgradesflag'),(276,'Can change course persistent grades flag',93,'change_coursepersistentgradesflag'),(277,'Can delete course persistent grades flag',93,'delete_coursepersistentgradesflag'),(278,'Can add compute grades setting',94,'add_computegradessetting'),(279,'Can change compute grades setting',94,'change_computegradessetting'),(280,'Can delete compute grades setting',94,'delete_computegradessetting'),(281,'Can add visible blocks',95,'add_visibleblocks'),(282,'Can change visible blocks',95,'change_visibleblocks'),(283,'Can delete visible blocks',95,'delete_visibleblocks'),(284,'Can add persistent subsection grade',96,'add_persistentsubsectiongrade'),(285,'Can change persistent subsection grade',96,'change_persistentsubsectiongrade'),(286,'Can delete persistent subsection grade',96,'delete_persistentsubsectiongrade'),(287,'Can add persistent course grade',97,'add_persistentcoursegrade'),(288,'Can change persistent course grade',97,'change_persistentcoursegrade'),(289,'Can delete persistent course grade',97,'delete_persistentcoursegrade'),(290,'Can add external auth map',98,'add_externalauthmap'),(291,'Can change external auth map',98,'change_externalauthmap'),(292,'Can delete external auth map',98,'delete_externalauthmap'),(293,'Can add nonce',99,'add_nonce'),(294,'Can change nonce',99,'change_nonce'),(295,'Can delete nonce',99,'delete_nonce'),(296,'Can add association',100,'add_association'),(297,'Can change association',100,'change_association'),(298,'Can delete association',100,'delete_association'),(299,'Can add user open id',101,'add_useropenid'),(300,'Can change user open id',101,'change_useropenid'),(301,'Can delete user open id',101,'delete_useropenid'),(302,'The OpenID has been verified',101,'account_verified'),(303,'Can add client',102,'add_client'),(304,'Can change client',102,'change_client'),(305,'Can delete client',102,'delete_client'),(306,'Can add grant',103,'add_grant'),(307,'Can change grant',103,'change_grant'),(308,'Can delete grant',103,'delete_grant'),(309,'Can add access token',104,'add_accesstoken'),(310,'Can change access token',104,'change_accesstoken'),(311,'Can delete access token',104,'delete_accesstoken'),(312,'Can add refresh token',105,'add_refreshtoken'),(313,'Can change refresh token',105,'change_refreshtoken'),(314,'Can delete refresh token',105,'delete_refreshtoken'),(315,'Can add trusted client',106,'add_trustedclient'),(316,'Can change trusted client',106,'change_trustedclient'),(317,'Can delete trusted client',106,'delete_trustedclient'),(318,'Can add application',107,'add_application'),(319,'Can change application',107,'change_application'),(320,'Can delete application',107,'delete_application'),(321,'Can add grant',108,'add_grant'),(322,'Can change grant',108,'change_grant'),(323,'Can delete grant',108,'delete_grant'),(324,'Can add access token',109,'add_accesstoken'),(325,'Can change access token',109,'change_accesstoken'),(326,'Can delete access token',109,'delete_accesstoken'),(327,'Can add refresh token',110,'add_refreshtoken'),(328,'Can change refresh token',110,'change_refreshtoken'),(329,'Can delete refresh token',110,'delete_refreshtoken'),(330,'Can add restricted application',111,'add_restrictedapplication'),(331,'Can change restricted application',111,'change_restrictedapplication'),(332,'Can delete restricted application',111,'delete_restrictedapplication'),(333,'Can add Provider Configuration (OAuth)',112,'add_oauth2providerconfig'),(334,'Can change Provider Configuration (OAuth)',112,'change_oauth2providerconfig'),(335,'Can delete Provider Configuration (OAuth)',112,'delete_oauth2providerconfig'),(336,'Can add Provider Configuration (SAML IdP)',113,'add_samlproviderconfig'),(337,'Can change Provider Configuration (SAML IdP)',113,'change_samlproviderconfig'),(338,'Can delete Provider Configuration (SAML IdP)',113,'delete_samlproviderconfig'),(339,'Can add SAML Configuration',114,'add_samlconfiguration'),(340,'Can change SAML Configuration',114,'change_samlconfiguration'),(341,'Can delete SAML Configuration',114,'delete_samlconfiguration'),(342,'Can add SAML Provider Data',115,'add_samlproviderdata'),(343,'Can change SAML Provider Data',115,'change_samlproviderdata'),(344,'Can delete SAML Provider Data',115,'delete_samlproviderdata'),(345,'Can add Provider Configuration (LTI)',116,'add_ltiproviderconfig'),(346,'Can change Provider Configuration (LTI)',116,'change_ltiproviderconfig'),(347,'Can delete Provider Configuration (LTI)',116,'delete_ltiproviderconfig'),(348,'Can add Provider API Permission',117,'add_providerapipermissions'),(349,'Can change Provider API Permission',117,'change_providerapipermissions'),(350,'Can delete Provider API Permission',117,'delete_providerapipermissions'),(351,'Can add nonce',118,'add_nonce'),(352,'Can change nonce',118,'change_nonce'),(353,'Can delete nonce',118,'delete_nonce'),(354,'Can add scope',119,'add_scope'),(355,'Can change scope',119,'change_scope'),(356,'Can delete scope',119,'delete_scope'),(357,'Can add resource',119,'add_resource'),(358,'Can change resource',119,'change_resource'),(359,'Can delete resource',119,'delete_resource'),(360,'Can add consumer',120,'add_consumer'),(361,'Can change consumer',120,'change_consumer'),(362,'Can delete consumer',120,'delete_consumer'),(363,'Can add token',121,'add_token'),(364,'Can change token',121,'change_token'),(365,'Can delete token',121,'delete_token'),(366,'Can add article',123,'add_article'),(367,'Can change article',123,'change_article'),(368,'Can delete article',123,'delete_article'),(369,'Can edit all articles and lock/unlock/restore',123,'moderate'),(370,'Can change ownership of any article',123,'assign'),(371,'Can assign permissions to other users',123,'grant'),(372,'Can add Article for object',124,'add_articleforobject'),(373,'Can change Article for object',124,'change_articleforobject'),(374,'Can delete Article for object',124,'delete_articleforobject'),(375,'Can add article revision',125,'add_articlerevision'),(376,'Can change article revision',125,'change_articlerevision'),(377,'Can delete article revision',125,'delete_articlerevision'),(378,'Can add URL path',126,'add_urlpath'),(379,'Can change URL path',126,'change_urlpath'),(380,'Can delete URL path',126,'delete_urlpath'),(381,'Can add article plugin',127,'add_articleplugin'),(382,'Can change article plugin',127,'change_articleplugin'),(383,'Can delete article plugin',127,'delete_articleplugin'),(384,'Can add reusable plugin',128,'add_reusableplugin'),(385,'Can change reusable plugin',128,'change_reusableplugin'),(386,'Can delete reusable plugin',128,'delete_reusableplugin'),(387,'Can add simple plugin',129,'add_simpleplugin'),(388,'Can change simple plugin',129,'change_simpleplugin'),(389,'Can delete simple plugin',129,'delete_simpleplugin'),(390,'Can add revision plugin',130,'add_revisionplugin'),(391,'Can change revision plugin',130,'change_revisionplugin'),(392,'Can delete revision plugin',130,'delete_revisionplugin'),(393,'Can add revision plugin revision',131,'add_revisionpluginrevision'),(394,'Can change revision plugin revision',131,'change_revisionpluginrevision'),(395,'Can delete revision plugin revision',131,'delete_revisionpluginrevision'),(396,'Can add image',132,'add_image'),(397,'Can change image',132,'change_image'),(398,'Can delete image',132,'delete_image'),(399,'Can add image revision',133,'add_imagerevision'),(400,'Can change image revision',133,'change_imagerevision'),(401,'Can delete image revision',133,'delete_imagerevision'),(402,'Can add attachment',134,'add_attachment'),(403,'Can change attachment',134,'change_attachment'),(404,'Can delete attachment',134,'delete_attachment'),(405,'Can add attachment revision',135,'add_attachmentrevision'),(406,'Can change attachment revision',135,'change_attachmentrevision'),(407,'Can delete attachment revision',135,'delete_attachmentrevision'),(408,'Can add type',136,'add_notificationtype'),(409,'Can change type',136,'change_notificationtype'),(410,'Can delete type',136,'delete_notificationtype'),(411,'Can add settings',137,'add_settings'),(412,'Can change settings',137,'change_settings'),(413,'Can delete settings',137,'delete_settings'),(414,'Can add subscription',138,'add_subscription'),(415,'Can change subscription',138,'change_subscription'),(416,'Can delete subscription',138,'delete_subscription'),(417,'Can add notification',139,'add_notification'),(418,'Can change notification',139,'change_notification'),(419,'Can delete notification',139,'delete_notification'),(420,'Can add log entry',140,'add_logentry'),(421,'Can change log entry',140,'change_logentry'),(422,'Can delete log entry',140,'delete_logentry'),(423,'Can add role',141,'add_role'),(424,'Can change role',141,'change_role'),(425,'Can delete role',141,'delete_role'),(426,'Can add permission',142,'add_permission'),(427,'Can change permission',142,'change_permission'),(428,'Can delete permission',142,'delete_permission'),(429,'Can add forums config',143,'add_forumsconfig'),(430,'Can change forums config',143,'change_forumsconfig'),(431,'Can delete forums config',143,'delete_forumsconfig'),(432,'Can add course discussion settings',144,'add_coursediscussionsettings'),(433,'Can change course discussion settings',144,'change_coursediscussionsettings'),(434,'Can delete course discussion settings',144,'delete_coursediscussionsettings'),(435,'Can add note',145,'add_note'),(436,'Can change note',145,'change_note'),(437,'Can delete note',145,'delete_note'),(438,'Can add splash config',146,'add_splashconfig'),(439,'Can change splash config',146,'change_splashconfig'),(440,'Can delete splash config',146,'delete_splashconfig'),(441,'Can add user preference',147,'add_userpreference'),(442,'Can change user preference',147,'change_userpreference'),(443,'Can delete user preference',147,'delete_userpreference'),(444,'Can add user course tag',148,'add_usercoursetag'),(445,'Can change user course tag',148,'change_usercoursetag'),(446,'Can delete user course tag',148,'delete_usercoursetag'),(447,'Can add user org tag',149,'add_userorgtag'),(448,'Can change user org tag',149,'change_userorgtag'),(449,'Can delete user org tag',149,'delete_userorgtag'),(450,'Can add order',150,'add_order'),(451,'Can change order',150,'change_order'),(452,'Can delete order',150,'delete_order'),(453,'Can add order item',151,'add_orderitem'),(454,'Can change order item',151,'change_orderitem'),(455,'Can delete order item',151,'delete_orderitem'),(456,'Can add invoice',152,'add_invoice'),(457,'Can change invoice',152,'change_invoice'),(458,'Can delete invoice',152,'delete_invoice'),(459,'Can add invoice transaction',153,'add_invoicetransaction'),(460,'Can change invoice transaction',153,'change_invoicetransaction'),(461,'Can delete invoice transaction',153,'delete_invoicetransaction'),(462,'Can add invoice item',154,'add_invoiceitem'),(463,'Can change invoice item',154,'change_invoiceitem'),(464,'Can delete invoice item',154,'delete_invoiceitem'),(465,'Can add course registration code invoice item',155,'add_courseregistrationcodeinvoiceitem'),(466,'Can change course registration code invoice item',155,'change_courseregistrationcodeinvoiceitem'),(467,'Can delete course registration code invoice item',155,'delete_courseregistrationcodeinvoiceitem'),(468,'Can add invoice history',156,'add_invoicehistory'),(469,'Can change invoice history',156,'change_invoicehistory'),(470,'Can delete invoice history',156,'delete_invoicehistory'),(471,'Can add course registration code',157,'add_courseregistrationcode'),(472,'Can change course registration code',157,'change_courseregistrationcode'),(473,'Can delete course registration code',157,'delete_courseregistrationcode'),(474,'Can add registration code redemption',158,'add_registrationcoderedemption'),(475,'Can change registration code redemption',158,'change_registrationcoderedemption'),(476,'Can delete registration code redemption',158,'delete_registrationcoderedemption'),(477,'Can add coupon',159,'add_coupon'),(478,'Can change coupon',159,'change_coupon'),(479,'Can delete coupon',159,'delete_coupon'),(480,'Can add coupon redemption',160,'add_couponredemption'),(481,'Can change coupon redemption',160,'change_couponredemption'),(482,'Can delete coupon redemption',160,'delete_couponredemption'),(483,'Can add paid course registration',161,'add_paidcourseregistration'),(484,'Can change paid course registration',161,'change_paidcourseregistration'),(485,'Can delete paid course registration',161,'delete_paidcourseregistration'),(486,'Can add course reg code item',162,'add_courseregcodeitem'),(487,'Can change course reg code item',162,'change_courseregcodeitem'),(488,'Can delete course reg code item',162,'delete_courseregcodeitem'),(489,'Can add course reg code item annotation',163,'add_courseregcodeitemannotation'),(490,'Can change course reg code item annotation',163,'change_courseregcodeitemannotation'),(491,'Can delete course reg code item annotation',163,'delete_courseregcodeitemannotation'),(492,'Can add paid course registration annotation',164,'add_paidcourseregistrationannotation'),(493,'Can change paid course registration annotation',164,'change_paidcourseregistrationannotation'),(494,'Can delete paid course registration annotation',164,'delete_paidcourseregistrationannotation'),(495,'Can add certificate item',165,'add_certificateitem'),(496,'Can change certificate item',165,'change_certificateitem'),(497,'Can delete certificate item',165,'delete_certificateitem'),(498,'Can add donation configuration',166,'add_donationconfiguration'),(499,'Can change donation configuration',166,'change_donationconfiguration'),(500,'Can delete donation configuration',166,'delete_donationconfiguration'),(501,'Can add donation',167,'add_donation'),(502,'Can change donation',167,'change_donation'),(503,'Can delete donation',167,'delete_donation'),(504,'Can add course mode',168,'add_coursemode'),(505,'Can change course mode',168,'change_coursemode'),(506,'Can delete course mode',168,'delete_coursemode'),(507,'Can add course modes archive',169,'add_coursemodesarchive'),(508,'Can change course modes archive',169,'change_coursemodesarchive'),(509,'Can delete course modes archive',169,'delete_coursemodesarchive'),(510,'Can add course mode expiration config',170,'add_coursemodeexpirationconfig'),(511,'Can change course mode expiration config',170,'change_coursemodeexpirationconfig'),(512,'Can delete course mode expiration config',170,'delete_coursemodeexpirationconfig'),(513,'Can add software secure photo verification',171,'add_softwaresecurephotoverification'),(514,'Can change software secure photo verification',171,'change_softwaresecurephotoverification'),(515,'Can delete software secure photo verification',171,'delete_softwaresecurephotoverification'),(516,'Can add historical verification deadline',172,'add_historicalverificationdeadline'),(517,'Can change historical verification deadline',172,'change_historicalverificationdeadline'),(518,'Can delete historical verification deadline',172,'delete_historicalverificationdeadline'),(519,'Can add verification deadline',173,'add_verificationdeadline'),(520,'Can change verification deadline',173,'change_verificationdeadline'),(521,'Can delete verification deadline',173,'delete_verificationdeadline'),(522,'Can add verification checkpoint',174,'add_verificationcheckpoint'),(523,'Can change verification checkpoint',174,'change_verificationcheckpoint'),(524,'Can delete verification checkpoint',174,'delete_verificationcheckpoint'),(525,'Can add Verification Status',175,'add_verificationstatus'),(526,'Can change Verification Status',175,'change_verificationstatus'),(527,'Can delete Verification Status',175,'delete_verificationstatus'),(528,'Can add in course reverification configuration',176,'add_incoursereverificationconfiguration'),(529,'Can change in course reverification configuration',176,'change_incoursereverificationconfiguration'),(530,'Can delete in course reverification configuration',176,'delete_incoursereverificationconfiguration'),(531,'Can add icrv status emails configuration',177,'add_icrvstatusemailsconfiguration'),(532,'Can change icrv status emails configuration',177,'change_icrvstatusemailsconfiguration'),(533,'Can delete icrv status emails configuration',177,'delete_icrvstatusemailsconfiguration'),(534,'Can add skipped reverification',178,'add_skippedreverification'),(535,'Can change skipped reverification',178,'change_skippedreverification'),(536,'Can delete skipped reverification',178,'delete_skippedreverification'),(537,'Can add dark lang config',179,'add_darklangconfig'),(538,'Can change dark lang config',179,'change_darklangconfig'),(539,'Can delete dark lang config',179,'delete_darklangconfig'),(540,'Can add microsite',180,'add_microsite'),(541,'Can change microsite',180,'change_microsite'),(542,'Can delete microsite',180,'delete_microsite'),(543,'Can add microsite history',181,'add_micrositehistory'),(544,'Can change microsite history',181,'change_micrositehistory'),(545,'Can delete microsite history',181,'delete_micrositehistory'),(546,'Can add historical microsite organization mapping',182,'add_historicalmicrositeorganizationmapping'),(547,'Can change historical microsite organization mapping',182,'change_historicalmicrositeorganizationmapping'),(548,'Can delete historical microsite organization mapping',182,'delete_historicalmicrositeorganizationmapping'),(549,'Can add microsite organization mapping',183,'add_micrositeorganizationmapping'),(550,'Can change microsite organization mapping',183,'change_micrositeorganizationmapping'),(551,'Can delete microsite organization mapping',183,'delete_micrositeorganizationmapping'),(552,'Can add historical microsite template',184,'add_historicalmicrositetemplate'),(553,'Can change historical microsite template',184,'change_historicalmicrositetemplate'),(554,'Can delete historical microsite template',184,'delete_historicalmicrositetemplate'),(555,'Can add microsite template',185,'add_micrositetemplate'),(556,'Can change microsite template',185,'change_micrositetemplate'),(557,'Can delete microsite template',185,'delete_micrositetemplate'),(558,'Can add whitelisted rss url',186,'add_whitelistedrssurl'),(559,'Can change whitelisted rss url',186,'change_whitelistedrssurl'),(560,'Can delete whitelisted rss url',186,'delete_whitelistedrssurl'),(561,'Can add embargoed course',187,'add_embargoedcourse'),(562,'Can change embargoed course',187,'change_embargoedcourse'),(563,'Can delete embargoed course',187,'delete_embargoedcourse'),(564,'Can add embargoed state',188,'add_embargoedstate'),(565,'Can change embargoed state',188,'change_embargoedstate'),(566,'Can delete embargoed state',188,'delete_embargoedstate'),(567,'Can add restricted course',189,'add_restrictedcourse'),(568,'Can change restricted course',189,'change_restrictedcourse'),(569,'Can delete restricted course',189,'delete_restrictedcourse'),(570,'Can add country',190,'add_country'),(571,'Can change country',190,'change_country'),(572,'Can delete country',190,'delete_country'),(573,'Can add country access rule',191,'add_countryaccessrule'),(574,'Can change country access rule',191,'change_countryaccessrule'),(575,'Can delete country access rule',191,'delete_countryaccessrule'),(576,'Can add course access rule history',192,'add_courseaccessrulehistory'),(577,'Can change course access rule history',192,'change_courseaccessrulehistory'),(578,'Can delete course access rule history',192,'delete_courseaccessrulehistory'),(579,'Can add ip filter',193,'add_ipfilter'),(580,'Can change ip filter',193,'change_ipfilter'),(581,'Can delete ip filter',193,'delete_ipfilter'),(582,'Can add course rerun state',194,'add_coursererunstate'),(583,'Can change course rerun state',194,'change_coursererunstate'),(584,'Can delete course rerun state',194,'delete_coursererunstate'),(585,'Can add mobile api config',195,'add_mobileapiconfig'),(586,'Can change mobile api config',195,'change_mobileapiconfig'),(587,'Can delete mobile api config',195,'delete_mobileapiconfig'),(588,'Can add app version config',196,'add_appversionconfig'),(589,'Can change app version config',196,'change_appversionconfig'),(590,'Can delete app version config',196,'delete_appversionconfig'),(591,'Can add ignore mobile available flag config',197,'add_ignoremobileavailableflagconfig'),(592,'Can change ignore mobile available flag config',197,'change_ignoremobileavailableflagconfig'),(593,'Can delete ignore mobile available flag config',197,'delete_ignoremobileavailableflagconfig'),(594,'Can add user social auth',198,'add_usersocialauth'),(595,'Can change user social auth',198,'change_usersocialauth'),(596,'Can delete user social auth',198,'delete_usersocialauth'),(597,'Can add nonce',199,'add_nonce'),(598,'Can change nonce',199,'change_nonce'),(599,'Can delete nonce',199,'delete_nonce'),(600,'Can add association',200,'add_association'),(601,'Can change association',200,'change_association'),(602,'Can delete association',200,'delete_association'),(603,'Can add code',201,'add_code'),(604,'Can change code',201,'change_code'),(605,'Can delete code',201,'delete_code'),(606,'Can add survey form',202,'add_surveyform'),(607,'Can change survey form',202,'change_surveyform'),(608,'Can delete survey form',202,'delete_surveyform'),(609,'Can add survey answer',203,'add_surveyanswer'),(610,'Can change survey answer',203,'change_surveyanswer'),(611,'Can delete survey answer',203,'delete_surveyanswer'),(612,'Can add x block asides config',204,'add_xblockasidesconfig'),(613,'Can change x block asides config',204,'change_xblockasidesconfig'),(614,'Can delete x block asides config',204,'delete_xblockasidesconfig'),(615,'Can add course overview',205,'add_courseoverview'),(616,'Can change course overview',205,'change_courseoverview'),(617,'Can delete course overview',205,'delete_courseoverview'),(618,'Can add course overview tab',206,'add_courseoverviewtab'),(619,'Can change course overview tab',206,'change_courseoverviewtab'),(620,'Can delete course overview tab',206,'delete_courseoverviewtab'),(621,'Can add course overview image set',207,'add_courseoverviewimageset'),(622,'Can change course overview image set',207,'change_courseoverviewimageset'),(623,'Can delete course overview image set',207,'delete_courseoverviewimageset'),(624,'Can add course overview image config',208,'add_courseoverviewimageconfig'),(625,'Can change course overview image config',208,'change_courseoverviewimageconfig'),(626,'Can delete course overview image config',208,'delete_courseoverviewimageconfig'),(627,'Can add course structure',209,'add_coursestructure'),(628,'Can change course structure',209,'change_coursestructure'),(629,'Can delete course structure',209,'delete_coursestructure'),(630,'Can add block structure configuration',210,'add_blockstructureconfiguration'),(631,'Can change block structure configuration',210,'change_blockstructureconfiguration'),(632,'Can delete block structure configuration',210,'delete_blockstructureconfiguration'),(633,'Can add block structure model',211,'add_blockstructuremodel'),(634,'Can change block structure model',211,'change_blockstructuremodel'),(635,'Can delete block structure model',211,'delete_blockstructuremodel'),(636,'Can add cors model',212,'add_corsmodel'),(637,'Can change cors model',212,'change_corsmodel'),(638,'Can delete cors model',212,'delete_corsmodel'),(639,'Can add x domain proxy configuration',213,'add_xdomainproxyconfiguration'),(640,'Can change x domain proxy configuration',213,'change_xdomainproxyconfiguration'),(641,'Can delete x domain proxy configuration',213,'delete_xdomainproxyconfiguration'),(642,'Can add commerce configuration',214,'add_commerceconfiguration'),(643,'Can change commerce configuration',214,'change_commerceconfiguration'),(644,'Can delete commerce configuration',214,'delete_commerceconfiguration'),(645,'Can add credit provider',215,'add_creditprovider'),(646,'Can change credit provider',215,'change_creditprovider'),(647,'Can delete credit provider',215,'delete_creditprovider'),(648,'Can add credit course',216,'add_creditcourse'),(649,'Can change credit course',216,'change_creditcourse'),(650,'Can delete credit course',216,'delete_creditcourse'),(651,'Can add credit requirement',217,'add_creditrequirement'),(652,'Can change credit requirement',217,'change_creditrequirement'),(653,'Can delete credit requirement',217,'delete_creditrequirement'),(654,'Can add historical credit requirement status',218,'add_historicalcreditrequirementstatus'),(655,'Can change historical credit requirement status',218,'change_historicalcreditrequirementstatus'),(656,'Can delete historical credit requirement status',218,'delete_historicalcreditrequirementstatus'),(657,'Can add credit requirement status',219,'add_creditrequirementstatus'),(658,'Can change credit requirement status',219,'change_creditrequirementstatus'),(659,'Can delete credit requirement status',219,'delete_creditrequirementstatus'),(660,'Can add credit eligibility',220,'add_crediteligibility'),(661,'Can change credit eligibility',220,'change_crediteligibility'),(662,'Can delete credit eligibility',220,'delete_crediteligibility'),(663,'Can add historical credit request',221,'add_historicalcreditrequest'),(664,'Can change historical credit request',221,'change_historicalcreditrequest'),(665,'Can delete historical credit request',221,'delete_historicalcreditrequest'),(666,'Can add credit request',222,'add_creditrequest'),(667,'Can change credit request',222,'change_creditrequest'),(668,'Can delete credit request',222,'delete_creditrequest'),(669,'Can add credit config',223,'add_creditconfig'),(670,'Can change credit config',223,'change_creditconfig'),(671,'Can delete credit config',223,'delete_creditconfig'),(672,'Can add course team',224,'add_courseteam'),(673,'Can change course team',224,'change_courseteam'),(674,'Can delete course team',224,'delete_courseteam'),(675,'Can add course team membership',225,'add_courseteammembership'),(676,'Can change course team membership',225,'change_courseteammembership'),(677,'Can delete course team membership',225,'delete_courseteammembership'),(678,'Can add x block configuration',226,'add_xblockconfiguration'),(679,'Can change x block configuration',226,'change_xblockconfiguration'),(680,'Can delete x block configuration',226,'delete_xblockconfiguration'),(681,'Can add x block studio configuration flag',227,'add_xblockstudioconfigurationflag'),(682,'Can change x block studio configuration flag',227,'change_xblockstudioconfigurationflag'),(683,'Can delete x block studio configuration flag',227,'delete_xblockstudioconfigurationflag'),(684,'Can add x block studio configuration',228,'add_xblockstudioconfiguration'),(685,'Can change x block studio configuration',228,'change_xblockstudioconfiguration'),(686,'Can delete x block studio configuration',228,'delete_xblockstudioconfiguration'),(687,'Can add bookmark',229,'add_bookmark'),(688,'Can change bookmark',229,'change_bookmark'),(689,'Can delete bookmark',229,'delete_bookmark'),(690,'Can add x block cache',230,'add_xblockcache'),(691,'Can change x block cache',230,'change_xblockcache'),(692,'Can delete x block cache',230,'delete_xblockcache'),(693,'Can add programs api config',231,'add_programsapiconfig'),(694,'Can change programs api config',231,'change_programsapiconfig'),(695,'Can delete programs api config',231,'delete_programsapiconfig'),(696,'Can add catalog integration',232,'add_catalogintegration'),(697,'Can change catalog integration',232,'change_catalogintegration'),(698,'Can delete catalog integration',232,'delete_catalogintegration'),(699,'Can add self paced configuration',233,'add_selfpacedconfiguration'),(700,'Can change self paced configuration',233,'change_selfpacedconfiguration'),(701,'Can delete self paced configuration',233,'delete_selfpacedconfiguration'),(702,'Can add kv store',234,'add_kvstore'),(703,'Can change kv store',234,'change_kvstore'),(704,'Can delete kv store',234,'delete_kvstore'),(705,'Can add credentials api config',235,'add_credentialsapiconfig'),(706,'Can change credentials api config',235,'change_credentialsapiconfig'),(707,'Can delete credentials api config',235,'delete_credentialsapiconfig'),(708,'Can add milestone',236,'add_milestone'),(709,'Can change milestone',236,'change_milestone'),(710,'Can delete milestone',236,'delete_milestone'),(711,'Can add milestone relationship type',237,'add_milestonerelationshiptype'),(712,'Can change milestone relationship type',237,'change_milestonerelationshiptype'),(713,'Can delete milestone relationship type',237,'delete_milestonerelationshiptype'),(714,'Can add course milestone',238,'add_coursemilestone'),(715,'Can change course milestone',238,'change_coursemilestone'),(716,'Can delete course milestone',238,'delete_coursemilestone'),(717,'Can add course content milestone',239,'add_coursecontentmilestone'),(718,'Can change course content milestone',239,'change_coursecontentmilestone'),(719,'Can delete course content milestone',239,'delete_coursecontentmilestone'),(720,'Can add user milestone',240,'add_usermilestone'),(721,'Can change user milestone',240,'change_usermilestone'),(722,'Can delete user milestone',240,'delete_usermilestone'),(723,'Can add course talk widget configuration',241,'add_coursetalkwidgetconfiguration'),(724,'Can change course talk widget configuration',241,'change_coursetalkwidgetconfiguration'),(725,'Can delete course talk widget configuration',241,'delete_coursetalkwidgetconfiguration'),(726,'Can add historical api access request',242,'add_historicalapiaccessrequest'),(727,'Can change historical api access request',242,'change_historicalapiaccessrequest'),(728,'Can delete historical api access request',242,'delete_historicalapiaccessrequest'),(729,'Can add api access request',1,'add_apiaccessrequest'),(730,'Can change api access request',1,'change_apiaccessrequest'),(731,'Can delete api access request',1,'delete_apiaccessrequest'),(732,'Can add api access config',243,'add_apiaccessconfig'),(733,'Can change api access config',243,'change_apiaccessconfig'),(734,'Can delete api access config',243,'delete_apiaccessconfig'),(735,'Can add catalog',244,'add_catalog'),(736,'Can change catalog',244,'change_catalog'),(737,'Can delete catalog',244,'delete_catalog'),(738,'Can add verified track cohorted course',245,'add_verifiedtrackcohortedcourse'),(739,'Can change verified track cohorted course',245,'change_verifiedtrackcohortedcourse'),(740,'Can delete verified track cohorted course',245,'delete_verifiedtrackcohortedcourse'),(741,'Can add hls playback enabled flag',246,'add_hlsplaybackenabledflag'),(742,'Can change hls playback enabled flag',246,'change_hlsplaybackenabledflag'),(743,'Can delete hls playback enabled flag',246,'delete_hlsplaybackenabledflag'),(744,'Can add course hls playback enabled flag',247,'add_coursehlsplaybackenabledflag'),(745,'Can change course hls playback enabled flag',247,'change_coursehlsplaybackenabledflag'),(746,'Can delete course hls playback enabled flag',247,'delete_coursehlsplaybackenabledflag'),(747,'Can add badge class',248,'add_badgeclass'),(748,'Can change badge class',248,'change_badgeclass'),(749,'Can delete badge class',248,'delete_badgeclass'),(750,'Can add badge assertion',249,'add_badgeassertion'),(751,'Can change badge assertion',249,'change_badgeassertion'),(752,'Can delete badge assertion',249,'delete_badgeassertion'),(753,'Can add course complete image configuration',250,'add_coursecompleteimageconfiguration'),(754,'Can change course complete image configuration',250,'change_coursecompleteimageconfiguration'),(755,'Can delete course complete image configuration',250,'delete_coursecompleteimageconfiguration'),(756,'Can add course event badges configuration',251,'add_courseeventbadgesconfiguration'),(757,'Can change course event badges configuration',251,'change_courseeventbadgesconfiguration'),(758,'Can delete course event badges configuration',251,'delete_courseeventbadgesconfiguration'),(759,'Can add email marketing configuration',252,'add_emailmarketingconfiguration'),(760,'Can change email marketing configuration',252,'change_emailmarketingconfiguration'),(761,'Can delete email marketing configuration',252,'delete_emailmarketingconfiguration'),(762,'Can add failed task',253,'add_failedtask'),(763,'Can change failed task',253,'change_failedtask'),(764,'Can delete failed task',253,'delete_failedtask'),(765,'Can add chord data',254,'add_chorddata'),(766,'Can change chord data',254,'change_chorddata'),(767,'Can delete chord data',254,'delete_chorddata'),(768,'Can add crawlers config',255,'add_crawlersconfig'),(769,'Can change crawlers config',255,'change_crawlersconfig'),(770,'Can delete crawlers config',255,'delete_crawlersconfig'),(771,'Can add Waffle flag course override',256,'add_waffleflagcourseoverridemodel'),(772,'Can change Waffle flag course override',256,'change_waffleflagcourseoverridemodel'),(773,'Can delete Waffle flag course override',256,'delete_waffleflagcourseoverridemodel'),(774,'Can add Experiment Data',257,'add_experimentdata'),(775,'Can change Experiment Data',257,'change_experimentdata'),(776,'Can delete Experiment Data',257,'delete_experimentdata'),(777,'Can add answer',258,'add_answer'),(778,'Can change answer',258,'change_answer'),(779,'Can delete answer',258,'delete_answer'),(780,'Can add answer',259,'add_answer'),(781,'Can change answer',259,'change_answer'),(782,'Can delete answer',259,'delete_answer'),(783,'Can add share',260,'add_share'),(784,'Can change share',260,'change_share'),(785,'Can delete share',260,'delete_share'),(786,'Can add student item',261,'add_studentitem'),(787,'Can change student item',261,'change_studentitem'),(788,'Can delete student item',261,'delete_studentitem'),(789,'Can add submission',262,'add_submission'),(790,'Can change submission',262,'change_submission'),(791,'Can delete submission',262,'delete_submission'),(792,'Can add score',263,'add_score'),(793,'Can change score',263,'change_score'),(794,'Can delete score',263,'delete_score'),(795,'Can add score summary',264,'add_scoresummary'),(796,'Can change score summary',264,'change_scoresummary'),(797,'Can delete score summary',264,'delete_scoresummary'),(798,'Can add score annotation',265,'add_scoreannotation'),(799,'Can change score annotation',265,'change_scoreannotation'),(800,'Can delete score annotation',265,'delete_scoreannotation'),(801,'Can add rubric',266,'add_rubric'),(802,'Can change rubric',266,'change_rubric'),(803,'Can delete rubric',266,'delete_rubric'),(804,'Can add criterion',267,'add_criterion'),(805,'Can change criterion',267,'change_criterion'),(806,'Can delete criterion',267,'delete_criterion'),(807,'Can add criterion option',268,'add_criterionoption'),(808,'Can change criterion option',268,'change_criterionoption'),(809,'Can delete criterion option',268,'delete_criterionoption'),(810,'Can add assessment',269,'add_assessment'),(811,'Can change assessment',269,'change_assessment'),(812,'Can delete assessment',269,'delete_assessment'),(813,'Can add assessment part',270,'add_assessmentpart'),(814,'Can change assessment part',270,'change_assessmentpart'),(815,'Can delete assessment part',270,'delete_assessmentpart'),(816,'Can add assessment feedback option',271,'add_assessmentfeedbackoption'),(817,'Can change assessment feedback option',271,'change_assessmentfeedbackoption'),(818,'Can delete assessment feedback option',271,'delete_assessmentfeedbackoption'),(819,'Can add assessment feedback',272,'add_assessmentfeedback'),(820,'Can change assessment feedback',272,'change_assessmentfeedback'),(821,'Can delete assessment feedback',272,'delete_assessmentfeedback'),(822,'Can add peer workflow',273,'add_peerworkflow'),(823,'Can change peer workflow',273,'change_peerworkflow'),(824,'Can delete peer workflow',273,'delete_peerworkflow'),(825,'Can add peer workflow item',274,'add_peerworkflowitem'),(826,'Can change peer workflow item',274,'change_peerworkflowitem'),(827,'Can delete peer workflow item',274,'delete_peerworkflowitem'),(828,'Can add training example',275,'add_trainingexample'),(829,'Can change training example',275,'change_trainingexample'),(830,'Can delete training example',275,'delete_trainingexample'),(831,'Can add student training workflow',276,'add_studenttrainingworkflow'),(832,'Can change student training workflow',276,'change_studenttrainingworkflow'),(833,'Can delete student training workflow',276,'delete_studenttrainingworkflow'),(834,'Can add student training workflow item',277,'add_studenttrainingworkflowitem'),(835,'Can change student training workflow item',277,'change_studenttrainingworkflowitem'),(836,'Can delete student training workflow item',277,'delete_studenttrainingworkflowitem'),(837,'Can add ai classifier set',278,'add_aiclassifierset'),(838,'Can change ai classifier set',278,'change_aiclassifierset'),(839,'Can delete ai classifier set',278,'delete_aiclassifierset'),(840,'Can add ai classifier',279,'add_aiclassifier'),(841,'Can change ai classifier',279,'change_aiclassifier'),(842,'Can delete ai classifier',279,'delete_aiclassifier'),(843,'Can add ai training workflow',280,'add_aitrainingworkflow'),(844,'Can change ai training workflow',280,'change_aitrainingworkflow'),(845,'Can delete ai training workflow',280,'delete_aitrainingworkflow'),(846,'Can add ai grading workflow',281,'add_aigradingworkflow'),(847,'Can change ai grading workflow',281,'change_aigradingworkflow'),(848,'Can delete ai grading workflow',281,'delete_aigradingworkflow'),(849,'Can add staff workflow',282,'add_staffworkflow'),(850,'Can change staff workflow',282,'change_staffworkflow'),(851,'Can delete staff workflow',282,'delete_staffworkflow'),(852,'Can add assessment workflow',283,'add_assessmentworkflow'),(853,'Can change assessment workflow',283,'change_assessmentworkflow'),(854,'Can delete assessment workflow',283,'delete_assessmentworkflow'),(855,'Can add assessment workflow step',284,'add_assessmentworkflowstep'),(856,'Can change assessment workflow step',284,'change_assessmentworkflowstep'),(857,'Can delete assessment workflow step',284,'delete_assessmentworkflowstep'),(858,'Can add assessment workflow cancellation',285,'add_assessmentworkflowcancellation'),(859,'Can change assessment workflow cancellation',285,'change_assessmentworkflowcancellation'),(860,'Can delete assessment workflow cancellation',285,'delete_assessmentworkflowcancellation'),(861,'Can add profile',286,'add_profile'),(862,'Can change profile',286,'change_profile'),(863,'Can delete profile',286,'delete_profile'),(864,'Can add video',287,'add_video'),(865,'Can change video',287,'change_video'),(866,'Can delete video',287,'delete_video'),(867,'Can add course video',288,'add_coursevideo'),(868,'Can change course video',288,'change_coursevideo'),(869,'Can delete course video',288,'delete_coursevideo'),(870,'Can add encoded video',289,'add_encodedvideo'),(871,'Can change encoded video',289,'change_encodedvideo'),(872,'Can delete encoded video',289,'delete_encodedvideo'),(873,'Can add subtitle',290,'add_subtitle'),(874,'Can change subtitle',290,'change_subtitle'),(875,'Can delete subtitle',290,'delete_subtitle'),(876,'Can add proctored exam',291,'add_proctoredexam'),(877,'Can change proctored exam',291,'change_proctoredexam'),(878,'Can delete proctored exam',291,'delete_proctoredexam'),(879,'Can add Proctored exam review policy',292,'add_proctoredexamreviewpolicy'),(880,'Can change Proctored exam review policy',292,'change_proctoredexamreviewpolicy'),(881,'Can delete Proctored exam review policy',292,'delete_proctoredexamreviewpolicy'),(882,'Can add proctored exam review policy history',293,'add_proctoredexamreviewpolicyhistory'),(883,'Can change proctored exam review policy history',293,'change_proctoredexamreviewpolicyhistory'),(884,'Can delete proctored exam review policy history',293,'delete_proctoredexamreviewpolicyhistory'),(885,'Can add proctored exam attempt',294,'add_proctoredexamstudentattempt'),(886,'Can change proctored exam attempt',294,'change_proctoredexamstudentattempt'),(887,'Can delete proctored exam attempt',294,'delete_proctoredexamstudentattempt'),(888,'Can add proctored exam attempt history',295,'add_proctoredexamstudentattempthistory'),(889,'Can change proctored exam attempt history',295,'change_proctoredexamstudentattempthistory'),(890,'Can delete proctored exam attempt history',295,'delete_proctoredexamstudentattempthistory'),(891,'Can add proctored allowance',296,'add_proctoredexamstudentallowance'),(892,'Can change proctored allowance',296,'change_proctoredexamstudentallowance'),(893,'Can delete proctored allowance',296,'delete_proctoredexamstudentallowance'),(894,'Can add proctored allowance history',297,'add_proctoredexamstudentallowancehistory'),(895,'Can change proctored allowance history',297,'change_proctoredexamstudentallowancehistory'),(896,'Can delete proctored allowance history',297,'delete_proctoredexamstudentallowancehistory'),(897,'Can add Proctored exam software secure review',298,'add_proctoredexamsoftwaresecurereview'),(898,'Can change Proctored exam software secure review',298,'change_proctoredexamsoftwaresecurereview'),(899,'Can delete Proctored exam software secure review',298,'delete_proctoredexamsoftwaresecurereview'),(900,'Can add Proctored exam review archive',299,'add_proctoredexamsoftwaresecurereviewhistory'),(901,'Can change Proctored exam review archive',299,'change_proctoredexamsoftwaresecurereviewhistory'),(902,'Can delete Proctored exam review archive',299,'delete_proctoredexamsoftwaresecurereviewhistory'),(903,'Can add proctored exam software secure comment',300,'add_proctoredexamsoftwaresecurecomment'),(904,'Can change proctored exam software secure comment',300,'change_proctoredexamsoftwaresecurecomment'),(905,'Can delete proctored exam software secure comment',300,'delete_proctoredexamsoftwaresecurecomment'),(906,'Can add organization',301,'add_organization'),(907,'Can change organization',301,'change_organization'),(908,'Can delete organization',301,'delete_organization'),(909,'Can add Link Course',302,'add_organizationcourse'),(910,'Can change Link Course',302,'change_organizationcourse'),(911,'Can delete Link Course',302,'delete_organizationcourse'),(912,'Can add historical Enterprise Customer',303,'add_historicalenterprisecustomer'),(913,'Can change historical Enterprise Customer',303,'change_historicalenterprisecustomer'),(914,'Can delete historical Enterprise Customer',303,'delete_historicalenterprisecustomer'),(915,'Can add Enterprise Customer',304,'add_enterprisecustomer'),(916,'Can change Enterprise Customer',304,'change_enterprisecustomer'),(917,'Can delete Enterprise Customer',304,'delete_enterprisecustomer'),(918,'Can add Enterprise Customer Learner',305,'add_enterprisecustomeruser'),(919,'Can change Enterprise Customer Learner',305,'change_enterprisecustomeruser'),(920,'Can delete Enterprise Customer Learner',305,'delete_enterprisecustomeruser'),(921,'Can add pending enterprise customer user',306,'add_pendingenterprisecustomeruser'),(922,'Can change pending enterprise customer user',306,'change_pendingenterprisecustomeruser'),(923,'Can delete pending enterprise customer user',306,'delete_pendingenterprisecustomeruser'),(924,'Can add pending enrollment',307,'add_pendingenrollment'),(925,'Can change pending enrollment',307,'change_pendingenrollment'),(926,'Can delete pending enrollment',307,'delete_pendingenrollment'),(927,'Can add Branding Configuration',308,'add_enterprisecustomerbrandingconfiguration'),(928,'Can change Branding Configuration',308,'change_enterprisecustomerbrandingconfiguration'),(929,'Can delete Branding Configuration',308,'delete_enterprisecustomerbrandingconfiguration'),(930,'Can add enterprise customer identity provider',309,'add_enterprisecustomeridentityprovider'),(931,'Can change enterprise customer identity provider',309,'change_enterprisecustomeridentityprovider'),(932,'Can delete enterprise customer identity provider',309,'delete_enterprisecustomeridentityprovider'),(933,'Can add historical Data Sharing Consent Audit State',310,'add_historicaluserdatasharingconsentaudit'),(934,'Can change historical Data Sharing Consent Audit State',310,'change_historicaluserdatasharingconsentaudit'),(935,'Can delete historical Data Sharing Consent Audit State',310,'delete_historicaluserdatasharingconsentaudit'),(936,'Can add Data Sharing Consent Audit State',311,'add_userdatasharingconsentaudit'),(937,'Can change Data Sharing Consent Audit State',311,'change_userdatasharingconsentaudit'),(938,'Can delete Data Sharing Consent Audit State',311,'delete_userdatasharingconsentaudit'),(939,'Can add historical Enterprise Customer Entitlement',312,'add_historicalenterprisecustomerentitlement'),(940,'Can change historical Enterprise Customer Entitlement',312,'change_historicalenterprisecustomerentitlement'),(941,'Can delete historical Enterprise Customer Entitlement',312,'delete_historicalenterprisecustomerentitlement'),(942,'Can add Enterprise Customer Entitlement',313,'add_enterprisecustomerentitlement'),(943,'Can change Enterprise Customer Entitlement',313,'change_enterprisecustomerentitlement'),(944,'Can delete Enterprise Customer Entitlement',313,'delete_enterprisecustomerentitlement'),(945,'Can add historical enterprise course enrollment',314,'add_historicalenterprisecourseenrollment'),(946,'Can change historical enterprise course enrollment',314,'change_historicalenterprisecourseenrollment'),(947,'Can delete historical enterprise course enrollment',314,'delete_historicalenterprisecourseenrollment'),(948,'Can add enterprise course enrollment',315,'add_enterprisecourseenrollment'),(949,'Can change enterprise course enrollment',315,'change_enterprisecourseenrollment'),(950,'Can delete enterprise course enrollment',315,'delete_enterprisecourseenrollment'),(951,'Can add historical enrollment notification email template',316,'add_historicalenrollmentnotificationemailtemplate'),(952,'Can change historical enrollment notification email template',316,'change_historicalenrollmentnotificationemailtemplate'),(953,'Can delete historical enrollment notification email template',316,'delete_historicalenrollmentnotificationemailtemplate'),(954,'Can add enrollment notification email template',317,'add_enrollmentnotificationemailtemplate'),(955,'Can change enrollment notification email template',317,'change_enrollmentnotificationemailtemplate'),(956,'Can delete enrollment notification email template',317,'delete_enrollmentnotificationemailtemplate'),(957,'Can add Enterprise Integrated Channel',318,'add_enterpriseintegratedchannel'),(958,'Can change Enterprise Integrated Channel',318,'change_enterpriseintegratedchannel'),(959,'Can delete Enterprise Integrated Channel',318,'delete_enterpriseintegratedchannel'),(960,'Can add sap success factors global configuration',319,'add_sapsuccessfactorsglobalconfiguration'),(961,'Can change sap success factors global configuration',319,'change_sapsuccessfactorsglobalconfiguration'),(962,'Can delete sap success factors global configuration',319,'delete_sapsuccessfactorsglobalconfiguration'),(963,'Can add historical sap success factors enterprise customer configuration',320,'add_historicalsapsuccessfactorsenterprisecustomerconfiguration'),(964,'Can change historical sap success factors enterprise customer configuration',320,'change_historicalsapsuccessfactorsenterprisecustomerconfiguration'),(965,'Can delete historical sap success factors enterprise customer configuration',320,'delete_historicalsapsuccessfactorsenterprisecustomerconfiguration'),(966,'Can add sap success factors enterprise customer configuration',321,'add_sapsuccessfactorsenterprisecustomerconfiguration'),(967,'Can change sap success factors enterprise customer configuration',321,'change_sapsuccessfactorsenterprisecustomerconfiguration'),(968,'Can delete sap success factors enterprise customer configuration',321,'delete_sapsuccessfactorsenterprisecustomerconfiguration'),(969,'Can add learner data transmission audit',322,'add_learnerdatatransmissionaudit'),(970,'Can change learner data transmission audit',322,'change_learnerdatatransmissionaudit'),(971,'Can delete learner data transmission audit',322,'delete_learnerdatatransmissionaudit'),(972,'Can add catalog transmission audit',323,'add_catalogtransmissionaudit'),(973,'Can change catalog transmission audit',323,'change_catalogtransmissionaudit'),(974,'Can delete catalog transmission audit',323,'delete_catalogtransmissionaudit'),(975,'Can add student module history extended',324,'add_studentmodulehistoryextended'),(976,'Can change student module history extended',324,'change_studentmodulehistoryextended'),(977,'Can delete student module history extended',324,'delete_studentmodulehistoryextended'),(978,'Can add video upload config',325,'add_videouploadconfig'),(979,'Can change video upload config',325,'change_videouploadconfig'),(980,'Can delete video upload config',325,'delete_videouploadconfig'),(981,'Can add push notification config',326,'add_pushnotificationconfig'),(982,'Can change push notification config',326,'change_pushnotificationconfig'),(983,'Can delete push notification config',326,'delete_pushnotificationconfig'),(984,'Can add course creator',327,'add_coursecreator'),(985,'Can change course creator',327,'change_coursecreator'),(986,'Can delete course creator',327,'delete_coursecreator'),(987,'Can add studio config',328,'add_studioconfig'),(988,'Can change studio config',328,'change_studioconfig'),(989,'Can delete studio config',328,'delete_studioconfig'),(990,'Can add course edit lti fields enabled flag',329,'add_courseeditltifieldsenabledflag'),(991,'Can change course edit lti fields enabled flag',329,'change_courseeditltifieldsenabledflag'),(992,'Can delete course edit lti fields enabled flag',329,'delete_courseeditltifieldsenabledflag'),(993,'Can add tag category',330,'add_tagcategories'),(994,'Can change tag category',330,'change_tagcategories'),(995,'Can delete tag category',330,'delete_tagcategories'),(996,'Can add available tag value',331,'add_tagavailablevalues'),(997,'Can change available tag value',331,'change_tagavailablevalues'),(998,'Can delete available tag value',331,'delete_tagavailablevalues'),(999,'Can add user task status',332,'add_usertaskstatus'),(1000,'Can change user task status',332,'change_usertaskstatus'),(1001,'Can delete user task status',332,'delete_usertaskstatus'),(1002,'Can add user task artifact',333,'add_usertaskartifact'),(1003,'Can change user task artifact',333,'change_usertaskartifact'),(1004,'Can delete user task artifact',333,'delete_usertaskartifact');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_registration_user_id_734af68780d0cf34_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!vMikb9LS2ld67GvCyA51tJqufh56oSHrcXvEjyog',NULL,0,'ecommerce_worker','','','ecommerce_worker@fake.email',0,1,'2017-06-20 20:11:17.055144');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `allow_certificate` tinyint(1) NOT NULL,
  `bio` varchar(3000) DEFAULT NULL,
  `profile_image_uploaded_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_b068931c` (`name`),
  KEY `auth_userprofile_8512ae7d` (`language`),
  KEY `auth_userprofile_d5189de0` (`location`),
  KEY `auth_userprofile_8939d49d` (`year_of_birth`),
  KEY `auth_userprofile_cc90f191` (`gender`),
  KEY `auth_userprofile_a895faa8` (`level_of_education`),
  CONSTRAINT `auth_userprofile_user_id_4c194f9b5650ad70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
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
  KEY `badges_badgeassertion_e2fa5388` (`created`),
  KEY `badges_badgeassertion_c389e456` (`badge_class_id`),
  KEY `badges_badgeassertion_e8701ad4` (`user_id`),
  CONSTRAINT `badges_b_badge_class_id_3a4a16cb833201e8_fk_badges_badgeclass_id` FOREIGN KEY (`badge_class_id`) REFERENCES `badges_badgeclass` (`id`),
  CONSTRAINT `badges_badgeassertion_user_id_14233cdefee1055a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `badges_badgeclass_slug_7fe9eac3bca91f16_uniq` (`slug`,`issuing_component`,`course_id`),
  KEY `badges_badgeclass_2dbcba41` (`slug`),
  KEY `badges_badgeclass_a57403f2` (`issuing_component`)
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
INSERT INTO `badges_coursecompleteimageconfiguration` VALUES (1,'honor','badges/honor.png',0),(2,'verified','badges/verified.png',0),(3,'professional','badges/professional.png',0);
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
  KEY `badges_courseeven_changed_by_id_50986a94d73238b9_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `badges_courseeven_changed_by_id_50986a94d73238b9_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `block_structure_c_changed_by_id_1b1edef3e5767b34_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `block_structure_c_changed_by_id_1b1edef3e5767b34_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `bookmarks_bookmark_user_id_7059f67cddd52c9a_uniq` (`user_id`,`usage_key`),
  KEY `bookmarks_bookmark_c8235886` (`course_key`),
  KEY `bookmarks_bookmark_4a93f0de` (`usage_key`),
  KEY `bookmarks_bookmark_d452fbf6` (`xblock_cache_id`),
  CONSTRAINT `boo_xblock_cache_id_22d48842487ba2d2_fk_bookmarks_xblockcache_id` FOREIGN KEY (`xblock_cache_id`) REFERENCES `bookmarks_xblockcache` (`id`),
  CONSTRAINT `bookmarks_bookmark_user_id_33914fa9accf01cb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `bookmarks_xblockcache_c8235886` (`course_key`)
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
  KEY `branding_branding_changed_by_id_127fa63777522d05_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `branding_branding_changed_by_id_127fa63777522d05_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `branding_branding_changed_by_id_298e4241fae118cc_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `branding_branding_changed_by_id_298e4241fae118cc_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `bulk_email_bulkem_changed_by_id_67960d6511f876aa_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `bulk_email_bulkem_changed_by_id_67960d6511f876aa_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `b_cohort_id_3d66a5e8e283dba0_fk_course_groups_courseusergroup_id` (`cohort_id`),
  CONSTRAINT `b_cohort_id_3d66a5e8e283dba0_fk_course_groups_courseusergroup_id` FOREIGN KEY (`cohort_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `bulk_emai_target_ptr_id_7974c77c83c2899d_fk_bulk_email_target_id` FOREIGN KEY (`target_ptr_id`) REFERENCES `bulk_email_target` (`id`)
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
  KEY `bulk_email_courseemai_sender_id_37be3a6322a26640_fk_auth_user_id` (`sender_id`),
  KEY `bulk_email_courseemail_2dbcba41` (`slug`),
  KEY `bulk_email_courseemail_ea134da7` (`course_id`),
  CONSTRAINT `bulk_email_courseemai_sender_id_37be3a6322a26640_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `courseemail_id` (`courseemail_id`,`target_id`),
  KEY `bulk_email_co_target_id_6cdcd92a52b1f9d9_fk_bulk_email_target_id` (`target_id`),
  CONSTRAINT `bul_courseemail_id_47818d2b9b38e0e0_fk_bulk_email_courseemail_id` FOREIGN KEY (`courseemail_id`) REFERENCES `bulk_email_courseemail` (`id`),
  CONSTRAINT `bulk_email_co_target_id_6cdcd92a52b1f9d9_fk_bulk_email_target_id` FOREIGN KEY (`target_id`) REFERENCES `bulk_email_target` (`id`)
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
INSERT INTO `bulk_email_courseemailtemplate` VALUES (1,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','{course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nGoogle+ (https://plus.google.com/108235383044095082735)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n',NULL),(2,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        THIS IS A BRANDED HTML TEMPLATE <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','THIS IS A BRANDED TEXT TEMPLATE. {course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nGoogle+ (https://plus.google.com/108235383044095082735)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n','branded.template');
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
  KEY `bulk_ema_track_id_22015815e2847a7c_fk_course_modes_coursemode_id` (`track_id`),
  CONSTRAINT `bulk_ema_track_id_22015815e2847a7c_fk_course_modes_coursemode_id` FOREIGN KEY (`track_id`) REFERENCES `course_modes_coursemode` (`id`),
  CONSTRAINT `bulk_email_target_ptr_id_f860b6472e1dca2_fk_bulk_email_target_id` FOREIGN KEY (`target_ptr_id`) REFERENCES `bulk_email_target` (`id`)
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
-- Table structure for table `bulk_email_optout`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_optout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_optout_user_id_7710cb544aafa8a_uniq` (`user_id`,`course_id`),
  KEY `bulk_email_optout_ea134da7` (`course_id`),
  CONSTRAINT `bulk_email_optout_user_id_5d6e4a037bcf14bd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `catalog_catalogin_changed_by_id_4c786efa531d484b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `catalog_catalogin_changed_by_id_4c786efa531d484b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_catalogintegration`
--

LOCK TABLES `catalog_catalogintegration` WRITE;
/*!40000 ALTER TABLE `catalog_catalogintegration` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_catalogintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_utils_chorddata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_utils_chorddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialized_callback` longtext NOT NULL,
  `callback_result_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `callback_result_id` (`callback_result_id`),
  CONSTRAINT `celery_callback_result_id_230f1d5ec4608165_fk_celery_taskmeta_id` FOREIGN KEY (`callback_result_id`) REFERENCES `celery_taskmeta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_utils_chorddata`
--

LOCK TABLES `celery_utils_chorddata` WRITE;
/*!40000 ALTER TABLE `celery_utils_chorddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_utils_chorddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_utils_chorddata_completed_results`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_utils_chorddata_completed_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chorddata_id` int(11) NOT NULL,
  `taskmeta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chorddata_id` (`chorddata_id`,`taskmeta_id`),
  KEY `celery_utils__taskmeta_id_16beefb23621d690_fk_celery_taskmeta_id` (`taskmeta_id`),
  CONSTRAINT `celery_chorddata_id_2abad2f2a442ac5_fk_celery_utils_chorddata_id` FOREIGN KEY (`chorddata_id`) REFERENCES `celery_utils_chorddata` (`id`),
  CONSTRAINT `celery_utils__taskmeta_id_16beefb23621d690_fk_celery_taskmeta_id` FOREIGN KEY (`taskmeta_id`) REFERENCES `celery_taskmeta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_utils_chorddata_completed_results`
--

LOCK TABLES `celery_utils_chorddata_completed_results` WRITE;
/*!40000 ALTER TABLE `celery_utils_chorddata_completed_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_utils_chorddata_completed_results` ENABLE KEYS */;
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
  KEY `celery_utils_failedtask_task_name_2cb4bd734027fd4f_idx` (`task_name`,`exc`),
  KEY `celery_utils_failedtask_57746cc8` (`task_id`),
  KEY `celery_utils_failedtask_499aafb6` (`datetime_resolved`)
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
  KEY `certificates_cert_changed_by_id_2a1d896cdbd5fec5_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `certificates_cert_changed_by_id_2a1d896cdbd5fec5_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificategenerationcoursesetting_c8235886` (`course_key`)
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
  KEY `certificates_ce_generated_by_id_4679598e2d7d6e10_fk_auth_user_id` (`generated_by_id`),
  KEY `D794923145b81064c232a4d0bfe79880` (`instructor_task_id`),
  CONSTRAINT `D794923145b81064c232a4d0bfe79880` FOREIGN KEY (`instructor_task_id`) REFERENCES `instructor_task_instructortask` (`id`),
  CONSTRAINT `certificates_ce_generated_by_id_4679598e2d7d6e10_fk_auth_user_id` FOREIGN KEY (`generated_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `certificates_cert_changed_by_id_1de6cf549bca749b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `certificates_cert_changed_by_id_1de6cf549bca749b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatehtmlviewconfiguration`
--

LOCK TABLES `certificates_certificatehtmlviewconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` DISABLE KEYS */;
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2017-06-20 20:11:03.327855',0,'{\"default\": {\"accomplishment_class_append\": \"accomplishment-certificate\", \"platform_name\": \"Your Platform Name Here\", \"logo_src\": \"/static/certificates/images/logo.png\", \"logo_url\": \"http://www.example.com\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"company_about_url\": \"http://www.example.com/about-us\"}, \"verified\": {\"certificate_type\": \"Verified\", \"certificate_title\": \"Verified Certificate of Achievement\"}, \"honor\": {\"certificate_type\": \"Honor Code\", \"certificate_title\": \"Certificate of Achievement\"}}',NULL);
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
  KEY `fa0dc816ca8028cd93e5f2289d405d87` (`generated_certificate_id`),
  KEY `certificates__invalidated_by_id_5198db337fb56b7b_fk_auth_user_id` (`invalidated_by_id`),
  CONSTRAINT `certificates__invalidated_by_id_5198db337fb56b7b_fk_auth_user_id` FOREIGN KEY (`invalidated_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fa0dc816ca8028cd93e5f2289d405d87` FOREIGN KEY (`generated_certificate_id`) REFERENCES `certificates_generatedcertificate` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificatetem_organization_id_f0c7bfd32b374fb_uniq` (`organization_id`,`course_key`,`mode`),
  KEY `certificates_certificatetemplate_26b2345e` (`organization_id`),
  KEY `certificates_certificatetemplate_c8235886` (`course_key`)
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
  `asset_slug` varchar(255),
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
-- Table structure for table `certificates_certificatewhitelist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatewhitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `whitelist` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `notes` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificat_user_id_50b0bc90075a5407_fk_auth_user_id` (`user_id`),
  CONSTRAINT `certificates_certificat_user_id_50b0bc90075a5407_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatewhitelist`
--

LOCK TABLES `certificates_certificatewhitelist` WRITE;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` ENABLE KEYS */;
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
  KEY `certificates_examplecertificate_91685379` (`access_key`),
  KEY `certificates_examplecertificate_c9ee6da7` (`example_cert_set_id`),
  CONSTRAINT `D5ceae87b49ed6ab15ace7b6f1c01c35` FOREIGN KEY (`example_cert_set_id`) REFERENCES `certificates_examplecertificateset` (`id`)
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
  KEY `certificates_examplecertificateset_c8235886` (`course_key`)
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
  UNIQUE KEY `certificates_generatedcertificate_user_id_552a0fa6f7d3f7e8_uniq` (`user_id`,`course_id`),
  KEY `certificates_generatedcertific_verify_uuid_1b5a14bb83c471ff_uniq` (`verify_uuid`),
  CONSTRAINT `certificates_generatedc_user_id_77ed5f7a53121815_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `commerce_commerceconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_commerceconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `checkout_on_ecommerce_service` tinyint(1) NOT NULL,
  `single_course_checkout_page` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `receipt_page` varchar(255) NOT NULL,
  `enable_automatic_refund_approval` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_commerce_changed_by_id_7441951d1c97c1d7_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `commerce_commerce_changed_by_id_7441951d1c97c1d7_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_commerceconfiguration`
--

LOCK TABLES `commerce_commerceconfiguration` WRITE;
/*!40000 ALTER TABLE `commerce_commerceconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `commerce_commerceconfiguration` ENABLE KEYS */;
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
  KEY `contentserver_cdn_changed_by_id_36fe2b67b2c7f0ba_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `contentserver_cdn_changed_by_id_36fe2b67b2c7f0ba_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `contentserver_cou_changed_by_id_3b5e5ff6c6df495d_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `contentserver_cou_changed_by_id_3b5e5ff6c6df495d_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `contentstore_pushnotificationconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_pushnotificationconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_push_changed_by_id_72c47af098f7f8b1_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `contentstore_push_changed_by_id_72c47af098f7f8b1_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_pushnotificationconfig`
--

LOCK TABLES `contentstore_pushnotificationconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_pushnotificationconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_pushnotificationconfig` ENABLE KEYS */;
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
  KEY `contentstore_vide_changed_by_id_17a489d0a46d9a4b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `contentstore_vide_changed_by_id_17a489d0a46d9a4b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `cors_csrf_xdomain_changed_by_id_31e52cd1bcef52c4_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `cors_csrf_xdomain_changed_by_id_31e52cd1bcef52c4_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `corsheaders_corsmodel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
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
  UNIQUE KEY `course_action_state_coursereruns_course_key_cf5da77ed3032d6_uniq` (`course_key`,`action`),
  KEY `course_action_s_created_user_id_7f53088ef8dccd0b_fk_auth_user_id` (`created_user_id`),
  KEY `course_action_s_updated_user_id_4fab18012332c9a4_fk_auth_user_id` (`updated_user_id`),
  KEY `course_action_state_coursererunstate_c8235886` (`course_key`),
  KEY `course_action_state_coursererunstate_418c5509` (`action`),
  KEY `course_action_state_coursererunstate_a9bd7343` (`source_course_key`),
  CONSTRAINT `course_action_s_created_user_id_7f53088ef8dccd0b_fk_auth_user_id` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_action_s_updated_user_id_4fab18012332c9a4_fk_auth_user_id` FOREIGN KEY (`updated_user_id`) REFERENCES `auth_user` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `course_creators_coursec_user_id_46ea06ad28f0be3b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `course_groups_cohortmembership_user_id_395bddd0389ed7da_uniq` (`user_id`,`course_id`),
  KEY `course_groups_cohortmembership_6e438ee3` (`course_user_group_id`),
  KEY `course_groups_cohortmembership_e8701ad4` (`user_id`),
  CONSTRAINT `D004e77c965054d46217a8bd48bcaec8` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `course_groups_cohortmem_user_id_15d408bf736398bf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `D339c347a8fab561c2e92ea09f250df8` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
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
  UNIQUE KEY `course_groups_courseusergroup_name_63f7511804c52f38_uniq` (`name`,`course_id`),
  KEY `course_groups_courseusergroup_ea134da7` (`course_id`)
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
  UNIQUE KEY `courseusergroup_id` (`courseusergroup_id`,`user_id`),
  KEY `course_groups_courseuse_user_id_7b26cdeaeb621a93_fk_auth_user_id` (`user_id`),
  CONSTRAINT `course_groups_courseuse_user_id_7b26cdeaeb621a93_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `db746f642b1b8232920506afe242fe6b` FOREIGN KEY (`courseusergroup_id`) REFERENCES `course_groups_courseusergroup` (`id`)
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
  CONSTRAINT `D1516b3811dd6dd500bfae054d6fdc92` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
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
  UNIQUE KEY `course_groups_unregisteredlearne_course_id_4daf84ead2de12db_uniq` (`course_id`,`email`),
  KEY `D300117695bf1837ce09d8f95c6dc2da` (`course_user_group_id`),
  KEY `course_groups_unregisteredlearnercohortassignments_0c83f57c` (`email`),
  CONSTRAINT `D300117695bf1837ce09d8f95c6dc2da` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_modes_coursemode_course_id_6fbb1796ace558b4_uniq` (`course_id`,`mode_slug`,`currency`),
  KEY `course_modes_coursemode_ea134da7` (`course_id`)
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
  KEY `course_modes_cour_changed_by_id_4d31fab2bbe98b89_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `course_modes_cour_changed_by_id_4d31fab2bbe98b89_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `course_modes_coursemodesarchive_ea134da7` (`course_id`)
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
  `announcement` datetime(6),
  `catalog_visibility` longtext,
  `course_video_url` longtext,
  `effort` longtext,
  `short_description` longtext,
  `org` longtext NOT NULL,
  `self_paced` tinyint(1) NOT NULL,
  `marketing_url` longtext,
  `eligible_for_financial_aid` tinyint(1) NOT NULL,
  `language` longtext,
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
  KEY `course_overviews__changed_by_id_54b19ba1c134af6a_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `course_overviews__changed_by_id_54b19ba1c134af6a_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `D47baf904f8952eb0e1fafefd558a718` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `D298658de1d4c8777e046eed658fc94e` (`course_overview_id`),
  CONSTRAINT `D298658de1d4c8777e046eed658fc94e` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
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
-- Table structure for table `course_structures_coursestructure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_structures_coursestructure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `structure_json` longtext,
  `discussion_id_map_json` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_structures_coursestructure`
--

LOCK TABLES `course_structures_coursestructure` WRITE;
/*!40000 ALTER TABLE `course_structures_coursestructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_structures_coursestructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetalk_coursetalkwidgetconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetalk_coursetalkwidgetconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `platform_key` varchar(50) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coursetalk_course_changed_by_id_18bd24020c1b37d5_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `coursetalk_course_changed_by_id_18bd24020c1b37d5_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetalk_coursetalkwidgetconfiguration`
--

LOCK TABLES `coursetalk_coursetalkwidgetconfiguration` WRITE;
/*!40000 ALTER TABLE `coursetalk_coursetalkwidgetconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursetalk_coursetalkwidgetconfiguration` ENABLE KEYS */;
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
  UNIQUE KEY `courseware_offlinecomputedgrade_user_id_46133bbd0926078f_uniq` (`user_id`,`course_id`),
  KEY `courseware_offlinecomputedgrade_ea134da7` (`course_id`),
  KEY `courseware_offlinecomputedgrade_e2fa5388` (`created`),
  KEY `courseware_offlinecomputedgrade_0f81d52e` (`updated`),
  CONSTRAINT `courseware_offlinecompu_user_id_66bbccbf945dfd56_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `courseware_offlinecomputedgradelog_ea134da7` (`course_id`),
  KEY `courseware_offlinecomputedgradelog_e2fa5388` (`created`)
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
  UNIQUE KEY `courseware_studentfieldoverride_course_id_39dd7eaeac5623d2_uniq` (`course_id`,`field`,`location`,`student_id`),
  KEY `courseware_studentfi_student_id_70e7c0f5a4f91b65_fk_auth_user_id` (`student_id`),
  KEY `courseware_studentfieldoverride_ea134da7` (`course_id`),
  KEY `courseware_studentfieldoverride_d5189de0` (`location`),
  CONSTRAINT `courseware_studentfi_student_id_70e7c0f5a4f91b65_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  UNIQUE KEY `courseware_studentmodule_student_id_635d77aea1256de5_uniq` (`student_id`,`module_id`,`course_id`),
  KEY `courseware_studentmodule_82bd5515` (`module_type`),
  KEY `courseware_studentmodule_c9799665` (`module_id`),
  KEY `courseware_studentmodule_ea134da7` (`course_id`),
  KEY `courseware_studentmodule_de6a20aa` (`grade`),
  KEY `courseware_studentmodule_6b2ded51` (`done`),
  KEY `courseware_studentmodule_e2fa5388` (`created`),
  KEY `courseware_studentmodule_9ae73c65` (`modified`),
  CONSTRAINT `courseware_studentmo_student_id_57005a9a97046500_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  KEY `D45b867f7277556beb93bff02eba5f03` (`student_module_id`),
  KEY `courseware_studentmodulehistory_2af72f10` (`version`),
  KEY `courseware_studentmodulehistory_e2fa5388` (`created`),
  CONSTRAINT `D45b867f7277556beb93bff02eba5f03` FOREIGN KEY (`student_module_id`) REFERENCES `courseware_studentmodule` (`id`)
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
  UNIQUE KEY `courseware_xmodulestudentinfofi_student_id_33f2f772c49db067_uniq` (`student_id`,`field_name`),
  KEY `courseware_xmodulestudentinfofield_73f329f1` (`field_name`),
  KEY `courseware_xmodulestudentinfofield_e2fa5388` (`created`),
  KEY `courseware_xmodulestudentinfofield_9ae73c65` (`modified`),
  CONSTRAINT `courseware_xmodulestu_student_id_fb4c5883b541e28_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `courseware_xmodulestudentprefsf_student_id_2a5d275498b7a407_uniq` (`student_id`,`module_type`,`field_name`),
  KEY `courseware_xmodulestudentprefsfield_73f329f1` (`field_name`),
  KEY `courseware_xmodulestudentprefsfield_e2fa5388` (`created`),
  KEY `courseware_xmodulestudentprefsfield_9ae73c65` (`modified`),
  KEY `courseware_xmodulestudentprefsfield_82bd5515` (`module_type`),
  CONSTRAINT `courseware_xmodulest_student_id_48b35c14cbc17185_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `courseware_xmoduleuserstatesummar_usage_id_5cc7ed48d6e2e021_uniq` (`usage_id`,`field_name`),
  KEY `courseware_xmoduleuserstatesummaryfield_73f329f1` (`field_name`),
  KEY `courseware_xmoduleuserstatesummaryfield_e2fa5388` (`created`),
  KEY `courseware_xmoduleuserstatesummaryfield_9ae73c65` (`modified`),
  KEY `courseware_xmoduleuserstatesummaryfield_0528eb2a` (`usage_id`)
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
  KEY `crawlers_crawlers_changed_by_id_7014349920284aa4_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `crawlers_crawlers_changed_by_id_7014349920284aa4_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `credentials_crede_changed_by_id_273a2e6b0649c861_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `credentials_crede_changed_by_id_273a2e6b0649c861_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `credit_creditconf_changed_by_id_6270a800475f6694_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `credit_creditconf_changed_by_id_6270a800475f6694_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `credit_crediteligibility_username_936cb16677e83e_uniq` (`username`,`course_id`),
  KEY `credit_cred_course_id_4218adeba258bf8b_fk_credit_creditcourse_id` (`course_id`),
  KEY `credit_crediteligibility_14c4b06b` (`username`),
  CONSTRAINT `credit_cred_course_id_4218adeba258bf8b_fk_credit_creditcourse_id` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
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
  UNIQUE KEY `credit_creditrequest_username_4f61c10bb0d67c01_uniq` (`username`,`course_id`,`provider_id`),
  KEY `credit_cred_course_id_578c5f1124002bab_fk_credit_creditcourse_id` (`course_id`),
  KEY `credit_c_provider_id_f2973cc3e38a483_fk_credit_creditprovider_id` (`provider_id`),
  KEY `credit_creditrequest_14c4b06b` (`username`),
  CONSTRAINT `credit_c_provider_id_f2973cc3e38a483_fk_credit_creditprovider_id` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`),
  CONSTRAINT `credit_cred_course_id_578c5f1124002bab_fk_credit_creditcourse_id` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
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
  `order` int(10) unsigned NOT NULL,
  `criteria` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirement_namespace_33039c83b3e69b8_uniq` (`namespace`,`name`,`course_id`),
  KEY `credit_cred_course_id_1c8fb9ebd295ae19_fk_credit_creditcourse_id` (`course_id`),
  CONSTRAINT `credit_cred_course_id_1c8fb9ebd295ae19_fk_credit_creditcourse_id` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
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
  UNIQUE KEY `credit_creditrequirementstatus_username_67dcb69ebf779e3b_uniq` (`username`,`requirement_id`),
  KEY `c_requirement_id_3896aa6db214f84a_fk_credit_creditrequirement_id` (`requirement_id`),
  KEY `credit_creditrequirementstatus_14c4b06b` (`username`),
  CONSTRAINT `c_requirement_id_3896aa6db214f84a_fk_credit_creditrequirement_id` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`)
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
-- Table structure for table `credit_historicalcreditrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_historicalcreditrequest` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `parameters` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `credit_historic_history_user_id_52a9922f26a69e7e_fk_auth_user_id` (`history_user_id`),
  KEY `credit_historicalcreditrequest_b80bb774` (`id`),
  KEY `credit_historicalcreditrequest_ef7c876f` (`uuid`),
  KEY `credit_historicalcreditrequest_14c4b06b` (`username`),
  CONSTRAINT `credit_historic_history_user_id_52a9922f26a69e7e_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_historicalcreditrequest`
--

LOCK TABLES `credit_historicalcreditrequest` WRITE;
/*!40000 ALTER TABLE `credit_historicalcreditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_historicalcreditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_historicalcreditrequirementstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_historicalcreditrequirementstatus` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `reason` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `requirement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `credit_historic_history_user_id_72b045b9192495cc_fk_auth_user_id` (`history_user_id`),
  KEY `credit_historicalcreditrequirementstatus_b80bb774` (`id`),
  KEY `credit_historicalcreditrequirementstatus_14c4b06b` (`username`),
  CONSTRAINT `credit_historic_history_user_id_72b045b9192495cc_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_historicalcreditrequirementstatus`
--

LOCK TABLES `credit_historicalcreditrequirementstatus` WRITE;
/*!40000 ALTER TABLE `credit_historicalcreditrequirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_historicalcreditrequirementstatus` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `dark_lang_darklan_changed_by_id_7e1defb1121d58b8_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `dark_lang_darklan_changed_by_id_7e1defb1121d58b8_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dark_lang_darklangconfig`
--

LOCK TABLES `dark_lang_darklangconfig` WRITE;
/*!40000 ALTER TABLE `dark_lang_darklangconfig` DISABLE KEYS */;
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2017-06-20 20:11:27.878265',1,'',NULL);
/*!40000 ALTER TABLE `dark_lang_darklangconfig` ENABLE KEYS */;
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
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `permission_id` (`permission_id`,`role_id`),
  KEY `django_role_id_558412c96ef7ba87_fk_django_comment_client_role_id` (`role_id`),
  CONSTRAINT `D4e9a4067c1db9041491363f5e032121` FOREIGN KEY (`permission_id`) REFERENCES `django_comment_client_permission` (`name`),
  CONSTRAINT `django_role_id_558412c96ef7ba87_fk_django_comment_client_role_id` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`)
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
  KEY `django_comment_client_role_ea134da7` (`course_id`)
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
  UNIQUE KEY `role_id` (`role_id`,`user_id`),
  KEY `django_comment_client_r_user_id_139843e7dcf77368_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_comment_client_r_user_id_139843e7dcf77368_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_role_id_75cf4005dc1fb11d_fk_django_comment_client_role_id` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`)
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
  KEY `django_comment_co_changed_by_id_18a7f46ff6309996_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `django_comment_co_changed_by_id_18a7f46ff6309996_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_forumsconfig`
--

LOCK TABLES `django_comment_common_forumsconfig` WRITE;
/*!40000 ALTER TABLE `django_comment_common_forumsconfig` DISABLE KEYS */;
INSERT INTO `django_comment_common_forumsconfig` VALUES (1,'2017-06-20 20:11:28.996079',1,5,NULL);
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
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (140,'admin','logentry'),(243,'api_admin','apiaccessconfig'),(1,'api_admin','apiaccessrequest'),(244,'api_admin','catalog'),(242,'api_admin','historicalapiaccessrequest'),(279,'assessment','aiclassifier'),(278,'assessment','aiclassifierset'),(281,'assessment','aigradingworkflow'),(280,'assessment','aitrainingworkflow'),(269,'assessment','assessment'),(272,'assessment','assessmentfeedback'),(271,'assessment','assessmentfeedbackoption'),(270,'assessment','assessmentpart'),(267,'assessment','criterion'),(268,'assessment','criterionoption'),(273,'assessment','peerworkflow'),(274,'assessment','peerworkflowitem'),(266,'assessment','rubric'),(282,'assessment','staffworkflow'),(276,'assessment','studenttrainingworkflow'),(277,'assessment','studenttrainingworkflowitem'),(275,'assessment','trainingexample'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(249,'badges','badgeassertion'),(248,'badges','badgeclass'),(250,'badges','coursecompleteimageconfiguration'),(251,'badges','courseeventbadgesconfiguration'),(210,'block_structure','blockstructureconfiguration'),(211,'block_structure','blockstructuremodel'),(229,'bookmarks','bookmark'),(230,'bookmarks','xblockcache'),(91,'branding','brandingapiconfig'),(90,'branding','brandinginfoconfig'),(89,'bulk_email','bulkemailflag'),(83,'bulk_email','cohorttarget'),(88,'bulk_email','courseauthorization'),(85,'bulk_email','courseemail'),(87,'bulk_email','courseemailtemplate'),(84,'bulk_email','coursemodetarget'),(86,'bulk_email','optout'),(82,'bulk_email','target'),(232,'catalog','catalogintegration'),(254,'celery_utils','chorddata'),(253,'celery_utils','failedtask'),(70,'certificates','certificategenerationconfiguration'),(69,'certificates','certificategenerationcoursesetting'),(65,'certificates','certificategenerationhistory'),(71,'certificates','certificatehtmlviewconfiguration'),(66,'certificates','certificateinvalidation'),(72,'certificates','certificatetemplate'),(73,'certificates','certificatetemplateasset'),(63,'certificates','certificatewhitelist'),(68,'certificates','examplecertificate'),(67,'certificates','examplecertificateset'),(64,'certificates','generatedcertificate'),(214,'commerce','commerceconfiguration'),(25,'contentserver','cdnuseragentsconfig'),(24,'contentserver','courseassetcachettlconfig'),(326,'contentstore','pushnotificationconfig'),(325,'contentstore','videouploadconfig'),(5,'contenttypes','contenttype'),(212,'corsheaders','corsmodel'),(213,'cors_csrf','xdomainproxyconfiguration'),(241,'coursetalk','coursetalkwidgetconfiguration'),(34,'courseware','offlinecomputedgrade'),(35,'courseware','offlinecomputedgradelog'),(36,'courseware','studentfieldoverride'),(29,'courseware','studentmodule'),(30,'courseware','studentmodulehistory'),(33,'courseware','xmodulestudentinfofield'),(32,'courseware','xmodulestudentprefsfield'),(31,'courseware','xmoduleuserstatesummaryfield'),(324,'coursewarehistoryextended','studentmodulehistoryextended'),(194,'course_action_state','coursererunstate'),(327,'course_creators','coursecreator'),(77,'course_groups','cohortmembership'),(80,'course_groups','coursecohort'),(79,'course_groups','coursecohortssettings'),(76,'course_groups','courseusergroup'),(78,'course_groups','courseusergrouppartitiongroup'),(81,'course_groups','unregisteredlearnercohortassignments'),(168,'course_modes','coursemode'),(170,'course_modes','coursemodeexpirationconfig'),(169,'course_modes','coursemodesarchive'),(205,'course_overviews','courseoverview'),(208,'course_overviews','courseoverviewimageconfig'),(207,'course_overviews','courseoverviewimageset'),(206,'course_overviews','courseoverviewtab'),(209,'course_structures','coursestructure'),(255,'crawlers','crawlersconfig'),(235,'credentials','credentialsapiconfig'),(223,'credit','creditconfig'),(216,'credit','creditcourse'),(220,'credit','crediteligibility'),(215,'credit','creditprovider'),(222,'credit','creditrequest'),(217,'credit','creditrequirement'),(219,'credit','creditrequirementstatus'),(221,'credit','historicalcreditrequest'),(218,'credit','historicalcreditrequirementstatus'),(179,'dark_lang','darklangconfig'),(144,'django_comment_common','coursediscussionsettings'),(143,'django_comment_common','forumsconfig'),(142,'django_comment_common','permission'),(141,'django_comment_common','role'),(139,'django_notify','notification'),(136,'django_notify','notificationtype'),(137,'django_notify','settings'),(138,'django_notify','subscription'),(100,'django_openid_auth','association'),(99,'django_openid_auth','nonce'),(101,'django_openid_auth','useropenid'),(12,'djcelery','crontabschedule'),(11,'djcelery','intervalschedule'),(14,'djcelery','periodictask'),(13,'djcelery','periodictasks'),(9,'djcelery','taskmeta'),(10,'djcelery','tasksetmeta'),(16,'djcelery','taskstate'),(15,'djcelery','workerstate'),(288,'edxval','coursevideo'),(289,'edxval','encodedvideo'),(286,'edxval','profile'),(290,'edxval','subtitle'),(287,'edxval','video'),(106,'edx_oauth2_provider','trustedclient'),(291,'edx_proctoring','proctoredexam'),(292,'edx_proctoring','proctoredexamreviewpolicy'),(293,'edx_proctoring','proctoredexamreviewpolicyhistory'),(300,'edx_proctoring','proctoredexamsoftwaresecurecomment'),(298,'edx_proctoring','proctoredexamsoftwaresecurereview'),(299,'edx_proctoring','proctoredexamsoftwaresecurereviewhistory'),(296,'edx_proctoring','proctoredexamstudentallowance'),(297,'edx_proctoring','proctoredexamstudentallowancehistory'),(294,'edx_proctoring','proctoredexamstudentattempt'),(295,'edx_proctoring','proctoredexamstudentattempthistory'),(252,'email_marketing','emailmarketingconfiguration'),(190,'embargo','country'),(191,'embargo','countryaccessrule'),(192,'embargo','courseaccessrulehistory'),(187,'embargo','embargoedcourse'),(188,'embargo','embargoedstate'),(193,'embargo','ipfilter'),(189,'embargo','restrictedcourse'),(317,'enterprise','enrollmentnotificationemailtemplate'),(315,'enterprise','enterprisecourseenrollment'),(304,'enterprise','enterprisecustomer'),(308,'enterprise','enterprisecustomerbrandingconfiguration'),(313,'enterprise','enterprisecustomerentitlement'),(309,'enterprise','enterprisecustomeridentityprovider'),(305,'enterprise','enterprisecustomeruser'),(316,'enterprise','historicalenrollmentnotificationemailtemplate'),(314,'enterprise','historicalenterprisecourseenrollment'),(303,'enterprise','historicalenterprisecustomer'),(312,'enterprise','historicalenterprisecustomerentitlement'),(310,'enterprise','historicaluserdatasharingconsentaudit'),(307,'enterprise','pendingenrollment'),(306,'enterprise','pendingenterprisecustomeruser'),(311,'enterprise','userdatasharingconsentaudit'),(257,'experiments','experimentdata'),(98,'external_auth','externalauthmap'),(94,'grades','computegradessetting'),(93,'grades','coursepersistentgradesflag'),(97,'grades','persistentcoursegrade'),(92,'grades','persistentgradesenabledflag'),(96,'grades','persistentsubsectiongrade'),(95,'grades','visibleblocks'),(75,'instructor_task','gradereportsetting'),(74,'instructor_task','instructortask'),(318,'integrated_channel','enterpriseintegratedchannel'),(204,'lms_xblock','xblockasidesconfig'),(258,'mentoring','answer'),(182,'microsite_configuration','historicalmicrositeorganizationmapping'),(184,'microsite_configuration','historicalmicrositetemplate'),(180,'microsite_configuration','microsite'),(181,'microsite_configuration','micrositehistory'),(183,'microsite_configuration','micrositeorganizationmapping'),(185,'microsite_configuration','micrositetemplate'),(239,'milestones','coursecontentmilestone'),(238,'milestones','coursemilestone'),(236,'milestones','milestone'),(237,'milestones','milestonerelationshiptype'),(240,'milestones','usermilestone'),(196,'mobile_api','appversionconfig'),(197,'mobile_api','ignoremobileavailableflagconfig'),(195,'mobile_api','mobileapiconfig'),(145,'notes','note'),(104,'oauth2','accesstoken'),(102,'oauth2','client'),(103,'oauth2','grant'),(105,'oauth2','refreshtoken'),(109,'oauth2_provider','accesstoken'),(107,'oauth2_provider','application'),(108,'oauth2_provider','grant'),(110,'oauth2_provider','refreshtoken'),(111,'oauth_dispatch','restrictedapplication'),(120,'oauth_provider','consumer'),(118,'oauth_provider','nonce'),(122,'oauth_provider','resource'),(119,'oauth_provider','scope'),(121,'oauth_provider','token'),(301,'organizations','organization'),(302,'organizations','organizationcourse'),(259,'problem_builder','answer'),(260,'problem_builder','share'),(231,'programs','programsapiconfig'),(6,'redirects','redirect'),(186,'rss_proxy','whitelistedrssurl'),(323,'sap_success_factors','catalogtransmissionaudit'),(320,'sap_success_factors','historicalsapsuccessfactorsenterprisecustomerconfiguration'),(322,'sap_success_factors','learnerdatatransmissionaudit'),(321,'sap_success_factors','sapsuccessfactorsenterprisecustomerconfiguration'),(319,'sap_success_factors','sapsuccessfactorsglobalconfiguration'),(233,'self_paced','selfpacedconfiguration'),(7,'sessions','session'),(165,'shoppingcart','certificateitem'),(159,'shoppingcart','coupon'),(160,'shoppingcart','couponredemption'),(162,'shoppingcart','courseregcodeitem'),(163,'shoppingcart','courseregcodeitemannotation'),(157,'shoppingcart','courseregistrationcode'),(155,'shoppingcart','courseregistrationcodeinvoiceitem'),(167,'shoppingcart','donation'),(166,'shoppingcart','donationconfiguration'),(152,'shoppingcart','invoice'),(156,'shoppingcart','invoicehistory'),(154,'shoppingcart','invoiceitem'),(153,'shoppingcart','invoicetransaction'),(150,'shoppingcart','order'),(151,'shoppingcart','orderitem'),(161,'shoppingcart','paidcourseregistration'),(164,'shoppingcart','paidcourseregistrationannotation'),(158,'shoppingcart','registrationcoderedemption'),(8,'sites','site'),(27,'site_configuration','siteconfiguration'),(28,'site_configuration','siteconfigurationhistory'),(200,'social_auth','association'),(201,'social_auth','code'),(199,'social_auth','nonce'),(198,'social_auth','usersocialauth'),(146,'splash','splashconfig'),(22,'static_replace','assetbaseurlconfig'),(23,'static_replace','assetexcludedextensionsconfig'),(21,'status','coursemessage'),(20,'status','globalstatusmessage'),(37,'student','anonymoususerid'),(51,'student','courseaccessrole'),(48,'student','courseenrollment'),(50,'student','courseenrollmentallowed'),(56,'student','courseenrollmentattribute'),(52,'student','dashboardconfiguration'),(57,'student','enrollmentrefundconfiguration'),(54,'student','entranceexamconfiguration'),(47,'student','historicalcourseenrollment'),(55,'student','languageproficiency'),(53,'student','linkedinaddtoprofileconfiguration'),(46,'student','loginfailures'),(60,'student','logoutviewconfiguration'),(49,'student','manualenrollmentaudit'),(45,'student','passwordhistory'),(44,'student','pendingemailchange'),(43,'student','pendingnamechange'),(42,'student','registration'),(58,'student','registrationcookieconfiguration'),(59,'student','userattribute'),(39,'student','userprofile'),(40,'student','usersignupsource'),(38,'student','userstanding'),(41,'student','usertestgroup'),(263,'submissions','score'),(265,'submissions','scoreannotation'),(264,'submissions','scoresummary'),(261,'submissions','studentitem'),(262,'submissions','submission'),(203,'survey','surveyanswer'),(202,'survey','surveyform'),(331,'tagging','tagavailablevalues'),(330,'tagging','tagcategories'),(224,'teams','courseteam'),(225,'teams','courseteammembership'),(26,'theming','sitetheme'),(116,'third_party_auth','ltiproviderconfig'),(112,'third_party_auth','oauth2providerconfig'),(117,'third_party_auth','providerapipermissions'),(114,'third_party_auth','samlconfiguration'),(113,'third_party_auth','samlproviderconfig'),(115,'third_party_auth','samlproviderdata'),(234,'thumbnail','kvstore'),(61,'track','trackinglog'),(148,'user_api','usercoursetag'),(149,'user_api','userorgtag'),(147,'user_api','userpreference'),(333,'user_tasks','usertaskartifact'),(332,'user_tasks','usertaskstatus'),(62,'util','ratelimitconfiguration'),(245,'verified_track_content','verifiedtrackcohortedcourse'),(172,'verify_student','historicalverificationdeadline'),(177,'verify_student','icrvstatusemailsconfiguration'),(176,'verify_student','incoursereverificationconfiguration'),(178,'verify_student','skippedreverification'),(171,'verify_student','softwaresecurephotoverification'),(174,'verify_student','verificationcheckpoint'),(173,'verify_student','verificationdeadline'),(175,'verify_student','verificationstatus'),(247,'video_config','coursehlsplaybackenabledflag'),(246,'video_config','hlsplaybackenabledflag'),(17,'waffle','flag'),(19,'waffle','sample'),(18,'waffle','switch'),(256,'waffle_utils','waffleflagcourseoverridemodel'),(123,'wiki','article'),(124,'wiki','articleforobject'),(127,'wiki','articleplugin'),(125,'wiki','articlerevision'),(134,'wiki','attachment'),(135,'wiki','attachmentrevision'),(132,'wiki','image'),(133,'wiki','imagerevision'),(128,'wiki','reusableplugin'),(130,'wiki','revisionplugin'),(131,'wiki','revisionpluginrevision'),(129,'wiki','simpleplugin'),(126,'wiki','urlpath'),(283,'workflow','assessmentworkflow'),(285,'workflow','assessmentworkflowcancellation'),(284,'workflow','assessmentworkflowstep'),(329,'xblock_config','courseeditltifieldsenabledflag'),(328,'xblock_config','studioconfig'),(226,'xblock_django','xblockconfiguration'),(228,'xblock_django','xblockstudioconfiguration'),(227,'xblock_django','xblockstudioconfigurationflag');
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
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-20 20:10:53.063643'),(2,'auth','0001_initial','2017-06-20 20:10:54.044624'),(3,'admin','0001_initial','2017-06-20 20:10:54.201302'),(4,'sites','0001_initial','2017-06-20 20:10:54.241452'),(5,'contenttypes','0002_remove_content_type_name','2017-06-20 20:10:54.569275'),(6,'api_admin','0001_initial','2017-06-20 20:10:54.817929'),(7,'api_admin','0002_auto_20160325_1604','2017-06-20 20:10:54.853729'),(8,'api_admin','0003_auto_20160404_1618','2017-06-20 20:10:55.457330'),(9,'api_admin','0004_auto_20160412_1506','2017-06-20 20:10:56.001267'),(10,'api_admin','0005_auto_20160414_1232','2017-06-20 20:10:56.129260'),(11,'api_admin','0006_catalog','2017-06-20 20:10:56.149455'),(12,'assessment','0001_initial','2017-06-20 20:10:59.800701'),(13,'assessment','0002_staffworkflow','2017-06-20 20:10:59.897849'),(14,'assessment','0003_expand_course_id','2017-06-20 20:11:01.124918'),(15,'auth','0002_alter_permission_name_max_length','2017-06-20 20:11:01.262858'),(16,'auth','0003_alter_user_email_max_length','2017-06-20 20:11:01.386421'),(17,'auth','0004_alter_user_username_opts','2017-06-20 20:11:01.495542'),(18,'auth','0005_alter_user_last_login_null','2017-06-20 20:11:01.619206'),(19,'auth','0006_require_contenttypes_0002','2017-06-20 20:11:01.622272'),(20,'instructor_task','0001_initial','2017-06-20 20:11:01.804868'),(21,'certificates','0001_initial','2017-06-20 20:11:03.303775'),(22,'certificates','0002_data__certificatehtmlviewconfiguration_data','2017-06-20 20:11:03.332445'),(23,'certificates','0003_data__default_modes','2017-06-20 20:11:03.393620'),(24,'certificates','0004_certificategenerationhistory','2017-06-20 20:11:03.642929'),(25,'certificates','0005_auto_20151208_0801','2017-06-20 20:11:03.880090'),(26,'certificates','0006_certificatetemplateasset_asset_slug','2017-06-20 20:11:03.926025'),(27,'certificates','0007_certificateinvalidation','2017-06-20 20:11:04.162413'),(28,'badges','0001_initial','2017-06-20 20:11:04.565554'),(29,'badges','0002_data__migrate_assertions','2017-06-20 20:11:04.592901'),(30,'badges','0003_schema__add_event_configuration','2017-06-20 20:11:04.988629'),(31,'block_structure','0001_config','2017-06-20 20:11:05.187011'),(32,'block_structure','0002_blockstructuremodel','2017-06-20 20:11:05.220342'),(33,'block_structure','0003_blockstructuremodel_storage','2017-06-20 20:11:05.243325'),(34,'block_structure','0004_blockstructuremodel_usagekeywithrun','2017-06-20 20:11:05.265568'),(35,'bookmarks','0001_initial','2017-06-20 20:11:06.076386'),(36,'branding','0001_initial','2017-06-20 20:11:06.557659'),(37,'course_modes','0001_initial','2017-06-20 20:11:06.652828'),(38,'course_modes','0002_coursemode_expiration_datetime_is_explicit','2017-06-20 20:11:06.682194'),(39,'course_modes','0003_auto_20151113_1443','2017-06-20 20:11:06.709881'),(40,'course_modes','0004_auto_20151113_1457','2017-06-20 20:11:06.967120'),(41,'course_modes','0005_auto_20151217_0958','2017-06-20 20:11:07.003846'),(42,'course_modes','0006_auto_20160208_1407','2017-06-20 20:11:07.242519'),(43,'course_modes','0007_coursemode_bulk_sku','2017-06-20 20:11:07.291981'),(44,'course_groups','0001_initial','2017-06-20 20:11:09.452097'),(45,'bulk_email','0001_initial','2017-06-20 20:11:14.664301'),(46,'bulk_email','0002_data__load_course_email_template','2017-06-20 20:11:14.781858'),(47,'bulk_email','0003_config_model_feature_flag','2017-06-20 20:11:14.912424'),(48,'bulk_email','0004_add_email_targets','2017-06-20 20:11:15.320919'),(49,'bulk_email','0005_move_target_data','2017-06-20 20:11:15.338054'),(50,'bulk_email','0006_course_mode_targets','2017-06-20 20:11:15.635866'),(51,'catalog','0001_initial','2017-06-20 20:11:15.820778'),(52,'catalog','0002_catalogintegration_username','2017-06-20 20:11:16.000596'),(53,'catalog','0003_catalogintegration_page_size','2017-06-20 20:11:16.181012'),(54,'djcelery','0001_initial','2017-06-20 20:11:16.591916'),(55,'celery_utils','0001_initial','2017-06-20 20:11:16.656139'),(56,'celery_utils','0002_chordable_django_backend','2017-06-20 20:11:16.730786'),(57,'certificates','0008_schema__remove_badges','2017-06-20 20:11:17.039340'),(58,'commerce','0001_data__add_ecommerce_service_user','2017-06-20 20:11:17.068740'),(59,'commerce','0002_commerceconfiguration','2017-06-20 20:11:17.206611'),(60,'commerce','0003_auto_20160329_0709','2017-06-20 20:11:17.332962'),(61,'commerce','0004_auto_20160531_0950','2017-06-20 20:11:17.598247'),(62,'commerce','0005_commerceconfiguration_enable_automatic_refund_approval','2017-06-20 20:11:17.779695'),(63,'commerce','0006_auto_20170424_1734','2017-06-20 20:11:17.929374'),(64,'contentserver','0001_initial','2017-06-20 20:11:18.104576'),(65,'contentserver','0002_cdnuseragentsconfig','2017-06-20 20:11:18.283648'),(66,'cors_csrf','0001_initial','2017-06-20 20:11:18.466961'),(67,'course_action_state','0001_initial','2017-06-20 20:11:18.829223'),(68,'course_groups','0002_change_inline_default_cohort_value','2017-06-20 20:11:18.853354'),(69,'course_groups','0003_auto_20170609_1455','2017-06-20 20:11:19.160571'),(70,'course_overviews','0001_initial','2017-06-20 20:11:19.239229'),(71,'course_overviews','0002_add_course_catalog_fields','2017-06-20 20:11:19.403858'),(72,'course_overviews','0003_courseoverviewgeneratedhistory','2017-06-20 20:11:19.434236'),(73,'course_overviews','0004_courseoverview_org','2017-06-20 20:11:19.469060'),(74,'course_overviews','0005_delete_courseoverviewgeneratedhistory','2017-06-20 20:11:19.490388'),(75,'course_overviews','0006_courseoverviewimageset','2017-06-20 20:11:19.546477'),(76,'course_overviews','0007_courseoverviewimageconfig','2017-06-20 20:11:19.848093'),(77,'course_overviews','0008_remove_courseoverview_facebook_url','2017-06-20 20:11:19.853407'),(78,'course_overviews','0009_readd_facebook_url','2017-06-20 20:11:19.859064'),(79,'course_overviews','0010_auto_20160329_2317','2017-06-20 20:11:19.941509'),(80,'course_overviews','0011_courseoverview_marketing_url','2017-06-20 20:11:20.035868'),(81,'course_overviews','0012_courseoverview_eligible_for_financial_aid','2017-06-20 20:11:20.081058'),(82,'course_overviews','0013_courseoverview_language','2017-06-20 20:11:20.122876'),(83,'course_structures','0001_initial','2017-06-20 20:11:20.153732'),(84,'coursetalk','0001_initial','2017-06-20 20:11:20.356131'),(85,'coursetalk','0002_auto_20160325_0631','2017-06-20 20:11:20.539538'),(86,'courseware','0001_initial','2017-06-20 20:11:23.082596'),(87,'coursewarehistoryextended','0001_initial','2017-06-20 20:11:23.280144'),(88,'coursewarehistoryextended','0002_force_studentmodule_index','2017-06-20 20:11:23.459987'),(89,'crawlers','0001_initial','2017-06-20 20:11:23.689073'),(90,'crawlers','0002_auto_20170419_0018','2017-06-20 20:11:23.989595'),(91,'credentials','0001_initial','2017-06-20 20:11:24.236126'),(92,'credentials','0002_auto_20160325_0631','2017-06-20 20:11:24.461106'),(93,'credentials','0003_auto_20170525_1109','2017-06-20 20:11:24.941793'),(94,'credit','0001_initial','2017-06-20 20:11:27.073074'),(95,'credit','0002_creditconfig','2017-06-20 20:11:27.338516'),(96,'credit','0003_auto_20160511_2227','2017-06-20 20:11:27.581164'),(97,'dark_lang','0001_initial','2017-06-20 20:11:27.852870'),(98,'dark_lang','0002_data__enable_on_install','2017-06-20 20:11:27.882837'),(99,'database_fixups','0001_initial','2017-06-20 20:11:27.925047'),(100,'django_comment_common','0001_initial','2017-06-20 20:11:28.662514'),(101,'django_comment_common','0002_forumsconfig','2017-06-20 20:11:28.972192'),(102,'django_comment_common','0003_enable_forums','2017-06-20 20:11:29.003704'),(103,'django_comment_common','0004_auto_20161117_1209','2017-06-20 20:11:29.262630'),(104,'django_comment_common','0005_coursediscussionsettings','2017-06-20 20:11:29.298484'),(105,'django_notify','0001_initial','2017-06-20 20:11:30.654263'),(106,'django_openid_auth','0001_initial','2017-06-20 20:11:31.088254'),(107,'oauth2','0001_initial','2017-06-20 20:11:33.068012'),(108,'edx_oauth2_provider','0001_initial','2017-06-20 20:11:33.445964'),(109,'edx_proctoring','0001_initial','2017-06-20 20:11:41.180629'),(110,'edx_proctoring','0002_proctoredexamstudentattempt_is_status_acknowledged','2017-06-20 20:11:42.063085'),(111,'edx_proctoring','0003_auto_20160101_0525','2017-06-20 20:11:43.657879'),(112,'edx_proctoring','0004_auto_20160201_0523','2017-06-20 20:11:44.435487'),(113,'edx_proctoring','0005_proctoredexam_hide_after_due','2017-06-20 20:11:45.215180'),(114,'edxval','0001_initial','2017-06-20 20:11:50.456107'),(115,'edxval','0002_data__default_profiles','2017-06-20 20:11:50.535311'),(116,'edxval','0003_coursevideo_is_hidden','2017-06-20 20:11:50.588199'),(117,'edxval','0004_data__add_hls_profile','2017-06-20 20:11:50.623598'),(118,'email_marketing','0001_initial','2017-06-20 20:11:50.937604'),(119,'email_marketing','0002_auto_20160623_1656','2017-06-20 20:11:54.522737'),(120,'email_marketing','0003_auto_20160715_1145','2017-06-20 20:11:56.573819'),(121,'email_marketing','0004_emailmarketingconfiguration_welcome_email_send_delay','2017-06-20 20:11:56.997935'),(122,'embargo','0001_initial','2017-06-20 20:11:58.466345'),(123,'embargo','0002_data__add_countries','2017-06-20 20:11:58.862313'),(124,'enterprise','0001_initial','2017-06-20 20:11:59.478253'),(125,'enterprise','0002_enterprisecustomerbrandingconfiguration','2017-06-20 20:11:59.542635'),(126,'enterprise','0003_auto_20161104_0937','2017-06-20 20:12:01.185432'),(127,'enterprise','0004_auto_20161114_0434','2017-06-20 20:12:02.230504'),(128,'enterprise','0005_pendingenterprisecustomeruser','2017-06-20 20:12:02.782284'),(129,'enterprise','0006_auto_20161121_0241','2017-06-20 20:12:03.323291'),(130,'enterprise','0007_auto_20161109_1511','2017-06-20 20:12:04.404123'),(131,'enterprise','0008_auto_20161124_2355','2017-06-20 20:12:06.751281'),(132,'enterprise','0009_auto_20161130_1651','2017-06-20 20:12:11.619535'),(133,'enterprise','0010_auto_20161222_1212','2017-06-20 20:12:13.277373'),(134,'enterprise','0011_enterprisecustomerentitlement_historicalenterprisecustomerentitlement','2017-06-20 20:12:15.104416'),(135,'enterprise','0012_auto_20170125_1033','2017-06-20 20:12:16.969599'),(136,'enterprise','0013_auto_20170125_1157','2017-06-20 20:12:19.732270'),(137,'enterprise','0014_enrollmentnotificationemailtemplate_historicalenrollmentnotificationemailtemplate','2017-06-20 20:12:21.698319'),(138,'enterprise','0015_auto_20170130_0003','2017-06-20 20:12:24.003894'),(139,'enterprise','0016_auto_20170405_0647','2017-06-20 20:12:41.958207'),(140,'enterprise','0017_auto_20170508_1341','2017-06-20 20:12:43.844922'),(141,'enterprise','0018_auto_20170511_1357','2017-06-20 20:12:44.852303'),(142,'enterprise','0019_auto_20170606_1853','2017-06-20 20:12:45.904337'),(143,'experiments','0001_initial','2017-06-20 20:12:47.931724'),(144,'external_auth','0001_initial','2017-06-20 20:12:49.263149'),(145,'grades','0001_initial','2017-06-20 20:12:49.530307'),(146,'grades','0002_rename_last_edited_field','2017-06-20 20:12:49.606003'),(147,'grades','0003_coursepersistentgradesflag_persistentgradesenabledflag','2017-06-20 20:12:51.280522'),(148,'grades','0004_visibleblocks_course_id','2017-06-20 20:12:51.349027'),(149,'grades','0005_multiple_course_flags','2017-06-20 20:12:52.300770'),(150,'grades','0006_persistent_course_grades','2017-06-20 20:12:52.404601'),(151,'grades','0007_add_passed_timestamp_column','2017-06-20 20:12:52.507825'),(152,'grades','0008_persistentsubsectiongrade_first_attempted','2017-06-20 20:12:52.584642'),(153,'grades','0009_auto_20170111_1507','2017-06-20 20:12:52.699124'),(154,'grades','0010_auto_20170112_1156','2017-06-20 20:12:52.757524'),(155,'grades','0011_null_edited_time','2017-06-20 20:12:52.945490'),(156,'grades','0012_computegradessetting','2017-06-20 20:12:53.859870'),(157,'instructor_task','0002_gradereportsetting','2017-06-20 20:12:54.897447'),(158,'integrated_channel','0001_initial','2017-06-20 20:12:55.004449'),(159,'lms_xblock','0001_initial','2017-06-20 20:12:55.963179'),(160,'microsite_configuration','0001_initial','2017-06-20 20:13:05.635009'),(161,'microsite_configuration','0002_auto_20160202_0228','2017-06-20 20:13:07.783637'),(162,'milestones','0001_initial','2017-06-20 20:13:09.050133'),(163,'milestones','0002_data__seed_relationship_types','2017-06-20 20:13:09.099699'),(164,'milestones','0003_coursecontentmilestone_requirements','2017-06-20 20:13:09.209163'),(165,'milestones','0004_auto_20151221_1445','2017-06-20 20:13:09.603081'),(166,'mobile_api','0001_initial','2017-06-20 20:13:11.300681'),(167,'mobile_api','0002_auto_20160406_0904','2017-06-20 20:13:11.422142'),(168,'mobile_api','0003_ignore_mobile_available_flag','2017-06-20 20:13:14.349901'),(169,'notes','0001_initial','2017-06-20 20:13:15.524714'),(170,'oauth2','0002_auto_20160404_0813','2017-06-20 20:13:19.222993'),(171,'oauth2','0003_client_logout_uri','2017-06-20 20:13:24.518944'),(172,'oauth2','0004_add_index_on_grant_expires','2017-06-20 20:13:25.042967'),(173,'oauth2_provider','0001_initial','2017-06-20 20:13:27.240035'),(174,'oauth2_provider','0002_08_updates','2017-06-20 20:13:29.177772'),(175,'oauth_dispatch','0001_initial','2017-06-20 20:13:29.822992'),(176,'oauth_provider','0001_initial','2017-06-20 20:13:31.330758'),(177,'organizations','0001_initial','2017-06-20 20:13:31.537108'),(178,'organizations','0002_auto_20170117_1434','2017-06-20 20:13:31.593290'),(179,'organizations','0003_auto_20170221_1138','2017-06-20 20:13:31.703316'),(180,'organizations','0004_auto_20170413_2315','2017-06-20 20:13:31.805704'),(181,'problem_builder','0001_initial','2017-06-20 20:13:31.923503'),(182,'problem_builder','0002_auto_20160121_1525','2017-06-20 20:13:33.428478'),(183,'problem_builder','0003_auto_20161124_0755','2017-06-20 20:13:33.554980'),(184,'programs','0001_initial','2017-06-20 20:13:34.504375'),(185,'programs','0002_programsapiconfig_cache_ttl','2017-06-20 20:13:35.557828'),(186,'programs','0003_auto_20151120_1613','2017-06-20 20:13:40.154383'),(187,'programs','0004_programsapiconfig_enable_certification','2017-06-20 20:13:41.228065'),(188,'programs','0005_programsapiconfig_max_retries','2017-06-20 20:13:42.429886'),(189,'programs','0006_programsapiconfig_xseries_ad_enabled','2017-06-20 20:13:43.589666'),(190,'programs','0007_programsapiconfig_program_listing_enabled','2017-06-20 20:13:44.718147'),(191,'programs','0008_programsapiconfig_program_details_enabled','2017-06-20 20:13:46.097926'),(192,'programs','0009_programsapiconfig_marketing_path','2017-06-20 20:13:47.226527'),(193,'programs','0010_auto_20170204_2332','2017-06-20 20:13:49.531411'),(194,'programs','0011_auto_20170301_1844','2017-06-20 20:14:06.447560'),(195,'programs','0012_auto_20170419_0018','2017-06-20 20:14:07.810263'),(196,'redirects','0001_initial','2017-06-20 20:14:09.490882'),(197,'rss_proxy','0001_initial','2017-06-20 20:14:09.574205'),(198,'sap_success_factors','0001_initial','2017-06-20 20:14:17.341644'),(199,'sap_success_factors','0002_auto_20170224_1545','2017-06-20 20:14:20.847367'),(200,'sap_success_factors','0003_auto_20170317_1402','2017-06-20 20:14:22.523325'),(201,'sap_success_factors','0004_catalogtransmissionaudit_audit_summary','2017-06-20 20:14:22.588300'),(202,'self_paced','0001_initial','2017-06-20 20:14:23.379704'),(203,'sessions','0001_initial','2017-06-20 20:14:23.447624'),(204,'student','0001_initial','2017-06-20 20:14:56.859382'),(205,'shoppingcart','0001_initial','2017-06-20 20:15:27.293338'),(206,'shoppingcart','0002_auto_20151208_1034','2017-06-20 20:15:30.452159'),(207,'shoppingcart','0003_auto_20151217_0958','2017-06-20 20:15:33.363590'),(208,'site_configuration','0001_initial','2017-06-20 20:15:36.609586'),(209,'site_configuration','0002_auto_20160720_0231','2017-06-20 20:15:39.806956'),(210,'default','0001_initial','2017-06-20 20:15:43.317231'),(211,'default','0002_add_related_name','2017-06-20 20:15:44.949966'),(212,'default','0003_alter_email_max_length','2017-06-20 20:15:45.030245'),(213,'default','0004_auto_20160423_0400','2017-06-20 20:15:46.764530'),(214,'social_auth','0005_auto_20160727_2333','2017-06-20 20:15:46.848697'),(215,'splash','0001_initial','2017-06-20 20:15:48.568252'),(216,'static_replace','0001_initial','2017-06-20 20:15:50.344299'),(217,'static_replace','0002_assetexcludedextensionsconfig','2017-06-20 20:15:52.039068'),(218,'status','0001_initial','2017-06-20 20:15:55.774655'),(219,'student','0002_auto_20151208_1034','2017-06-20 20:15:59.500293'),(220,'student','0003_auto_20160516_0938','2017-06-20 20:16:03.776522'),(221,'student','0004_auto_20160531_1422','2017-06-20 20:16:06.037166'),(222,'student','0005_auto_20160531_1653','2017-06-20 20:16:08.348584'),(223,'student','0006_logoutviewconfiguration','2017-06-20 20:16:13.468590'),(224,'student','0007_registrationcookieconfiguration','2017-06-20 20:16:14.340849'),(225,'student','0008_auto_20161117_1209','2017-06-20 20:16:15.108391'),(226,'student','0009_auto_20170111_0422','2017-06-20 20:16:15.944119'),(227,'student','0010_auto_20170207_0458','2017-06-20 20:16:15.955142'),(228,'submissions','0001_initial','2017-06-20 20:16:16.691876'),(229,'submissions','0002_auto_20151119_0913','2017-06-20 20:16:16.881584'),(230,'submissions','0003_submission_status','2017-06-20 20:16:16.980191'),(231,'survey','0001_initial','2017-06-20 20:16:18.253020'),(232,'teams','0001_initial','2017-06-20 20:16:21.257248'),(233,'theming','0001_initial','2017-06-20 20:16:22.265785'),(234,'third_party_auth','0001_initial','2017-06-20 20:16:29.362731'),(235,'third_party_auth','0002_schema__provider_icon_image','2017-06-20 20:16:38.673293'),(236,'third_party_auth','0003_samlproviderconfig_debug_mode','2017-06-20 20:16:40.316946'),(237,'third_party_auth','0004_add_visible_field','2017-06-20 20:16:51.555771'),(238,'third_party_auth','0005_add_site_field','2017-06-20 20:17:07.666394'),(239,'third_party_auth','0006_samlproviderconfig_automatic_refresh_enabled','2017-06-20 20:17:08.661184'),(240,'third_party_auth','0007_auto_20170406_0912','2017-06-20 20:17:11.235571'),(241,'third_party_auth','0008_auto_20170413_1455','2017-06-20 20:17:16.085350'),(242,'third_party_auth','0009_auto_20170415_1144','2017-06-20 20:17:21.404794'),(243,'third_party_auth','0010_add_skip_hinted_login_dialog_field','2017-06-20 20:17:26.970536'),(244,'third_party_auth','0011_auto_20170616_0112','2017-06-20 20:17:28.539216'),(245,'track','0001_initial','2017-06-20 20:17:28.615075'),(246,'user_api','0001_initial','2017-06-20 20:17:39.792267'),(247,'util','0001_initial','2017-06-20 20:17:41.619702'),(248,'util','0002_data__default_rate_limit_config','2017-06-20 20:17:41.684951'),(249,'verified_track_content','0001_initial','2017-06-20 20:17:41.768700'),(250,'verified_track_content','0002_verifiedtrackcohortedcourse_verified_cohort_name','2017-06-20 20:17:41.851832'),(251,'verify_student','0001_initial','2017-06-20 20:18:04.343599'),(252,'verify_student','0002_auto_20151124_1024','2017-06-20 20:18:07.041443'),(253,'verify_student','0003_auto_20151113_1443','2017-06-20 20:18:15.098225'),(254,'video_config','0001_initial','2017-06-20 20:18:17.751435'),(255,'waffle','0001_initial','2017-06-20 20:18:19.151667'),(256,'waffle_utils','0001_initial','2017-06-20 20:18:21.019888'),(257,'wiki','0001_initial','2017-06-20 20:19:16.072435'),(258,'wiki','0002_remove_article_subscription','2017-06-20 20:19:16.155073'),(259,'wiki','0003_ip_address_conv','2017-06-20 20:19:25.340552'),(260,'wiki','0004_increase_slug_size','2017-06-20 20:19:27.103106'),(261,'workflow','0001_initial','2017-06-20 20:19:27.531883'),(262,'xblock_django','0001_initial','2017-06-20 20:19:29.387617'),(263,'xblock_django','0002_auto_20160204_0809','2017-06-20 20:19:31.242158'),(264,'xblock_django','0003_add_new_config_models','2017-06-20 20:19:36.961405'),(265,'xblock_django','0004_delete_xblock_disable_config','2017-06-20 20:19:38.788793'),(266,'social_auth','0001_initial','2017-06-20 20:19:38.815302'),(267,'social_auth','0003_alter_email_max_length','2017-06-20 20:19:38.826411'),(268,'social_auth','0002_add_related_name','2017-06-20 20:19:38.838123'),(269,'social_auth','0004_auto_20160423_0400','2017-06-20 20:19:38.849261'),(270,'contentstore','0001_initial','2017-06-20 20:23:54.499725'),(271,'course_creators','0001_initial','2017-06-20 20:23:54.590648'),(272,'tagging','0001_initial','2017-06-20 20:23:55.006292'),(273,'tagging','0002_auto_20170116_1541','2017-06-20 20:23:55.075166'),(274,'user_tasks','0001_initial','2017-06-20 20:23:55.840601'),(275,'user_tasks','0002_artifact_file_storage','2017-06-20 20:23:56.186913'),(276,'xblock_config','0001_initial','2017-06-20 20:23:56.687706'),(277,'xblock_config','0002_courseeditltifieldsenabledflag','2017-06-20 20:23:57.466010');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_association`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_association`
--

LOCK TABLES `django_openid_auth_association` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_nonce`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(2047) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_nonce`
--

LOCK TABLES `django_openid_auth_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_useropenid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_useropenid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claimed_id` longtext NOT NULL,
  `display_id` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_openid_auth_user_user_id_136119e72782e2cf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_openid_auth_user_user_id_136119e72782e2cf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_useropenid`
--

LOCK TABLES `django_openid_auth_useropenid` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_useropenid` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_useropenid` ENABLE KEYS */;
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
  UNIQUE KEY `site_id` (`site_id`,`old_path`),
  KEY `django_redirect_91a0b591` (`old_path`),
  CONSTRAINT `django_redirect_site_id_121a4403f653e524_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  KEY `django_session_de54fa62` (`expire_date`)
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
  PRIMARY KEY (`id`)
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
-- Table structure for table `djcelery_crontabschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcel_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id` (`crontab_id`),
  KEY `djc_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id` (`interval_id`),
  CONSTRAINT `djc_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`),
  CONSTRAINT `djcel_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`),
  CONSTRAINT `djcelery_t_worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
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
  UNIQUE KEY `edxval_coursevideo_course_id_42cecee05cff2d8c_uniq` (`course_id`,`video_id`),
  KEY `edxval_coursevideo_b58b747e` (`video_id`),
  CONSTRAINT `edxval_coursevideo_video_id_68b2969f352edd03_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
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
  KEY `edxval_encodedvideo_83a0eb3f` (`profile_id`),
  KEY `edxval_encodedvideo_b58b747e` (`video_id`),
  CONSTRAINT `edxval_encodedv_profile_id_484a111092acafb3_fk_edxval_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `edxval_profile` (`id`),
  CONSTRAINT `edxval_encodedvideo_video_id_56934bca09fc3b13_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_profile`
--

LOCK TABLES `edxval_profile` WRITE;
/*!40000 ALTER TABLE `edxval_profile` DISABLE KEYS */;
INSERT INTO `edxval_profile` VALUES (1,'desktop_mp4'),(2,'desktop_webm'),(6,'hls'),(3,'mobile_high'),(4,'mobile_low'),(5,'youtube');
/*!40000 ALTER TABLE `edxval_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_subtitle`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_subtitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `fmt` varchar(20) NOT NULL,
  `language` varchar(8) NOT NULL,
  `content` longtext NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edxval_subtitle_76314543` (`fmt`),
  KEY `edxval_subtitle_8512ae7d` (`language`),
  KEY `edxval_subtitle_b58b747e` (`video_id`),
  CONSTRAINT `edxval_subtitle_video_id_5fabb0e154dda720_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_subtitle`
--

LOCK TABLES `edxval_subtitle` WRITE;
/*!40000 ALTER TABLE `edxval_subtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_subtitle` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_video_id` (`edx_video_id`),
  KEY `edxval_video_8d63c4f7` (`client_video_id`),
  KEY `edxval_video_9acb4454` (`status`)
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
-- Table structure for table `email_marketing_emailmarketingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_emailmarketingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `sailthru_key` varchar(32) NOT NULL,
  `sailthru_secret` varchar(32) NOT NULL,
  `sailthru_new_user_list` varchar(48) NOT NULL,
  `sailthru_retry_interval` int(11) NOT NULL,
  `sailthru_max_retries` int(11) NOT NULL,
  `sailthru_activation_template` varchar(20) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `sailthru_abandoned_cart_delay` int(11) NOT NULL,
  `sailthru_abandoned_cart_template` varchar(20) NOT NULL,
  `sailthru_content_cache_age` int(11) NOT NULL,
  `sailthru_enroll_cost` int(11) NOT NULL,
  `sailthru_enroll_template` varchar(20) NOT NULL,
  `sailthru_get_tags_from_sailthru` tinyint(1) NOT NULL,
  `sailthru_purchase_template` varchar(20) NOT NULL,
  `sailthru_upgrade_template` varchar(20) NOT NULL,
  `sailthru_lms_url_override` varchar(80) NOT NULL,
  `welcome_email_send_delay` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_marketing_e_changed_by_id_1c6968b921f23b0b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `email_marketing_e_changed_by_id_1c6968b921f23b0b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_emailmarketingconfiguration`
--

LOCK TABLES `email_marketing_emailmarketingconfiguration` WRITE;
/*!40000 ALTER TABLE `email_marketing_emailmarketingconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_emailmarketingconfiguration` ENABLE KEYS */;
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
INSERT INTO `embargo_country` VALUES (6,'AD'),(235,'AE'),(1,'AF'),(10,'AG'),(8,'AI'),(3,'AL'),(12,'AM'),(7,'AO'),(9,'AQ'),(11,'AR'),(5,'AS'),(15,'AT'),(14,'AU'),(13,'AW'),(2,'AX'),(16,'AZ'),(29,'BA'),(20,'BB'),(19,'BD'),(22,'BE'),(36,'BF'),(35,'BG'),(18,'BH'),(37,'BI'),(24,'BJ'),(185,'BL'),(25,'BM'),(34,'BN'),(27,'BO'),(28,'BQ'),(32,'BR'),(17,'BS'),(26,'BT'),(31,'BV'),(30,'BW'),(21,'BY'),(23,'BZ'),(41,'CA'),(48,'CC'),(52,'CD'),(43,'CF'),(51,'CG'),(217,'CH'),(55,'CI'),(53,'CK'),(45,'CL'),(40,'CM'),(46,'CN'),(49,'CO'),(54,'CR'),(57,'CU'),(38,'CV'),(58,'CW'),(47,'CX'),(59,'CY'),(60,'CZ'),(83,'DE'),(62,'DJ'),(61,'DK'),(63,'DM'),(64,'DO'),(4,'DZ'),(65,'EC'),(70,'EE'),(66,'EG'),(247,'EH'),(69,'ER'),(210,'ES'),(71,'ET'),(75,'FI'),(74,'FJ'),(72,'FK'),(144,'FM'),(73,'FO'),(76,'FR'),(80,'GA'),(236,'GB'),(88,'GD'),(82,'GE'),(77,'GF'),(92,'GG'),(84,'GH'),(85,'GI'),(87,'GL'),(81,'GM'),(93,'GN'),(89,'GP'),(68,'GQ'),(86,'GR'),(207,'GS'),(91,'GT'),(90,'GU'),(94,'GW'),(95,'GY'),(100,'HK'),(97,'HM'),(99,'HN'),(56,'HR'),(96,'HT'),(101,'HU'),(104,'ID'),(107,'IE'),(109,'IL'),(108,'IM'),(103,'IN'),(33,'IO'),(106,'IQ'),(105,'IR'),(102,'IS'),(110,'IT'),(113,'JE'),(111,'JM'),(114,'JO'),(112,'JP'),(116,'KE'),(120,'KG'),(39,'KH'),(117,'KI'),(50,'KM'),(187,'KN'),(164,'KP'),(208,'KR'),(119,'KW'),(42,'KY'),(115,'KZ'),(121,'LA'),(123,'LB'),(188,'LC'),(127,'LI'),(211,'LK'),(125,'LR'),(124,'LS'),(128,'LT'),(129,'LU'),(122,'LV'),(126,'LY'),(150,'MA'),(146,'MC'),(145,'MD'),(148,'ME'),(189,'MF'),(132,'MG'),(138,'MH'),(131,'MK'),(136,'ML'),(152,'MM'),(147,'MN'),(130,'MO'),(165,'MP'),(139,'MQ'),(140,'MR'),(149,'MS'),(137,'MT'),(141,'MU'),(135,'MV'),(133,'MW'),(143,'MX'),(134,'MY'),(151,'MZ'),(153,'NA'),(157,'NC'),(160,'NE'),(163,'NF'),(161,'NG'),(159,'NI'),(156,'NL'),(166,'NO'),(155,'NP'),(154,'NR'),(162,'NU'),(158,'NZ'),(167,'OM'),(171,'PA'),(174,'PE'),(78,'PF'),(172,'PG'),(175,'PH'),(168,'PK'),(177,'PL'),(190,'PM'),(176,'PN'),(179,'PR'),(170,'PS'),(178,'PT'),(169,'PW'),(173,'PY'),(180,'QA'),(181,'RE'),(182,'RO'),(197,'RS'),(183,'RU'),(184,'RW'),(195,'SA'),(204,'SB'),(198,'SC'),(212,'SD'),(216,'SE'),(200,'SG'),(186,'SH'),(203,'SI'),(214,'SJ'),(202,'SK'),(199,'SL'),(193,'SM'),(196,'SN'),(205,'SO'),(213,'SR'),(209,'SS'),(194,'ST'),(67,'SV'),(201,'SX'),(218,'SY'),(215,'SZ'),(231,'TC'),(44,'TD'),(79,'TF'),(224,'TG'),(222,'TH'),(220,'TJ'),(225,'TK'),(223,'TL'),(230,'TM'),(228,'TN'),(226,'TO'),(229,'TR'),(227,'TT'),(232,'TV'),(219,'TW'),(221,'TZ'),(234,'UA'),(233,'UG'),(237,'UM'),(238,'US'),(239,'UY'),(240,'UZ'),(98,'VA'),(191,'VC'),(242,'VE'),(244,'VG'),(245,'VI'),(243,'VN'),(241,'VU'),(246,'WF'),(192,'WS'),(118,'XK'),(248,'YE'),(142,'YT'),(206,'ZA'),(249,'ZM'),(250,'ZW');
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
  UNIQUE KEY `embargo_countryaccess_restricted_course_id_6f340c36c633cb0a_uniq` (`restricted_course_id`,`country_id`),
  KEY `embargo_countr_country_id_6244ff9d9c405c6e_fk_embargo_country_id` (`country_id`),
  KEY `embargo_countryaccessrule_77607676` (`restricted_course_id`),
  CONSTRAINT `d140f72cce132ba9230b3ff66d8761ad` FOREIGN KEY (`restricted_course_id`) REFERENCES `embargo_restrictedcourse` (`id`),
  CONSTRAINT `embargo_countr_country_id_6244ff9d9c405c6e_fk_embargo_country_id` FOREIGN KEY (`country_id`) REFERENCES `embargo_country` (`id`)
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
  KEY `embargo_courseaccessrulehistory_d7e6d55b` (`timestamp`),
  KEY `embargo_courseaccessrulehistory_c8235886` (`course_key`)
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
  KEY `embargo_embargoeds_changed_by_id_7e30811d0e5008b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `embargo_embargoeds_changed_by_id_7e30811d0e5008b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `embargo_ipfilter_changed_by_id_5c820bfac889ea81_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `embargo_ipfilter_changed_by_id_5c820bfac889ea81_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `enterprise_enrollment_site_id_7721afc6c8e97cc8_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enrollmentnotificationemailtemplate`
--

LOCK TABLES `enterprise_enrollmentnotificationemailtemplate` WRITE;
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` ENABLE KEYS */;
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
  `consent_granted` tinyint(1) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `enterprise_customer_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_ente_enterprise_customer_user_id_18f302e179a5aca_uniq` (`enterprise_customer_user_id`,`course_id`),
  CONSTRAINT `D69dbba1e57159194d7bba595f75cb24` FOREIGN KEY (`enterprise_customer_user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`)
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
  `active` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `catalog` int(10) unsigned,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `require_account_level_consent` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `enterprise_enterprisecustomer_9365d6e7` (`site_id`),
  CONSTRAINT `enterprise_enterprise_site_id_41ce54c2601930cd_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `D1fbd8b8ab06c9a5efdee961a7a75e55` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
-- Table structure for table `enterprise_enterprisecustomerentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerentitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entitlement_id` (`entitlement_id`),
  KEY `D294d8114811ae99c12786fb8669866d` (`enterprise_customer_id`),
  CONSTRAINT `D294d8114811ae99c12786fb8669866d` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerentitlement`
--

LOCK TABLES `enterprise_enterprisecustomerentitlement` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerentitlement` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `D76e394d5748d37ad29b7fd9ad04ea75` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
-- Table structure for table `enterprise_enterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomeruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterpri_enterprise_customer_id_257cf08ca29bc48b_uniq` (`enterprise_customer_id`,`user_id`),
  CONSTRAINT `D38bb8d455e64dd8470b7606517efded` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_1f039ddadc60ca21_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicalenrollmentnotificationemailtemplate_b80063a` (`id`),
  CONSTRAINT `enterprise_hist_history_user_id_1f039ddadc60ca21_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
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
  `consent_granted` tinyint(1) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_user_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_7f3d211f9d742591_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicalenterprisecourseenrollment_b80bb774` (`id`),
  CONSTRAINT `enterprise_hist_history_user_id_7f3d211f9d742591_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
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
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `site_id` int(11),
  `catalog` int(10) unsigned,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `require_account_level_consent` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_2938dabbace21ece_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomer_ef7c876f` (`uuid`),
  KEY `enterprise_historicalenterprisecustomer_9365d6e7` (`site_id`),
  CONSTRAINT `enterprise_hist_history_user_id_2938dabbace21ece_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `enterprise_historicalenterprisecustomerentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomerentitlement` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_41b275d5667e3790_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomerentitlement_b80bb774` (`id`),
  KEY `enterprise_historicalenterprisecustomerentitlement_9a57d8e5` (`entitlement_id`),
  CONSTRAINT `enterprise_hist_history_user_id_41b275d5667e3790_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomerentitlement`
--

LOCK TABLES `enterprise_historicalenterprisecustomerentitlement` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomerentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomerentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicaluserdatasharingconsentaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicaluserdatasharingconsentaudit` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `state` varchar(8) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_4571f12e73d38294_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicaluserdatasharingconsentaudit_b80bb774` (`id`),
  CONSTRAINT `enterprise_hist_history_user_id_4571f12e73d38294_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicaluserdatasharingconsentaudit`
--

LOCK TABLES `enterprise_historicaluserdatasharingconsentaudit` WRITE;
/*!40000 ALTER TABLE `enterprise_historicaluserdatasharingconsentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicaluserdatasharingconsentaudit` ENABLE KEYS */;
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_pendingenrollment_user_id_111d29e0f8aebec5_uniq` (`user_id`,`course_id`),
  CONSTRAINT `a9ce3c7057d5f3b27dc64261037ad37d` FOREIGN KEY (`user_id`) REFERENCES `enterprise_pendingenterprisecustomeruser` (`id`)
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
  UNIQUE KEY `enterprise_pendingenterprisecus_user_email_1838ab42a578cf3c_uniq` (`user_email`),
  KEY `D0f27fd26a677554e54740cfe1555271` (`enterprise_customer_id`),
  CONSTRAINT `D0f27fd26a677554e54740cfe1555271` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
-- Table structure for table `enterprise_userdatasharingconsentaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_userdatasharingconsentaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `state` varchar(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D7bcf2c6862faec34623e29b1c5e5b5a` (`user_id`),
  CONSTRAINT `D7bcf2c6862faec34623e29b1c5e5b5a` FOREIGN KEY (`user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_userdatasharingconsentaudit`
--

LOCK TABLES `enterprise_userdatasharingconsentaudit` WRITE;
/*!40000 ALTER TABLE `enterprise_userdatasharingconsentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_userdatasharingconsentaudit` ENABLE KEYS */;
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
  UNIQUE KEY `experiments_experimentdata_user_id_766ad715d1cc0535_uniq` (`user_id`,`experiment_id`,`key`),
  KEY `experiments_experimentdata_user_id_17db4fa696359194_idx` (`user_id`,`experiment_id`),
  KEY `experiments_experimentdata_abd1812d` (`experiment_id`),
  CONSTRAINT `experiments_experimentd_user_id_438ab1d21d4ecc3d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `external_auth_externalauthmap`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_auth_externalauthmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) NOT NULL,
  `external_domain` varchar(255) NOT NULL,
  `external_credentials` longtext NOT NULL,
  `external_email` varchar(255) NOT NULL,
  `external_name` varchar(255) NOT NULL,
  `internal_password` varchar(31) NOT NULL,
  `dtcreated` datetime(6) NOT NULL,
  `dtsignup` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_auth_externalauthmap_external_id_7f035ef8bc4d313e_uniq` (`external_id`,`external_domain`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `external_auth_externalauthmap_0e684294` (`external_id`),
  KEY `external_auth_externalauthmap_630a0308` (`external_domain`),
  KEY `external_auth_externalauthmap_e9425fc5` (`external_email`),
  KEY `external_auth_externalauthmap_c9555995` (`external_name`),
  CONSTRAINT `external_auth_externala_user_id_644e7779f2d52b9a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_auth_externalauthmap`
--

LOCK TABLES `external_auth_externalauthmap` WRITE;
/*!40000 ALTER TABLE `external_auth_externalauthmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_auth_externalauthmap` ENABLE KEYS */;
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
  KEY `grades_computegra_changed_by_id_6599c94d3a43e583_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `grades_computegra_changed_by_id_6599c94d3a43e583_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `grades_coursepersistentgradesflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_coursepersistentgradesflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_coursepers_changed_by_id_38bec876127ebacc_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `grades_coursepers_changed_by_id_38bec876127ebacc_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_coursepersistentgradesflag`
--

LOCK TABLES `grades_coursepersistentgradesflag` WRITE;
/*!40000 ALTER TABLE `grades_coursepersistentgradesflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_coursepersistentgradesflag` ENABLE KEYS */;
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
  `passed_timestamp` datetime(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_persistentcoursegrade_course_id_6c83398a6a9c0872_uniq` (`course_id`,`user_id`),
  KEY `grades_persistentcoursegrade_e8701ad4` (`user_id`),
  KEY `grades_persistentcoursegra_passed_timestamp_38d17e3e3bc3cb7f_idx` (`passed_timestamp`,`course_id`),
  KEY `grades_persistentcoursegrade_modified_33ed872ee90d4a03_idx` (`modified`,`course_id`)
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
-- Table structure for table `grades_persistentgradesenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentgradesenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_persistent_changed_by_id_2350d66400243149_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `grades_persistent_changed_by_id_2350d66400243149_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentgradesenabledflag`
--

LOCK TABLES `grades_persistentgradesenabledflag` WRITE;
/*!40000 ALTER TABLE `grades_persistentgradesenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentgradesenabledflag` ENABLE KEYS */;
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
  `first_attempted` datetime(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_persistentsubsectiongrade_course_id_5e423f1e9b6c031_uniq` (`course_id`,`user_id`,`usage_key`),
  KEY `grades_persistentsubsectiongrade_2ddf9ac4` (`visible_blocks_hash`),
  KEY `grades_persistentsubsectiongrade_modified_63b103f5651501c8_idx` (`modified`,`course_id`,`usage_key`),
  KEY `grades_persistentsubsectiong_first_attempted_96c2c1175370fed_idx` (`first_attempted`,`course_id`,`user_id`),
  CONSTRAINT `a6bafd85579f2eb43880453893b251a3` FOREIGN KEY (`visible_blocks_hash`) REFERENCES `grades_visibleblocks` (`hashed`)
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
  KEY `grades_visibleblocks_ea134da7` (`course_id`)
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
  KEY `instructor_task_g_changed_by_id_6a84d49e85aede81_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `instructor_task_g_changed_by_id_6a84d49e85aede81_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `instructor_task_instructortask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_instructortask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(50) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `task_key` varchar(255) NOT NULL,
  `task_input` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `task_state` varchar(50) DEFAULT NULL,
  `task_output` varchar(1024) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `subtasks` longtext NOT NULL,
  `requester_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_task_in_requester_id_3383acfe2fe42391_fk_auth_user_id` (`requester_id`),
  KEY `instructor_task_instructortask_5361aa34` (`task_type`),
  KEY `instructor_task_instructortask_ea134da7` (`course_id`),
  KEY `instructor_task_instructortask_a2903537` (`task_key`),
  KEY `instructor_task_instructortask_57746cc8` (`task_id`),
  KEY `instructor_task_instructortask_76980a94` (`task_state`),
  CONSTRAINT `instructor_task_in_requester_id_3383acfe2fe42391_fk_auth_user_id` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `integrated_channel_enterpriseintegratedchannel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_enterpriseintegratedchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `integrated_channel_enterpriseintegrat_name_702c3ed3b8437548_uniq` (`name`,`data_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_enterpriseintegratedchannel`
--

LOCK TABLES `integrated_channel_enterpriseintegratedchannel` WRITE;
/*!40000 ALTER TABLE `integrated_channel_enterpriseintegratedchannel` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_enterpriseintegratedchannel` ENABLE KEYS */;
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
  KEY `lms_xblock_xblocka_changed_by_id_eabf5ef3e34dfb8_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `lms_xblock_xblocka_changed_by_id_eabf5ef3e34dfb8_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `mentoring_answer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentoring_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `student_id` varchar(32) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `student_input` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`course_id`,`name`),
  KEY `mentoring_answer_b068931c` (`name`),
  KEY `mentoring_answer_30a811f6` (`student_id`),
  KEY `mentoring_answer_ea134da7` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentoring_answer`
--

LOCK TABLES `mentoring_answer` WRITE;
/*!40000 ALTER TABLE `mentoring_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentoring_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microsite_configuration_historicalmicrositeorganizationmapping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microsite_configuration_historicalmicrositeorganizationmapping` (
  `id` int(11) NOT NULL,
  `organization` varchar(63) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `microsite_id` int(11),
  PRIMARY KEY (`history_id`),
  KEY `microsite_confi_history_user_id_40846fe04877dd35_fk_auth_user_id` (`history_user_id`),
  KEY `microsite_configuration_historicalmicrositeorganizationmappi1219` (`id`),
  KEY `microsite_configuration_historicalmicrositeorganizationmappi74d9` (`organization`),
  KEY `microsite_configuration_historicalmicrositeorganizationmappi5a96` (`microsite_id`),
  CONSTRAINT `microsite_confi_history_user_id_40846fe04877dd35_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microsite_configuration_historicalmicrositeorganizationmapping`
--

LOCK TABLES `microsite_configuration_historicalmicrositeorganizationmapping` WRITE;
/*!40000 ALTER TABLE `microsite_configuration_historicalmicrositeorganizationmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `microsite_configuration_historicalmicrositeorganizationmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microsite_configuration_historicalmicrositetemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microsite_configuration_historicalmicrositetemplate` (
  `id` int(11) NOT NULL,
  `template_uri` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `microsite_id` int(11),
  PRIMARY KEY (`history_id`),
  KEY `microsite_confi_history_user_id_53e1b0dcb708d6ef_fk_auth_user_id` (`history_user_id`),
  KEY `microsite_configuration_historicalmicrositetemplate_b80bb774` (`id`),
  KEY `microsite_configuration_historicalmicrositetemplate_a8b249ec` (`template_uri`),
  KEY `microsite_configuration_historicalmicrositetemplate_c9cd58ae` (`microsite_id`),
  CONSTRAINT `microsite_confi_history_user_id_53e1b0dcb708d6ef_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microsite_configuration_historicalmicrositetemplate`
--

LOCK TABLES `microsite_configuration_historicalmicrositetemplate` WRITE;
/*!40000 ALTER TABLE `microsite_configuration_historicalmicrositetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `microsite_configuration_historicalmicrositetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microsite_configuration_microsite`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microsite_configuration_microsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(63) NOT NULL,
  `values` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `microsite_configuratio_site_id_3ebe20a76de5aa4_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microsite_configuration_microsite`
--

LOCK TABLES `microsite_configuration_microsite` WRITE;
/*!40000 ALTER TABLE `microsite_configuration_microsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `microsite_configuration_microsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microsite_configuration_micrositehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microsite_configuration_micrositehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `key` varchar(63) NOT NULL,
  `values` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `microsite_configurati_site_id_6977a04d3625a533_fk_django_site_id` (`site_id`),
  CONSTRAINT `microsite_configurati_site_id_6977a04d3625a533_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microsite_configuration_micrositehistory`
--

LOCK TABLES `microsite_configuration_micrositehistory` WRITE;
/*!40000 ALTER TABLE `microsite_configuration_micrositehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `microsite_configuration_micrositehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microsite_configuration_micrositeorganizationmapping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microsite_configuration_micrositeorganizationmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization` varchar(63) NOT NULL,
  `microsite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organization` (`organization`),
  KEY `D1c5d7dbbb2cde12ce18b38d46f71ee0` (`microsite_id`),
  CONSTRAINT `D1c5d7dbbb2cde12ce18b38d46f71ee0` FOREIGN KEY (`microsite_id`) REFERENCES `microsite_configuration_microsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microsite_configuration_micrositeorganizationmapping`
--

LOCK TABLES `microsite_configuration_micrositeorganizationmapping` WRITE;
/*!40000 ALTER TABLE `microsite_configuration_micrositeorganizationmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `microsite_configuration_micrositeorganizationmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microsite_configuration_micrositetemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microsite_configuration_micrositetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_uri` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `microsite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `microsite_configuration_micros_microsite_id_80b3f3616d2e317_uniq` (`microsite_id`,`template_uri`),
  KEY `microsite_configuration_micrositetemplate_a8b249ec` (`template_uri`),
  CONSTRAINT `D4919cbc5f1414d3de93aa9ec9aa48f3` FOREIGN KEY (`microsite_id`) REFERENCES `microsite_configuration_microsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microsite_configuration_micrositetemplate`
--

LOCK TABLES `microsite_configuration_micrositetemplate` WRITE;
/*!40000 ALTER TABLE `microsite_configuration_micrositetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `microsite_configuration_micrositetemplate` ENABLE KEYS */;
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
  `requirements` varchar(255),
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursecontentmileston_course_id_68d1457cd52d6dff_uniq` (`course_id`,`content_id`,`milestone_id`),
  KEY `milestones_coursecontentmilestone_ea134da7` (`course_id`),
  KEY `milestones_coursecontentmilestone_e14f02ad` (`content_id`),
  KEY `milestones_coursecontentmilestone_dbb5cd1e` (`milestone_id`),
  KEY `milestones_coursecontentmilestone_db6866e3` (`milestone_relationship_type_id`),
  KEY `milestones_coursecontentmilestone_active_39b5c645fa33bfee_uniq` (`active`),
  CONSTRAINT `D84e404851bc6d6b9fe0d60955e8729c` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`),
  CONSTRAINT `milesto_milestone_id_73b6eddde5b205a8_fk_milestones_milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
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
  UNIQUE KEY `milestones_coursemilestone_course_id_5a06e10579eab3b7_uniq` (`course_id`,`milestone_id`),
  KEY `milestones_coursemilestone_ea134da7` (`course_id`),
  KEY `milestones_coursemilestone_dbb5cd1e` (`milestone_id`),
  KEY `milestones_coursemilestone_db6866e3` (`milestone_relationship_type_id`),
  KEY `milestones_coursemilestone_active_5c3a925f8cc4bde2_uniq` (`active`),
  CONSTRAINT `D69536d0d313008147c5daf5341090e1` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`),
  CONSTRAINT `milesto_milestone_id_284153799c54d7d8_fk_milestones_milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
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
  UNIQUE KEY `milestones_milestone_namespace_460a2f6943016c0b_uniq` (`namespace`,`name`),
  KEY `milestones_milestone_89801e9e` (`namespace`),
  KEY `milestones_milestone_b068931c` (`name`),
  KEY `milestones_milestone_active_1182ba3c09d42c35_uniq` (`active`)
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
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2017-06-20 20:13:09.088107','2017-06-20 20:13:09.088773','fulfills','Autogenerated milestone relationship type \"fulfills\"',1),(2,'2017-06-20 20:13:09.090121','2017-06-20 20:13:09.090243','requires','Autogenerated milestone relationship type \"requires\"',1);
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
  UNIQUE KEY `milestones_usermilestone_user_id_10206aa452468351_uniq` (`user_id`,`milestone_id`),
  KEY `milesto_milestone_id_4fe38e3e9994f15c_fk_milestones_milestone_id` (`milestone_id`),
  KEY `milestones_usermilestone_e8701ad4` (`user_id`),
  KEY `milestones_usermilestone_active_1827f467fe87a8ea_uniq` (`active`),
  CONSTRAINT `milesto_milestone_id_4fe38e3e9994f15c_fk_milestones_milestone_id` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
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
  UNIQUE KEY `mobile_api_appversionconfig_platform_d34993f68d46008_uniq` (`platform`,`version`)
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
  KEY `mobile_api_ignore_changed_by_id_754382e31d5f9d51_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `mobile_api_ignore_changed_by_id_754382e31d5f9d51_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `mobile_api_mobile_changed_by_id_439d2c27670d0fc4_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `mobile_api_mobile_changed_by_id_439d2c27670d0fc4_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `notes_note`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `quote` longtext NOT NULL,
  `range_start` varchar(2048) NOT NULL,
  `range_start_offset` int(11) NOT NULL,
  `range_end` varchar(2048) NOT NULL,
  `range_end_offset` int(11) NOT NULL,
  `tags` longtext NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_note_user_id_2aa1ff88fd937cb3_fk_auth_user_id` (`user_id`),
  KEY `notes_note_ea134da7` (`course_id`),
  KEY `notes_note_9305b73d` (`uri`),
  KEY `notes_note_e2fa5388` (`created`),
  KEY `notes_note_0f81d52e` (`updated`),
  CONSTRAINT `notes_note_user_id_2aa1ff88fd937cb3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_note`
--

LOCK TABLES `notes_note` WRITE;
/*!40000 ALTER TABLE `notes_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_note` ENABLE KEYS */;
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
  `subscription_id` int(11),
  PRIMARY KEY (`id`),
  KEY `notify_notification_ef42673f` (`subscription_id`),
  CONSTRAINT `D48032390695e0699e92b8d7ccdbff7e` FOREIGN KEY (`subscription_id`) REFERENCES `notify_subscription` (`subscription_id`)
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
  KEY `notif_content_type_id_181f055892581fd8_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `notif_content_type_id_181f055892581fd8_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
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
  KEY `notify_settings_user_id_14e062dc3d4345b3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notify_settings_user_id_14e062dc3d4345b3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `a2462650bbefc26547210b80dec61069` (`notification_type_id`),
  KEY `notify_subscr_settings_id_64d594d127e8ca95_fk_notify_settings_id` (`settings_id`),
  CONSTRAINT `a2462650bbefc26547210b80dec61069` FOREIGN KEY (`notification_type_id`) REFERENCES `notify_notificationtype` (`key`),
  CONSTRAINT `notify_subscr_settings_id_64d594d127e8ca95_fk_notify_settings_id` FOREIGN KEY (`settings_id`) REFERENCES `notify_settings` (`id`)
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
-- Table structure for table `oauth2_accesstoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_accesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_accesstoken_94a08da1` (`token`),
  KEY `oauth2_accesstoken_2bfe9d72` (`client_id`),
  KEY `oauth2_accesstoken_e8701ad4` (`user_id`),
  CONSTRAINT `oauth2_accesstoke_client_id_20c73b03a7c139a2_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `oauth2_accesstoken_user_id_7a865c7085722378_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_accesstoken`
--

LOCK TABLES `oauth2_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_client`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `redirect_uri` varchar(200) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `client_type` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `logout_uri` varchar(200),
  PRIMARY KEY (`id`),
  KEY `oauth2_client_user_id_2b47284bbd512fe1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_client_user_id_2b47284bbd512fe1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_client`
--

LOCK TABLES `oauth2_client` WRITE;
/*!40000 ALTER TABLE `oauth2_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_grant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id` (`user_id`),
  KEY `oauth2_grant_client_id_7f83b952b3c51985_idx` (`client_id`,`code`,`expires`),
  CONSTRAINT `oauth2_grant_client_id_fbfc174fbc856af_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_grant`
--

LOCK TABLES `oauth2_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `D5ac3019ee1c474fd85718b015e3d3a1` (`application_id`),
  KEY `oauth2_provider_accesstoken_94a08da1` (`token`),
  KEY `oauth2_provider_accesst_user_id_5e2f004fdebea22d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `D5ac3019ee1c474fd85718b015e3d3a1` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesst_user_id_5e2f004fdebea22d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_9d667c2b` (`client_secret`),
  KEY `oauth2_provider_applica_user_id_7fa13387c260b798_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_applica_user_id_7fa13387c260b798_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D6b2a4f1402d4f338b690c38b795830a` (`application_id`),
  KEY `oauth2_provider_grant_user_id_3111344894d452da_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_grant_c1336794` (`code`),
  CONSTRAINT `D6b2a4f1402d4f338b690c38b795830a` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_3111344894d452da_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  KEY `d3e264ceec355cabed6ff9976fc42a06` (`application_id`),
  KEY `oauth2_provider_refresh_user_id_3f695b639cfbc9a3_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_refreshtoken_94a08da1` (`token`),
  CONSTRAINT `b58d9cb3b93afb36b11b7741bf1bcc1a` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `d3e264ceec355cabed6ff9976fc42a06` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refresh_user_id_3f695b639cfbc9a3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `oauth2_provider_trustedclient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_trustedclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_provider_tr_client_id_bb96ea0be42c00a_fk_oauth2_client_id` (`client_id`),
  CONSTRAINT `oauth2_provider_tr_client_id_bb96ea0be42c00a_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_trustedclient`
--

LOCK TABLES `oauth2_provider_trustedclient` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_trustedclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_trustedclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_refreshtoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_refreshtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  KEY `oauth2_refreshtok_client_id_2f55036ac9aa614e_fk_oauth2_client_id` (`client_id`),
  KEY `oauth2_refreshtoken_user_id_acecf94460b787c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2__access_token_id_f99377d503a000b_fk_oauth2_accesstoken_id` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_accesstoken` (`id`),
  CONSTRAINT `oauth2_refreshtok_client_id_2f55036ac9aa614e_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `oauth2_refreshtoken_user_id_acecf94460b787c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refreshtoken`
--

LOCK TABLES `oauth2_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_restrictedapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_restrictedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `d0faf25b802e0044a322123f797a61c7` (`application_id`),
  CONSTRAINT `d0faf25b802e0044a322123f797a61c7` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`)
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
-- Table structure for table `oauth_provider_consumer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_provider_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `key` varchar(256) NOT NULL,
  `secret` varchar(16) NOT NULL,
  `status` smallint(6) NOT NULL,
  `xauth_allowed` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_provider_consumer_user_id_4f22b60d2b258006_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth_provider_consumer_user_id_4f22b60d2b258006_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_provider_consumer`
--

LOCK TABLES `oauth_provider_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_provider_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_provider_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_provider_nonce`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_provider_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_key` varchar(32) NOT NULL,
  `consumer_key` varchar(256) NOT NULL,
  `key` varchar(255) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_provider_nonce_d7e6d55b` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_provider_nonce`
--

LOCK TABLES `oauth_provider_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_provider_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_provider_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_provider_scope`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_provider_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `is_readonly` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_provider_scope`
--

LOCK TABLES `oauth_provider_scope` WRITE;
/*!40000 ALTER TABLE `oauth_provider_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_provider_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_provider_token`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_provider_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) DEFAULT NULL,
  `secret` varchar(16) DEFAULT NULL,
  `token_type` smallint(6) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `verifier` varchar(10) NOT NULL,
  `callback` varchar(2083) DEFAULT NULL,
  `callback_confirmed` tinyint(1) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_consumer_id_1b9915b5bcf1ee5b_fk_oauth_provider_consumer_id` (`consumer_id`),
  KEY `oauth_provi_scope_id_459821b6fecbc02a_fk_oauth_provider_scope_id` (`scope_id`),
  KEY `oauth_provider_token_user_id_588adbcffc892186_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth_consumer_id_1b9915b5bcf1ee5b_fk_oauth_provider_consumer_id` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_provider_consumer` (`id`),
  CONSTRAINT `oauth_provi_scope_id_459821b6fecbc02a_fk_oauth_provider_scope_id` FOREIGN KEY (`scope_id`) REFERENCES `oauth_provider_scope` (`id`),
  CONSTRAINT `oauth_provider_token_user_id_588adbcffc892186_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_provider_token`
--

LOCK TABLES `oauth_provider_token` WRITE;
/*!40000 ALTER TABLE `oauth_provider_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_provider_token` ENABLE KEYS */;
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
  KEY `organizations_organization_b068931c` (`name`),
  KEY `organizations_organization_4698bac7` (`short_name`)
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
  UNIQUE KEY `organizations_organizationcourse_course_id_3f0149776c0495ff_uniq` (`course_id`,`organization_id`),
  KEY `a7b04b16eba98e518fbe21d390bd8e3e` (`organization_id`),
  KEY `organizations_organizationcourse_ea134da7` (`course_id`),
  CONSTRAINT `a7b04b16eba98e518fbe21d390bd8e3e` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
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
-- Table structure for table `problem_builder_answer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_builder_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `student_id` varchar(32) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `student_input` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `course_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `problem_builder_answer_student_id_2f6847a9fb3e9385_uniq` (`student_id`,`course_id`,`name`),
  UNIQUE KEY `problem_builder_answer_student_id_2ce682a818c95cbc_uniq` (`student_id`,`course_key`,`name`),
  KEY `problem_builder_answer_b068931c` (`name`),
  KEY `problem_builder_answer_30a811f6` (`student_id`),
  KEY `problem_builder_answer_ea134da7` (`course_id`),
  KEY `problem_builder_answer_c8235886` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_builder_answer`
--

LOCK TABLES `problem_builder_answer` WRITE;
/*!40000 ALTER TABLE `problem_builder_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_builder_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_builder_share`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_builder_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uid` varchar(32) NOT NULL,
  `block_id` varchar(255) NOT NULL,
  `notified` tinyint(1) NOT NULL,
  `shared_by_id` int(11) NOT NULL,
  `shared_with_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `problem_builder_share_shared_by_id_4e845ea266d66e1_uniq` (`shared_by_id`,`shared_with_id`,`block_id`),
  KEY `problem_builder__shared_with_id_573844d7dca07647_fk_auth_user_id` (`shared_with_id`),
  KEY `problem_builder_share_7e53bca2` (`block_id`),
  KEY `problem_builder_share_e559ad34` (`notified`),
  CONSTRAINT `problem_builder__shared_with_id_573844d7dca07647_fk_auth_user_id` FOREIGN KEY (`shared_with_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `problem_builder_sh_shared_by_id_35201b15adc664ce_fk_auth_user_id` FOREIGN KEY (`shared_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_builder_share`
--

LOCK TABLES `problem_builder_share` WRITE;
/*!40000 ALTER TABLE `problem_builder_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_builder_share` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_course_id_7d8ab189323890c0_uniq` (`course_id`,`content_id`),
  KEY `proctoring_proctoredexam_ea134da7` (`course_id`),
  KEY `proctoring_proctoredexam_e14f02ad` (`content_id`),
  KEY `proctoring_proctoredexam_0e684294` (`external_id`)
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
  KEY `D32bab97500954b362d3f768dd89b6da` (`proctored_exam_id`),
  KEY `proctoring_proct_set_by_user_id_75a66580aa44cd84_fk_auth_user_id` (`set_by_user_id`),
  CONSTRAINT `D32bab97500954b362d3f768dd89b6da` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proct_set_by_user_id_75a66580aa44cd84_fk_auth_user_id` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `d9965d8af87bebd0587414ca1ba4826f` (`proctored_exam_id`),
  KEY `proctoring_procto_set_by_user_id_31fae610848d90f_fk_auth_user_id` (`set_by_user_id`),
  KEY `proctoring_proctoredexamreviewpolicyhistory_524b09d0` (`original_id`),
  CONSTRAINT `d9965d8af87bebd0587414ca1ba4826f` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_procto_set_by_user_id_31fae610848d90f_fk_auth_user_id` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`)
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
  `video_url` longtext NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexamsoftw_attempt_code_69b9866a54964afb_uniq` (`attempt_code`),
  KEY `proctori_exam_id_635059f5fe2cc392_fk_proctoring_proctoredexam_id` (`exam_id`),
  KEY `proctoring_proct_reviewed_by_id_4cff67b7de094f65_fk_auth_user_id` (`reviewed_by_id`),
  KEY `proctoring_proctored_student_id_14c182517b0cbb5b_fk_auth_user_id` (`student_id`),
  KEY `proctoring_proctoredexamsoftwaresecurereview_b38e5b0e` (`attempt_code`),
  CONSTRAINT `proctori_exam_id_635059f5fe2cc392_fk_proctoring_proctoredexam_id` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proct_reviewed_by_id_4cff67b7de094f65_fk_auth_user_id` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `proctoring_proctored_student_id_14c182517b0cbb5b_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  `video_url` longtext NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proctori_exam_id_73969ae423813477_fk_proctoring_proctoredexam_id` (`exam_id`),
  KEY `proctoring_proct_reviewed_by_id_139568d0bf423998_fk_auth_user_id` (`reviewed_by_id`),
  KEY `proctoring_proctored_student_id_6922ba3b791462d8_fk_auth_user_id` (`student_id`),
  KEY `proctoring_proctoredexamsoftwaresecurereviewhistory_b38e5b0e` (`attempt_code`),
  CONSTRAINT `proctori_exam_id_73969ae423813477_fk_proctoring_proctoredexam_id` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proct_reviewed_by_id_139568d0bf423998_fk_auth_user_id` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `proctoring_proctored_student_id_6922ba3b791462d8_fk_auth_user_id` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `proctoring_proctoredexamstudentall_user_id_665ed945152c2f60_uniq` (`user_id`,`proctored_exam_id`,`key`),
  KEY `db55b83a7875e70b3a0ebd1f81a898d8` (`proctored_exam_id`),
  CONSTRAINT `db55b83a7875e70b3a0ebd1f81a898d8` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctoredexam_user_id_a0a0681d4a01661_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `D169ec97a7fca1dbf6b0bb2929d41ccc` (`proctored_exam_id`),
  KEY `proctoring_proctoredexa_user_id_68e25e3abb187580_fk_auth_user_id` (`user_id`),
  CONSTRAINT `D169ec97a7fca1dbf6b0bb2929d41ccc` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctoredexa_user_id_68e25e3abb187580_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `last_poll_timestamp` datetime(6) DEFAULT NULL,
  `last_poll_ipaddr` varchar(32) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) NOT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_status_acknowledged` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexamstudentatt_user_id_15d13fa8dac316a0_uniq` (`user_id`,`proctored_exam_id`),
  KEY `D5e0a120c32f715bfe04a0a57f399ec0` (`proctored_exam_id`),
  KEY `proctoring_proctoredexamstudentattempt_b38e5b0e` (`attempt_code`),
  KEY `proctoring_proctoredexamstudentattempt_0e684294` (`external_id`),
  CONSTRAINT `D5e0a120c32f715bfe04a0a57f399ec0` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctoredexa_user_id_633fd8f4f65a0cac_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `proctoring_proctoredexamstudentattemptcomment_5bd2a989` (`review_id`),
  CONSTRAINT `D596dd9c7d948d9256c2e29e6194b5e7` FOREIGN KEY (`review_id`) REFERENCES `proctoring_proctoredexamsoftwaresecurereview` (`id`)
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
-- Table structure for table `proctoring_proctoredexamstudentattempthistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattempthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `attempt_id` int(11) DEFAULT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) NOT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `last_poll_timestamp` datetime(6) DEFAULT NULL,
  `last_poll_ipaddr` varchar(32) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cbccbfd5c4c427541fdce96e77e6bf6c` (`proctored_exam_id`),
  KEY `proctoring_proctoredexa_user_id_59ce75db7c4fc769_fk_auth_user_id` (`user_id`),
  KEY `proctoring_proctoredexamstudentattempthistory_b38e5b0e` (`attempt_code`),
  KEY `proctoring_proctoredexamstudentattempthistory_0e684294` (`external_id`),
  CONSTRAINT `cbccbfd5c4c427541fdce96e77e6bf6c` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctoredexa_user_id_59ce75db7c4fc769_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattempthistory`
--

LOCK TABLES `proctoring_proctoredexamstudentattempthistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempthistory` ENABLE KEYS */;
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
  KEY `programs_programsa_changed_by_id_b7c3b49d5c0dcd3_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `programs_programsa_changed_by_id_b7c3b49d5c0dcd3_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_programsapiconfig`
--

LOCK TABLES `programs_programsapiconfig` WRITE;
/*!40000 ALTER TABLE `programs_programsapiconfig` DISABLE KEYS */;
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
-- Table structure for table `sap_success_factors_catalogtransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_catalogtransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_customer_uuid` char(32) NOT NULL,
  `total_courses` int(10) unsigned NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `audit_summary` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_catalogtransmissionaudit`
--

LOCK TABLES `sap_success_factors_catalogtransmissionaudit` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_catalogtransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_catalogtransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_historicalsapsuccessfactorsenterprisecus80ad`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_historicalsapsuccessfactorsenterprisecus80ad` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `sapsf_base_url` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `sapsf_company_id` varchar(255) NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `sap_success_fac_history_user_id_2cd9fa0a2a669e26_fk_auth_user_id` (`history_user_id`),
  KEY `sap_success_factors_historicalsapsuccessfactorsenterprisecus4cf7` (`id`),
  CONSTRAINT `sap_success_fac_history_user_id_2cd9fa0a2a669e26_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_historicalsapsuccessfactorsenterprisecus80ad`
--

LOCK TABLES `sap_success_factors_historicalsapsuccessfactorsenterprisecus80ad` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_historicalsapsuccessfactorsenterprisecus80ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_historicalsapsuccessfactorsenterprisecus80ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_learnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_learnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` bigint(20) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_learnerdatatransmissionaudit`
--

LOCK TABLES `sap_success_factors_learnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_learnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_learnerdatatransmissionaudit` ENABLE KEYS */;
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
  `sapsf_base_url` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `sapsf_company_id` varchar(255) NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `ce017234bb371f21da2524ecc3c0dbc4` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
  `provider_id` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sap_success_facto_changed_by_id_1afac95cc5c52140_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `sap_success_facto_changed_by_id_1afac95cc5c52140_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `self_paced_selfpacedconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_paced_selfpacedconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enable_course_home_improvements` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `self_paced_selfpa_changed_by_id_62c0bd4c6725fd15_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `self_paced_selfpa_changed_by_id_62c0bd4c6725fd15_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `self_paced_selfpacedconfiguration`
--

LOCK TABLES `self_paced_selfpacedconfiguration` WRITE;
/*!40000 ALTER TABLE `self_paced_selfpacedconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `self_paced_selfpacedconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_certificateitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_certificateitem` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `course_enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `D231cb871868cb92e6ed1ee8e53a1bee` (`course_enrollment_id`),
  KEY `shoppingcart_certificateitem_ea134da7` (`course_id`),
  KEY `shoppingcart_certificateitem_15d61712` (`mode`),
  CONSTRAINT `D231cb871868cb92e6ed1ee8e53a1bee` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `s_orderitem_ptr_id_5127313bc5a09762_fk_shoppingcart_orderitem_id` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_certificateitem`
--

LOCK TABLES `shoppingcart_certificateitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_certificateitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_certificateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_coupon`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `percentage_discount` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_coup_created_by_id_625ade1b541f5324_fk_auth_user_id` (`created_by_id`),
  KEY `shoppingcart_coupon_c1336794` (`code`),
  CONSTRAINT `shoppingcart_coup_created_by_id_625ade1b541f5324_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_coupon`
--

LOCK TABLES `shoppingcart_coupon` WRITE;
/*!40000 ALTER TABLE `shoppingcart_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_couponredemption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_couponredemption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcar_coupon_id_1afa016627ac44bb_fk_shoppingcart_coupon_id` (`coupon_id`),
  KEY `shoppingcart_couponredemption_69dfcb07` (`order_id`),
  KEY `shoppingcart_couponredemption_e8701ad4` (`user_id`),
  CONSTRAINT `shoppingcar_coupon_id_1afa016627ac44bb_fk_shoppingcart_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `shoppingcart_coupon` (`id`),
  CONSTRAINT `shoppingcart__order_id_5ba031c3bfaf643a_fk_shoppingcart_order_id` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_couponredemp_user_id_f5b814b7d92666_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_couponredemption`
--

LOCK TABLES `shoppingcart_couponredemption` WRITE;
/*!40000 ALTER TABLE `shoppingcart_couponredemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_couponredemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregcodeitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregcodeitem` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_courseregcodeitem_ea134da7` (`course_id`),
  KEY `shoppingcart_courseregcodeitem_15d61712` (`mode`),
  CONSTRAINT `s_orderitem_ptr_id_7ca6c1b9c7df7905_fk_shoppingcart_orderitem_id` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregcodeitem`
--

LOCK TABLES `shoppingcart_courseregcodeitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregcodeitemannotation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregcodeitemannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(128) NOT NULL,
  `annotation` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregcodeitemannotation`
--

LOCK TABLES `shoppingcart_courseregcodeitemannotation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitemannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitemannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregistrationcode`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregistrationcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `mode_slug` varchar(100) DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `invoice_id` int(11),
  `order_id` int(11),
  `invoice_item_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `shoppingcart_cour_created_by_id_11125a9667aa01c9_fk_auth_user_id` (`created_by_id`),
  KEY `shoppingcart_courseregistrationcode_ea134da7` (`course_id`),
  KEY `shoppingcart_courseregistrationcode_f1f5d967` (`invoice_id`),
  KEY `shoppingcart_courseregistrationcode_69dfcb07` (`order_id`),
  KEY `shoppingcart_courseregistrationcode_7a471658` (`invoice_item_id`),
  CONSTRAINT `f040030b6361304bd87eb40c09a82094` FOREIGN KEY (`invoice_item_id`) REFERENCES `shoppingcart_courseregistrationcodeinvoiceitem` (`invoiceitem_ptr_id`),
  CONSTRAINT `shoppingc_invoice_id_422f26bdc7c5cb99_fk_shoppingcart_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `shoppingcart__order_id_279d7e2df3fe6b6a_fk_shoppingcart_order_id` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_cour_created_by_id_11125a9667aa01c9_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregistrationcode`
--

LOCK TABLES `shoppingcart_courseregistrationcode` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregistrationcodeinvoiceitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregistrationcodeinvoiceitem` (
  `invoiceitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  PRIMARY KEY (`invoiceitem_ptr_id`),
  KEY `shoppingcart_courseregistrationcodeinvoiceitem_ea134da7` (`course_id`),
  CONSTRAINT `D75797188300cb2dc6a7b16353295aaf` FOREIGN KEY (`invoiceitem_ptr_id`) REFERENCES `shoppingcart_invoiceitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregistrationcodeinvoiceitem`
--

LOCK TABLES `shoppingcart_courseregistrationcodeinvoiceitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcodeinvoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcodeinvoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_donation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_donation` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `donation_type` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_donation_ea134da7` (`course_id`),
  CONSTRAINT `s_orderitem_ptr_id_18caefe119e0bd2f_fk_shoppingcart_orderitem_id` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_donation`
--

LOCK TABLES `shoppingcart_donation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_donationconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_donationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_dona_changed_by_id_10ac60a96e315545_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `shoppingcart_dona_changed_by_id_10ac60a96e315545_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_donationconfiguration`
--

LOCK TABLES `shoppingcart_donationconfiguration` WRITE;
/*!40000 ALTER TABLE `shoppingcart_donationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_donationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_contact_name` varchar(255) NOT NULL,
  `company_contact_email` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `internal_reference` varchar(255) DEFAULT NULL,
  `customer_reference_number` varchar(63) DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoice_c1007e8a` (`company_name`),
  KEY `shoppingcart_invoice_ea134da7` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoice`
--

LOCK TABLES `shoppingcart_invoice` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoicehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoicehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `snapshot` longtext NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingca_invoice_id_e314dc5a906704d_fk_shoppingcart_invoice_id` (`invoice_id`),
  KEY `shoppingcart_invoicehistory_d7e6d55b` (`timestamp`),
  CONSTRAINT `shoppingca_invoice_id_e314dc5a906704d_fk_shoppingcart_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoicehistory`
--

LOCK TABLES `shoppingcart_invoicehistory` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoicehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoicehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoiceitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoiceitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(30,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoiceitem_f1f5d967` (`invoice_id`),
  CONSTRAINT `shoppingc_invoice_id_35828791c8405d01_fk_shoppingcart_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoiceitem`
--

LOCK TABLES `shoppingcart_invoiceitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoicetransaction`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoicetransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `amount` decimal(30,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `comments` longtext,
  `status` varchar(32) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `last_modified_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoi_created_by_id_f5f3d90ce55a145_fk_auth_user_id` (`created_by_id`),
  KEY `shoppingc_invoice_id_66bdbfa6f029288b_fk_shoppingcart_invoice_id` (`invoice_id`),
  KEY `shoppingcar_last_modified_by_id_5e10e433f9576d91_fk_auth_user_id` (`last_modified_by_id`),
  CONSTRAINT `shoppingc_invoice_id_66bdbfa6f029288b_fk_shoppingcart_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `shoppingcar_last_modified_by_id_5e10e433f9576d91_fk_auth_user_id` FOREIGN KEY (`last_modified_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shoppingcart_invoi_created_by_id_f5f3d90ce55a145_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoicetransaction`
--

LOCK TABLES `shoppingcart_invoicetransaction` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(8) NOT NULL,
  `status` varchar(32) NOT NULL,
  `purchase_time` datetime(6) DEFAULT NULL,
  `refunded_time` datetime(6) DEFAULT NULL,
  `bill_to_first` varchar(64) NOT NULL,
  `bill_to_last` varchar(64) NOT NULL,
  `bill_to_street1` varchar(128) NOT NULL,
  `bill_to_street2` varchar(128) NOT NULL,
  `bill_to_city` varchar(64) NOT NULL,
  `bill_to_state` varchar(8) NOT NULL,
  `bill_to_postalcode` varchar(16) NOT NULL,
  `bill_to_country` varchar(64) NOT NULL,
  `bill_to_ccnum` varchar(8) NOT NULL,
  `bill_to_cardtype` varchar(32) NOT NULL,
  `processor_reply_dump` longtext NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_contact_name` varchar(255) DEFAULT NULL,
  `company_contact_email` varchar(255) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `customer_reference_number` varchar(63) DEFAULT NULL,
  `order_type` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_order_user_id_4e1f3e3b06ee22a6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shoppingcart_order_user_id_4e1f3e3b06ee22a6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_order`
--

LOCK TABLES `shoppingcart_order` WRITE;
/*!40000 ALTER TABLE `shoppingcart_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_orderitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(32) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_cost` decimal(30,2) NOT NULL,
  `list_price` decimal(30,2) DEFAULT NULL,
  `line_desc` varchar(1024) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `fulfilled_time` datetime(6) DEFAULT NULL,
  `refund_requested_time` datetime(6) DEFAULT NULL,
  `service_fee` decimal(30,2) NOT NULL,
  `report_comments` longtext NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_orderitem_9acb4454` (`status`),
  KEY `shoppingcart_orderitem_3b927c91` (`fulfilled_time`),
  KEY `shoppingcart_orderitem_76ed2946` (`refund_requested_time`),
  KEY `shoppingcart_orderitem_69dfcb07` (`order_id`),
  KEY `shoppingcart_orderitem_e8701ad4` (`user_id`),
  CONSTRAINT `shoppingcart__order_id_325e5347f18743e3_fk_shoppingcart_order_id` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_orderitem_user_id_5708ec7aabe24a31_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_orderitem`
--

LOCK TABLES `shoppingcart_orderitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_paidcourseregistration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_paidcourseregistration` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `D8d681d7e59c2dcf2ea55e7e5e06553d` (`course_enrollment_id`),
  KEY `shoppingcart_paidcourseregistration_ea134da7` (`course_id`),
  KEY `shoppingcart_paidcourseregistration_15d61712` (`mode`),
  CONSTRAINT `D8d681d7e59c2dcf2ea55e7e5e06553d` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `s_orderitem_ptr_id_3c991acc5d644f13_fk_shoppingcart_orderitem_id` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_paidcourseregistration`
--

LOCK TABLES `shoppingcart_paidcourseregistration` WRITE;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_paidcourseregistrationannotation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_paidcourseregistrationannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(128) NOT NULL,
  `annotation` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_paidcourseregistrationannotation`
--

LOCK TABLES `shoppingcart_paidcourseregistrationannotation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistrationannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistrationannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_registrationcoderedemption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_registrationcoderedemption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redeemed_at` datetime(6) DEFAULT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `redeemed_by_id` int(11) NOT NULL,
  `registration_code_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D6654a8efe686d45804b6116dfc6bee1` (`course_enrollment_id`),
  KEY `shoppingcart_r_order_id_752ddc3003afe96_fk_shoppingcart_order_id` (`order_id`),
  KEY `shoppingcart_reg_redeemed_by_id_455df2dd74004fff_fk_auth_user_id` (`redeemed_by_id`),
  KEY `D1ed44c4be114e424571929bce972f54` (`registration_code_id`),
  CONSTRAINT `D1ed44c4be114e424571929bce972f54` FOREIGN KEY (`registration_code_id`) REFERENCES `shoppingcart_courseregistrationcode` (`id`),
  CONSTRAINT `D6654a8efe686d45804b6116dfc6bee1` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `shoppingcart_r_order_id_752ddc3003afe96_fk_shoppingcart_order_id` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_reg_redeemed_by_id_455df2dd74004fff_fk_auth_user_id` FOREIGN KEY (`redeemed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_registrationcoderedemption`
--

LOCK TABLES `shoppingcart_registrationcoderedemption` WRITE;
/*!40000 ALTER TABLE `shoppingcart_registrationcoderedemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_registrationcoderedemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_siteconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_siteconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `values` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `site_configuration_si_site_id_51c4aa24ab9238cb_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_siteconfiguration`
--

LOCK TABLES `site_configuration_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `site_configuration_siteconfiguration` DISABLE KEYS */;
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
  `values` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_configuration_si_site_id_20c9c1a5f8c3358e_fk_django_site_id` (`site_id`),
  CONSTRAINT `site_configuration_si_site_id_20c9c1a5f8c3358e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_siteconfigurationhistory`
--

LOCK TABLES `site_configuration_siteconfigurationhistory` WRITE;
/*!40000 ALTER TABLE `site_configuration_siteconfigurationhistory` DISABLE KEYS */;
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
  UNIQUE KEY `social_auth_association_server_url_17bf7e87f2968244_uniq` (`server_url`,`handle`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_75f27066d057e3b6_uniq` (`email`,`code`),
  KEY `social_auth_code_c1336794` (`code`)
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
  UNIQUE KEY `social_auth_nonce_server_url_36601f978463b4_uniq` (`server_url`,`timestamp`,`salt`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq` (`provider`,`uid`),
  KEY `social_auth_usersociala_user_id_193b2d80880502b2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersociala_user_id_193b2d80880502b2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `splash_splashconf_changed_by_id_735b38ad8ed19270_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `splash_splashconf_changed_by_id_735b38ad8ed19270_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `static_replace_as_changed_by_id_796c2e5b1bee7027_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `static_replace_as_changed_by_id_796c2e5b1bee7027_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `static_replace_as_changed_by_id_5885827de4f271dc_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `static_replace_as_changed_by_id_5885827de4f271dc_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `status_coursemessage_c8235886` (`course_key`),
  KEY `status_coursemessage_ba4cddbf` (`global_message_id`),
  CONSTRAINT `be73d6672c3000f87521c37bc8ad4139` FOREIGN KEY (`global_message_id`) REFERENCES `status_globalstatusmessage` (`id`)
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
  KEY `status_globalstat_changed_by_id_76ab1cf17be5644d_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `status_globalstat_changed_by_id_76ab1cf17be5644d_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_anonymoususerid_user_id_1a18af72cf6b95f7_fk_auth_user_id` (`user_id`),
  KEY `student_anonymoususerid_ea134da7` (`course_id`),
  CONSTRAINT `student_anonymoususerid_user_id_1a18af72cf6b95f7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_anonymoususerid` ENABLE KEYS */;
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
  UNIQUE KEY `student_courseaccessrole_user_id_3203176c4f474414_uniq` (`user_id`,`org`,`course_id`,`role`),
  KEY `student_courseaccessrole_5a445d71` (`org`),
  KEY `student_courseaccessrole_ea134da7` (`course_id`),
  KEY `student_courseaccessrole_29a7e964` (`role`),
  CONSTRAINT `student_courseaccessrol_user_id_5e0f68b978ad0792_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `student_courseenrollment_user_id_2d2a572f07dd8e37_uniq` (`user_id`,`course_id`),
  KEY `student_courseenrollment_ea134da7` (`course_id`),
  KEY `student_courseenrollment_e2fa5388` (`created`),
  CONSTRAINT `student_courseenrollmen_user_id_15beaaebc8333ce4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollmentallowed_email_6f3eafd4a6c58591_uniq` (`email`,`course_id`),
  KEY `student_courseenrollmentallowed_0c83f57c` (`email`),
  KEY `student_courseenrollmentallowed_ea134da7` (`course_id`),
  KEY `student_courseenrollmentallowed_e2fa5388` (`created`)
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
  KEY `stu_enrollment_id_674188e6fcb084c_fk_student_courseenrollment_id` (`enrollment_id`),
  CONSTRAINT `stu_enrollment_id_674188e6fcb084c_fk_student_courseenrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
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
  KEY `student_dashboard_changed_by_id_4db1e1194c4ae32c_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_dashboard_changed_by_id_4db1e1194c4ae32c_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_enrollmen_changed_by_id_59c187ac05e64a11_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_enrollmen_changed_by_id_59c187ac05e64a11_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `student_entranceexamconfiguration_user_id_714c2ef6a88504f0_uniq` (`user_id`,`course_id`),
  KEY `student_entranceexamconfiguration_ea134da7` (`course_id`),
  KEY `student_entranceexamconfiguration_e2fa5388` (`created`),
  KEY `student_entranceexamconfiguration_0f81d52e` (`updated`),
  CONSTRAINT `student_entranceexamcon_user_id_530195af5babe0dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `student_historicalcourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_historicalcourseenrollment` (
  `id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `student_histori_history_user_id_49fd2870709a6441_fk_auth_user_id` (`history_user_id`),
  KEY `student_historicalcourseenrollment_b80bb774` (`id`),
  KEY `student_historicalcourseenrollment_ea134da7` (`course_id`),
  KEY `student_historicalcourseenrollment_e2fa5388` (`created`),
  CONSTRAINT `student_histori_history_user_id_49fd2870709a6441_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_historicalcourseenrollment`
--

LOCK TABLES `student_historicalcourseenrollment` WRITE;
/*!40000 ALTER TABLE `student_historicalcourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_historicalcourseenrollment` ENABLE KEYS */;
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
  UNIQUE KEY `student_languageproficiency_code_68e76171684c62e5_uniq` (`code`,`user_profile_id`),
  KEY `student_languageproficiency_06037614` (`user_profile_id`),
  CONSTRAINT `student__user_profile_id_283edb437b102619_fk_auth_userprofile_id` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
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
  `dashboard_tracking_code` longtext NOT NULL,
  `trk_partner_name` varchar(10) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_linkedina_changed_by_id_226a4de3af0f3296_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_linkedina_changed_by_id_226a4de3af0f3296_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_loginfailures_user_id_3daac39f3118bac4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_loginfailures_user_id_3daac39f3118bac4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `student_logoutviewconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_logoutviewconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_logoutvie_changed_by_id_71e69e1e508e4fce_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_logoutvie_changed_by_id_71e69e1e508e4fce_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_logoutviewconfiguration`
--

LOCK TABLES `student_logoutviewconfiguration` WRITE;
/*!40000 ALTER TABLE `student_logoutviewconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_logoutviewconfiguration` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `student_manualenr_enrolled_by_id_729cecdc9f746e2_fk_auth_user_id` (`enrolled_by_id`),
  KEY `st_enrollment_id_60349e74284df0d6_fk_student_courseenrollment_id` (`enrollment_id`),
  KEY `student_manualenrollmentaudit_ce9e7289` (`enrolled_email`),
  CONSTRAINT `st_enrollment_id_60349e74284df0d6_fk_student_courseenrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `student_manualenr_enrolled_by_id_729cecdc9f746e2_fk_auth_user_id` FOREIGN KEY (`enrolled_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `student_passwordhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_passwordhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `time_set` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_passwordhistory_user_id_21328c8c512d6c0d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_passwordhistory_user_id_21328c8c512d6c0d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_passwordhistory`
--

LOCK TABLES `student_passwordhistory` WRITE;
/*!40000 ALTER TABLE `student_passwordhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_passwordhistory` ENABLE KEYS */;
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
  KEY `student_pendingemailchange_a4a65cd1` (`new_email`),
  CONSTRAINT `student_pendingemailcha_user_id_566caccc3f3c3966_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `student_pendingnamechan_user_id_6c3c9d77fc5898a6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_registrati_changed_by_id_7c813444cd41f76_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_registrati_changed_by_id_7c813444cd41f76_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `student_userattribute_user_id_395f02bcb61d19c1_uniq` (`user_id`,`name`),
  KEY `student_userattribute_name_5fd741d8c66ce242_uniq` (`name`),
  CONSTRAINT `student_userattribute_user_id_1d4fc3ed612e93e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `student_usersignupsource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usersignupsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usersignupsourc_user_id_4db69fdecf32119f_fk_auth_user_id` (`user_id`),
  KEY `student_usersignupsource_98defd6e` (`site`),
  CONSTRAINT `student_usersignupsourc_user_id_4db69fdecf32119f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_userstand_changed_by_id_23784b83f2849aff_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_userstand_changed_by_id_23784b83f2849aff_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_userstanding_user_id_6bb90abaaa05d42e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `student_usertestgroup_b068931c` (`name`)
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
  UNIQUE KEY `usertestgroup_id` (`usertestgroup_id`,`user_id`),
  KEY `student_usertestgroup_u_user_id_26c886de60cceacb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `st_usertestgroup_id_3d634741f1dd4e4f_fk_student_usertestgroup_id` FOREIGN KEY (`usertestgroup_id`) REFERENCES `student_usertestgroup` (`id`),
  CONSTRAINT `student_usertestgroup_u_user_id_26c886de60cceacb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `submission_id` int(11),
  PRIMARY KEY (`id`),
  KEY `submissions_score_fde81f11` (`created_at`),
  KEY `submissions_score_02d5e83e` (`student_item_id`),
  KEY `submissions_score_1dd9cfcc` (`submission_id`),
  CONSTRAINT `s_student_item_id_7d4d4bb6a7dd0642_fk_submissions_studentitem_id` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `subm_submission_id_3fc975fe88442ff7_fk_submissions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions_submission` (`id`)
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
  KEY `submissions_sc_score_id_7b5ef248552cb857_fk_submissions_score_id` (`score_id`),
  KEY `submissions_scoreannotation_fd685234` (`annotation_type`),
  KEY `submissions_scoreannotation_ee243325` (`creator`),
  CONSTRAINT `submissions_sc_score_id_7b5ef248552cb857_fk_submissions_score_id` FOREIGN KEY (`score_id`) REFERENCES `submissions_score` (`id`)
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
  KEY `submissions__highest_id_7fd91b8eb312c175_fk_submissions_score_id` (`highest_id`),
  KEY `submissions_s_latest_id_2b352506a35fd569_fk_submissions_score_id` (`latest_id`),
  CONSTRAINT `s_student_item_id_32fa0a425a149b1b_fk_submissions_studentitem_id` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submissions__highest_id_7fd91b8eb312c175_fk_submissions_score_id` FOREIGN KEY (`highest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `submissions_s_latest_id_2b352506a35fd569_fk_submissions_score_id` FOREIGN KEY (`latest_id`) REFERENCES `submissions_score` (`id`)
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
  UNIQUE KEY `submissions_studentitem_course_id_6a6eccbdec6ffd0b_uniq` (`course_id`,`student_id`,`item_id`),
  KEY `submissions_studentitem_30a811f6` (`student_id`),
  KEY `submissions_studentitem_ea134da7` (`course_id`),
  KEY `submissions_studentitem_82bfda79` (`item_id`)
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
  `uuid` varchar(36) NOT NULL,
  `attempt_number` int(10) unsigned NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `raw_answer` longtext NOT NULL,
  `student_item_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `su_student_item_id_d3801ff833d05b1_fk_submissions_studentitem_id` (`student_item_id`),
  KEY `submissions_submission_ef7c876f` (`uuid`),
  KEY `submissions_submission_22bb6ff9` (`submitted_at`),
  KEY `submissions_submission_fde81f11` (`created_at`),
  CONSTRAINT `su_student_item_id_d3801ff833d05b1_fk_submissions_studentitem_id` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`)
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
  KEY `survey_surveyanswer_73f329f1` (`field_name`),
  KEY `survey_surveyanswer_c8235886` (`course_key`),
  KEY `survey_surveyanswer_d6cba1ad` (`form_id`),
  KEY `survey_surveyanswer_e8701ad4` (`user_id`),
  CONSTRAINT `survey_surveyan_form_id_1c835afe12a54912_fk_survey_surveyform_id` FOREIGN KEY (`form_id`) REFERENCES `survey_surveyform` (`id`),
  CONSTRAINT `survey_surveyanswer_user_id_4e77d83a82fd0b2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `tagging_tagavailablevalues`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tagavailablevalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tagavailablevalues_b583a629` (`category_id`),
  CONSTRAINT `tagging_category_id_40780d45c76e4f97_fk_tagging_tagcategories_id` FOREIGN KEY (`category_id`) REFERENCES `tagging_tagcategories` (`id`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_id` (`team_id`),
  UNIQUE KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `teams_courseteam_b068931c` (`name`),
  KEY `teams_courseteam_ea134da7` (`course_id`),
  KEY `teams_courseteam_19b4d727` (`topic_id`),
  KEY `teams_courseteam_5ea53fcc` (`last_activity_at`),
  KEY `teams_courseteam_181d83a1` (`team_size`)
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
  UNIQUE KEY `teams_courseteammembership_user_id_48efa8e8971947c3_uniq` (`user_id`,`team_id`),
  KEY `teams_courseteam_team_id_594700d19b04f922_fk_teams_courseteam_id` (`team_id`),
  CONSTRAINT `teams_courseteam_team_id_594700d19b04f922_fk_teams_courseteam_id` FOREIGN KEY (`team_id`) REFERENCES `teams_courseteam` (`id`),
  CONSTRAINT `teams_courseteammembers_user_id_2d93b28be22c3c40_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `theming_sitetheme_site_id_4fccdacaebfeb01f_fk_django_site_id` (`site_id`),
  CONSTRAINT `theming_sitetheme_site_id_4fccdacaebfeb01f_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  `icon_class` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `secondary` tinyint(1) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `lti_consumer_key` varchar(255) NOT NULL,
  `lti_hostname` varchar(255) NOT NULL,
  `lti_consumer_secret` varchar(255) NOT NULL,
  `lti_max_timestamp_age` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `icon_image` varchar(100) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `drop_existing_session` tinyint(1) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth__changed_by_id_7749e09fd5f71ab0_fk_auth_user_id` (`changed_by_id`),
  KEY `third_party_auth_ltiproviderconfig_fe8da584` (`lti_hostname`),
  KEY `third_party_auth_ltiproviderconfig_9365d6e7` (`site_id`),
  CONSTRAINT `third_party_auth__changed_by_id_7749e09fd5f71ab0_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_ltip_site_id_30e45357dbe462db_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  `provider_slug` varchar(30) NOT NULL,
  `site_id` int(11) NOT NULL,
  `drop_existing_session` tinyint(1) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth__changed_by_id_17044d1cd96e8d57_fk_auth_user_id` (`changed_by_id`),
  KEY `third_party_auth_oauth2providerconfig_abcd61c0` (`backend_name`),
  KEY `third_party_auth_oauth2providerconfig_24b8e178` (`provider_slug`),
  KEY `third_party_auth_oauth2providerconfig_9365d6e7` (`site_id`),
  CONSTRAINT `third_party_auth__changed_by_id_17044d1cd96e8d57_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_oaut_site_id_3f77f0fe311b6f5c_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
-- Table structure for table `third_party_auth_providerapipermissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_providerapipermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth__client_id_648d3f6d6109693b_fk_oauth2_client_id` (`client_id`),
  CONSTRAINT `third_party_auth__client_id_648d3f6d6109693b_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_providerapipermissions`
--

LOCK TABLES `third_party_auth_providerapipermissions` WRITE;
/*!40000 ALTER TABLE `third_party_auth_providerapipermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_providerapipermissions` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `third_party_auth__changed_by_id_67a92ed1a69a5d1f_fk_auth_user_id` (`changed_by_id`),
  KEY `third_party_auth_samlconfiguration_9365d6e7` (`site_id`),
  CONSTRAINT `third_party_auth__changed_by_id_67a92ed1a69a5d1f_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_saml_site_id_108365f249ed6aac_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  `idp_slug` varchar(30) NOT NULL,
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
  `drop_existing_session` tinyint(1) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth__changed_by_id_508190ecd0b0e845_fk_auth_user_id` (`changed_by_id`),
  KEY `third_party_auth_samlproviderconfig_098674f1` (`idp_slug`),
  KEY `third_party_auth_samlproviderconfig_9365d6e7` (`site_id`),
  CONSTRAINT `third_party_auth__changed_by_id_508190ecd0b0e845_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_saml_site_id_625158ae0a405970_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  KEY `third_party_auth_samlproviderdata_d674fcb7` (`fetched_at`),
  KEY `third_party_auth_samlproviderdata_81aefa79` (`expires_at`),
  KEY `third_party_auth_samlproviderdata_dffc4713` (`entity_id`)
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
-- Table structure for table `track_trackinglog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_trackinglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtcreated` datetime(6) NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `event_source` varchar(32) NOT NULL,
  `event_type` varchar(512) NOT NULL,
  `event` longtext NOT NULL,
  `agent` varchar(256) NOT NULL,
  `page` varchar(512) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `host` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_trackinglog`
--

LOCK TABLES `track_trackinglog` WRITE;
/*!40000 ALTER TABLE `track_trackinglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_trackinglog` ENABLE KEYS */;
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
  UNIQUE KEY `user_api_usercoursetag_user_id_64d9a32c9890f610_uniq` (`user_id`,`course_id`,`key`),
  KEY `user_api_usercoursetag_3c6e0b8a` (`key`),
  KEY `user_api_usercoursetag_ea134da7` (`course_id`),
  CONSTRAINT `user_api_usercoursetag_user_id_2692245bbb861fc2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_api_userorgtag_user_id_694f9e3322120c6f_uniq` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_3c6e0b8a` (`key`),
  KEY `user_api_userorgtag_5a445d71` (`org`),
  CONSTRAINT `user_api_userorgtag_user_id_16c7189496b4df00_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_api_userpreference_user_id_4e4942d73f760072_uniq` (`user_id`,`key`),
  KEY `user_api_userpreference_3c6e0b8a` (`key`),
  CONSTRAINT `user_api_userpreference_user_id_41f12e3954b69095_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `url` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `user_tasks_usertaskartifact_dc91ed4b` (`status_id`),
  CONSTRAINT `user__status_id_265997facac95070_fk_user_tasks_usertaskstatus_id` FOREIGN KEY (`status_id`) REFERENCES `user_tasks_usertaskstatus` (`id`)
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
  KEY `user__parent_id_2a1a586c3c2ac2a4_fk_user_tasks_usertaskstatus_id` (`parent_id`),
  KEY `user_tasks_usertaskstat_user_id_5ceae753d027017b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user__parent_id_2a1a586c3c2ac2a4_fk_user_tasks_usertaskstatus_id` FOREIGN KEY (`parent_id`) REFERENCES `user_tasks_usertaskstatus` (`id`),
  CONSTRAINT `user_tasks_usertaskstat_user_id_5ceae753d027017b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `util_ratelimitcon_changed_by_id_2c8891cb4854f3b5_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `util_ratelimitcon_changed_by_id_2c8891cb4854f3b5_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `util_ratelimitconfiguration`
--

LOCK TABLES `util_ratelimitconfiguration` WRITE;
/*!40000 ALTER TABLE `util_ratelimitconfiguration` DISABLE KEYS */;
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2017-06-20 20:17:41.672235',1,NULL);
/*!40000 ALTER TABLE `util_ratelimitconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified_track_content_verifiedtrackcohortedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified_track_content_verifiedtrackcohortedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `verified_cohort_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified_track_content_verifiedtrackcohortedcourse`
--

LOCK TABLES `verified_track_content_verifiedtrackcohortedcourse` WRITE;
/*!40000 ALTER TABLE `verified_track_content_verifiedtrackcohortedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `verified_track_content_verifiedtrackcohortedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_historicalverificationdeadline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_historicalverificationdeadline` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `deadline_is_explicit` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `verify_student__history_user_id_1e374d24cb7902c2_fk_auth_user_id` (`history_user_id`),
  KEY `verify_student_historicalverificationdeadline_b80bb774` (`id`),
  KEY `verify_student_historicalverificationdeadline_c8235886` (`course_key`),
  CONSTRAINT `verify_student__history_user_id_1e374d24cb7902c2_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_historicalverificationdeadline`
--

LOCK TABLES `verify_student_historicalverificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_historicalverificationdeadline` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_historicalverificationdeadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_icrvstatusemailsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_icrvstatusemailsconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_icr_changed_by_id_52e319582f18ea3_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `verify_student_icr_changed_by_id_52e319582f18ea3_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_icrvstatusemailsconfiguration`
--

LOCK TABLES `verify_student_icrvstatusemailsconfiguration` WRITE;
/*!40000 ALTER TABLE `verify_student_icrvstatusemailsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_icrvstatusemailsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_incoursereverificationconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_incoursereverificationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_in_changed_by_id_1f3e3fa462a6ded6_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `verify_student_in_changed_by_id_1f3e3fa462a6ded6_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_incoursereverificationconfiguration`
--

LOCK TABLES `verify_student_incoursereverificationconfiguration` WRITE;
/*!40000 ALTER TABLE `verify_student_incoursereverificationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_incoursereverificationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_skippedreverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_skippedreverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `checkpoint_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verify_student_skippedreverificati_user_id_1e8af5a5e735aa1a_uniq` (`user_id`,`course_id`),
  KEY `verify_student_skippedreverification_ea134da7` (`course_id`),
  KEY `verify_student_skippedreverification_bef2d98a` (`checkpoint_id`),
  KEY `verify_student_skippedreverification_e8701ad4` (`user_id`),
  CONSTRAINT `D759ffa5ca66ef1a2c8c200f7a21365b` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`),
  CONSTRAINT `verify_student_skippedr_user_id_6752b392e3d3c501_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_skippedreverification`
--

LOCK TABLES `verify_student_skippedreverification` WRITE;
/*!40000 ALTER TABLE `verify_student_skippedreverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_skippedreverification` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `D01dce17b91c9382bd80d4be23a3e0cf` (`copy_id_photo_from_id`),
  KEY `verify_studen_reviewing_user_id_727fae1d0bcf8aaf_fk_auth_user_id` (`reviewing_user_id`),
  KEY `verify_student_software_user_id_61ffab9c12020106_fk_auth_user_id` (`user_id`),
  KEY `verify_student_softwaresecurephotoverification_f6fc3014` (`receipt_id`),
  KEY `verify_student_softwaresecurephotoverification_fde81f11` (`created_at`),
  KEY `verify_student_softwaresecurephotoverification_afd1a1a8` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_ebf78b51` (`display`),
  KEY `verify_student_softwaresecurephotoverification_22bb6ff9` (`submitted_at`),
  CONSTRAINT `D01dce17b91c9382bd80d4be23a3e0cf` FOREIGN KEY (`copy_id_photo_from_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`),
  CONSTRAINT `verify_studen_reviewing_user_id_727fae1d0bcf8aaf_fk_auth_user_id` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `verify_student_software_user_id_61ffab9c12020106_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `verify_student_verificationcheckpoint`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationcheckpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `checkpoint_location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verify_student_verificationcheck_course_id_2c6a1f5c22b4cc19_uniq` (`course_id`,`checkpoint_location`),
  KEY `verify_student_verificationcheckpoint_ea134da7` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationcheckpoint`
--

LOCK TABLES `verify_student_verificationcheckpoint` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationcheckpoint_photo_verification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationcheckpoint_photo_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verificationcheckpoint_id` int(11) NOT NULL,
  `softwaresecurephotoverification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `verificationcheckpoint_id` (`verificationcheckpoint_id`,`softwaresecurephotoverification_id`),
  KEY `c7846aea49a044a1161a4b9b6d70e050` (`softwaresecurephotoverification_id`),
  CONSTRAINT `c7846aea49a044a1161a4b9b6d70e050` FOREIGN KEY (`softwaresecurephotoverification_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`),
  CONSTRAINT `e4d180f9ca43c3b66693c416a36cfb9d` FOREIGN KEY (`verificationcheckpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationcheckpoint_photo_verification`
--

LOCK TABLES `verify_student_verificationcheckpoint_photo_verification` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint_photo_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationcheckpoint_photo_verification` ENABLE KEYS */;
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
-- Table structure for table `verify_student_verificationstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(32) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `response` longtext,
  `error` longtext,
  `checkpoint_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D4cefb6d3d71c9b26af2a5ece4c37277` (`checkpoint_id`),
  KEY `verify_student_verifica_user_id_5c19fcd6dc05f211_fk_auth_user_id` (`user_id`),
  KEY `verify_student_verificationstatus_9acb4454` (`status`),
  CONSTRAINT `D4cefb6d3d71c9b26af2a5ece4c37277` FOREIGN KEY (`checkpoint_id`) REFERENCES `verify_student_verificationcheckpoint` (`id`),
  CONSTRAINT `verify_student_verifica_user_id_5c19fcd6dc05f211_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationstatus`
--

LOCK TABLES `verify_student_verificationstatus` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_verificationstatus` ENABLE KEYS */;
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
  KEY `video_config_cour_changed_by_id_28b01cb29cfcd9a2_fk_auth_user_id` (`changed_by_id`),
  KEY `video_config_coursehlsplaybackenabledflag_ea134da7` (`course_id`),
  CONSTRAINT `video_config_cour_changed_by_id_28b01cb29cfcd9a2_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `video_config_hlsp_changed_by_id_15b74d899e55b62b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `video_config_hlsp_changed_by_id_15b74d899e55b62b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `waffle_flag_e2fa5388` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
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
  UNIQUE KEY `flag_id` (`flag_id`,`group_id`),
  KEY `waffle_flag_groups_group_id_1d214ce64ae3698d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `waffle_flag_groups_flag_id_3d040eff1615da33_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_groups_group_id_1d214ce64ae3698d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `flag_id` (`flag_id`,`user_id`),
  KEY `waffle_flag_users_user_id_3c8ba20de859cb5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `waffle_flag_users_flag_id_fe9e88f3072acde_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_users_user_id_3c8ba20de859cb5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `waffle_sample_e2fa5388` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `waffle_switch_e2fa5388` (`created`)
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
  PRIMARY KEY (`id`),
  KEY `waffle_utils_waff_changed_by_id_3b230839b4c20581_fk_auth_user_id` (`changed_by_id`),
  KEY `waffle_utils_waffleflagcourseoverridemodel_6690e26e` (`waffle_flag`),
  KEY `waffle_utils_waffleflagcourseoverridemodel_ea134da7` (`course_id`),
  CONSTRAINT `waffle_utils_waff_changed_by_id_3b230839b4c20581_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  `current_revision_id` int(11),
  `group_id` int(11),
  `owner_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  KEY `wiki_article_0e939a4f` (`group_id`),
  KEY `wiki_article_5e7b1936` (`owner_id`),
  CONSTRAINT `current_revision_id_42a9dbec1e0dd15c_fk_wiki_articlerevision_id` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_article_group_id_2b38601b6aa39f3d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wiki_article_owner_id_b1c1e44609a378f_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `wiki_articleforobject_content_type_id_27c4cce189b3bcab_uniq` (`content_type_id`,`object_id`),
  KEY `wiki_articleforobj_article_id_6effcfadf020e71_fk_wiki_article_id` (`article_id`),
  CONSTRAINT `wiki__content_type_id_6a39c68b7a20c3c4_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wiki_articleforobj_article_id_6effcfadf020e71_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
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
  KEY `wiki_articleplugin_a00c1b00` (`article_id`),
  CONSTRAINT `wiki_articleplugi_article_id_2d2c794af030d9dd_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
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
  UNIQUE KEY `wiki_articlerevision_article_id_4b4e7910c8e7b2d0_uniq` (`article_id`,`revision_number`),
  KEY `fae2b1c6e892c699844d5dda69aeb89e` (`previous_revision_id`),
  KEY `wiki_articlerevision_user_id_183520686b6ead55_fk_auth_user_id` (`user_id`),
  CONSTRAINT `fae2b1c6e892c699844d5dda69aeb89e` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_articlerevis_article_id_1f2c587981af1463_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_articlerevision_user_id_183520686b6ead55_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `wiki_attachment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_attachment` (
  `reusableplugin_ptr_id` int(11) NOT NULL,
  `original_filename` varchar(256) DEFAULT NULL,
  `current_revision_id` int(11),
  PRIMARY KEY (`reusableplugin_ptr_id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  CONSTRAINT `D32d32ecb0471dc863a4e19562842024` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_attachmentrevision` (`id`),
  CONSTRAINT `D7d9a9637c738daa9daff735f9023fbe` FOREIGN KEY (`reusableplugin_ptr_id`) REFERENCES `wiki_reusableplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_attachment`
--

LOCK TABLES `wiki_attachment` WRITE;
/*!40000 ALTER TABLE `wiki_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_attachmentrevision`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_attachmentrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `previous_revision_id` int(11),
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `wiki_attachmentrevision_07ba63f5` (`attachment_id`),
  KEY `wiki_attachmentrevision_e8680b8a` (`previous_revision_id`),
  KEY `wiki_attachmentrevision_e8701ad4` (`user_id`),
  CONSTRAINT `D68d5cd540b66f536228137e518081f8` FOREIGN KEY (`attachment_id`) REFERENCES `wiki_attachment` (`reusableplugin_ptr_id`),
  CONSTRAINT `D8c1f0a8f0ddceb9c3ebc94379fe22c9` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_attachmentrevision` (`id`),
  CONSTRAINT `wiki_attachmentrevision_user_id_427e3f452b4bfdcd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_attachmentrevision`
--

LOCK TABLES `wiki_attachmentrevision` WRITE;
/*!40000 ALTER TABLE `wiki_attachmentrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_attachmentrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_image`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_image` (
  `revisionplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`revisionplugin_ptr_id`),
  CONSTRAINT `D243c0b311b744e834d2b1ee4d22fc5f` FOREIGN KEY (`revisionplugin_ptr_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_image`
--

LOCK TABLES `wiki_image` WRITE;
/*!40000 ALTER TABLE `wiki_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_imagerevision`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_imagerevision` (
  `revisionpluginrevision_ptr_id` int(11) NOT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`revisionpluginrevision_ptr_id`),
  CONSTRAINT `fcc7a25da8b3b9e0494c126ccf17852e` FOREIGN KEY (`revisionpluginrevision_ptr_id`) REFERENCES `wiki_revisionpluginrevision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_imagerevision`
--

LOCK TABLES `wiki_imagerevision` WRITE;
/*!40000 ALTER TABLE `wiki_imagerevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_imagerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  CONSTRAINT `w_articleplugin_ptr_id_657a603b3f46a3e3_fk_wiki_articleplugin_id` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
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
  UNIQUE KEY `reusableplugin_id` (`reusableplugin_id`,`article_id`),
  KEY `wiki_reusableplug_article_id_5e893d3b3fb4f7fa_fk_wiki_article_id` (`article_id`),
  CONSTRAINT `a9f9f50fd4e8fdafe7ffc0c1a145fee3` FOREIGN KEY (`reusableplugin_id`) REFERENCES `wiki_reusableplugin` (`articleplugin_ptr_id`),
  CONSTRAINT `wiki_reusableplug_article_id_5e893d3b3fb4f7fa_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
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
  `current_revision_id` int(11),
  PRIMARY KEY (`articleplugin_ptr_id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  CONSTRAINT `D03d76148e98b4bc99e3137189894366` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`),
  CONSTRAINT `w_articleplugin_ptr_id_35fa87d70e9722a1_fk_wiki_articleplugin_id` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
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
  `previous_revision_id` int(11),
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `wiki_revisionpluginrevision_b25eaab4` (`plugin_id`),
  KEY `wiki_revisionpluginrevision_e8680b8a` (`previous_revision_id`),
  KEY `wiki_revisionpluginrevision_e8701ad4` (`user_id`),
  CONSTRAINT `D9574e2f57b828a85a24838761473871` FOREIGN KEY (`plugin_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`),
  CONSTRAINT `e524c4f887e857f93c39356f7cf7d4df` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`),
  CONSTRAINT `wiki_revisionpluginrevi_user_id_55a00bd0e2532762_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `w_article_revision_id_8be41c856aa0285_fk_wiki_articlerevision_id` (`article_revision_id`),
  CONSTRAINT `w_article_revision_id_8be41c856aa0285_fk_wiki_articlerevision_id` FOREIGN KEY (`article_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `w_articleplugin_ptr_id_36e661324cc27ff2_fk_wiki_articleplugin_id` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
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
  UNIQUE KEY `wiki_urlpath_site_id_124f6aa7b2cc9b82_uniq` (`site_id`,`parent_id`,`slug`),
  KEY `wiki_urlpath_article_id_1d1c5eb9a64e1390_fk_wiki_article_id` (`article_id`),
  KEY `wiki_urlpath_2dbcba41` (`slug`),
  KEY `wiki_urlpath_caf7cc51` (`lft`),
  KEY `wiki_urlpath_3cfbd988` (`rght`),
  KEY `wiki_urlpath_656442a0` (`tree_id`),
  KEY `wiki_urlpath_c9e9a848` (`level`),
  KEY `wiki_urlpath_6be37982` (`parent_id`),
  CONSTRAINT `wiki_urlpath_article_id_1d1c5eb9a64e1390_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_urlpath_parent_id_24eab80cd168595f_fk_wiki_urlpath_id` FOREIGN KEY (`parent_id`) REFERENCES `wiki_urlpath` (`id`),
  CONSTRAINT `wiki_urlpath_site_id_4f30e731b0464e80_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  `uuid` varchar(36) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `workflow_assessmentworkflow_ea134da7` (`course_id`),
  KEY `workflow_assessmentworkflow_82bfda79` (`item_id`)
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
  KEY `w_workflow_id_581d7b320743ff70_fk_workflow_assessmentworkflow_id` (`workflow_id`),
  KEY `workflow_assessmentworkflowcancellation_195d4285` (`cancelled_by_id`),
  KEY `workflow_assessmentworkflowcancellation_fde81f11` (`created_at`),
  CONSTRAINT `w_workflow_id_581d7b320743ff70_fk_workflow_assessmentworkflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `w_workflow_id_4939c36cf6220ba3_fk_workflow_assessmentworkflow_id` (`workflow_id`),
  CONSTRAINT `w_workflow_id_4939c36cf6220ba3_fk_workflow_assessmentworkflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
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
  KEY `xblock_config_cou_changed_by_id_124d91bd160908dd_fk_auth_user_id` (`changed_by_id`),
  KEY `xblock_config_courseeditltifieldsenabledflag_ea134da7` (`course_id`),
  CONSTRAINT `xblock_config_cou_changed_by_id_124d91bd160908dd_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `xblock_config_stu_changed_by_id_58f0a899052499fd_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `xblock_config_stu_changed_by_id_58f0a899052499fd_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `xblock_django_xbl_changed_by_id_61068ae9f50d6490_fk_auth_user_id` (`changed_by_id`),
  KEY `xblock_django_xblockconfiguration_b068931c` (`name`),
  CONSTRAINT `xblock_django_xbl_changed_by_id_61068ae9f50d6490_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `xblock_django_xblo_changed_by_id_353d5def0d11370_fk_auth_user_id` (`changed_by_id`),
  KEY `xblock_django_xblockstudioconfiguration_b068931c` (`name`),
  CONSTRAINT `xblock_django_xblo_changed_by_id_353d5def0d11370_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `xblock_django_xbl_changed_by_id_11457ce96bbbfbf6_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `xblock_django_xbl_changed_by_id_11457ce96bbbfbf6_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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

-- Dump completed on 2017-06-20 20:30:44
