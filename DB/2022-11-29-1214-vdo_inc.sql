-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: vdo_inc
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `carburants`
--

DROP TABLE IF EXISTS `carburants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carburants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carburants`
--

LOCK TABLES `carburants` WRITE;
/*!40000 ALTER TABLE `carburants` DISABLE KEYS */;
INSERT INTO `carburants` VALUES (1,'essence','gasoline'),(2,'diesel','diesel');
/*!40000 ALTER TABLE `carburants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commandes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint unsigned NOT NULL,
  `numero_transaction` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mode_paiements_id` bigint NOT NULL,
  `mode_expeditions_id` bigint NOT NULL,
  `statut_commandes_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factures_users1_idx` (`users_id`),
  KEY `fk_factures_mode_paiement1_idx` (`mode_paiements_id`),
  KEY `fk_factures_mode_expedition1_idx` (`mode_expeditions_id`),
  KEY `fk_commandes_statut_commandes1_idx` (`statut_commandes_id`),
  CONSTRAINT `fk_commandes_mode_expeditions1` FOREIGN KEY (`mode_expeditions_id`) REFERENCES `mode_expeditions` (`id`),
  CONSTRAINT `fk_commandes_mode_paiements1` FOREIGN KEY (`mode_paiements_id`) REFERENCES `mode_paiements` (`id`),
  CONSTRAINT `fk_commandes_statut_commandes1` FOREIGN KEY (`statut_commandes_id`) REFERENCES `statut_commandes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constructeurs`
--

DROP TABLE IF EXISTS `constructeurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructeurs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructeurs`
--

LOCK TABLES `constructeurs` WRITE;
/*!40000 ALTER TABLE `constructeurs` DISABLE KEYS */;
INSERT INTO `constructeurs` VALUES (1,'Volkswagen'),(2,'Toyota'),(3,'Ford'),(4,'Hyundai');
/*!40000 ALTER TABLE `constructeurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corps`
--

DROP TABLE IF EXISTS `corps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corps` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corps`
--

LOCK TABLES `corps` WRITE;
/*!40000 ALTER TABLE `corps` DISABLE KEYS */;
INSERT INTO `corps` VALUES (1,'berline','sedan'),(2,'cabriolet','convertible'),(3,'camion','truck'),(4,'commercial','commercial'),(5,'coupé','coupe'),(6,'familiale','wagon'),(7,'fourgonnette','minivan'),(8,'à hayon','hatchback'),(9,'VUS','SUV');
/*!40000 ALTER TABLE `corps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etats`
--

DROP TABLE IF EXISTS `etats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etats`
--

LOCK TABLES `etats` WRITE;
/*!40000 ALTER TABLE `etats` DISABLE KEYS */;
INSERT INTO `etats` VALUES (1,'parfait','perfect'),(2,'excellent','excellent'),(3,'bon','good'),(4,'moyen','fair'),(5,'pauvre','poor');
/*!40000 ALTER TABLE `etats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe_motopropulseurs`
--

DROP TABLE IF EXISTS `groupe_motopropulseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupe_motopropulseurs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe_motopropulseurs`
--

LOCK TABLES `groupe_motopropulseurs` WRITE;
/*!40000 ALTER TABLE `groupe_motopropulseurs` DISABLE KEYS */;
INSERT INTO `groupe_motopropulseurs` VALUES (1,'2 roues motrices','two-wheel drive'),(2,'4 roues motrice','four-wheel drive'),(3,'traction arrière','rear-wheel drive'),(4,'traction avant','front-wheel drive'),(5,'traction intégrale','all-wheel drive');
/*!40000 ALTER TABLE `groupe_motopropulseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `nom_en` varchar(255) DEFAULT NULL,
  `chemin` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `alt_en` varchar(255) DEFAULT NULL,
  `image_principale` tinyint NOT NULL,
  `voitures_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_voiture1_idx` (`voitures_id`),
  CONSTRAINT `fk_images_voitures1` FOREIGN KEY (`voitures_id`) REFERENCES `voitures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `users_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_journals_users1_idx` (`users_id`),
  CONSTRAINT `fk_journals_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_expeditions`
--

DROP TABLE IF EXISTS `mode_expeditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mode_expeditions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_expeditions`
--

LOCK TABLES `mode_expeditions` WRITE;
/*!40000 ALTER TABLE `mode_expeditions` DISABLE KEYS */;
INSERT INTO `mode_expeditions` VALUES (1,'livraison','delivery'),(2,'ramassage','pick up');
/*!40000 ALTER TABLE `mode_expeditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_paiements`
--

DROP TABLE IF EXISTS `mode_paiements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mode_paiements` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_paiements`
--

LOCK TABLES `mode_paiements` WRITE;
/*!40000 ALTER TABLE `mode_paiements` DISABLE KEYS */;
INSERT INTO `mode_paiements` VALUES (12,'comptant','cash'),(13,'débit','debit'),(14,'crédit','credit'),(15,'Paypal','Paypal'),(16,'virement bancaire','bank transfer');
/*!40000 ALTER TABLE `mode_paiements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeles`
--

DROP TABLE IF EXISTS `modeles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modeles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `constructeurs_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modeles_constructeurs1_idx` (`constructeurs_id`),
  CONSTRAINT `fk_modeles_constructeurs1` FOREIGN KEY (`constructeurs_id`) REFERENCES `constructeurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeles`
--

LOCK TABLES `modeles` WRITE;
/*!40000 ALTER TABLE `modeles` DISABLE KEYS */;
INSERT INTO `modeles` VALUES (1,'Golf',1),(2,'Tiguan',1),(3,'Corolla GR',2),(4,'RAV4',2),(5,'F150',3),(6,'Bronco',3),(7,'IONIQ 6',4),(8,'Tucson',4);
/*!40000 ALTER TABLE `modeles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'client','client'),(2,'employé','employee'),(3,'administrateur','admin');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `nom_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Québec','Quebec'),(2,'Nouvelle-Écosse','Nova Scotia'),(3,'Ontario','Ontario');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statut_commandes`
--

DROP TABLE IF EXISTS `statut_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statut_commandes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statut_commandes`
--

LOCK TABLES `statut_commandes` WRITE;
/*!40000 ALTER TABLE `statut_commandes` DISABLE KEYS */;
INSERT INTO `statut_commandes` VALUES (1,'en attente','pending'),(2,'facturé','invoided'),(3,'payé','payed');
/*!40000 ALTER TABLE `statut_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statut_voitures`
--

DROP TABLE IF EXISTS `statut_voitures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statut_voitures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statut_voitures`
--

LOCK TABLES `statut_voitures` WRITE;
/*!40000 ALTER TABLE `statut_voitures` DISABLE KEYS */;
INSERT INTO `statut_voitures` VALUES (1,'disponible','available'),(2,'réservé','reserved'),(3,'vendue','sold'),(4,'expédié','shipped');
/*!40000 ALTER TABLE `statut_voitures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  `taux` varchar(45) NOT NULL,
  `provinces_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_taxes_provinces1_idx` (`provinces_id`),
  CONSTRAINT `fk_taxes_provinces1` FOREIGN KEY (`provinces_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (1,'TVH','HST','0.15',2),(2,'TVH','HST','0.13',3),(3,'TPS','GST','0.05',1),(4,'TVQ','QST','9.975',1);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmissions`
--

DROP TABLE IF EXISTS `transmissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transmissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmissions`
--

LOCK TABLES `transmissions` WRITE;
/*!40000 ALTER TABLE `transmissions` DISABLE KEYS */;
INSERT INTO `transmissions` VALUES (1,'automatique','automatic'),(2,'manuelle','manual');
/*!40000 ALTER TABLE `transmissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anniversaire` date DEFAULT NULL,
  `adresse` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_portable` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `villes_id` bigint NOT NULL,
  `privileges_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_users_villes1_idx` (`villes_id`),
  KEY `fk_users_privileges1_idx` (`privileges_id`),
  CONSTRAINT `fk_users_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`),
  CONSTRAINT `fk_users_villes1` FOREIGN KEY (`villes_id`) REFERENCES `villes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villes`
--

DROP TABLE IF EXISTS `villes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `nom_en` varchar(255) DEFAULT NULL,
  `provinces_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_villes_provinces1_idx` (`provinces_id`),
  CONSTRAINT `fk_villes_provinces1` FOREIGN KEY (`provinces_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villes`
--

LOCK TABLES `villes` WRITE;
/*!40000 ALTER TABLE `villes` DISABLE KEYS */;
INSERT INTO `villes` VALUES (3,'Lunenburg','Lunenburg',2),(4,'Halifax','Halifax',2),(5,'Montréal','Montreal',1),(6,'Québec','Quebec',1),(7,'Ottawa','Ottawa',3),(8,'Toronto','Toronto',3);
/*!40000 ALTER TABLE `villes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voitures`
--

DROP TABLE IF EXISTS `voitures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voitures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annee` year DEFAULT NULL,
  `date_arrivee` date DEFAULT NULL,
  `prix_paye` int DEFAULT NULL,
  `kilometrage` int DEFAULT NULL,
  `description` text,
  `date_heure_reservation` datetime DEFAULT NULL,
  `corps_id` bigint NOT NULL,
  `modeles_id` bigint NOT NULL,
  `transmissions_id` bigint NOT NULL,
  `groupe_motopropulseurs_id` bigint NOT NULL,
  `carburants_id` bigint NOT NULL,
  `commandes_id` bigint NOT NULL,
  `statut_voitures_id` bigint NOT NULL,
  `etats_id` bigint NOT NULL,
  `reservation_users_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_voiture_corps1_idx` (`corps_id`),
  KEY `fk_voiture_modeles1_idx` (`modeles_id`),
  KEY `fk_voiture_transmissions1_idx` (`transmissions_id`),
  KEY `fk_voiture_groupe_motopropulseur1_idx` (`groupe_motopropulseurs_id`),
  KEY `fk_voiture_carburants1_idx` (`carburants_id`),
  KEY `fk_voiture_factures1_idx` (`commandes_id`),
  KEY `fk_voiture_statuts1_idx` (`statut_voitures_id`),
  KEY `fk_voiture_etats1_idx` (`etats_id`),
  KEY `fk_voitures_users1_idx` (`reservation_users_id`),
  CONSTRAINT `fk_voiture_carburants1` FOREIGN KEY (`carburants_id`) REFERENCES `carburants` (`id`),
  CONSTRAINT `fk_voiture_corps1` FOREIGN KEY (`corps_id`) REFERENCES `corps` (`id`),
  CONSTRAINT `fk_voiture_etats1` FOREIGN KEY (`etats_id`) REFERENCES `etats` (`id`),
  CONSTRAINT `fk_voiture_factures1` FOREIGN KEY (`commandes_id`) REFERENCES `commandes` (`id`),
  CONSTRAINT `fk_voiture_groupe_motopropulseurs1` FOREIGN KEY (`groupe_motopropulseurs_id`) REFERENCES `groupe_motopropulseurs` (`id`),
  CONSTRAINT `fk_voiture_modeles1` FOREIGN KEY (`modeles_id`) REFERENCES `modeles` (`id`),
  CONSTRAINT `fk_voiture_statuts1` FOREIGN KEY (`statut_voitures_id`) REFERENCES `statut_voitures` (`id`),
  CONSTRAINT `fk_voiture_transmissions1` FOREIGN KEY (`transmissions_id`) REFERENCES `transmissions` (`id`),
  CONSTRAINT `fk_voitures_users1` FOREIGN KEY (`reservation_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voitures`
--

LOCK TABLES `voitures` WRITE;
/*!40000 ALTER TABLE `voitures` DISABLE KEYS */;
/*!40000 ALTER TABLE `voitures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-29 12:15:19
