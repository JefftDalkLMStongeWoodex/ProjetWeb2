-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2022 at 11:34 PM
-- Server version: 5.7.36
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vdo_inc`
--

-- --------------------------------------------------------

--
-- Table structure for table `carburants`
--

DROP TABLE IF EXISTS `carburants`;
CREATE TABLE IF NOT EXISTS `carburants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carburants`
--

INSERT INTO `carburants` (`id`, `type`, `type_en`) VALUES
(1, 'essence', 'gasoline'),
(2, 'diesel', 'diesel');

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `numero_transaction` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mode_paiement_id` bigint(20) NOT NULL,
  `mode_expedition_id` bigint(20) NOT NULL,
  `statut_commandes_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factures_users1_idx` (`users_id`),
  KEY `fk_factures_mode_paiement1_idx` (`mode_paiement_id`),
  KEY `fk_factures_mode_expedition1_idx` (`mode_expedition_id`),
  KEY `fk_commandes_statut_commandes1_idx` (`statut_commandes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `constructeurs`
--

DROP TABLE IF EXISTS `constructeurs`;
CREATE TABLE IF NOT EXISTS `constructeurs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `constructeurs`
--

INSERT INTO `constructeurs` (`id`, `nom`) VALUES
(1, 'Volkswagen'),
(2, 'Toyota'),
(3, 'Ford'),
(4, 'Hyundai');

-- --------------------------------------------------------

--
-- Table structure for table `corps`
--

DROP TABLE IF EXISTS `corps`;
CREATE TABLE IF NOT EXISTS `corps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `corps`
--

INSERT INTO `corps` (`id`, `type`, `type_en`) VALUES
(1, 'berline', 'sedan'),
(2, 'cabriolet', 'convertible'),
(3, 'camion', 'truck'),
(4, 'commercial', 'commercial'),
(5, 'coupé', 'coupe'),
(6, 'familiale', 'wagon'),
(7, 'fourgonnette', 'minivan'),
(8, 'à hayon', 'hatchback'),
(9, 'VUS', 'SUV');

-- --------------------------------------------------------

--
-- Table structure for table `etats`
--

DROP TABLE IF EXISTS `etats`;
CREATE TABLE IF NOT EXISTS `etats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etats`
--

INSERT INTO `etats` (`id`, `nom`, `nom_en`) VALUES
(1, 'parfait', 'perfect'),
(2, 'excellent', 'excellent'),
(3, 'bon', 'good'),
(4, 'moyen', 'fair'),
(5, 'pauvre', 'poor');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_motopropulseur`
--

DROP TABLE IF EXISTS `groupe_motopropulseur`;
CREATE TABLE IF NOT EXISTS `groupe_motopropulseur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_motopropulseur`
--

INSERT INTO `groupe_motopropulseur` (`id`, `type`, `type_en`) VALUES
(1, '2 roues motrices', 'two-wheel drive'),
(2, '4 roues motrice', 'four-wheel drive'),
(3, 'traction arrière', 'rear-wheel drive'),
(4, 'traction avant', 'front-wheel drive'),
(5, 'traction intégrale', 'all-wheel drive');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `nom_en` varchar(255) DEFAULT NULL,
  `chemin` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `alt_en` varchar(255) DEFAULT NULL,
  `image_principale` tinyint(4) NOT NULL,
  `voiture_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_voiture1_idx` (`voiture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
CREATE TABLE IF NOT EXISTS `journals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_journals_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `modeles`
--

DROP TABLE IF EXISTS `modeles`;
CREATE TABLE IF NOT EXISTS `modeles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `constructeurs_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modeles_constructeurs1_idx` (`constructeurs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modeles`
--

INSERT INTO `modeles` (`id`, `nom`, `constructeurs_id`) VALUES
(1, 'Golf', 1),
(2, 'Tiguan', 1),
(3, 'Corolla GR', 2),
(4, 'RAV4', 2),
(5, 'F150', 3),
(6, 'Bronco', 3),
(7, 'IONIQ 6', 4),
(8, 'Tucson', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mode_expeditions`
--

DROP TABLE IF EXISTS `mode_expeditions`;
CREATE TABLE IF NOT EXISTS `mode_expeditions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mode_expeditions`
--

INSERT INTO `mode_expeditions` (`id`, `nom`, `nom_en`) VALUES
(1, 'livraison', 'delivery'),
(2, 'ramassage', 'pick up');

-- --------------------------------------------------------

--
-- Table structure for table `mode_paiements`
--

DROP TABLE IF EXISTS `mode_paiements`;
CREATE TABLE IF NOT EXISTS `mode_paiements` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mode_paiements`
--

INSERT INTO `mode_paiements` (`id`, `nom`, `nom_en`) VALUES
(12, 'comptant', 'cash'),
(13, 'débit', 'debit'),
(14, 'crédit', 'credit'),
(15, 'Paypal', 'Paypal'),
(16, 'virement bancaire', 'bank transfer');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `nom`, `nom_en`) VALUES
(1, 'client', 'client'),
(2, 'employé', 'employee'),
(3, 'administrateur', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `nom_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `nom`, `nom_en`) VALUES
(1, 'Québec', 'Quebec'),
(2, 'Nouvelle-Écosse', 'Nova Scotia'),
(3, 'Ontario', 'Ontario');

-- --------------------------------------------------------

--
-- Table structure for table `statut_commandes`
--

DROP TABLE IF EXISTS `statut_commandes`;
CREATE TABLE IF NOT EXISTS `statut_commandes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statut_commandes`
--

INSERT INTO `statut_commandes` (`id`, `nom`, `nom_en`) VALUES
(1, 'en attente', 'pending'),
(2, 'facturé', 'invoided'),
(3, 'payé', 'payed');

-- --------------------------------------------------------

--
-- Table structure for table `statut_voitures`
--

DROP TABLE IF EXISTS `statut_voitures`;
CREATE TABLE IF NOT EXISTS `statut_voitures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statut_voitures`
--

INSERT INTO `statut_voitures` (`id`, `nom`, `nom_en`) VALUES
(1, 'disponible', 'available'),
(2, 'réservé', 'reserved'),
(3, 'vendue', 'sold'),
(4, 'expédié', 'shipped');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `nom_en` varchar(45) DEFAULT NULL,
  `taux` varchar(45) NOT NULL,
  `provinces_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_taxes_provinces1_idx` (`provinces_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `nom`, `nom_en`, `taux`, `provinces_id`) VALUES
(1, 'TVH', 'HST', '0.15', 2),
(2, 'TVH', 'HST', '0.13', 3),
(3, 'TPS', 'GST', '0.05', 1),
(4, 'TVQ', 'QST', '9.975', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transmissions`
--

DROP TABLE IF EXISTS `transmissions`;
CREATE TABLE IF NOT EXISTS `transmissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transmissions`
--

INSERT INTO `transmissions` (`id`, `type`, `type_en`) VALUES
(1, 'automatique', 'automatic'),
(2, 'manuelle', 'manual');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anniversaire` date DEFAULT NULL,
  `adresse` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_portable` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `villes_id` bigint(20) NOT NULL,
  `privileges_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_users_villes1_idx` (`villes_id`),
  KEY `fk_users_privileges1_idx` (`privileges_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `nom_en` varchar(255) DEFAULT NULL,
  `provinces_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_villes_provinces1_idx` (`provinces_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id`, `nom`, `nom_en`, `provinces_id`) VALUES
(3, 'Lunenburg', 'Lunenburg', 2),
(4, 'Halifax', 'Halifax', 2),
(5, 'Montréal', 'Montreal', 1),
(6, 'Québec', 'Quebec', 1),
(7, 'Ottawa', 'Ottawa', 3),
(8, 'Toronto', 'Toronto', 3);

-- --------------------------------------------------------

--
-- Table structure for table `voitures`
--

DROP TABLE IF EXISTS `voitures`;
CREATE TABLE IF NOT EXISTS `voitures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `annee` year(4) DEFAULT NULL,
  `date_arrivee` date DEFAULT NULL,
  `prix_paye` int(11) DEFAULT NULL,
  `kilometrage` int(11) DEFAULT NULL,
  `description` text,
  `corps_id` bigint(20) NOT NULL,
  `modeles_id` bigint(20) NOT NULL,
  `transmissions_id` bigint(20) NOT NULL,
  `groupe_motopropulseur_id` bigint(20) NOT NULL,
  `carburants_id` bigint(20) NOT NULL,
  `commandes_id` bigint(20) NOT NULL,
  `statut_voitures_id` bigint(20) NOT NULL,
  `etats_id` bigint(20) NOT NULL,
  `date_heure_reservation` datetime DEFAULT NULL,
  `reservation_users_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_voiture_corps1_idx` (`corps_id`),
  KEY `fk_voiture_modeles1_idx` (`modeles_id`),
  KEY `fk_voiture_transmissions1_idx` (`transmissions_id`),
  KEY `fk_voiture_groupe_motopropulseur1_idx` (`groupe_motopropulseur_id`),
  KEY `fk_voiture_carburants1_idx` (`carburants_id`),
  KEY `fk_voiture_factures1_idx` (`commandes_id`),
  KEY `fk_voiture_statuts1_idx` (`statut_voitures_id`),
  KEY `fk_voiture_etats1_idx` (`etats_id`),
  KEY `fk_voitures_users1_idx` (`reservation_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `fk_commandes_statut_commandes1` FOREIGN KEY (`statut_commandes_id`) REFERENCES `statut_commandes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factures_mode_expedition1` FOREIGN KEY (`mode_expedition_id`) REFERENCES `mode_expeditions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factures_mode_paiement1` FOREIGN KEY (`mode_paiement_id`) REFERENCES `mode_paiements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_voiture1` FOREIGN KEY (`voiture_id`) REFERENCES `voitures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `fk_journals_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `modeles`
--
ALTER TABLE `modeles`
  ADD CONSTRAINT `fk_modeles_constructeurs1` FOREIGN KEY (`constructeurs_id`) REFERENCES `constructeurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `fk_taxes_provinces1` FOREIGN KEY (`provinces_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_villes1` FOREIGN KEY (`villes_id`) REFERENCES `villes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `fk_villes_provinces1` FOREIGN KEY (`provinces_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `voitures`
--
ALTER TABLE `voitures`
  ADD CONSTRAINT `fk_voiture_carburants1` FOREIGN KEY (`carburants_id`) REFERENCES `carburants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_corps1` FOREIGN KEY (`corps_id`) REFERENCES `corps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_etats1` FOREIGN KEY (`etats_id`) REFERENCES `etats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_factures1` FOREIGN KEY (`commandes_id`) REFERENCES `commandes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_groupe_motopropulseur1` FOREIGN KEY (`groupe_motopropulseur_id`) REFERENCES `groupe_motopropulseur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_modeles1` FOREIGN KEY (`modeles_id`) REFERENCES `modeles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_statuts1` FOREIGN KEY (`statut_voitures_id`) REFERENCES `statut_voitures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voiture_transmissions1` FOREIGN KEY (`transmissions_id`) REFERENCES `transmissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voitures_users1` FOREIGN KEY (`reservation_users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
