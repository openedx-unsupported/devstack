-- MySQL dump 10.13  Distrib 5.6.47, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.6.47

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
-- Current Database: `ecommerce`
--

/*!40000 DROP DATABASE IF EXISTS `ecommerce`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ecommerce`;

--
-- Table structure for table `address_country`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_country` (
  `iso_3166_1_a2` varchar(2) NOT NULL,
  `iso_3166_1_a3` varchar(3) NOT NULL,
  `iso_3166_1_numeric` varchar(3) NOT NULL,
  `printable_name` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_order` smallint(5) unsigned NOT NULL,
  `is_shipping_country` tinyint(1) NOT NULL,
  PRIMARY KEY (`iso_3166_1_a2`),
  KEY `address_country_display_order_dc88cde8` (`display_order`),
  KEY `address_country_is_shipping_country_f7b6c461` (`is_shipping_country`),
  KEY `address_country_printable_name_450b016c` (`printable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
INSERT INTO `address_country` VALUES ('AD','AND','020','Andorra','Principality of Andorra',0,1),('AE','ARE','784','United Arab Emirates','',0,1),('AF','AFG','004','Afghanistan','Islamic Republic of Afghanistan',0,1),('AG','ATG','028','Antigua and Barbuda','',0,1),('AI','AIA','660','Anguilla','',0,1),('AL','ALB','008','Albania','Republic of Albania',0,1),('AM','ARM','051','Armenia','Republic of Armenia',0,1),('AO','AGO','024','Angola','Republic of Angola',0,1),('AQ','ATA','010','Antarctica','',0,1),('AR','ARG','032','Argentina','Argentine Republic',0,1),('AS','ASM','016','American Samoa','',0,1),('AT','AUT','040','Austria','Republic of Austria',0,1),('AU','AUS','036','Australia','',0,1),('AW','ABW','533','Aruba','',0,1),('AX','ALA','248','Åland Islands','',0,1),('AZ','AZE','031','Azerbaijan','Republic of Azerbaijan',0,1),('BA','BIH','070','Bosnia and Herzegovina','Republic of Bosnia and Herzegovina',0,1),('BB','BRB','052','Barbados','',0,1),('BD','BGD','050','Bangladesh','People\'s Republic of Bangladesh',0,1),('BE','BEL','056','Belgium','Kingdom of Belgium',0,1),('BF','BFA','854','Burkina Faso','',0,1),('BG','BGR','100','Bulgaria','Republic of Bulgaria',0,1),('BH','BHR','048','Bahrain','Kingdom of Bahrain',0,1),('BI','BDI','108','Burundi','Republic of Burundi',0,1),('BJ','BEN','204','Benin','Republic of Benin',0,1),('BL','BLM','652','Saint Barthélemy','',0,1),('BM','BMU','060','Bermuda','',0,1),('BN','BRN','096','Brunei Darussalam','',0,1),('BO','BOL','068','Bolivia, Plurinational State of','Plurinational State of Bolivia',0,1),('BQ','BES','535','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius and Saba',0,1),('BR','BRA','076','Brazil','Federative Republic of Brazil',0,1),('BS','BHS','044','Bahamas','Commonwealth of the Bahamas',0,1),('BT','BTN','064','Bhutan','Kingdom of Bhutan',0,1),('BV','BVT','074','Bouvet Island','',0,1),('BW','BWA','072','Botswana','Republic of Botswana',0,1),('BY','BLR','112','Belarus','Republic of Belarus',0,1),('BZ','BLZ','084','Belize','',0,1),('CA','CAN','124','Canada','',0,1),('CC','CCK','166','Cocos (Keeling) Islands','',0,1),('CD','COD','180','Congo, The Democratic Republic of the','',0,1),('CF','CAF','140','Central African Republic','',0,1),('CG','COG','178','Congo','Republic of the Congo',0,1),('CH','CHE','756','Switzerland','Swiss Confederation',0,1),('CI','CIV','384','Côte d\'Ivoire','Republic of Côte d\'Ivoire',0,1),('CK','COK','184','Cook Islands','',0,1),('CL','CHL','152','Chile','Republic of Chile',0,1),('CM','CMR','120','Cameroon','Republic of Cameroon',0,1),('CN','CHN','156','China','People\'s Republic of China',0,1),('CO','COL','170','Colombia','Republic of Colombia',0,1),('CR','CRI','188','Costa Rica','Republic of Costa Rica',0,1),('CU','CUB','192','Cuba','Republic of Cuba',0,1),('CV','CPV','132','Cabo Verde','Republic of Cabo Verde',0,1),('CW','CUW','531','Curaçao','Curaçao',0,1),('CX','CXR','162','Christmas Island','',0,1),('CY','CYP','196','Cyprus','Republic of Cyprus',0,1),('CZ','CZE','203','Czechia','Czech Republic',0,1),('DE','DEU','276','Germany','Federal Republic of Germany',0,1),('DJ','DJI','262','Djibouti','Republic of Djibouti',0,1),('DK','DNK','208','Denmark','Kingdom of Denmark',0,1),('DM','DMA','212','Dominica','Commonwealth of Dominica',0,1),('DO','DOM','214','Dominican Republic','',0,1),('DZ','DZA','012','Algeria','People\'s Democratic Republic of Algeria',0,1),('EC','ECU','218','Ecuador','Republic of Ecuador',0,1),('EE','EST','233','Estonia','Republic of Estonia',0,1),('EG','EGY','818','Egypt','Arab Republic of Egypt',0,1),('EH','ESH','732','Western Sahara','',0,1),('ER','ERI','232','Eritrea','the State of Eritrea',0,1),('ES','ESP','724','Spain','Kingdom of Spain',0,1),('ET','ETH','231','Ethiopia','Federal Democratic Republic of Ethiopia',0,1),('FI','FIN','246','Finland','Republic of Finland',0,1),('FJ','FJI','242','Fiji','Republic of Fiji',0,1),('FK','FLK','238','Falkland Islands (Malvinas)','',0,1),('FM','FSM','583','Micronesia, Federated States of','Federated States of Micronesia',0,1),('FO','FRO','234','Faroe Islands','',0,1),('FR','FRA','250','France','French Republic',0,1),('GA','GAB','266','Gabon','Gabonese Republic',0,1),('GB','GBR','826','United Kingdom','United Kingdom of Great Britain and Northern Ireland',0,1),('GD','GRD','308','Grenada','',0,1),('GE','GEO','268','Georgia','',0,1),('GF','GUF','254','French Guiana','',0,1),('GG','GGY','831','Guernsey','',0,1),('GH','GHA','288','Ghana','Republic of Ghana',0,1),('GI','GIB','292','Gibraltar','',0,1),('GL','GRL','304','Greenland','',0,1),('GM','GMB','270','Gambia','Islamic Republic of the Gambia',0,1),('GN','GIN','324','Guinea','Republic of Guinea',0,1),('GP','GLP','312','Guadeloupe','',0,1),('GQ','GNQ','226','Equatorial Guinea','Republic of Equatorial Guinea',0,1),('GR','GRC','300','Greece','Hellenic Republic',0,1),('GS','SGS','239','South Georgia and the South Sandwich Islands','',0,1),('GT','GTM','320','Guatemala','Republic of Guatemala',0,1),('GU','GUM','316','Guam','',0,1),('GW','GNB','624','Guinea-Bissau','Republic of Guinea-Bissau',0,1),('GY','GUY','328','Guyana','Republic of Guyana',0,1),('HK','HKG','344','Hong Kong','Hong Kong Special Administrative Region of China',0,1),('HM','HMD','334','Heard Island and McDonald Islands','',0,1),('HN','HND','340','Honduras','Republic of Honduras',0,1),('HR','HRV','191','Croatia','Republic of Croatia',0,1),('HT','HTI','332','Haiti','Republic of Haiti',0,1),('HU','HUN','348','Hungary','Hungary',0,1),('ID','IDN','360','Indonesia','Republic of Indonesia',0,1),('IE','IRL','372','Ireland','',0,1),('IL','ISR','376','Israel','State of Israel',0,1),('IM','IMN','833','Isle of Man','',0,1),('IN','IND','356','India','Republic of India',0,1),('IO','IOT','086','British Indian Ocean Territory','',0,1),('IQ','IRQ','368','Iraq','Republic of Iraq',0,1),('IR','IRN','364','Iran, Islamic Republic of','Islamic Republic of Iran',0,1),('IS','ISL','352','Iceland','Republic of Iceland',0,1),('IT','ITA','380','Italy','Italian Republic',0,1),('JE','JEY','832','Jersey','',0,1),('JM','JAM','388','Jamaica','',0,1),('JO','JOR','400','Jordan','Hashemite Kingdom of Jordan',0,1),('JP','JPN','392','Japan','',0,1),('KE','KEN','404','Kenya','Republic of Kenya',0,1),('KG','KGZ','417','Kyrgyzstan','Kyrgyz Republic',0,1),('KH','KHM','116','Cambodia','Kingdom of Cambodia',0,1),('KI','KIR','296','Kiribati','Republic of Kiribati',0,1),('KM','COM','174','Comoros','Union of the Comoros',0,1),('KN','KNA','659','Saint Kitts and Nevis','',0,1),('KP','PRK','408','Korea, Democratic People\'s Republic of','Democratic People\'s Republic of Korea',0,1),('KR','KOR','410','Korea, Republic of','',0,1),('KW','KWT','414','Kuwait','State of Kuwait',0,1),('KY','CYM','136','Cayman Islands','',0,1),('KZ','KAZ','398','Kazakhstan','Republic of Kazakhstan',0,1),('LA','LAO','418','Lao People\'s Democratic Republic','',0,1),('LB','LBN','422','Lebanon','Lebanese Republic',0,1),('LC','LCA','662','Saint Lucia','',0,1),('LI','LIE','438','Liechtenstein','Principality of Liechtenstein',0,1),('LK','LKA','144','Sri Lanka','Democratic Socialist Republic of Sri Lanka',0,1),('LR','LBR','430','Liberia','Republic of Liberia',0,1),('LS','LSO','426','Lesotho','Kingdom of Lesotho',0,1),('LT','LTU','440','Lithuania','Republic of Lithuania',0,1),('LU','LUX','442','Luxembourg','Grand Duchy of Luxembourg',0,1),('LV','LVA','428','Latvia','Republic of Latvia',0,1),('LY','LBY','434','Libya','Libya',0,1),('MA','MAR','504','Morocco','Kingdom of Morocco',0,1),('MC','MCO','492','Monaco','Principality of Monaco',0,1),('MD','MDA','498','Moldova, Republic of','Republic of Moldova',0,1),('ME','MNE','499','Montenegro','Montenegro',0,1),('MF','MAF','663','Saint Martin (French part)','',0,1),('MG','MDG','450','Madagascar','Republic of Madagascar',0,1),('MH','MHL','584','Marshall Islands','Republic of the Marshall Islands',0,1),('MK','MKD','807','Macedonia, Republic of','The Former Yugoslav Republic of Macedonia',0,1),('ML','MLI','466','Mali','Republic of Mali',0,1),('MM','MMR','104','Myanmar','Republic of Myanmar',0,1),('MN','MNG','496','Mongolia','',0,1),('MO','MAC','446','Macao','Macao Special Administrative Region of China',0,1),('MP','MNP','580','Northern Mariana Islands','Commonwealth of the Northern Mariana Islands',0,1),('MQ','MTQ','474','Martinique','',0,1),('MR','MRT','478','Mauritania','Islamic Republic of Mauritania',0,1),('MS','MSR','500','Montserrat','',0,1),('MT','MLT','470','Malta','Republic of Malta',0,1),('MU','MUS','480','Mauritius','Republic of Mauritius',0,1),('MV','MDV','462','Maldives','Republic of Maldives',0,1),('MW','MWI','454','Malawi','Republic of Malawi',0,1),('MX','MEX','484','Mexico','United Mexican States',0,1),('MY','MYS','458','Malaysia','',0,1),('MZ','MOZ','508','Mozambique','Republic of Mozambique',0,1),('NA','NAM','516','Namibia','Republic of Namibia',0,1),('NC','NCL','540','New Caledonia','',0,1),('NE','NER','562','Niger','Republic of the Niger',0,1),('NF','NFK','574','Norfolk Island','',0,1),('NG','NGA','566','Nigeria','Federal Republic of Nigeria',0,1),('NI','NIC','558','Nicaragua','Republic of Nicaragua',0,1),('NL','NLD','528','Netherlands','Kingdom of the Netherlands',0,1),('NO','NOR','578','Norway','Kingdom of Norway',0,1),('NP','NPL','524','Nepal','Federal Democratic Republic of Nepal',0,1),('NR','NRU','520','Nauru','Republic of Nauru',0,1),('NU','NIU','570','Niue','Niue',0,1),('NZ','NZL','554','New Zealand','',0,1),('OM','OMN','512','Oman','Sultanate of Oman',0,1),('PA','PAN','591','Panama','Republic of Panama',0,1),('PE','PER','604','Peru','Republic of Peru',0,1),('PF','PYF','258','French Polynesia','',0,1),('PG','PNG','598','Papua New Guinea','Independent State of Papua New Guinea',0,1),('PH','PHL','608','Philippines','Republic of the Philippines',0,1),('PK','PAK','586','Pakistan','Islamic Republic of Pakistan',0,1),('PL','POL','616','Poland','Republic of Poland',0,1),('PM','SPM','666','Saint Pierre and Miquelon','',0,1),('PN','PCN','612','Pitcairn','',0,1),('PR','PRI','630','Puerto Rico','',0,1),('PS','PSE','275','Palestine, State of','the State of Palestine',0,1),('PT','PRT','620','Portugal','Portuguese Republic',0,1),('PW','PLW','585','Palau','Republic of Palau',0,1),('PY','PRY','600','Paraguay','Republic of Paraguay',0,1),('QA','QAT','634','Qatar','State of Qatar',0,1),('RE','REU','638','Réunion','',0,1),('RO','ROU','642','Romania','',0,1),('RS','SRB','688','Serbia','Republic of Serbia',0,1),('RU','RUS','643','Russian Federation','',0,1),('RW','RWA','646','Rwanda','Rwandese Republic',0,1),('SA','SAU','682','Saudi Arabia','Kingdom of Saudi Arabia',0,1),('SB','SLB','090','Solomon Islands','',0,1),('SC','SYC','690','Seychelles','Republic of Seychelles',0,1),('SD','SDN','729','Sudan','Republic of the Sudan',0,1),('SE','SWE','752','Sweden','Kingdom of Sweden',0,1),('SG','SGP','702','Singapore','Republic of Singapore',0,1),('SH','SHN','654','Saint Helena, Ascension and Tristan da Cunha','',0,1),('SI','SVN','705','Slovenia','Republic of Slovenia',0,1),('SJ','SJM','744','Svalbard and Jan Mayen','',0,1),('SK','SVK','703','Slovakia','Slovak Republic',0,1),('SL','SLE','694','Sierra Leone','Republic of Sierra Leone',0,1),('SM','SMR','674','San Marino','Republic of San Marino',0,1),('SN','SEN','686','Senegal','Republic of Senegal',0,1),('SO','SOM','706','Somalia','Federal Republic of Somalia',0,1),('SR','SUR','740','Suriname','Republic of Suriname',0,1),('SS','SSD','728','South Sudan','Republic of South Sudan',0,1),('ST','STP','678','Sao Tome and Principe','Democratic Republic of Sao Tome and Principe',0,1),('SV','SLV','222','El Salvador','Republic of El Salvador',0,1),('SX','SXM','534','Sint Maarten (Dutch part)','Sint Maarten (Dutch part)',0,1),('SY','SYR','760','Syrian Arab Republic','',0,1),('SZ','SWZ','748','Swaziland','Kingdom of Swaziland',0,1),('TC','TCA','796','Turks and Caicos Islands','',0,1),('TD','TCD','148','Chad','Republic of Chad',0,1),('TF','ATF','260','French Southern Territories','',0,1),('TG','TGO','768','Togo','Togolese Republic',0,1),('TH','THA','764','Thailand','Kingdom of Thailand',0,1),('TJ','TJK','762','Tajikistan','Republic of Tajikistan',0,1),('TK','TKL','772','Tokelau','',0,1),('TL','TLS','626','Timor-Leste','Democratic Republic of Timor-Leste',0,1),('TM','TKM','795','Turkmenistan','',0,1),('TN','TUN','788','Tunisia','Republic of Tunisia',0,1),('TO','TON','776','Tonga','Kingdom of Tonga',0,1),('TR','TUR','792','Turkey','Republic of Turkey',0,1),('TT','TTO','780','Trinidad and Tobago','Republic of Trinidad and Tobago',0,1),('TV','TUV','798','Tuvalu','',0,1),('TW','TWN','158','Taiwan, Province of China','Taiwan, Province of China',0,1),('TZ','TZA','834','Tanzania, United Republic of','United Republic of Tanzania',0,1),('UA','UKR','804','Ukraine','',0,1),('UG','UGA','800','Uganda','Republic of Uganda',0,1),('UM','UMI','581','United States Minor Outlying Islands','',0,1),('US','USA','840','United States','United States of America',0,1),('UY','URY','858','Uruguay','Eastern Republic of Uruguay',0,1),('UZ','UZB','860','Uzbekistan','Republic of Uzbekistan',0,1),('VA','VAT','336','Holy See (Vatican City State)','',0,1),('VC','VCT','670','Saint Vincent and the Grenadines','',0,1),('VE','VEN','862','Venezuela, Bolivarian Republic of','Bolivarian Republic of Venezuela',0,1),('VG','VGB','092','Virgin Islands, British','British Virgin Islands',0,1),('VI','VIR','850','Virgin Islands, U.S.','Virgin Islands of the United States',0,1),('VN','VNM','704','Viet Nam','Socialist Republic of Viet Nam',0,1),('VU','VUT','548','Vanuatu','Republic of Vanuatu',0,1),('WF','WLF','876','Wallis and Futuna','',0,1),('WS','WSM','882','Samoa','Independent State of Samoa',0,1),('YE','YEM','887','Yemen','Republic of Yemen',0,1),('YT','MYT','175','Mayotte','',0,1),('ZA','ZAF','710','South Africa','Republic of South Africa',0,1),('ZM','ZMB','894','Zambia','Republic of Zambia',0,1),('ZW','ZWE','716','Zimbabwe','Republic of Zimbabwe',0,1);
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_useraddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `notes` longtext NOT NULL,
  `is_default_for_shipping` tinyint(1) NOT NULL,
  `is_default_for_billing` tinyint(1) NOT NULL,
  `num_orders_as_shipping_address` int(10) unsigned NOT NULL,
  `hash` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num_orders_as_billing_address` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_useraddress_user_id_hash_9d1738c7_uniq` (`user_id`,`hash`),
  KEY `address_useraddress_country_id_fa26a249_fk_address_c` (`country_id`),
  KEY `address_useraddress_hash_e0a6b290` (`hash`),
  CONSTRAINT `address_useraddress_country_id_fa26a249_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `address_useraddress_user_id_6edf0244_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_useraddress`
--

LOCK TABLES `address_useraddress` WRITE;
/*!40000 ALTER TABLE `address_useraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_productrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_productrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_purchases` int(10) unsigned NOT NULL,
  `score` double NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `analytics_productrecord_num_purchases_405301a0` (`num_purchases`),
  CONSTRAINT `analytics_productrec_product_id_dad3a871_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_productrecord`
--

LOCK TABLES `analytics_productrecord` WRITE;
/*!40000 ALTER TABLE `analytics_productrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_productrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userproductview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userproductview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_userproduc_product_id_a55b87ad_fk_catalogue` (`product_id`),
  KEY `analytics_userproductview_user_id_5e49a8b1_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `analytics_userproduc_product_id_a55b87ad_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `analytics_userproductview_user_id_5e49a8b1_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userproductview`
--

LOCK TABLES `analytics_userproductview` WRITE;
/*!40000 ALTER TABLE `analytics_userproductview` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_userproductview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_product_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `num_order_lines` int(10) unsigned NOT NULL,
  `num_order_items` int(10) unsigned NOT NULL,
  `total_spent` decimal(12,2) NOT NULL,
  `date_last_order` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `analytics_userrecord_num_orders_b352ffd1` (`num_orders`),
  KEY `analytics_userrecord_num_order_lines_97cc087f` (`num_order_lines`),
  KEY `analytics_userrecord_num_order_items_fb2a8304` (`num_order_items`),
  CONSTRAINT `analytics_userrecord_user_id_702cff4c_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userrecord`
--

LOCK TABLES `analytics_userrecord` WRITE;
/*!40000 ALTER TABLE `analytics_userrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_userrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_usersearch`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_usersearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_usersearch_user_id_1775992d_fk_ecommerce_user_id` (`user_id`),
  KEY `analytics_usersearch_query_ad36478b` (`query`),
  CONSTRAINT `analytics_usersearch_user_id_1775992d_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_usersearch`
--

LOCK TABLES `analytics_usersearch` WRITE;
/*!40000 ALTER TABLE `analytics_usersearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_usersearch` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Country',1,'add_country'),(2,'Can change Country',1,'change_country'),(3,'Can delete Country',1,'delete_country'),(4,'Can view Country',1,'view_country'),(5,'Can add User address',2,'add_useraddress'),(6,'Can change User address',2,'change_useraddress'),(7,'Can delete User address',2,'delete_useraddress'),(8,'Can view User address',2,'view_useraddress'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add User product view',6,'add_userproductview'),(14,'Can change User product view',6,'change_userproductview'),(15,'Can delete User product view',6,'delete_userproductview'),(16,'Can view User product view',6,'view_userproductview'),(17,'Can add User record',5,'add_userrecord'),(18,'Can change User record',5,'change_userrecord'),(19,'Can delete User record',5,'delete_userrecord'),(20,'Can view User record',5,'view_userrecord'),(21,'Can add User search query',4,'add_usersearch'),(22,'Can change User search query',4,'change_usersearch'),(23,'Can delete User search query',4,'delete_usersearch'),(24,'Can view User search query',4,'view_usersearch'),(25,'Can add Product record',7,'add_productrecord'),(26,'Can change Product record',7,'change_productrecord'),(27,'Can delete Product record',7,'delete_productrecord'),(28,'Can view Product record',7,'view_productrecord'),(29,'Can add group',9,'add_group'),(30,'Can change group',9,'change_group'),(31,'Can delete group',9,'delete_group'),(32,'Can view group',9,'view_group'),(33,'Can add permission',8,'add_permission'),(34,'Can change permission',8,'change_permission'),(35,'Can delete permission',8,'delete_permission'),(36,'Can view permission',8,'view_permission'),(37,'Can add Basket',13,'add_basket'),(38,'Can change Basket',13,'change_basket'),(39,'Can delete Basket',13,'delete_basket'),(40,'Can view Basket',13,'view_basket'),(41,'Can add Line attribute',12,'add_lineattribute'),(42,'Can change Line attribute',12,'change_lineattribute'),(43,'Can delete Line attribute',12,'delete_lineattribute'),(44,'Can view Line attribute',12,'view_lineattribute'),(45,'Can add Basket line',14,'add_line'),(46,'Can change Basket line',14,'change_line'),(47,'Can delete Basket line',14,'delete_line'),(48,'Can view Basket line',14,'view_line'),(49,'Can add basket attribute type',11,'add_basketattributetype'),(50,'Can change basket attribute type',11,'change_basketattributetype'),(51,'Can delete basket attribute type',11,'delete_basketattributetype'),(52,'Can view basket attribute type',11,'view_basketattributetype'),(53,'Can add basket attribute',10,'add_basketattribute'),(54,'Can change basket attribute',10,'change_basketattribute'),(55,'Can delete basket attribute',10,'delete_basketattribute'),(56,'Can view basket attribute',10,'view_basketattribute'),(57,'Can add Attribute option group',31,'add_attributeoptiongroup'),(58,'Can change Attribute option group',31,'change_attributeoptiongroup'),(59,'Can delete Attribute option group',31,'delete_attributeoptiongroup'),(60,'Can view Attribute option group',31,'view_attributeoptiongroup'),(61,'Can add Product',33,'add_product'),(62,'Can change Product',33,'change_product'),(63,'Can delete Product',33,'delete_product'),(64,'Can view Product',33,'view_product'),(65,'Can add Product category',18,'add_productcategory'),(66,'Can change Product category',18,'change_productcategory'),(67,'Can delete Product category',18,'delete_productcategory'),(68,'Can view Product category',18,'view_productcategory'),(69,'Can add historical Product',30,'add_historicalproduct'),(70,'Can change historical Product',30,'change_historicalproduct'),(71,'Can delete historical Product',30,'delete_historicalproduct'),(72,'Can view historical Product',30,'view_historicalproduct'),(73,'Can add Product attribute',15,'add_productattribute'),(74,'Can change Product attribute',15,'change_productattribute'),(75,'Can delete Product attribute',15,'delete_productattribute'),(76,'Can view Product attribute',15,'view_productattribute'),(77,'Can add Product image',27,'add_productimage'),(78,'Can change Product image',27,'change_productimage'),(79,'Can delete Product image',27,'delete_productimage'),(80,'Can view Product image',27,'view_productimage'),(81,'Can add historical Product attribute',32,'add_historicalproductattribute'),(82,'Can change historical Product attribute',32,'change_historicalproductattribute'),(83,'Can delete historical Product attribute',32,'delete_historicalproductattribute'),(84,'Can view historical Product attribute',32,'view_historicalproductattribute'),(85,'Can add Product recommendation',26,'add_productrecommendation'),(86,'Can change Product recommendation',26,'change_productrecommendation'),(87,'Can delete Product recommendation',26,'delete_productrecommendation'),(88,'Can view Product recommendation',26,'view_productrecommendation'),(89,'Can add Category',29,'add_category'),(90,'Can change Category',29,'change_category'),(91,'Can delete Category',29,'delete_category'),(92,'Can view Category',29,'view_category'),(93,'Can add historical Product class',24,'add_historicalproductclass'),(94,'Can change historical Product class',24,'change_historicalproductclass'),(95,'Can delete historical Product class',24,'delete_historicalproductclass'),(96,'Can view historical Product class',24,'view_historicalproductclass'),(97,'Can add Attribute option',19,'add_attributeoption'),(98,'Can change Attribute option',19,'change_attributeoption'),(99,'Can delete Attribute option',19,'delete_attributeoption'),(100,'Can view Attribute option',19,'view_attributeoption'),(101,'Can add historical Product attribute value',22,'add_historicalproductattributevalue'),(102,'Can change historical Product attribute value',22,'change_historicalproductattributevalue'),(103,'Can delete historical Product attribute value',22,'delete_historicalproductattributevalue'),(104,'Can view historical Product attribute value',22,'view_historicalproductattributevalue'),(105,'Can add catalog',16,'add_catalog'),(106,'Can change catalog',16,'change_catalog'),(107,'Can delete catalog',16,'delete_catalog'),(108,'Can view catalog',16,'view_catalog'),(109,'Can add historical Product category',21,'add_historicalproductcategory'),(110,'Can change historical Product category',21,'change_historicalproductcategory'),(111,'Can delete historical Product category',21,'delete_historicalproductcategory'),(112,'Can view historical Product category',21,'view_historicalproductcategory'),(113,'Can add Option',20,'add_option'),(114,'Can change Option',20,'change_option'),(115,'Can delete Option',20,'delete_option'),(116,'Can view Option',20,'view_option'),(117,'Can add Product class',28,'add_productclass'),(118,'Can change Product class',28,'change_productclass'),(119,'Can delete Product class',28,'delete_productclass'),(120,'Can view Product class',28,'view_productclass'),(121,'Can add historical Category',23,'add_historicalcategory'),(122,'Can change historical Category',23,'change_historicalcategory'),(123,'Can delete historical Category',23,'delete_historicalcategory'),(124,'Can view historical Category',23,'view_historicalcategory'),(125,'Can add historical Option',17,'add_historicaloption'),(126,'Can change historical Option',17,'change_historicaloption'),(127,'Can delete historical Option',17,'delete_historicaloption'),(128,'Can view historical Option',17,'view_historicaloption'),(129,'Can add Product attribute value',25,'add_productattributevalue'),(130,'Can change Product attribute value',25,'change_productattributevalue'),(131,'Can delete Product attribute value',25,'delete_productattributevalue'),(132,'Can view Product attribute value',25,'view_productattributevalue'),(133,'Can add content type',34,'add_contenttype'),(134,'Can change content type',34,'change_contenttype'),(135,'Can delete content type',34,'delete_contenttype'),(136,'Can view content type',34,'view_contenttype'),(137,'Can add site configuration',36,'add_siteconfiguration'),(138,'Can change site configuration',36,'change_siteconfiguration'),(139,'Can delete site configuration',36,'delete_siteconfiguration'),(140,'Can view site configuration',36,'view_siteconfiguration'),(141,'Can add user',37,'add_user'),(142,'Can change user',37,'change_user'),(143,'Can delete user',37,'delete_user'),(144,'Can view user',37,'view_user'),(145,'Can add user',35,'add_client'),(146,'Can change user',35,'change_client'),(147,'Can delete user',35,'delete_client'),(148,'Can view user',35,'view_client'),(149,'Can add course',38,'add_course'),(150,'Can change course',38,'change_course'),(151,'Can delete course',38,'delete_course'),(152,'Can view course',38,'view_course'),(153,'Can add Communication event type',42,'add_communicationeventtype'),(154,'Can change Communication event type',42,'change_communicationeventtype'),(155,'Can delete Communication event type',42,'delete_communicationeventtype'),(156,'Can view Communication event type',42,'view_communicationeventtype'),(157,'Can add Email',40,'add_email'),(158,'Can change Email',40,'change_email'),(159,'Can delete Email',40,'delete_email'),(160,'Can view Email',40,'view_email'),(161,'Can add Product alert',39,'add_productalert'),(162,'Can change Product alert',39,'change_productalert'),(163,'Can delete Product alert',39,'delete_productalert'),(164,'Can view Product alert',39,'view_productalert'),(165,'Can add Notification',41,'add_notification'),(166,'Can change Notification',41,'change_notification'),(167,'Can delete Notification',41,'delete_notification'),(168,'Can view Notification',41,'view_notification'),(169,'Can add Range Product Uploaded File',43,'add_rangeproductfileupload'),(170,'Can change Range Product Uploaded File',43,'change_rangeproductfileupload'),(171,'Can delete Range Product Uploaded File',43,'delete_rangeproductfileupload'),(172,'Can view Range Product Uploaded File',43,'view_rangeproductfileupload'),(173,'Can add Benefit',44,'add_benefit'),(174,'Can change Benefit',44,'change_benefit'),(175,'Can delete Benefit',44,'delete_benefit'),(176,'Can view Benefit',44,'view_benefit'),(177,'Can add Range',49,'add_range'),(178,'Can change Range',49,'change_range'),(179,'Can delete Range',49,'delete_range'),(180,'Can view Range',49,'view_range'),(181,'Can add Conditional offer',52,'add_conditionaloffer'),(182,'Can change Conditional offer',52,'change_conditionaloffer'),(183,'Can delete Conditional offer',52,'delete_conditionaloffer'),(184,'Can view Conditional offer',52,'view_conditionaloffer'),(185,'Can add Percentage discount benefit',46,'add_percentagediscountbenefit'),(186,'Can change Percentage discount benefit',46,'change_percentagediscountbenefit'),(187,'Can delete Percentage discount benefit',46,'delete_percentagediscountbenefit'),(188,'Can view Percentage discount benefit',46,'view_percentagediscountbenefit'),(189,'Can add Multibuy discount benefit',59,'add_multibuydiscountbenefit'),(190,'Can change Multibuy discount benefit',59,'change_multibuydiscountbenefit'),(191,'Can delete Multibuy discount benefit',59,'delete_multibuydiscountbenefit'),(192,'Can view Multibuy discount benefit',59,'view_multibuydiscountbenefit'),(193,'Can add Fixed price benefit',50,'add_fixedpricebenefit'),(194,'Can change Fixed price benefit',50,'change_fixedpricebenefit'),(195,'Can delete Fixed price benefit',50,'delete_fixedpricebenefit'),(196,'Can view Fixed price benefit',50,'view_fixedpricebenefit'),(197,'Can add Condition',45,'add_condition'),(198,'Can change Condition',45,'change_condition'),(199,'Can delete Condition',45,'delete_condition'),(200,'Can view Condition',45,'view_condition'),(201,'Can add range product',57,'add_rangeproduct'),(202,'Can change range product',57,'change_rangeproduct'),(203,'Can delete range product',57,'delete_rangeproduct'),(204,'Can view range product',57,'view_rangeproduct'),(205,'Can add Coverage Condition',54,'add_coveragecondition'),(206,'Can change Coverage Condition',54,'change_coveragecondition'),(207,'Can delete Coverage Condition',54,'delete_coveragecondition'),(208,'Can view Coverage Condition',54,'view_coveragecondition'),(209,'Can add Absolute discount benefit',48,'add_absolutediscountbenefit'),(210,'Can change Absolute discount benefit',48,'change_absolutediscountbenefit'),(211,'Can delete Absolute discount benefit',48,'delete_absolutediscountbenefit'),(212,'Can view Absolute discount benefit',48,'view_absolutediscountbenefit'),(213,'Can add Value condition',53,'add_valuecondition'),(214,'Can change Value condition',53,'change_valuecondition'),(215,'Can delete Value condition',53,'delete_valuecondition'),(216,'Can view Value condition',53,'view_valuecondition'),(217,'Can add shipping benefit',56,'add_shippingbenefit'),(218,'Can change shipping benefit',56,'change_shippingbenefit'),(219,'Can delete shipping benefit',56,'delete_shippingbenefit'),(220,'Can view shipping benefit',56,'view_shippingbenefit'),(221,'Can add Count condition',58,'add_countcondition'),(222,'Can change Count condition',58,'change_countcondition'),(223,'Can delete Count condition',58,'delete_countcondition'),(224,'Can view Count condition',58,'view_countcondition'),(225,'Can add Shipping percentage discount benefit',47,'add_shippingpercentagediscountbenefit'),(226,'Can change Shipping percentage discount benefit',47,'change_shippingpercentagediscountbenefit'),(227,'Can delete Shipping percentage discount benefit',47,'delete_shippingpercentagediscountbenefit'),(228,'Can view Shipping percentage discount benefit',47,'view_shippingpercentagediscountbenefit'),(229,'Can add Shipping absolute discount benefit',55,'add_shippingabsolutediscountbenefit'),(230,'Can change Shipping absolute discount benefit',55,'change_shippingabsolutediscountbenefit'),(231,'Can delete Shipping absolute discount benefit',55,'delete_shippingabsolutediscountbenefit'),(232,'Can view Shipping absolute discount benefit',55,'view_shippingabsolutediscountbenefit'),(233,'Can add Fixed price shipping benefit',51,'add_shippingfixedpricebenefit'),(234,'Can change Fixed price shipping benefit',51,'change_shippingfixedpricebenefit'),(235,'Can delete Fixed price shipping benefit',51,'delete_shippingfixedpricebenefit'),(236,'Can view Fixed price shipping benefit',51,'view_shippingfixedpricebenefit'),(237,'Can add Shipping Event Quantity',62,'add_shippingeventquantity'),(238,'Can change Shipping Event Quantity',62,'change_shippingeventquantity'),(239,'Can delete Shipping Event Quantity',62,'delete_shippingeventquantity'),(240,'Can view Shipping Event Quantity',62,'view_shippingeventquantity'),(241,'Can add Line Attribute',73,'add_lineattribute'),(242,'Can change Line Attribute',73,'change_lineattribute'),(243,'Can delete Line Attribute',73,'delete_lineattribute'),(244,'Can view Line Attribute',73,'view_lineattribute'),(245,'Can add Payment Event Quantity',66,'add_paymenteventquantity'),(246,'Can change Payment Event Quantity',66,'change_paymenteventquantity'),(247,'Can delete Payment Event Quantity',66,'delete_paymenteventquantity'),(248,'Can view Payment Event Quantity',66,'view_paymenteventquantity'),(249,'Can add Payment Event',71,'add_paymentevent'),(250,'Can change Payment Event',71,'change_paymentevent'),(251,'Can delete Payment Event',71,'delete_paymentevent'),(252,'Can view Payment Event',71,'view_paymentevent'),(253,'Can add Shipping address',67,'add_shippingaddress'),(254,'Can change Shipping address',67,'change_shippingaddress'),(255,'Can delete Shipping address',67,'delete_shippingaddress'),(256,'Can view Shipping address',67,'view_shippingaddress'),(257,'Can add Order Note',69,'add_ordernote'),(258,'Can change Order Note',69,'change_ordernote'),(259,'Can delete Order Note',69,'delete_ordernote'),(260,'Can view Order Note',69,'view_ordernote'),(261,'Can add Communication Event',68,'add_communicationevent'),(262,'Can change Communication Event',68,'change_communicationevent'),(263,'Can delete Communication Event',68,'delete_communicationevent'),(264,'Can view Communication Event',68,'view_communicationevent'),(265,'Can add Billing address',74,'add_billingaddress'),(266,'Can change Billing address',74,'change_billingaddress'),(267,'Can delete Billing address',74,'delete_billingaddress'),(268,'Can view Billing address',74,'view_billingaddress'),(269,'Can add Shipping Event Type',61,'add_shippingeventtype'),(270,'Can change Shipping Event Type',61,'change_shippingeventtype'),(271,'Can delete Shipping Event Type',61,'delete_shippingeventtype'),(272,'Can view Shipping Event Type',61,'view_shippingeventtype'),(273,'Can add Shipping Event',65,'add_shippingevent'),(274,'Can change Shipping Event',65,'change_shippingevent'),(275,'Can delete Shipping Event',65,'delete_shippingevent'),(276,'Can view Shipping Event',65,'view_shippingevent'),(277,'Can add Payment Event Type',70,'add_paymenteventtype'),(278,'Can change Payment Event Type',70,'change_paymenteventtype'),(279,'Can delete Payment Event Type',70,'delete_paymenteventtype'),(280,'Can view Payment Event Type',70,'view_paymenteventtype'),(281,'Can add Line Price',60,'add_lineprice'),(282,'Can change Line Price',60,'change_lineprice'),(283,'Can delete Line Price',60,'delete_lineprice'),(284,'Can view Line Price',60,'view_lineprice'),(285,'Can add Order Discount',63,'add_orderdiscount'),(286,'Can change Order Discount',63,'change_orderdiscount'),(287,'Can delete Order Discount',63,'delete_orderdiscount'),(288,'Can view Order Discount',63,'view_orderdiscount'),(289,'Can add Order Line',64,'add_line'),(290,'Can change Order Line',64,'change_line'),(291,'Can delete Order Line',64,'delete_line'),(292,'Can view Order Line',64,'view_line'),(293,'Can add Order',72,'add_order'),(294,'Can change Order',72,'change_order'),(295,'Can delete Order',72,'delete_order'),(296,'Can view Order',72,'view_order'),(297,'Can add Stock record',78,'add_stockrecord'),(298,'Can change Stock record',78,'change_stockrecord'),(299,'Can delete Stock record',78,'delete_stockrecord'),(300,'Can view Stock record',78,'view_stockrecord'),(301,'Can add Partner address',76,'add_partneraddress'),(302,'Can change Partner address',76,'change_partneraddress'),(303,'Can delete Partner address',76,'delete_partneraddress'),(304,'Can view Partner address',76,'view_partneraddress'),(305,'Can add Partner',77,'add_partner'),(306,'Can change Partner',77,'change_partner'),(307,'Can delete Partner',77,'delete_partner'),(308,'Can view Partner',77,'view_partner'),(309,'Can add Stock alert',75,'add_stockalert'),(310,'Can change Stock alert',75,'change_stockalert'),(311,'Can delete Stock alert',75,'delete_stockalert'),(312,'Can view Stock alert',75,'view_stockalert'),(313,'Can add site',79,'add_site'),(314,'Can change site',79,'change_site'),(315,'Can delete site',79,'delete_site'),(316,'Can view site',79,'view_site'),(317,'Can add Voucher',81,'add_voucher'),(318,'Can change Voucher',81,'change_voucher'),(319,'Can delete Voucher',81,'delete_voucher'),(320,'Can view Voucher',81,'view_voucher'),(321,'Can add Voucher Application',80,'add_voucherapplication'),(322,'Can change Voucher Application',80,'change_voucherapplication'),(323,'Can delete Voucher Application',80,'delete_voucherapplication'),(324,'Can view Voucher Application',80,'view_voucherapplication'),(325,'Can add switch',82,'add_switch'),(326,'Can change switch',82,'change_switch'),(327,'Can delete switch',82,'delete_switch'),(328,'Can view switch',82,'view_switch'),(329,'Can add sample',84,'add_sample'),(330,'Can change sample',84,'change_sample'),(331,'Can delete sample',84,'delete_sample'),(332,'Can view sample',84,'view_sample'),(333,'Can add flag',83,'add_flag'),(334,'Can change flag',83,'change_flag'),(335,'Can delete flag',83,'delete_flag'),(336,'Can view flag',83,'view_flag'),(337,'Can add flat page',85,'add_flatpage'),(338,'Can change flat page',85,'change_flatpage'),(339,'Can delete flat page',85,'delete_flatpage'),(340,'Can view flat page',85,'view_flatpage'),(341,'Can add session',86,'add_session'),(342,'Can change session',86,'change_session'),(343,'Can delete session',86,'delete_session'),(344,'Can view session',86,'view_session'),(345,'Can add partial',91,'add_partial'),(346,'Can change partial',91,'change_partial'),(347,'Can delete partial',91,'delete_partial'),(348,'Can view partial',91,'view_partial'),(349,'Can add code',88,'add_code'),(350,'Can change code',88,'change_code'),(351,'Can delete code',88,'delete_code'),(352,'Can view code',88,'view_code'),(353,'Can add user social auth',90,'add_usersocialauth'),(354,'Can change user social auth',90,'change_usersocialauth'),(355,'Can delete user social auth',90,'delete_usersocialauth'),(356,'Can view user social auth',90,'view_usersocialauth'),(357,'Can add association',87,'add_association'),(358,'Can change association',87,'change_association'),(359,'Can delete association',87,'delete_association'),(360,'Can view association',87,'view_association'),(361,'Can add nonce',89,'add_nonce'),(362,'Can change nonce',89,'change_nonce'),(363,'Can delete nonce',89,'delete_nonce'),(364,'Can view nonce',89,'view_nonce'),(365,'Can add historical business client',94,'add_historicalbusinessclient'),(366,'Can change historical business client',94,'change_historicalbusinessclient'),(367,'Can delete historical business client',94,'delete_historicalbusinessclient'),(368,'Can view historical business client',94,'view_historicalbusinessclient'),(369,'Can add business client',93,'add_businessclient'),(370,'Can change business client',93,'change_businessclient'),(371,'Can delete business client',93,'delete_businessclient'),(372,'Can view business client',93,'view_businessclient'),(373,'Can add ecommerce feature role',92,'add_ecommercefeaturerole'),(374,'Can change ecommerce feature role',92,'change_ecommercefeaturerole'),(375,'Can delete ecommerce feature role',92,'delete_ecommercefeaturerole'),(376,'Can view ecommerce feature role',92,'view_ecommercefeaturerole'),(377,'Can add ecommerce feature role assignment',95,'add_ecommercefeatureroleassignment'),(378,'Can change ecommerce feature role assignment',95,'change_ecommercefeatureroleassignment'),(379,'Can delete ecommerce feature role assignment',95,'delete_ecommercefeatureroleassignment'),(380,'Can view ecommerce feature role assignment',95,'view_ecommercefeatureroleassignment'),(381,'Can add historical course',96,'add_historicalcourse'),(382,'Can change historical course',96,'change_historicalcourse'),(383,'Can delete historical course',96,'delete_historicalcourse'),(384,'Can view historical course',96,'view_historicalcourse'),(385,'Can add invoice',97,'add_invoice'),(386,'Can change invoice',97,'change_invoice'),(387,'Can delete invoice',97,'delete_invoice'),(388,'Can view invoice',97,'view_invoice'),(389,'Can add historical invoice',98,'add_historicalinvoice'),(390,'Can change historical invoice',98,'change_historicalinvoice'),(391,'Can delete historical invoice',98,'delete_historicalinvoice'),(392,'Can view historical invoice',98,'view_historicalinvoice'),(393,'Can add referral',99,'add_referral'),(394,'Can change referral',99,'change_referral'),(395,'Can delete referral',99,'delete_referral'),(396,'Can view referral',99,'view_referral'),(397,'Can add site theme',100,'add_sitetheme'),(398,'Can change site theme',100,'change_sitetheme'),(399,'Can delete site theme',100,'delete_sitetheme'),(400,'Can view site theme',100,'view_sitetheme'),(401,'Can add Order and Item Charge',102,'add_orderanditemcharges'),(402,'Can change Order and Item Charge',102,'change_orderanditemcharges'),(403,'Can delete Order and Item Charge',102,'delete_orderanditemcharges'),(404,'Can view Order and Item Charge',102,'view_orderanditemcharges'),(405,'Can add Weight Band',103,'add_weightband'),(406,'Can change Weight Band',103,'change_weightband'),(407,'Can delete Weight Band',103,'delete_weightband'),(408,'Can view Weight Band',103,'view_weightband'),(409,'Can add Weight-based Shipping Method',101,'add_weightbased'),(410,'Can change Weight-based Shipping Method',101,'change_weightbased'),(411,'Can delete Weight-based Shipping Method',101,'delete_weightbased'),(412,'Can view Weight-based Shipping Method',101,'view_weightbased'),(413,'Can add Product review',105,'add_productreview'),(414,'Can change Product review',105,'change_productreview'),(415,'Can delete Product review',105,'delete_productreview'),(416,'Can view Product review',105,'view_productreview'),(417,'Can add Vote',104,'add_vote'),(418,'Can change Vote',104,'change_vote'),(419,'Can delete Vote',104,'delete_vote'),(420,'Can view Vote',104,'view_vote'),(421,'Can add Wish List',106,'add_wishlist'),(422,'Can change Wish List',106,'change_wishlist'),(423,'Can delete Wish List',106,'delete_wishlist'),(424,'Can view Wish List',106,'view_wishlist'),(425,'Can add Wish list line',107,'add_line'),(426,'Can change Wish list line',107,'change_line'),(427,'Can delete Wish list line',107,'delete_line'),(428,'Can view Wish list line',107,'view_line'),(429,'Can add historical refund line',110,'add_historicalrefundline'),(430,'Can change historical refund line',110,'change_historicalrefundline'),(431,'Can delete historical refund line',110,'delete_historicalrefundline'),(432,'Can view historical refund line',110,'view_historicalrefundline'),(433,'Can add refund line',109,'add_refundline'),(434,'Can change refund line',109,'change_refundline'),(435,'Can delete refund line',109,'delete_refundline'),(436,'Can view refund line',109,'view_refundline'),(437,'Can add historical refund',111,'add_historicalrefund'),(438,'Can change historical refund',111,'change_historicalrefund'),(439,'Can delete historical refund',111,'delete_historicalrefund'),(440,'Can view historical refund',111,'view_historicalrefund'),(441,'Can add refund',108,'add_refund'),(442,'Can change refund',108,'change_refund'),(443,'Can delete refund',108,'delete_refund'),(444,'Can view refund',108,'view_refund'),(445,'Can add historical offer assignment',119,'add_historicalofferassignment'),(446,'Can change historical offer assignment',119,'change_historicalofferassignment'),(447,'Can delete historical offer assignment',119,'delete_historicalofferassignment'),(448,'Can view historical offer assignment',119,'view_historicalofferassignment'),(449,'Can add historical range product',117,'add_historicalrangeproduct'),(450,'Can change historical range product',117,'change_historicalrangeproduct'),(451,'Can delete historical range product',117,'delete_historicalrangeproduct'),(452,'Can view historical range product',117,'view_historicalrangeproduct'),(453,'Can add historical Condition',116,'add_historicalcondition'),(454,'Can change historical Condition',116,'change_historicalcondition'),(455,'Can delete historical Condition',116,'delete_historicalcondition'),(456,'Can view historical Condition',116,'view_historicalcondition'),(457,'Can add historical Benefit',115,'add_historicalbenefit'),(458,'Can change historical Benefit',115,'change_historicalbenefit'),(459,'Can delete historical Benefit',115,'delete_historicalbenefit'),(460,'Can view historical Benefit',115,'view_historicalbenefit'),(461,'Can add offer assignment email templates',114,'add_offerassignmentemailtemplates'),(462,'Can change offer assignment email templates',114,'change_offerassignmentemailtemplates'),(463,'Can delete offer assignment email templates',114,'delete_offerassignmentemailtemplates'),(464,'Can view offer assignment email templates',114,'view_offerassignmentemailtemplates'),(465,'Can add historical Conditional offer',113,'add_historicalconditionaloffer'),(466,'Can change historical Conditional offer',113,'change_historicalconditionaloffer'),(467,'Can delete historical Conditional offer',113,'delete_historicalconditionaloffer'),(468,'Can view historical Conditional offer',113,'view_historicalconditionaloffer'),(469,'Can add historical Range',112,'add_historicalrange'),(470,'Can change historical Range',112,'change_historicalrange'),(471,'Can delete historical Range',112,'delete_historicalrange'),(472,'Can view historical Range',112,'view_historicalrange'),(473,'Can add offer assignment',118,'add_offerassignment'),(474,'Can change offer assignment',118,'change_offerassignment'),(475,'Can delete offer assignment',118,'delete_offerassignment'),(476,'Can view offer assignment',118,'view_offerassignment'),(477,'Can add offer assignment email attempt',120,'add_offerassignmentemailattempt'),(478,'Can change offer assignment email attempt',120,'change_offerassignmentemailattempt'),(479,'Can delete offer assignment email attempt',120,'delete_offerassignmentemailattempt'),(480,'Can view offer assignment email attempt',120,'view_offerassignmentemailattempt'),(481,'Can add historical Order',125,'add_historicalorder'),(482,'Can change historical Order',125,'change_historicalorder'),(483,'Can delete historical Order',125,'delete_historicalorder'),(484,'Can view historical Order',125,'view_historicalorder'),(485,'Can add historical Order Line',122,'add_historicalline'),(486,'Can change historical Order Line',122,'change_historicalline'),(487,'Can delete historical Order Line',122,'delete_historicalline'),(488,'Can view historical Order Line',122,'view_historicalline'),(489,'Can add manual enrollment order discount benefit',126,'add_manualenrollmentorderdiscountbenefit'),(490,'Can change manual enrollment order discount benefit',126,'change_manualenrollmentorderdiscountbenefit'),(491,'Can delete manual enrollment order discount benefit',126,'delete_manualenrollmentorderdiscountbenefit'),(492,'Can view manual enrollment order discount benefit',126,'view_manualenrollmentorderdiscountbenefit'),(493,'Can add Order Status Change',124,'add_orderstatuschange'),(494,'Can change Order Status Change',124,'change_orderstatuschange'),(495,'Can delete Order Status Change',124,'delete_orderstatuschange'),(496,'Can view Order Status Change',124,'view_orderstatuschange'),(497,'Can add historical Order Discount',121,'add_historicalorderdiscount'),(498,'Can change historical Order Discount',121,'change_historicalorderdiscount'),(499,'Can delete historical Order Discount',121,'delete_historicalorderdiscount'),(500,'Can view historical Order Discount',121,'view_historicalorderdiscount'),(501,'Can add manual enrollment order discount condition',123,'add_manualenrollmentorderdiscountcondition'),(502,'Can change manual enrollment order discount condition',123,'change_manualenrollmentorderdiscountcondition'),(503,'Can delete manual enrollment order discount condition',123,'delete_manualenrollmentorderdiscountcondition'),(504,'Can view manual enrollment order discount condition',123,'view_manualenrollmentorderdiscountcondition'),(505,'Can add historical Stock record',128,'add_historicalstockrecord'),(506,'Can change historical Stock record',128,'change_historicalstockrecord'),(507,'Can delete historical Stock record',128,'delete_historicalstockrecord'),(508,'Can view historical Stock record',128,'view_historicalstockrecord'),(509,'Can add historical Partner',127,'add_historicalpartner'),(510,'Can change historical Partner',127,'change_historicalpartner'),(511,'Can delete historical Partner',127,'delete_historicalpartner'),(512,'Can view historical Partner',127,'view_historicalpartner'),(513,'Can add Payment Processor Response',135,'add_paymentprocessorresponse'),(514,'Can change Payment Processor Response',135,'change_paymentprocessorresponse'),(515,'Can delete Payment Processor Response',135,'delete_paymentprocessorresponse'),(516,'Can view Payment Processor Response',135,'view_paymentprocessorresponse'),(517,'Can add paypal web profile',133,'add_paypalwebprofile'),(518,'Can change paypal web profile',133,'change_paypalwebprofile'),(519,'Can delete paypal web profile',133,'delete_paypalwebprofile'),(520,'Can view paypal web profile',133,'view_paypalwebprofile'),(521,'Can add SDN Check Failure',132,'add_sdncheckfailure'),(522,'Can change SDN Check Failure',132,'change_sdncheckfailure'),(523,'Can delete SDN Check Failure',132,'delete_sdncheckfailure'),(524,'Can view SDN Check Failure',132,'view_sdncheckfailure'),(525,'Can add enterprise contract metadata',136,'add_enterprisecontractmetadata'),(526,'Can change enterprise contract metadata',136,'change_enterprisecontractmetadata'),(527,'Can delete enterprise contract metadata',136,'delete_enterprisecontractmetadata'),(528,'Can view enterprise contract metadata',136,'view_enterprisecontractmetadata'),(529,'Can add Source',137,'add_source'),(530,'Can change Source',137,'change_source'),(531,'Can delete Source',137,'delete_source'),(532,'Can view Source',137,'view_source'),(533,'Can add Bankcard',131,'add_bankcard'),(534,'Can change Bankcard',131,'change_bankcard'),(535,'Can delete Bankcard',131,'delete_bankcard'),(536,'Can view Bankcard',131,'view_bankcard'),(537,'Can add Transaction',130,'add_transaction'),(538,'Can change Transaction',130,'change_transaction'),(539,'Can delete Transaction',130,'delete_transaction'),(540,'Can view Transaction',130,'view_transaction'),(541,'Can add Source Type',129,'add_sourcetype'),(542,'Can change Source Type',129,'change_sourcetype'),(543,'Can delete Source Type',129,'delete_sourcetype'),(544,'Can view Source Type',129,'view_sourcetype'),(545,'Can add Paypal Processor Configuration',134,'add_paypalprocessorconfiguration'),(546,'Can change Paypal Processor Configuration',134,'change_paypalprocessorconfiguration'),(547,'Can delete Paypal Processor Configuration',134,'delete_paypalprocessorconfiguration'),(548,'Can view Paypal Processor Configuration',134,'view_paypalprocessorconfiguration'),(549,'Can add historical Voucher Application',141,'add_historicalvoucherapplication'),(550,'Can change historical Voucher Application',141,'change_historicalvoucherapplication'),(551,'Can delete historical Voucher Application',141,'delete_historicalvoucherapplication'),(552,'Can view historical Voucher Application',141,'view_historicalvoucherapplication'),(553,'Can add coupon vouchers',140,'add_couponvouchers'),(554,'Can change coupon vouchers',140,'change_couponvouchers'),(555,'Can delete coupon vouchers',140,'delete_couponvouchers'),(556,'Can view coupon vouchers',140,'view_couponvouchers'),(557,'Can add order line vouchers',139,'add_orderlinevouchers'),(558,'Can change order line vouchers',139,'change_orderlinevouchers'),(559,'Can delete order line vouchers',139,'delete_orderlinevouchers'),(560,'Can view order line vouchers',139,'view_orderlinevouchers'),(561,'Can add VoucherSet',138,'add_voucherset'),(562,'Can change VoucherSet',138,'change_voucherset'),(563,'Can delete VoucherSet',138,'delete_voucherset'),(564,'Can view VoucherSet',138,'view_voucherset'),(565,'Can add kv store',142,'add_kvstore'),(566,'Can change kv store',142,'change_kvstore'),(567,'Can delete kv store',142,'delete_kvstore'),(568,'Can view kv store',142,'view_kvstore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_merged` datetime(6) DEFAULT NULL,
  `date_submitted` datetime(6) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_basket_owner_id_3a018de5_fk_ecommerce_user_id` (`owner_id`),
  KEY `basket_basket_site_id_c45bd035_fk_django_site_id` (`site_id`),
  CONSTRAINT `basket_basket_owner_id_3a018de5_fk_ecommerce_user_id` FOREIGN KEY (`owner_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `basket_basket_site_id_c45bd035_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket`
--

LOCK TABLES `basket_basket` WRITE;
/*!40000 ALTER TABLE `basket_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket_vouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_basket_vouchers_basket_id_voucher_id_0731eee2_uniq` (`basket_id`,`voucher_id`),
  KEY `basket_basket_vouchers_voucher_id_c2b66981_fk_voucher_voucher_id` (`voucher_id`),
  CONSTRAINT `basket_basket_vouchers_basket_id_f857c2f8_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `basket_basket_vouchers_voucher_id_c2b66981_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket_vouchers`
--

LOCK TABLES `basket_basket_vouchers` WRITE;
/*!40000 ALTER TABLE `basket_basket_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basket_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basketattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basketattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_text` longtext NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `basket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_basketattribute_basket_id_attribute_type_id_a6c168f8_uniq` (`basket_id`,`attribute_type_id`),
  KEY `basket_basketattribu_attribute_type_id_822adc5d_fk_basket_ba` (`attribute_type_id`),
  CONSTRAINT `basket_basketattribu_attribute_type_id_822adc5d_fk_basket_ba` FOREIGN KEY (`attribute_type_id`) REFERENCES `basket_basketattributetype` (`id`),
  CONSTRAINT `basket_basketattribute_basket_id_55c452f8_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basketattribute`
--

LOCK TABLES `basket_basketattribute` WRITE;
/*!40000 ALTER TABLE `basket_basketattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basketattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basketattributetype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basketattributetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basketattributetype`
--

LOCK TABLES `basket_basketattributetype` WRITE;
/*!40000 ALTER TABLE `basket_basketattributetype` DISABLE KEYS */;
INSERT INTO `basket_basketattributetype` VALUES (3,'bundle_identifier'),(1,'email_opt_in'),(2,'purchased_for_organization'),(4,'sailthru_bid');
/*!40000 ALTER TABLE `basket_basketattributetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_line`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_reference` varchar(128) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_incl_tax` decimal(12,2) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `basket_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_line_basket_id_line_reference_8977e974_uniq` (`basket_id`,`line_reference`),
  KEY `basket_line_line_reference_08e91113` (`line_reference`),
  KEY `basket_line_product_id_303d743e_fk_catalogue_product_id` (`product_id`),
  KEY `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` (`stockrecord_id`),
  KEY `basket_line_date_created_eb0dfb1b` (`date_created`),
  CONSTRAINT `basket_line_basket_id_b615c905_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `basket_line_product_id_303d743e_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_line`
--

LOCK TABLES `basket_line` WRITE;
/*!40000 ALTER TABLE `basket_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_lineattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id` (`line_id`),
  KEY `basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id` FOREIGN KEY (`line_id`) REFERENCES `basket_line` (`id`),
  CONSTRAINT `basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_lineattribute`
--

LOCK TABLES `basket_lineattribute` WRITE;
/*!40000 ALTER TABLE `basket_lineattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_attributeoption_group_id_option_7a8f6c11_uniq` (`group_id`,`option`),
  CONSTRAINT `catalogue_attributeo_group_id_3d4a5e24_fk_catalogue` FOREIGN KEY (`group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoption`
--

LOCK TABLES `catalogue_attributeoption` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_attributeoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoptiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoptiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoptiongroup`
--

LOCK TABLES `catalogue_attributeoptiongroup` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_catalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_catalog_partner_id_eeba0b62_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `catalogue_catalog_partner_id_eeba0b62_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_catalog`
--

LOCK TABLES `catalogue_catalog` WRITE;
/*!40000 ALTER TABLE `catalogue_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_catalog_stock_records`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_catalog_stock_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_catalog_stock__catalog_id_stockrecord_i_f363d53b_uniq` (`catalog_id`,`stockrecord_id`),
  KEY `catalogue_catalog_st_stockrecord_id_e480f401_fk_partner_s` (`stockrecord_id`),
  CONSTRAINT `catalogue_catalog_st_catalog_id_8fa6c918_fk_catalogue` FOREIGN KEY (`catalog_id`) REFERENCES `catalogue_catalog` (`id`),
  CONSTRAINT `catalogue_catalog_st_stockrecord_id_e480f401_fk_partner_s` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_catalog_stock_records`
--

LOCK TABLES `catalogue_catalog_stock_records` WRITE;
/*!40000 ALTER TABLE `catalogue_catalog_stock_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_catalog_stock_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `catalogue_category_name_1f342ac2` (`name`),
  KEY `catalogue_category_slug_9635febd` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_category`
--

LOCK TABLES `catalogue_category` WRITE;
/*!40000 ALTER TABLE `catalogue_category` DISABLE KEYS */;
INSERT INTO `catalogue_category` VALUES (1,'0001',1,1,'Seats','All course seats','','seats'),(2,'0002',1,23,'Coupons','All Coupons','','coupons'),(3,'00020001',2,0,'Affiliate Promotion','','','affiliate-promotion'),(4,'00020002',2,0,'Bulk Enrollment','','','bulk-enrollment'),(5,'00020003',2,0,'ConnectEd','','','connected'),(6,'00020004',2,0,'Course Promotion','','','course-promotion'),(7,'00020005',2,0,'Customer Service','','','customer-service'),(8,'00020006',2,0,'Financial Assistance','','','financial-assistance'),(9,'00020007',2,0,'Geography Promotion','','','geography-promotion'),(10,'00020008',2,0,'Marketing Partner Promotion','','','marketing-partner-promotion'),(11,'00020009',2,0,'Marketing-Other','','','marketing-other'),(12,'0002000A',2,0,'Paid Cohort','','','paid-cohort'),(13,'0002000B',2,0,'Other','','','other'),(14,'0002000C',2,0,'Retention Promotion','','','retention-promotion'),(15,'0002000D',2,0,'Services-Other','','','services-other'),(16,'0002000E',2,0,'Support-Other','','','support-other'),(17,'0002000F',2,0,'Upsell Promotion','','','upsell-promotion'),(18,'0003',1,0,'Course Entitlements','All course entitlements','','course_entitlements'),(19,'0004',1,0,'Donations','All donations','','donations'),(20,'0005',1,0,'Journals','All journals','','journals'),(21,'0002000G',2,0,'Bulk Enrollment - Prepay','','','bulk-enrollment-prepay'),(22,'0002000H',2,0,'Bulk Enrollment - Upon Redemption','','','bulk-enrollment-upon-redemption'),(23,'0002000I',2,0,'Bulk Enrollment - Integration','','','bulk-enrollment-integration'),(24,'0002000J',2,0,'On-Campus Learners','','','on-campus-learners'),(25,'0002000K',2,0,'Partner No Rev - Prepay','','','partner-no-rev-prepay'),(26,'0002000L',2,0,'Partner No Rev - Upon Redemption','','','partner-no-rev-upon-redemption'),(27,'0002000M',2,0,'Security Disclosure Reward','','','security-disclosure-reward'),(28,'0002000N',2,0,'edX Employee Request','','','edx-employee-request');
/*!40000 ALTER TABLE `catalogue_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalcategory` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_584e44e9_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalcategory_id_c46b902a` (`id`),
  KEY `catalogue_historicalcategory_path_aacdec55` (`path`),
  KEY `catalogue_historicalcategory_name_dfd7cbbe` (`name`),
  CONSTRAINT `catalogue_historical_history_user_id_584e44e9_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalcategory`
--

LOCK TABLES `catalogue_historicalcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicalcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicaloption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicaloption` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_38090a96_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicaloption_id_d1fe6cd6` (`id`),
  CONSTRAINT `catalogue_historical_history_user_id_38090a96_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicaloption`
--

LOCK TABLES `catalogue_historicaloption` WRITE;
/*!40000 ALTER TABLE `catalogue_historicaloption` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicaloption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproduct` (
  `id` int(11) NOT NULL,
  `structure` varchar(10) NOT NULL,
  `upc` varchar(64) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `rating` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `is_discountable` tinyint(1) NOT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_4ea2c15a_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproduct_id_06ee7e8f` (`id`),
  KEY `catalogue_historicalproduct_upc_db26d500` (`upc`),
  KEY `catalogue_historicalproduct_slug_11827938` (`slug`),
  KEY `catalogue_historicalproduct_date_updated_3b1e9108` (`date_updated`),
  KEY `catalogue_historicalproduct_course_id_f51a879f` (`course_id`),
  KEY `catalogue_historicalproduct_parent_id_9895554d` (`parent_id`),
  KEY `catalogue_historicalproduct_product_class_id_1210a16e` (`product_class_id`),
  KEY `catalogue_historicalproduct_date_created_236cc17e` (`date_created`),
  CONSTRAINT `catalogue_historical_history_user_id_4ea2c15a_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproduct`
--

LOCK TABLES `catalogue_historicalproduct` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproduct` DISABLE KEYS */;
INSERT INTO `catalogue_historicalproduct` VALUES (1,'parent',NULL,'','','',NULL,'2020-04-07 13:55:47.179382','2020-04-07 13:55:47.179425',1,NULL,1,'2020-04-07 13:55:47.180000',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,NULL,1,1),(1,'parent',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.179382','2020-04-07 13:55:47.188267',1,NULL,2,'2020-04-07 13:55:47.189245',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,NULL,1,1),(2,'child',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.328040','2020-04-07 13:55:47.328124',1,NULL,3,'2020-04-07 13:55:47.329127',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,1,NULL,1),(3,'child',NULL,'Seat in edX Demonstration Course with verified certificate (and ID verification)','seat-in-edx-demonstration-course-with-verified-certificate-and-id-verification','',NULL,'2020-04-07 13:55:47.484738','2020-04-07 13:55:47.484798',1,'2021-04-07 13:55:47.130174',4,'2020-04-07 13:55:47.485341',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,1,NULL,1),(4,'standalone',NULL,'Enrollment code for verified seat in edX Demonstration Course','enrollment-code-for-verified-seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.577382','2020-04-07 13:55:47.577504',1,'2021-04-07 13:55:47.130174',5,'2020-04-07 13:55:47.579115',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,NULL,3,1),(1,'parent',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.179382','2020-04-07 14:54:29.270780',1,NULL,6,'2020-04-07 14:54:29.303587',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,NULL,1,1),(2,'child',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.328040','2020-04-07 14:54:29.424194',1,NULL,7,'2020-04-07 14:54:29.425101',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,1,NULL,1),(3,'child',NULL,'Seat in edX Demonstration Course with verified certificate (and ID verification)','seat-in-edx-demonstration-course-with-verified-certificate-and-id-verification','',NULL,'2020-04-07 13:55:47.484738','2020-04-07 14:54:29.693722',1,'2021-04-07 14:54:29.160654',8,'2020-04-07 14:54:29.696327',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,1,NULL,1),(4,'standalone',NULL,'Enrollment code for verified seat in edX Demonstration Course','enrollment-code-for-verified-seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.577382','2020-04-07 14:54:29.728450',1,'2021-04-07 13:55:47.130174',9,'2020-04-07 14:54:29.729415',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,NULL,3,1);
/*!40000 ALTER TABLE `catalogue_historicalproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductattribute` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(20) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `option_group_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_6aab3050_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductattribute_id_4708da5b` (`id`),
  KEY `catalogue_historicalproductattribute_code_972c7779` (`code`),
  KEY `catalogue_historicalproductattribute_option_group_id_be14add3` (`option_group_id`),
  KEY `catalogue_historicalproductattribute_product_class_id_af241c79` (`product_class_id`),
  CONSTRAINT `catalogue_historical_history_user_id_6aab3050_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductattribute`
--

LOCK TABLES `catalogue_historicalproductattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicalproductattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductattributevalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductattributevalue` (
  `id` int(11) NOT NULL,
  `value_text` longtext,
  `value_integer` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_float` double DEFAULT NULL,
  `value_richtext` longtext,
  `value_date` date DEFAULT NULL,
  `value_datetime` datetime(6) DEFAULT NULL,
  `value_file` longtext,
  `value_image` longtext,
  `entity_object_id` int(10) unsigned DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `entity_content_type_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `value_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_34610f3f_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductattributevalue_id_a19c2a60` (`id`),
  KEY `catalogue_historicalproductattributevalue_attribute_id_c5781bb7` (`attribute_id`),
  KEY `catalogue_historicalproduct_entity_content_type_id_ad5d20d5` (`entity_content_type_id`),
  KEY `catalogue_historicalproductattributevalue_product_id_2903d7cb` (`product_id`),
  KEY `catalogue_historicalproduct_value_option_id_99818585` (`value_option_id`),
  KEY `catalogue_historicalproductattributevalue_value_boolean_79128283` (`value_boolean`),
  KEY `catalogue_historicalproductattributevalue_value_date_aad9b6b2` (`value_date`),
  KEY `catalogue_historicalproduct_value_datetime_e61e4058` (`value_datetime`),
  KEY `catalogue_historicalproductattributevalue_value_float_79557818` (`value_float`),
  KEY `catalogue_historicalproductattributevalue_value_integer_5e216649` (`value_integer`),
  CONSTRAINT `catalogue_historical_history_user_id_34610f3f_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductattributevalue`
--

LOCK TABLES `catalogue_historicalproductattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductattributevalue` DISABLE KEYS */;
INSERT INTO `catalogue_historicalproductattributevalue` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,'2020-04-07 13:55:47.254652',NULL,'+',1,NULL,NULL,1,NULL),(1,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,2,'2020-04-07 13:55:47.261779',NULL,'~',1,NULL,NULL,1,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,3,'2020-04-07 13:55:47.341451',NULL,'+',1,NULL,NULL,2,NULL),(2,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,4,'2020-04-07 13:55:47.412958',NULL,'~',1,NULL,NULL,2,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,5,'2020-04-07 13:55:47.422391',NULL,'+',2,NULL,NULL,2,NULL),(3,NULL,NULL,0,NULL,NULL,NULL,NULL,'','',NULL,6,'2020-04-07 13:55:47.427548',NULL,'~',2,NULL,NULL,2,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,7,'2020-04-07 13:55:47.590338',NULL,'+',8,NULL,NULL,4,NULL),(4,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,8,'2020-04-07 13:55:47.593543',NULL,'~',8,NULL,NULL,4,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,9,'2020-04-07 13:55:47.687533',NULL,'+',10,NULL,NULL,4,NULL),(5,NULL,NULL,1,NULL,NULL,NULL,NULL,'','',NULL,10,'2020-04-07 13:55:47.690568',NULL,'~',10,NULL,NULL,4,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,11,'2020-04-07 13:55:47.695642',NULL,'+',9,NULL,NULL,4,NULL),(6,'verified',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,12,'2020-04-07 13:55:47.698504',NULL,'~',9,NULL,NULL,4,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,13,'2020-04-07 13:55:47.715689',NULL,'+',3,NULL,NULL,3,NULL),(7,'verified',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,14,'2020-04-07 13:55:47.718531',NULL,'~',3,NULL,NULL,3,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,15,'2020-04-07 13:55:47.724260',NULL,'+',1,NULL,NULL,3,NULL),(8,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,16,'2020-04-07 13:55:47.727452',NULL,'~',1,NULL,NULL,3,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,17,'2020-04-07 13:55:47.733865',NULL,'+',2,NULL,NULL,3,NULL),(9,NULL,NULL,1,NULL,NULL,NULL,NULL,'','',NULL,18,'2020-04-07 13:55:47.737337',NULL,'~',2,NULL,NULL,3,NULL);
/*!40000 ALTER TABLE `catalogue_historicalproductattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductcategory` (
  `id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_b2a38081_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductcategory_id_61c44723` (`id`),
  KEY `catalogue_historicalproductcategory_category_id_806ddb2d` (`category_id`),
  KEY `catalogue_historicalproductcategory_product_id_98bbd24d` (`product_id`),
  CONSTRAINT `catalogue_historical_history_user_id_b2a38081_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductcategory`
--

LOCK TABLES `catalogue_historicalproductcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductcategory` DISABLE KEYS */;
INSERT INTO `catalogue_historicalproductcategory` VALUES (1,1,'2020-04-07 13:55:47.186955',NULL,'+',1,NULL,1);
/*!40000 ALTER TABLE `catalogue_historicalproductcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductclass`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductclass` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `requires_shipping` tinyint(1) NOT NULL,
  `track_stock` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_6e1db4c7_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductclass_id_6f7b6d39` (`id`),
  CONSTRAINT `catalogue_historical_history_user_id_6e1db4c7_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductclass`
--

LOCK TABLES `catalogue_historicalproductclass` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicalproductclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_option`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_option`
--

LOCK TABLES `catalogue_option` WRITE;
/*!40000 ALTER TABLE `catalogue_option` DISABLE KEYS */;
INSERT INTO `catalogue_option` VALUES (1,'Course Entitlement','course_entitlement','Optional');
/*!40000 ALTER TABLE `catalogue_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structure` varchar(10) NOT NULL,
  `upc` varchar(64) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `rating` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `is_discountable` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upc` (`upc`),
  KEY `catalogue_product_slug_c8e2e2b9` (`slug`),
  KEY `catalogue_product_date_updated_d3a1785d` (`date_updated`),
  KEY `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` (`parent_id`),
  KEY `catalogue_product_course_id_1918bc6b_fk_courses_course_id` (`course_id`),
  KEY `catalogue_product_product_class_id_0c6c5b54_fk_catalogue` (`product_class_id`),
  KEY `catalogue_product_date_created_d66f485a` (`date_created`),
  CONSTRAINT `catalogue_product_course_id_1918bc6b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` FOREIGN KEY (`parent_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_product_product_class_id_0c6c5b54_fk_catalogue` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product`
--

LOCK TABLES `catalogue_product` WRITE;
/*!40000 ALTER TABLE `catalogue_product` DISABLE KEYS */;
INSERT INTO `catalogue_product` VALUES (1,'parent',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.179382','2020-04-07 14:54:29.270780',1,NULL,1,'course-v1:edX+DemoX+Demo_Course',NULL,1),(2,'child',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.328040','2020-04-07 14:54:29.424194',1,1,NULL,'course-v1:edX+DemoX+Demo_Course',NULL,1),(3,'child',NULL,'Seat in edX Demonstration Course with verified certificate (and ID verification)','seat-in-edx-demonstration-course-with-verified-certificate-and-id-verification','',NULL,'2020-04-07 13:55:47.484738','2020-04-07 14:54:29.693722',1,1,NULL,'course-v1:edX+DemoX+Demo_Course','2021-04-07 14:54:29.160654',1),(4,'standalone',NULL,'Enrollment code for verified seat in edX Demonstration Course','enrollment-code-for-verified-seat-in-edx-demonstration-course','',NULL,'2020-04-07 13:55:47.577382','2020-04-07 14:54:29.728450',1,NULL,3,'course-v1:edX+DemoX+Demo_Course','2021-04-07 13:55:47.130174',1);
/*!40000 ALTER TABLE `catalogue_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product_product_options`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product_product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_product_produc_product_id_option_id_9b3abb31_uniq` (`product_id`,`option_id`),
  KEY `catalogue_product_pr_option_id_ff470e13_fk_catalogue` (`option_id`),
  CONSTRAINT `catalogue_product_pr_option_id_ff470e13_fk_catalogue` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `catalogue_product_pr_product_id_ad2b46bd_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product_product_options`
--

LOCK TABLES `catalogue_product_product_options` WRITE;
/*!40000 ALTER TABLE `catalogue_product_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_product_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(20) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `option_group_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productattribute_code_9ffea293` (`code`),
  KEY `catalogue_productatt_product_class_id_7af808ec_fk_catalogue` (`product_class_id`),
  KEY `catalogue_productatt_option_group_id_6b422dc2_fk_catalogue` (`option_group_id`),
  CONSTRAINT `catalogue_productatt_option_group_id_6b422dc2_fk_catalogue` FOREIGN KEY (`option_group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`),
  CONSTRAINT `catalogue_productatt_product_class_id_7af808ec_fk_catalogue` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattribute`
--

LOCK TABLES `catalogue_productattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_productattribute` DISABLE KEYS */;
INSERT INTO `catalogue_productattribute` VALUES (1,'course_key','course_key','text',1,NULL,1),(2,'id_verification_required','id_verification_required','boolean',0,NULL,1),(3,'certificate_type','certificate_type','text',0,NULL,1),(4,'credit_provider','credit_provider','text',0,NULL,1),(5,'credit_hours','credit_hours','integer',0,NULL,1),(6,'Coupon vouchers','coupon_vouchers','entity',1,NULL,2),(7,'Note','note','text',0,NULL,2),(8,'Course Key','course_key','text',1,NULL,3),(9,'Seat Type','seat_type','text',1,NULL,3),(10,'id_verification_required','id_verification_required','boolean',0,NULL,3),(11,'UUID','UUID','text',1,NULL,4),(12,'certificate_type','certificate_type','text',0,NULL,4),(13,'id_verification_required','id_verification_required','boolean',0,NULL,4),(15,'Notification Email','notify_email','text',0,NULL,2),(16,'Enterprise Customer UUID','enterprise_customer_uuid','text',0,NULL,2),(17,'Enterprise Contract Metadata','enterprise_contract_metadata','entity',0,NULL,2),(18,'Inactive','inactive','boolean',0,NULL,2),(19,'Sales Force ID','sales_force_id','text',0,NULL,2);
/*!40000 ALTER TABLE `catalogue_productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_text` longtext,
  `value_integer` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_float` double DEFAULT NULL,
  `value_richtext` longtext,
  `value_date` date DEFAULT NULL,
  `value_file` varchar(255) DEFAULT NULL,
  `value_image` varchar(255) DEFAULT NULL,
  `entity_object_id` int(10) unsigned DEFAULT NULL,
  `attribute_id` int(11) NOT NULL,
  `entity_content_type_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `value_option_id` int(11) DEFAULT NULL,
  `value_datetime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattribu_attribute_id_product_id_1e8e7112_uniq` (`attribute_id`,`product_id`),
  KEY `catalogue_productatt_entity_content_type__f7186ab5_fk_django_co` (`entity_content_type_id`),
  KEY `catalogue_productatt_product_id_a03cd90e_fk_catalogue` (`product_id`),
  KEY `catalogue_productatt_value_option_id_21026066_fk_catalogue` (`value_option_id`),
  KEY `catalogue_productattributevalue_value_boolean_c5b0d66a` (`value_boolean`),
  KEY `catalogue_productattributevalue_value_date_d18775c1` (`value_date`),
  KEY `catalogue_productattributevalue_value_datetime_b474ac38` (`value_datetime`),
  KEY `catalogue_productattributevalue_value_float_5ef8d3db` (`value_float`),
  KEY `catalogue_productattributevalue_value_integer_55fbb7d6` (`value_integer`),
  CONSTRAINT `catalogue_productatt_attribute_id_0287c1e7_fk_catalogue` FOREIGN KEY (`attribute_id`) REFERENCES `catalogue_productattribute` (`id`),
  CONSTRAINT `catalogue_productatt_entity_content_type__f7186ab5_fk_django_co` FOREIGN KEY (`entity_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `catalogue_productatt_product_id_a03cd90e_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productatt_value_option_id_21026066_fk_catalogue` FOREIGN KEY (`value_option_id`) REFERENCES `catalogue_attributeoption` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue`
--

LOCK TABLES `catalogue_productattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue` DISABLE KEYS */;
INSERT INTO `catalogue_productattributevalue` VALUES (1,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,1,NULL,NULL),(2,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,2,NULL,NULL),(3,NULL,NULL,0,NULL,NULL,NULL,'','',NULL,2,NULL,2,NULL,NULL),(4,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,8,NULL,4,NULL,NULL),(5,NULL,NULL,1,NULL,NULL,NULL,'','',NULL,10,NULL,4,NULL,NULL),(6,'verified',NULL,NULL,NULL,NULL,NULL,'','',NULL,9,NULL,4,NULL,NULL),(7,'verified',NULL,NULL,NULL,NULL,NULL,'','',NULL,3,NULL,3,NULL,NULL),(8,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,3,NULL,NULL),(9,NULL,NULL,1,NULL,NULL,NULL,'','',NULL,2,NULL,3,NULL,NULL);
/*!40000 ALTER TABLE `catalogue_productattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue_value_multi_option`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue_value_multi_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productattributevalue_id` int(11) NOT NULL,
  `attributeoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattribu_productattributevalue_id_a1760824_uniq` (`productattributevalue_id`,`attributeoption_id`),
  KEY `catalogue_productatt_attributeoption_id_962b600b_fk_catalogue` (`attributeoption_id`),
  CONSTRAINT `catalogue_productatt_attributeoption_id_962b600b_fk_catalogue` FOREIGN KEY (`attributeoption_id`) REFERENCES `catalogue_attributeoption` (`id`),
  CONSTRAINT `catalogue_productatt_productattributevalu_9c7c031e_fk_catalogue` FOREIGN KEY (`productattributevalue_id`) REFERENCES `catalogue_productattributevalue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue_value_multi_option`
--

LOCK TABLES `catalogue_productattributevalue_value_multi_option` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue_value_multi_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productattributevalue_value_multi_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productcategory_product_id_category_id_8f0dbfe2_uniq` (`product_id`,`category_id`),
  KEY `catalogue_productcat_category_id_176db535_fk_catalogue` (`category_id`),
  CONSTRAINT `catalogue_productcat_category_id_176db535_fk_catalogue` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `catalogue_productcat_product_id_846a4061_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productcategory`
--

LOCK TABLES `catalogue_productcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_productcategory` DISABLE KEYS */;
INSERT INTO `catalogue_productcategory` VALUES (1,1,1);
/*!40000 ALTER TABLE `catalogue_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `requires_shipping` tinyint(1) NOT NULL,
  `track_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass`
--

LOCK TABLES `catalogue_productclass` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass` DISABLE KEYS */;
INSERT INTO `catalogue_productclass` VALUES (1,'Seat','seat',0,0),(2,'Coupon','coupon',0,0),(3,'Enrollment Code','enrollment_code',0,0),(4,'Course Entitlement','course-entitlement',0,0),(5,'Donation','donation',0,0);
/*!40000 ALTER TABLE `catalogue_productclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass_options`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productclass_o_productclass_id_option_i_2266c635_uniq` (`productclass_id`,`option_id`),
  KEY `catalogue_productcla_option_id_b099542c_fk_catalogue` (`option_id`),
  CONSTRAINT `catalogue_productcla_option_id_b099542c_fk_catalogue` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `catalogue_productcla_productclass_id_732df4c8_fk_catalogue` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass_options`
--

LOCK TABLES `catalogue_productclass_options` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productclass_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productimage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productimage_product_id_49474fe8` (`product_id`),
  KEY `catalogue_productimage_display_order_9fa741ac` (`display_order`),
  CONSTRAINT `catalogue_productima_product_id_49474fe8_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productimage`
--

LOCK TABLES `catalogue_productimage` WRITE;
/*!40000 ALTER TABLE `catalogue_productimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productrecommendation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productrecommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranking` smallint(5) unsigned NOT NULL,
  `primary_id` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productrecomme_primary_id_recommendatio_da1fdf43_uniq` (`primary_id`,`recommendation_id`),
  KEY `catalogue_productrec_recommendation_id_daf8ae95_fk_catalogue` (`recommendation_id`),
  KEY `catalogue_productrecommendation_ranking_e7a0f7fd` (`ranking`),
  CONSTRAINT `catalogue_productrec_primary_id_6e51a55c_fk_catalogue` FOREIGN KEY (`primary_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productrec_recommendation_id_daf8ae95_fk_catalogue` FOREIGN KEY (`recommendation_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productrecommendation`
--

LOCK TABLES `catalogue_productrecommendation` WRITE;
/*!40000 ALTER TABLE `catalogue_productrecommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productrecommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_businessclient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_businessclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_businessclient`
--

LOCK TABLES `core_businessclient` WRITE;
/*!40000 ALTER TABLE `core_businessclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_businessclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_client`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_client` (
  `user_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `core_client_user_ptr_id_e5908bcf_fk_ecommerce_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_client`
--

LOCK TABLES `core_client` WRITE;
/*!40000 ALTER TABLE `core_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ecommercefeaturerole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_ecommercefeaturerole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ecommercefeaturerole`
--

LOCK TABLES `core_ecommercefeaturerole` WRITE;
/*!40000 ALTER TABLE `core_ecommercefeaturerole` DISABLE KEYS */;
INSERT INTO `core_ecommercefeaturerole` VALUES (1,'2020-04-07 13:48:25.908259','2020-04-07 13:48:25.908259','enterprise_coupon_admin',NULL),(2,'2020-04-07 13:48:30.983046','2020-04-07 13:48:30.983046','order_manager',NULL);
/*!40000 ALTER TABLE `core_ecommercefeaturerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ecommercefeatureroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_ecommercefeatureroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `enterprise_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_ecommercefeatur_role_id_e8057cdb_fk_core_ecom` (`role_id`),
  KEY `core_ecommercefeatur_user_id_f692628b_fk_ecommerce` (`user_id`),
  CONSTRAINT `core_ecommercefeatur_role_id_e8057cdb_fk_core_ecom` FOREIGN KEY (`role_id`) REFERENCES `core_ecommercefeaturerole` (`id`),
  CONSTRAINT `core_ecommercefeatur_user_id_f692628b_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ecommercefeatureroleassignment`
--

LOCK TABLES `core_ecommercefeatureroleassignment` WRITE;
/*!40000 ALTER TABLE `core_ecommercefeatureroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_ecommercefeatureroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_historicalbusinessclient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_historicalbusinessclient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `core_historicalbusin_history_user_id_c003ab66_fk_ecommerce` (`history_user_id`),
  KEY `core_historicalbusinessclient_id_1f2c8e41` (`id`),
  KEY `core_historicalbusinessclient_name_3c807144` (`name`),
  CONSTRAINT `core_historicalbusin_history_user_id_c003ab66_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_historicalbusinessclient`
--

LOCK TABLES `core_historicalbusinessclient` WRITE;
/*!40000 ALTER TABLE `core_historicalbusinessclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_historicalbusinessclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_siteconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_siteconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lms_url_root` varchar(200) NOT NULL,
  `theme_scss_path` varchar(255) DEFAULT NULL,
  `payment_processors` varchar(255) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `oauth_settings` longtext NOT NULL,
  `segment_key` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `enable_enrollment_codes` tinyint(1) NOT NULL,
  `payment_support_email` varchar(255) NOT NULL,
  `payment_support_url` varchar(255) NOT NULL,
  `affiliate_cookie_name` varchar(255) NOT NULL,
  `utm_cookie_name` varchar(255) NOT NULL,
  `client_side_payment_processor` varchar(255) DEFAULT NULL,
  `send_refund_notifications` tinyint(1) NOT NULL,
  `enable_sdn_check` tinyint(1) NOT NULL,
  `sdn_api_key` varchar(255) NOT NULL,
  `sdn_api_list` varchar(255) NOT NULL,
  `sdn_api_url` varchar(255) NOT NULL,
  `require_account_activation` tinyint(1) NOT NULL,
  `optimizely_snippet_src` varchar(255) NOT NULL,
  `enable_sailthru` tinyint(1) NOT NULL,
  `base_cookie_domain` varchar(255) NOT NULL,
  `enable_embargo_check` tinyint(1) NOT NULL,
  `discovery_api_url` varchar(200) NOT NULL,
  `enable_apple_pay` tinyint(1) NOT NULL,
  `enable_partial_program` tinyint(1) NOT NULL,
  `hubspot_secret_key` varchar(255) NOT NULL,
  `enable_microfrontend_for_basket_page` tinyint(1) NOT NULL,
  `payment_microfrontend_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_siteconfiguration_site_id_3124a87d_uniq` (`site_id`),
  KEY `core_siteconfiguration_partner_id_75739217` (`partner_id`),
  CONSTRAINT `core_siteconfiguration_partner_id_75739217_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `core_siteconfiguration_site_id_3124a87d_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_siteconfiguration`
--

LOCK TABLES `core_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `core_siteconfiguration` DISABLE KEYS */;
INSERT INTO `core_siteconfiguration` VALUES (1,'http://edx.devstack.lms:18000',NULL,'cybersource,paypal',1,1,'{\"SOCIAL_AUTH_EDX_OAUTH2_PUBLIC_URL_ROOT\":\"http://localhost:18000\",\"SOCIAL_AUTH_EDX_OAUTH2_URL_ROOT\":\"http://edx.devstack.lms:18000\",\"SOCIAL_AUTH_EDX_OAUTH2_SECRET\":\"ecommerce-sso-secret\",\"BACKEND_SERVICE_EDX_OAUTH2_SECRET\":\"ecommerce-backend-service-secret\",\"SOCIAL_AUTH_EDX_OAUTH2_LOGOUT_URL\":\"http://edx.devstack.lms:18000/logout\",\"SOCIAL_AUTH_EDX_OAUTH2_ISSUERS\":[\"http://edx.devstack.lms:18000\"],\"BACKEND_SERVICE_EDX_OAUTH2_KEY\":\"ecommerce-backend-service-key\",\"SOCIAL_AUTH_EDX_OAUTH2_KEY\":\"ecommerce-sso-key\"}',NULL,'staff@example.com',0,'support@example.com','','','','cybersource',0,0,'','','',1,'',0,'',0,'http://edx.devstack.discovery:18381/api/v1/',0,0,'',0,NULL);
/*!40000 ALTER TABLE `core_siteconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail_url` varchar(200) DEFAULT NULL,
  `verification_deadline` datetime(6) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `created` datetime(6),
  `modified` datetime(6),
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_site_id_af38aac5_fk_django_site_id` (`site_id`),
  KEY `courses_course_partner_id_a64c9b38_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `courses_course_partner_id_a64c9b38_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `courses_course_site_id_af38aac5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES ('course-v1:edX+DemoX+Demo_Course','edX Demonstration Course',NULL,'2022-04-07 14:54:29.160654',NULL,'2020-04-07 13:55:47.170439','2020-04-07 14:54:29.207717',1);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_historicalcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_historicalcourse` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `verification_deadline` datetime(6) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `thumbnail_url` varchar(200) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `courses_historicalco_history_user_id_5aca3c34_fk_ecommerce` (`history_user_id`),
  KEY `courses_historicalcourse_id_ef83d5ac` (`id`),
  KEY `courses_historicalcourse_partner_id_c09fe2b8` (`partner_id`),
  KEY `courses_historicalcourse_site_id_dfff3795` (`site_id`),
  CONSTRAINT `courses_historicalco_history_user_id_5aca3c34_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_historicalcourse`
--

LOCK TABLES `courses_historicalcourse` WRITE;
/*!40000 ALTER TABLE `courses_historicalcourse` DISABLE KEYS */;
INSERT INTO `courses_historicalcourse` VALUES ('course-v1:edX+DemoX+Demo_Course','edX Demonstration Course','2022-04-07 13:55:47.130174','2020-04-07 13:55:47.170439','2020-04-07 13:55:47.170465',NULL,1,'2020-04-07 13:55:47.170824',NULL,'+',NULL,1,NULL),('course-v1:edX+DemoX+Demo_Course','edX Demonstration Course','2022-04-07 14:54:29.160654','2020-04-07 13:55:47.170439','2020-04-07 14:54:29.207717',NULL,2,'2020-04-07 14:54:29.208830',NULL,'~',NULL,1,NULL);
/*!40000 ALTER TABLE `courses_historicalcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_communicationeventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_communicationeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `email_subject_template` varchar(255) DEFAULT NULL,
  `email_body_template` longtext,
  `email_body_html_template` longtext,
  `sms_template` varchar(170) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_communicationeventtype`
--

LOCK TABLES `customer_communicationeventtype` WRITE;
/*!40000 ALTER TABLE `customer_communicationeventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_communicationeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_email`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` longtext NOT NULL,
  `body_text` longtext NOT NULL,
  `body_html` longtext NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_email_user_id_a69ad588_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `customer_email_user_id_a69ad588_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_email`
--

LOCK TABLES `customer_email` WRITE;
/*!40000 ALTER TABLE `customer_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `date_read` datetime(6) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notification_recipient_id_d99de5c8_fk_ecommerce_user_id` (`recipient_id`),
  KEY `customer_notification_sender_id_affa1632_fk_ecommerce_user_id` (`sender_id`),
  KEY `customer_notification_date_sent_9b6baeda` (`date_sent`),
  CONSTRAINT `customer_notification_recipient_id_d99de5c8_fk_ecommerce_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `customer_notification_sender_id_affa1632_fk_ecommerce_user_id` FOREIGN KEY (`sender_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notification`
--

LOCK TABLES `customer_notification` WRITE;
/*!40000 ALTER TABLE `customer_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_productalert`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_productalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `key` varchar(128) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_confirmed` datetime(6) DEFAULT NULL,
  `date_cancelled` datetime(6) DEFAULT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_productaler_product_id_7e529a41_fk_catalogue` (`product_id`),
  KEY `customer_productalert_user_id_677ad6d6_fk_ecommerce_user_id` (`user_id`),
  KEY `customer_productalert_email_e5f35f45` (`email`),
  KEY `customer_productalert_key_a26f3bdc` (`key`),
  CONSTRAINT `customer_productaler_product_id_7e529a41_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `customer_productalert_user_id_677ad6d6_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_productalert`
--

LOCK TABLES `customer_productalert` WRITE;
/*!40000 ALTER TABLE `customer_productalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_productalert` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'address','country'),(2,'address','useraddress'),(3,'admin','logentry'),(7,'analytics','productrecord'),(6,'analytics','userproductview'),(5,'analytics','userrecord'),(4,'analytics','usersearch'),(9,'auth','group'),(8,'auth','permission'),(13,'basket','basket'),(10,'basket','basketattribute'),(11,'basket','basketattributetype'),(14,'basket','line'),(12,'basket','lineattribute'),(19,'catalogue','attributeoption'),(31,'catalogue','attributeoptiongroup'),(16,'catalogue','catalog'),(29,'catalogue','category'),(23,'catalogue','historicalcategory'),(17,'catalogue','historicaloption'),(30,'catalogue','historicalproduct'),(32,'catalogue','historicalproductattribute'),(22,'catalogue','historicalproductattributevalue'),(21,'catalogue','historicalproductcategory'),(24,'catalogue','historicalproductclass'),(20,'catalogue','option'),(33,'catalogue','product'),(15,'catalogue','productattribute'),(25,'catalogue','productattributevalue'),(18,'catalogue','productcategory'),(28,'catalogue','productclass'),(27,'catalogue','productimage'),(26,'catalogue','productrecommendation'),(34,'contenttypes','contenttype'),(93,'core','businessclient'),(35,'core','client'),(92,'core','ecommercefeaturerole'),(95,'core','ecommercefeatureroleassignment'),(94,'core','historicalbusinessclient'),(36,'core','siteconfiguration'),(37,'core','user'),(38,'courses','course'),(96,'courses','historicalcourse'),(42,'customer','communicationeventtype'),(40,'customer','email'),(41,'customer','notification'),(39,'customer','productalert'),(85,'flatpages','flatpage'),(98,'invoice','historicalinvoice'),(97,'invoice','invoice'),(48,'offer','absolutediscountbenefit'),(44,'offer','benefit'),(45,'offer','condition'),(52,'offer','conditionaloffer'),(58,'offer','countcondition'),(54,'offer','coveragecondition'),(50,'offer','fixedpricebenefit'),(115,'offer','historicalbenefit'),(116,'offer','historicalcondition'),(113,'offer','historicalconditionaloffer'),(119,'offer','historicalofferassignment'),(112,'offer','historicalrange'),(117,'offer','historicalrangeproduct'),(59,'offer','multibuydiscountbenefit'),(118,'offer','offerassignment'),(120,'offer','offerassignmentemailattempt'),(114,'offer','offerassignmentemailtemplates'),(46,'offer','percentagediscountbenefit'),(49,'offer','range'),(57,'offer','rangeproduct'),(43,'offer','rangeproductfileupload'),(55,'offer','shippingabsolutediscountbenefit'),(56,'offer','shippingbenefit'),(51,'offer','shippingfixedpricebenefit'),(47,'offer','shippingpercentagediscountbenefit'),(53,'offer','valuecondition'),(74,'order','billingaddress'),(68,'order','communicationevent'),(122,'order','historicalline'),(125,'order','historicalorder'),(121,'order','historicalorderdiscount'),(64,'order','line'),(73,'order','lineattribute'),(60,'order','lineprice'),(126,'order','manualenrollmentorderdiscountbenefit'),(123,'order','manualenrollmentorderdiscountcondition'),(72,'order','order'),(63,'order','orderdiscount'),(69,'order','ordernote'),(124,'order','orderstatuschange'),(71,'order','paymentevent'),(66,'order','paymenteventquantity'),(70,'order','paymenteventtype'),(67,'order','shippingaddress'),(65,'order','shippingevent'),(62,'order','shippingeventquantity'),(61,'order','shippingeventtype'),(127,'partner','historicalpartner'),(128,'partner','historicalstockrecord'),(77,'partner','partner'),(76,'partner','partneraddress'),(75,'partner','stockalert'),(78,'partner','stockrecord'),(131,'payment','bankcard'),(136,'payment','enterprisecontractmetadata'),(135,'payment','paymentprocessorresponse'),(134,'payment','paypalprocessorconfiguration'),(133,'payment','paypalwebprofile'),(132,'payment','sdncheckfailure'),(137,'payment','source'),(129,'payment','sourcetype'),(130,'payment','transaction'),(99,'referrals','referral'),(111,'refund','historicalrefund'),(110,'refund','historicalrefundline'),(108,'refund','refund'),(109,'refund','refundline'),(105,'reviews','productreview'),(104,'reviews','vote'),(86,'sessions','session'),(102,'shipping','orderanditemcharges'),(103,'shipping','weightband'),(101,'shipping','weightbased'),(79,'sites','site'),(87,'social_django','association'),(88,'social_django','code'),(89,'social_django','nonce'),(91,'social_django','partial'),(90,'social_django','usersocialauth'),(100,'theming','sitetheme'),(142,'thumbnail','kvstore'),(140,'voucher','couponvouchers'),(141,'voucher','historicalvoucherapplication'),(139,'voucher','orderlinevouchers'),(81,'voucher','voucher'),(80,'voucher','voucherapplication'),(138,'voucher','voucherset'),(83,'waffle','flag'),(84,'waffle','sample'),(82,'waffle','switch'),(107,'wishlists','line'),(106,'wishlists','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_url_41612362` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` (`site_id`),
  CONSTRAINT `django_flatpage_sites_flatpage_id_078bbc8b_fk_django_flatpage_id` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-07 13:43:41.323503'),(2,'auth','0001_initial','2020-04-07 13:43:42.358529'),(3,'core','0001_initial','2020-04-07 13:43:46.960316'),(4,'address','0001_initial','2020-04-07 13:44:00.883684'),(5,'address','0002_auto_20150927_1547','2020-04-07 13:44:06.726121'),(6,'address','0003_auto_20150927_1551','2020-04-07 13:44:06.842379'),(7,'address','0004_auto_20170226_1122','2020-04-07 13:44:08.006230'),(8,'address','0005_regenerate_user_address_hashes','2020-04-07 13:44:08.060540'),(9,'address','0006_auto_20181115_1953','2020-04-07 13:44:08.291994'),(10,'admin','0001_initial','2020-04-07 13:44:08.699317'),(11,'admin','0002_logentry_remove_auto_add','2020-04-07 13:44:10.188737'),(12,'admin','0003_logentry_add_action_flag_choices','2020-04-07 13:44:10.250548'),(13,'catalogue','0001_initial','2020-04-07 13:44:17.284319'),(14,'analytics','0001_initial','2020-04-07 13:44:33.576783'),(15,'analytics','0002_auto_20140827_1705','2020-04-07 13:44:37.540367'),(16,'contenttypes','0002_remove_content_type_name','2020-04-07 13:44:40.617789'),(17,'auth','0002_alter_permission_name_max_length','2020-04-07 13:44:41.279429'),(18,'auth','0003_alter_user_email_max_length','2020-04-07 13:44:41.350709'),(19,'auth','0004_alter_user_username_opts','2020-04-07 13:44:41.426923'),(20,'auth','0005_alter_user_last_login_null','2020-04-07 13:44:41.488963'),(21,'auth','0006_require_contenttypes_0002','2020-04-07 13:44:41.525246'),(22,'auth','0007_alter_validators_add_error_messages','2020-04-07 13:44:41.592453'),(23,'auth','0008_alter_user_username_max_length','2020-04-07 13:44:41.637825'),(24,'auth','0009_alter_user_last_name_max_length','2020-04-07 13:44:41.709020'),(25,'auth','0010_alter_group_name_max_length','2020-04-07 13:44:42.457835'),(26,'auth','0011_update_proxy_permissions','2020-04-07 13:44:42.582813'),(27,'waffle','0001_initial','2020-04-07 13:44:47.502190'),(28,'sites','0001_initial','2020-04-07 13:44:51.546193'),(29,'partner','0001_initial','2020-04-07 13:44:54.552418'),(30,'customer','0001_initial','2020-04-07 13:45:01.216473'),(31,'basket','0001_initial','2020-04-07 13:45:05.656950'),(32,'basket','0002_auto_20140827_1705','2020-04-07 13:45:09.962217'),(33,'order','0001_initial','2020-04-07 13:45:27.045802'),(34,'offer','0001_initial','2020-04-07 13:45:52.452648'),(35,'voucher','0001_initial','2020-04-07 13:46:04.201863'),(36,'basket','0003_basket_vouchers','2020-04-07 13:46:08.331248'),(37,'basket','0004_auto_20141007_2032','2020-04-07 13:46:09.987696'),(38,'basket','0005_auto_20150709_1205','2020-04-07 13:46:11.651770'),(39,'basket','0006_basket_site','2020-04-07 13:46:12.291086'),(40,'basket','0007_auto_20160907_2040','2020-04-07 13:46:14.860976'),(41,'basket','0008_auto_20170215_2224','2020-04-07 13:46:16.505425'),(42,'basket','0009_auto_20170215_2229','2020-04-07 13:46:16.606125'),(43,'basket','0010_create_repeat_purchase_switch','2020-04-07 13:46:16.754066'),(44,'basket','0011_add_email_basket_attribute_type','2020-04-07 13:46:16.924158'),(45,'basket','0012_add_purchaser_basket_attribute','2020-04-07 13:46:17.112739'),(46,'basket','0013_auto_20200305_1448','2020-04-07 13:46:17.440543'),(47,'sites','0002_alter_domain_unique','2020-04-07 13:46:17.752365'),(48,'partner','0002_auto_20141007_2032','2020-04-07 13:46:17.997255'),(49,'partner','0003_auto_20150223_1130','2020-04-07 13:46:18.041942'),(50,'courses','0001_initial','2020-04-07 13:46:18.345444'),(51,'catalogue','0002_auto_20150223_1052','2020-04-07 13:46:18.620928'),(52,'catalogue','0003_product_course','2020-04-07 13:46:19.342614'),(53,'catalogue','0004_auto_20150609_0129','2020-04-07 13:46:22.520952'),(54,'partner','0004_auto_20150609_1215','2020-04-07 13:46:29.599703'),(55,'partner','0005_auto_20150610_1355','2020-04-07 13:46:33.634826'),(56,'partner','0006_auto_20150709_1205','2020-04-07 13:46:35.350790'),(57,'partner','0007_auto_20150914_0841','2020-04-07 13:46:36.130789'),(58,'partner','0008_auto_20150914_1057','2020-04-07 13:46:36.685681'),(59,'partner','0009_partner_enable_sailthru','2020-04-07 13:46:37.246106'),(60,'partner','0010_auto_20161025_1446','2020-04-07 13:46:37.339117'),(61,'partner','0011_auto_20170525_2138','2020-04-07 13:46:37.437597'),(62,'partner','0012_auto_20180119_0903','2020-04-07 13:46:39.650732'),(63,'partner','0013_partner_default_site','2020-04-07 13:46:40.464673'),(64,'courses','0002_historicalcourse','2020-04-07 13:46:41.734837'),(65,'courses','0003_auto_20150618_1108','2020-04-07 13:46:43.641874'),(66,'courses','0004_auto_20150803_1406','2020-04-07 13:46:44.714978'),(67,'courses','0005_auto_20170525_0131','2020-04-07 13:46:46.672507'),(68,'courses','0006_auto_20171204_1036','2020-04-07 13:46:49.738622'),(69,'courses','0007_auto_20180119_0903','2020-04-07 13:46:51.035903'),(70,'courses','0008_course_partner','2020-04-07 13:46:51.672485'),(71,'courses','0009_allow_site_to_be_nullable','2020-04-07 13:46:53.746774'),(72,'courses','0010_migrate_partner_data_to_courses','2020-04-07 13:46:55.315108'),(73,'catalogue','0005_auto_20150610_1355','2020-04-07 13:46:59.052711'),(74,'catalogue','0006_credit_provider_attr','2020-04-07 13:46:59.241491'),(75,'catalogue','0007_auto_20150709_1205','2020-04-07 13:47:01.018896'),(76,'catalogue','0008_auto_20150709_1254','2020-04-07 13:47:02.557324'),(77,'catalogue','0009_credit_hours_attr','2020-04-07 13:47:02.782784'),(78,'catalogue','0010_catalog','2020-04-07 13:47:03.453148'),(79,'catalogue','0011_auto_20151019_0639','2020-04-07 13:47:07.468186'),(80,'catalogue','0012_enrollment_code_product_class','2020-04-07 13:47:07.500660'),(81,'catalogue','0013_coupon_product_class','2020-04-07 13:47:08.032692'),(82,'catalogue','0014_alter_couponvouchers_attribute','2020-04-07 13:47:08.265899'),(83,'catalogue','0015_default_categories','2020-04-07 13:47:08.620432'),(84,'catalogue','0016_coupon_note_attribute','2020-04-07 13:47:08.852994'),(85,'catalogue','0017_enrollment_code_product_class','2020-04-07 13:47:09.041560'),(86,'catalogue','0018_auto_20160530_0134','2020-04-07 13:47:09.127163'),(87,'catalogue','0019_enrollment_code_idverifyreq_attribute','2020-04-07 13:47:09.318993'),(88,'catalogue','0020_auto_20161025_1446','2020-04-07 13:47:09.405154'),(89,'catalogue','0021_auto_20170215_2224','2020-04-07 13:47:09.792692'),(90,'catalogue','0022_auto_20170215_2229','2020-04-07 13:47:09.908523'),(91,'catalogue','0023_auto_20170215_2234','2020-04-07 13:47:10.192672'),(92,'catalogue','0024_fix_enrollment_code_slug','2020-04-07 13:47:10.419022'),(93,'catalogue','0025_course_entitlement','2020-04-07 13:47:10.668397'),(94,'catalogue','0026_course_entitlement_attr_change','2020-04-07 13:47:10.913361'),(95,'catalogue','0027_catalogue_entitlement_option','2020-04-07 13:47:11.146471'),(96,'catalogue','0028_donations_from_checkout_tests_product_type','2020-04-07 13:47:11.363339'),(97,'catalogue','0029_auto_20180119_0903','2020-04-07 13:47:17.942760'),(98,'catalogue','0030_auto_20180124_1131','2020-04-07 13:47:20.423203'),(99,'catalogue','0031_course_entitlement_idverifyreq_attr','2020-04-07 13:47:22.378379'),(100,'catalogue','0032_journal_product_class','2020-04-07 13:47:22.733527'),(101,'catalogue','0033_add_coupon_categories','2020-04-07 13:47:23.049134'),(102,'catalogue','0034_add_on_campus_coupon_category','2020-04-07 13:47:23.266696'),(103,'catalogue','0035_add_partner_no_rev_coupon_categories','2020-04-07 13:47:23.488671'),(104,'catalogue','0036_coupon_notify_email_attribute','2020-04-07 13:47:23.692828'),(105,'catalogue','0037_add_sec_disc_reward_coupon_category','2020-04-07 13:47:23.914612'),(106,'catalogue','0038_coupon_enterprise_id_attribute','2020-04-07 13:47:24.120893'),(107,'catalogue','0039_historicalproduct_historicalproductattributevalue','2020-04-07 13:47:25.190386'),(108,'catalogue','0040_historicalcategory_historicaloption_historicalproductattribute_historicalproductcategory_historicalp','2020-04-07 13:47:31.476015'),(109,'catalogue','0041_auto_20190903_1752','2020-04-07 13:47:37.877717'),(110,'catalogue','0042_auto_20190913_1756','2020-04-07 13:47:38.907383'),(111,'catalogue','0043_auto_20191115_2151','2020-04-07 13:47:39.406531'),(112,'catalogue','0044_add_enterprisecontractmetadata_product_attribute','2020-04-07 13:47:39.615750'),(113,'catalogue','0045_add_edx_employee_coupon_category','2020-04-07 13:47:39.827583'),(114,'catalogue','0046_coupon_inactive_attribute','2020-04-07 13:47:40.027079'),(115,'catalogue','0047_coupon_sales_force_id_attribute','2020-04-07 13:47:40.237151'),(116,'catalogue','0048_auto_20200311_1240','2020-04-07 13:47:45.968470'),(117,'core','0002_auto_20150826_1455','2020-04-07 13:47:49.137621'),(118,'core','0003_auto_20150914_1120','2020-04-07 13:47:49.910766'),(119,'core','0004_auto_20150915_1023','2020-04-07 13:47:52.727790'),(120,'core','0005_auto_20150924_0123','2020-04-07 13:47:53.149316'),(121,'core','0006_add_service_user','2020-04-07 13:47:53.416754'),(122,'core','0007_auto_20151005_1333','2020-04-07 13:47:53.710355'),(123,'core','0008_client','2020-04-07 13:47:54.123409'),(124,'core','0009_service_user_privileges','2020-04-07 13:47:55.530562'),(125,'core','0010_add_async_sample','2020-04-07 13:47:55.741903'),(126,'core','0011_siteconfiguration_oauth_settings','2020-04-07 13:47:56.301669'),(127,'core','0012_businessclient','2020-04-07 13:47:56.613629'),(128,'core','0013_siteconfiguration_segment_key','2020-04-07 13:47:57.216826'),(129,'core','0014_enrollment_code_switch','2020-04-07 13:47:57.416039'),(130,'core','0015_siteconfiguration_from_email','2020-04-07 13:47:58.380151'),(131,'core','0016_siteconfiguration_enable_enrollment_codes','2020-04-07 13:47:59.351119'),(132,'core','0017_siteconfiguration_payment_support_email','2020-04-07 13:48:00.150399'),(133,'core','0018_siteconfiguration_payment_support_url','2020-04-07 13:48:00.751274'),(134,'core','0019_auto_20161012_1404','2020-04-07 13:48:01.959329'),(135,'core','0020_siteconfiguration_enable_otto_receipt_page','2020-04-07 13:48:03.599035'),(136,'core','0021_siteconfiguration_client_side_payment_processor','2020-04-07 13:48:04.341396'),(137,'core','0022_auto_20161108_2101','2020-04-07 13:48:04.401203'),(138,'core','0023_siteconfiguration_send_refund_notifications','2020-04-07 13:48:05.243969'),(139,'core','0024_auto_20170208_1520','2020-04-07 13:48:08.207457'),(140,'core','0025_auto_20170214_0003','2020-04-07 13:48:08.308218'),(141,'core','0026_auto_20170215_2234','2020-04-07 13:48:08.397113'),(142,'core','0027_siteconfiguration_require_account_activation','2020-04-07 13:48:09.028046'),(143,'core','0028_siteconfiguration_optimizely_snippet_src','2020-04-07 13:48:09.630704'),(144,'core','0029_auto_20170525_2131','2020-04-07 13:48:10.279009'),(145,'core','0030_auto_20170525_2134','2020-04-07 13:48:11.856688'),(146,'core','0031_siteconfiguration_enable_sailthru','2020-04-07 13:48:13.333743'),(147,'core','0032_auto_20170602_0516','2020-04-07 13:48:14.070502'),(148,'core','0033_auto_20170606_0539','2020-04-07 13:48:14.302657'),(149,'core','0034_auto_20170613_2039','2020-04-07 13:48:14.382869'),(150,'core','0035_siteconfiguration_base_cookie_domain','2020-04-07 13:48:14.951585'),(151,'core','0036_remove_siteconfiguration_enable_otto_receipt_page','2020-04-07 13:48:15.617260'),(152,'core','0037_siteconfiguration_enable_embargo_check','2020-04-07 13:48:16.241317'),(153,'core','0038_siteconfiguration_discovery_api_url','2020-04-07 13:48:16.934469'),(154,'core','0039_auto_20170716_2212','2020-04-07 13:48:17.634557'),(155,'core','0040_siteconfiguration__allowed_segment_events','2020-04-07 13:48:18.245345'),(156,'core','0041_remove_siteconfiguration__allowed_segment_events','2020-04-07 13:48:18.936235'),(157,'core','0042_siteconfiguration_enable_partial_program','2020-04-07 13:48:19.570444'),(158,'core','0043_auto_20170808_1009','2020-04-07 13:48:19.660465'),(159,'core','0044_auto_20180313_0702','2020-04-07 13:48:19.873758'),(160,'core','0045_auto_20180510_0823','2020-04-07 13:48:21.162238'),(161,'core','0046_siteconfiguration_journals_api_url','2020-04-07 13:48:21.815624'),(162,'core','0047_businessclient_enterprise_customer_uuid','2020-04-07 13:48:22.284187'),(163,'core','0048_siteconfiguration_hubspot_secret_key','2020-04-07 13:48:22.922046'),(164,'core','0049_ecommercefeaturerole_ecommercefeatureroleassignment','2020-04-07 13:48:23.893149'),(165,'core','0050_add_specific_ecommerce_roles','2020-04-07 13:48:25.953132'),(166,'core','0051_ecommercefeatureroleassignment_enterprise_id','2020-04-07 13:48:26.688856'),(167,'core','0052_historicalbusinessclient','2020-04-07 13:48:27.149010'),(168,'core','0053_user_lms_user_id','2020-04-07 13:48:29.370155'),(169,'core','0054_auto_20190626_0153','2020-04-07 13:48:30.758533'),(170,'core','0055_add_ordermanager_role','2020-04-07 13:48:31.057549'),(171,'core','0056_remove_siteconfiguration_journals_api_url','2020-04-07 13:48:31.582659'),(172,'core','0057_auto_20190920_1752','2020-04-07 13:48:31.940853'),(173,'core','0058_auto_20191115_2151','2020-04-07 13:48:32.201371'),(174,'core','0059_auto_20200115_1941','2020-04-07 13:48:33.580221'),(175,'core','0060_auto_20200117_1312','2020-04-07 13:48:35.385278'),(176,'partner','0014_historicalstockrecord','2020-04-07 13:48:35.818243'),(177,'courses','0011_historicalcourse','2020-04-07 13:48:38.518226'),(178,'courses','0012_auto_20191115_2151','2020-04-07 13:48:39.942262'),(179,'customer','0002_auto_20160517_0930','2020-04-07 13:48:40.059829'),(180,'customer','0003_auto_20170215_2229','2020-04-07 13:48:40.871025'),(181,'customer','0004_auto_20180124_1131','2020-04-07 13:48:42.830809'),(182,'customer','0005_auto_20191115_2151','2020-04-07 13:48:42.908608'),(183,'customer','0006_auto_20200305_1448','2020-04-07 13:48:43.436489'),(184,'offer','0002_range_catalog','2020-04-07 13:48:44.340295'),(185,'offer','0003_auto_20160517_1247','2020-04-07 13:48:46.579388'),(186,'offer','0004_auto_20160530_0944','2020-04-07 13:48:47.487676'),(187,'offer','0005_conditionaloffer_email_domains','2020-04-07 13:48:48.069174'),(188,'offer','0006_auto_20161025_1446','2020-04-07 13:48:48.157119'),(189,'offer','0007_auto_20161026_0856','2020-04-07 13:48:49.062077'),(190,'offer','0008_range_course_catalog','2020-04-07 13:48:49.743547'),(191,'offer','0009_range_enterprise_customer','2020-04-07 13:48:50.543773'),(192,'offer','0010_auto_20170215_2224','2020-04-07 13:48:50.786910'),(193,'offer','0011_auto_20170215_2324','2020-04-07 13:48:51.022444'),(194,'offer','0012_condition_program_uuid','2020-04-07 13:48:51.628980'),(195,'enterprise','0001_initial','2020-04-07 13:48:51.723256'),(196,'enterprise','0002_add_enterprise_offers_switch','2020-04-07 13:48:51.997853'),(197,'enterprise','0003_add_enable_enterprise_switch','2020-04-07 13:48:52.307779'),(198,'enterprise','0004_add_enterprise_offers_for_coupons','2020-04-07 13:48:52.596188'),(199,'enterprise','0005_assignableenterprisecustomercondition','2020-04-07 13:48:52.640409'),(200,'enterprise','0006_add_role_based_authz_switch','2020-04-07 13:48:53.062601'),(201,'enterprise','0007_remove_role_based_authz_switch','2020-04-07 13:48:53.296635'),(202,'enterprise','0008_remove_enterprise_offers_switch','2020-04-07 13:48:53.550953'),(203,'enterprise','0009_remove_enterprise_offers_for_coupons','2020-04-07 13:48:53.761642'),(204,'enterprise','0010_add_use_enterprise_catalog_flag','2020-04-07 13:48:53.994493'),(205,'flatpages','0001_initial','2020-04-07 13:48:54.786982'),(206,'fulfillment','0001_initial','2020-04-07 13:48:56.997094'),(207,'order','0002_auto_20141007_2032','2020-04-07 13:48:57.097531'),(208,'order','0003_auto_20150224_1520','2020-04-07 13:48:57.307643'),(209,'order','0004_order_payment_processor','2020-04-07 13:48:58.345365'),(210,'order','0005_deprecate_order_payment_processor','2020-04-07 13:49:00.922012'),(211,'order','0006_paymentevent_processor_name','2020-04-07 13:49:01.646728'),(212,'order','0007_create_history_tables','2020-04-07 13:49:02.522543'),(213,'order','0008_delete_order_payment_processor','2020-04-07 13:49:08.792024'),(214,'order','0009_auto_20150709_1205','2020-04-07 13:49:08.969029'),(215,'order','0010_auto_20160529_2245','2020-04-07 13:49:09.062116'),(216,'order','0011_auto_20161025_1446','2020-04-07 13:49:09.152416'),(217,'order','0012_auto_20170215_2224','2020-04-07 13:49:09.249942'),(218,'order','0013_auto_20170215_2229','2020-04-07 13:49:11.249282'),(219,'order','0014_auto_20170606_0535','2020-04-07 13:49:11.471917'),(220,'order','0015_create_disable_repeat_order_check_switch','2020-04-07 13:49:11.771491'),(221,'order','0016_auto_20180119_0903','2020-04-07 13:49:20.651752'),(222,'order','0017_order_partner','2020-04-07 13:49:21.635872'),(223,'invoice','0001_initial','2020-04-07 13:49:23.532462'),(224,'invoice','0002_auto_20160324_1919','2020-04-07 13:49:29.624155'),(225,'invoice','0003_auto_20160616_0657','2020-04-07 13:49:41.400426'),(226,'invoice','0004_auto_20170215_2234','2020-04-07 13:49:44.750818'),(227,'invoice','0005_auto_20180119_0903','2020-04-07 13:49:48.108166'),(228,'invoice','0006_auto_20180228_1057','2020-04-07 13:49:48.296206'),(229,'invoice','0007_historicalinvoice','2020-04-07 13:49:48.787994'),(230,'invoice','0008_auto_20191115_2151','2020-04-07 13:49:50.957572'),(231,'offer','0013_auto_20170801_0742','2020-04-07 13:49:51.063968'),(232,'offer','0014_conditionaloffer_site','2020-04-07 13:49:51.862276'),(233,'offer','0015_auto_20170926_1357','2020-04-07 13:49:54.344518'),(234,'offer','0016_auto_20180124_1131','2020-04-07 13:49:56.636980'),(235,'offer','0017_condition_journal_bundle_uuid','2020-04-07 13:49:57.179811'),(236,'journals','0001_initial','2020-04-07 13:49:57.259841'),(237,'journals','0002_auto_20190909_1405','2020-04-07 13:49:57.791134'),(238,'journals','0003_auto_20190909_1733','2020-04-07 13:49:57.864412'),(239,'payment','0001_initial','2020-04-07 13:50:00.070577'),(240,'payment','0002_auto_20141007_2032','2020-04-07 13:50:03.935505'),(241,'payment','0003_create_payment_processor_response','2020-04-07 13:50:04.619744'),(242,'payment','0004_source_card_type','2020-04-07 13:50:06.666632'),(243,'payment','0005_paypalwebprofile','2020-04-07 13:50:07.069173'),(244,'payment','0006_enable_payment_processors','2020-04-07 13:50:07.400375'),(245,'payment','0007_add_cybersource_level23_sample','2020-04-07 13:50:07.702567'),(246,'payment','0008_remove_cybersource_level23_sample','2020-04-07 13:50:08.018742'),(247,'payment','0009_auto_20161025_1446','2020-04-07 13:50:08.112608'),(248,'payment','0010_create_client_side_checkout_flag','2020-04-07 13:50:08.384124'),(249,'payment','0011_paypalprocessorconfiguration','2020-04-07 13:50:08.765520'),(250,'payment','0012_auto_20161109_1456','2020-04-07 13:50:08.843264'),(251,'payment','0013_sdncheckfailure','2020-04-07 13:50:09.205238'),(252,'payment','0014_sdncheckfailure_site','2020-04-07 13:50:10.050258'),(253,'payment','0015_auto_20170215_2229','2020-04-07 13:50:11.588682'),(254,'payment','0016_auto_20170227_1402','2020-04-07 13:50:12.626418'),(255,'payment','0017_auto_20170328_1445','2020-04-07 13:50:15.317711'),(256,'payment','0018_create_stripe_switch','2020-04-07 13:50:15.563049'),(257,'payment','0019_auto_20180628_2011','2020-04-07 13:50:15.714411'),(258,'payment','0020_auto_20191004_1520','2020-04-07 13:50:16.098652'),(259,'payment','0021_auto_20191115_2151','2020-04-07 13:50:16.225394'),(260,'payment','0022_auto_20191120_2106','2020-04-07 13:50:16.736617'),(261,'payment','0023_auto_20191126_2153','2020-04-07 13:50:16.855152'),(262,'voucher','0002_couponvouchers','2020-04-07 13:50:17.586945'),(263,'voucher','0003_orderlinevouchers','2020-04-07 13:50:21.077210'),(264,'voucher','0004_auto_20160517_0930','2020-04-07 13:50:25.809760'),(265,'voucher','0005_auto_20180124_1131','2020-04-07 13:50:27.360761'),(266,'voucher','0006_auto_20181205_1017','2020-04-07 13:50:27.456710'),(267,'offer','0018_conditionaloffer_partner','2020-04-07 13:50:28.224379'),(268,'offer','0019_migrate_partner_to_conditional_offers','2020-04-07 13:50:29.670410'),(269,'offer','0020_migrate_partner_to_coupon_offers','2020-04-07 13:50:29.912723'),(270,'offer','0021_range_enterprise_customer_catalog','2020-04-07 13:50:30.641265'),(271,'offer','0022_offerassignment','2020-04-07 13:50:31.139928'),(272,'offer','0023_offerassignmentemailattempt','2020-04-07 13:50:33.342834'),(273,'offer','0024_add_history_models_de_1424','2020-04-07 13:50:36.787006'),(274,'offer','0025_auto_20190624_1747','2020-04-07 13:50:45.912838'),(275,'offer','0026_auto_20190903_1806','2020-04-07 13:50:47.378325'),(276,'offer','0027_auto_20190913_1756','2020-04-07 13:50:49.256246'),(277,'offer','0028_auto_20191115_2151','2020-04-07 13:50:49.886081'),(278,'offer','0029_auto_20191126_2153','2020-04-07 13:50:51.864652'),(279,'offer','0030_offerassignmentemailtemplates','2020-04-07 13:50:53.708712'),(280,'offer','0031_auto_20200224_0756','2020-04-07 13:50:54.751800'),(281,'offer','0032_auto_20200305_1109','2020-04-07 13:50:56.481237'),(282,'offer','0033_auto_20200311_1240','2020-04-07 13:50:57.471804'),(283,'offer','0034_auto_20200403_1003','2020-04-07 13:50:58.846958'),(284,'order','0018_historicalline_historicalorder','2020-04-07 13:50:59.685909'),(285,'order','0019_manualenrollmentorderdiscountbenefit_manualenrollmentorderdiscountcondition','2020-04-07 13:51:04.643241'),(286,'order','0020_auto_20191115_2151','2020-04-07 13:51:04.755735'),(287,'order','0021_auto_20191212_1630','2020-04-07 13:51:07.769133'),(288,'order','0022_historicalorderdiscount','2020-04-07 13:51:08.263204'),(289,'order','0023_auto_20200305_1448','2020-04-07 13:51:11.046528'),(290,'partner','0015_historicalpartner','2020-04-07 13:51:12.823653'),(291,'partner','0016_auto_20191115_2151','2020-04-07 13:51:14.557824'),(292,'partner','0017_auto_20200305_1448','2020-04-07 13:51:15.721238'),(293,'payment','0024_auto_20191212_1630','2020-04-07 13:51:15.826291'),(294,'payment','0025_card_type_ordering','2020-04-07 13:51:15.900354'),(295,'payment','0026_auto_20200305_1448','2020-04-07 13:51:16.225888'),(296,'programs','0001_initial','2020-04-07 13:51:16.318579'),(297,'programs','0002_add_basket_attribute_type','2020-04-07 13:51:16.604219'),(298,'referrals','0001_initial','2020-04-07 13:51:17.123706'),(299,'referrals','0002_auto_20161011_1728','2020-04-07 13:51:22.827043'),(300,'referrals','0003_auto_20161027_1738','2020-04-07 13:51:24.535213'),(301,'referrals','0004_auto_20170215_2234','2020-04-07 13:51:26.328586'),(302,'referrals','0005_auto_20180628_2011','2020-04-07 13:51:26.478814'),(303,'refund','0001_squashed_0002_auto_20150515_2220','2020-04-07 13:51:28.876884'),(304,'refund','0002_auto_20151214_1017','2020-04-07 13:51:34.641471'),(305,'refund','0003_auto_20180119_0903','2020-04-07 13:51:38.745095'),(306,'refund','0004_auto_20180403_1120','2020-04-07 13:51:39.050832'),(307,'refund','0005_auto_20180628_2011','2020-04-07 13:51:39.314421'),(308,'refund','0006_historicalrefund_historicalrefundline','2020-04-07 13:51:40.092429'),(309,'refund','0007_auto_20191115_2151','2020-04-07 13:51:42.972474'),(310,'reviews','0001_initial','2020-04-07 13:51:44.689299'),(311,'reviews','0002_update_email_length','2020-04-07 13:51:48.403934'),(312,'reviews','0003_auto_20160802_1358','2020-04-07 13:51:48.508200'),(313,'reviews','0004_auto_20170429_0941','2020-04-07 13:51:49.364899'),(314,'sailthru','0001_initial','2020-04-07 13:51:49.799295'),(315,'sailthru','0002_add_basket_attribute_type','2020-04-07 13:51:50.152350'),(316,'sessions','0001_initial','2020-04-07 13:51:50.502547'),(317,'shipping','0001_initial','2020-04-07 13:51:53.268380'),(318,'shipping','0002_auto_20150604_1450','2020-04-07 13:52:00.372245'),(319,'shipping','0003_auto_20181115_1953','2020-04-07 13:52:00.886457'),(320,'default','0001_initial','2020-04-07 13:52:02.942322'),(321,'social_auth','0001_initial','2020-04-07 13:52:02.975513'),(322,'default','0002_add_related_name','2020-04-07 13:52:04.923555'),(323,'social_auth','0002_add_related_name','2020-04-07 13:52:05.007919'),(324,'default','0003_alter_email_max_length','2020-04-07 13:52:05.755402'),(325,'social_auth','0003_alter_email_max_length','2020-04-07 13:52:05.800260'),(326,'default','0004_auto_20160423_0400','2020-04-07 13:52:05.913942'),(327,'social_auth','0004_auto_20160423_0400','2020-04-07 13:52:05.945996'),(328,'social_auth','0005_auto_20160727_2333','2020-04-07 13:52:06.225145'),(329,'social_django','0006_partial','2020-04-07 13:52:06.561452'),(330,'social_django','0007_code_timestamp','2020-04-07 13:52:07.356833'),(331,'social_django','0008_partial_timestamp','2020-04-07 13:52:08.160192'),(332,'theming','0001_initial','2020-04-07 13:52:08.896847'),(333,'thumbnail','0001_initial','2020-04-07 13:52:09.890514'),(334,'voucher','0007_auto_20190913_1756','2020-04-07 13:52:11.437547'),(335,'voucher','0008_auto_20191115_2151','2020-04-07 13:52:12.787437'),(336,'voucher','0009_historicalvoucherapplication','2020-04-07 13:52:13.195176'),(337,'voucher','0010_auto_20200305_1448','2020-04-07 13:52:15.331585'),(338,'waffle','0002_auto_20161201_0958','2020-04-07 13:52:15.393883'),(339,'waffle','0003_update_strings_for_i18n','2020-04-07 13:52:19.777273'),(340,'wishlists','0001_initial','2020-04-07 13:52:21.461428'),(341,'wishlists','0002_auto_20160111_1108','2020-04-07 13:52:23.647831'),(342,'wishlists','0003_auto_20181115_1953','2020-04-07 13:52:23.927474'),(343,'social_django','0004_auto_20160423_0400','2020-04-07 13:52:23.979039'),(344,'social_django','0005_auto_20160727_2333','2020-04-07 13:52:24.016441'),(345,'social_django','0002_add_related_name','2020-04-07 13:52:24.049821'),(346,'social_django','0001_initial','2020-04-07 13:52:24.116278'),(347,'social_django','0003_alter_email_max_length','2020-04-07 13:52:24.184330');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
INSERT INTO `django_site` VALUES (1,'localhost:18130','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `tracking_context` longtext,
  `lms_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `ecommerce_user_email_f3125e14` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user`
--

LOCK TABLES `ecommerce_user` WRITE;
/*!40000 ALTER TABLE `ecommerce_user` DISABLE KEYS */;
INSERT INTO `ecommerce_user` VALUES (1,'!BYozTBrXhofHs11gmbX8MAmt6bsR2b50H3QA4RYZ',NULL,0,'ecommerce_worker','','','',1,1,'2020-04-07 13:47:53.319522',NULL,NULL,NULL),(2,'pbkdf2_sha256$36000$xQDCKQgQUB6I$ic+iz6yAs6JixUNwc5F5l8Qw5nBpKNDXP15CEXZzqtY=',NULL,1,'edx','','','edx@example.com',1,1,'2020-04-07 13:52:30.614312',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ecommerce_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_user_groups_user_id_group_id_2a9a583d_uniq` (`user_id`,`group_id`),
  KEY `ecommerce_user_groups_group_id_a8fd9cb8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `ecommerce_user_groups_group_id_a8fd9cb8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `ecommerce_user_groups_user_id_60d58887_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user_groups`
--

LOCK TABLES `ecommerce_user_groups` WRITE;
/*!40000 ALTER TABLE `ecommerce_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user_user_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_user_user_perm_user_id_permission_id_6d807de6_uniq` (`user_id`,`permission_id`),
  KEY `ecommerce_user_user__permission_id_4dc38e40_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ecommerce_user_user__permission_id_4dc38e40_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `ecommerce_user_user__user_id_0ceec4a8_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user_user_permissions`
--

LOCK TABLES `ecommerce_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `ecommerce_user_user_permissions` DISABLE KEYS */;
INSERT INTO `ecommerce_user_user_permissions` VALUES (1,1,294);
/*!40000 ALTER TABLE `ecommerce_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_historicalinvoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_historicalinvoice` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `state` varchar(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` int(10) unsigned DEFAULT NULL,
  `tax_deducted_source` int(10) unsigned DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `business_client_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `invoice_historicalin_history_user_id_65f31e67_fk_ecommerce` (`history_user_id`),
  KEY `invoice_historicalinvoice_id_2ccb1da5` (`id`),
  KEY `invoice_historicalinvoice_basket_id_d6705c0f` (`basket_id`),
  KEY `invoice_historicalinvoice_business_client_id_17658c64` (`business_client_id`),
  KEY `invoice_historicalinvoice_order_id_e8a59d8c` (`order_id`),
  CONSTRAINT `invoice_historicalin_history_user_id_65f31e67_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_historicalinvoice`
--

LOCK TABLES `invoice_historicalinvoice` WRITE;
/*!40000 ALTER TABLE `invoice_historicalinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_historicalinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_invoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `state` varchar(255) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `business_client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `discount_type` varchar(255),
  `discount_value` int(10) unsigned DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `tax_deducted_source` int(10) unsigned DEFAULT NULL,
  `type` varchar(255),
  PRIMARY KEY (`id`),
  KEY `invoice_invoice_basket_id_8795b83e_fk_basket_basket_id` (`basket_id`),
  KEY `invoice_invoice_business_client_id_44a4b698_fk_core_busi` (`business_client_id`),
  KEY `invoice_invoice_order_id_c5fc9ae9_fk_order_order_id` (`order_id`),
  CONSTRAINT `invoice_invoice_basket_id_8795b83e_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `invoice_invoice_business_client_id_44a4b698_fk_core_busi` FOREIGN KEY (`business_client_id`) REFERENCES `core_businessclient` (`id`),
  CONSTRAINT `invoice_invoice_order_id_c5fc9ae9_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_invoice`
--

LOCK TABLES `invoice_invoice` WRITE;
/*!40000 ALTER TABLE `invoice_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_benefit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `max_affected_items` int(10) unsigned DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_benefit_range_id_ab19c5ab_fk_offer_range_id` (`range_id`),
  CONSTRAINT `offer_benefit_range_id_ab19c5ab_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_benefit`
--

LOCK TABLES `offer_benefit` WRITE;
/*!40000 ALTER TABLE `offer_benefit` DISABLE KEYS */;
INSERT INTO `offer_benefit` VALUES (1,'',1.00,NULL,'ecommerce.extensions.offer.dynamic_conditional_offer.DynamicPercentageDiscountBenefit',NULL);
/*!40000 ALTER TABLE `offer_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_condition`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  `program_uuid` char(32) DEFAULT NULL,
  `enterprise_customer_catalog_uuid` char(32) DEFAULT NULL,
  `enterprise_customer_name` varchar(255) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_condition_range_id_b023a2aa_fk_offer_range_id` (`range_id`),
  CONSTRAINT `offer_condition_range_id_b023a2aa_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_condition`
--

LOCK TABLES `offer_condition` WRITE;
/*!40000 ALTER TABLE `offer_condition` DISABLE KEYS */;
INSERT INTO `offer_condition` VALUES (1,'',NULL,'ecommerce.extensions.offer.dynamic_conditional_offer.DynamicDiscountCondition',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `offer_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_conditionaloffer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_conditionaloffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `offer_type` varchar(128) NOT NULL,
  `status` varchar(64) NOT NULL,
  `priority` int(11) NOT NULL,
  `start_datetime` datetime(6) DEFAULT NULL,
  `end_datetime` datetime(6) DEFAULT NULL,
  `max_global_applications` int(10) unsigned DEFAULT NULL,
  `max_user_applications` int(10) unsigned DEFAULT NULL,
  `max_basket_applications` int(10) unsigned DEFAULT NULL,
  `max_discount` decimal(12,2) DEFAULT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `num_applications` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `benefit_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `email_domains` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL,
  `enterprise_contract_metadata_id` int(11) DEFAULT NULL,
  `sales_force_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `enterprise_contract_metadata_id` (`enterprise_contract_metadata_id`),
  KEY `offer_conditionaloffer_site_id_4409fcc5_fk_django_site_id` (`site_id`),
  KEY `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` (`benefit_id`),
  KEY `offer_conditionaloff_condition_id_e6baa945_fk_offer_con` (`condition_id`),
  KEY `offer_conditionaloffer_partner_id_49d043f6_fk_partner_partner_id` (`partner_id`),
  KEY `offer_conditionaloffer_priority_4c2fc582` (`priority`),
  CONSTRAINT `offer_conditionaloff_condition_id_e6baa945_fk_offer_con` FOREIGN KEY (`condition_id`) REFERENCES `offer_condition` (`id`),
  CONSTRAINT `offer_conditionaloff_enterprise_contract__d5cbdcd5_fk_payment_e` FOREIGN KEY (`enterprise_contract_metadata_id`) REFERENCES `payment_enterprisecontractmetadata` (`id`),
  CONSTRAINT `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` FOREIGN KEY (`benefit_id`) REFERENCES `offer_benefit` (`id`),
  CONSTRAINT `offer_conditionaloffer_partner_id_49d043f6_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `offer_conditionaloffer_site_id_4409fcc5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_conditionaloffer`
--

LOCK TABLES `offer_conditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_conditionaloffer` DISABLE KEYS */;
INSERT INTO `offer_conditionaloffer` VALUES (1,'dynamic_conditional_offer','dynamic_conditional_offer','','Site','Open',-10,NULL,NULL,NULL,NULL,1,NULL,0.00,0,0,'','2020-04-07 13:50:45.823828',1,1,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `offer_conditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalbenefit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalbenefit` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `max_affected_items` int(10) unsigned DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalbene_history_user_id_dfe92ba2_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalbenefit_id_5ae867db` (`id`),
  KEY `offer_historicalbenefit_range_id_4e48c034` (`range_id`),
  CONSTRAINT `offer_historicalbene_history_user_id_dfe92ba2_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalbenefit`
--

LOCK TABLES `offer_historicalbenefit` WRITE;
/*!40000 ALTER TABLE `offer_historicalbenefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalbenefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalcondition`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalcondition` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `enterprise_customer_name` varchar(255) DEFAULT NULL,
  `enterprise_customer_catalog_uuid` char(32) DEFAULT NULL,
  `program_uuid` char(32) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalcond_history_user_id_a6c808f1_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalcondition_id_5795fc09` (`id`),
  KEY `offer_historicalcondition_range_id_5ed1ca70` (`range_id`),
  CONSTRAINT `offer_historicalcond_history_user_id_a6c808f1_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalcondition`
--

LOCK TABLES `offer_historicalcondition` WRITE;
/*!40000 ALTER TABLE `offer_historicalcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalconditionaloffer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalconditionaloffer` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `offer_type` varchar(128) NOT NULL,
  `status` varchar(64) NOT NULL,
  `priority` int(11) NOT NULL,
  `start_datetime` datetime(6) DEFAULT NULL,
  `end_datetime` datetime(6) DEFAULT NULL,
  `max_global_applications` int(10) unsigned DEFAULT NULL,
  `max_user_applications` int(10) unsigned DEFAULT NULL,
  `max_basket_applications` int(10) unsigned DEFAULT NULL,
  `max_discount` decimal(12,2) DEFAULT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `num_applications` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `email_domains` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `benefit_id` int(11) DEFAULT NULL,
  `condition_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL,
  `enterprise_contract_metadata_id` int(11) DEFAULT NULL,
  `sales_force_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalcond_history_user_id_1dfce220_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalconditionaloffer_id_5f516738` (`id`),
  KEY `offer_historicalconditionaloffer_name_29a1cac8` (`name`),
  KEY `offer_historicalconditionaloffer_benefit_id_7604697c` (`benefit_id`),
  KEY `offer_historicalconditionaloffer_condition_id_685ce7ea` (`condition_id`),
  KEY `offer_historicalconditionaloffer_partner_id_8f82e893` (`partner_id`),
  KEY `offer_historicalconditionaloffer_site_id_a6eaef0e` (`site_id`),
  KEY `offer_historicalconditional_enterprise_contract_metadat_045a388a` (`enterprise_contract_metadata_id`),
  KEY `offer_historicalconditionaloffer_priority_bf718df5` (`priority`),
  CONSTRAINT `offer_historicalcond_history_user_id_1dfce220_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalconditionaloffer`
--

LOCK TABLES `offer_historicalconditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_historicalconditionaloffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalconditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalofferassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalofferassignment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `voucher_application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicaloffe_history_user_id_9cf22206_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalofferassignment_id_5400ff80` (`id`),
  KEY `offer_historicalofferassignment_offer_id_a039fe0e` (`offer_id`),
  KEY `offer_historicalofferassignment_voucher_application_id_f9f6a04a` (`voucher_application_id`),
  CONSTRAINT `offer_historicaloffe_history_user_id_9cf22206_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalofferassignment`
--

LOCK TABLES `offer_historicalofferassignment` WRITE;
/*!40000 ALTER TABLE `offer_historicalofferassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalofferassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalrange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalrange` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `includes_all_products` tinyint(1) NOT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `catalog_query` longtext,
  `course_catalog` int(10) unsigned DEFAULT NULL,
  `enterprise_customer` char(32) DEFAULT NULL,
  `enterprise_customer_catalog` char(32) DEFAULT NULL,
  `course_seat_types` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalrang_history_user_id_c7c79383_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalrange_id_5ff50be3` (`id`),
  KEY `offer_historicalrange_name_7c6b1468` (`name`),
  KEY `offer_historicalrange_proxy_class_be5f4b6b` (`proxy_class`),
  KEY `offer_historicalrange_catalog_id_dc747bbd` (`catalog_id`),
  CONSTRAINT `offer_historicalrang_history_user_id_c7c79383_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalrange`
--

LOCK TABLES `offer_historicalrange` WRITE;
/*!40000 ALTER TABLE `offer_historicalrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalrangeproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalrangeproduct` (
  `id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalrang_history_user_id_c876d862_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalrangeproduct_id_11a3ed6a` (`id`),
  KEY `offer_historicalrangeproduct_product_id_2f38aabe` (`product_id`),
  KEY `offer_historicalrangeproduct_range_id_a34f98bb` (`range_id`),
  CONSTRAINT `offer_historicalrang_history_user_id_c876d862_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalrangeproduct`
--

LOCK TABLES `offer_historicalrangeproduct` WRITE;
/*!40000 ALTER TABLE `offer_historicalrangeproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalrangeproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `status` varchar(255) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `voucher_application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_offerassignmen_offer_id_db7eea58_fk_offer_con` (`offer_id`),
  KEY `offer_offerassignmen_voucher_application__85ebbc90_fk_voucher_v` (`voucher_application_id`),
  CONSTRAINT `offer_offerassignmen_offer_id_db7eea58_fk_offer_con` FOREIGN KEY (`offer_id`) REFERENCES `offer_conditionaloffer` (`id`),
  CONSTRAINT `offer_offerassignmen_voucher_application__85ebbc90_fk_voucher_v` FOREIGN KEY (`voucher_application_id`) REFERENCES `voucher_voucherapplication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignment`
--

LOCK TABLES `offer_offerassignment` WRITE;
/*!40000 ALTER TABLE `offer_offerassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignmentemailattempt`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignmentemailattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` varchar(255) NOT NULL,
  `offer_assignment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `send_id` (`send_id`),
  KEY `offer_offerassignmen_offer_assignment_id_64f0cff1_fk_offer_off` (`offer_assignment_id`),
  CONSTRAINT `offer_offerassignmen_offer_assignment_id_64f0cff1_fk_offer_off` FOREIGN KEY (`offer_assignment_id`) REFERENCES `offer_offerassignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignmentemailattempt`
--

LOCK TABLES `offer_offerassignmentemailattempt` WRITE;
/*!40000 ALTER TABLE `offer_offerassignmentemailattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignmentemailattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignmentemailtemplates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignmentemailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_customer` char(32) NOT NULL,
  `email_type` varchar(32) NOT NULL,
  `email_greeting` longtext,
  `email_closing` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_offer_enterpr_a9dd7f_idx` (`enterprise_customer`,`email_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignmentemailtemplates`
--

LOCK TABLES `offer_offerassignmentemailtemplates` WRITE;
/*!40000 ALTER TABLE `offer_offerassignmentemailtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignmentemailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `includes_all_products` tinyint(1) NOT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `catalog_query` longtext,
  `course_seat_types` varchar(255) DEFAULT NULL,
  `course_catalog` int(10) unsigned DEFAULT NULL,
  `enterprise_customer` char(32) DEFAULT NULL,
  `enterprise_customer_catalog` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `proxy_class` (`proxy_class`),
  KEY `offer_range_catalog_id_10237996_fk_catalogue_catalog_id` (`catalog_id`),
  CONSTRAINT `offer_range_catalog_id_10237996_fk_catalogue_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogue_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range`
--

LOCK TABLES `offer_range` WRITE;
/*!40000 ALTER TABLE `offer_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_classes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `productclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_classes_range_id_productclass_id_28eeefae_uniq` (`range_id`,`productclass_id`),
  KEY `offer_range_classes_productclass_id_6f6de46d_fk_catalogue` (`productclass_id`),
  CONSTRAINT `offer_range_classes_productclass_id_6f6de46d_fk_catalogue` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`),
  CONSTRAINT `offer_range_classes_range_id_7d3e573e_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_classes`
--

LOCK TABLES `offer_range_classes` WRITE;
/*!40000 ALTER TABLE `offer_range_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_excluded_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_excluded_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_excluded_products_range_id_product_id_eb1cfe87_uniq` (`range_id`,`product_id`),
  KEY `offer_range_excluded_product_id_78c49bfc_fk_catalogue` (`product_id`),
  CONSTRAINT `offer_range_excluded_product_id_78c49bfc_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_range_excluded_range_id_cce4a032_fk_offer_ran` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_excluded_products`
--

LOCK TABLES `offer_range_excluded_products` WRITE;
/*!40000 ALTER TABLE `offer_range_excluded_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_excluded_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_included_categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_included_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_included_cat_range_id_category_id_a661d336_uniq` (`range_id`,`category_id`),
  KEY `offer_range_included_category_id_c61569a5_fk_catalogue` (`category_id`),
  CONSTRAINT `offer_range_included_category_id_c61569a5_fk_catalogue` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `offer_range_included_range_id_1b616138_fk_offer_ran` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_included_categories`
--

LOCK TABLES `offer_range_included_categories` WRITE;
/*!40000 ALTER TABLE `offer_range_included_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_included_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_rangeproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_rangeproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_order` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `range_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_rangeproduct_range_id_product_id_c46b1be8_uniq` (`range_id`,`product_id`),
  KEY `offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_rangeproduct_range_id_ee358495_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_rangeproduct`
--

LOCK TABLES `offer_rangeproduct` WRITE;
/*!40000 ALTER TABLE `offer_rangeproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_rangeproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_rangeproductfileupload`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_rangeproductfileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  `status` varchar(32) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `date_processed` datetime(6) DEFAULT NULL,
  `num_new_skus` int(10) unsigned DEFAULT NULL,
  `num_unknown_skus` int(10) unsigned DEFAULT NULL,
  `num_duplicate_skus` int(10) unsigned DEFAULT NULL,
  `range_id` int(11) NOT NULL,
  `uploaded_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_rangeproductfileupload_range_id_c055ebf8_fk_offer_range_id` (`range_id`),
  KEY `offer_rangeproductfi_uploaded_by_id_c01a3250_fk_ecommerce` (`uploaded_by_id`),
  KEY `offer_rangeproductfileupload_date_uploaded_f0a4f9ae` (`date_uploaded`),
  CONSTRAINT `offer_rangeproductfi_uploaded_by_id_c01a3250_fk_ecommerce` FOREIGN KEY (`uploaded_by_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `offer_rangeproductfileupload_range_id_c055ebf8_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_rangeproductfileupload`
--

LOCK TABLES `offer_rangeproductfileupload` WRITE;
/*!40000 ALTER TABLE `offer_rangeproductfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_rangeproductfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_billingaddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_billingaddress_country_id_17f57dca_fk_address_c` (`country_id`),
  CONSTRAINT `order_billingaddress_country_id_17f57dca_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_billingaddress`
--

LOCK TABLES `order_billingaddress` WRITE;
/*!40000 ALTER TABLE `order_billingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_communicationevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_communicationevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_communicatione_event_type_id_4bc9ee29_fk_customer_` (`event_type_id`),
  KEY `order_communicationevent_order_id_94e784ac_fk_order_order_id` (`order_id`),
  KEY `order_communicationevent_date_created_ce404d62` (`date_created`),
  CONSTRAINT `order_communicatione_event_type_id_4bc9ee29_fk_customer_` FOREIGN KEY (`event_type_id`) REFERENCES `customer_communicationeventtype` (`id`),
  CONSTRAINT `order_communicationevent_order_id_94e784ac_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_communicationevent`
--

LOCK TABLES `order_communicationevent` WRITE;
/*!40000 ALTER TABLE `order_communicationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_communicationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_historicalline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_historicalline` (
  `id` int(11) NOT NULL,
  `partner_name` varchar(128) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `partner_line_reference` varchar(128) NOT NULL,
  `partner_line_notes` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `upc` varchar(128) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `line_price_incl_tax` decimal(12,2) NOT NULL,
  `line_price_excl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_incl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_excl_tax` decimal(12,2) NOT NULL,
  `unit_cost_price` decimal(12,2) DEFAULT NULL,
  `unit_price_incl_tax` decimal(12,2) DEFAULT NULL,
  `unit_price_excl_tax` decimal(12,2) DEFAULT NULL,
  `unit_retail_price` decimal(12,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `est_dispatch_date` date DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stockrecord_id` int(11) DEFAULT NULL,
  `effective_contract_discount_percentage` decimal(8,5) DEFAULT NULL,
  `effective_contract_discounted_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_historicalline_history_user_id_0dc6d8a8_fk_ecommerce` (`history_user_id`),
  KEY `order_historicalline_id_394a6e5b` (`id`),
  KEY `order_historicalline_order_id_1721c6a7` (`order_id`),
  KEY `order_historicalline_partner_id_9fbeb68e` (`partner_id`),
  KEY `order_historicalline_product_id_647be269` (`product_id`),
  KEY `order_historicalline_stockrecord_id_d80d3743` (`stockrecord_id`),
  CONSTRAINT `order_historicalline_history_user_id_0dc6d8a8_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_historicalline`
--

LOCK TABLES `order_historicalline` WRITE;
/*!40000 ALTER TABLE `order_historicalline` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_historicalline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_historicalorder`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_historicalorder` (
  `id` int(11) NOT NULL,
  `number` varchar(128) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `total_incl_tax` decimal(12,2) NOT NULL,
  `total_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `status` varchar(100) NOT NULL,
  `guest_email` varchar(254) NOT NULL,
  `date_placed` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_historicalorde_history_user_id_107abb44_fk_ecommerce` (`history_user_id`),
  KEY `order_historicalorder_id_0c852165` (`id`),
  KEY `order_historicalorder_number_7d043fad` (`number`),
  KEY `order_historicalorder_date_placed_90b7b1d1` (`date_placed`),
  KEY `order_historicalorder_basket_id_dc4a6cab` (`basket_id`),
  KEY `order_historicalorder_billing_address_id_d7a6aea1` (`billing_address_id`),
  KEY `order_historicalorder_partner_id_cbdd0edb` (`partner_id`),
  KEY `order_historicalorder_shipping_address_id_9820772f` (`shipping_address_id`),
  KEY `order_historicalorder_site_id_b4bf684e` (`site_id`),
  KEY `order_historicalorder_user_id_731dcf92` (`user_id`),
  CONSTRAINT `order_historicalorde_history_user_id_107abb44_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_historicalorder`
--

LOCK TABLES `order_historicalorder` WRITE;
/*!40000 ALTER TABLE `order_historicalorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_historicalorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_historicalorderdiscount`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_historicalorderdiscount` (
  `id` int(11) NOT NULL,
  `category` varchar(64) NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `offer_name` varchar(128) NOT NULL,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `voucher_code` varchar(128) NOT NULL,
  `frequency` int(10) unsigned DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `message` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_historicalorde_history_user_id_a6bb38a1_fk_ecommerce` (`history_user_id`),
  KEY `order_historicalorderdiscount_id_e9cee7a5` (`id`),
  KEY `order_historicalorderdiscount_offer_name_8a2ab309` (`offer_name`),
  KEY `order_historicalorderdiscount_voucher_code_88be3366` (`voucher_code`),
  KEY `order_historicalorderdiscount_order_id_c77bc9d4` (`order_id`),
  CONSTRAINT `order_historicalorde_history_user_id_a6bb38a1_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_historicalorderdiscount`
--

LOCK TABLES `order_historicalorderdiscount` WRITE;
/*!40000 ALTER TABLE `order_historicalorderdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_historicalorderdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(128) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `partner_line_reference` varchar(128) NOT NULL,
  `partner_line_notes` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `upc` varchar(128) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `line_price_incl_tax` decimal(12,2) NOT NULL,
  `line_price_excl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_incl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_excl_tax` decimal(12,2) NOT NULL,
  `unit_cost_price` decimal(12,2) DEFAULT NULL,
  `unit_price_incl_tax` decimal(12,2) DEFAULT NULL,
  `unit_price_excl_tax` decimal(12,2) DEFAULT NULL,
  `unit_retail_price` decimal(12,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `est_dispatch_date` date DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stockrecord_id` int(11) DEFAULT NULL,
  `effective_contract_discount_percentage` decimal(8,5) DEFAULT NULL,
  `effective_contract_discounted_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_line_order_id_b9148391_fk_order_order_id` (`order_id`),
  KEY `order_line_partner_id_258a2fb9_fk_partner_partner_id` (`partner_id`),
  KEY `order_line_product_id_e620902d_fk_catalogue_product_id` (`product_id`),
  KEY `order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `order_line_order_id_b9148391_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_line_partner_id_258a2fb9_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `order_line_product_id_e620902d_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineattribute_line_id_adf6dd87_fk_order_line_id` (`line_id`),
  KEY `order_lineattribute_option_id_b54d597c_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `order_lineattribute_line_id_adf6dd87_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_lineattribute_option_id_b54d597c_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineattribute`
--

LOCK TABLES `order_lineattribute` WRITE;
/*!40000 ALTER TABLE `order_lineattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineprice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `price_incl_tax` decimal(12,2) NOT NULL,
  `price_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `line_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineprice_line_id_2de52446_fk_order_line_id` (`line_id`),
  KEY `order_lineprice_order_id_66792e56_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_lineprice_line_id_2de52446_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_lineprice_order_id_66792e56_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineprice`
--

LOCK TABLES `order_lineprice` WRITE;
/*!40000 ALTER TABLE `order_lineprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_lineprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `total_incl_tax` decimal(12,2) NOT NULL,
  `total_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `status` varchar(100) NOT NULL,
  `guest_email` varchar(254) NOT NULL,
  `date_placed` datetime(6) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `order_order_basket_id_8b0acbb2_fk_basket_basket_id` (`basket_id`),
  KEY `order_order_billing_address_id_8fe537cf_fk_order_bil` (`billing_address_id`),
  KEY `order_order_date_placed_506a9365` (`date_placed`),
  KEY `order_order_shipping_address_id_57e64931_fk_order_shi` (`shipping_address_id`),
  KEY `order_order_site_id_e27f3526_fk_django_site_id` (`site_id`),
  KEY `order_order_user_id_7cf9bc2b_fk_ecommerce_user_id` (`user_id`),
  KEY `order_order_partner_id_0195eb6a_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `order_order_basket_id_8b0acbb2_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `order_order_billing_address_id_8fe537cf_fk_order_bil` FOREIGN KEY (`billing_address_id`) REFERENCES `order_billingaddress` (`id`),
  CONSTRAINT `order_order_partner_id_0195eb6a_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `order_order_shipping_address_id_57e64931_fk_order_shi` FOREIGN KEY (`shipping_address_id`) REFERENCES `order_shippingaddress` (`id`),
  CONSTRAINT `order_order_site_id_e27f3526_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `order_order_user_id_7cf9bc2b_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdiscount`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdiscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `offer_name` varchar(128) NOT NULL,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `voucher_code` varchar(128) NOT NULL,
  `frequency` int(10) unsigned DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `message` longtext NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdiscount_order_id_bc91e123_fk_order_order_id` (`order_id`),
  KEY `order_orderdiscount_offer_name_706d6119` (`offer_name`),
  KEY `order_orderdiscount_voucher_code_6ee4f360` (`voucher_code`),
  CONSTRAINT `order_orderdiscount_order_id_bc91e123_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdiscount`
--

LOCK TABLES `order_orderdiscount` WRITE;
/*!40000 ALTER TABLE `order_orderdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordernote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ordernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_type` varchar(128) NOT NULL,
  `message` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ordernote_order_id_7d97583d_fk_order_order_id` (`order_id`),
  KEY `order_ordernote_user_id_48d7a672_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `order_ordernote_order_id_7d97583d_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_ordernote_user_id_48d7a672_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordernote`
--

LOCK TABLES `order_ordernote` WRITE;
/*!40000 ALTER TABLE `order_ordernote` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_ordernote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderstatuschange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderstatuschange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_status` varchar(100) NOT NULL,
  `new_status` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderstatuschange_order_id_43efdbe5_fk_order_order_id` (`order_id`),
  KEY `order_orderstatuschange_date_created_a5107b93` (`date_created`),
  CONSTRAINT `order_orderstatuschange_order_id_43efdbe5_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderstatuschange`
--

LOCK TABLES `order_orderstatuschange` WRITE;
/*!40000 ALTER TABLE `order_orderstatuschange` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderstatuschange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymentevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymentevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipping_event_id` int(11) DEFAULT NULL,
  `processor_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_paymentevent_event_type_id_568c7161_fk_order_pay` (`event_type_id`),
  KEY `order_paymentevent_order_id_395b3e82_fk_order_order_id` (`order_id`),
  KEY `order_paymentevent_shipping_event_id_213dcfb8_fk_order_shi` (`shipping_event_id`),
  KEY `order_paymentevent_date_created_05d8c079` (`date_created`),
  CONSTRAINT `order_paymentevent_event_type_id_568c7161_fk_order_pay` FOREIGN KEY (`event_type_id`) REFERENCES `order_paymenteventtype` (`id`),
  CONSTRAINT `order_paymentevent_order_id_395b3e82_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_paymentevent_shipping_event_id_213dcfb8_fk_order_shi` FOREIGN KEY (`shipping_event_id`) REFERENCES `order_shippingevent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymentevent`
--

LOCK TABLES `order_paymentevent` WRITE;
/*!40000 ALTER TABLE `order_paymentevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_paymentevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventquantity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_paymenteventquantity_event_id_line_id_765c5209_uniq` (`event_id`,`line_id`),
  KEY `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_paymenteventqu_event_id_a540165a_fk_order_pay` FOREIGN KEY (`event_id`) REFERENCES `order_paymentevent` (`id`),
  CONSTRAINT `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventquantity`
--

LOCK TABLES `order_paymenteventquantity` WRITE;
/*!40000 ALTER TABLE `order_paymenteventquantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_paymenteventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventtype`
--

LOCK TABLES `order_paymenteventtype` WRITE;
/*!40000 ALTER TABLE `order_paymenteventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_paymenteventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingaddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `notes` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippingaddres_country_id_29abf9a0_fk_address_c` (`country_id`),
  CONSTRAINT `order_shippingaddres_country_id_29abf9a0_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingaddress`
--

LOCK TABLES `order_shippingaddress` WRITE;
/*!40000 ALTER TABLE `order_shippingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippingevent_event_type_id_9f1efb20_fk_order_shi` (`event_type_id`),
  KEY `order_shippingevent_order_id_8c031fb6_fk_order_order_id` (`order_id`),
  KEY `order_shippingevent_date_created_74c4a6fa` (`date_created`),
  CONSTRAINT `order_shippingevent_event_type_id_9f1efb20_fk_order_shi` FOREIGN KEY (`event_type_id`) REFERENCES `order_shippingeventtype` (`id`),
  CONSTRAINT `order_shippingevent_order_id_8c031fb6_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingevent`
--

LOCK TABLES `order_shippingevent` WRITE;
/*!40000 ALTER TABLE `order_shippingevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventquantity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_shippingeventquantity_event_id_line_id_91687107_uniq` (`event_id`,`line_id`),
  KEY `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_shippingeventq_event_id_1c7fb9c7_fk_order_shi` FOREIGN KEY (`event_id`) REFERENCES `order_shippingevent` (`id`),
  CONSTRAINT `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventquantity`
--

LOCK TABLES `order_shippingeventquantity` WRITE;
/*!40000 ALTER TABLE `order_shippingeventquantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingeventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventtype`
--

LOCK TABLES `order_shippingeventtype` WRITE;
/*!40000 ALTER TABLE `order_shippingeventtype` DISABLE KEYS */;
INSERT INTO `order_shippingeventtype` VALUES (1,'Shipped','shipped');
/*!40000 ALTER TABLE `order_shippingeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_historicalpartner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_historicalpartner` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `enable_sailthru` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `default_site_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `partner_historicalpa_history_user_id_971ab75b_fk_ecommerce` (`history_user_id`),
  KEY `partner_historicalpartner_id_4955c403` (`id`),
  KEY `partner_historicalpartner_short_code_d8d60225` (`short_code`),
  KEY `partner_historicalpartner_default_site_id_8f53b529` (`default_site_id`),
  KEY `partner_historicalpartner_name_63933fe9` (`name`),
  CONSTRAINT `partner_historicalpa_history_user_id_971ab75b_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_historicalpartner`
--

LOCK TABLES `partner_historicalpartner` WRITE;
/*!40000 ALTER TABLE `partner_historicalpartner` DISABLE KEYS */;
INSERT INTO `partner_historicalpartner` VALUES (1,'','',1,1,'2020-04-07 13:55:39.353524',NULL,'+',NULL,NULL),(1,'Open edX','edX',1,2,'2020-04-07 13:55:39.564528',NULL,'~',1,NULL),(1,'Open edX','edX',1,3,'2020-04-07 14:54:22.339667',NULL,'~',1,NULL);
/*!40000 ALTER TABLE `partner_historicalpartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_historicalstockrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_historicalstockrecord` (
  `id` int(11) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_retail` decimal(12,2) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `num_in_stock` int(10) unsigned DEFAULT NULL,
  `num_allocated` int(11) DEFAULT NULL,
  `low_stock_threshold` int(10) unsigned DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `partner_historicalst_history_user_id_eda90769_fk_ecommerce` (`history_user_id`),
  KEY `partner_historicalstockrecord_id_e529b9d7` (`id`),
  KEY `partner_historicalstockrecord_date_updated_d81f5712` (`date_updated`),
  KEY `partner_historicalstockrecord_partner_id_5369caa8` (`partner_id`),
  KEY `partner_historicalstockrecord_product_id_e2905583` (`product_id`),
  CONSTRAINT `partner_historicalst_history_user_id_eda90769_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_historicalstockrecord`
--

LOCK TABLES `partner_historicalstockrecord` WRITE;
/*!40000 ALTER TABLE `partner_historicalstockrecord` DISABLE KEYS */;
INSERT INTO `partner_historicalstockrecord` VALUES (1,'68EFFFF','USD',0.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.435852','2020-04-07 13:55:47.435956',1,'2020-04-07 13:55:47.437159',NULL,'+',NULL,1,2),(2,'A5B6DBE','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.702415','2020-04-07 13:55:47.702468',2,'2020-04-07 13:55:47.703097',NULL,'+',NULL,1,4),(3,'8CF08E5','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.741584','2020-04-07 13:55:47.741640',3,'2020-04-07 13:55:47.742236',NULL,'+',NULL,1,3),(1,'68EFFFF','USD',0.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.435852','2020-04-07 14:54:29.558941',4,'2020-04-07 14:54:29.603166',NULL,'~',NULL,1,2),(2,'A5B6DBE','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.702415','2020-04-07 14:54:29.741175',5,'2020-04-07 14:54:29.742039',NULL,'~',NULL,1,4),(3,'8CF08E5','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.741584','2020-04-07 14:54:29.760339',6,'2020-04-07 14:54:29.761289',NULL,'~',NULL,1,3);
/*!40000 ALTER TABLE `partner_historicalstockrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `enable_sailthru` tinyint(1) NOT NULL,
  `default_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `short_code` (`short_code`),
  UNIQUE KEY `default_site_id` (`default_site_id`),
  KEY `partner_partner_name_caa0c2ee` (`name`),
  CONSTRAINT `partner_partner_default_site_id_c5e08da3_fk_django_site_id` FOREIGN KEY (`default_site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner`
--

LOCK TABLES `partner_partner` WRITE;
/*!40000 ALTER TABLE `partner_partner` DISABLE KEYS */;
INSERT INTO `partner_partner` VALUES (1,'edX','Open edX','edX',1,1);
/*!40000 ALTER TABLE `partner_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_partner_users_partner_id_user_id_9e5c0517_uniq` (`partner_id`,`user_id`),
  KEY `partner_partner_users_user_id_d75d6e40_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `partner_partner_users_partner_id_1883dfd9_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_partner_users_user_id_d75d6e40_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner_users`
--

LOCK TABLES `partner_partner_users` WRITE;
/*!40000 ALTER TABLE `partner_partner_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_partner_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partneraddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partneraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_partneraddre_country_id_02c4f979_fk_address_c` (`country_id`),
  KEY `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `partner_partneraddre_country_id_02c4f979_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partneraddress`
--

LOCK TABLES `partner_partneraddress` WRITE;
/*!40000 ALTER TABLE `partner_partneraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_partneraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockalert`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threshold` int(10) unsigned NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_stockalert_stockrecord_id_68ad503a_fk_partner_s` (`stockrecord_id`),
  KEY `partner_stockalert_date_created_832cf043` (`date_created`),
  CONSTRAINT `partner_stockalert_stockrecord_id_68ad503a_fk_partner_s` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockalert`
--

LOCK TABLES `partner_stockalert` WRITE;
/*!40000 ALTER TABLE `partner_stockalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_stockalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_sku` varchar(128) NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_retail` decimal(12,2) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `num_in_stock` int(10) unsigned DEFAULT NULL,
  `num_allocated` int(11) DEFAULT NULL,
  `low_stock_threshold` int(10) unsigned DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_stockrecord_partner_id_partner_sku_8441e010_uniq` (`partner_id`,`partner_sku`),
  KEY `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` (`product_id`),
  KEY `partner_stockrecord_date_updated_e6ae5f14` (`date_updated`),
  CONSTRAINT `partner_stockrecord_partner_id_4155a586_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockrecord`
--

LOCK TABLES `partner_stockrecord` WRITE;
/*!40000 ALTER TABLE `partner_stockrecord` DISABLE KEYS */;
INSERT INTO `partner_stockrecord` VALUES (1,'68EFFFF','USD',0.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.435852','2020-04-07 14:54:29.558941',1,2),(2,'A5B6DBE','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.702415','2020-04-07 14:54:29.741175',1,4),(3,'8CF08E5','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2020-04-07 13:55:47.741584','2020-04-07 14:54:29.760339',1,3);
/*!40000 ALTER TABLE `partner_stockrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_bankcard`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(32) NOT NULL,
  `expiry_date` date NOT NULL,
  `partner_reference` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_bankcard_user_id_08e1d04c_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `payment_bankcard_user_id_08e1d04c_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_bankcard`
--

LOCK TABLES `payment_bankcard` WRITE;
/*!40000 ALTER TABLE `payment_bankcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_bankcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_enterprisecontractmetadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_enterprisecontractmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `amount_paid` decimal(12,2) DEFAULT NULL,
  `discount_value` decimal(15,5) DEFAULT NULL,
  `discount_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_enterprisecontractmetadata`
--

LOCK TABLES `payment_enterprisecontractmetadata` WRITE;
/*!40000 ALTER TABLE `payment_enterprisecontractmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_enterprisecontractmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymentprocessorresponse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paymentprocessorresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `processor_name` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `response` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_paymentprocessorr_processor_name_transactio_c62034f3_idx` (`processor_name`,`transaction_id`),
  KEY `payment_paymentproce_basket_id_ff3d36a2_fk_basket_ba` (`basket_id`),
  KEY `payment_paymentprocessorresponse_created_412fdf33` (`created`),
  CONSTRAINT `payment_paymentproce_basket_id_ff3d36a2_fk_basket_ba` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymentprocessorresponse`
--

LOCK TABLES `payment_paymentprocessorresponse` WRITE;
/*!40000 ALTER TABLE `payment_paymentprocessorresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paymentprocessorresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paypalprocessorconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paypalprocessorconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retry_attempts` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paypalprocessorconfiguration`
--

LOCK TABLES `payment_paypalprocessorconfiguration` WRITE;
/*!40000 ALTER TABLE `payment_paypalprocessorconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paypalprocessorconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paypalwebprofile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paypalwebprofile` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paypalwebprofile`
--

LOCK TABLES `payment_paypalwebprofile` WRITE;
/*!40000 ALTER TABLE `payment_paypalwebprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paypalwebprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sdncheckfailure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sdncheckfailure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `sdn_check_response` longtext NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `city` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_sdncheckfailure_site_id_202cf400_fk_django_site_id` (`site_id`),
  CONSTRAINT `payment_sdncheckfailure_site_id_202cf400_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sdncheckfailure`
--

LOCK TABLES `payment_sdncheckfailure` WRITE;
/*!40000 ALTER TABLE `payment_sdncheckfailure` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sdncheckfailure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sdncheckfailure_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sdncheckfailure_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sdncheckfailure_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_sdncheckfailure__sdncheckfailure_id_produ_5e39885c_uniq` (`sdncheckfailure_id`,`product_id`),
  KEY `payment_sdncheckfail_product_id_6d431270_fk_catalogue` (`product_id`),
  CONSTRAINT `payment_sdncheckfail_product_id_6d431270_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `payment_sdncheckfail_sdncheckfailure_id_a8c1f0d4_fk_payment_s` FOREIGN KEY (`sdncheckfailure_id`) REFERENCES `payment_sdncheckfailure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sdncheckfailure_products`
--

LOCK TABLES `payment_sdncheckfailure_products` WRITE;
/*!40000 ALTER TABLE `payment_sdncheckfailure_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sdncheckfailure_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_source`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(12) NOT NULL,
  `amount_allocated` decimal(12,2) NOT NULL,
  `amount_debited` decimal(12,2) NOT NULL,
  `amount_refunded` decimal(12,2) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `label` varchar(128) NOT NULL,
  `order_id` int(11) NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_source_order_id_6b7f2215_fk_order_order_id` (`order_id`),
  KEY `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` (`source_type_id`),
  CONSTRAINT `payment_source_order_id_6b7f2215_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` FOREIGN KEY (`source_type_id`) REFERENCES `payment_sourcetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_source`
--

LOCK TABLES `payment_source` WRITE;
/*!40000 ALTER TABLE `payment_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sourcetype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sourcetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sourcetype`
--

LOCK TABLES `payment_sourcetype` WRITE;
/*!40000 ALTER TABLE `payment_sourcetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_type` varchar(128) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_transaction_source_id_c5ac31e8_fk_payment_source_id` (`source_id`),
  KEY `payment_transaction_date_created_f887f6bc` (`date_created`),
  CONSTRAINT `payment_transaction_source_id_c5ac31e8_fk_payment_source_id` FOREIGN KEY (`source_id`) REFERENCES `payment_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals_referral`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals_referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `utm_campaign` varchar(255) NOT NULL,
  `utm_content` varchar(255) NOT NULL,
  `utm_created_at` datetime(6) DEFAULT NULL,
  `utm_medium` varchar(255) NOT NULL,
  `utm_source` varchar(255) NOT NULL,
  `utm_term` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_id` (`basket_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `referrals_referral_site_id_2ba3a624_fk_django_site_id` (`site_id`),
  CONSTRAINT `referrals_referral_basket_id_25e1749e_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `referrals_referral_order_id_170fad6d_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `referrals_referral_site_id_2ba3a624_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals_referral`
--

LOCK TABLES `referrals_referral` WRITE;
/*!40000 ALTER TABLE `referrals_referral` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals_referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_historicalrefund`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_historicalrefund` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `total_credit_excl_tax` decimal(12,2) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `refund_historicalref_history_user_id_c1853b09_fk_ecommerce` (`history_user_id`),
  KEY `refund_historicalrefund_id_6b2753a1` (`id`),
  KEY `refund_historicalrefund_order_id_1d9b0b20` (`order_id`),
  KEY `refund_historicalrefund_user_id_142a3c52` (`user_id`),
  CONSTRAINT `refund_historicalref_history_user_id_c1853b09_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_historicalrefund`
--

LOCK TABLES `refund_historicalrefund` WRITE;
/*!40000 ALTER TABLE `refund_historicalrefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_historicalrefund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_historicalrefundline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_historicalrefundline` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `line_credit_excl_tax` decimal(12,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_line_id` int(11) DEFAULT NULL,
  `refund_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `refund_historicalref_history_user_id_1b172964_fk_ecommerce` (`history_user_id`),
  KEY `refund_historicalrefundline_id_b5dd937d` (`id`),
  KEY `refund_historicalrefundline_order_line_id_59524c13` (`order_line_id`),
  KEY `refund_historicalrefundline_refund_id_487db801` (`refund_id`),
  CONSTRAINT `refund_historicalref_history_user_id_1b172964_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_historicalrefundline`
--

LOCK TABLES `refund_historicalrefundline` WRITE;
/*!40000 ALTER TABLE `refund_historicalrefundline` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_historicalrefundline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_refund`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `total_credit_excl_tax` decimal(12,2) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `status` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_refund_order_id_44bf4b92_fk_order_order_id` (`order_id`),
  KEY `refund_refund_user_id_f10f8f2a_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `refund_refund_order_id_44bf4b92_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `refund_refund_user_id_f10f8f2a_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_refund`
--

LOCK TABLES `refund_refund` WRITE;
/*!40000 ALTER TABLE `refund_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_refundline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_refundline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `line_credit_excl_tax` decimal(12,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `order_line_id` int(11) NOT NULL,
  `refund_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_refundline_order_line_id_f775827b_fk_order_line_id` (`order_line_id`),
  KEY `refund_refundline_refund_id_a1fc3ad0_fk_refund_refund_id` (`refund_id`),
  CONSTRAINT `refund_refundline_order_line_id_f775827b_fk_order_line_id` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `refund_refundline_refund_id_a1fc3ad0_fk_refund_refund_id` FOREIGN KEY (`refund_id`) REFERENCES `refund_refund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_refundline`
--

LOCK TABLES `refund_refundline` WRITE;
/*!40000 ALTER TABLE `refund_refundline` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_refundline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_productreview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_productreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `homepage` varchar(200) NOT NULL,
  `status` smallint(6) NOT NULL,
  `total_votes` int(11) NOT NULL,
  `delta_votes` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_productreview_product_id_user_id_c4fdc4cd_uniq` (`product_id`,`user_id`),
  KEY `reviews_productreview_user_id_8acb5ddd_fk_ecommerce_user_id` (`user_id`),
  KEY `reviews_productreview_delta_votes_bd8ffc87` (`delta_votes`),
  CONSTRAINT `reviews_productrevie_product_id_52e52a32_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `reviews_productreview_user_id_8acb5ddd_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_productreview`
--

LOCK TABLES `reviews_productreview` WRITE;
/*!40000 ALTER TABLE `reviews_productreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_productreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_vote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delta` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_vote_user_id_review_id_bb858939_uniq` (`user_id`,`review_id`),
  KEY `reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id` (`review_id`),
  CONSTRAINT `reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id` FOREIGN KEY (`review_id`) REFERENCES `reviews_productreview` (`id`),
  CONSTRAINT `reviews_vote_user_id_5fb87b53_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_vote`
--

LOCK TABLES `reviews_vote` WRITE;
/*!40000 ALTER TABLE `reviews_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `price_per_order` decimal(12,2) NOT NULL,
  `price_per_item` decimal(12,2) NOT NULL,
  `free_shipping_threshold` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges`
--

LOCK TABLES `shipping_orderanditemcharges` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges_countries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderanditemcharges_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_orderanditemcha_orderanditemcharges_id_c_9f0c9c8f_uniq` (`orderanditemcharges_id`,`country_id`),
  KEY `shipping_orderandite_country_id_30387f2e_fk_address_c` (`country_id`),
  CONSTRAINT `shipping_orderandite_country_id_30387f2e_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_orderandite_orderanditemcharges__bf5bfee9_fk_shipping_` FOREIGN KEY (`orderanditemcharges_id`) REFERENCES `shipping_orderanditemcharges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges_countries`
--

LOCK TABLES `shipping_orderanditemcharges_countries` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightband`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightband` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upper_limit` decimal(12,3) NOT NULL,
  `charge` decimal(12,2) NOT NULL,
  `method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_weightband_method_id_b699a1ba_fk_shipping_` (`method_id`),
  KEY `shipping_weightband_upper_limit_9edc5097` (`upper_limit`),
  CONSTRAINT `shipping_weightband_method_id_b699a1ba_fk_shipping_` FOREIGN KEY (`method_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightband`
--

LOCK TABLES `shipping_weightband` WRITE;
/*!40000 ALTER TABLE `shipping_weightband` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightband` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `default_weight` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased`
--

LOCK TABLES `shipping_weightbased` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased_countries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weightbased_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_weightbased_cou_weightbased_id_country_i_de8c5e42_uniq` (`weightbased_id`,`country_id`),
  KEY `shipping_weightbased_country_id_06117384_fk_address_c` (`country_id`),
  CONSTRAINT `shipping_weightbased_country_id_06117384_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_weightbased_weightbased_id_93e3132f_fk_shipping_` FOREIGN KEY (`weightbased_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased_countries`
--

LOCK TABLES `shipping_weightbased_countries` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased_countries` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
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
-- Table structure for table `voucher_couponvouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_couponvouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_couponvouche_coupon_id_44356128_fk_catalogue` (`coupon_id`),
  CONSTRAINT `voucher_couponvouche_coupon_id_44356128_fk_catalogue` FOREIGN KEY (`coupon_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_couponvouchers`
--

LOCK TABLES `voucher_couponvouchers` WRITE;
/*!40000 ALTER TABLE `voucher_couponvouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_couponvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_couponvouchers_vouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_couponvouchers_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponvouchers_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_couponvouchers_v_couponvouchers_id_vouche_390b5a38_uniq` (`couponvouchers_id`,`voucher_id`),
  KEY `voucher_couponvouche_voucher_id_d5507ed9_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_couponvouche_couponvouchers_id_ebe4c993_fk_voucher_c` FOREIGN KEY (`couponvouchers_id`) REFERENCES `voucher_couponvouchers` (`id`),
  CONSTRAINT `voucher_couponvouche_voucher_id_d5507ed9_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_couponvouchers_vouchers`
--

LOCK TABLES `voucher_couponvouchers_vouchers` WRITE;
/*!40000 ALTER TABLE `voucher_couponvouchers_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_couponvouchers_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_historicalvoucherapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_historicalvoucherapplication` (
  `id` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `voucher_historicalvo_history_user_id_add45a08_fk_ecommerce` (`history_user_id`),
  KEY `voucher_historicalvoucherapplication_id_f6cc2df0` (`id`),
  KEY `voucher_historicalvoucherapplication_order_id_c8a880a6` (`order_id`),
  KEY `voucher_historicalvoucherapplication_user_id_0dc6e29e` (`user_id`),
  KEY `voucher_historicalvoucherapplication_voucher_id_529f437b` (`voucher_id`),
  CONSTRAINT `voucher_historicalvo_history_user_id_add45a08_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_historicalvoucherapplication`
--

LOCK TABLES `voucher_historicalvoucherapplication` WRITE;
/*!40000 ALTER TABLE `voucher_historicalvoucherapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_historicalvoucherapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_orderlinevouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_orderlinevouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_orderlinevouchers_line_id_fa3dbd8e_fk_order_line_id` (`line_id`),
  CONSTRAINT `voucher_orderlinevouchers_line_id_fa3dbd8e_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_orderlinevouchers`
--

LOCK TABLES `voucher_orderlinevouchers` WRITE;
/*!40000 ALTER TABLE `voucher_orderlinevouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_orderlinevouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_orderlinevouchers_vouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_orderlinevouchers_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderlinevouchers_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_orderlinevoucher_orderlinevouchers_id_vou_2a30647d_uniq` (`orderlinevouchers_id`,`voucher_id`),
  KEY `voucher_orderlinevou_voucher_id_b8820f35_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_orderlinevou_orderlinevouchers_id_c916ee3a_fk_voucher_o` FOREIGN KEY (`orderlinevouchers_id`) REFERENCES `voucher_orderlinevouchers` (`id`),
  CONSTRAINT `voucher_orderlinevou_voucher_id_b8820f35_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_orderlinevouchers_vouchers`
--

LOCK TABLES `voucher_orderlinevouchers_vouchers` WRITE;
/*!40000 ALTER TABLE `voucher_orderlinevouchers_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_orderlinevouchers_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `usage` varchar(128) NOT NULL,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `voucher_set_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `voucher_voucher_voucher_set_id_17b96a54_fk_voucher_voucherset_id` (`voucher_set_id`),
  KEY `voucher_voucher_end_datetime_db182297` (`end_datetime`),
  KEY `voucher_voucher_start_datetime_bfb7df84` (`start_datetime`),
  CONSTRAINT `voucher_voucher_voucher_set_id_17b96a54_fk_voucher_voucherset_id` FOREIGN KEY (`voucher_set_id`) REFERENCES `voucher_voucherset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher`
--

LOCK TABLES `voucher_voucher` WRITE;
/*!40000 ALTER TABLE `voucher_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher_offers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `conditionaloffer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_voucher_offers_voucher_id_conditionalof_01628a7f_uniq` (`voucher_id`,`conditionaloffer_id`),
  KEY `voucher_voucher_offe_conditionaloffer_id_f9682bfb_fk_offer_con` (`conditionaloffer_id`),
  CONSTRAINT `voucher_voucher_offe_conditionaloffer_id_f9682bfb_fk_offer_con` FOREIGN KEY (`conditionaloffer_id`) REFERENCES `offer_conditionaloffer` (`id`),
  CONSTRAINT `voucher_voucher_offers_voucher_id_7f9c575d_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher_offers`
--

LOCK TABLES `voucher_voucher_offers` WRITE;
/*!40000 ALTER TABLE `voucher_voucher_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucherapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucherapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` (`order_id`),
  KEY `voucher_voucherapplication_user_id_df53a393_fk_ecommerce_user_id` (`user_id`),
  KEY `voucher_voucherappli_voucher_id_5204edb7_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_voucherappli_voucher_id_5204edb7_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`),
  CONSTRAINT `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `voucher_voucherapplication_user_id_df53a393_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucherapplication`
--

LOCK TABLES `voucher_voucherapplication` WRITE;
/*!40000 ALTER TABLE `voucher_voucherapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucherapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucherset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucherset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `code_length` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_id` (`offer_id`),
  CONSTRAINT `voucher_voucherset_offer_id_1d10d5d6_fk_offer_con` FOREIGN KEY (`offer_id`) REFERENCES `offer_conditionaloffer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucherset`
--

LOCK TABLES `voucher_voucherset` WRITE;
/*!40000 ALTER TABLE `voucher_voucherset` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucherset` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
INSERT INTO `waffle_flag` VALUES (1,'use_enterprise_catalog',NULL,NULL,0,0,0,0,'',0,'','2020-04-07 13:48:53.941056','2020-04-07 13:48:53.941069'),(2,'enable_client_side_checkout',1,NULL,0,1,0,0,'',0,'This flag determines if the integrated/client-side checkout flow should be enabled.','2020-04-07 13:50:08.300031','2020-04-07 14:54:29.162553'),(3,'disable_microfrontend_for_basket_page',NULL,NULL,0,0,0,0,'',0,'','2020-04-07 13:50:15.916045','2020-04-07 13:50:15.916058');
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
  KEY `waffle_flag_users_user_id_8026df9b_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `waffle_flag_users_flag_id_833c37b0_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_users_user_id_8026df9b_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample`
--

LOCK TABLES `waffle_sample` WRITE;
/*!40000 ALTER TABLE `waffle_sample` DISABLE KEYS */;
INSERT INTO `waffle_sample` VALUES (1,'async_order_fulfillment',0.0,'Determines what percentage of orders are fulfilled asynchronously.','2020-04-07 13:47:55.692952','2020-04-07 13:47:55.692966');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch`
--

LOCK TABLES `waffle_switch` WRITE;
/*!40000 ALTER TABLE `waffle_switch` DISABLE KEYS */;
INSERT INTO `waffle_switch` VALUES (1,'publish_course_modes_to_lms',1,'','2020-04-07 13:47:53.098128','2020-04-07 13:47:53.098141'),(4,'enable_user_list_view',1,'','2020-04-07 13:48:14.233302','2020-04-07 13:48:14.233314'),(6,'enable_enterprise_on_runtime',0,'','2020-04-07 13:48:52.267919','2020-04-07 13:48:52.267952'),(9,'hubspot_forms_integration_enable',0,'','2020-04-07 13:48:56.956195','2020-04-07 13:48:56.956208'),(10,'enable_order_list_view',1,'','2020-04-07 13:49:11.433863','2020-04-07 13:49:11.433877'),(11,'disable_repeat_order_check',0,'','2020-04-07 13:49:11.650347','2020-04-07 13:49:11.650361'),(12,'payment_processor_active_cybersource',1,'','2020-04-07 13:50:07.265874','2020-04-07 13:50:07.265888'),(13,'payment_processor_active_paypal',1,'','2020-04-07 13:50:07.266715','2020-04-07 13:50:07.266724'),(14,'payment_processor_active_stripe',1,'','2020-04-07 13:50:15.522026','2020-04-07 13:50:15.522040'),(15,'enable_refund_list_view',1,'','2020-04-07 13:51:38.998642','2020-04-07 13:51:38.998666'),(16,'sailthru_enable',0,'','2020-04-07 13:51:49.665869','2020-04-07 13:51:49.665883');
/*!40000 ALTER TABLE `waffle_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_line`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `wishlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_line_wishlist_id_product_id_78f04673_uniq` (`wishlist_id`,`product_id`),
  KEY `wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `wishlists_line_wishlist_id_4cffe302_fk_wishlists_wishlist_id` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists_wishlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_line`
--

LOCK TABLES `wishlists_line` WRITE;
/*!40000 ALTER TABLE `wishlists_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_wishlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(6) NOT NULL,
  `visibility` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `wishlists_wishlist_owner_id_d5464c62_fk_ecommerce_user_id` (`owner_id`),
  KEY `wishlists_wishlist_date_created_c05d5e7f` (`date_created`),
  CONSTRAINT `wishlists_wishlist_owner_id_d5464c62_fk_ecommerce_user_id` FOREIGN KEY (`owner_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_wishlist`
--

LOCK TABLES `wishlists_wishlist` WRITE;
/*!40000 ALTER TABLE `wishlists_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-07 15:39:24
