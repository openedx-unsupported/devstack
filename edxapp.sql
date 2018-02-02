-- MySQL dump 10.13  Distrib 5.6.39, for Linux (x86_64)
--
-- Host: localhost    Database: edxapp
-- ------------------------------------------------------
-- Server version	5.6.39

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
  `option_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterion`
--

LOCK TABLES `assessment_criterion` WRITE;
/*!40000 ALTER TABLE `assessment_criterion` DISABLE KEYS */;
INSERT INTO `assessment_criterion` VALUES (1,'Content','Content',0,'Did the response describe a meal and did it describe why someone should chose to eat it?',1),(2,'Organization & Clarity','Organization & Clarity',1,'How well did the response use language?',1),(3,'Persuasiveness','Persuasiveness',2,'How well did the response convince you to try the meal that it describes?',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterionoption`
--

LOCK TABLES `assessment_criterionoption` WRITE;
/*!40000 ALTER TABLE `assessment_criterionoption` DISABLE KEYS */;
INSERT INTO `assessment_criterionoption` VALUES (1,0,0,'Off Topic','Off Topic','The essay is off-topic or does not answer all or part of the question.',1),(2,1,5,'No Explanation','No Explanation','A meal is described, but no argument is made to persuade the reader to try it.',1),(3,2,5,'Unclear recommendation','Unclear recommendation','A meal is not described, but an argument is made to persuade the reader to try it.',1),(4,3,10,'Persuasive recommendation','Persuasive recommendation','The essay give a good description of the meal and provides supporting reasons for trying the meal.',1),(5,0,0,'Confusing','Confusing','It is difficult to identify the argument and main idea.',2),(6,1,1,'Basic Structure','Basic Structure','The essay provides a main idea. Additional details are provided, and some support the main idea.',2),(7,2,2,'Clear Structure','Clear Structure','The essay provides a clear main idea supported by specific details.',2),(8,3,3,'Complete Structure','Complete Structure','The essay has a complete structure: an introduction, statement of main idea, supporting details and summary.',2),(9,0,0,'Unconvincing','Unconvincing','The author did not present a persuasive argument, and I have no interest in trying this meal.',3),(10,1,2,'Interesting','Interesting','The author’s argument was somewhat persuarsive. I need more information to consider trying this meal.',3),(11,2,4,'Persuasive','Persuasive','The author’s argument was persuasive, and I will consider trying the meal.',3),(12,3,6,'Inspiring','Inspiring','The author presented an exceptionally strong case and has convinced me to try the meal.',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_rubric`
--

LOCK TABLES `assessment_rubric` WRITE;
/*!40000 ALTER TABLE `assessment_rubric` DISABLE KEYS */;
INSERT INTO `assessment_rubric` VALUES (1,'b2783932b715f500b0af5f2e0d80757e54301353','ab95e8c199881793b6999c5efb1a5754fd7417d5');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (6,1,695),(4,1,696),(5,1,697);
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
) ENGINE=InnoDB AUTO_INCREMENT=1143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',2,'add_permission'),(2,'Can change permission',2,'change_permission'),(3,'Can delete permission',2,'delete_permission'),(4,'Can add group',3,'add_group'),(5,'Can change group',3,'change_group'),(6,'Can delete group',3,'delete_group'),(7,'Can add user',4,'add_user'),(8,'Can change user',4,'change_user'),(9,'Can delete user',4,'delete_user'),(10,'Can add content type',5,'add_contenttype'),(11,'Can change content type',5,'change_contenttype'),(12,'Can delete content type',5,'delete_contenttype'),(13,'Can add redirect',6,'add_redirect'),(14,'Can change redirect',6,'change_redirect'),(15,'Can delete redirect',6,'delete_redirect'),(16,'Can add session',7,'add_session'),(17,'Can change session',7,'change_session'),(18,'Can delete session',7,'delete_session'),(19,'Can add site',8,'add_site'),(20,'Can change site',8,'change_site'),(21,'Can delete site',8,'delete_site'),(22,'Can add task state',9,'add_taskmeta'),(23,'Can change task state',9,'change_taskmeta'),(24,'Can delete task state',9,'delete_taskmeta'),(25,'Can add saved group result',10,'add_tasksetmeta'),(26,'Can change saved group result',10,'change_tasksetmeta'),(27,'Can delete saved group result',10,'delete_tasksetmeta'),(28,'Can add interval',11,'add_intervalschedule'),(29,'Can change interval',11,'change_intervalschedule'),(30,'Can delete interval',11,'delete_intervalschedule'),(31,'Can add crontab',12,'add_crontabschedule'),(32,'Can change crontab',12,'change_crontabschedule'),(33,'Can delete crontab',12,'delete_crontabschedule'),(34,'Can add periodic tasks',13,'add_periodictasks'),(35,'Can change periodic tasks',13,'change_periodictasks'),(36,'Can delete periodic tasks',13,'delete_periodictasks'),(37,'Can add periodic task',14,'add_periodictask'),(38,'Can change periodic task',14,'change_periodictask'),(39,'Can delete periodic task',14,'delete_periodictask'),(40,'Can add worker',15,'add_workerstate'),(41,'Can change worker',15,'change_workerstate'),(42,'Can delete worker',15,'delete_workerstate'),(43,'Can add task',16,'add_taskstate'),(44,'Can change task',16,'change_taskstate'),(45,'Can delete task',16,'delete_taskstate'),(46,'Can add global status message',17,'add_globalstatusmessage'),(47,'Can change global status message',17,'change_globalstatusmessage'),(48,'Can delete global status message',17,'delete_globalstatusmessage'),(49,'Can add course message',18,'add_coursemessage'),(50,'Can change course message',18,'change_coursemessage'),(51,'Can delete course message',18,'delete_coursemessage'),(52,'Can add asset base url config',19,'add_assetbaseurlconfig'),(53,'Can change asset base url config',19,'change_assetbaseurlconfig'),(54,'Can delete asset base url config',19,'delete_assetbaseurlconfig'),(55,'Can add asset excluded extensions config',20,'add_assetexcludedextensionsconfig'),(56,'Can change asset excluded extensions config',20,'change_assetexcludedextensionsconfig'),(57,'Can delete asset excluded extensions config',20,'delete_assetexcludedextensionsconfig'),(58,'Can add course asset cache ttl config',21,'add_courseassetcachettlconfig'),(59,'Can change course asset cache ttl config',21,'change_courseassetcachettlconfig'),(60,'Can delete course asset cache ttl config',21,'delete_courseassetcachettlconfig'),(61,'Can add cdn user agents config',22,'add_cdnuseragentsconfig'),(62,'Can change cdn user agents config',22,'change_cdnuseragentsconfig'),(63,'Can delete cdn user agents config',22,'delete_cdnuseragentsconfig'),(64,'Can add site theme',23,'add_sitetheme'),(65,'Can change site theme',23,'change_sitetheme'),(66,'Can delete site theme',23,'delete_sitetheme'),(67,'Can add site configuration',24,'add_siteconfiguration'),(68,'Can change site configuration',24,'change_siteconfiguration'),(69,'Can delete site configuration',24,'delete_siteconfiguration'),(70,'Can add site configuration history',25,'add_siteconfigurationhistory'),(71,'Can change site configuration history',25,'change_siteconfigurationhistory'),(72,'Can delete site configuration history',25,'delete_siteconfigurationhistory'),(73,'Can add student module',26,'add_studentmodule'),(74,'Can change student module',26,'change_studentmodule'),(75,'Can delete student module',26,'delete_studentmodule'),(76,'Can add student module history',27,'add_studentmodulehistory'),(77,'Can change student module history',27,'change_studentmodulehistory'),(78,'Can delete student module history',27,'delete_studentmodulehistory'),(79,'Can add x module user state summary field',28,'add_xmoduleuserstatesummaryfield'),(80,'Can change x module user state summary field',28,'change_xmoduleuserstatesummaryfield'),(81,'Can delete x module user state summary field',28,'delete_xmoduleuserstatesummaryfield'),(82,'Can add x module student prefs field',29,'add_xmodulestudentprefsfield'),(83,'Can change x module student prefs field',29,'change_xmodulestudentprefsfield'),(84,'Can delete x module student prefs field',29,'delete_xmodulestudentprefsfield'),(85,'Can add x module student info field',30,'add_xmodulestudentinfofield'),(86,'Can change x module student info field',30,'change_xmodulestudentinfofield'),(87,'Can delete x module student info field',30,'delete_xmodulestudentinfofield'),(88,'Can add offline computed grade',31,'add_offlinecomputedgrade'),(89,'Can change offline computed grade',31,'change_offlinecomputedgrade'),(90,'Can delete offline computed grade',31,'delete_offlinecomputedgrade'),(91,'Can add offline computed grade log',32,'add_offlinecomputedgradelog'),(92,'Can change offline computed grade log',32,'change_offlinecomputedgradelog'),(93,'Can delete offline computed grade log',32,'delete_offlinecomputedgradelog'),(94,'Can add student field override',33,'add_studentfieldoverride'),(95,'Can change student field override',33,'change_studentfieldoverride'),(96,'Can delete student field override',33,'delete_studentfieldoverride'),(97,'Can add anonymous user id',34,'add_anonymoususerid'),(98,'Can change anonymous user id',34,'change_anonymoususerid'),(99,'Can delete anonymous user id',34,'delete_anonymoususerid'),(100,'Can add user standing',35,'add_userstanding'),(101,'Can change user standing',35,'change_userstanding'),(102,'Can delete user standing',35,'delete_userstanding'),(103,'Can add user profile',36,'add_userprofile'),(104,'Can change user profile',36,'change_userprofile'),(105,'Can delete user profile',36,'delete_userprofile'),(106,'Can add user signup source',37,'add_usersignupsource'),(107,'Can change user signup source',37,'change_usersignupsource'),(108,'Can delete user signup source',37,'delete_usersignupsource'),(109,'Can add user test group',38,'add_usertestgroup'),(110,'Can change user test group',38,'change_usertestgroup'),(111,'Can delete user test group',38,'delete_usertestgroup'),(112,'Can add registration',39,'add_registration'),(113,'Can change registration',39,'change_registration'),(114,'Can delete registration',39,'delete_registration'),(115,'Can add pending name change',40,'add_pendingnamechange'),(116,'Can change pending name change',40,'change_pendingnamechange'),(117,'Can delete pending name change',40,'delete_pendingnamechange'),(118,'Can add pending email change',41,'add_pendingemailchange'),(119,'Can change pending email change',41,'change_pendingemailchange'),(120,'Can delete pending email change',41,'delete_pendingemailchange'),(121,'Can add password history',42,'add_passwordhistory'),(122,'Can change password history',42,'change_passwordhistory'),(123,'Can delete password history',42,'delete_passwordhistory'),(124,'Can add login failures',43,'add_loginfailures'),(125,'Can change login failures',43,'change_loginfailures'),(126,'Can delete login failures',43,'delete_loginfailures'),(127,'Can add historical course enrollment',44,'add_historicalcourseenrollment'),(128,'Can change historical course enrollment',44,'change_historicalcourseenrollment'),(129,'Can delete historical course enrollment',44,'delete_historicalcourseenrollment'),(130,'Can add course enrollment',45,'add_courseenrollment'),(131,'Can change course enrollment',45,'change_courseenrollment'),(132,'Can delete course enrollment',45,'delete_courseenrollment'),(133,'Can add manual enrollment audit',46,'add_manualenrollmentaudit'),(134,'Can change manual enrollment audit',46,'change_manualenrollmentaudit'),(135,'Can delete manual enrollment audit',46,'delete_manualenrollmentaudit'),(136,'Can add course enrollment allowed',47,'add_courseenrollmentallowed'),(137,'Can change course enrollment allowed',47,'change_courseenrollmentallowed'),(138,'Can delete course enrollment allowed',47,'delete_courseenrollmentallowed'),(139,'Can add course access role',48,'add_courseaccessrole'),(140,'Can change course access role',48,'change_courseaccessrole'),(141,'Can delete course access role',48,'delete_courseaccessrole'),(142,'Can add dashboard configuration',49,'add_dashboardconfiguration'),(143,'Can change dashboard configuration',49,'change_dashboardconfiguration'),(144,'Can delete dashboard configuration',49,'delete_dashboardconfiguration'),(145,'Can add linked in add to profile configuration',50,'add_linkedinaddtoprofileconfiguration'),(146,'Can change linked in add to profile configuration',50,'change_linkedinaddtoprofileconfiguration'),(147,'Can delete linked in add to profile configuration',50,'delete_linkedinaddtoprofileconfiguration'),(148,'Can add entrance exam configuration',51,'add_entranceexamconfiguration'),(149,'Can change entrance exam configuration',51,'change_entranceexamconfiguration'),(150,'Can delete entrance exam configuration',51,'delete_entranceexamconfiguration'),(151,'Can add language proficiency',52,'add_languageproficiency'),(152,'Can change language proficiency',52,'change_languageproficiency'),(153,'Can delete language proficiency',52,'delete_languageproficiency'),(154,'Can add course enrollment attribute',53,'add_courseenrollmentattribute'),(155,'Can change course enrollment attribute',53,'change_courseenrollmentattribute'),(156,'Can delete course enrollment attribute',53,'delete_courseenrollmentattribute'),(157,'Can add enrollment refund configuration',54,'add_enrollmentrefundconfiguration'),(158,'Can change enrollment refund configuration',54,'change_enrollmentrefundconfiguration'),(159,'Can delete enrollment refund configuration',54,'delete_enrollmentrefundconfiguration'),(160,'Can add registration cookie configuration',55,'add_registrationcookieconfiguration'),(161,'Can change registration cookie configuration',55,'change_registrationcookieconfiguration'),(162,'Can delete registration cookie configuration',55,'delete_registrationcookieconfiguration'),(163,'Can add user attribute',56,'add_userattribute'),(164,'Can change user attribute',56,'change_userattribute'),(165,'Can delete user attribute',56,'delete_userattribute'),(166,'Can add logout view configuration',57,'add_logoutviewconfiguration'),(167,'Can change logout view configuration',57,'change_logoutviewconfiguration'),(168,'Can delete logout view configuration',57,'delete_logoutviewconfiguration'),(169,'Can add tracking log',58,'add_trackinglog'),(170,'Can change tracking log',58,'change_trackinglog'),(171,'Can delete tracking log',58,'delete_trackinglog'),(172,'Can add rate limit configuration',59,'add_ratelimitconfiguration'),(173,'Can change rate limit configuration',59,'change_ratelimitconfiguration'),(174,'Can delete rate limit configuration',59,'delete_ratelimitconfiguration'),(175,'Can add certificate whitelist',60,'add_certificatewhitelist'),(176,'Can change certificate whitelist',60,'change_certificatewhitelist'),(177,'Can delete certificate whitelist',60,'delete_certificatewhitelist'),(178,'Can add generated certificate',61,'add_generatedcertificate'),(179,'Can change generated certificate',61,'change_generatedcertificate'),(180,'Can delete generated certificate',61,'delete_generatedcertificate'),(181,'Can add certificate generation history',62,'add_certificategenerationhistory'),(182,'Can change certificate generation history',62,'change_certificategenerationhistory'),(183,'Can delete certificate generation history',62,'delete_certificategenerationhistory'),(184,'Can add certificate invalidation',63,'add_certificateinvalidation'),(185,'Can change certificate invalidation',63,'change_certificateinvalidation'),(186,'Can delete certificate invalidation',63,'delete_certificateinvalidation'),(187,'Can add example certificate set',64,'add_examplecertificateset'),(188,'Can change example certificate set',64,'change_examplecertificateset'),(189,'Can delete example certificate set',64,'delete_examplecertificateset'),(190,'Can add example certificate',65,'add_examplecertificate'),(191,'Can change example certificate',65,'change_examplecertificate'),(192,'Can delete example certificate',65,'delete_examplecertificate'),(193,'Can add certificate generation course setting',66,'add_certificategenerationcoursesetting'),(194,'Can change certificate generation course setting',66,'change_certificategenerationcoursesetting'),(195,'Can delete certificate generation course setting',66,'delete_certificategenerationcoursesetting'),(196,'Can add certificate generation configuration',67,'add_certificategenerationconfiguration'),(197,'Can change certificate generation configuration',67,'change_certificategenerationconfiguration'),(198,'Can delete certificate generation configuration',67,'delete_certificategenerationconfiguration'),(199,'Can add certificate html view configuration',68,'add_certificatehtmlviewconfiguration'),(200,'Can change certificate html view configuration',68,'change_certificatehtmlviewconfiguration'),(201,'Can delete certificate html view configuration',68,'delete_certificatehtmlviewconfiguration'),(202,'Can add certificate template',69,'add_certificatetemplate'),(203,'Can change certificate template',69,'change_certificatetemplate'),(204,'Can delete certificate template',69,'delete_certificatetemplate'),(205,'Can add certificate template asset',70,'add_certificatetemplateasset'),(206,'Can change certificate template asset',70,'change_certificatetemplateasset'),(207,'Can delete certificate template asset',70,'delete_certificatetemplateasset'),(208,'Can add instructor task',71,'add_instructortask'),(209,'Can change instructor task',71,'change_instructortask'),(210,'Can delete instructor task',71,'delete_instructortask'),(211,'Can add course user group',72,'add_courseusergroup'),(212,'Can change course user group',72,'change_courseusergroup'),(213,'Can delete course user group',72,'delete_courseusergroup'),(214,'Can add cohort membership',73,'add_cohortmembership'),(215,'Can change cohort membership',73,'change_cohortmembership'),(216,'Can delete cohort membership',73,'delete_cohortmembership'),(217,'Can add course user group partition group',74,'add_courseusergrouppartitiongroup'),(218,'Can change course user group partition group',74,'change_courseusergrouppartitiongroup'),(219,'Can delete course user group partition group',74,'delete_courseusergrouppartitiongroup'),(220,'Can add course cohorts settings',75,'add_coursecohortssettings'),(221,'Can change course cohorts settings',75,'change_coursecohortssettings'),(222,'Can delete course cohorts settings',75,'delete_coursecohortssettings'),(223,'Can add course cohort',76,'add_coursecohort'),(224,'Can change course cohort',76,'change_coursecohort'),(225,'Can delete course cohort',76,'delete_coursecohort'),(226,'Can add target',77,'add_target'),(227,'Can change target',77,'change_target'),(228,'Can delete target',77,'delete_target'),(229,'Can add cohort target',78,'add_cohorttarget'),(230,'Can change cohort target',78,'change_cohorttarget'),(231,'Can delete cohort target',78,'delete_cohorttarget'),(232,'Can add course email',79,'add_courseemail'),(233,'Can change course email',79,'change_courseemail'),(234,'Can delete course email',79,'delete_courseemail'),(235,'Can add optout',80,'add_optout'),(236,'Can change optout',80,'change_optout'),(237,'Can delete optout',80,'delete_optout'),(238,'Can add course email template',81,'add_courseemailtemplate'),(239,'Can change course email template',81,'change_courseemailtemplate'),(240,'Can delete course email template',81,'delete_courseemailtemplate'),(241,'Can add course authorization',82,'add_courseauthorization'),(242,'Can change course authorization',82,'change_courseauthorization'),(243,'Can delete course authorization',82,'delete_courseauthorization'),(244,'Can add bulk email flag',83,'add_bulkemailflag'),(245,'Can change bulk email flag',83,'change_bulkemailflag'),(246,'Can delete bulk email flag',83,'delete_bulkemailflag'),(247,'Can add branding info config',84,'add_brandinginfoconfig'),(248,'Can change branding info config',84,'change_brandinginfoconfig'),(249,'Can delete branding info config',84,'delete_brandinginfoconfig'),(250,'Can add branding api config',85,'add_brandingapiconfig'),(251,'Can change branding api config',85,'change_brandingapiconfig'),(252,'Can delete branding api config',85,'delete_brandingapiconfig'),(253,'Can add visible blocks',86,'add_visibleblocks'),(254,'Can change visible blocks',86,'change_visibleblocks'),(255,'Can delete visible blocks',86,'delete_visibleblocks'),(256,'Can add persistent subsection grade',87,'add_persistentsubsectiongrade'),(257,'Can change persistent subsection grade',87,'change_persistentsubsectiongrade'),(258,'Can delete persistent subsection grade',87,'delete_persistentsubsectiongrade'),(259,'Can add persistent course grade',88,'add_persistentcoursegrade'),(260,'Can change persistent course grade',88,'change_persistentcoursegrade'),(261,'Can delete persistent course grade',88,'delete_persistentcoursegrade'),(262,'Can add persistent grades enabled flag',89,'add_persistentgradesenabledflag'),(263,'Can change persistent grades enabled flag',89,'change_persistentgradesenabledflag'),(264,'Can delete persistent grades enabled flag',89,'delete_persistentgradesenabledflag'),(265,'Can add course persistent grades flag',90,'add_coursepersistentgradesflag'),(266,'Can change course persistent grades flag',90,'change_coursepersistentgradesflag'),(267,'Can delete course persistent grades flag',90,'delete_coursepersistentgradesflag'),(268,'Can add external auth map',91,'add_externalauthmap'),(269,'Can change external auth map',91,'change_externalauthmap'),(270,'Can delete external auth map',91,'delete_externalauthmap'),(271,'Can add nonce',92,'add_nonce'),(272,'Can change nonce',92,'change_nonce'),(273,'Can delete nonce',92,'delete_nonce'),(274,'Can add association',93,'add_association'),(275,'Can change association',93,'change_association'),(276,'Can delete association',93,'delete_association'),(277,'Can add user open id',94,'add_useropenid'),(278,'Can change user open id',94,'change_useropenid'),(279,'Can delete user open id',94,'delete_useropenid'),(280,'The OpenID has been verified',94,'account_verified'),(281,'Can add client',95,'add_client'),(282,'Can change client',95,'change_client'),(283,'Can delete client',95,'delete_client'),(284,'Can add grant',96,'add_grant'),(285,'Can change grant',96,'change_grant'),(286,'Can delete grant',96,'delete_grant'),(287,'Can add access token',97,'add_accesstoken'),(288,'Can change access token',97,'change_accesstoken'),(289,'Can delete access token',97,'delete_accesstoken'),(290,'Can add refresh token',98,'add_refreshtoken'),(291,'Can change refresh token',98,'change_refreshtoken'),(292,'Can delete refresh token',98,'delete_refreshtoken'),(293,'Can add trusted client',99,'add_trustedclient'),(294,'Can change trusted client',99,'change_trustedclient'),(295,'Can delete trusted client',99,'delete_trustedclient'),(296,'Can add application',100,'add_application'),(297,'Can change application',100,'change_application'),(298,'Can delete application',100,'delete_application'),(299,'Can add grant',101,'add_grant'),(300,'Can change grant',101,'change_grant'),(301,'Can delete grant',101,'delete_grant'),(302,'Can add access token',102,'add_accesstoken'),(303,'Can change access token',102,'change_accesstoken'),(304,'Can delete access token',102,'delete_accesstoken'),(305,'Can add refresh token',103,'add_refreshtoken'),(306,'Can change refresh token',103,'change_refreshtoken'),(307,'Can delete refresh token',103,'delete_refreshtoken'),(308,'Can add restricted application',104,'add_restrictedapplication'),(309,'Can change restricted application',104,'change_restrictedapplication'),(310,'Can delete restricted application',104,'delete_restrictedapplication'),(311,'Can add Provider Configuration (OAuth)',105,'add_oauth2providerconfig'),(312,'Can change Provider Configuration (OAuth)',105,'change_oauth2providerconfig'),(313,'Can delete Provider Configuration (OAuth)',105,'delete_oauth2providerconfig'),(314,'Can add Provider Configuration (SAML IdP)',106,'add_samlproviderconfig'),(315,'Can change Provider Configuration (SAML IdP)',106,'change_samlproviderconfig'),(316,'Can delete Provider Configuration (SAML IdP)',106,'delete_samlproviderconfig'),(317,'Can add SAML Configuration',107,'add_samlconfiguration'),(318,'Can change SAML Configuration',107,'change_samlconfiguration'),(319,'Can delete SAML Configuration',107,'delete_samlconfiguration'),(320,'Can add SAML Provider Data',108,'add_samlproviderdata'),(321,'Can change SAML Provider Data',108,'change_samlproviderdata'),(322,'Can delete SAML Provider Data',108,'delete_samlproviderdata'),(323,'Can add Provider Configuration (LTI)',109,'add_ltiproviderconfig'),(324,'Can change Provider Configuration (LTI)',109,'change_ltiproviderconfig'),(325,'Can delete Provider Configuration (LTI)',109,'delete_ltiproviderconfig'),(326,'Can add Provider API Permission',110,'add_providerapipermissions'),(327,'Can change Provider API Permission',110,'change_providerapipermissions'),(328,'Can delete Provider API Permission',110,'delete_providerapipermissions'),(329,'Can add nonce',111,'add_nonce'),(330,'Can change nonce',111,'change_nonce'),(331,'Can delete nonce',111,'delete_nonce'),(332,'Can add scope',112,'add_scope'),(333,'Can change scope',112,'change_scope'),(334,'Can delete scope',112,'delete_scope'),(335,'Can add resource',112,'add_resource'),(336,'Can change resource',112,'change_resource'),(337,'Can delete resource',112,'delete_resource'),(338,'Can add consumer',113,'add_consumer'),(339,'Can change consumer',113,'change_consumer'),(340,'Can delete consumer',113,'delete_consumer'),(341,'Can add token',114,'add_token'),(342,'Can change token',114,'change_token'),(343,'Can delete token',114,'delete_token'),(344,'Can add article',116,'add_article'),(345,'Can change article',116,'change_article'),(346,'Can delete article',116,'delete_article'),(347,'Can edit all articles and lock/unlock/restore',116,'moderate'),(348,'Can change ownership of any article',116,'assign'),(349,'Can assign permissions to other users',116,'grant'),(350,'Can add Article for object',117,'add_articleforobject'),(351,'Can change Article for object',117,'change_articleforobject'),(352,'Can delete Article for object',117,'delete_articleforobject'),(353,'Can add article revision',118,'add_articlerevision'),(354,'Can change article revision',118,'change_articlerevision'),(355,'Can delete article revision',118,'delete_articlerevision'),(356,'Can add URL path',119,'add_urlpath'),(357,'Can change URL path',119,'change_urlpath'),(358,'Can delete URL path',119,'delete_urlpath'),(359,'Can add article plugin',120,'add_articleplugin'),(360,'Can change article plugin',120,'change_articleplugin'),(361,'Can delete article plugin',120,'delete_articleplugin'),(362,'Can add reusable plugin',121,'add_reusableplugin'),(363,'Can change reusable plugin',121,'change_reusableplugin'),(364,'Can delete reusable plugin',121,'delete_reusableplugin'),(365,'Can add simple plugin',122,'add_simpleplugin'),(366,'Can change simple plugin',122,'change_simpleplugin'),(367,'Can delete simple plugin',122,'delete_simpleplugin'),(368,'Can add revision plugin',123,'add_revisionplugin'),(369,'Can change revision plugin',123,'change_revisionplugin'),(370,'Can delete revision plugin',123,'delete_revisionplugin'),(371,'Can add revision plugin revision',124,'add_revisionpluginrevision'),(372,'Can change revision plugin revision',124,'change_revisionpluginrevision'),(373,'Can delete revision plugin revision',124,'delete_revisionpluginrevision'),(374,'Can add image',125,'add_image'),(375,'Can change image',125,'change_image'),(376,'Can delete image',125,'delete_image'),(377,'Can add image revision',126,'add_imagerevision'),(378,'Can change image revision',126,'change_imagerevision'),(379,'Can delete image revision',126,'delete_imagerevision'),(380,'Can add attachment',127,'add_attachment'),(381,'Can change attachment',127,'change_attachment'),(382,'Can delete attachment',127,'delete_attachment'),(383,'Can add attachment revision',128,'add_attachmentrevision'),(384,'Can change attachment revision',128,'change_attachmentrevision'),(385,'Can delete attachment revision',128,'delete_attachmentrevision'),(386,'Can add type',129,'add_notificationtype'),(387,'Can change type',129,'change_notificationtype'),(388,'Can delete type',129,'delete_notificationtype'),(389,'Can add settings',130,'add_settings'),(390,'Can change settings',130,'change_settings'),(391,'Can delete settings',130,'delete_settings'),(392,'Can add subscription',131,'add_subscription'),(393,'Can change subscription',131,'change_subscription'),(394,'Can delete subscription',131,'delete_subscription'),(395,'Can add notification',132,'add_notification'),(396,'Can change notification',132,'change_notification'),(397,'Can delete notification',132,'delete_notification'),(398,'Can add log entry',133,'add_logentry'),(399,'Can change log entry',133,'change_logentry'),(400,'Can delete log entry',133,'delete_logentry'),(401,'Can add role',134,'add_role'),(402,'Can change role',134,'change_role'),(403,'Can delete role',134,'delete_role'),(404,'Can add permission',135,'add_permission'),(405,'Can change permission',135,'change_permission'),(406,'Can delete permission',135,'delete_permission'),(407,'Can add forums config',136,'add_forumsconfig'),(408,'Can change forums config',136,'change_forumsconfig'),(409,'Can delete forums config',136,'delete_forumsconfig'),(410,'Can add note',137,'add_note'),(411,'Can change note',137,'change_note'),(412,'Can delete note',137,'delete_note'),(413,'Can add splash config',138,'add_splashconfig'),(414,'Can change splash config',138,'change_splashconfig'),(415,'Can delete splash config',138,'delete_splashconfig'),(416,'Can add user preference',139,'add_userpreference'),(417,'Can change user preference',139,'change_userpreference'),(418,'Can delete user preference',139,'delete_userpreference'),(419,'Can add user course tag',140,'add_usercoursetag'),(420,'Can change user course tag',140,'change_usercoursetag'),(421,'Can delete user course tag',140,'delete_usercoursetag'),(422,'Can add user org tag',141,'add_userorgtag'),(423,'Can change user org tag',141,'change_userorgtag'),(424,'Can delete user org tag',141,'delete_userorgtag'),(425,'Can add order',142,'add_order'),(426,'Can change order',142,'change_order'),(427,'Can delete order',142,'delete_order'),(428,'Can add order item',143,'add_orderitem'),(429,'Can change order item',143,'change_orderitem'),(430,'Can delete order item',143,'delete_orderitem'),(431,'Can add invoice',144,'add_invoice'),(432,'Can change invoice',144,'change_invoice'),(433,'Can delete invoice',144,'delete_invoice'),(434,'Can add invoice transaction',145,'add_invoicetransaction'),(435,'Can change invoice transaction',145,'change_invoicetransaction'),(436,'Can delete invoice transaction',145,'delete_invoicetransaction'),(437,'Can add invoice item',146,'add_invoiceitem'),(438,'Can change invoice item',146,'change_invoiceitem'),(439,'Can delete invoice item',146,'delete_invoiceitem'),(440,'Can add course registration code invoice item',147,'add_courseregistrationcodeinvoiceitem'),(441,'Can change course registration code invoice item',147,'change_courseregistrationcodeinvoiceitem'),(442,'Can delete course registration code invoice item',147,'delete_courseregistrationcodeinvoiceitem'),(443,'Can add invoice history',148,'add_invoicehistory'),(444,'Can change invoice history',148,'change_invoicehistory'),(445,'Can delete invoice history',148,'delete_invoicehistory'),(446,'Can add course registration code',149,'add_courseregistrationcode'),(447,'Can change course registration code',149,'change_courseregistrationcode'),(448,'Can delete course registration code',149,'delete_courseregistrationcode'),(449,'Can add registration code redemption',150,'add_registrationcoderedemption'),(450,'Can change registration code redemption',150,'change_registrationcoderedemption'),(451,'Can delete registration code redemption',150,'delete_registrationcoderedemption'),(452,'Can add coupon',151,'add_coupon'),(453,'Can change coupon',151,'change_coupon'),(454,'Can delete coupon',151,'delete_coupon'),(455,'Can add coupon redemption',152,'add_couponredemption'),(456,'Can change coupon redemption',152,'change_couponredemption'),(457,'Can delete coupon redemption',152,'delete_couponredemption'),(458,'Can add paid course registration',153,'add_paidcourseregistration'),(459,'Can change paid course registration',153,'change_paidcourseregistration'),(460,'Can delete paid course registration',153,'delete_paidcourseregistration'),(461,'Can add course reg code item',154,'add_courseregcodeitem'),(462,'Can change course reg code item',154,'change_courseregcodeitem'),(463,'Can delete course reg code item',154,'delete_courseregcodeitem'),(464,'Can add course reg code item annotation',155,'add_courseregcodeitemannotation'),(465,'Can change course reg code item annotation',155,'change_courseregcodeitemannotation'),(466,'Can delete course reg code item annotation',155,'delete_courseregcodeitemannotation'),(467,'Can add paid course registration annotation',156,'add_paidcourseregistrationannotation'),(468,'Can change paid course registration annotation',156,'change_paidcourseregistrationannotation'),(469,'Can delete paid course registration annotation',156,'delete_paidcourseregistrationannotation'),(470,'Can add certificate item',157,'add_certificateitem'),(471,'Can change certificate item',157,'change_certificateitem'),(472,'Can delete certificate item',157,'delete_certificateitem'),(473,'Can add donation configuration',158,'add_donationconfiguration'),(474,'Can change donation configuration',158,'change_donationconfiguration'),(475,'Can delete donation configuration',158,'delete_donationconfiguration'),(476,'Can add donation',159,'add_donation'),(477,'Can change donation',159,'change_donation'),(478,'Can delete donation',159,'delete_donation'),(479,'Can add course mode',160,'add_coursemode'),(480,'Can change course mode',160,'change_coursemode'),(481,'Can delete course mode',160,'delete_coursemode'),(482,'Can add course modes archive',161,'add_coursemodesarchive'),(483,'Can change course modes archive',161,'change_coursemodesarchive'),(484,'Can delete course modes archive',161,'delete_coursemodesarchive'),(485,'Can add course mode expiration config',162,'add_coursemodeexpirationconfig'),(486,'Can change course mode expiration config',162,'change_coursemodeexpirationconfig'),(487,'Can delete course mode expiration config',162,'delete_coursemodeexpirationconfig'),(488,'Can add software secure photo verification',163,'add_softwaresecurephotoverification'),(489,'Can change software secure photo verification',163,'change_softwaresecurephotoverification'),(490,'Can delete software secure photo verification',163,'delete_softwaresecurephotoverification'),(491,'Can add historical verification deadline',164,'add_historicalverificationdeadline'),(492,'Can change historical verification deadline',164,'change_historicalverificationdeadline'),(493,'Can delete historical verification deadline',164,'delete_historicalverificationdeadline'),(494,'Can add verification deadline',165,'add_verificationdeadline'),(495,'Can change verification deadline',165,'change_verificationdeadline'),(496,'Can delete verification deadline',165,'delete_verificationdeadline'),(497,'Can add verification checkpoint',166,'add_verificationcheckpoint'),(498,'Can change verification checkpoint',166,'change_verificationcheckpoint'),(499,'Can delete verification checkpoint',166,'delete_verificationcheckpoint'),(500,'Can add Verification Status',167,'add_verificationstatus'),(501,'Can change Verification Status',167,'change_verificationstatus'),(502,'Can delete Verification Status',167,'delete_verificationstatus'),(503,'Can add in course reverification configuration',168,'add_incoursereverificationconfiguration'),(504,'Can change in course reverification configuration',168,'change_incoursereverificationconfiguration'),(505,'Can delete in course reverification configuration',168,'delete_incoursereverificationconfiguration'),(506,'Can add icrv status emails configuration',169,'add_icrvstatusemailsconfiguration'),(507,'Can change icrv status emails configuration',169,'change_icrvstatusemailsconfiguration'),(508,'Can delete icrv status emails configuration',169,'delete_icrvstatusemailsconfiguration'),(509,'Can add skipped reverification',170,'add_skippedreverification'),(510,'Can change skipped reverification',170,'change_skippedreverification'),(511,'Can delete skipped reverification',170,'delete_skippedreverification'),(512,'Can add dark lang config',171,'add_darklangconfig'),(513,'Can change dark lang config',171,'change_darklangconfig'),(514,'Can delete dark lang config',171,'delete_darklangconfig'),(515,'Can add microsite',172,'add_microsite'),(516,'Can change microsite',172,'change_microsite'),(517,'Can delete microsite',172,'delete_microsite'),(518,'Can add microsite history',173,'add_micrositehistory'),(519,'Can change microsite history',173,'change_micrositehistory'),(520,'Can delete microsite history',173,'delete_micrositehistory'),(521,'Can add historical microsite organization mapping',174,'add_historicalmicrositeorganizationmapping'),(522,'Can change historical microsite organization mapping',174,'change_historicalmicrositeorganizationmapping'),(523,'Can delete historical microsite organization mapping',174,'delete_historicalmicrositeorganizationmapping'),(524,'Can add microsite organization mapping',175,'add_micrositeorganizationmapping'),(525,'Can change microsite organization mapping',175,'change_micrositeorganizationmapping'),(526,'Can delete microsite organization mapping',175,'delete_micrositeorganizationmapping'),(527,'Can add historical microsite template',176,'add_historicalmicrositetemplate'),(528,'Can change historical microsite template',176,'change_historicalmicrositetemplate'),(529,'Can delete historical microsite template',176,'delete_historicalmicrositetemplate'),(530,'Can add microsite template',177,'add_micrositetemplate'),(531,'Can change microsite template',177,'change_micrositetemplate'),(532,'Can delete microsite template',177,'delete_micrositetemplate'),(533,'Can add whitelisted rss url',178,'add_whitelistedrssurl'),(534,'Can change whitelisted rss url',178,'change_whitelistedrssurl'),(535,'Can delete whitelisted rss url',178,'delete_whitelistedrssurl'),(536,'Can add embargoed course',179,'add_embargoedcourse'),(537,'Can change embargoed course',179,'change_embargoedcourse'),(538,'Can delete embargoed course',179,'delete_embargoedcourse'),(539,'Can add embargoed state',180,'add_embargoedstate'),(540,'Can change embargoed state',180,'change_embargoedstate'),(541,'Can delete embargoed state',180,'delete_embargoedstate'),(542,'Can add restricted course',181,'add_restrictedcourse'),(543,'Can change restricted course',181,'change_restrictedcourse'),(544,'Can delete restricted course',181,'delete_restrictedcourse'),(545,'Can add country',182,'add_country'),(546,'Can change country',182,'change_country'),(547,'Can delete country',182,'delete_country'),(548,'Can add country access rule',183,'add_countryaccessrule'),(549,'Can change country access rule',183,'change_countryaccessrule'),(550,'Can delete country access rule',183,'delete_countryaccessrule'),(551,'Can add course access rule history',184,'add_courseaccessrulehistory'),(552,'Can change course access rule history',184,'change_courseaccessrulehistory'),(553,'Can delete course access rule history',184,'delete_courseaccessrulehistory'),(554,'Can add ip filter',185,'add_ipfilter'),(555,'Can change ip filter',185,'change_ipfilter'),(556,'Can delete ip filter',185,'delete_ipfilter'),(557,'Can add course rerun state',186,'add_coursererunstate'),(558,'Can change course rerun state',186,'change_coursererunstate'),(559,'Can delete course rerun state',186,'delete_coursererunstate'),(560,'Can add mobile api config',187,'add_mobileapiconfig'),(561,'Can change mobile api config',187,'change_mobileapiconfig'),(562,'Can delete mobile api config',187,'delete_mobileapiconfig'),(563,'Can add app version config',188,'add_appversionconfig'),(564,'Can change app version config',188,'change_appversionconfig'),(565,'Can delete app version config',188,'delete_appversionconfig'),(566,'Can add user social auth',189,'add_usersocialauth'),(567,'Can change user social auth',189,'change_usersocialauth'),(568,'Can delete user social auth',189,'delete_usersocialauth'),(569,'Can add nonce',190,'add_nonce'),(570,'Can change nonce',190,'change_nonce'),(571,'Can delete nonce',190,'delete_nonce'),(572,'Can add association',191,'add_association'),(573,'Can change association',191,'change_association'),(574,'Can delete association',191,'delete_association'),(575,'Can add code',192,'add_code'),(576,'Can change code',192,'change_code'),(577,'Can delete code',192,'delete_code'),(578,'Can add survey form',193,'add_surveyform'),(579,'Can change survey form',193,'change_surveyform'),(580,'Can delete survey form',193,'delete_surveyform'),(581,'Can add survey answer',194,'add_surveyanswer'),(582,'Can change survey answer',194,'change_surveyanswer'),(583,'Can delete survey answer',194,'delete_surveyanswer'),(584,'Can add x block asides config',195,'add_xblockasidesconfig'),(585,'Can change x block asides config',195,'change_xblockasidesconfig'),(586,'Can delete x block asides config',195,'delete_xblockasidesconfig'),(587,'Can add course overview',196,'add_courseoverview'),(588,'Can change course overview',196,'change_courseoverview'),(589,'Can delete course overview',196,'delete_courseoverview'),(590,'Can add course overview tab',197,'add_courseoverviewtab'),(591,'Can change course overview tab',197,'change_courseoverviewtab'),(592,'Can delete course overview tab',197,'delete_courseoverviewtab'),(593,'Can add course overview image set',198,'add_courseoverviewimageset'),(594,'Can change course overview image set',198,'change_courseoverviewimageset'),(595,'Can delete course overview image set',198,'delete_courseoverviewimageset'),(596,'Can add course overview image config',199,'add_courseoverviewimageconfig'),(597,'Can change course overview image config',199,'change_courseoverviewimageconfig'),(598,'Can delete course overview image config',199,'delete_courseoverviewimageconfig'),(599,'Can add course structure',200,'add_coursestructure'),(600,'Can change course structure',200,'change_coursestructure'),(601,'Can delete course structure',200,'delete_coursestructure'),(602,'Can add cors model',201,'add_corsmodel'),(603,'Can change cors model',201,'change_corsmodel'),(604,'Can delete cors model',201,'delete_corsmodel'),(605,'Can add x domain proxy configuration',202,'add_xdomainproxyconfiguration'),(606,'Can change x domain proxy configuration',202,'change_xdomainproxyconfiguration'),(607,'Can delete x domain proxy configuration',202,'delete_xdomainproxyconfiguration'),(608,'Can add commerce configuration',203,'add_commerceconfiguration'),(609,'Can change commerce configuration',203,'change_commerceconfiguration'),(610,'Can delete commerce configuration',203,'delete_commerceconfiguration'),(611,'Can add credit provider',204,'add_creditprovider'),(612,'Can change credit provider',204,'change_creditprovider'),(613,'Can delete credit provider',204,'delete_creditprovider'),(614,'Can add credit course',205,'add_creditcourse'),(615,'Can change credit course',205,'change_creditcourse'),(616,'Can delete credit course',205,'delete_creditcourse'),(617,'Can add credit requirement',206,'add_creditrequirement'),(618,'Can change credit requirement',206,'change_creditrequirement'),(619,'Can delete credit requirement',206,'delete_creditrequirement'),(620,'Can add historical credit requirement status',207,'add_historicalcreditrequirementstatus'),(621,'Can change historical credit requirement status',207,'change_historicalcreditrequirementstatus'),(622,'Can delete historical credit requirement status',207,'delete_historicalcreditrequirementstatus'),(623,'Can add credit requirement status',208,'add_creditrequirementstatus'),(624,'Can change credit requirement status',208,'change_creditrequirementstatus'),(625,'Can delete credit requirement status',208,'delete_creditrequirementstatus'),(626,'Can add credit eligibility',209,'add_crediteligibility'),(627,'Can change credit eligibility',209,'change_crediteligibility'),(628,'Can delete credit eligibility',209,'delete_crediteligibility'),(629,'Can add historical credit request',210,'add_historicalcreditrequest'),(630,'Can change historical credit request',210,'change_historicalcreditrequest'),(631,'Can delete historical credit request',210,'delete_historicalcreditrequest'),(632,'Can add credit request',211,'add_creditrequest'),(633,'Can change credit request',211,'change_creditrequest'),(634,'Can delete credit request',211,'delete_creditrequest'),(635,'Can add credit config',212,'add_creditconfig'),(636,'Can change credit config',212,'change_creditconfig'),(637,'Can delete credit config',212,'delete_creditconfig'),(638,'Can add course team',213,'add_courseteam'),(639,'Can change course team',213,'change_courseteam'),(640,'Can delete course team',213,'delete_courseteam'),(641,'Can add course team membership',214,'add_courseteammembership'),(642,'Can change course team membership',214,'change_courseteammembership'),(643,'Can delete course team membership',214,'delete_courseteammembership'),(644,'Can add x block configuration',215,'add_xblockconfiguration'),(645,'Can change x block configuration',215,'change_xblockconfiguration'),(646,'Can delete x block configuration',215,'delete_xblockconfiguration'),(647,'Can add x block studio configuration flag',216,'add_xblockstudioconfigurationflag'),(648,'Can change x block studio configuration flag',216,'change_xblockstudioconfigurationflag'),(649,'Can delete x block studio configuration flag',216,'delete_xblockstudioconfigurationflag'),(650,'Can add x block studio configuration',217,'add_xblockstudioconfiguration'),(651,'Can change x block studio configuration',217,'change_xblockstudioconfiguration'),(652,'Can delete x block studio configuration',217,'delete_xblockstudioconfiguration'),(653,'Can add bookmark',218,'add_bookmark'),(654,'Can change bookmark',218,'change_bookmark'),(655,'Can delete bookmark',218,'delete_bookmark'),(656,'Can add x block cache',219,'add_xblockcache'),(657,'Can change x block cache',219,'change_xblockcache'),(658,'Can delete x block cache',219,'delete_xblockcache'),(659,'Can add programs api config',220,'add_programsapiconfig'),(660,'Can change programs api config',220,'change_programsapiconfig'),(661,'Can delete programs api config',220,'delete_programsapiconfig'),(662,'Can add catalog integration',221,'add_catalogintegration'),(663,'Can change catalog integration',221,'change_catalogintegration'),(664,'Can delete catalog integration',221,'delete_catalogintegration'),(665,'Can add self paced configuration',222,'add_selfpacedconfiguration'),(666,'Can change self paced configuration',222,'change_selfpacedconfiguration'),(667,'Can delete self paced configuration',222,'delete_selfpacedconfiguration'),(668,'Can add kv store',223,'add_kvstore'),(669,'Can change kv store',223,'change_kvstore'),(670,'Can delete kv store',223,'delete_kvstore'),(671,'Can add credentials api config',224,'add_credentialsapiconfig'),(672,'Can change credentials api config',224,'change_credentialsapiconfig'),(673,'Can delete credentials api config',224,'delete_credentialsapiconfig'),(674,'Can add milestone',225,'add_milestone'),(675,'Can change milestone',225,'change_milestone'),(676,'Can delete milestone',225,'delete_milestone'),(677,'Can add milestone relationship type',226,'add_milestonerelationshiptype'),(678,'Can change milestone relationship type',226,'change_milestonerelationshiptype'),(679,'Can delete milestone relationship type',226,'delete_milestonerelationshiptype'),(680,'Can add course milestone',227,'add_coursemilestone'),(681,'Can change course milestone',227,'change_coursemilestone'),(682,'Can delete course milestone',227,'delete_coursemilestone'),(683,'Can add course content milestone',228,'add_coursecontentmilestone'),(684,'Can change course content milestone',228,'change_coursecontentmilestone'),(685,'Can delete course content milestone',228,'delete_coursecontentmilestone'),(686,'Can add user milestone',229,'add_usermilestone'),(687,'Can change user milestone',229,'change_usermilestone'),(688,'Can delete user milestone',229,'delete_usermilestone'),(689,'Can add course talk widget configuration',230,'add_coursetalkwidgetconfiguration'),(690,'Can change course talk widget configuration',230,'change_coursetalkwidgetconfiguration'),(691,'Can delete course talk widget configuration',230,'delete_coursetalkwidgetconfiguration'),(692,'Can add historical api access request',231,'add_historicalapiaccessrequest'),(693,'Can change historical api access request',231,'change_historicalapiaccessrequest'),(694,'Can delete historical api access request',231,'delete_historicalapiaccessrequest'),(695,'Can add api access request',1,'add_apiaccessrequest'),(696,'Can change api access request',1,'change_apiaccessrequest'),(697,'Can delete api access request',1,'delete_apiaccessrequest'),(698,'Can add api access config',232,'add_apiaccessconfig'),(699,'Can change api access config',232,'change_apiaccessconfig'),(700,'Can delete api access config',232,'delete_apiaccessconfig'),(701,'Can add catalog',233,'add_catalog'),(702,'Can change catalog',233,'change_catalog'),(703,'Can delete catalog',233,'delete_catalog'),(704,'Can add verified track cohorted course',234,'add_verifiedtrackcohortedcourse'),(705,'Can change verified track cohorted course',234,'change_verifiedtrackcohortedcourse'),(706,'Can delete verified track cohorted course',234,'delete_verifiedtrackcohortedcourse'),(707,'Can add badge class',235,'add_badgeclass'),(708,'Can change badge class',235,'change_badgeclass'),(709,'Can delete badge class',235,'delete_badgeclass'),(710,'Can add badge assertion',236,'add_badgeassertion'),(711,'Can change badge assertion',236,'change_badgeassertion'),(712,'Can delete badge assertion',236,'delete_badgeassertion'),(713,'Can add course complete image configuration',237,'add_coursecompleteimageconfiguration'),(714,'Can change course complete image configuration',237,'change_coursecompleteimageconfiguration'),(715,'Can delete course complete image configuration',237,'delete_coursecompleteimageconfiguration'),(716,'Can add course event badges configuration',238,'add_courseeventbadgesconfiguration'),(717,'Can change course event badges configuration',238,'change_courseeventbadgesconfiguration'),(718,'Can delete course event badges configuration',238,'delete_courseeventbadgesconfiguration'),(719,'Can add email marketing configuration',239,'add_emailmarketingconfiguration'),(720,'Can change email marketing configuration',239,'change_emailmarketingconfiguration'),(721,'Can delete email marketing configuration',239,'delete_emailmarketingconfiguration'),(722,'Can add answer',240,'add_answer'),(723,'Can change answer',240,'change_answer'),(724,'Can delete answer',240,'delete_answer'),(725,'Can add answer',241,'add_answer'),(726,'Can change answer',241,'change_answer'),(727,'Can delete answer',241,'delete_answer'),(728,'Can add share',242,'add_share'),(729,'Can change share',242,'change_share'),(730,'Can delete share',242,'delete_share'),(731,'Can add student item',243,'add_studentitem'),(732,'Can change student item',243,'change_studentitem'),(733,'Can delete student item',243,'delete_studentitem'),(734,'Can add submission',244,'add_submission'),(735,'Can change submission',244,'change_submission'),(736,'Can delete submission',244,'delete_submission'),(737,'Can add score',245,'add_score'),(738,'Can change score',245,'change_score'),(739,'Can delete score',245,'delete_score'),(740,'Can add score summary',246,'add_scoresummary'),(741,'Can change score summary',246,'change_scoresummary'),(742,'Can delete score summary',246,'delete_scoresummary'),(743,'Can add score annotation',247,'add_scoreannotation'),(744,'Can change score annotation',247,'change_scoreannotation'),(745,'Can delete score annotation',247,'delete_scoreannotation'),(746,'Can add rubric',248,'add_rubric'),(747,'Can change rubric',248,'change_rubric'),(748,'Can delete rubric',248,'delete_rubric'),(749,'Can add criterion',249,'add_criterion'),(750,'Can change criterion',249,'change_criterion'),(751,'Can delete criterion',249,'delete_criterion'),(752,'Can add criterion option',250,'add_criterionoption'),(753,'Can change criterion option',250,'change_criterionoption'),(754,'Can delete criterion option',250,'delete_criterionoption'),(755,'Can add assessment',251,'add_assessment'),(756,'Can change assessment',251,'change_assessment'),(757,'Can delete assessment',251,'delete_assessment'),(758,'Can add assessment part',252,'add_assessmentpart'),(759,'Can change assessment part',252,'change_assessmentpart'),(760,'Can delete assessment part',252,'delete_assessmentpart'),(761,'Can add assessment feedback option',253,'add_assessmentfeedbackoption'),(762,'Can change assessment feedback option',253,'change_assessmentfeedbackoption'),(763,'Can delete assessment feedback option',253,'delete_assessmentfeedbackoption'),(764,'Can add assessment feedback',254,'add_assessmentfeedback'),(765,'Can change assessment feedback',254,'change_assessmentfeedback'),(766,'Can delete assessment feedback',254,'delete_assessmentfeedback'),(767,'Can add peer workflow',255,'add_peerworkflow'),(768,'Can change peer workflow',255,'change_peerworkflow'),(769,'Can delete peer workflow',255,'delete_peerworkflow'),(770,'Can add peer workflow item',256,'add_peerworkflowitem'),(771,'Can change peer workflow item',256,'change_peerworkflowitem'),(772,'Can delete peer workflow item',256,'delete_peerworkflowitem'),(773,'Can add training example',257,'add_trainingexample'),(774,'Can change training example',257,'change_trainingexample'),(775,'Can delete training example',257,'delete_trainingexample'),(776,'Can add student training workflow',258,'add_studenttrainingworkflow'),(777,'Can change student training workflow',258,'change_studenttrainingworkflow'),(778,'Can delete student training workflow',258,'delete_studenttrainingworkflow'),(779,'Can add student training workflow item',259,'add_studenttrainingworkflowitem'),(780,'Can change student training workflow item',259,'change_studenttrainingworkflowitem'),(781,'Can delete student training workflow item',259,'delete_studenttrainingworkflowitem'),(782,'Can add ai classifier set',260,'add_aiclassifierset'),(783,'Can change ai classifier set',260,'change_aiclassifierset'),(784,'Can delete ai classifier set',260,'delete_aiclassifierset'),(785,'Can add ai classifier',261,'add_aiclassifier'),(786,'Can change ai classifier',261,'change_aiclassifier'),(787,'Can delete ai classifier',261,'delete_aiclassifier'),(788,'Can add ai training workflow',262,'add_aitrainingworkflow'),(789,'Can change ai training workflow',262,'change_aitrainingworkflow'),(790,'Can delete ai training workflow',262,'delete_aitrainingworkflow'),(791,'Can add ai grading workflow',263,'add_aigradingworkflow'),(792,'Can change ai grading workflow',263,'change_aigradingworkflow'),(793,'Can delete ai grading workflow',263,'delete_aigradingworkflow'),(794,'Can add staff workflow',264,'add_staffworkflow'),(795,'Can change staff workflow',264,'change_staffworkflow'),(796,'Can delete staff workflow',264,'delete_staffworkflow'),(797,'Can add assessment workflow',265,'add_assessmentworkflow'),(798,'Can change assessment workflow',265,'change_assessmentworkflow'),(799,'Can delete assessment workflow',265,'delete_assessmentworkflow'),(800,'Can add assessment workflow step',266,'add_assessmentworkflowstep'),(801,'Can change assessment workflow step',266,'change_assessmentworkflowstep'),(802,'Can delete assessment workflow step',266,'delete_assessmentworkflowstep'),(803,'Can add assessment workflow cancellation',267,'add_assessmentworkflowcancellation'),(804,'Can change assessment workflow cancellation',267,'change_assessmentworkflowcancellation'),(805,'Can delete assessment workflow cancellation',267,'delete_assessmentworkflowcancellation'),(806,'Can add profile',268,'add_profile'),(807,'Can change profile',268,'change_profile'),(808,'Can delete profile',268,'delete_profile'),(809,'Can add video',269,'add_video'),(810,'Can change video',269,'change_video'),(811,'Can delete video',269,'delete_video'),(812,'Can add course video',270,'add_coursevideo'),(813,'Can change course video',270,'change_coursevideo'),(814,'Can delete course video',270,'delete_coursevideo'),(815,'Can add encoded video',271,'add_encodedvideo'),(816,'Can change encoded video',271,'change_encodedvideo'),(817,'Can delete encoded video',271,'delete_encodedvideo'),(818,'Can add subtitle',272,'add_subtitle'),(819,'Can change subtitle',272,'change_subtitle'),(820,'Can delete subtitle',272,'delete_subtitle'),(821,'Can add proctored exam',273,'add_proctoredexam'),(822,'Can change proctored exam',273,'change_proctoredexam'),(823,'Can delete proctored exam',273,'delete_proctoredexam'),(824,'Can add Proctored exam review policy',274,'add_proctoredexamreviewpolicy'),(825,'Can change Proctored exam review policy',274,'change_proctoredexamreviewpolicy'),(826,'Can delete Proctored exam review policy',274,'delete_proctoredexamreviewpolicy'),(827,'Can add proctored exam review policy history',275,'add_proctoredexamreviewpolicyhistory'),(828,'Can change proctored exam review policy history',275,'change_proctoredexamreviewpolicyhistory'),(829,'Can delete proctored exam review policy history',275,'delete_proctoredexamreviewpolicyhistory'),(830,'Can add proctored exam attempt',276,'add_proctoredexamstudentattempt'),(831,'Can change proctored exam attempt',276,'change_proctoredexamstudentattempt'),(832,'Can delete proctored exam attempt',276,'delete_proctoredexamstudentattempt'),(833,'Can add proctored exam attempt history',277,'add_proctoredexamstudentattempthistory'),(834,'Can change proctored exam attempt history',277,'change_proctoredexamstudentattempthistory'),(835,'Can delete proctored exam attempt history',277,'delete_proctoredexamstudentattempthistory'),(836,'Can add proctored allowance',278,'add_proctoredexamstudentallowance'),(837,'Can change proctored allowance',278,'change_proctoredexamstudentallowance'),(838,'Can delete proctored allowance',278,'delete_proctoredexamstudentallowance'),(839,'Can add proctored allowance history',279,'add_proctoredexamstudentallowancehistory'),(840,'Can change proctored allowance history',279,'change_proctoredexamstudentallowancehistory'),(841,'Can delete proctored allowance history',279,'delete_proctoredexamstudentallowancehistory'),(842,'Can add Proctored exam software secure review',280,'add_proctoredexamsoftwaresecurereview'),(843,'Can change Proctored exam software secure review',280,'change_proctoredexamsoftwaresecurereview'),(844,'Can delete Proctored exam software secure review',280,'delete_proctoredexamsoftwaresecurereview'),(845,'Can add Proctored exam review archive',281,'add_proctoredexamsoftwaresecurereviewhistory'),(846,'Can change Proctored exam review archive',281,'change_proctoredexamsoftwaresecurereviewhistory'),(847,'Can delete Proctored exam review archive',281,'delete_proctoredexamsoftwaresecurereviewhistory'),(848,'Can add proctored exam software secure comment',282,'add_proctoredexamsoftwaresecurecomment'),(849,'Can change proctored exam software secure comment',282,'change_proctoredexamsoftwaresecurecomment'),(850,'Can delete proctored exam software secure comment',282,'delete_proctoredexamsoftwaresecurecomment'),(851,'Can add organization',283,'add_organization'),(852,'Can change organization',283,'change_organization'),(853,'Can delete organization',283,'delete_organization'),(854,'Can add Link Course',284,'add_organizationcourse'),(855,'Can change Link Course',284,'change_organizationcourse'),(856,'Can delete Link Course',284,'delete_organizationcourse'),(857,'Can add historical Enterprise Customer',285,'add_historicalenterprisecustomer'),(858,'Can change historical Enterprise Customer',285,'change_historicalenterprisecustomer'),(859,'Can delete historical Enterprise Customer',285,'delete_historicalenterprisecustomer'),(860,'Can add Enterprise Customer',286,'add_enterprisecustomer'),(861,'Can change Enterprise Customer',286,'change_enterprisecustomer'),(862,'Can delete Enterprise Customer',286,'delete_enterprisecustomer'),(863,'Can add Enterprise Customer User',287,'add_enterprisecustomeruser'),(864,'Can change Enterprise Customer User',287,'change_enterprisecustomeruser'),(865,'Can delete Enterprise Customer User',287,'delete_enterprisecustomeruser'),(866,'Can add pending enterprise customer user',288,'add_pendingenterprisecustomeruser'),(867,'Can change pending enterprise customer user',288,'change_pendingenterprisecustomeruser'),(868,'Can delete pending enterprise customer user',288,'delete_pendingenterprisecustomeruser'),(869,'Can add Branding Configuration',289,'add_enterprisecustomerbrandingconfiguration'),(870,'Can change Branding Configuration',289,'change_enterprisecustomerbrandingconfiguration'),(871,'Can delete Branding Configuration',289,'delete_enterprisecustomerbrandingconfiguration'),(872,'Can add enterprise customer identity provider',290,'add_enterprisecustomeridentityprovider'),(873,'Can change enterprise customer identity provider',290,'change_enterprisecustomeridentityprovider'),(874,'Can delete enterprise customer identity provider',290,'delete_enterprisecustomeridentityprovider'),(875,'Can add historical Data Sharing Consent Audit State',291,'add_historicaluserdatasharingconsentaudit'),(876,'Can change historical Data Sharing Consent Audit State',291,'change_historicaluserdatasharingconsentaudit'),(877,'Can delete historical Data Sharing Consent Audit State',291,'delete_historicaluserdatasharingconsentaudit'),(878,'Can add Data Sharing Consent Audit State',292,'add_userdatasharingconsentaudit'),(879,'Can change Data Sharing Consent Audit State',292,'change_userdatasharingconsentaudit'),(880,'Can delete Data Sharing Consent Audit State',292,'delete_userdatasharingconsentaudit'),(881,'Can add student module history extended',293,'add_studentmodulehistoryextended'),(882,'Can change student module history extended',293,'change_studentmodulehistoryextended'),(883,'Can delete student module history extended',293,'delete_studentmodulehistoryextended'),(884,'Can add video upload config',294,'add_videouploadconfig'),(885,'Can change video upload config',294,'change_videouploadconfig'),(886,'Can delete video upload config',294,'delete_videouploadconfig'),(887,'Can add push notification config',295,'add_pushnotificationconfig'),(888,'Can change push notification config',295,'change_pushnotificationconfig'),(889,'Can delete push notification config',295,'delete_pushnotificationconfig'),(890,'Can add course creator',296,'add_coursecreator'),(891,'Can change course creator',296,'change_coursecreator'),(892,'Can delete course creator',296,'delete_coursecreator'),(893,'Can add studio config',297,'add_studioconfig'),(894,'Can change studio config',297,'change_studioconfig'),(895,'Can delete studio config',297,'delete_studioconfig'),(896,'Can add tag categories',298,'add_tagcategories'),(897,'Can change tag categories',298,'change_tagcategories'),(898,'Can delete tag categories',298,'delete_tagcategories'),(899,'Can add tag available values',299,'add_tagavailablevalues'),(900,'Can change tag available values',299,'change_tagavailablevalues'),(901,'Can delete tag available values',299,'delete_tagavailablevalues'),(902,'Can add user task status',300,'add_usertaskstatus'),(903,'Can change user task status',300,'change_usertaskstatus'),(904,'Can delete user task status',300,'delete_usertaskstatus'),(905,'Can add user task artifact',301,'add_usertaskartifact'),(906,'Can change user task artifact',301,'change_usertaskartifact'),(907,'Can delete user task artifact',301,'delete_usertaskartifact'),(908,'Can add flag',302,'add_flag'),(909,'Can change flag',302,'change_flag'),(910,'Can delete flag',302,'delete_flag'),(911,'Can add switch',303,'add_switch'),(912,'Can change switch',303,'change_switch'),(913,'Can delete switch',303,'delete_switch'),(914,'Can add sample',304,'add_sample'),(915,'Can change sample',304,'change_sample'),(916,'Can delete sample',304,'delete_sample'),(917,'Can deactivate, but NOT delete users',36,'can_deactivate_users'),(918,'Can add course mode target',305,'add_coursemodetarget'),(919,'Can change course mode target',305,'change_coursemodetarget'),(920,'Can delete course mode target',305,'delete_coursemodetarget'),(921,'Can add ignore mobile available flag config',306,'add_ignoremobileavailableflagconfig'),(922,'Can change ignore mobile available flag config',306,'change_ignoremobileavailableflagconfig'),(923,'Can delete ignore mobile available flag config',306,'delete_ignoremobileavailableflagconfig'),(924,'Can add user social auth',307,'add_usersocialauth'),(925,'Can change user social auth',307,'change_usersocialauth'),(926,'Can delete user social auth',307,'delete_usersocialauth'),(927,'Can add nonce',308,'add_nonce'),(928,'Can change nonce',308,'change_nonce'),(929,'Can delete nonce',308,'delete_nonce'),(930,'Can add association',309,'add_association'),(931,'Can change association',309,'change_association'),(932,'Can delete association',309,'delete_association'),(933,'Can add code',310,'add_code'),(934,'Can change code',310,'change_code'),(935,'Can delete code',310,'delete_code'),(936,'Can add failed task',311,'add_failedtask'),(937,'Can change failed task',311,'change_failedtask'),(938,'Can delete failed task',311,'delete_failedtask'),(939,'Can add crawlers config',312,'add_crawlersconfig'),(940,'Can change crawlers config',312,'change_crawlersconfig'),(941,'Can delete crawlers config',312,'delete_crawlersconfig'),(942,'Can add pending enrollment',313,'add_pendingenrollment'),(943,'Can change pending enrollment',313,'change_pendingenrollment'),(944,'Can delete pending enrollment',313,'delete_pendingenrollment'),(945,'Can add historical Enterprise Customer Entitlement',314,'add_historicalenterprisecustomerentitlement'),(946,'Can change historical Enterprise Customer Entitlement',314,'change_historicalenterprisecustomerentitlement'),(947,'Can delete historical Enterprise Customer Entitlement',314,'delete_historicalenterprisecustomerentitlement'),(948,'Can add Enterprise Customer Entitlement',315,'add_enterprisecustomerentitlement'),(949,'Can change Enterprise Customer Entitlement',315,'change_enterprisecustomerentitlement'),(950,'Can delete Enterprise Customer Entitlement',315,'delete_enterprisecustomerentitlement'),(951,'Can add historical enterprise course enrollment',316,'add_historicalenterprisecourseenrollment'),(952,'Can change historical enterprise course enrollment',316,'change_historicalenterprisecourseenrollment'),(953,'Can delete historical enterprise course enrollment',316,'delete_historicalenterprisecourseenrollment'),(954,'Can add enterprise course enrollment',317,'add_enterprisecourseenrollment'),(955,'Can change enterprise course enrollment',317,'change_enterprisecourseenrollment'),(956,'Can delete enterprise course enrollment',317,'delete_enterprisecourseenrollment'),(957,'Can add historical enrollment notification email template',318,'add_historicalenrollmentnotificationemailtemplate'),(958,'Can change historical enrollment notification email template',318,'change_historicalenrollmentnotificationemailtemplate'),(959,'Can delete historical enrollment notification email template',318,'delete_historicalenrollmentnotificationemailtemplate'),(960,'Can add enrollment notification email template',319,'add_enrollmentnotificationemailtemplate'),(961,'Can change enrollment notification email template',319,'change_enrollmentnotificationemailtemplate'),(962,'Can delete enrollment notification email template',319,'delete_enrollmentnotificationemailtemplate'),(963,'Can add grade report setting',320,'add_gradereportsetting'),(964,'Can change grade report setting',320,'change_gradereportsetting'),(965,'Can delete grade report setting',320,'delete_gradereportsetting'),(966,'Can add compute grades setting',321,'add_computegradessetting'),(967,'Can change compute grades setting',321,'change_computegradessetting'),(968,'Can delete compute grades setting',321,'delete_computegradessetting'),(969,'Can add block structure configuration',322,'add_blockstructureconfiguration'),(970,'Can change block structure configuration',322,'change_blockstructureconfiguration'),(971,'Can delete block structure configuration',322,'delete_blockstructureconfiguration'),(972,'Can add block structure model',323,'add_blockstructuremodel'),(973,'Can change block structure model',323,'change_blockstructuremodel'),(974,'Can delete block structure model',323,'delete_blockstructuremodel'),(975,'Can add hls playback enabled flag',324,'add_hlsplaybackenabledflag'),(976,'Can change hls playback enabled flag',324,'change_hlsplaybackenabledflag'),(977,'Can delete hls playback enabled flag',324,'delete_hlsplaybackenabledflag'),(978,'Can add course hls playback enabled flag',325,'add_coursehlsplaybackenabledflag'),(979,'Can change course hls playback enabled flag',325,'change_coursehlsplaybackenabledflag'),(980,'Can delete course hls playback enabled flag',325,'delete_coursehlsplaybackenabledflag'),(981,'Can add Waffle flag course override',326,'add_waffleflagcourseoverridemodel'),(982,'Can change Waffle flag course override',326,'change_waffleflagcourseoverridemodel'),(983,'Can delete Waffle flag course override',326,'delete_waffleflagcourseoverridemodel'),(984,'Can add Enterprise Integrated Channel',327,'add_enterpriseintegratedchannel'),(985,'Can change Enterprise Integrated Channel',327,'change_enterpriseintegratedchannel'),(986,'Can delete Enterprise Integrated Channel',327,'delete_enterpriseintegratedchannel'),(987,'Can add sap success factors global configuration',328,'add_sapsuccessfactorsglobalconfiguration'),(988,'Can change sap success factors global configuration',328,'change_sapsuccessfactorsglobalconfiguration'),(989,'Can delete sap success factors global configuration',328,'delete_sapsuccessfactorsglobalconfiguration'),(990,'Can add historical sap success factors enterprise customer configuration',329,'add_historicalsapsuccessfactorsenterprisecustomerconfiguration'),(991,'Can change historical sap success factors enterprise customer configuration',329,'change_historicalsapsuccessfactorsenterprisecustomerconfiguration'),(992,'Can delete historical sap success factors enterprise customer configuration',329,'delete_historicalsapsuccessfactorsenterprisecustomerconfiguration'),(993,'Can add sap success factors enterprise customer configuration',330,'add_sapsuccessfactorsenterprisecustomerconfiguration'),(994,'Can change sap success factors enterprise customer configuration',330,'change_sapsuccessfactorsenterprisecustomerconfiguration'),(995,'Can delete sap success factors enterprise customer configuration',330,'delete_sapsuccessfactorsenterprisecustomerconfiguration'),(996,'Can add learner data transmission audit',331,'add_learnerdatatransmissionaudit'),(997,'Can change learner data transmission audit',331,'change_learnerdatatransmissionaudit'),(998,'Can delete learner data transmission audit',331,'delete_learnerdatatransmissionaudit'),(999,'Can add catalog transmission audit',332,'add_catalogtransmissionaudit'),(1000,'Can change catalog transmission audit',332,'change_catalogtransmissionaudit'),(1001,'Can delete catalog transmission audit',332,'delete_catalogtransmissionaudit'),(1002,'Can add course edit lti fields enabled flag',333,'add_courseeditltifieldsenabledflag'),(1003,'Can change course edit lti fields enabled flag',333,'change_courseeditltifieldsenabledflag'),(1004,'Can delete course edit lti fields enabled flag',333,'delete_courseeditltifieldsenabledflag'),(1005,'Can add course discussion settings',334,'add_coursediscussionsettings'),(1006,'Can change course discussion settings',334,'change_coursediscussionsettings'),(1007,'Can delete course discussion settings',334,'delete_coursediscussionsettings'),(1008,'Can add Experiment Data',335,'add_experimentdata'),(1009,'Can change Experiment Data',335,'change_experimentdata'),(1010,'Can delete Experiment Data',335,'delete_experimentdata'),(1011,'Can add unregistered learner cohort assignments',336,'add_unregisteredlearnercohortassignments'),(1012,'Can change unregistered learner cohort assignments',336,'change_unregisteredlearnercohortassignments'),(1013,'Can delete unregistered learner cohort assignments',336,'delete_unregisteredlearnercohortassignments'),(1014,'Can add user social auth',337,'add_usersocialauth'),(1015,'Can change user social auth',337,'change_usersocialauth'),(1016,'Can delete user social auth',337,'delete_usersocialauth'),(1017,'Can add nonce',338,'add_nonce'),(1018,'Can change nonce',338,'change_nonce'),(1019,'Can delete nonce',338,'delete_nonce'),(1020,'Can add association',339,'add_association'),(1021,'Can change association',339,'change_association'),(1022,'Can delete association',339,'delete_association'),(1023,'Can add code',340,'add_code'),(1024,'Can change code',340,'change_code'),(1025,'Can delete code',340,'delete_code'),(1026,'Can add partial',341,'add_partial'),(1027,'Can change partial',341,'change_partial'),(1028,'Can delete partial',341,'delete_partial'),(1029,'Can add chord data',342,'add_chorddata'),(1030,'Can change chord data',342,'change_chorddata'),(1031,'Can delete chord data',342,'delete_chorddata'),(1032,'Can add video transcript enabled flag',343,'add_videotranscriptenabledflag'),(1033,'Can change video transcript enabled flag',343,'change_videotranscriptenabledflag'),(1034,'Can delete video transcript enabled flag',343,'delete_videotranscriptenabledflag'),(1035,'Can add course video transcript enabled flag',344,'add_coursevideotranscriptenabledflag'),(1036,'Can change course video transcript enabled flag',344,'change_coursevideotranscriptenabledflag'),(1037,'Can delete course video transcript enabled flag',344,'delete_coursevideotranscriptenabledflag'),(1038,'Can add video pipeline integration',345,'add_videopipelineintegration'),(1039,'Can change video pipeline integration',345,'change_videopipelineintegration'),(1040,'Can delete video pipeline integration',345,'delete_videopipelineintegration'),(1041,'Can add video uploads enabled by default',346,'add_videouploadsenabledbydefault'),(1042,'Can change video uploads enabled by default',346,'change_videouploadsenabledbydefault'),(1043,'Can delete video uploads enabled by default',346,'delete_videouploadsenabledbydefault'),(1044,'Can add course video uploads enabled by default',347,'add_coursevideouploadsenabledbydefault'),(1045,'Can change course video uploads enabled by default',347,'change_coursevideouploadsenabledbydefault'),(1046,'Can delete course video uploads enabled by default',347,'delete_coursevideouploadsenabledbydefault'),(1047,'Can add dynamic upgrade deadline configuration',348,'add_dynamicupgradedeadlineconfiguration'),(1048,'Can change dynamic upgrade deadline configuration',348,'change_dynamicupgradedeadlineconfiguration'),(1049,'Can delete dynamic upgrade deadline configuration',348,'delete_dynamicupgradedeadlineconfiguration'),(1050,'Can add course dynamic upgrade deadline configuration',349,'add_coursedynamicupgradedeadlineconfiguration'),(1051,'Can change course dynamic upgrade deadline configuration',349,'change_coursedynamicupgradedeadlineconfiguration'),(1052,'Can delete course dynamic upgrade deadline configuration',349,'delete_coursedynamicupgradedeadlineconfiguration'),(1053,'Can add org dynamic upgrade deadline configuration',350,'add_orgdynamicupgradedeadlineconfiguration'),(1054,'Can change org dynamic upgrade deadline configuration',350,'change_orgdynamicupgradedeadlineconfiguration'),(1055,'Can delete org dynamic upgrade deadline configuration',350,'delete_orgdynamicupgradedeadlineconfiguration'),(1056,'Can add social link',351,'add_sociallink'),(1057,'Can change social link',351,'change_sociallink'),(1058,'Can delete social link',351,'delete_sociallink'),(1059,'Can add course entitlement policy',352,'add_courseentitlementpolicy'),(1060,'Can change course entitlement policy',352,'change_courseentitlementpolicy'),(1061,'Can delete course entitlement policy',352,'delete_courseentitlementpolicy'),(1062,'Can add course entitlement',353,'add_courseentitlement'),(1063,'Can change course entitlement',353,'change_courseentitlement'),(1064,'Can delete course entitlement',353,'delete_courseentitlement'),(1065,'Can add video image',354,'add_videoimage'),(1066,'Can change video image',354,'change_videoimage'),(1067,'Can delete video image',354,'delete_videoimage'),(1068,'Can add video transcript',355,'add_videotranscript'),(1069,'Can change video transcript',355,'change_videotranscript'),(1070,'Can delete video transcript',355,'delete_videotranscript'),(1071,'Can add transcript preference',356,'add_transcriptpreference'),(1072,'Can change transcript preference',356,'change_transcriptpreference'),(1073,'Can delete transcript preference',356,'delete_transcriptpreference'),(1074,'Can add third party transcript credentials state',357,'add_thirdpartytranscriptcredentialsstate'),(1075,'Can change third party transcript credentials state',357,'change_thirdpartytranscriptcredentialsstate'),(1076,'Can delete third party transcript credentials state',357,'delete_thirdpartytranscriptcredentialsstate'),(1077,'Can add migrate verified track cohorts setting',358,'add_migrateverifiedtrackcohortssetting'),(1078,'Can change migrate verified track cohorts setting',358,'change_migrateverifiedtrackcohortssetting'),(1079,'Can delete migrate verified track cohorts setting',358,'delete_migrateverifiedtrackcohortssetting'),(1080,'Can add course goal',359,'add_coursegoal'),(1081,'Can change course goal',359,'change_coursegoal'),(1082,'Can delete course goal',359,'delete_coursegoal'),(1083,'Can add block completion',360,'add_blockcompletion'),(1084,'Can change block completion',360,'change_blockcompletion'),(1085,'Can delete block completion',360,'delete_blockcompletion'),(1086,'Can add Experiment Key-Value Pair',361,'add_experimentkeyvalue'),(1087,'Can change Experiment Key-Value Pair',361,'change_experimentkeyvalue'),(1088,'Can delete Experiment Key-Value Pair',361,'delete_experimentkeyvalue'),(1089,'Can add historical Enterprise Customer Catalog',362,'add_historicalenterprisecustomercatalog'),(1090,'Can change historical Enterprise Customer Catalog',362,'change_historicalenterprisecustomercatalog'),(1091,'Can delete historical Enterprise Customer Catalog',362,'delete_historicalenterprisecustomercatalog'),(1092,'Can add Enterprise Customer Catalog',363,'add_enterprisecustomercatalog'),(1093,'Can change Enterprise Customer Catalog',363,'change_enterprisecustomercatalog'),(1094,'Can delete Enterprise Customer Catalog',363,'delete_enterprisecustomercatalog'),(1095,'Can add enterprise customer reporting configuration',364,'add_enterprisecustomerreportingconfiguration'),(1096,'Can change enterprise customer reporting configuration',364,'change_enterprisecustomerreportingconfiguration'),(1097,'Can delete enterprise customer reporting configuration',364,'delete_enterprisecustomerreportingconfiguration'),(1098,'Can add historical Data Sharing Consent Record',365,'add_historicaldatasharingconsent'),(1099,'Can change historical Data Sharing Consent Record',365,'change_historicaldatasharingconsent'),(1100,'Can delete historical Data Sharing Consent Record',365,'delete_historicaldatasharingconsent'),(1101,'Can add Data Sharing Consent Record',366,'add_datasharingconsent'),(1102,'Can change Data Sharing Consent Record',366,'change_datasharingconsent'),(1103,'Can delete Data Sharing Consent Record',366,'delete_datasharingconsent'),(1104,'Can add learner data transmission audit',367,'add_learnerdatatransmissionaudit'),(1105,'Can change learner data transmission audit',367,'change_learnerdatatransmissionaudit'),(1106,'Can delete learner data transmission audit',367,'delete_learnerdatatransmissionaudit'),(1107,'Can add catalog transmission audit',368,'add_catalogtransmissionaudit'),(1108,'Can change catalog transmission audit',368,'change_catalogtransmissionaudit'),(1109,'Can delete catalog transmission audit',368,'delete_catalogtransmissionaudit'),(1110,'Can add degreed global configuration',369,'add_degreedglobalconfiguration'),(1111,'Can change degreed global configuration',369,'change_degreedglobalconfiguration'),(1112,'Can delete degreed global configuration',369,'delete_degreedglobalconfiguration'),(1113,'Can add historical degreed enterprise customer configuration',370,'add_historicaldegreedenterprisecustomerconfiguration'),(1114,'Can change historical degreed enterprise customer configuration',370,'change_historicaldegreedenterprisecustomerconfiguration'),(1115,'Can delete historical degreed enterprise customer configuration',370,'delete_historicaldegreedenterprisecustomerconfiguration'),(1116,'Can add degreed enterprise customer configuration',371,'add_degreedenterprisecustomerconfiguration'),(1117,'Can change degreed enterprise customer configuration',371,'change_degreedenterprisecustomerconfiguration'),(1118,'Can delete degreed enterprise customer configuration',371,'delete_degreedenterprisecustomerconfiguration'),(1119,'Can add degreed learner data transmission audit',372,'add_degreedlearnerdatatransmissionaudit'),(1120,'Can change degreed learner data transmission audit',372,'change_degreedlearnerdatatransmissionaudit'),(1121,'Can delete degreed learner data transmission audit',372,'delete_degreedlearnerdatatransmissionaudit'),(1122,'Can add sap success factors learner data transmission audit',373,'add_sapsuccessfactorslearnerdatatransmissionaudit'),(1123,'Can change sap success factors learner data transmission audit',373,'change_sapsuccessfactorslearnerdatatransmissionaudit'),(1124,'Can delete sap success factors learner data transmission audit',373,'delete_sapsuccessfactorslearnerdatatransmissionaudit'),(1125,'Can add persistent subsection grade override',374,'add_persistentsubsectiongradeoverride'),(1126,'Can change persistent subsection grade override',374,'change_persistentsubsectiongradeoverride'),(1127,'Can delete persistent subsection grade override',374,'delete_persistentsubsectiongradeoverride'),(1128,'Can add Schedule',375,'add_schedule'),(1129,'Can change Schedule',375,'change_schedule'),(1130,'Can delete Schedule',375,'delete_schedule'),(1131,'Can add schedule config',376,'add_scheduleconfig'),(1132,'Can change schedule config',376,'change_scheduleconfig'),(1133,'Can delete schedule config',376,'delete_scheduleconfig'),(1134,'Can add schedule experience',377,'add_scheduleexperience'),(1135,'Can change schedule experience',377,'change_scheduleexperience'),(1136,'Can delete schedule experience',377,'delete_scheduleexperience'),(1137,'Can add new assets page flag',378,'add_newassetspageflag'),(1138,'Can change new assets page flag',378,'change_newassetspageflag'),(1139,'Can delete new assets page flag',378,'delete_newassetspageflag'),(1140,'Can add course new assets page flag',379,'add_coursenewassetspageflag'),(1141,'Can change course new assets page flag',379,'change_coursenewassetspageflag'),(1142,'Can delete course new assets page flag',379,'delete_coursenewassetspageflag');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!M9I2WXRegdpSxWvfvOY61ceUPEMEhCNrhMM2huV8',NULL,1,'ecommerce_worker','','','ecommerce_worker@example.com',1,1,'2016-12-17 01:36:43.677170'),(2,'pbkdf2_sha256$20000$u8I8y2VuUvqV$735GMkStWaNyOaD6mB81isaTJjgr7AGl1RAZ6Nci4w0=','2016-12-18 05:11:31.932674',1,'edx','','','edx@example.com',1,1,'2016-12-17 01:53:34.104225'),(3,'pbkdf2_sha256$20000$7LkYbekAHaMd$2InidT7nklBXmbU7LBjV/KrV+xZhLENf6CqU6u/FwM4=',NULL,1,'credentials_worker','','','credentials_worker@example.com',1,1,'2016-12-17 01:53:56.965130'),(4,'pbkdf2_sha256$20000$cteCw0RJ3uVK$rkfQUabaBl2XTR4XHI7CSQMVuaznmAV7o/CsJI3utjg=',NULL,1,'discovery_worker','','','discovery_worker@example.com',1,1,'2016-12-17 01:55:18.267378'),(5,'pbkdf2_sha256$20000$gsjW1GgOxZZM$slHH+xxXLN0bl49irkkMIoyvmvBdL/PxOhU7rddgMQY=',NULL,0,'programs_worker','','','programs_worker@example.com',1,1,'2016-12-17 01:59:43.985839'),(6,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'honor','','','honor@example.com',0,1,'2017-06-07 00:44:10.768269'),(7,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'audit','','','audit@example.com',0,1,'2017-06-07 00:44:15.095537'),(8,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'verified','','','verified@example.com',0,1,'2017-06-07 00:44:19.391633'),(9,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'staff','','','staff@example.com',1,1,'2017-06-07 00:44:23.760465'),(10,'pbkdf2_sha256$20000$ayR9ljKsRuTn$O/xC1JEi+5hoiwVmOLywLz4YWiwfITXhGgFTSyEyxb8=',NULL,0,'enterprise_worker','','','enterprise_worker@example.com',0,1,'2018-01-31 21:13:18.474889');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (1,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,2),(2,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,3),(3,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,4),(4,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,5),(5,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,6),(6,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,7),(7,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,8),(8,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,9),(9,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1),(10,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_xblockcache`
--

LOCK TABLES `bookmarks_xblockcache` WRITE;
/*!40000 ALTER TABLE `bookmarks_xblockcache` DISABLE KEYS */;
INSERT INTO `bookmarks_xblockcache` VALUES (1,'2017-06-07 00:43:57.110637','2018-01-31 21:14:08.351648','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX Demonstration Course','[]'),(2,'2017-06-07 00:44:03.930577','2018-01-31 21:14:10.348510','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@5ab88e67d46049b9aa694cb240c39cef','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c\",\"Drag and Drop\"]]]'),(3,'2017-06-07 00:44:03.934127','2018-01-31 21:14:10.350808','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@0aa7a3bdbe18427795b0c1a1d7c3cb9a','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(4,'2017-06-07 00:44:03.937842','2018-01-31 21:14:10.352312','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions','Homework - Question Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"]]]'),(5,'2017-06-07 00:44:03.940968','2018-01-31 21:14:10.353876','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7','Pointing on a Picture','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(6,'2017-06-07 00:44:03.943920','2018-01-31 21:14:10.355396','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@discussion_5deb6081620d','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286\",\"Discussion Forums\"]]]'),(7,'2017-06-07 00:44:03.948536','2018-01-31 21:14:10.356758','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6cee45205a449369d7ef8f159b22bdf','Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(8,'2017-06-07 00:44:03.951584','2018-01-31 21:14:10.358172','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2574c523e97b477a9d72fbb37bfb995f','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(9,'2017-06-07 00:44:03.954880','2017-06-07 00:44:03.955070','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration','Example Week 3: Be Social','[]'),(10,'2017-06-07 00:44:03.958603','2018-01-31 21:14:10.359597','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@ed5dccf14ae94353961f46fa07217491','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76\",\"Video Demonstrations\"]]]'),(11,'2017-06-07 00:44:03.961972','2018-01-31 21:14:10.361042','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@8293139743f34377817d537b69911530','EdX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@934cc32c177d41b580c8413e561346b3\",\"EdX Exams\"]]]'),(12,'2017-06-07 00:44:03.965571','2018-01-31 21:14:10.362422','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@030e35c4756a4ddc8d40b95fbbfff4d4','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc\",\"Introduction: Video and Sequences\"]]]'),(13,'2017-06-07 00:44:03.970048','2018-01-31 21:14:10.363787','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@932e6f2ce8274072a355a94560216d1a','Perchance to Dream','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(14,'2017-06-07 00:44:03.973627','2017-06-07 00:44:03.973816','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions','Example Week 2: Get Interactive','[]'),(15,'2017-06-07 00:44:03.978058','2017-06-07 00:44:03.978246','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7','About Exams and Certificates','[]'),(16,'2017-06-07 00:44:03.981528','2018-01-31 21:14:10.365207','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_ChemFormula_Problem','Chemical Equations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b\",\"Chemical Equations\"]]]'),(17,'2017-06-07 00:44:03.985386','2018-01-31 21:14:10.366548','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e0d7423118ab432582d03e8e8dad8e36','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471\",\"Zooming Diagrams\"]]]'),(18,'2017-06-07 00:44:03.989965','2018-01-31 21:14:10.367831','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e','Reading Assignments','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(19,'2017-06-07 00:44:03.993492','2018-01-31 21:14:10.369111','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(20,'2017-06-07 00:44:03.998066','2018-01-31 21:14:10.370576','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@6f7a6670f87147149caeff6afa07a526','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e\",\"An Interactive Reference Table\"]]]'),(21,'2017-06-07 00:44:04.001736','2018-01-31 21:14:10.371785','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(22,'2017-06-07 00:44:04.005486','2018-01-31 21:14:10.373008','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1','Electric Circuit Simulator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(23,'2017-06-07 00:44:04.010134','2018-01-31 21:14:10.374130','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations','Homework - Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(24,'2017-06-07 00:44:04.013789','2018-01-31 21:14:10.375367','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050','Peer Assessed Essays','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"]]]'),(25,'2017-06-07 00:44:04.018108','2018-01-31 21:14:10.376822','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@c2f7008c9ccf4bd09d5d800c98fb0722','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(26,'2017-06-07 00:44:04.021650','2018-01-31 21:14:10.378214','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_editmolB','Molecule Editor','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(27,'2017-06-07 00:44:04.025337','2018-01-31 21:14:10.379588','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e2cb0e0994f84b0abfa5f4ae42ed9d44','Video Presentation Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(28,'2017-06-07 00:44:04.030039','2018-01-31 21:14:10.380874','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9','Working with Videos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(29,'2017-06-07 00:44:04.033686','2018-01-31 21:14:10.382192','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@312cb4faed17420e82ab3178fc3e251a','Getting Help','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(30,'2017-06-07 00:44:04.039297','2018-01-31 21:14:10.384159','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960','Google Hangout','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"]]]'),(31,'2017-06-07 00:44:04.043094','2018-01-31 21:14:10.385609','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ed01bcd164e64038a78964a16eac3edc','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(32,'2017-06-07 00:44:04.047499','2018-01-31 21:14:10.386942','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165','Molecule Editor','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(33,'2017-06-07 00:44:04.051032','2018-01-31 21:14:10.388314','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@891211e17f9a472290a5f12c7a6626d7','Code Grader','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(34,'2017-06-07 00:44:04.054658','2018-01-31 21:14:10.389673','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d1b84dcd39b0423d9e288f27f0f7f242','Few Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(35,'2017-06-07 00:44:04.059240','2018-01-31 21:14:10.390883','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa','Answering More Than Once','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(36,'2017-06-07 00:44:04.063011','2018-01-31 21:14:10.392272','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@45d46192272c4f6db6b63586520bbdf4','Getting Answers','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93\",\"Getting Answers\"]]]'),(37,'2017-06-07 00:44:04.067511','2018-01-31 21:14:10.393417','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa','More Ways to Connect','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(38,'2017-06-07 00:44:04.071108','2018-01-31 21:14:10.394611','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e','Lesson 3 - Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(39,'2017-06-07 00:44:04.074752','2018-01-31 21:14:10.395931','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@d45779ad3d024a40a09ad8cc317c0970','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(40,'2017-06-07 00:44:04.080357','2018-01-31 21:14:10.397234','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@9cee77a606ea4c1aa5440e0ea5d0f618','Interactive Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1\",\"Interactive Questions\"]]]'),(41,'2017-06-07 00:44:04.084066','2018-01-31 21:14:10.398483','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91','Limited Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(42,'2017-06-07 00:44:04.089937','2018-01-31 21:14:10.399696','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@934cc32c177d41b580c8413e561346b3','EdX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(43,'2017-06-07 00:44:04.095887','2018-01-31 21:14:10.401094','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@e0254b911fa246218bd98bbdadffef06','Reading Assignments','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(44,'2017-06-07 00:44:04.101826','2018-01-31 21:14:10.402481','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4d672c5893cb4f1dad0de67d2008522e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b\",\"Chemical Equations\"]]]'),(45,'2017-06-07 00:44:04.105307','2018-01-31 21:14:10.403824','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@f480df4ce91347c5ae4301ddf6146238','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93\",\"Getting Answers\"]]]'),(46,'2017-06-07 00:44:04.109545','2018-01-31 21:14:10.405131','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@03f051f9a8814881a3783d2511613aa6','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c\",\"Electronic Sound Experiment\"]]]'),(47,'2017-06-07 00:44:04.113055','2018-01-31 21:14:10.406470','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6bcccc2d7343416e9e03fd7325b2f232','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(48,'2017-06-07 00:44:04.117777','2018-01-31 21:14:10.407833','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@d5a5caaf35e84ebc9a747038465dcfb4','Electronic Circuit Simulator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(49,'2017-06-07 00:44:04.121328','2018-01-31 21:14:10.409243','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@0b9e39477cf34507a7a48f74be381fdd','Welcome!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc\",\"Introduction: Video and Sequences\"]]]'),(50,'2017-06-07 00:44:04.124870','2018-01-31 21:14:10.410969','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@78d7d3642f3a4dbabbd1b017861aa5f2','Lesson 2: Let\'s Get Interactive!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d0d804e8863c4a95a659c04d8a2b2bc0\",\"Lesson 2 - Let\'s Get Interactive! \"]]]'),(51,'2017-06-07 00:44:04.129145','2018-01-31 21:14:10.412513','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@c6cd4bea43454aaea60ad01beb0cf213','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(52,'2017-06-07 00:44:04.132749','2018-01-31 21:14:10.413943','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@cd177caa62444fbca48aa8f843f09eac','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(53,'2017-06-07 00:44:04.136334','2018-01-31 21:14:10.415727','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@12ad4f3ff4c14114a6e629b00e000976','Peer Grading','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050\",\"Peer Assessed Essays\"]]]'),(54,'2017-06-07 00:44:04.140976','2018-01-31 21:14:10.417125','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@logic_gate_problem','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(55,'2017-06-07 00:44:04.145443','2018-01-31 21:14:10.418399','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e','An Interactive Reference Table','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(56,'2017-06-07 00:44:04.150952','2017-06-07 00:44:04.151179','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b','Introduction','[]'),(57,'2017-06-07 00:44:04.154519','2018-01-31 21:14:10.419535','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations','Lesson 2 - Let\'s Get Interactive!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(58,'2017-06-07 00:44:04.160913','2018-01-31 21:14:10.420775','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1','Interactive Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(59,'2017-06-07 00:44:04.164529','2018-01-31 21:14:10.422140','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_proteinmake','Designing Proteins in Two Dimensions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(60,'2017-06-07 00:44:04.170368','2018-01-31 21:14:10.423511','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@0a3b4139f51a4917a3aff9d519b1eeb6','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(61,'2017-06-07 00:44:04.174017','2018-01-31 21:14:10.424840','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@Lab_5B_Mosfet_Amplifier_Experiment','Electronic Sound Experiment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c\",\"Electronic Sound Experiment\"]]]'),(62,'2017-06-07 00:44:04.178582','2018-01-31 21:14:10.426422','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@722085be27c84ac693cfebc8ac5da700','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(63,'2017-06-07 00:44:04.182203','2018-01-31 21:14:10.428092','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@700x_pathways','Zooming Diagrams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471\",\"Zooming Diagrams\"]]]'),(64,'2017-06-07 00:44:04.185785','2018-01-31 21:14:10.429563','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@5c90cffecd9b48b188cbfea176bf7fe9','Video','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(65,'2017-06-07 00:44:04.190232','2018-01-31 21:14:10.430967','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e5eac7e1a5a24f5fa7ed77bb6d136591','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7\",\"Pointing on a Picture\"]]]'),(66,'2017-06-07 00:44:04.193987','2018-01-31 21:14:10.432292','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@867dddb6f55d410caaa9c1eb9c6743ec','Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(67,'2017-06-07 00:44:04.198714','2018-01-31 21:14:10.433720','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_Algebraic_Problem','Mathematical Expressions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00\",\"Mathematical Expressions\"]]]'),(68,'2017-06-07 00:44:04.202209','2018-01-31 21:14:10.435075','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4f06b358a96f4d1dae57d6d81acd06f2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(69,'2017-06-07 00:44:04.210129','2018-01-31 21:14:10.436517','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@55cbc99f262443d886a25cf84594eafb','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(70,'2017-06-07 00:44:04.214017','2017-06-07 00:44:04.214270','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations','Example Week 1: Getting Started','[]'),(71,'2017-06-07 00:44:04.218133','2018-01-31 21:14:10.437998','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@8bb218cccf8d40519a971ff0e4901ccf','Getting Help','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@312cb4faed17420e82ab3178fc3e251a\",\"Getting Help\"]]]'),(72,'2017-06-07 00:44:04.221805','2018-01-31 21:14:10.439362','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@1a810b1a3b2447b998f0917d0e5a802b','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c\",\"Overall Grade Performance\"]]]'),(73,'2017-06-07 00:44:04.225715','2018-01-31 21:14:10.440711','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_limited_checks','Limited Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(74,'2017-06-07 00:44:04.231678','2018-01-31 21:14:10.441857','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow','edX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"]]]'),(75,'2017-06-07 00:44:04.235303','2018-01-31 21:14:10.443092','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42','Text input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(76,'2017-06-07 00:44:04.240099','2018-01-31 21:14:10.444833','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@636541acbae448d98ab484b028c9a7f6','Connecting a Circuit and a Circuit Diagram','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(77,'2017-06-07 00:44:04.243779','2018-01-31 21:14:10.446271','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00','Mathematical Expressions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(78,'2017-06-07 00:44:04.253803','2018-01-31 21:14:10.447730','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@b8cec2a19ebf463f90cd3544c7927b0e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa\",\"Answering More Than Once\"]]]'),(79,'2017-06-07 00:44:04.259698','2018-01-31 21:14:10.449148','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@5e009378f0b64585baa0a14b155974b9','Passing a Course','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff\",\"Passing a Course\"]]]'),(80,'2017-06-07 00:44:04.263474','2018-01-31 21:14:10.450548','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@a0effb954cca4759994f1ac9e9434bf4','Multiple Choice Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68\",\"Multiple Choice Questions\"]]]'),(81,'2017-06-07 00:44:04.268107','2018-01-31 21:14:10.451803','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c','Numerical Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(82,'2017-06-07 00:44:04.271927','2018-01-31 21:14:10.453182','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@openassessment+block@b24c33ea35954c7889e1d2944d3fe397','Open Response Assessment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050\",\"Peer Assessed Essays\"]]]'),(83,'2017-06-07 00:44:04.275673','2018-01-31 21:14:10.454426','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131','Immediate Feedback','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(84,'2017-06-07 00:44:04.279976','2018-01-31 21:14:10.455819','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@148ae8fa73ea460eb6f05505da0ba6e6','Getting Your edX Certificate','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45\",\"Getting Your edX Certificate\"]]]'),(85,'2017-06-07 00:44:04.283600','2018-01-31 21:14:10.457219','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@python_grader','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(86,'2017-06-07 00:44:04.287937','2018-01-31 21:14:10.458652','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@412dc8dbb6674014862237b23c1f643f','Working with Videos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(87,'2017-06-07 00:44:04.291592','2018-01-31 21:14:10.460357','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_49b4494da2f7','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286\",\"Discussion Forums\"]]]'),(88,'2017-06-07 00:44:04.295883','2018-01-31 21:14:10.461894','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2b94658d2eee4d85ae13f83bc24cfca9','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(89,'2017-06-07 00:44:04.300496','2018-01-31 21:14:10.463310','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_07d547513285','An Interactive Reference Table','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e\",\"An Interactive Reference Table\"]]]'),(90,'2017-06-07 00:44:04.304769','2018-01-31 21:14:10.465010','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@3169f89efde2452993f2f2d9bc74f5b2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1\",\"Interactive Questions\"]]]'),(91,'2017-06-07 00:44:04.309387','2018-01-31 21:14:10.466789','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4aba537a78774bd5a862485a8563c345','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131\",\"Immediate Feedback\"]]]'),(92,'2017-06-07 00:44:04.313327','2018-01-31 21:14:10.468464','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@303034da25524878a2e66fb57c91cf85','Attributing Blame','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(93,'2017-06-07 00:44:04.318229','2018-01-31 21:14:10.470162','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@23e6eda482c04335af2bb265beacaf59','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff\",\"Passing a Course\"]]]'),(94,'2017-06-07 00:44:04.323382','2018-01-31 21:14:10.471536','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0','Video Presentation Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(95,'2017-06-07 00:44:04.327973','2018-01-31 21:14:10.472918','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@c554538a57664fac80783b99d9d6da7c','Pointing on a Picture','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7\",\"Pointing on a Picture\"]]]'),(96,'2017-06-07 00:44:04.332071','2018-01-31 21:14:10.474192','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@26d89b08f75d48829a63520ed8b0037d','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855\",\"Homework - Find Your Study Buddy\"]]]'),(97,'2017-06-07 00:44:04.335751','2018-01-31 21:14:10.475499','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c','Drag and Drop','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(98,'2017-06-07 00:44:04.340409','2018-01-31 21:14:10.477101','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_3','Randomized Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a\",\"Randomized Questions\"]]]'),(99,'2017-06-07 00:44:04.344650','2018-01-31 21:14:10.478933','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_2','Immediate Feedback','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131\",\"Immediate Feedback\"]]]'),(100,'2017-06-07 00:44:04.351446','2018-01-31 21:14:10.480411','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@82d599b014b246c7a9b5dfc750dc08a9','Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@867dddb6f55d410caaa9c1eb9c6743ec\",\"Getting Started\"]]]'),(101,'2017-06-07 00:44:04.355260','2018-01-31 21:14:10.481834','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@f4a39219742149f781a1dda6f43a623c','Overall Grade','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c\",\"Overall Grade Performance\"]]]'),(102,'2017-06-07 00:44:04.359932','2018-01-31 21:14:10.483216','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@651e0945b77f42e0a4c89b8c3e6f5b3b','Answering More Than Once','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa\",\"Answering More Than Once\"]]]'),(103,'2017-06-07 00:44:04.363771','2018-01-31 21:14:10.484624','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d2e35c1d294b4ba0b3b1048615605d2a','Drag and Drop','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c\",\"Drag and Drop\"]]]'),(104,'2017-06-07 00:44:04.368012','2018-01-31 21:14:10.485965','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@870371212ba04dcf9536d7c7b8f3109e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00\",\"Mathematical Expressions\"]]]'),(105,'2017-06-07 00:44:04.371531','2018-01-31 21:14:10.487363','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@78e3719e864e45f3bee938461f3c3de6','Protein Builder','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(106,'2017-06-07 00:44:04.375152','2018-01-31 21:14:10.488776','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ffa5817d49e14fec83ad6187cbe16358','Reading Sample','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(107,'2017-06-07 00:44:04.379738','2018-01-31 21:14:10.490008','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68','Multiple Choice Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(108,'2017-06-07 00:44:04.383447','2018-01-31 21:14:10.491224','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93','Getting Answers','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(109,'2017-06-07 00:44:04.388097','2018-01-31 21:14:10.492464','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae','Protein Creator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(110,'2017-06-07 00:44:04.392036','2018-01-31 21:14:10.494092','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@f9f3a25e7bab46e583fd1fbbd7a2f6a0','Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3c4b575924bf4b75a2f3542df5c354fc\",\"Be Social\"]]]'),(111,'2017-06-07 00:44:04.396164','2018-01-31 21:14:10.495641','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@9f9e1373cc8243b985c8750cc8acec7d','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76\",\"Video Demonstrations\"]]]'),(112,'2017-06-07 00:44:04.402103','2018-01-31 21:14:10.496818','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5','Lesson 1 - Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"]]]'),(113,'2017-06-07 00:44:04.405922','2018-01-31 21:14:10.498271','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@67c26b1e826e47aaa29757f62bcd1ad0','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68\",\"Multiple Choice Questions\"]]]'),(114,'2017-06-07 00:44:04.410299','2018-01-31 21:14:10.499707','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ade92343df3d4953a40ab3adc8805390','Google Hangout','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(115,'2017-06-07 00:44:04.414247','2018-01-31 21:14:10.500957','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b','Chemical Equations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(116,'2017-06-07 00:44:04.418788','2018-01-31 21:14:10.502266','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55','Code Grader','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(117,'2017-06-07 00:44:04.422425','2018-01-31 21:14:10.503512','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d0d804e8863c4a95a659c04d8a2b2bc0','Lesson 2 - Let\'s Get Interactive! ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(118,'2017-06-07 00:44:04.426312','2018-01-31 21:14:10.504645','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(119,'2017-06-07 00:44:04.431034','2018-01-31 21:14:10.506011','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@6244918637ed4ff4b5f94a840a7e4b43','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42\",\"Text input\"]]]'),(120,'2017-06-07 00:44:04.438880','2018-01-31 21:14:10.507269','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff','Passing a Course','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(121,'2017-06-07 00:44:04.442617','2018-01-31 21:14:10.508487','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e','Homework - Essays','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(122,'2017-06-07 00:44:04.446689','2018-01-31 21:14:10.509902','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3c4b575924bf4b75a2f3542df5c354fc','Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(123,'2017-06-07 00:44:04.451425','2018-01-31 21:14:10.511517','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2bee8c4248e842a19ba1e73ed8d426c2','Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6cee45205a449369d7ef8f159b22bdf\",\"Labs and Demos\"]]]'),(124,'2017-06-07 00:44:04.454995','2018-01-31 21:14:10.512869','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a','Randomized Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(125,'2017-06-07 00:44:04.459194','2018-01-31 21:14:10.514253','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6b6bee43c7c641509da71c9299cc9f5a','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45\",\"Getting Your edX Certificate\"]]]'),(126,'2017-06-07 00:44:04.462606','2018-01-31 21:14:10.515612','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c','Overall Grade Performance','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(127,'2017-06-07 00:44:04.466210','2018-01-31 21:14:10.516743','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135','New Subsection','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e\",\"holding section\"]]]'),(128,'2017-06-07 00:44:04.470488','2018-01-31 21:14:10.518157','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@free_form_simulation','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(129,'2017-06-07 00:44:04.474016','2018-01-31 21:14:10.519602','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@0d759dee4f9d459c8956136dbde55f02','Text Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42\",\"Text input\"]]]'),(130,'2017-06-07 00:44:04.478627','2018-01-31 21:14:10.520802','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction','Demo Course Overview','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"]]]'),(131,'2017-06-07 00:44:04.482078','2018-01-31 21:14:10.522142','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6018785795994726950614ce7d0f38c5','Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855\",\"Homework - Find Your Study Buddy\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@26d89b08f75d48829a63520ed8b0037d\",\"Homework - Find Your Study Buddy\"]]]'),(132,'2017-06-07 00:44:04.485444','2017-06-07 00:44:04.485631','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e','holding section','[]'),(133,'2017-06-07 00:44:04.489825','2018-01-31 21:14:10.523400','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45','Getting Your edX Certificate','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(134,'2017-06-07 00:44:04.493485','2018-01-31 21:14:10.524636','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(135,'2017-06-07 00:44:04.497864','2018-01-31 21:14:10.525869','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471','Zooming Diagrams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(136,'2017-06-07 00:44:04.501379','2018-01-31 21:14:10.527495','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ddede76df71045ffa16de9d1481d2119','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a\",\"Randomized Questions\"]]]'),(137,'2017-06-07 00:44:04.505020','2018-01-31 21:14:10.528937','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc','Introduction: Video and Sequences','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"]]]'),(138,'2017-06-07 00:44:04.509479','2018-01-31 21:14:10.530924','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@7e9b434e6de3435ab99bd3fb25bde807','Science and Cooking Chef Profile: JOSÉ ANDRÉS','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(139,'2017-06-07 00:44:04.513006','2018-01-31 21:14:10.532420','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@75f9562c77bc4858b61f907bb810d974','Numerical Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c\",\"Numerical Input\"]]]'),(140,'2017-06-07 00:44:04.517444','2018-01-31 21:14:10.533807','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@501aed9d902349eeb2191fa505548de2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c\",\"Numerical Input\"]]]'),(141,'2017-06-07 00:44:04.521205','2018-01-31 21:14:10.535066','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c','Electronic Sound Experiment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(142,'2017-06-07 00:44:05.897680','2017-06-07 00:44:05.897979','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@af7fe1335eb841cd81ce31c7ee8eb069','Video','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4e592689563243c484af947465eaef0d\",\"New Unit\"]]]'),(143,'2017-06-07 00:44:05.902830','2017-06-07 00:44:05.903075','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@45c7cedb4bfe46f4a68c78787151cfb5','New Unit','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e\",\"holding section\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135\",\"New Subsection\"]]]'),(144,'2017-06-07 00:44:05.906665','2017-06-07 00:44:05.906893','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@9d5104b502f24ee89c3d2f4ce9d347cf','When Are Your Exams? ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d91b9e5d8bc64d57a1332d06bf2f2193\",\"When Are Your Exams? \"]]]'),(145,'2017-06-07 00:44:05.911313','2017-06-07 00:44:05.911541','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@ab98b0e385e64445ae97e730ffdf17e7','Biology Demonstration','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(146,'2017-06-07 00:44:05.914854','2017-06-07 00:44:05.915070','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4e592689563243c484af947465eaef0d','New Unit','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(147,'2017-06-07 00:44:05.918961','2017-06-07 00:44:05.919185','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@ffcd6351126d4ca984409180e41d1b51','Exciting Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606\",\"Exciting Labs and Tools\"]]]'),(148,'2017-06-07 00:44:05.922554','2017-06-07 00:44:05.922821','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@87fa6792d79f4862be098e5169e93339','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@7efc7bf4a47b4a6cb6595c32cde7712a\",\"Homework - Find Your Study Buddy\"]]]'),(149,'2017-06-07 00:44:05.926111','2017-06-07 00:44:05.926326','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606','Exciting Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(150,'2017-06-07 00:44:05.931844','2017-06-07 00:44:05.932099','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2d3efa8db04346548bd5e5374de77628','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(151,'2017-06-07 00:44:05.935548','2017-06-07 00:44:05.935764','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(152,'2017-06-07 00:44:05.939841','2017-06-07 00:44:05.940068','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@1c8d47c425724346a7968fa1bc745dcd','Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606\",\"Exciting Labs and Tools\"]]]'),(153,'2017-06-07 00:44:05.943266','2017-06-07 00:44:05.943481','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb6b62dbec4348528629cf2232b86aea','Instructor Programmed Responses','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(154,'2017-06-07 00:44:05.947431','2017-06-07 00:44:05.947649','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@8f89194410954e768bde1764985454a7','Molecule Structures','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(155,'2017-06-07 00:44:05.952231','2017-06-07 00:44:05.952458','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@eb469ec408fa4ab1a9b86c634ca9bfa9','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(156,'2017-06-07 00:44:05.955630','2017-06-07 00:44:05.955853','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@9b9687073e904ae197799dc415df899f','Molecule Structures','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@8f89194410954e768bde1764985454a7\",\"Molecule Structures\"]]]'),(157,'2017-06-07 00:44:05.959900','2017-06-07 00:44:05.960124','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@7efc7bf4a47b4a6cb6595c32cde7712a','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(158,'2017-06-07 00:44:05.963387','2017-06-07 00:44:05.963609','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d7daeff25e4f4026bdd269ae69e03e02','Instructor-Programmed Responses','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb6b62dbec4348528629cf2232b86aea\",\"Instructor Programmed Responses\"]]]'),(159,'2017-06-07 00:44:05.968870','2017-06-07 00:44:05.969094','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d91b9e5d8bc64d57a1332d06bf2f2193','When Are Your Exams? ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(160,'2018-01-31 21:27:05.908636','2018-01-31 21:27:06.153949','course-v1:edX+E2E-101+course','block-v1:edX+E2E-101+course+type@course+block@course','Manual Smoke Test Course 1 - Auto','[]'),(161,'2018-01-31 21:27:06.158432','2018-01-31 21:27:06.158635','course-v1:edX+E2E-101+course','block-v1:edX+E2E-101+course+type@chapter+block@5e637f321727429fb53374cbfb4ff28a','Section :754c5e889ac3489e9947ba62b916bdab','[]'),(162,'2018-01-31 21:27:06.161580','2018-01-31 21:27:06.161777','course-v1:edX+E2E-101+course','block-v1:edX+E2E-101+course+type@sequential+block@3322473e23a1436986e38912cd581d09','Subsection :56c1bc20d270414b877e9c178954b6ed','[[[\"block-v1:edX+E2E-101+course+branch@draft-branch+version@5a7234aab65909059994f4a0+type@chapter+block@5e637f321727429fb53374cbfb4ff28a\",\"Section :754c5e889ac3489e9947ba62b916bdab\"]]]');
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
  `long_term_cache_ttl` int(10) unsigned NOT NULL,
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
  `language_specific_templates_enabled` tinyint(1) NOT NULL,
  `self_generation_enabled` tinyint(1) NOT NULL,
  `include_hours_of_effort` tinyint(1) DEFAULT NULL,
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
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2016-12-17 01:36:30.747065',0,'{\"default\": {\"accomplishment_class_append\": \"accomplishment-certificate\", \"platform_name\": \"Your Platform Name Here\", \"logo_src\": \"/static/certificates/images/logo.png\", \"logo_url\": \"http://www.example.com\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"company_about_url\": \"http://www.example.com/about-us\"}, \"verified\": {\"certificate_type\": \"Verified\", \"certificate_title\": \"Verified Certificate of Achievement\"}, \"honor\": {\"certificate_type\": \"Honor Code\", \"certificate_title\": \"Certificate of Achievement\"}}',NULL);
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
  `language` varchar(2),
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificatete_organization_id_48edf53bc66f8e0c_uniq` (`organization_id`,`course_key`,`mode`,`language`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatewhitelist`
--

LOCK TABLES `certificates_certificatewhitelist` WRITE;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` DISABLE KEYS */;
INSERT INTO `certificates_certificatewhitelist` VALUES (1,'course-v1:edX+DemoX+Demo_Course',1,'2017-06-07 00:44:46.592519',NULL,6),(2,'course-v1:edX+DemoX+Demo_Course',1,'2017-06-07 00:44:51.035391',NULL,7),(3,'course-v1:edX+DemoX+Demo_Course',1,'2017-06-07 00:44:55.486418',NULL,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_commerceconfiguration`
--

LOCK TABLES `commerce_commerceconfiguration` WRITE;
/*!40000 ALTER TABLE `commerce_commerceconfiguration` DISABLE KEYS */;
INSERT INTO `commerce_commerceconfiguration` VALUES (1,'2017-06-07 00:43:16.006423',1,1,'/basket/single-item/',NULL,0,'/checkout/receipt/?order_number=',1),(2,'2017-06-21 16:00:44.804939',1,1,'/basket/single-item/',NULL,0,'/checkout/receipt/?order_number=',1),(3,'2018-01-31 21:13:27.608254',1,1,'/basket/single-item/',NULL,0,'/checkout/receipt/?order_number=',1);
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
  UNIQUE KEY `completion_blockcompletion_course_key_54aa5e002d4e74a2_uniq` (`course_key`,`block_key`,`user_id`),
  KEY `completion_blockcompletion_course_key_4e99db81ed8510f4_idx` (`course_key`,`block_type`,`user_id`),
  KEY `completion_blockcompletion_user_id_1d63de3a4a8ef1e5_idx` (`user_id`,`course_key`,`modified`),
  CONSTRAINT `completion_blockcompleti_user_id_515d6897018815d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `consent_datasharing_enterprise_customer_id_667a1480f56052a2_uniq` (`enterprise_customer_id`,`username`,`course_id`),
  CONSTRAINT `D030ccea2714cf8f0a2e65e948ee3d2d` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
  `history_change_reason` varchar(100),
  PRIMARY KEY (`history_id`),
  KEY `consent_histori_history_user_id_305b7992a9839525_fk_auth_user_id` (`history_user_id`),
  KEY `consent_historicaldatasharingconsent_b80bb774` (`id`),
  CONSTRAINT `consent_histori_history_user_id_305b7992a9839525_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `contentstore_coursenewassetspageflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_coursenewassetspageflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_cours_changed_by_id_649924e37af184c_fk_auth_user_id` (`changed_by_id`),
  KEY `contentstore_coursenewassetspageflag_ea134da7` (`course_id`),
  CONSTRAINT `contentstore_cours_changed_by_id_649924e37af184c_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_coursenewassetspageflag`
--

LOCK TABLES `contentstore_coursenewassetspageflag` WRITE;
/*!40000 ALTER TABLE `contentstore_coursenewassetspageflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_coursenewassetspageflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_newassetspageflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_newassetspageflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_newa_changed_by_id_30fcd15e7b674dbb_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `contentstore_newa_changed_by_id_30fcd15e7b674dbb_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_newassetspageflag`
--

LOCK TABLES `contentstore_newassetspageflag` WRITE;
/*!40000 ALTER TABLE `contentstore_newassetspageflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_newassetspageflag` ENABLE KEYS */;
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
-- Table structure for table `course_goals_coursegoal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_coursegoal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `goal_key` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_goals_coursegoal_user_id_7b4ac74987215807_uniq` (`user_id`,`course_key`),
  KEY `course_goals_coursegoal_c8235886` (`course_key`),
  CONSTRAINT `course_goals_coursegoal_user_id_49a6194cb5f88933_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemode`
--

LOCK TABLES `course_modes_coursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemode` DISABLE KEYS */;
INSERT INTO `course_modes_coursemode` VALUES (1,'course-v1:edX+DemoX+Demo_Course','verified','Verified Certificate',149,'usd','2019-01-31 21:22:40.820392',NULL,'',NULL,'8CF08E5',1,NULL),(2,'course-v1:edX+DemoX+Demo_Course','audit','Audit',0,'usd',NULL,NULL,'',NULL,'68EFFFF',0,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverview`
--

LOCK TABLES `course_overviews_courseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverview` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverview` VALUES ('2017-06-07 00:43:57.033186','2018-01-31 21:14:10.555509',6,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,NULL,'both',NULL,NULL,NULL,'edX',0,NULL,1,NULL,NULL),('2018-01-31 21:27:05.925175','2018-01-31 21:27:06.172514',6,'course-v1:edX+E2E-101+course','block-v1:edX+E2E-101+course+type@course+block@course','Manual Smoke Test Course 1 - Auto','E2E-101','edX','2016-01-01 00:00:00.000000','2018-12-31 00:00:00.000000',NULL,'/static/studio/images/pencils.jpg',NULL,NULL,'end',0,1,0,'','',0.50,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,NULL,'both',NULL,NULL,'','edX',0,NULL,1,NULL,'2019-01-02 00:00:00.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewtab`
--

LOCK TABLES `course_overviews_courseoverviewtab` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewtab` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverviewtab` VALUES (37,'info','course-v1:edX+DemoX+Demo_Course'),(38,'courseware','course-v1:edX+DemoX+Demo_Course'),(39,'discussion','course-v1:edX+DemoX+Demo_Course'),(40,'wiki','course-v1:edX+DemoX+Demo_Course'),(41,'textbooks','course-v1:edX+DemoX+Demo_Course'),(42,'progress','course-v1:edX+DemoX+Demo_Course'),(49,'info','course-v1:edX+E2E-101+course'),(50,'courseware','course-v1:edX+E2E-101+course'),(51,'discussion','course-v1:edX+E2E-101+course'),(52,'wiki','course-v1:edX+E2E-101+course'),(53,'progress','course-v1:edX+E2E-101+course'),(54,'textbooks','course-v1:edX+E2E-101+course'),(55,'pdf_textbooks','course-v1:edX+E2E-101+course');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_structures_coursestructure`
--

LOCK TABLES `course_structures_coursestructure` WRITE;
/*!40000 ALTER TABLE `course_structures_coursestructure` DISABLE KEYS */;
INSERT INTO `course_structures_coursestructure` VALUES (1,'2017-06-07 00:43:57.067140','2018-01-31 21:14:10.600977','course-v1:edX+DemoX+Demo_Course','H4sIAKIxcloC/81dWXNct3L+KxO95CG5VVgam15uZFm+dsqLYjlx1mJhaUhTGnJ0Z4aWlVv572nM\nUBSXQwMHZ4aHJZVF0hycPo1G99cr/vYsrNbx/fbZ88XfDl/+6Tf+HNO//8PXeL4+/Pfs5fpys8V/\n2H36gP8UD1/vf/Xqmy+fPSu/Qt8+u/of/7h49nbjEyb6WfarLdIP8npz7nf0g4vL1Yq+v9z6t3j2\nHj+Vz/VSQOvEd8tV2uAFLfNfbeu88x92uLlaKFmvuRNErOQARnpjBYiUEVMOWYXyiPGrLi/oax93\ny9/wLNGvXmx3G79b0r996x24eXa9bPdC23Vc+tV+obcHivrW4cAh56Q4yABBMZuNdEFp6QNoG0zf\nqi5Hryw4YxIDa1WIjnP0RnuHWTh89j+0bFpuP6z8p7MLf76XOVp98fVNHi8OD3j2f400/LZMuL6i\nwGeTkUupMFjgMVkeSTCiQbQYmHYDMr//+GlEfhRld87CEKv+bU9qK1+2+NdLvNiRvHzedKPQ6AhO\ncTorXrgEWnAuNRdaIxtSCF/WOA2HxtPYozJ+w81uGa+fkYNxKQafpCJp195GLTVkm0lrOKbYoJh+\nuz7Hj+vN+8WfFq+2W/9p27wP73bnn5+MSaUYMwePDqSSTvMMOntmBDfg+MAOlE+fhvdj6GoQzvbz\nens3QEUTMZEaykjPBK9tNJb+cMVjDmroyF6tcKJTO5K+Bt78iB8X/3qx3DXziBaIl9stacMrKqxh\n0nDBRfAMUsxOSZ1MNMFmyZkbOrtf1rjFp93m8ihsGk/iMYXow2YdVnj+WX5/P/uwN6wRz1bL8+WO\njG18h7cA0jVfrj56EqY0k9XAi+8Pn1i8PHyiW+0XrZVX64/t6v0uN569+t3v+TVdv18TcwQ97iTE\nKEXkhDeAB2VZJNMqUWkuQQfZCmLuLPv527PMwGf0kXHJO9cKWmsRCBFF5iDE6AKdkmSFYdHR314S\ns+PJJsmziRlsROdYtskaUB4hZj/1zX2UjjAKWu963/x6LUlmOxDEkZn10sUDQxEF7a61EJwKPDqX\ngzaWOKohdi5L4MvZnKTz2gGQitdBWE0ShZwrlnPnskmj98S/JAICT+gFCzbwkEMkwkE9iILLKWs/\n52N51GhGj6UJO7ZwtD64gWDILksnuDMgOLhsLPc8JU/2WnotZLOI3LNq3FvOAvcyCPIvgyOJYY6T\ng4PKWybC4G7+RG/vV6vFXwpXF69xs2fnRWx3au7RAT54JQ35t8ZASPRwLcDSP+S0RQlDMOmxAUCV\nxGMCgBt778iPZcWLFVkA+VMuyiQykFpMEkhDzoWqq3Q18OPXd3ixeLHBxX/QMw4a4s+LHiZxsB5t\n9kaiB80w6MyUYip5FrxG3cKkY0nOGLIaePQX3O2WF28PLCqK9GXRPZm0z679wN2gSQQHWtkkEBES\nCTD57dnKEAXZ1uiHggiPwaoqWad00rKOPABKrj1w54MiY5klQx0NszgYV3lUJ61G30Tzogm7xSiS\nkSCBa3RIeIa+EyrQ4ZaiGSrciAgR+gi0GuqEtKryZFtCkjnQmoS8WHMM7r4e5iJFmwKBTwOMTpgW\nQppAVpBnDTIPmqxfCZiXQ/RxuXu32AeaRkCRm3Gu4CzZemkVaoACSJ1BIwlOpczpqxkjcDXKGs7P\nV8v1av320+2AZb9rlgLpvsiEIWgIGZ3PwQDQCSc/Rlk1ZNQfPSJXpfEInpzQybpQotAqEUAUhMil\nEgwTbRiTJtUict8sL9JB/b/ZXaZPi68uU/rUq+tkilynYBOdHBAkL5KstyPCmCQg79ncuq5K30Rd\nxwjrkhvtsuIeCOp66XMuWMYFjmSge3SdKu5uzhgT6TxyhqyNgVxrbkhLm3zQz126zgjBrAooDLkW\nPmonY8YQrY8EIQwbjuUe1NtifVHQQq+YCK5EAg/epwgxMJ+VIKDryBFJPMdBRfeIDleVvB4puR3e\nikqBktYrozVkH8lmERxxLrmkifn9Phcq9OScc6+8gKwIHWIyhuxZ4lIrxwc39fV6ebGHgbStfvF6\nGXeXm3b4NzKrOJA6PSxwotzp6Jzn6K29p/cx/V7yjJt1utxnLAeZ/t3NX+g8SIklywCtJS8RvFOe\ntjgyQrheBBHi7Pq2St9EfWtsMklqEFl6SMGHkHhg3FjNvVdZDDL+e9xuSdAFGb/vcff32wU5QYvv\nvqSt/67dSWxOfc8q9H+ckp8u7uQ0SGYIB+asgL4itZZcyYcl8izom1Zldm/h4LfLeEY/3B6oHdrN\n4td/WOHiV8T3C/588dmjfbPzmx1xtTtqpLPx5AWwbA0H+uuipxfUvqT2vBJDXv8DUaOjbet4Gk/o\n115HqQnfskyeGLDcHCo9lcIZJmoqqiNnWKoIRpGHnIp/CCw4lUPIOUOCHlRHCyAhCmNilqBot4wH\nwvAQCJTynIZh+02T8fzgaS48wfc3+4MTsTsCDqic0NYRyhFAqprwYCbiQBOawMzS3Ntapa/LkRpT\nYnKU1PQYyzVT4LVKV0v29crAPn/AvvbwK+eYyLHlnPxdiN5ZAOa4ZSVNxIOarfyjSlcDv179Hpd7\nm/W9D9v9gf5lvV61H+bbrgU91kKKSbrAQMjkUFibhcmMZJzA7gCnHi+tXyWugV3f0LEbmdi/TcRq\n/ZZgxVu/w7PPbz4nTwbIOabZrnsnTyBSdo+mI0TGhrHAEC/LSlelk4uSf/xtiR+PUE4jZxWr25Q0\nSNTPpHnW58v/xbT4l2vIPZ0L8yqc25Q0cOG783NMSzqMi28QyQDG9/0uRM5eWW4SOOSQMVrpk+bW\nxICcjIZ9Ci5ElcYWyUGf9j7X3hXrjgpa61Lg2pDrAo6QByc0BslanZ1KfO4yjCp506OCRtFSWkRj\nAmFcZYPm2TETguUsOdPsaNzbZMW4x+SSY0LSRmMQ3HHaeKYU2ITDcZIfL89xUxhA4O3DZTvKvf1O\nWnFkDlQwJoNA5iFaF2yUqLMKcige+HjaoUpcg/C/uNh+JD6R+P+w3uDil3f+YvHTmHqVh8wWz5gV\nRBHEIJceU/aHaZou8AeFcUZo7vwbIvly5c9ef9n8LlGHpI2IyjpZcm48+cQSapMEY1YJMdxIUQjY\nS/qrv176cYZvbGHlvBvZUvc5JVRihZNckqqSWYI0plgWJU3QznGu5HBO6dXoAr6bpR3KQFRCojMB\nSDe7ZEQOgZ6Zg3NqtgqmKl0NquUX/H1C3bvywdoi+qAZuOB8qdWMQQCL0kUc4sxjl71VSXyM+GVk\n0mRplEl5KIwwi569RdPEM5mUV9H7LBVawBCdN2CYtKBVijk0o4rbqjtvEM/K+59tl0Vxj2moa/F/\n+5R/ZqTElPVOZ0ik/JE4qJPlPiamH8gHvVph3BHQWbxcbuLlcrd4c3ih9ab/7FVLX+c/e1UST3j2\nqnXe8x7DKnkTT2RL5ebIJXXQARFkNFEDV8wlb3h0wrkYXVZ+UPKPUv15T7AS7Q0anbLhDBT5l1wn\ndKXkhhjK+VDB42PLfpXEY8r+eC01P4OqJD6GYXY2Zi1KIbhpNswnTyzeImqiHjCM/X72we/efSxN\nsb3ihCwZEJJz6wNIoaxITKJFS76PRakHj/5/rtfn5eh/vfTEuz7oHUWmN7CRVEyGkEjnqGQZi2RJ\nAjNithxWla5jCu8YoDVP8XsL/qumqPYYaX0xCSXdi/ozE8gZBfIWLcF/EYOEbDSq7JLzXD6JGt4q\njUfIVFT7pB/KPr+5DFucVEFWLR+eWe9W6ZuogjXjxGhlnHIOjNBOMc0hIuHgLG0cZv3RyqfHl1I9\ngRPRUu419URYbVJKhIsVbTtnpL68ixyDi5pOIva2rbb0unQs21JW3kOt5yF44WmZDCxErzAKUFgC\n1mTz26vJ73RA0+smx4jSCBCj8YrlxD1tHfHc2faGnDsnVenMjQdwVoJwmVxLzciRFARGELCXCQRg\nGI/Mk3ejQZhkI0meTjrbTBKSenusvSFU4GIyRB5wS+/Ok7Q2g1Okflkvb7mElJWOqgiYZymQc52S\nyj5iNqCxty/a8eCQUEwg7y4pQ4ZHEsoj2RVZcCf/qM6Vk5bqLYocjNa/WL3FsPHLeB2rnzOF8yBR\nDajmB4LeSMQcQv+/f9jgHld3B/+vnYQkRcguCEFnbG4LOkzURLP5vQ9n6quzH9bbjLuzF7QFy7zE\nzRkxETfLc7IX3e5MmXageHbeWlKn5HFKY2Uij4trLr0fdmdu4NM360syyTcI6UDy5EIRHgiMA51f\nsg3eBZVyNIqlyGxbG+spPJsqXQ1C36sL7uEAsBiDI/1mCLUGrb2QjEujBakl7+STmIlVpfEIWEVG\nCMooekogd9MoL8jVKk0lKtK/uRerfJkCYq1Ngey/sL1mSXJRsqEeEzdA6NkKHyQ3NkeJdLJ6h4sQ\nBIyGXtqDCWQ1Y9DKqZJeTGgMF8NBxyuzJMksfYV0WstUvv5YWjX48QRKbKo0nigeYWhxwx1aDQgq\nS4JQrrj9PMso02xzC6pkNbCDjPwOlxfkbtHvYXsI4jZ2AILopR1MGILCWZcpNqXkSZODGULKQwGb\nxwM2VeJG6PpDjUpvNZ+TAnUWkdSGAWaEl0p5ckI0E+T2kPZoY9PRDthI6lrECTfxXRkys9itF19v\n0J/3QsDqeKl5M1st068m1vS01FR1qVFag/xfT5qDTI6W2bGYyMBCNE6YwIYreyZXZ92p0NtH7A/K\n59y/H8I4j6ch7hHTIOlf43b59qLw40qFbhekRn/5SGJf0PI49+feFrnskOCVjNEKkMFZFS2B01ia\nyjEORhMf3RpXaWzg4qH1qjzrRi9lj59hstckvsm4XGaNBDo5FhXXjkyilPP5GTW6Gnj01cpfvF98\n+8sP3y9eEyU97KkGZ2diT5WuBvZMCxzfVgQfPu3erS/O9u+8mVUl3abkmLh25BDuWRuuW0aET2+7\nvp4HOmj3wvpyd6iq3HeU3ajsmB7e8h7J5FpNKmHuUp1hmiZGt6zjgnPkJjtybYVwzKtMLnRpthY6\nNY+XqpyNLvMVdUwQ0IMEBfTSXjOfGC9jQmMWfDgU/HKd8DBRsd1VGsOPeRzJlm2q6Z8ezlTnFPRP\nC/6cWXx2lOjXXbqOEOxqmY3TsSyYFJLKVmoC9Fj6j0o/vIwsGHLkdG8MTUEILnAQdGogCuFzJDAT\ngxa2ZMHs1NAci05IMF5F1pvferC1omdzGlqUOpZFSy9InhcmELQp1iqZMPtgAoJC6E0Y5hLREClg\nJF1mlSCc6UiFCSmC1aTYaqn3z02KBKA+rUZYtRsapHx5Bi4AOEhe5CZNdgpEeZ+QFl/u2jYsvllv\nLvsHIFeToTOnsFqStZMmIDc08XcZa15mhZgIQhnyNUHTi2ibPQ/RgEpxeMrH1HEAN+da6KJQuY/B\nI4BNrkSgLQQmbCkDy4M7+zgjJauUNRnvi4tS/kS88td1aYVhX767qm/sD2lUo07zF+tWSTymH3Zf\nxoVPkGXOEMnv4VAK2IULjCFjzJknkYGp0tgUI8bNHimSuE3IV9Xm880vTlUSjylO9zCr9sFFII3J\nOKlOES2W1k2U2gTANBhAf/SscpXGIwBtmUXk3AfvyqBjUE4bMh/J+BghOT3cSbmPcf/qP21LHuNK\nO3bGlAb7u+YMLT3UcHaKzGm1jXUmh7dGVgM7xjfb1u/jmzXY9sAFgdPja1/ErLk3494aV8QdY6nq\n9W7V6Yji+d1RXL0J4YhIPiYhb/RkUT15m0CmFL1KLJPz3qgnTpUQrlHXcEpu8KhjGM7NNvAkyVUu\n9TsF/yuwISmkMwulREaLIVY9Tnt6ja4GJo1qT3+w7WmuQXd3e69qb9vdMTW2qnvuWYsNVedTnO2W\nCxO7cGs1sXv0TO7YKru5p983VAFOSpuEILiNtLllQqrizjvDc2YIjnH66R/2IH+Lqw9dUK320LlS\n6DW6GlROF2/GdtLMLJQtnT7TJtJUSqaPWSM9rkJ+Jslsq90f0RHaXXE/6kqf2SKVLZcN1bj1Ji7L\ngOZDKn693l8X9PId5lKFlZcrfL7455/e/PdlaVJevPjx658PX77p7uqs9WLN3dXZ0Cs25dC3dICf\nImDdF28jq0z+iXOQy3o+ZK8yoSMQZWQfwB/gltcb3NKB8xPTYNVra2bSVC3X6TSV6k29sKbaMjnz\neWpp6ZyE2QNohxGYzR48nVYXrI5almRZaaTpOU8td4od26k9tQcwXBjwRCqk7hYrHGd242DjZZce\nrF6CfpIWzvuzga5/cKYSKRlmuRaDVyA8ehrrIdIa1GB/rcBAzTmm5e58vfpq1nzAbUoaWPDDmiDr\n5QoXr+hDU4a7VS+JfAKiUqWxgWFT7rW8R5CQqDF5sCKSdiYYnQV5yFoF9NFn9RSmglVJPGa26d7T\nq9fxPQGpqtJ4MkA2fqT1/PJUJfGk8iS5dtk6zPQkUMI5WYZFJFdqj7IKIxh0Onmq0nhMDo26fmm2\naEOVshbFjau4Ph9x0c6DrecaWaksl5nN3bk4TNN0GHvvmow+ZFYbKDm0TZMu3Lg/N8OTqMiQAnLy\nA41xKrBIPiBBaBmDG9q/x1aIVRJPqhBj4nSqvNeC3M0cIp0r7222hIbIu/BDkfDHZlCVxGMy6GYB\nrMvSC4UmlA4lVFbmxHMIyXiR9eC9zY9zu1aNrgZ+jB8ycZMA8NKR2TYgOLhsbJHW5HUGSZskh2Tm\nMQqBqmQ18KVcdORXq0PzS3fxPDNJgVFcCjtbO+Z9Qhpe/8XFzUKYxc+YcbMP0f/iw4g7bMaXfD8B\n2FWlsYF/vcXpD1h1Qa4qY0YYq4ZKqueZmHWLqIkh1EEh7dq96qWvJxT3URfTz4ahq5S1uqnd+YJa\na9PMU0Bq5E2H1cmkIpVkuyEDEzqkJLTzqB0yiWz4JobvSgT+Mu7Wm5IXLVVW54SNf8btB0LGfakt\npWKIzmVRIJUsrXCEJyIhKuUAfR66iOFRbFaVrgYRnXY9TAbLUoaIjksyBmUAjGSEIrLmQBhixOV0\nJ4PDVRKPCYf/sP73CTQd3KkhntpfkFiyDJAET0bwTnmtXGSQrBdBhDi5nfWu7Zyy1t2Z+1PWujsF\ns2Ot6m3UfzD2Tiz+NPVW5PEjAeY/yVUST3qSB6rwn0qL/nCDwOTDrSMiKMFUqbGR2iWD2WauiuCH\nlCf3vWcftCewyXUzjm0d3DFlrbvXZk1ZK0RdxkpEnX2vArPZOu4AOHMK0GgbEhIIBWdVOQam1uF+\n7WOVB00JDdZG6j4Bn7RK41FTAS17/kTi3XflcNKFMw2jN8dj/aE5dF0ygMUkxMSJOg1MWm+s0+C5\nRh8lpuHLuz+PAn25wWl3tmkTyU/haIVGMN574UiT5DIwJHGyVk/AjFZJPOEhqSqzec9LlbzpPq0L\nTlvDjETHwCN3xjiXInCV6OFuuL/huurkzd61vdz0z9+qXoUwc9ys5aqGqVvQ0NvXdbKqmeiTdgky\nyVCqCEZpD6kU7gALTuUQcs6Qmm6OOkkBbo2ulvxL5xzIh+xhprOXySAwLp/Mda23aJou5Tdz0s21\n6vdLwHzwShoyosZASMpbLcDSP+S3RvLDhkW6hNyWfoeLbxBT8PF9v0El5peKU5myTOCU9EC6QXoS\nI8uUdE+ioqlKY4OE/2W9fksK/lt/8XZ9OaL7pWXe/1NJhdy9hGByKuTusKuu3XuoIPaUFbBREaAg\nbKqM1pB9tIwclUBAwCWdvBlKCT9eUWyVuAZxfr1eXuy734hTfvF6uQctPVat2jUwk1Vr6WY4Ve97\n9Z7eeQoKqmSd0NDfN1xJGxGVdbK0K/NEjk0ql8QLxqwS4imM3KqSeExH7E5mTRRIxpNwECB4FmTg\nDKzmSjOVROttDKfRP1XiGvjy9ca/PUS9Nuv2tufB5pSX7/CclH2JrT6ly8qGyGpgTPnYoc/lr5cj\n+5TuRxIEWV9utTSYgLB8UNmBt4R+DNLWPYWcQZXEY56xm/flgiLH3ieZmICCBxl9Y2OU3ETmzGzF\ncFW6Tmi2kAkFwXGevShjh2xIzoZAei9nzIMTQh/HlNfoauDJz7if6bd4sS1XY5QG9r5KA2TMSWMz\nCxqUVcF75jkErpQj/6sJ7ZzAslfJakGEnlhzGLK5f0jn6DCXo1cWnDGJbAKREmnj0BvtHWbhhuz6\nI84Rq1LX4/WMv056iP/v1qu9hI6963lk+HJOy1glrkFMp4Rab1MjGf0pvqlSAqyxXqDWOShDMhHz\nYKXrIw44q1LXwKsXu91mGS73fh4B9/PuuFz19sO5hx413M44aXZ0rUT9ODXpYxP88wZGW+oPpjBd\nkLNqY5lGjxbK5OPgOZLuSDaB0HE4Wt+ZTR/z2HlMfJWsBn3QyZw7+x4NOpuTdF47ACx3FgqryeAh\n54rlucWySt5EsWzBWl2uULUz+aiobewlGvNuassdHxPzMZ5hzsEpiNED2ZIyqof76MoAw2JW+kv5\na/n8QZhzudoty1DXl+/Wy9iTeXywFCtKQhAJrR8cRD7PvU43aZq+lTdTa6vl+XKH6Sy+w/i+eTDv\nnYAXDxZSJJ0SGAiZHAprszCZZZNF+90o41sBB7X44Y3KaLHyRq3ysP6AF6QscLst3u8VAUFAlBK9\nVEXwjbUO93E9SDKjdEP1HrfXOQ2866O1wQL+RAtf9xqUYMDn1+g8VUFrOsfkT0bmIMToAvk3yQrD\nSneKG4qwPeYBq5I3/ay13GDcdTaqfQF/NNNx7F3IY+88n9nfqdI3EeNUrwat1LROu/dy7LVh856x\nllvNpvZZNSRcus6Y8sHaktICzcAF5wtmjqRoGRnkiMPFbn2pm/ETEZ9A4UiVxgaTc9QhjpqUeIx0\nLiWBUq6xNNpl+k6oILKQTc7pSS7LrdF1zDTO2EtU5g5O1eibqKxbUkZjfdyGxsWuA1WtxDpi6dWd\n+nWVndIiGhMiWGWD5tkxE4LlLJHjPmtgvEpcw/H58fIcN/vM8XcXH45QoXar/eeJ+Il3W5KmhRcd\naGXJtiJCsoQvuSQrHiK5GTm2jzutDCzsOibVGTrHHH14r2/cuBQD6RMVQGtvo5aa7F/OiI6p2dVp\nlb4eueh2OLu2t3pT3WCkr1xNd/BYyfl/td2WK036crTbfVpif5vS281Dl349YlZ2gJ6j5GHBIp0W\nAclkBPKFvSAPUhotdKkAlM09TPcWpoNpc2SC1HWAjI5MoiGxEGiBK9ve4jj+0rkhybh1/5N8vhif\neBo51mHW4rMacQ2m8ssIij9NGkFxRzNxCSkrHclP9uBZCqRAErmGnjwpA3r2kTdV+iZa1JY6nbFG\nWhmISkh0dADIsXbJiByCNCEH51Rzj/OdOgQpUBMqRysMMCNIwytC5+RNE7BIvNmfHp+x74uEkddZ\nbgEEsj+kbaIlwFziDJHgQYm1Dc8dnFDwNL5nc/5CwiqJJ/RAk+PBoUo2RA1JGc+lFImRlSHnl7dH\ngU918Kv0TTz45bYGBkExWg4QrYsyiX3oNpXQ7XAY6dd3eLF4scFDnHB/W+WfF91dk7Xb6+d1YKrk\nTY8RsmSUS+TKZJfITY9lcgmXOoWESmXWn6OqVug+VIK6WI7yQ0e+zpwYpIXXLUW6Iz31kfnqOTnU\nkkyvVvo9nAIvHNus17tmd+Pw9YG2eFUo8f/upOD2JOgAAA==\n','H4sIAKIxcloC/6VX3Y4dNQx+lWpvC1Ls2HHcq0rwENxVTuxIFZRFlCIQ4t35ZirB/bBn9/zMHsWJ\n/f3NXy8eSUNnmzaPeNI63HbR2to7/lMv7968rJ9e94/f/k7vKn94+319ev36/OG71y+/fq63v/35\nS73Pj5/3l8+fP77+/Pb++vtqacKdaMaSzjo5W69ZMyNn9fHyzZuXPM2bVsnEQ2z4EDm9N3xg7WWP\nix+ZLY/scupiW6OkN8o8g2Rwn1fxZdZIWhCzCZ2KoRTa+uCsshqPi0sO463T+15yCOdtWcOSW5vK\nXFdx7GdoRPLuLj5zsuzjU1Y/vtrsz9ueDcPD5KSGtD7DJroamGTsXrnvttsao0RJZUkcmug5U+/d\nxlS07HHxcSzGsHamkeDXd9Q5I040C+V75phs645jnoHjnsKJKZWkSNU5nxc/J3SSpXiRnNqzRw6a\ntlfR6HrPvNN1uQ522aXwtu/Z1qSjgB+358Ujy7lLz9OxAe0BYC1sYM/ZtHu7imvfMsdqXZdIt+3k\n6Iqg7VTttOczHyziNEe3SjlHlh6XmNiCFSbcr+JROxYGrWo46uQ4Gi5gwNTTWtPHxRXLzgveMpr4\n8ojhshdLA7R3nRtwon72UnNeeLujYQaYEtXofe/9uHhmZdnIY9REgQAaGESSTEom8vvkCqy3cUAJ\nk5FzrXNsqGiNdIz+cXHuNSpDJu+GKWocXouHLlAN7b2LFy7I9um+DBvckzZksekCRMCV520vRRUr\nKFawHD0YdZqtNZKgLOAwilOS9gymS1CNPCjGvqYSzYf15233A451rLChW3351D1NGz7Grm15y+si\nMN55Wm2RNYIPgCGWAGROeX7yFuhcXwlaT2Ez19U2BaVtCK7HVXyUQu0npI3ANeACo6beelzbyf58\n5sQBinWQbAO+JDFqMBS7FUjkdivcPKdxCjdZC8/qufCd6u6wl+DnxgLxSrgZFNTQdhlhPiYwvzaw\nlftuO/C3gxOGPknSBjTQmqsFr9Hsf6C9eC+c0l0OdBvqBrk9AmPlSk+Rq7jbIeg6Ny6FC4ZXgPgQ\nOevGGs/lFYZmtiEtUDo5a4N0ERMb6UgQIMJdHC4KO1G/tIACXquYVjGv7nPQc3k1Ziy2im1PiT3g\n66hzYV0zrN3anqCEtcC4B8IEcLigbAdsP4sYwvg8TBDDRBLrYWHklTmYuy3um87A8W+RyT8+5LVS\nfVp1SeKH/5Z5Lq3/XvigWQDPJAz2xlixAt8QWgPweNRcw85RwsB9gOaPa64J+eAgr3VkICO0nR3W\nvGEcBvTduoLAtrku1y4EvDMLCRITEjjPyfF8zBST2iJIC0Bmy30CW8gTrTRm43Wzq3sdZeg+Qiu4\nt4ZPcJwsbMXZz0++x06BcYDWKhEIoy2uJFfQtoNs9nXMHR6WxF2HgFLegYjL6MkYGW89Lj6tIYMw\n8YomiRyqfUBN7coLBH5dxbf4QaTGpQ17d0DS8bO3K2FK+vzk2iguBfGG/OQFwyQnaEtTlZnFX9t+\npfgFPysTGIwLshTuIaj6rEXzcXE01M/ETFFIlB25lA+nX4p6dN3FNwK84x6hnyvjMCQFRtuWZU2d\nfT13UTltLATT8HEw1oxSSwQUip3IK1+Lr+iAOdwrm4wBe9vaHJxDyFw2nsv5sM1jUc1rLYsIdlOD\ndl83D4DeTTUYHLIdttgYd0hQABl77bMR8Tq2+NzCIdtKx+MyKfxFt9mTlQg6DZW/isOskBywu4EQ\n64vDT2/JuE3YAlbm87bHCu1g7DSTlSA3XGXiRUffoN/L3/8Aj/DDlBYPAAA=\n'),(2,'2018-01-31 21:27:05.942570','2018-01-31 21:27:06.185813','course-v1:edX+E2E-101+course','H4sIAKo0cloC/81TTWsbMRD9K2Kva8PqayX55FJy7Ck9FEoxI2mUGK93XUkbMMH/vbLXIZC6BIek\n5KY3YmbemzfzWNlucJtULcjj9Jw/0AX6H/UNu5nThtZuGGPC2kbo3f3SRwh5PoH6AWNaD/1SgmJc\nANhWmsY00hgjgoCmzvsdLt097DLG+lR9KbHlKnBGFVOCmWAl50o4G6wIgWl4JrI6ZhdYnQtUM1Ld\nRfDoSzBAl7AEwhC3kEugH7uu4DHBHa42uD8mfgo9s6OAdecj9oXTzw8ilfD3iH1eQ3fmxTljQnFk\nHKjgrdEtcm0oc15q6htT/SrE/DrtOtivetieJn2LLpdeZKGkcBK1NuC40AZLL2WhZdbQ1nqw1WH2\nUeO9XsnfG/Nc47MszfWqXuzNRbtGm54ck62j1rHGM9UIKqxWCo2jShspbFvkv+bYtNtnnSeKE7h0\nkNPHu472n+3/z/1cedSX3PgG/Qgdud0OGyTfMWXy9cSKUDInX8Y8VIejB3EY8puHcfgDSIktU7AF\nAAA=\n','H4sIAKo0cloC/6uuBQBDv6ajAgAAAA==\n');
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
  KEY `courseware_course_changed_by_id_71dd51ee4b44e9e1_fk_auth_user_id` (`changed_by_id`),
  KEY `courseware_coursedynamicupgradedeadlineconfiguration_ea134da7` (`course_id`),
  CONSTRAINT `courseware_course_changed_by_id_71dd51ee4b44e9e1_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `courseware_dynami_changed_by_id_77da0c73df07c112_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `courseware_dynami_changed_by_id_77da0c73df07c112_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `courseware_orgdyn_changed_by_id_700576c3bbcdc12f_fk_auth_user_id` (`changed_by_id`),
  KEY `courseware_orgdynamicupgradedeadlineconfiguration_9cf869aa` (`org_id`),
  CONSTRAINT `courseware_orgdyn_changed_by_id_700576c3bbcdc12f_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2016-12-17 01:37:07.676065',1,'',NULL);
/*!40000 ALTER TABLE `dark_lang_darklangconfig` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `D8dff51a65b4ed0c3cf73b425e343929` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
  `degreed_base_url` varchar(255) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `course_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `degreed_user_id` varchar(255) NOT NULL,
  `degreed_user_password` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreed_degreedgl_changed_by_id_3af82cf8c774e820_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `degreed_degreedgl_changed_by_id_3af82cf8c774e820_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`history_id`),
  KEY `degreed_histori_history_user_id_20efd88dd0a8765a_fk_auth_user_id` (`history_user_id`),
  KEY `degreed_historicaldegreedenterprisecustomerconfiguration_b803fed` (`id`),
  CONSTRAINT `degreed_histori_history_user_id_20efd88dd0a8765a_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
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
INSERT INTO `django_comment_client_permission` VALUES ('create_comment'),('create_sub_comment'),('create_thread'),('delete_comment'),('delete_thread'),('edit_content'),('endorse_comment'),('follow_commentable'),('follow_thread'),('group_delete_comment'),('group_delete_thread'),('group_edit_content'),('group_endorse_comment'),('group_openclose_thread'),('manage_moderator'),('openclose_thread'),('see_all_cohorts'),('unfollow_commentable'),('unfollow_thread'),('unvote'),('update_comment'),('update_thread'),('vote');
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission_roles`
--

LOCK TABLES `django_comment_client_permission_roles` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission_roles` DISABLE KEYS */;
INSERT INTO `django_comment_client_permission_roles` VALUES (47,'create_comment',1),(29,'create_comment',2),(30,'create_comment',3),(11,'create_comment',4),(79,'create_comment',5),(158,'create_comment',6),(113,'create_comment',7),(124,'create_comment',8),(141,'create_comment',9),(90,'create_comment',10),(48,'create_sub_comment',1),(24,'create_sub_comment',2),(31,'create_sub_comment',3),(6,'create_sub_comment',4),(74,'create_sub_comment',5),(153,'create_sub_comment',6),(108,'create_sub_comment',7),(119,'create_sub_comment',8),(136,'create_sub_comment',9),(85,'create_sub_comment',10),(49,'create_thread',1),(26,'create_thread',2),(32,'create_thread',3),(8,'create_thread',4),(76,'create_thread',5),(155,'create_thread',6),(110,'create_thread',7),(121,'create_thread',8),(138,'create_thread',9),(87,'create_thread',10),(50,'delete_comment',1),(16,'delete_comment',2),(33,'delete_comment',3),(146,'delete_comment',6),(95,'delete_comment',7),(129,'delete_comment',9),(51,'delete_thread',1),(13,'delete_thread',2),(34,'delete_thread',3),(143,'delete_thread',6),(92,'delete_thread',7),(126,'delete_thread',9),(52,'edit_content',1),(12,'edit_content',2),(35,'edit_content',3),(142,'edit_content',6),(91,'edit_content',7),(125,'edit_content',9),(53,'endorse_comment',1),(15,'endorse_comment',2),(36,'endorse_comment',3),(145,'endorse_comment',6),(94,'endorse_comment',7),(128,'endorse_comment',9),(54,'follow_commentable',1),(27,'follow_commentable',2),(37,'follow_commentable',3),(9,'follow_commentable',4),(77,'follow_commentable',5),(156,'follow_commentable',6),(111,'follow_commentable',7),(122,'follow_commentable',8),(139,'follow_commentable',9),(88,'follow_commentable',10),(55,'follow_thread',1),(21,'follow_thread',2),(38,'follow_thread',3),(3,'follow_thread',4),(71,'follow_thread',5),(150,'follow_thread',6),(105,'follow_thread',7),(116,'follow_thread',8),(133,'follow_thread',9),(82,'follow_thread',10),(68,'group_delete_comment',5),(101,'group_delete_comment',8),(65,'group_delete_thread',5),(98,'group_delete_thread',8),(64,'group_edit_content',5),(97,'group_edit_content',8),(67,'group_endorse_comment',5),(100,'group_endorse_comment',8),(66,'group_openclose_thread',5),(99,'group_openclose_thread',8),(18,'manage_moderator',1),(102,'manage_moderator',6),(56,'openclose_thread',1),(14,'openclose_thread',2),(39,'openclose_thread',3),(144,'openclose_thread',6),(93,'openclose_thread',7),(127,'openclose_thread',9),(57,'see_all_cohorts',1),(17,'see_all_cohorts',2),(40,'see_all_cohorts',3),(147,'see_all_cohorts',6),(96,'see_all_cohorts',7),(130,'see_all_cohorts',9),(58,'unfollow_commentable',1),(28,'unfollow_commentable',2),(41,'unfollow_commentable',3),(10,'unfollow_commentable',4),(78,'unfollow_commentable',5),(157,'unfollow_commentable',6),(112,'unfollow_commentable',7),(123,'unfollow_commentable',8),(140,'unfollow_commentable',9),(89,'unfollow_commentable',10),(59,'unfollow_thread',1),(22,'unfollow_thread',2),(42,'unfollow_thread',3),(4,'unfollow_thread',4),(72,'unfollow_thread',5),(151,'unfollow_thread',6),(106,'unfollow_thread',7),(117,'unfollow_thread',8),(134,'unfollow_thread',9),(83,'unfollow_thread',10),(60,'unvote',1),(25,'unvote',2),(43,'unvote',3),(7,'unvote',4),(75,'unvote',5),(154,'unvote',6),(109,'unvote',7),(120,'unvote',8),(137,'unvote',9),(86,'unvote',10),(61,'update_comment',1),(23,'update_comment',2),(44,'update_comment',3),(5,'update_comment',4),(73,'update_comment',5),(152,'update_comment',6),(107,'update_comment',7),(118,'update_comment',8),(135,'update_comment',9),(84,'update_comment',10),(62,'update_thread',1),(20,'update_thread',2),(45,'update_thread',3),(2,'update_thread',4),(70,'update_thread',5),(149,'update_thread',6),(104,'update_thread',7),(115,'update_thread',8),(132,'update_thread',9),(81,'update_thread',10),(63,'vote',1),(19,'vote',2),(46,'vote',3),(1,'vote',4),(69,'vote',5),(148,'vote',6),(103,'vote',7),(114,'vote',8),(131,'vote',9),(80,'vote',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role`
--

LOCK TABLES `django_comment_client_role` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role` DISABLE KEYS */;
INSERT INTO `django_comment_client_role` VALUES (1,'Administrator','course-v1:edX+DemoX+Demo_Course'),(2,'Moderator','course-v1:edX+DemoX+Demo_Course'),(3,'Community TA','course-v1:edX+DemoX+Demo_Course'),(4,'Student','course-v1:edX+DemoX+Demo_Course'),(5,'Group Moderator','course-v1:edX+DemoX+Demo_Course'),(6,'Administrator','course-v1:edX+E2E-101+course'),(7,'Moderator','course-v1:edX+E2E-101+course'),(8,'Group Moderator','course-v1:edX+E2E-101+course'),(9,'Community TA','course-v1:edX+E2E-101+course'),(10,'Student','course-v1:edX+E2E-101+course');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role_users`
--

LOCK TABLES `django_comment_client_role_users` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role_users` DISABLE KEYS */;
INSERT INTO `django_comment_client_role_users` VALUES (1,4,6),(2,4,7),(3,4,8),(4,4,9);
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
INSERT INTO `django_comment_common_forumsconfig` VALUES (1,'2016-12-17 01:37:09.941982',1,5,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (133,'admin','logentry'),(232,'api_admin','apiaccessconfig'),(1,'api_admin','apiaccessrequest'),(233,'api_admin','catalog'),(231,'api_admin','historicalapiaccessrequest'),(261,'assessment','aiclassifier'),(260,'assessment','aiclassifierset'),(263,'assessment','aigradingworkflow'),(262,'assessment','aitrainingworkflow'),(251,'assessment','assessment'),(254,'assessment','assessmentfeedback'),(253,'assessment','assessmentfeedbackoption'),(252,'assessment','assessmentpart'),(249,'assessment','criterion'),(250,'assessment','criterionoption'),(255,'assessment','peerworkflow'),(256,'assessment','peerworkflowitem'),(248,'assessment','rubric'),(264,'assessment','staffworkflow'),(258,'assessment','studenttrainingworkflow'),(259,'assessment','studenttrainingworkflowitem'),(257,'assessment','trainingexample'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(236,'badges','badgeassertion'),(235,'badges','badgeclass'),(237,'badges','coursecompleteimageconfiguration'),(238,'badges','courseeventbadgesconfiguration'),(322,'block_structure','blockstructureconfiguration'),(323,'block_structure','blockstructuremodel'),(218,'bookmarks','bookmark'),(219,'bookmarks','xblockcache'),(85,'branding','brandingapiconfig'),(84,'branding','brandinginfoconfig'),(83,'bulk_email','bulkemailflag'),(78,'bulk_email','cohorttarget'),(82,'bulk_email','courseauthorization'),(79,'bulk_email','courseemail'),(81,'bulk_email','courseemailtemplate'),(305,'bulk_email','coursemodetarget'),(80,'bulk_email','optout'),(77,'bulk_email','target'),(221,'catalog','catalogintegration'),(342,'celery_utils','chorddata'),(311,'celery_utils','failedtask'),(67,'certificates','certificategenerationconfiguration'),(66,'certificates','certificategenerationcoursesetting'),(62,'certificates','certificategenerationhistory'),(68,'certificates','certificatehtmlviewconfiguration'),(63,'certificates','certificateinvalidation'),(69,'certificates','certificatetemplate'),(70,'certificates','certificatetemplateasset'),(60,'certificates','certificatewhitelist'),(65,'certificates','examplecertificate'),(64,'certificates','examplecertificateset'),(61,'certificates','generatedcertificate'),(203,'commerce','commerceconfiguration'),(360,'completion','blockcompletion'),(366,'consent','datasharingconsent'),(365,'consent','historicaldatasharingconsent'),(22,'contentserver','cdnuseragentsconfig'),(21,'contentserver','courseassetcachettlconfig'),(379,'contentstore','coursenewassetspageflag'),(378,'contentstore','newassetspageflag'),(295,'contentstore','pushnotificationconfig'),(294,'contentstore','videouploadconfig'),(5,'contenttypes','contenttype'),(201,'corsheaders','corsmodel'),(202,'cors_csrf','xdomainproxyconfiguration'),(230,'coursetalk','coursetalkwidgetconfiguration'),(349,'courseware','coursedynamicupgradedeadlineconfiguration'),(348,'courseware','dynamicupgradedeadlineconfiguration'),(31,'courseware','offlinecomputedgrade'),(32,'courseware','offlinecomputedgradelog'),(350,'courseware','orgdynamicupgradedeadlineconfiguration'),(33,'courseware','studentfieldoverride'),(26,'courseware','studentmodule'),(27,'courseware','studentmodulehistory'),(30,'courseware','xmodulestudentinfofield'),(29,'courseware','xmodulestudentprefsfield'),(28,'courseware','xmoduleuserstatesummaryfield'),(293,'coursewarehistoryextended','studentmodulehistoryextended'),(186,'course_action_state','coursererunstate'),(296,'course_creators','coursecreator'),(359,'course_goals','coursegoal'),(73,'course_groups','cohortmembership'),(76,'course_groups','coursecohort'),(75,'course_groups','coursecohortssettings'),(72,'course_groups','courseusergroup'),(74,'course_groups','courseusergrouppartitiongroup'),(336,'course_groups','unregisteredlearnercohortassignments'),(160,'course_modes','coursemode'),(162,'course_modes','coursemodeexpirationconfig'),(161,'course_modes','coursemodesarchive'),(196,'course_overviews','courseoverview'),(199,'course_overviews','courseoverviewimageconfig'),(198,'course_overviews','courseoverviewimageset'),(197,'course_overviews','courseoverviewtab'),(200,'course_structures','coursestructure'),(312,'crawlers','crawlersconfig'),(224,'credentials','credentialsapiconfig'),(212,'credit','creditconfig'),(205,'credit','creditcourse'),(209,'credit','crediteligibility'),(204,'credit','creditprovider'),(211,'credit','creditrequest'),(206,'credit','creditrequirement'),(208,'credit','creditrequirementstatus'),(210,'credit','historicalcreditrequest'),(207,'credit','historicalcreditrequirementstatus'),(171,'dark_lang','darklangconfig'),(309,'default','association'),(310,'default','code'),(308,'default','nonce'),(307,'default','usersocialauth'),(371,'degreed','degreedenterprisecustomerconfiguration'),(369,'degreed','degreedglobalconfiguration'),(372,'degreed','degreedlearnerdatatransmissionaudit'),(370,'degreed','historicaldegreedenterprisecustomerconfiguration'),(334,'django_comment_common','coursediscussionsettings'),(136,'django_comment_common','forumsconfig'),(135,'django_comment_common','permission'),(134,'django_comment_common','role'),(132,'django_notify','notification'),(129,'django_notify','notificationtype'),(130,'django_notify','settings'),(131,'django_notify','subscription'),(93,'django_openid_auth','association'),(92,'django_openid_auth','nonce'),(94,'django_openid_auth','useropenid'),(12,'djcelery','crontabschedule'),(11,'djcelery','intervalschedule'),(14,'djcelery','periodictask'),(13,'djcelery','periodictasks'),(9,'djcelery','taskmeta'),(10,'djcelery','tasksetmeta'),(16,'djcelery','taskstate'),(15,'djcelery','workerstate'),(270,'edxval','coursevideo'),(271,'edxval','encodedvideo'),(268,'edxval','profile'),(272,'edxval','subtitle'),(357,'edxval','thirdpartytranscriptcredentialsstate'),(356,'edxval','transcriptpreference'),(269,'edxval','video'),(354,'edxval','videoimage'),(355,'edxval','videotranscript'),(99,'edx_oauth2_provider','trustedclient'),(273,'edx_proctoring','proctoredexam'),(274,'edx_proctoring','proctoredexamreviewpolicy'),(275,'edx_proctoring','proctoredexamreviewpolicyhistory'),(282,'edx_proctoring','proctoredexamsoftwaresecurecomment'),(280,'edx_proctoring','proctoredexamsoftwaresecurereview'),(281,'edx_proctoring','proctoredexamsoftwaresecurereviewhistory'),(278,'edx_proctoring','proctoredexamstudentallowance'),(279,'edx_proctoring','proctoredexamstudentallowancehistory'),(276,'edx_proctoring','proctoredexamstudentattempt'),(277,'edx_proctoring','proctoredexamstudentattempthistory'),(239,'email_marketing','emailmarketingconfiguration'),(182,'embargo','country'),(183,'embargo','countryaccessrule'),(184,'embargo','courseaccessrulehistory'),(179,'embargo','embargoedcourse'),(180,'embargo','embargoedstate'),(185,'embargo','ipfilter'),(181,'embargo','restrictedcourse'),(319,'enterprise','enrollmentnotificationemailtemplate'),(317,'enterprise','enterprisecourseenrollment'),(286,'enterprise','enterprisecustomer'),(289,'enterprise','enterprisecustomerbrandingconfiguration'),(363,'enterprise','enterprisecustomercatalog'),(315,'enterprise','enterprisecustomerentitlement'),(290,'enterprise','enterprisecustomeridentityprovider'),(364,'enterprise','enterprisecustomerreportingconfiguration'),(287,'enterprise','enterprisecustomeruser'),(318,'enterprise','historicalenrollmentnotificationemailtemplate'),(316,'enterprise','historicalenterprisecourseenrollment'),(285,'enterprise','historicalenterprisecustomer'),(362,'enterprise','historicalenterprisecustomercatalog'),(314,'enterprise','historicalenterprisecustomerentitlement'),(291,'enterprise','historicaluserdatasharingconsentaudit'),(313,'enterprise','pendingenrollment'),(288,'enterprise','pendingenterprisecustomeruser'),(292,'enterprise','userdatasharingconsentaudit'),(353,'entitlements','courseentitlement'),(352,'entitlements','courseentitlementpolicy'),(335,'experiments','experimentdata'),(361,'experiments','experimentkeyvalue'),(91,'external_auth','externalauthmap'),(321,'grades','computegradessetting'),(90,'grades','coursepersistentgradesflag'),(88,'grades','persistentcoursegrade'),(89,'grades','persistentgradesenabledflag'),(87,'grades','persistentsubsectiongrade'),(374,'grades','persistentsubsectiongradeoverride'),(86,'grades','visibleblocks'),(320,'instructor_task','gradereportsetting'),(71,'instructor_task','instructortask'),(368,'integrated_channel','catalogtransmissionaudit'),(327,'integrated_channel','enterpriseintegratedchannel'),(367,'integrated_channel','learnerdatatransmissionaudit'),(195,'lms_xblock','xblockasidesconfig'),(240,'mentoring','answer'),(174,'microsite_configuration','historicalmicrositeorganizationmapping'),(176,'microsite_configuration','historicalmicrositetemplate'),(172,'microsite_configuration','microsite'),(173,'microsite_configuration','micrositehistory'),(175,'microsite_configuration','micrositeorganizationmapping'),(177,'microsite_configuration','micrositetemplate'),(228,'milestones','coursecontentmilestone'),(227,'milestones','coursemilestone'),(225,'milestones','milestone'),(226,'milestones','milestonerelationshiptype'),(229,'milestones','usermilestone'),(188,'mobile_api','appversionconfig'),(306,'mobile_api','ignoremobileavailableflagconfig'),(187,'mobile_api','mobileapiconfig'),(137,'notes','note'),(97,'oauth2','accesstoken'),(95,'oauth2','client'),(96,'oauth2','grant'),(98,'oauth2','refreshtoken'),(102,'oauth2_provider','accesstoken'),(100,'oauth2_provider','application'),(101,'oauth2_provider','grant'),(103,'oauth2_provider','refreshtoken'),(104,'oauth_dispatch','restrictedapplication'),(113,'oauth_provider','consumer'),(111,'oauth_provider','nonce'),(115,'oauth_provider','resource'),(112,'oauth_provider','scope'),(114,'oauth_provider','token'),(283,'organizations','organization'),(284,'organizations','organizationcourse'),(241,'problem_builder','answer'),(242,'problem_builder','share'),(220,'programs','programsapiconfig'),(6,'redirects','redirect'),(178,'rss_proxy','whitelistedrssurl'),(332,'sap_success_factors','catalogtransmissionaudit'),(329,'sap_success_factors','historicalsapsuccessfactorsenterprisecustomerconfiguration'),(331,'sap_success_factors','learnerdatatransmissionaudit'),(330,'sap_success_factors','sapsuccessfactorsenterprisecustomerconfiguration'),(328,'sap_success_factors','sapsuccessfactorsglobalconfiguration'),(373,'sap_success_factors','sapsuccessfactorslearnerdatatransmissionaudit'),(375,'schedules','schedule'),(376,'schedules','scheduleconfig'),(377,'schedules','scheduleexperience'),(222,'self_paced','selfpacedconfiguration'),(7,'sessions','session'),(157,'shoppingcart','certificateitem'),(151,'shoppingcart','coupon'),(152,'shoppingcart','couponredemption'),(154,'shoppingcart','courseregcodeitem'),(155,'shoppingcart','courseregcodeitemannotation'),(149,'shoppingcart','courseregistrationcode'),(147,'shoppingcart','courseregistrationcodeinvoiceitem'),(159,'shoppingcart','donation'),(158,'shoppingcart','donationconfiguration'),(144,'shoppingcart','invoice'),(148,'shoppingcart','invoicehistory'),(146,'shoppingcart','invoiceitem'),(145,'shoppingcart','invoicetransaction'),(142,'shoppingcart','order'),(143,'shoppingcart','orderitem'),(153,'shoppingcart','paidcourseregistration'),(156,'shoppingcart','paidcourseregistrationannotation'),(150,'shoppingcart','registrationcoderedemption'),(8,'sites','site'),(24,'site_configuration','siteconfiguration'),(25,'site_configuration','siteconfigurationhistory'),(191,'social_auth','association'),(192,'social_auth','code'),(190,'social_auth','nonce'),(189,'social_auth','usersocialauth'),(339,'social_django','association'),(340,'social_django','code'),(338,'social_django','nonce'),(341,'social_django','partial'),(337,'social_django','usersocialauth'),(138,'splash','splashconfig'),(19,'static_replace','assetbaseurlconfig'),(20,'static_replace','assetexcludedextensionsconfig'),(18,'status','coursemessage'),(17,'status','globalstatusmessage'),(34,'student','anonymoususerid'),(48,'student','courseaccessrole'),(45,'student','courseenrollment'),(47,'student','courseenrollmentallowed'),(53,'student','courseenrollmentattribute'),(49,'student','dashboardconfiguration'),(54,'student','enrollmentrefundconfiguration'),(51,'student','entranceexamconfiguration'),(44,'student','historicalcourseenrollment'),(52,'student','languageproficiency'),(50,'student','linkedinaddtoprofileconfiguration'),(43,'student','loginfailures'),(57,'student','logoutviewconfiguration'),(46,'student','manualenrollmentaudit'),(42,'student','passwordhistory'),(41,'student','pendingemailchange'),(40,'student','pendingnamechange'),(39,'student','registration'),(55,'student','registrationcookieconfiguration'),(351,'student','sociallink'),(56,'student','userattribute'),(36,'student','userprofile'),(37,'student','usersignupsource'),(35,'student','userstanding'),(38,'student','usertestgroup'),(245,'submissions','score'),(247,'submissions','scoreannotation'),(246,'submissions','scoresummary'),(243,'submissions','studentitem'),(244,'submissions','submission'),(194,'survey','surveyanswer'),(193,'survey','surveyform'),(299,'tagging','tagavailablevalues'),(298,'tagging','tagcategories'),(213,'teams','courseteam'),(214,'teams','courseteammembership'),(23,'theming','sitetheme'),(109,'third_party_auth','ltiproviderconfig'),(105,'third_party_auth','oauth2providerconfig'),(110,'third_party_auth','providerapipermissions'),(107,'third_party_auth','samlconfiguration'),(106,'third_party_auth','samlproviderconfig'),(108,'third_party_auth','samlproviderdata'),(223,'thumbnail','kvstore'),(58,'track','trackinglog'),(140,'user_api','usercoursetag'),(141,'user_api','userorgtag'),(139,'user_api','userpreference'),(301,'user_tasks','usertaskartifact'),(300,'user_tasks','usertaskstatus'),(59,'util','ratelimitconfiguration'),(358,'verified_track_content','migrateverifiedtrackcohortssetting'),(234,'verified_track_content','verifiedtrackcohortedcourse'),(164,'verify_student','historicalverificationdeadline'),(169,'verify_student','icrvstatusemailsconfiguration'),(168,'verify_student','incoursereverificationconfiguration'),(170,'verify_student','skippedreverification'),(163,'verify_student','softwaresecurephotoverification'),(166,'verify_student','verificationcheckpoint'),(165,'verify_student','verificationdeadline'),(167,'verify_student','verificationstatus'),(325,'video_config','coursehlsplaybackenabledflag'),(344,'video_config','coursevideotranscriptenabledflag'),(324,'video_config','hlsplaybackenabledflag'),(343,'video_config','videotranscriptenabledflag'),(347,'video_pipeline','coursevideouploadsenabledbydefault'),(345,'video_pipeline','videopipelineintegration'),(346,'video_pipeline','videouploadsenabledbydefault'),(302,'waffle','flag'),(304,'waffle','sample'),(303,'waffle','switch'),(326,'waffle_utils','waffleflagcourseoverridemodel'),(116,'wiki','article'),(117,'wiki','articleforobject'),(120,'wiki','articleplugin'),(118,'wiki','articlerevision'),(127,'wiki','attachment'),(128,'wiki','attachmentrevision'),(125,'wiki','image'),(126,'wiki','imagerevision'),(121,'wiki','reusableplugin'),(123,'wiki','revisionplugin'),(124,'wiki','revisionpluginrevision'),(122,'wiki','simpleplugin'),(119,'wiki','urlpath'),(265,'workflow','assessmentworkflow'),(267,'workflow','assessmentworkflowcancellation'),(266,'workflow','assessmentworkflowstep'),(333,'xblock_config','courseeditltifieldsenabledflag'),(297,'xblock_config','studioconfig'),(215,'xblock_django','xblockconfiguration'),(217,'xblock_django','xblockstudioconfiguration'),(216,'xblock_django','xblockstudioconfigurationflag');
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
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-12-17 01:36:06.599911'),(2,'auth','0001_initial','2016-12-17 01:36:09.155420'),(3,'admin','0001_initial','2016-12-17 01:36:09.689101'),(4,'sites','0001_initial','2016-12-17 01:36:09.777106'),(5,'contenttypes','0002_remove_content_type_name','2016-12-17 01:36:10.113280'),(6,'api_admin','0001_initial','2016-12-17 01:36:10.826004'),(7,'api_admin','0002_auto_20160325_1604','2016-12-17 01:36:10.870018'),(8,'api_admin','0003_auto_20160404_1618','2016-12-17 01:36:12.173622'),(9,'api_admin','0004_auto_20160412_1506','2016-12-17 01:36:13.225912'),(10,'api_admin','0005_auto_20160414_1232','2016-12-17 01:36:13.492670'),(11,'api_admin','0006_catalog','2016-12-17 01:36:13.516312'),(12,'assessment','0001_initial','2016-12-17 01:36:25.565632'),(13,'assessment','0002_staffworkflow','2016-12-17 01:36:26.143411'),(14,'auth','0002_alter_permission_name_max_length','2016-12-17 01:36:26.373907'),(15,'auth','0003_alter_user_email_max_length','2016-12-17 01:36:26.629350'),(16,'auth','0004_alter_user_username_opts','2016-12-17 01:36:26.699767'),(17,'auth','0005_alter_user_last_login_null','2016-12-17 01:36:26.894658'),(18,'auth','0006_require_contenttypes_0002','2016-12-17 01:36:26.907706'),(19,'instructor_task','0001_initial','2016-12-17 01:36:27.514373'),(20,'certificates','0001_initial','2016-12-17 01:36:30.718895'),(21,'certificates','0002_data__certificatehtmlviewconfiguration_data','2016-12-17 01:36:30.760294'),(22,'certificates','0003_data__default_modes','2016-12-17 01:36:30.859714'),(23,'certificates','0004_certificategenerationhistory','2016-12-17 01:36:31.363536'),(24,'certificates','0005_auto_20151208_0801','2016-12-17 01:36:31.517857'),(25,'certificates','0006_certificatetemplateasset_asset_slug','2016-12-17 01:36:31.679085'),(26,'certificates','0007_certificateinvalidation','2016-12-17 01:36:32.242909'),(27,'badges','0001_initial','2016-12-17 01:36:33.602314'),(28,'badges','0002_data__migrate_assertions','2016-12-17 01:36:33.647621'),(29,'badges','0003_schema__add_event_configuration','2016-12-17 01:36:34.126910'),(30,'bookmarks','0001_initial','2016-12-17 01:36:35.456888'),(31,'branding','0001_initial','2016-12-17 01:36:36.153792'),(32,'course_groups','0001_initial','2016-12-17 01:36:39.237579'),(33,'bulk_email','0001_initial','2016-12-17 01:36:40.641357'),(34,'bulk_email','0002_data__load_course_email_template','2016-12-17 01:36:40.797656'),(35,'bulk_email','0003_config_model_feature_flag','2016-12-17 01:36:41.197060'),(36,'bulk_email','0004_add_email_targets','2016-12-17 01:36:42.585897'),(37,'bulk_email','0005_move_target_data','2016-12-17 01:36:42.617283'),(38,'catalog','0001_initial','2016-12-17 01:36:43.054060'),(39,'certificates','0008_schema__remove_badges','2016-12-17 01:36:43.651994'),(40,'commerce','0001_data__add_ecommerce_service_user','2016-12-17 01:36:43.696482'),(41,'commerce','0002_commerceconfiguration','2016-12-17 01:36:44.140663'),(42,'commerce','0003_auto_20160329_0709','2016-12-17 01:36:44.313419'),(43,'commerce','0004_auto_20160531_0950','2016-12-17 01:36:44.931167'),(44,'contentserver','0001_initial','2016-12-17 01:36:45.338371'),(45,'contentserver','0002_cdnuseragentsconfig','2016-12-17 01:36:45.766142'),(46,'cors_csrf','0001_initial','2016-12-17 01:36:46.295651'),(47,'course_action_state','0001_initial','2016-12-17 01:36:50.214331'),(48,'course_modes','0001_initial','2016-12-17 01:36:50.829229'),(49,'course_modes','0002_coursemode_expiration_datetime_is_explicit','2016-12-17 01:36:50.997245'),(50,'course_modes','0003_auto_20151113_1443','2016-12-17 01:36:51.067479'),(51,'course_modes','0004_auto_20151113_1457','2016-12-17 01:36:51.483744'),(52,'course_modes','0005_auto_20151217_0958','2016-12-17 01:36:51.523950'),(53,'course_modes','0006_auto_20160208_1407','2016-12-17 01:36:51.681200'),(54,'course_modes','0007_coursemode_bulk_sku','2016-12-17 01:36:51.851762'),(55,'course_overviews','0001_initial','2016-12-17 01:36:52.253410'),(56,'course_overviews','0002_add_course_catalog_fields','2016-12-17 01:36:52.937745'),(57,'course_overviews','0003_courseoverviewgeneratedhistory','2016-12-17 01:36:53.042014'),(58,'course_overviews','0004_courseoverview_org','2016-12-17 01:36:53.199918'),(59,'course_overviews','0005_delete_courseoverviewgeneratedhistory','2016-12-17 01:36:53.271407'),(60,'course_overviews','0006_courseoverviewimageset','2016-12-17 01:36:53.659175'),(61,'course_overviews','0007_courseoverviewimageconfig','2016-12-17 01:36:54.025056'),(62,'course_overviews','0008_remove_courseoverview_facebook_url','2016-12-17 01:36:54.040854'),(63,'course_overviews','0009_readd_facebook_url','2016-12-17 01:36:54.055373'),(64,'course_overviews','0010_auto_20160329_2317','2016-12-17 01:36:54.366767'),(65,'course_structures','0001_initial','2016-12-17 01:36:54.477885'),(66,'coursetalk','0001_initial','2016-12-17 01:36:54.896706'),(67,'coursetalk','0002_auto_20160325_0631','2016-12-17 01:36:55.058698'),(68,'courseware','0001_initial','2016-12-17 01:37:00.640124'),(69,'coursewarehistoryextended','0001_initial','2016-12-17 01:37:00.903534'),(70,'coursewarehistoryextended','0002_force_studentmodule_index','2016-12-17 01:37:01.130788'),(71,'credentials','0001_initial','2016-12-17 01:37:01.618453'),(72,'credentials','0002_auto_20160325_0631','2016-12-17 01:37:01.853090'),(73,'credit','0001_initial','2016-12-17 01:37:06.301021'),(74,'credit','0002_creditconfig','2016-12-17 01:37:06.824183'),(75,'credit','0003_auto_20160511_2227','2016-12-17 01:37:07.103029'),(76,'dark_lang','0001_initial','2016-12-17 01:37:07.645056'),(77,'dark_lang','0002_data__enable_on_install','2016-12-17 01:37:07.691466'),(78,'django_comment_common','0001_initial','2016-12-17 01:37:09.349106'),(79,'django_comment_common','0002_forumsconfig','2016-12-17 01:37:09.907256'),(80,'django_comment_common','0003_enable_forums','2016-12-17 01:37:09.959809'),(81,'django_comment_common','0004_auto_20161117_1209','2016-12-17 01:37:10.284701'),(82,'django_notify','0001_initial','2016-12-17 01:37:13.028205'),(83,'django_openid_auth','0001_initial','2016-12-17 01:37:13.819524'),(84,'oauth2','0001_initial','2016-12-17 01:37:17.857484'),(85,'edx_oauth2_provider','0001_initial','2016-12-17 01:37:18.525068'),(86,'edx_proctoring','0001_initial','2016-12-17 01:37:31.827214'),(87,'edx_proctoring','0002_proctoredexamstudentattempt_is_status_acknowledged','2016-12-17 01:37:32.696124'),(88,'edx_proctoring','0003_auto_20160101_0525','2016-12-17 01:37:34.166324'),(89,'edx_proctoring','0004_auto_20160201_0523','2016-12-17 01:37:34.919334'),(90,'edx_proctoring','0005_proctoredexam_hide_after_due','2016-12-17 01:37:38.316319'),(91,'edxval','0001_initial','2016-12-17 01:37:40.727619'),(92,'edxval','0002_data__default_profiles','2016-12-17 01:37:40.801289'),(93,'edxval','0003_coursevideo_is_hidden','2016-12-17 01:37:41.000113'),(94,'email_marketing','0001_initial','2016-12-17 01:37:41.590373'),(95,'email_marketing','0002_auto_20160623_1656','2016-12-17 01:37:45.731159'),(96,'email_marketing','0003_auto_20160715_1145','2016-12-17 01:37:47.905611'),(97,'embargo','0001_initial','2016-12-17 01:37:50.816752'),(98,'embargo','0002_data__add_countries','2016-12-17 01:37:51.428897'),(99,'enterprise','0001_initial','2016-12-17 01:37:52.676832'),(100,'enterprise','0002_enterprisecustomerbrandingconfiguration','2016-12-17 01:37:52.991185'),(101,'enterprise','0003_auto_20161104_0937','2016-12-17 01:37:55.325661'),(102,'enterprise','0004_auto_20161114_0434','2016-12-17 01:37:57.048358'),(103,'enterprise','0005_pendingenterprisecustomeruser','2016-12-17 01:37:58.015592'),(104,'enterprise','0006_auto_20161121_0241','2016-12-17 01:37:58.815567'),(105,'enterprise','0007_auto_20161109_1511','2016-12-17 01:38:00.585867'),(106,'enterprise','0008_auto_20161124_2355','2016-12-17 01:38:03.518493'),(107,'enterprise','0009_auto_20161130_1651','2016-12-17 01:38:09.315609'),(108,'external_auth','0001_initial','2016-12-17 01:38:11.538009'),(109,'grades','0001_initial','2016-12-17 01:38:12.299969'),(110,'grades','0002_rename_last_edited_field','2016-12-17 01:38:12.389072'),(111,'grades','0003_coursepersistentgradesflag_persistentgradesenabledflag','2016-12-17 01:38:14.587694'),(112,'grades','0004_visibleblocks_course_id','2016-12-17 01:38:14.852239'),(113,'grades','0005_multiple_course_flags','2016-12-17 01:38:17.991203'),(114,'grades','0006_persistent_course_grades','2016-12-17 01:38:18.286869'),(115,'grades','0007_add_passed_timestamp_column','2016-12-17 01:38:18.569279'),(116,'grades','0008_persistentsubsectiongrade_first_attempted','2016-12-17 01:38:18.761806'),(117,'lms_xblock','0001_initial','2016-12-17 01:38:19.425467'),(118,'microsite_configuration','0001_initial','2016-12-17 01:38:25.662192'),(119,'microsite_configuration','0002_auto_20160202_0228','2016-12-17 01:38:27.129548'),(120,'milestones','0001_initial','2016-12-17 01:38:31.163648'),(121,'milestones','0002_data__seed_relationship_types','2016-12-17 01:38:31.236648'),(122,'milestones','0003_coursecontentmilestone_requirements','2016-12-17 01:38:31.480397'),(123,'milestones','0004_auto_20151221_1445','2016-12-17 01:38:32.009316'),(124,'mobile_api','0001_initial','2016-12-17 01:38:32.928271'),(125,'mobile_api','0002_auto_20160406_0904','2016-12-17 01:38:33.142806'),(126,'notes','0001_initial','2016-12-17 01:38:34.508850'),(127,'oauth2','0002_auto_20160404_0813','2016-12-17 01:38:37.690514'),(128,'oauth2','0003_client_logout_uri','2016-12-17 01:38:38.699174'),(129,'oauth2','0004_add_index_on_grant_expires','2016-12-17 01:38:39.640959'),(130,'oauth2_provider','0001_initial','2016-12-17 01:38:45.116729'),(131,'oauth2_provider','0002_08_updates','2016-12-17 01:38:49.786552'),(132,'oauth_dispatch','0001_initial','2016-12-17 01:38:51.121396'),(133,'oauth_provider','0001_initial','2016-12-17 01:38:54.733164'),(134,'organizations','0001_initial','2016-12-17 01:38:55.562660'),(135,'problem_builder','0001_initial','2016-12-17 01:38:56.040050'),(136,'problem_builder','0002_auto_20160121_1525','2016-12-17 01:38:59.389089'),(137,'problem_builder','0003_auto_20161124_0755','2016-12-17 01:38:59.809157'),(138,'programs','0001_initial','2016-12-17 01:39:01.624132'),(139,'programs','0002_programsapiconfig_cache_ttl','2016-12-17 01:39:05.775532'),(140,'programs','0003_auto_20151120_1613','2016-12-17 01:39:09.312390'),(141,'programs','0004_programsapiconfig_enable_certification','2016-12-17 01:39:10.238624'),(142,'programs','0005_programsapiconfig_max_retries','2016-12-17 01:39:11.212038'),(143,'programs','0006_programsapiconfig_xseries_ad_enabled','2016-12-17 01:39:12.253625'),(144,'programs','0007_programsapiconfig_program_listing_enabled','2016-12-17 01:39:13.503624'),(145,'programs','0008_programsapiconfig_program_details_enabled','2016-12-17 01:39:14.849992'),(146,'programs','0009_programsapiconfig_marketing_path','2016-12-17 01:39:16.273841'),(147,'redirects','0001_initial','2016-12-17 01:39:17.985115'),(148,'rss_proxy','0001_initial','2016-12-17 01:39:18.161442'),(149,'self_paced','0001_initial','2016-12-17 01:39:19.778329'),(150,'sessions','0001_initial','2016-12-17 01:39:20.015206'),(151,'student','0001_initial','2016-12-17 01:40:00.987487'),(152,'shoppingcart','0001_initial','2016-12-17 01:40:27.040292'),(153,'shoppingcart','0002_auto_20151208_1034','2016-12-17 01:40:29.848974'),(154,'shoppingcart','0003_auto_20151217_0958','2016-12-17 01:40:32.642524'),(155,'site_configuration','0001_initial','2016-12-17 01:40:35.979557'),(156,'site_configuration','0002_auto_20160720_0231','2016-12-17 01:40:39.343270'),(157,'default','0001_initial','2016-12-17 01:40:44.990397'),(158,'default','0002_add_related_name','2016-12-17 01:40:46.032495'),(159,'default','0003_alter_email_max_length','2016-12-17 01:40:46.317830'),(160,'default','0004_auto_20160423_0400','2016-12-17 01:40:46.964896'),(161,'social_auth','0005_auto_20160727_2333','2016-12-17 01:40:47.095986'),(162,'splash','0001_initial','2016-12-17 01:40:47.961326'),(163,'static_replace','0001_initial','2016-12-17 01:40:48.859594'),(164,'static_replace','0002_assetexcludedextensionsconfig','2016-12-17 01:40:49.757400'),(165,'status','0001_initial','2016-12-17 01:40:51.931130'),(166,'student','0002_auto_20151208_1034','2016-12-17 01:40:53.439054'),(167,'student','0003_auto_20160516_0938','2016-12-17 01:40:55.641900'),(168,'student','0004_auto_20160531_1422','2016-12-17 01:40:56.898809'),(169,'student','0005_auto_20160531_1653','2016-12-17 01:40:58.213621'),(170,'student','0006_logoutviewconfiguration','2016-12-17 01:40:59.783439'),(171,'student','0007_registrationcookieconfiguration','2016-12-17 01:41:01.350652'),(172,'student','0008_auto_20161117_1209','2016-12-17 01:41:02.711010'),(173,'submissions','0001_initial','2016-12-17 01:41:05.593297'),(174,'submissions','0002_auto_20151119_0913','2016-12-17 01:41:06.129881'),(175,'submissions','0003_submission_status','2016-12-17 01:41:06.395818'),(176,'survey','0001_initial','2016-12-17 01:41:08.882086'),(177,'teams','0001_initial','2016-12-17 01:41:14.538311'),(178,'theming','0001_initial','2016-12-17 01:41:16.331941'),(179,'third_party_auth','0001_initial','2016-12-17 01:41:26.011127'),(180,'third_party_auth','0002_schema__provider_icon_image','2016-12-17 01:41:33.750573'),(181,'third_party_auth','0003_samlproviderconfig_debug_mode','2016-12-17 01:41:35.196831'),(182,'third_party_auth','0004_add_visible_field','2016-12-17 01:41:43.861295'),(183,'third_party_auth','0005_add_site_field','2016-12-17 01:41:53.375038'),(184,'track','0001_initial','2016-12-17 01:41:53.542227'),(185,'user_api','0001_initial','2016-12-17 01:42:05.863461'),(186,'util','0001_initial','2016-12-17 01:42:09.703202'),(187,'util','0002_data__default_rate_limit_config','2016-12-17 01:42:09.796661'),(188,'verified_track_content','0001_initial','2016-12-17 01:42:09.998990'),(189,'verified_track_content','0002_verifiedtrackcohortedcourse_verified_cohort_name','2016-12-17 01:42:10.235800'),(190,'verify_student','0001_initial','2016-12-17 01:42:24.000396'),(191,'verify_student','0002_auto_20151124_1024','2016-12-17 01:42:25.762475'),(192,'verify_student','0003_auto_20151113_1443','2016-12-17 01:42:27.335813'),(193,'wiki','0001_initial','2016-12-17 01:43:15.421067'),(194,'wiki','0002_remove_article_subscription','2016-12-17 01:43:15.523293'),(195,'wiki','0003_ip_address_conv','2016-12-17 01:43:21.325409'),(196,'wiki','0004_increase_slug_size','2016-12-17 01:43:23.407350'),(197,'workflow','0001_initial','2016-12-17 01:43:24.380325'),(198,'xblock_django','0001_initial','2016-12-17 01:43:26.679803'),(199,'xblock_django','0002_auto_20160204_0809','2016-12-17 01:43:28.994528'),(200,'xblock_django','0003_add_new_config_models','2016-12-17 01:43:36.524582'),(201,'xblock_django','0004_delete_xblock_disable_config','2016-12-17 01:43:40.319712'),(202,'social_auth','0001_initial','2016-12-17 01:43:40.353184'),(203,'social_auth','0003_alter_email_max_length','2016-12-17 01:43:40.373388'),(204,'social_auth','0002_add_related_name','2016-12-17 01:43:40.393151'),(205,'social_auth','0004_auto_20160423_0400','2016-12-17 01:43:40.412988'),(206,'contentstore','0001_initial','2016-12-17 01:52:51.013580'),(207,'course_creators','0001_initial','2016-12-17 01:52:51.311061'),(208,'tagging','0001_initial','2016-12-17 01:52:51.891243'),(209,'user_tasks','0001_initial','2016-12-17 01:52:53.613189'),(210,'user_tasks','0002_artifact_file_storage','2016-12-17 01:52:53.898169'),(211,'xblock_config','0001_initial','2016-12-17 01:52:54.444481'),(212,'bulk_email','0006_course_mode_targets','2017-02-24 14:36:23.719337'),(213,'catalog','0002_catalogintegration_username','2017-02-24 14:36:24.490286'),(214,'celery_utils','0001_initial','2017-02-24 14:36:24.825828'),(215,'commerce','0005_commerceconfiguration_enable_automatic_refund_approval','2017-02-24 14:36:25.166899'),(216,'crawlers','0001_initial','2017-02-24 14:36:25.613555'),(217,'database_fixups','0001_initial','2017-02-24 14:36:25.733481'),(218,'email_marketing','0004_emailmarketingconfiguration_welcome_email_send_delay','2017-02-24 14:36:26.207683'),(219,'enterprise','0010_auto_20161222_1212','2017-02-24 14:36:27.350496'),(220,'enterprise','0011_enterprisecustomerentitlement_historicalenterprisecustomerentitlement','2017-02-24 14:36:28.964161'),(221,'enterprise','0012_auto_20170125_1033','2017-02-24 14:36:29.758403'),(222,'enterprise','0013_auto_20170125_1157','2017-02-24 14:36:32.344638'),(223,'enterprise','0014_enrollmentnotificationemailtemplate_historicalenrollmentnotificationemailtemplate','2017-02-24 14:36:33.913008'),(224,'enterprise','0015_auto_20170130_0003','2017-02-24 14:36:35.225065'),(225,'grades','0009_auto_20170111_1507','2017-02-24 14:36:35.519391'),(226,'grades','0010_auto_20170112_1156','2017-02-24 14:36:35.645242'),(227,'grades','0011_null_edited_time','2017-02-24 14:36:36.143239'),(228,'mobile_api','0003_ignore_mobile_available_flag','2017-02-24 14:36:37.535629'),(229,'organizations','0002_auto_20170117_1434','2017-02-24 14:36:37.595301'),(230,'programs','0010_auto_20170204_2332','2017-02-24 14:36:38.906037'),(231,'student','0009_auto_20170111_0422','2017-02-24 14:36:40.086964'),(232,'student','0010_auto_20170207_0458','2017-02-24 14:36:40.108819'),(233,'waffle','0001_initial','2017-02-24 14:36:42.930396'),(234,'tagging','0002_auto_20170116_1541','2017-02-24 14:40:24.563494'),(235,'block_structure','0001_config','2017-06-07 00:37:30.343993'),(236,'block_structure','0002_blockstructuremodel','2017-06-07 00:37:30.391358'),(237,'block_structure','0003_blockstructuremodel_storage','2017-06-07 00:37:30.419870'),(238,'block_structure','0004_blockstructuremodel_usagekeywithrun','2017-06-07 00:37:30.448817'),(239,'catalog','0003_catalogintegration_page_size','2017-06-07 00:37:30.602706'),(240,'commerce','0006_auto_20170424_1734','2017-06-07 00:37:30.740048'),(241,'course_groups','0002_change_inline_default_cohort_value','2017-06-07 00:37:30.778006'),(242,'course_overviews','0011_courseoverview_marketing_url','2017-06-07 00:37:30.845672'),(243,'course_overviews','0012_courseoverview_eligible_for_financial_aid','2017-06-07 00:37:30.899639'),(244,'crawlers','0002_auto_20170419_0018','2017-06-07 00:37:31.070971'),(245,'credentials','0003_auto_20170525_1109','2017-06-07 00:37:31.401834'),(246,'edxval','0004_data__add_hls_profile','2017-06-07 00:37:31.444213'),(247,'enterprise','0016_auto_20170405_0647','2017-06-07 00:37:37.503430'),(248,'enterprise','0017_auto_20170508_1341','2017-06-07 00:37:39.032610'),(249,'enterprise','0018_auto_20170511_1357','2017-06-07 00:37:40.093513'),(250,'grades','0012_computegradessetting','2017-06-07 00:37:40.674807'),(251,'instructor_task','0002_gradereportsetting','2017-06-07 00:37:41.262790'),(252,'integrated_channel','0001_initial','2017-06-07 00:37:42.180309'),(253,'organizations','0003_auto_20170221_1138','2017-06-07 00:37:42.310695'),(254,'organizations','0004_auto_20170413_2315','2017-06-07 00:37:42.434738'),(255,'programs','0011_auto_20170301_1844','2017-06-07 00:37:51.550330'),(256,'programs','0012_auto_20170419_0018','2017-06-07 00:37:52.112932'),(257,'sap_success_factors','0001_initial','2017-06-07 00:37:53.983983'),(258,'sap_success_factors','0002_auto_20170224_1545','2017-06-07 00:37:58.463119'),(259,'sap_success_factors','0003_auto_20170317_1402','2017-06-07 00:37:59.852698'),(260,'sap_success_factors','0004_catalogtransmissionaudit_audit_summary','2017-06-07 00:37:59.921348'),(261,'third_party_auth','0006_samlproviderconfig_automatic_refresh_enabled','2017-06-07 00:38:00.871273'),(262,'third_party_auth','0007_auto_20170406_0912','2017-06-07 00:38:03.066662'),(263,'third_party_auth','0008_auto_20170413_1455','2017-06-07 00:38:07.526124'),(264,'third_party_auth','0009_auto_20170415_1144','2017-06-07 00:38:11.039117'),(265,'third_party_auth','0010_add_skip_hinted_login_dialog_field','2017-06-07 00:38:15.035132'),(266,'video_config','0001_initial','2017-06-07 00:38:18.650519'),(267,'waffle_utils','0001_initial','2017-06-07 00:38:19.757784'),(268,'xblock_config','0002_courseeditltifieldsenabledflag','2017-06-07 00:42:52.632305'),(269,'assessment','0003_expand_course_id','2017-06-21 15:56:49.626427'),(270,'course_overviews','0013_courseoverview_language','2017-06-21 15:56:49.686469'),(271,'django_comment_common','0005_coursediscussionsettings','2017-06-21 15:56:49.737238'),(272,'enterprise','0019_auto_20170606_1853','2017-06-21 15:56:50.595767'),(273,'experiments','0001_initial','2017-06-21 15:56:51.802549'),(274,'third_party_auth','0011_auto_20170616_0112','2017-06-21 15:56:52.421575'),(275,'catalog','0004_auto_20170616_0618','2017-06-21 16:21:00.587994'),(276,'djcelery','0001_initial','2017-06-21 16:21:00.978433'),(277,'celery_utils','0002_chordable_django_backend','2017-06-21 16:21:01.100695'),(278,'course_groups','0003_auto_20170609_1455','2017-06-21 16:21:01.800797'),(279,'social_django','0006_partial','2017-06-21 16:21:01.891205'),(280,'social_django','0002_add_related_name','2017-06-21 16:21:01.924189'),(281,'social_django','0003_alter_email_max_length','2017-06-21 16:21:01.953674'),(282,'social_django','0001_initial','2017-06-21 16:21:01.969848'),(283,'social_django','0004_auto_20160423_0400','2017-06-21 16:21:01.981097'),(284,'social_django','0005_auto_20160727_2333','2017-06-21 16:21:01.993158'),(285,'api_admin','0007_delete_historical_api_records','2018-01-31 21:01:44.604042'),(286,'catalog','0005_catalogintegration_long_term_cache_ttl','2018-01-31 21:01:44.742139'),(287,'certificates','0009_certificategenerationcoursesetting_language_self_generation','2018-01-31 21:01:44.837709'),(288,'certificates','0010_certificatetemplate_language','2018-01-31 21:01:44.879450'),(289,'certificates','0011_certificatetemplate_alter_unique','2018-01-31 21:01:44.929486'),(290,'certificates','0012_certificategenerationcoursesetting_include_hours_of_effort','2018-01-31 21:01:44.967558'),(291,'certificates','0013_remove_certificategenerationcoursesetting_enabled','2018-01-31 21:01:45.003982'),(292,'completion','0001_initial','2018-01-31 21:01:45.417693'),(293,'enterprise','0020_auto_20170624_2316','2018-01-31 21:01:46.385829'),(294,'enterprise','0021_auto_20170711_0712','2018-01-31 21:01:47.333992'),(295,'enterprise','0022_auto_20170720_1543','2018-01-31 21:01:47.726621'),(296,'enterprise','0023_audit_data_reporting_flag','2018-01-31 21:01:48.145327'),(297,'enterprise','0024_enterprisecustomercatalog_historicalenterprisecustomercatalog','2018-01-31 21:01:48.610337'),(298,'consent','0001_initial','2018-01-31 21:01:49.321638'),(299,'consent','0002_migrate_to_new_data_sharing_consent','2018-01-31 21:01:49.351643'),(300,'consent','0003_historicaldatasharingconsent_history_change_reason','2018-01-31 21:01:49.589455'),(301,'course_goals','0001_initial','2018-01-31 21:01:50.084210'),(302,'course_goals','0002_auto_20171010_1129','2018-01-31 21:01:50.330423'),(303,'course_modes','0008_course_key_field_to_foreign_key','2018-01-31 21:01:53.209890'),(304,'course_modes','0009_suggested_prices_to_charfield','2018-01-31 21:01:53.414164'),(305,'course_modes','0010_archived_suggested_prices_to_charfield','2018-01-31 21:01:53.449534'),(306,'course_overviews','0014_courseoverview_certificate_available_date','2018-01-31 21:01:53.672627'),(307,'courseware','0002_coursedynamicupgradedeadlineconfiguration_dynamicupgradedeadlineconfiguration','2018-01-31 21:01:54.153350'),(308,'courseware','0003_auto_20170825_0935','2018-01-31 21:01:54.383133'),(309,'courseware','0004_auto_20171010_1639','2018-01-31 21:01:54.616064'),(310,'courseware','0005_orgdynamicupgradedeadlineconfiguration','2018-01-31 21:01:55.097014'),(311,'credit','0004_delete_historical_credit_records','2018-01-31 21:01:56.309356'),(312,'enterprise','0025_auto_20170828_1412','2018-01-31 21:01:57.886273'),(313,'enterprise','0026_make_require_account_level_consent_nullable','2018-01-31 21:01:58.439892'),(314,'enterprise','0027_remove_account_level_consent','2018-01-31 21:02:00.565936'),(315,'enterprise','0028_link_enterprise_to_enrollment_template','2018-01-31 21:02:01.607377'),(316,'enterprise','0029_auto_20170925_1909','2018-01-31 21:02:01.959689'),(317,'enterprise','0030_auto_20171005_1600','2018-01-31 21:02:02.664205'),(318,'enterprise','0031_auto_20171012_1249','2018-01-31 21:02:03.456703'),(319,'enterprise','0032_reporting_model','2018-01-31 21:02:03.898842'),(320,'enterprise','0033_add_history_change_reason_field','2018-01-31 21:02:06.085068'),(321,'enterprise','0034_auto_20171023_0727','2018-01-31 21:02:08.772191'),(322,'degreed','0001_initial','2018-01-31 21:02:09.672452'),(323,'degreed','0002_auto_20180104_0103','2018-01-31 21:02:10.546526'),(324,'degreed','0003_auto_20180109_0712','2018-01-31 21:02:11.120021'),(325,'edxval','0005_videoimage','2018-01-31 21:02:11.201849'),(326,'edxval','0006_auto_20171009_0725','2018-01-31 21:02:11.332744'),(327,'edxval','0007_transcript_credentials_state','2018-01-31 21:02:11.419269'),(328,'edxval','0008_remove_subtitles','2018-01-31 21:02:11.520396'),(329,'edxval','0009_auto_20171127_0406','2018-01-31 21:02:11.562866'),(330,'edxval','0010_add_video_as_foreign_key','2018-01-31 21:02:11.797949'),(331,'email_marketing','0005_emailmarketingconfiguration_user_registration_cookie_timeout_delay','2018-01-31 21:02:12.217904'),(332,'email_marketing','0006_auto_20170711_0615','2018-01-31 21:02:12.624095'),(333,'email_marketing','0007_auto_20170809_0653','2018-01-31 21:02:13.882545'),(334,'email_marketing','0008_auto_20170809_0539','2018-01-31 21:02:13.915894'),(335,'email_marketing','0009_remove_emailmarketingconfiguration_sailthru_activation_template','2018-01-31 21:02:14.348814'),(336,'enterprise','0035_auto_20171212_1129','2018-01-31 21:02:15.284155'),(337,'enterprise','0036_sftp_reporting_support','2018-01-31 21:02:19.660671'),(338,'enterprise','0037_auto_20180110_0450','2018-01-31 21:02:21.034910'),(339,'enterprise','0038_auto_20180122_1427','2018-01-31 21:02:22.394776'),(340,'enterprise','0039_auto_20180129_1034','2018-01-31 21:02:23.811475'),(341,'enterprise','0040_auto_20180129_1428','2018-01-31 21:02:27.383393'),(342,'student','0011_course_key_field_to_foreign_key','2018-01-31 21:02:32.705958'),(343,'student','0012_sociallink','2018-01-31 21:02:33.539909'),(344,'student','0013_delete_historical_enrollment_records','2018-01-31 21:02:36.241468'),(345,'entitlements','0001_initial','2018-01-31 21:02:37.138219'),(346,'entitlements','0002_auto_20171102_0719','2018-01-31 21:02:40.613256'),(347,'entitlements','0003_auto_20171205_1431','2018-01-31 21:02:44.308427'),(348,'entitlements','0004_auto_20171206_1729','2018-01-31 21:02:45.212260'),(349,'experiments','0002_auto_20170627_1402','2018-01-31 21:02:45.318873'),(350,'experiments','0003_auto_20170713_1148','2018-01-31 21:02:45.367106'),(351,'grades','0013_persistentsubsectiongradeoverride','2018-01-31 21:02:45.461553'),(352,'sap_success_factors','0005_historicalsapsuccessfactorsenterprisecustomerconfiguration_history_change_reason','2018-01-31 21:02:46.467904'),(353,'sap_success_factors','0006_sapsuccessfactors_use_enterprise_enrollment_page_waffle_flag','2018-01-31 21:02:46.517413'),(354,'sap_success_factors','0007_remove_historicalsapsuccessfactorsenterprisecustomerconfiguration_history_change_reason','2018-01-31 21:02:47.583412'),(355,'sap_success_factors','0008_historicalsapsuccessfactorsenterprisecustomerconfiguration_history_change_reason','2018-01-31 21:02:50.664627'),(356,'sap_success_factors','0009_sapsuccessfactors_remove_enterprise_enrollment_page_waffle_flag','2018-01-31 21:02:50.728412'),(357,'sap_success_factors','0010_move_audit_tables_to_base_integrated_channel','2018-01-31 21:02:50.862314'),(358,'integrated_channel','0002_delete_enterpriseintegratedchannel','2018-01-31 21:02:50.913236'),(359,'integrated_channel','0003_catalogtransmissionaudit_learnerdatatransmissionaudit','2018-01-31 21:02:51.016140'),(360,'integrated_channel','0004_catalogtransmissionaudit_channel','2018-01-31 21:02:51.078082'),(361,'microsite_configuration','0003_delete_historical_records','2018-01-31 21:02:53.863822'),(362,'oauth2','0005_grant_nonce','2018-01-31 21:02:54.740173'),(363,'oauth2_provider','0003_auto_20160316_1503','2018-01-31 21:02:55.737270'),(364,'oauth2_provider','0004_auto_20160525_1623','2018-01-31 21:02:58.647377'),(365,'organizations','0005_auto_20171116_0640','2018-01-31 21:02:58.712488'),(366,'organizations','0006_auto_20171207_0259','2018-01-31 21:02:58.776094'),(367,'problem_builder','0004_copy_course_ids','2018-01-31 21:02:58.827699'),(368,'problem_builder','0005_auto_20170112_1021','2018-01-31 21:02:58.966863'),(369,'problem_builder','0006_remove_deprecated_course_id','2018-01-31 21:02:59.088639'),(370,'sap_success_factors','0011_auto_20180104_0103','2018-01-31 21:03:16.358552'),(371,'sap_success_factors','0012_auto_20180109_0712','2018-01-31 21:03:18.483528'),(372,'schedules','0001_initial','2018-01-31 21:03:19.621088'),(373,'schedules','0002_auto_20170816_1532','2018-01-31 21:03:21.963312'),(374,'schedules','0003_scheduleconfig','2018-01-31 21:03:23.157828'),(375,'schedules','0004_auto_20170922_1428','2018-01-31 21:03:25.544388'),(376,'schedules','0005_auto_20171010_1722','2018-01-31 21:03:27.981349'),(377,'schedules','0006_scheduleexperience','2018-01-31 21:03:29.227661'),(378,'schedules','0007_scheduleconfig_hold_back_ratio','2018-01-31 21:03:30.503809'),(379,'submissions','0004_remove_django_extensions','2018-01-31 21:03:30.602382'),(380,'third_party_auth','0012_auto_20170626_1135','2018-01-31 21:03:35.495425'),(381,'third_party_auth','0013_sync_learner_profile_data','2018-01-31 21:03:41.799865'),(382,'third_party_auth','0014_auto_20171222_1233','2018-01-31 21:03:44.368171'),(383,'third_party_auth','0015_samlproviderconfig_archived','2018-01-31 21:03:45.374766'),(384,'third_party_auth','0016_auto_20180130_0938','2018-01-31 21:03:47.924768'),(385,'verified_track_content','0003_migrateverifiedtrackcohortssetting','2018-01-31 21:03:49.225425'),(386,'verify_student','0004_delete_historical_records','2018-01-31 21:03:50.646174'),(387,'video_config','0002_coursevideotranscriptenabledflag_videotranscriptenabledflag','2018-01-31 21:03:53.578941'),(388,'video_pipeline','0001_initial','2018-01-31 21:03:55.059304'),(389,'video_pipeline','0002_auto_20171114_0704','2018-01-31 21:03:58.255057'),(390,'video_pipeline','0003_coursevideouploadsenabledbydefault_videouploadsenabledbydefault','2018-01-31 21:04:01.607944'),(391,'waffle','0002_auto_20161201_0958','2018-01-31 21:04:01.674629'),(392,'wiki','0005_remove_attachments_and_images','2018-01-31 21:04:10.782730'),(393,'workflow','0002_remove_django_extensions','2018-01-31 21:04:10.874302'),(394,'contentstore','0002_add_assets_page_flag','2018-01-31 21:12:40.535952');
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
  `worker_id` int(11) DEFAULT NULL,
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
  `exists` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_thirdpartytranscriptcredentials_org_56deb259e3beb1a8_uniq` (`org`,`provider`)
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
  CONSTRAINT `edxval_course_video_id_595461bc0ff739b3_fk_edxval_coursevideo_id` FOREIGN KEY (`course_video_id`) REFERENCES `edxval_coursevideo` (`id`)
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
  `video_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_videotranscript_video_id_729fab369c0f7028_uniq` (`video_id`,`language_code`),
  KEY `edxval_videotranscript_60716c2f` (`language_code`),
  KEY `edxval_videotranscript_e1be1ad3` (`file_format`),
  KEY `edxval_videotranscript_b58b747e` (`video_id`),
  CONSTRAINT `edxval_videotranscr_video_id_2578e231c810d058_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
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
  `user_registration_cookie_timeout_delay` double NOT NULL,
  `sailthru_welcome_template` varchar(20) NOT NULL,
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
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `D00946bb46f9643cebba6a818adbfd61` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
  `catalog` int(10) unsigned DEFAULT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
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
-- Table structure for table `enterprise_enterprisecustomercatalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomercatalog` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `content_filter` longtext,
  `title` varchar(20) NOT NULL,
  `enabled_course_modes` longtext NOT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `D6b10b4c766f4d007227cae59564ac44` (`enterprise_customer_id`),
  CONSTRAINT `D6b10b4c766f4d007227cae59564ac44` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
-- Table structure for table `enterprise_enterprisecustomerreportingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerreportingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `delivery_method` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `day_of_month` smallint(6) DEFAULT NULL,
  `day_of_week` smallint(6) DEFAULT NULL,
  `hour_of_day` smallint(6) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `sftp_file_path` varchar(256),
  `sftp_hostname` varchar(256),
  `sftp_port` int(10) unsigned,
  `sftp_username` varchar(256),
  `decrypted_password` longblob,
  `decrypted_sftp_password` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `D8a814303f0ffb6d38fe62b75eb3f96b` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
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
  `enterprise_customer_id` char(32),
  `history_change_reason` varchar(100),
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_1f039ddadc60ca21_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicalenrollmentnotificationemailtemplate_b80063a` (`id`),
  KEY `enterprise_historicalenrollmentnotificationemailtemplate_8efece6` (`enterprise_customer_id`),
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
  `course_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_user_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_change_reason` varchar(100),
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
  `site_id` int(11) DEFAULT NULL,
  `catalog` int(10) unsigned DEFAULT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `history_change_reason` varchar(100),
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
-- Table structure for table `enterprise_historicalenterprisecustomercatalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomercatalog` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `content_filter` longtext,
  `title` varchar(20) NOT NULL,
  `enabled_course_modes` longtext NOT NULL,
  `history_change_reason` varchar(100),
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_hist_history_user_id_1f0d4124b2b4b2d8_fk_auth_user_id` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomercatalog_ef7c876f` (`uuid`),
  CONSTRAINT `enterprise_hist_history_user_id_1f0d4124b2b4b2d8_fk_auth_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
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
  `history_change_reason` varchar(100),
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
  `_policy_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `entitlements_courseentitlement_uuid_a690dd005d0695b_uniq` (`uuid`),
  KEY `entitlements_courseentit_user_id_a8df050144d72f8_fk_auth_user_id` (`user_id`),
  KEY `fda6bce9129c5afc395658f36b9d444e` (`enrollment_course_run_id`),
  KEY `entitlements_courseentitlement_36cddc86` (`_policy_id`),
  CONSTRAINT `D2cebc0610e28b9b3a821c839e2fe01c` FOREIGN KEY (`_policy_id`) REFERENCES `entitlements_courseentitlementpolicy` (`id`),
  CONSTRAINT `entitlements_courseentit_user_id_a8df050144d72f8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fda6bce9129c5afc395658f36b9d444e` FOREIGN KEY (`enrollment_course_run_id`) REFERENCES `student_courseenrollment` (`id`)
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
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlements_courseen_site_id_5256b0e7f6e039cc_fk_django_site_id` (`site_id`),
  CONSTRAINT `entitlements_courseen_site_id_5256b0e7f6e039cc_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  UNIQUE KEY `experiments_experimentkeyval_experiment_id_7e8b0ae772b01da6_uniq` (`experiment_id`,`key`),
  KEY `experiments_experimentkeyvalue_abd1812d` (`experiment_id`)
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
  `passed_timestamp` datetime(6) DEFAULT NULL,
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
  `first_attempted` datetime(6) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_id` (`grade_id`),
  KEY `grades_persistentsubsectiongradeoverride_e2fa5388` (`created`),
  KEY `grades_persistentsubsectiongradeoverride_9ae73c65` (`modified`),
  CONSTRAINT `D843af3bd266b7666e4f166216719659` FOREIGN KEY (`grade_id`) REFERENCES `grades_persistentsubsectiongrade` (`id`)
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
-- Table structure for table `integrated_channel_catalogtransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_catalogtransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_customer_uuid` char(32) NOT NULL,
  `total_courses` int(10) unsigned NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `audit_summary` longtext NOT NULL,
  `channel` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_catalogtransmissionaudit`
--

LOCK TABLES `integrated_channel_catalogtransmissionaudit` WRITE;
/*!40000 ALTER TABLE `integrated_channel_catalogtransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_catalogtransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_learnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_learnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
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
-- Dumping data for table `integrated_channel_learnerdatatransmissionaudit`
--

LOCK TABLES `integrated_channel_learnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `integrated_channel_learnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_learnerdatatransmissionaudit` ENABLE KEYS */;
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
  `requirements` varchar(255) DEFAULT NULL,
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
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2016-12-17 01:38:31.206255','2016-12-17 01:38:31.207046','fulfills','Autogenerated milestone relationship type \"fulfills\"',1),(2,'2016-12-17 01:38:31.209155','2016-12-17 01:38:31.209526','requires','Autogenerated milestone relationship type \"requires\"',1);
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
  `subscription_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_accesstoken`
--

LOCK TABLES `oauth2_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_accesstoken` VALUES (1,'4f18eb17733e5854dde769e1af9032a2e5975b0c','2018-06-07 00:48:11.256868',39,2,4),(2,'69e1bcdf78dbc96086005e1d6c9f695a6712f0ea','2018-06-21 16:09:02.563269',39,2,4),(3,'1d66ef834f77cc45b8b290645f365248627053b4','2019-01-31 21:22:46.293242',39,3,1),(4,'bda601532c7a6e9503fc8e1807fce19254634740','2019-01-31 21:24:46.650858',39,2,4);
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
  `logout_uri` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_client_user_id_2b47284bbd512fe1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_client_user_id_2b47284bbd512fe1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_client`
--

LOCK TABLES `oauth2_client` WRITE;
/*!40000 ALTER TABLE `oauth2_client` DISABLE KEYS */;
INSERT INTO `oauth2_client` VALUES (1,'credentials','http://localhost:18150','http://localhost:18150/complete/edx-oidc/','credentials-key','credentials-secret',0,3,'http://localhost:18150/logout/'),(2,'discovery','http://localhost:18381','http://localhost:18381/complete/edx-oidc/','discovery-key','discovery-secret',0,4,'http://localhost:18381/logout/'),(3,'ecommerce','http://localhost:18130','http://localhost:18130/complete/edx-oidc/','ecommerce-key','ecommerce-secret',0,1,'http://localhost:18130/logout/'),(4,'programs','http://localhost:18140','http://localhost:18140/complete/edx-oidc/','programs-key','programs-secret',0,5,'http://localhost:18140/logout/');
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
  `nonce` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id` (`user_id`),
  KEY `oauth2_grant_client_id_7f83b952b3c51985_idx` (`client_id`,`code`,`expires`),
  CONSTRAINT `oauth2_grant_client_id_fbfc174fbc856af_fk_oauth2_client_id` FOREIGN KEY (`client_id`) REFERENCES `oauth2_client` (`id`),
  CONSTRAINT `oauth2_grant_user_id_3de96a461bb76819_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_grant`
--

LOCK TABLES `oauth2_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_grant` DISABLE KEYS */;
INSERT INTO `oauth2_grant` VALUES (1,'e478ebb176d4b84fbddc2c3b2e6b17bf8a608414','2016-12-17 06:29:58.431878','http://localhost:18381/complete/edx-oidc/',39,2,2,''),(2,'94e3dd2bd8d776bcde855025ece04c02537d17be','2016-12-18 05:21:32.161245','http://localhost:18381/complete/edx-oidc/',39,2,2,'');
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
  UNIQUE KEY `oauth2_provider_accesstoken_token_3f77f86fb4ecbe0f_uniq` (`token`),
  KEY `D5ac3019ee1c474fd85718b015e3d3a1` (`application_id`),
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
  `user_id` int(11) DEFAULT NULL,
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
  UNIQUE KEY `oauth2_provider_grant_code_a5c88732687483b_uniq` (`code`),
  KEY `D6b2a4f1402d4f338b690c38b795830a` (`application_id`),
  KEY `oauth2_provider_grant_user_id_3111344894d452da_fk_auth_user_id` (`user_id`),
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
  UNIQUE KEY `oauth2_provider_refreshtoken_token_1e4e9388e6a22527_uniq` (`token`),
  KEY `d3e264ceec355cabed6ff9976fc42a06` (`application_id`),
  KEY `oauth2_provider_refresh_user_id_3f695b639cfbc9a3_fk_auth_user_id` (`user_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_trustedclient`
--

LOCK TABLES `oauth2_provider_trustedclient` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_trustedclient` DISABLE KEYS */;
INSERT INTO `oauth2_provider_trustedclient` VALUES (1,1),(2,2),(3,3),(4,4);
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
  `student_input` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `problem_builder_answer_student_id_2ce682a818c95cbc_uniq` (`student_id`,`course_key`,`name`),
  KEY `problem_builder_answer_b068931c` (`name`),
  KEY `problem_builder_answer_30a811f6` (`student_id`),
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
  `history_change_reason` varchar(100),
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
-- Table structure for table `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` (
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
-- Dumping data for table `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` ENABLE KEYS */;
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
  `start` datetime(6) NOT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  KEY `schedules_schedule_start_796b08534b0ea8a8_uniq` (`start`),
  KEY `schedules_schedule_upgrade_deadline_29b3e0a021034e_uniq` (`upgrade_deadline`),
  CONSTRAINT `sc_enrollment_id_73757e1116f677ec_fk_student_courseenrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
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
  `create_schedules` tinyint(1) NOT NULL,
  `enqueue_recurring_nudge` tinyint(1) NOT NULL,
  `deliver_recurring_nudge` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `deliver_upgrade_reminder` tinyint(1) NOT NULL,
  `enqueue_upgrade_reminder` tinyint(1) NOT NULL,
  `deliver_course_update` tinyint(1) NOT NULL,
  `enqueue_course_update` tinyint(1) NOT NULL,
  `hold_back_ratio` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_schedul_changed_by_id_5f7d8004127c3aac_fk_auth_user_id` (`changed_by_id`),
  KEY `schedules_schedulecon_site_id_5c0875f7e76f2d1f_fk_django_site_id` (`site_id`),
  CONSTRAINT `schedules_schedul_changed_by_id_5f7d8004127c3aac_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `schedules_schedulecon_site_id_5c0875f7e76f2d1f_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  CONSTRAINT `schedules__schedule_id_5ca03607383f8535_fk_schedules_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedules_schedule` (`id`)
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
  `invoice_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoice_item_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_94a08da1` (`token`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
INSERT INTO `student_anonymoususerid` VALUES (1,'184991cfb69ca3afd578cc3c2b9d5f37','',4),(2,'5afe5d9bb03796557ee2614f5c9611fb','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
INSERT INTO `student_courseenrollment` VALUES (1,'course-v1:edX+DemoX+Demo_Course','2017-06-07 00:44:28.308850',1,'audit',6),(2,'course-v1:edX+DemoX+Demo_Course','2017-06-07 00:44:32.887985',1,'audit',7),(3,'course-v1:edX+DemoX+Demo_Course','2017-06-07 00:44:37.447686',1,'audit',8),(4,'course-v1:edX+DemoX+Demo_Course','2017-06-07 00:44:41.997373',1,'audit',9);
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
  KEY `student_s_user_profile_id_7c5a1bfd4e58b3a_fk_auth_userprofile_id` (`user_profile_id`),
  CONSTRAINT `student_s_user_profile_id_7c5a1bfd4e58b3a_fk_auth_userprofile_id` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
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
  `submission_id` int(11) DEFAULT NULL,
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
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
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
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
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
  `slug` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth__changed_by_id_67a92ed1a69a5d1f_fk_auth_user_id` (`changed_by_id`),
  KEY `third_party_auth_samlconfiguration_9365d6e7` (`site_id`),
  KEY `third_party_auth_samlconfiguration_2dbcba41` (`slug`),
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
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `saml_configuration_id` int(11),
  PRIMARY KEY (`id`),
  KEY `third_party_auth__changed_by_id_508190ecd0b0e845_fk_auth_user_id` (`changed_by_id`),
  KEY `third_party_auth_samlproviderconfig_098674f1` (`idp_slug`),
  KEY `third_party_auth_samlproviderconfig_9365d6e7` (`site_id`),
  KEY `third_party_auth_samlproviderconfig_8b3b795c` (`saml_configuration_id`),
  CONSTRAINT `D2557cd97215f74bd67f5ef02c1487e6` FOREIGN KEY (`saml_configuration_id`) REFERENCES `third_party_auth_samlconfiguration` (`id`),
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
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2016-12-17 01:42:09.774066',1,NULL);
/*!40000 ALTER TABLE `util_ratelimitconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified_track_content_migrateverifiedtrackcohortssetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified_track_content_migrateverifiedtrackcohortssetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `old_course_key` varchar(255) NOT NULL,
  `rerun_course_key` varchar(255) NOT NULL,
  `audit_cohort_names` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verified_track_co_changed_by_id_3aa020546322e9ee_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `verified_track_co_changed_by_id_3aa020546322e9ee_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified_track_content_migrateverifiedtrackcohortssetting`
--

LOCK TABLES `verified_track_content_migrateverifiedtrackcohortssetting` WRITE;
/*!40000 ALTER TABLE `verified_track_content_migrateverifiedtrackcohortssetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `verified_track_content_migrateverifiedtrackcohortssetting` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationdeadline`
--

LOCK TABLES `verify_student_verificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` DISABLE KEYS */;
INSERT INTO `verify_student_verificationdeadline` VALUES (1,'2018-01-31 21:22:46.592715','2018-01-31 21:22:46.593232','course-v1:edX+DemoX+Demo_Course','2020-01-31 21:22:40.820392',1),(2,'2018-01-31 21:27:06.199979','2018-01-31 21:27:06.200224','course-v1:edX+E2E-101+course','2018-12-31 00:00:00.000000',0);
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
  KEY `video_config_cour_changed_by_id_184a5ebdccef55f5_fk_auth_user_id` (`changed_by_id`),
  KEY `video_config_coursevideotranscriptenabledflag_ea134da7` (`course_id`),
  CONSTRAINT `video_config_cour_changed_by_id_184a5ebdccef55f5_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `video_config_vide_changed_by_id_3a0857ce30241112_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `video_config_vide_changed_by_id_3a0857ce30241112_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  KEY `video_pipeline_co_changed_by_id_6fa6d53fe11c233b_fk_auth_user_id` (`changed_by_id`),
  KEY `video_pipeline_coursevideouploadsenabledbydefault_ea134da7` (`course_id`),
  CONSTRAINT `video_pipeline_co_changed_by_id_6fa6d53fe11c233b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `video_pipeline_videopipelineintegration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_videopipelineintegration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `api_url` varchar(200) NOT NULL,
  `service_username` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `client_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_vi_changed_by_id_384bb33af13db7a5_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `video_pipeline_vi_changed_by_id_384bb33af13db7a5_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_videopipelineintegration`
--

LOCK TABLES `video_pipeline_videopipelineintegration` WRITE;
/*!40000 ALTER TABLE `video_pipeline_videopipelineintegration` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_videopipelineintegration` ENABLE KEYS */;
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
  KEY `video_pipeline_vi_changed_by_id_4fff17e91cce415c_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `video_pipeline_vi_changed_by_id_4fff17e91cce415c_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
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
  `current_revision_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
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
  `current_revision_id` int(11) DEFAULT NULL,
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
  `previous_revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
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

-- Dump completed on 2018-01-31 21:36:25
