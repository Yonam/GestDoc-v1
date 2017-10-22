-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 21 Septembre 2017 à 15:49
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pharma`
--
/*CREATE DATABASE IF NOT EXISTS `pharma` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pharma`;*/

-- --------------------------------------------------------

--
-- Structure de la table `annulation_vente`
--

CREATE TABLE IF NOT EXISTS `annulation_vente` (
  `CODE_ANNULATION` int(4) NOT NULL AUTO_INCREMENT,
  `CODE_VENTE` int(11) NOT NULL,
  `DATE_ANNULATION` date DEFAULT NULL,
  PRIMARY KEY (`CODE_ANNULATION`),
  KEY `FK_B2` (`CODE_VENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `banque`
--

CREATE TABLE IF NOT EXISTS `banque` (
  `CODE_BANQUE` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_BANQUE` text,
  `DESCRIPTION` text,
  PRIMARY KEY (`CODE_BANQUE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `banque`
--

INSERT INTO `banque` (`CODE_BANQUE`, `NUM_BANQUE`, `DESCRIPTION`) VALUES
(1, '', '                                                                                                                                                                        Euchy                                                                                                                                                                        '),
(2, '522214454', 'Diamond bank'),
(3, '22566999', 'coris banque'),
(4, '23558555', 'Bank of Africa'),
(5, '93654877', 'Ecobank');

-- --------------------------------------------------------

--
-- Structure de la table `bordereau`
--

CREATE TABLE IF NOT EXISTS `bordereau` (
  `CODE_BORDEREAU` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_BORDEREAU_COURSIER` text,
  `BENEFICIAIRE` text,
  PRIMARY KEY (`CODE_BORDEREAU`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `bordereau`
--

INSERT INTO `bordereau` (`CODE_BORDEREAU`, `NUMERO_BORDEREAU_COURSIER`, `BENEFICIAIRE`) VALUES
(1, 'AZR7854693PLO', 'Toto'),
(2, 'ERTG85479652', 'Gerant');

-- --------------------------------------------------------

--
-- Structure de la table `classe_produit`
--

CREATE TABLE IF NOT EXISTS `classe_produit` (
  `CODE_CLASSE` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_CLASS` text,
  `DESCRIPTION` text,
  PRIMARY KEY (`CODE_CLASSE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `classe_produit`
--

/*INSERT INTO `classe_produit` (`CODE_CLASSE`, `NUM_CLASS`, `DESCRIPTION`) VALUES
(1, NULL, 'bacterieca'),
(2, NULL, 'Anti-biotiqueti'),
(3, NULL, 'yoyo');*/

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `CODE_CLI` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_COM` int(11) NOT NULL,
  `TITRE` text,
  `NOM_CLI` text,
  `PRENOM_CLI` text,
  `TYPE_PIECE` text,
  `NUM_PIECE` text,
  `DATE_PIECE` date DEFAULT NULL,
  `EMAIL` text,
  `ADRESSE` text,
  `TEL1` text,
  `TEL2` text,
  `STATUT` tinyint(1) DEFAULT NULL,
  `TOTAL_DU` float(8,2) DEFAULT NULL,
  `CREDIT_MAX` float(8,2) DEFAULT NULL,
  `DELAI_PAIEMENT` int(11) DEFAULT NULL,
  `REMISE` float DEFAULT NULL,
  `DROIT_CREDIT` tinyint(1) DEFAULT NULL,
  `DEPASSEMENT` float DEFAULT NULL,
  `DATE_CREATION` datetime DEFAULT NULL,
  `delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`CODE_CLI`),
  KEY `FK_RABATTRE` (`CODE_COM`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

/*INSERT INTO `client` (`CODE_CLI`, `CODE_COM`, `TITRE`, `NOM_CLI`, `PRENOM_CLI`, `TYPE_PIECE`, `NUM_PIECE`, `DATE_PIECE`, `EMAIL`, `ADRESSE`, `TEL1`, `TEL2`, `STATUT`, `TOTAL_DU`, `CREDIT_MAX`, `DELAI_PAIEMENT`, `REMISE`, `DROIT_CREDIT`, `DEPASSEMENT`, `DATE_CREATION`, `delete`) VALUES
(1, 1, 'monsieur', 'toto', 'tata', 'CNI', '989990ki7', '2017-07-05', 'yoyo@yaya.com', 'klikan', '90909090', '98989898', 1, 8900.00, 234456.00, 7, 20, 1, 10000, '2017-07-30 03:22:14', 1),
(8, 1, 'Dle', 'Apedoh', 'Claudine', 'CNI', '908876554', '2017-09-12', 'apedo.claudia@gmail.com', 'sito aeroporte', '90979796', '90775757', 0, 0.00, 50000.00, 60, 30, 1, 15, NULL, 0),
(9, 2, 'Mme', 'TestFemme', 'TestFemme', 'CNI', '', '0000-00-00', '', 'Lomé', '98979695', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(10, 1, 'Mme', 'Michelle', 'Abla', 'CNI', '00015355', '0000-00-00', '', 'Kara', '98787998', '', 0, 0.00, NULL, NULL, 0, 1, NULL, NULL, 0),
(11, 1, 'Mme', 'Michelle', 'Ablavi', 'CNI', '', '0000-00-00', '', 'Kara', '98787998', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(12, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-05', '', 'Lome', '22212322', '', 0, 0.00, 0.00, 15, 0, 1, 3, NULL, 0),
(13, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(14, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(15, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(16, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(17, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(18, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(19, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(20, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(21, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(22, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(23, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1),
(24, 1, 'Mr', 'YÃ¨guÃ¨', 'Daniel', 'CNI', '12456', '2017-09-01', '', 'Lomé', '22212322', '', 0, 0.00, 0.00, 15, 0, 0, 1, NULL, 1);
*/
-- --------------------------------------------------------

--
-- Structure de la table `commerciale`
--

CREATE TABLE IF NOT EXISTS `commerciale` (
  `CODE_COM` int(10) NOT NULL AUTO_INCREMENT,
  `NOM_COM` text,
  `PRENOM_COM` text,
  `DATE_EMB` date DEFAULT NULL,
  `TEL_COM` text,
  `TEL_URG` text,
  `ADRESSE` text,
  `EMAIL` text,
  `CHIFFRE` int(11) DEFAULT NULL,
  `POURCENTAGE` float DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`CODE_COM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commerciale`
--

/*INSERT INTO `commerciale` (`CODE_COM`, `NOM_COM`, `PRENOM_COM`, `DATE_EMB`, `TEL_COM`, `TEL_URG`, `ADRESSE`, `EMAIL`, `CHIFFRE`, `POURCENTAGE`, `deleted`) VALUES
(1, 'Agbogah', 'oyoyo', '2017-07-05', '92593461', '98628723', 'telessou', 'scribe@scribe.tg', 0, 0.2, 0),
(2, 'totota', 'babatsÃ¨', '2017-07-13', '97125812', '91486620', 'attiegou', 'atabre@gmail.com', 0, 0.5, 1),
(3, 'popo', 'mouo', '2018-08-06', '9784589', '22654898', 'po9874', 'eu@gmail.com', 0, 0.2, 0);*/

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE IF NOT EXISTS `connexion` (
  `CODE_CONNEXION` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` text,
  `STATUT` tinyint(1) DEFAULT NULL,
  `IP` text,
  `DATE_CONNEXION` datetime DEFAULT NULL,
  `ACTION` text,
  PRIMARY KEY (`CODE_CONNEXION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contrat_souscripteur`
--

CREATE TABLE IF NOT EXISTS `contrat_souscripteur` (
  `ID_CONTRAT` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_SOUSCRIPTEUR` int(11) NOT NULL,
  `NOM_CONTRACTANT` text,
  `PRENOM_CONTRACTANT` text,
  `NUM_CONTRAT` text,
  `ECHEANCIER` int(11) DEFAULT NULL,
  `DATE_DEBUT` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`ID_CONTRAT`),
  KEY `FK_ETRE_LIE` (`CODE_SOUSCRIPTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `definir_pourcentage`
--

CREATE TABLE IF NOT EXISTS `definir_pourcentage` (
  `CODE_FAMILLE` int(11) NOT NULL,
  `CODE_SOUSCRIPTEUR` int(11) NOT NULL,
  `POURCENTAGE_PAYE` float DEFAULT NULL,
  PRIMARY KEY (`CODE_FAMILLE`,`CODE_SOUSCRIPTEUR`),
  KEY `FK_DEFINIR_POURCENTAGE` (`CODE_SOUSCRIPTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `depense`
--

CREATE TABLE IF NOT EXISTS `depense` (
  `CODE_DEPENSE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_USER` int(11) NOT NULL,
  `OBJET` text,
  `MONTANT` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `COMMENTAIRE` text,
  PRIMARY KEY (`CODE_DEPENSE`),
  KEY `FK_DEPENSER` (`CODE_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `encaissement`
--

CREATE TABLE IF NOT EXISTS `encaissement` (
  `CODE_ENCAISSEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_JOURNEE` int(11) NOT NULL,
  `CODE_PAYEMENT` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `TYPE` text,
  `DATE_ENCAISSEMENT` datetime DEFAULT NULL,
  `STATUT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_ENCAISSEMENT`),
  KEY `FK_FAIRE` (`CODE_USER`),
  KEY `FK_JOURNALISER` (`CODE_JOURNEE`),
  KEY `FK_PAYER` (`CODE_PAYEMENT`),
  KEY `FK_RELATIONSHIP_2` (`CODE_VENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `encaissement`
--

/*INSERT INTO `encaissement` (`CODE_ENCAISSEMENT`, `CODE_JOURNEE`, `CODE_PAYEMENT`, `CODE_VENTE`, `CODE_USER`, `TYPE`, `DATE_ENCAISSEMENT`, `STATUT`) VALUES
(1, 1, 1, 1, 1, 'Liquide', '2017-08-09 00:00:00', 0),
(2, 16, 5, 41, 8, 'EspÃ¨ce', '2017-09-07 00:00:00', NULL),
(3, 16, 6, 40, 8, 'EspÃ¨ce', '2017-09-07 00:00:00', NULL),
(4, 16, 7, 40, 8, 'EspÃ¨ce', '2017-09-07 00:00:00', NULL),
(5, 16, 8, 45, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(6, 16, 9, 65, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(7, 16, 10, 64, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(8, 16, 11, 62, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(9, 16, 12, 60, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(10, 16, 13, 60, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(11, 16, 14, 60, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(12, 16, 15, 60, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(13, 16, 16, 60, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(14, 16, 17, 42, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(15, 16, 18, 46, 4, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(16, 16, 19, 67, 8, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(17, 16, 20, 68, 8, 'EspÃ¨ce', '2017-09-08 00:00:00', NULL),
(18, 27, 22, 69, 14, 'EspÃ¨ce', '2017-09-12 00:00:00', NULL),
(19, 34, 23, 70, 4, 'EspÃ¨ce', '2017-09-12 00:00:00', NULL),
(20, 38, 24, 59, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(21, 38, 25, 58, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(22, 38, 26, 54, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(23, 38, 27, 51, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(24, 38, 40, 66, 8, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(25, 38, 41, 63, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(26, 38, 42, 72, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(27, 38, 43, 74, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(28, 38, 44, 73, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(29, 39, 45, 76, 4, 'EspÃ¨ce', '2017-09-13 00:00:00', NULL),
(30, 40, 46, 77, 4, 'EspÃ¨ce', '2017-09-14 00:00:00', NULL),
(31, 40, 47, 78, 4, 'EspÃ¨ce', '2017-09-14 00:00:00', NULL),
(32, 40, 48, 79, 4, 'EspÃ¨ce', '2017-09-14 00:00:00', NULL),
(33, 40, 49, 79, 4, 'EspÃ¨ce', '2017-09-14 00:00:00', NULL),
(34, 40, 50, 80, 4, 'EspÃ¨ce', '2017-09-14 00:00:00', NULL),
(35, 43, 51, 81, 13, 'EspÃ¨ce', '2017-09-15 00:00:00', NULL),
(36, 43, 52, 82, 13, 'EspÃ¨ce', '2017-09-15 00:00:00', NULL),
(37, 44, 53, 83, 4, 'EspÃ¨ce', '2017-09-16 00:00:00', NULL);*/

-- --------------------------------------------------------

--
-- Structure de la table `entree`
--

CREATE TABLE IF NOT EXISTS `entree` (
  `CODE_ENTREE` int(10) NOT NULL AUTO_INCREMENT,
  `CODE_USER` int(11) NOT NULL,
  `DATE_ENTREE` date DEFAULT NULL,
  `NUMERO_FACTURE` text,
  `NUMERO_BORDEREAU` text,
  PRIMARY KEY (`CODE_ENTREE`),
  KEY `FK_EFFECTUER_ENTREE` (`CODE_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entree`
--

/*INSERT INTO `entree` (`CODE_ENTREE`, `CODE_USER`, `DATE_ENTREE`, `NUMERO_FACTURE`, `NUMERO_BORDEREAU`) VALUES
(1, 4, '0000-00-00', '123', '456'),
(2, 4, '0000-00-00', '123', '456'),
(3, 4, '0000-00-00', '45555', '4555'),
(4, 7, '0000-00-00', '1245', NULL),
(5, 7, '0000-00-00', '1245', ''),
(6, 7, '0000-00-00', '1245', ''),
(7, 7, '0000-00-00', '1245', ''),
(8, 7, '0000-00-00', '1245', '1245'),
(9, 8, '0000-00-00', '17565', '2345686'),
(10, 8, '0000-00-00', '17565', '2345686'),
(11, 8, '0000-00-00', '17565', '2345686'),
(12, 8, '0000-00-00', '17565', '2345686');*/

-- --------------------------------------------------------

--
-- Structure de la table `exploitant`
--

CREATE TABLE IF NOT EXISTS `exploitant` (
  `CODE_EXPLOITANT` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_EXPLOITANT` text,
  `LIBELLE` text,
  PRIMARY KEY (`CODE_EXPLOITANT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `exploitant`
--

/*INSERT INTO `exploitant` (`CODE_EXPLOITANT`, `NUM_EXPLOITANT`, `LIBELLE`) VALUES
(1, NULL, 'Dafra'),
(2, NULL, 'Medis');*/

-- --------------------------------------------------------

--
-- Structure de la table `famille_produit`
--

CREATE TABLE IF NOT EXISTS `famille_produit` (
  `CODE_FAMILLE` int(10) NOT NULL AUTO_INCREMENT,
  `NUM_FAMILLE` text,
  `NOM_FAMILLE` text,
  PRIMARY KEY (`CODE_FAMILLE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `famille_produit`
--

/*INSERT INTO `famille_produit` (`CODE_FAMILLE`, `NUM_FAMILLE`, `NOM_FAMILLE`) VALUES
(1, NULL, 'GelluleO'),
(2, NULL, 'Effervescente');*/

-- --------------------------------------------------------

--
-- Structure de la table `forme`
--

CREATE TABLE IF NOT EXISTS `forme` (
  `CODE_FORME` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_FORME` text,
  `NUM_FORME` text,
  PRIMARY KEY (`CODE_FORME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `forme`
--

/*INSERT INTO `forme` (`CODE_FORME`, `NOM_FORME`, `NUM_FORME`) VALUES
(1, 'Ronde', NULL),
(2, 'Liquide', NULL);*/

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `CODE_FOURNISSEUR` int(11) NOT NULL AUTO_INCREMENT,
  `RAISON_SOCIAL` text,
  `CONCTACT` text,
  `TEL` text,
  `TEL_URG` text,
  `EMAIL` text,
  `ADRESSE` text,
  `SOLDE_COMPTE` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`CODE_FOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fournisseur`
--

/*INSERT INTO `fournisseur` (`CODE_FOURNISSEUR`, `RAISON_SOCIAL`, `CONCTACT`, `TEL`, `TEL_URG`, `EMAIL`, `ADRESSE`, `SOLDE_COMPTE`, `deleted`) VALUES
(2, 'NSIA', 'Kossi Eucky', '90989796', '003378995544', 'riri@rara.com', 'paris', 450375, 0),
(4, 'POUIRU', 'yonam', '22221425', '97846841', 'jhbkj@gmail.com', 'tr9878', 150000, 0),
(5, 'TONGMEI', 'MR YANG', '+22822271406', '+22890564510', 'tongmei@yahoo.fr', 'zone franche portuaire Lome Togo', 4400, 0),
(6, 'TestFournisseuri', 'TestFournisseur', '98596320', '22252628', 'test@fourn.com', 'Lomnava', -55000, 1);*/

-- --------------------------------------------------------

--
-- Structure de la table `historique_modif`
--

CREATE TABLE IF NOT EXISTS `historique_modif` (
  `CODE_HISTORIQUE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_VENTE` int(11) NOT NULL,
  `ANCIEN` int(11) DEFAULT NULL,
  `QTEANCAV` float DEFAULT NULL,
  `QTEANCAP` float DEFAULT NULL,
  `NOUVEAU` float DEFAULT NULL,
  `QTENOUVAV` float DEFAULT NULL,
  `QTENOUVAP` float DEFAULT NULL,
  `DATE_OPERATION` datetime DEFAULT NULL,
  `LOGIN` text,
  PRIMARY KEY (`CODE_HISTORIQUE`),
  KEY `FK_HISTORISER` (`CODE_VENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `journee`
--

CREATE TABLE IF NOT EXISTS `journee` (
  `CODE_JOURNEE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_USER_OUVRIR` int(11) NOT NULL,
  `CODE_USER_FERMER` int(11) DEFAULT NULL,
  `CODE_USER_CLOTURER` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `DATE_OUVERTURE` datetime DEFAULT NULL,
  `DATE_FERMETURE` datetime DEFAULT NULL,
  `DATE_CLOTURE` datetime DEFAULT NULL,
  `STATUT` tinyint(1) DEFAULT NULL,
  `MONTANT_FERMETURE` float(8,2) DEFAULT NULL,
  `MONTANT_CLOTURE` float(8,2) DEFAULT NULL,
  `MONTANT_MANQUANT` float(8,2) DEFAULT NULL,
  `MONTANT_SURPLUS` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`CODE_JOURNEE`),
  KEY `FK_CLOTURER_JOURNEE` (`CODE_USER_CLOTURER`),
  KEY `FK_FERMER_JOURNEE` (`CODE_USER_FERMER`),
  KEY `FK_OUVRIR_JOURNEE` (`CODE_USER_OUVRIR`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `journee`
--

/*INSERT INTO `journee` (`CODE_JOURNEE`, `CODE_USER_OUVRIR`, `CODE_USER_FERMER`, `CODE_USER_CLOTURER`, `DATE`, `DATE_OUVERTURE`, `DATE_FERMETURE`, `DATE_CLOTURE`, `STATUT`, `MONTANT_FERMETURE`, `MONTANT_CLOTURE`, `MONTANT_MANQUANT`, `MONTANT_SURPLUS`) VALUES
(1, 4, 4, 4, '2017-08-09', '2017-08-09 00:00:00', '2017-09-11 20:55:35', '2017-09-11 20:55:41', 1, 250000.00, 254000.00, 0.00, 300.00),
(10, 4, NULL, 4, '2017-08-10', '2017-08-18 20:59:38', '2017-09-11 18:32:29', '2017-09-11 20:40:29', 1, NULL, NULL, NULL, NULL),
(11, 4, 4, 4, '2017-08-11', '2017-08-18 21:18:29', '2017-09-11 20:08:37', '2017-09-11 21:00:29', 1, NULL, NULL, NULL, NULL),
(12, 4, 4, 4, '2017-08-12', '2017-08-18 21:18:56', '2017-09-11 20:41:02', '2017-09-11 20:41:07', 1, NULL, NULL, NULL, NULL),
(16, 4, NULL, 4, '2017-08-16', '2017-08-18 21:21:59', NULL, '2017-09-11 20:15:59', 1, NULL, NULL, NULL, NULL),
(17, 4, NULL, 4, '2017-08-17', '2017-09-11 14:03:47', NULL, '2017-09-11 20:51:44', 1, NULL, NULL, NULL, NULL),
(18, 8, NULL, 4, '2017-08-18', '2017-09-11 14:09:49', NULL, '2017-09-11 20:51:48', 1, NULL, NULL, NULL, NULL),
(19, 4, NULL, 4, '2017-08-19', '2017-09-11 17:43:45', '2017-09-11 18:32:50', '2017-09-11 20:51:54', 1, NULL, NULL, NULL, NULL),
(20, 4, NULL, 4, '2017-08-20', '2017-09-11 17:50:01', '2017-09-11 17:50:33', '2017-09-11 20:52:00', 1, NULL, NULL, NULL, NULL),
(21, 4, NULL, 4, '2017-08-21', '2017-09-11 18:35:20', '2017-09-11 19:18:28', '2017-09-11 20:52:06', 1, NULL, NULL, NULL, NULL),
(22, 4, NULL, 4, '2017-08-22', '2017-09-11 19:53:45', '2017-09-11 19:54:18', '2017-09-11 20:52:17', 1, NULL, NULL, NULL, NULL),
(23, 4, 4, 4, '2017-08-23', '2017-09-11 19:54:26', '2017-09-11 20:13:43', '2017-09-11 20:52:11', 1, NULL, NULL, NULL, NULL),
(24, 4, 4, 4, '2017-08-24', '2017-09-11 20:55:42', '2017-09-11 21:01:54', '2017-09-11 21:02:03', 1, NULL, NULL, NULL, NULL),
(25, 8, 4, 4, '2017-08-25', '2017-09-11 21:22:21', '2017-09-12 10:49:31', '2017-09-12 10:49:40', 1, NULL, NULL, NULL, NULL),
(26, 4, 4, 4, '2017-08-26', '2017-09-12 12:04:57', '2017-09-12 12:08:12', '2017-09-12 15:18:35', 1, 45660.00, 46000.00, -340.00, -340.00),
(27, 14, 14, 14, '2017-08-27', '2017-09-12 14:35:45', '2017-09-12 16:22:17', '2017-09-12 16:23:01', 1, 391000.00, 400000.00, -9000.00, -9000.00),
(28, 14, NULL, 4, '2017-08-28', '2017-09-12 16:26:59', '2017-09-12 15:21:12', '2017-09-12 16:59:09', 1, 0.00, 0.00, 0.00, 0.00),
(29, 4, 4, 4, '2017-08-29', '2017-09-12 17:03:55', '2017-09-12 17:05:21', '2017-09-12 17:12:32', 1, 0.00, 0.00, 0.00, 0.00),
(30, 4, 4, 4, '2017-08-30', '2017-09-12 17:12:33', '2017-09-12 17:19:26', '2017-09-12 17:31:00', 1, 4000.00, 5000.00, 1000.00, 1000.00),
(31, 4, 4, 4, '2017-08-31', '2017-09-12 17:33:23', '2017-09-12 17:33:49', '2017-09-12 17:34:37', 1, 5000.00, 4500.00, -500.00, 0.00),
(32, 4, 4, 4, '2017-09-01', '2017-09-12 18:13:08', '2017-09-12 19:56:09', '2017-09-12 19:49:24', 1, 0.00, 0.00, 0.00, 0.00),
(33, 8, 4, 4, '2017-09-02', '2017-09-12 19:49:26', '2017-09-13 00:41:25', '2017-09-13 00:41:40', 1, 0.00, 0.00, 0.00, 0.00),
(34, 4, 4, 4, '2017-09-03', '2017-09-13 00:41:42', '2017-09-13 12:33:02', '2017-09-13 12:33:25', 1, 6193.00, 5000.00, -1193.00, 0.00),
(35, 4, 4, 4, '2017-09-04', '2017-09-13 12:33:36', '2017-09-13 13:14:02', '2017-09-13 13:14:43', 1, 5220.00, 1500.00, -3720.00, 0.00),
(36, 4, 4, 4, '2017-09-05', '2017-09-13 13:14:45', '2017-09-13 13:19:11', '2017-09-13 13:19:28', 1, 0.00, 0.00, 0.00, 0.00),
(37, 4, 4, 13, '2017-09-06', '2017-09-13 13:19:29', '2017-09-13 16:32:10', '2017-09-15 17:18:15', 1, 0.00, 0.00, 0.00, 0.00),
(38, 4, 4, 13, '2017-09-07', '2017-09-13 16:33:51', '2017-09-13 17:58:01', '2017-09-15 17:18:38', 1, 401164.00, 402000.00, 0.00, 836.00),
(39, 4, 4, NULL, '2017-09-08', '2017-09-13 17:58:02', '2017-09-13 21:03:17', NULL, 1, NULL, NULL, NULL, NULL),
(40, 4, 13, NULL, '2017-09-09', '2017-09-13 17:58:36', '2017-09-15 17:16:54', NULL, 1, NULL, NULL, NULL, NULL),
(41, 13, 13, NULL, '2017-09-10', '2017-09-15 17:16:55', '2017-09-15 17:17:29', NULL, 1, NULL, NULL, NULL, NULL),
(42, 13, 13, NULL, '2017-09-11', '2017-09-15 17:22:14', '2017-09-15 17:53:10', NULL, 1, NULL, NULL, NULL, NULL),
(43, 13, 4, NULL, '2017-09-12', '2017-09-15 17:53:24', '2017-09-16 09:36:10', NULL, 1, NULL, NULL, NULL, NULL),
(44, 4, NULL, NULL, '2017-09-13', '2017-09-16 09:36:14', NULL, NULL, 0, NULL, NULL, NULL, NULL);*/

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

CREATE TABLE IF NOT EXISTS `laboratoire` (
  `CODE_LAB` int(10) NOT NULL AUTO_INCREMENT,
  `NUMERO_LAB` text,
  `NOM_LABORATOIRE` text,
  PRIMARY KEY (`CODE_LAB`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `laboratoire`
--

/*INSERT INTO `laboratoire` (`CODE_LAB`, `NUMERO_LAB`, `NOM_LABORATOIRE`) VALUES
(1, '1', 'Bio-Pharma'),
(2, '2', 'Dietetique'),
(3, NULL, 'et4t');
*/
-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE IF NOT EXISTS `localisation` (
  `CODE_LOCALISATION` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_LOCALISATION` text,
  `NOM_LOCALISATION` text,
  PRIMARY KEY (`CODE_LOCALISATION`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `localisation`
--

/*INSERT INTO `localisation` (`CODE_LOCALISATION`, `NUM_LOCALISATION`, `NOM_LOCALISATION`) VALUES
(1, NULL, 'Etagère 4'),
(2, NULL, 'Etagère 2'),
(3, NULL, 'et4T');*/

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `CODE_LOG` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_USER` int(11) NOT NULL,
  `LOGIN` text,
  `HEURE` datetime DEFAULT NULL,
  `EVENEMENT` text,
  `STATUT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_LOG`),
  KEY `FK_POSSEDER` (`CODE_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mode_payement`
--

CREATE TABLE IF NOT EXISTS `mode_payement` (
  `CODE_PAYEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_BANQUE` int(11) DEFAULT NULL,
  `CODE_SOUSCRIPTEUR` int(11) DEFAULT NULL,
  `DESCRIPTION` text,
  `NUM_CHEQUE` int(11) DEFAULT NULL,
  `MONTANT` int(11) DEFAULT NULL,
  `MONTANT_PAYE` int(11) DEFAULT NULL,
  `MONTANT_RESTE` int(11) DEFAULT NULL,
  `DATE_CHEQUE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_PAYEMENT`),
  KEY `FK_ASSOCIER` (`CODE_BANQUE`),
  KEY `FK_PAYER_PAR` (`CODE_SOUSCRIPTEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `mode_payement`
--

/*INSERT INTO `mode_payement` (`CODE_PAYEMENT`, `CODE_BANQUE`, `CODE_SOUSCRIPTEUR`, `DESCRIPTION`, `NUM_CHEQUE`, `MONTANT`, `MONTANT_PAYE`, `MONTANT_RESTE`, `DATE_CHEQUE`) VALUES
(1, 1, NULL, 'UTB', 25478965, 30000, NULL, NULL, '2017-08-16'),
(2, NULL, NULL, NULL, NULL, 2536, 2536, 0, NULL),
(3, NULL, NULL, NULL, NULL, 2536, 2536, 0, NULL),
(4, NULL, NULL, NULL, NULL, 2536, 2536, 0, NULL),
(5, NULL, NULL, NULL, NULL, 50655, 50655, 0, NULL),
(6, NULL, NULL, NULL, NULL, 50655, 50655, 0, NULL),
(7, NULL, NULL, NULL, NULL, 50655, 50655, 0, NULL),
(8, NULL, NULL, NULL, NULL, 2541, 2541, 0, NULL),
(9, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(10, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(11, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(12, NULL, NULL, NULL, NULL, 3652, 3652, 0, NULL),
(13, NULL, NULL, NULL, NULL, 3652, 3652, 0, NULL),
(14, NULL, NULL, NULL, NULL, 3652, 3652, 0, NULL),
(15, NULL, NULL, NULL, NULL, 3652, 3652, 0, NULL),
(16, NULL, NULL, NULL, NULL, 3652, 3652, 0, NULL),
(17, NULL, NULL, NULL, NULL, 50655, 50655, 0, NULL),
(18, NULL, NULL, NULL, NULL, 8734, 8734, 0, NULL),
(19, NULL, NULL, NULL, NULL, 711423, 711423, 0, NULL),
(20, NULL, NULL, NULL, NULL, 88364, 88364, 0, NULL),
(21, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(22, NULL, NULL, NULL, NULL, 391000, 391000, 0, NULL),
(23, NULL, NULL, NULL, NULL, 6193, 6193, 0, NULL),
(24, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(25, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(26, NULL, NULL, NULL, NULL, 5082, 5082, 0, NULL),
(27, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(28, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(29, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(30, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(31, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(32, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(33, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(34, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(35, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(36, NULL, NULL, NULL, NULL, 401164, 401164, 0, NULL),
(37, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(38, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(39, NULL, NULL, NULL, NULL, 401164, 401164, 0, NULL),
(40, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(41, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(42, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(43, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(44, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(45, NULL, NULL, NULL, NULL, 12705, 12705, 0, NULL),
(46, NULL, NULL, NULL, NULL, 162593, 162593, 0, NULL),
(47, NULL, NULL, NULL, NULL, 85504, 85504, 0, NULL),
(48, NULL, NULL, NULL, NULL, 99001, 99001, 0, NULL),
(49, NULL, NULL, NULL, NULL, 99001, 99001, 0, NULL),
(50, NULL, NULL, NULL, NULL, 6193, 6193, 0, NULL),
(51, NULL, NULL, NULL, NULL, 32076, 32076, 0, NULL),
(52, NULL, NULL, NULL, NULL, 20009, 20009, 0, NULL),
(53, NULL, NULL, NULL, NULL, 158941, 158941, 0, NULL);*/

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE IF NOT EXISTS `motif` (
  `CODE_MOTIF` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text,
  PRIMARY KEY (`CODE_MOTIF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `motif`
--

/*INSERT INTO `motif` (`CODE_MOTIF`, `DESCRIPTION`) VALUES
(1, 'perime'),
(2, 'CASSE'),
(3, 'PERTE'),
(4, 'vhhb'),
(5, 'boum');
*/
-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE IF NOT EXISTS `mouvement` (
  `CODE_MOUVEMENT` int(10) NOT NULL AUTO_INCREMENT,
  `CODE_SORTIE` int(11) DEFAULT NULL,
  `CODE_ENTREE` int(11) DEFAULT NULL,
  `CODE_VENTE` int(11) DEFAULT NULL,
  `LIBELLE` text,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_MOUVEMENT`),
  KEY `FK_MVE` (`CODE_ENTREE`),
  KEY `FK_MVS` (`CODE_SORTIE`),
  KEY `FK_MVV` (`CODE_VENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `mouvement`
--

/*INSERT INTO `mouvement` (`CODE_MOUVEMENT`, `CODE_SORTIE`, `CODE_ENTREE`, `CODE_VENTE`, `LIBELLE`, `DATE`) VALUES
(1, NULL, NULL, NULL, 'Entrée', NULL),
(2, NULL, NULL, NULL, 'Entrée', NULL),
(3, NULL, NULL, NULL, 'Entrée', '0000-00-00'),
(4, NULL, NULL, NULL, 'Entrée', '0000-00-00'),
(5, NULL, NULL, NULL, 'Entrée', '0000-00-00'),
(6, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(7, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(8, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(9, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(10, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(11, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(12, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(13, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(14, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(15, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(16, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(17, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(18, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(19, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(20, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(21, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(22, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(23, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(24, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(25, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(26, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(27, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(28, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(29, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(30, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(31, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(32, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(33, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(34, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(35, NULL, NULL, NULL, 'Sortie', '0000-00-00'),
(36, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(37, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(38, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00'),
(39, NULL, NULL, NULL, 'EntrÃ©e', '0000-00-00');*/

-- --------------------------------------------------------

--
-- Structure de la table `operationcompte`
--

CREATE TABLE IF NOT EXISTS `operationcompte` (
  `CODE_COMPTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_CLI` int(11) NOT NULL,
  `SOLDE` float(8,2) DEFAULT NULL,
  `MONTANT_VERSE` float(8,2) DEFAULT NULL,
  `RESTE` float(8,2) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_COMPTE`),
  KEY `FK_LIER` (`CODE_CLI`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `operationcompte`
--

/*INSERT INTO `operationcompte` (`CODE_COMPTE`, `CODE_CLI`, `SOLDE`, `MONTANT_VERSE`, `RESTE`, `DATE`) VALUES
(1, 8, 25000.00, 15000.00, 10000.00, '2017-09-01');*/

-- --------------------------------------------------------

--
-- Structure de la table `operation_fournisseur`
--

CREATE TABLE IF NOT EXISTS `operation_fournisseur` (
  `CODE_OPERATION` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_FOURNISSEUR` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `DATE_MAJ_COMPTE` datetime DEFAULT NULL,
  `MONTANT_MAJ_COMPTE` int(11) DEFAULT NULL,
  `SOLDE_MAJ_COMPTE` int(11) DEFAULT NULL,
  `RESTE_MAJ_COMPTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODE_OPERATION`),
  KEY `FK_OPERER` (`CODE_FOURNISSEUR`),
  KEY `FK_SUIVRE` (`CODE_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `operation_fournisseur`
--

/*INSERT INTO `operation_fournisseur` (`CODE_OPERATION`, `CODE_FOURNISSEUR`, `CODE_USER`, `DATE_MAJ_COMPTE`, `MONTANT_MAJ_COMPTE`, `SOLDE_MAJ_COMPTE`, `RESTE_MAJ_COMPTE`) VALUES
(1, 2, 8, '2017-09-19 00:00:00', 10000, 0, -10000),
(2, 2, 8, '2017-09-19 00:00:00', 10000, 0, -10000),
(3, 2, 8, '2017-09-19 00:00:00', 10000, 0, -10000),
(4, 6, 8, '2017-09-19 00:00:00', 55000, 0, -55000),
(5, 4, 8, '2017-09-19 00:00:00', 17000, 0, -17000),
(6, 4, 8, '2017-09-19 00:00:00', 6000, -17000, -23000),
(7, 4, 8, '2017-09-19 12:21:31', 8500, -23000, -31500),
(8, 5, 8, '2017-09-21 10:30:11', 10000, 14400, 4400);
*/
-- --------------------------------------------------------

--
-- Structure de la table `privileges`
--

CREATE TABLE IF NOT EXISTS `privileges` (
  `CODE_PRIVILEGE` int(11) NOT NULL AUTO_INCREMENT,
  `DESIGNATION` text,
  `LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODE_PRIVILEGE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `privileges`
--

INSERT INTO `privileges` (`CODE_PRIVILEGE`, `DESIGNATION`, `LEVEL`) VALUES
(1, 'Administrateur', 5),
(2, 'Caisse', 3),
(3, 'Comptoir', 2),
(4, 'Gerant', 1),
(5, 'Docteur', 4);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `CODE_PRODUIT` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_FAMILLE` int(11) DEFAULT NULL,
  `CODE_FORME` int(11) DEFAULT NULL,
  `CODE_CLASSE` int(11) DEFAULT NULL,
  `CODE_EXPLOITANT` int(11) DEFAULT NULL,
  `PRO_CODE_PRODUIT` int(11) DEFAULT NULL,
  `CODE_LOCALISATION` int(11) DEFAULT NULL,
  `CODE_SPECIALITE` int(11) DEFAULT NULL,
  `CODE_LAB` int(11) DEFAULT NULL,
  `DESIGNATION` text,
  `DCI` text,
  `SOUMIS_TVA` tinyint(1) DEFAULT NULL,
  `TAUX_TVA` float DEFAULT NULL,
  `DATE_COMMERCIALISATION` date DEFAULT NULL,
  `PHOTO` text,
  `DATE_ENREGISTREMENT` datetime DEFAULT NULL,
  `DATE_MJ` date DEFAULT NULL,
  `QTE_STOCK` int(11) DEFAULT '0',
  `PRIX_VENTE` float DEFAULT NULL,
  `PRIX_PRODUIT` float DEFAULT NULL,
  `CIP` varchar(40) DEFAULT NULL,
  `CODE_BARRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODE_PRODUIT`),
  KEY `FK_APPARTENIR` (`CODE_FAMILLE`),
  KEY `FK_AVOIR_CLASSE` (`CODE_CLASSE`),
  KEY `FK_AVOIR_FORME` (`CODE_FORME`),
  KEY `FK_ETRE_GENERIQUE` (`PRO_CODE_PRODUIT`),
  KEY `FK_EXPLOITER` (`CODE_EXPLOITANT`),
  KEY `FK_FABRIQUER` (`CODE_LAB`),
  KEY `FK_LOCALISER` (`CODE_LOCALISATION`),
  KEY `FK_SPECIALISER` (`CODE_SPECIALITE`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

/*INSERT INTO `produit` (`CODE_PRODUIT`, `CODE_FAMILLE`, `CODE_FORME`, `CODE_CLASSE`, `CODE_EXPLOITANT`, `PRO_CODE_PRODUIT`, `CODE_LOCALISATION`, `CODE_SPECIALITE`, `CODE_LAB`, `DESIGNATION`, `DCI`, `SOUMIS_TVA`, `TAUX_TVA`, `DATE_COMMERCIALISATION`, `PHOTO`, `DATE_ENREGISTREMENT`, `DATE_MJ`, `QTE_STOCK`, `PRIX_VENTE`, `PRIX_PRODUIT`, `CIP`, `CODE_BARRE`) VALUES
(1, 1, 1, 2, 2, NULL, 2, 1, 2, 'Efferlagant', 'H20', 1, 0.14, '2017-06-15', NULL, '2017-07-09 00:00:00', '0000-00-00', 103, NULL, 2541, '', NULL),
(2, 2, 1, 2, 2, NULL, 1, 2, 2, 'Neopred', 'Molecule', 1, 0.2, '2017-06-04', NULL, '2017-07-25 00:00:00', '0000-00-00', 50, NULL, 3652, '', NULL),
(8, 1, 1, 1, 1, NULL, 1, 1, 1, 'Fervex', 'benzene', 1, 0.2, '2017-08-11', NULL, '2017-08-24 00:00:00', '0000-00-00', NULL, NULL, 8640, '123456', 3743764),
(9, 1, 1, 1, 1, NULL, 1, 1, 1, 'PARA SANTOZ', 'PARA', 1, 0.18, '2017-09-17', NULL, '2017-09-15 00:00:00', '0000-00-00', 94, NULL, 2616, '000258', NULL),
(10, 2, 1, 1, 1, NULL, 2, 1, 1, 'PARAFIZ SANDOZ', 'parafiz', 0, 0, '2017-09-01', NULL, '2017-09-16 00:00:00', NULL, 0, NULL, 2000, 'PR0021', NULL),
(11, 1, 1, 1, 1, NULL, 1, 1, 1, 'DOMINO VANILLE', 'DOM', 0, 0, '2017-08-29', NULL, '2017-09-16 00:00:00', '0000-00-00', 140, NULL, 1200, 'D001', NULL),
(12, 1, 1, 1, 1, NULL, 1, 1, 1, 'DOMINO FRAISE', 'DOM002', 0, 0, '2017-08-29', NULL, '2017-09-16 00:00:00', '0000-00-00', 76, NULL, 1200, 'DOM002', NULL),
(13, 2, 1, 2, 2, NULL, 2, 1, 1, 'Doliprane', '101214', 1, 0.18, '2017-03-30', NULL, '2017-09-16 00:00:00', '0000-00-00', -10, NULL, 6213, '7893', NULL),
(14, 1, 2, 2, 1, NULL, 1, 2, 2, 'Forticol', '9632', 1, 0.18, '2016-12-01', NULL, '2017-09-16 00:00:00', NULL, 0, NULL, 6976, '2147', NULL),
(15, 1, 1, 2, 1, NULL, 2, 1, 1, 'CaC1000', '5678', 1, 0.16, '2017-01-03', NULL, '2017-09-16 00:00:00', '0000-00-00', 21, NULL, 3431.28, '6543', 0),
(16, 1, 1, 1, 1, NULL, 1, 1, 1, 'FER FOLDINE', 'fumafer', 0, 0, '2017-09-01', NULL, '2017-09-16 00:00:00', '0000-00-00', 20, NULL, 360, 'FF001', NULL);
*/
-- --------------------------------------------------------

--
-- Structure de la table `produit_entree_fournisseur`
--

CREATE TABLE IF NOT EXISTS `produit_entree_fournisseur` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_ENTREE` int(11) NOT NULL,
  `CODE_FOURNISSEUR` int(11) NOT NULL,
  `NOMBRE_ENTREE` int(11) DEFAULT NULL,
  `QTE_ACHAT` int(11) DEFAULT NULL,
  `QTE_GRATUIT` int(11) DEFAULT NULL,
  `DATE_MAJ` date DEFAULT NULL,
  `MONTANT_DU` int(11) DEFAULT NULL,
  `ACHAT_CREDIT` tinyint(1) DEFAULT NULL,
  `DATE_PEREMPTION` date DEFAULT NULL,
  PRIMARY KEY (`CODE_PRODUIT`,`CODE_ENTREE`,`CODE_FOURNISSEUR`),
  KEY `FK_PRODUIT_ENTREE_FOURNISSEUR` (`CODE_FOURNISSEUR`),
  KEY `FK_PRODUIT_ENTREE_FOURNISSEUR3` (`CODE_ENTREE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit_entree_fournisseur`
--

/*INSERT INTO `produit_entree_fournisseur` (`CODE_PRODUIT`, `CODE_ENTREE`, `CODE_FOURNISSEUR`, `NOMBRE_ENTREE`, `QTE_ACHAT`, `QTE_GRATUIT`, `DATE_MAJ`, `MONTANT_DU`, `ACHAT_CREDIT`, `DATE_PEREMPTION`) VALUES
(1, 1, 2, 13, 10, 3, '0000-00-00', 33033, 0, '2000-02-24'),
(1, 3, 4, 10, 5, 5, '0000-00-00', 25410, 1, '0000-00-00'),
(8, 4, 2, 12, 10, 2, '0000-00-00', 938400, 0, '0000-00-00'),
(8, 6, 2, 12, 10, 2, '0000-00-00', 938400, 0, '0000-00-00'),
(8, 7, 2, 12, 10, 2, '0000-00-00', 938400, 0, '0000-00-00'),
(9, 4, 2, 12, 10, 2, '0000-00-00', 31392, 0, '0000-00-00'),
(9, 6, 2, 12, 10, 2, '0000-00-00', 31392, 0, '0000-00-00'),
(9, 7, 2, 12, 10, 2, '0000-00-00', 31392, 0, '0000-00-00'),
(12, 9, 5, 14, 12, 2, '0000-00-00', 16800, 1, '0000-00-00'),
(12, 10, 5, 14, 12, 2, '0000-00-00', 16800, 1, '0000-00-00'),
(12, 11, 5, 14, 12, 2, '0000-00-00', 16800, 1, '0000-00-00'),
(12, 12, 5, 14, 12, 2, '0000-00-00', 16800, 1, '0000-00-00'),
(15, 8, 5, 21, 20, 1, '0000-00-00', 72057, 1, '0000-00-00'),
(16, 8, 5, 20, 10, 10, '0000-00-00', 7200, 0, '0000-00-00');
*/
-- --------------------------------------------------------

--
-- Structure de la table `produit_sortie`
--

CREATE TABLE IF NOT EXISTS `produit_sortie` (
  `CODE_SORTIE` int(11) NOT NULL,
  `CODE_PRODUIT` int(11) NOT NULL,
  `QTE_SORTIE` int(11) DEFAULT NULL,
  `DATE_SORTIE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_SORTIE`,`CODE_PRODUIT`),
  KEY `FK_PRODUIT_SORTIE` (`CODE_PRODUIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit_sortie`
--

/*INSERT INTO `produit_sortie` (`CODE_SORTIE`, `CODE_PRODUIT`, `QTE_SORTIE`, `DATE_SORTIE`) VALUES
(4, 11, 6, NULL),
(5, 13, 10, NULL);
*/
-- --------------------------------------------------------

--
-- Structure de la table `produit_vendu`
--

CREATE TABLE IF NOT EXISTS `produit_vendu` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `NB_VENDU` int(11) DEFAULT NULL,
  `MONTANT_VENTE` float DEFAULT NULL,
  PRIMARY KEY (`CODE_PRODUIT`,`CODE_VENTE`),
  KEY `FK_PRODUIT_VENDU` (`CODE_VENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit_vendu`
--

/*INSERT INTO `produit_vendu` (`CODE_PRODUIT`, `CODE_VENTE`, `NB_VENDU`, `MONTANT_VENTE`) VALUES
(1, 40, 7, 17787),
(1, 41, 7, 17787),
(1, 42, 7, 17787),
(1, 45, 1, 2541),
(1, 46, 2, 5082),
(1, 54, 2, 5082),
(1, 59, 1, 2541),
(1, 65, 1, 2541),
(1, 67, 3, 7623),
(1, 68, 4, 10164),
(1, 70, 1, 2541),
(1, 71, 4, 10164),
(1, 76, 5, 12705),
(1, 77, 1, 2541),
(1, 79, 1, 2541),
(1, 80, 1, 2541),
(1, 81, 4, 10164),
(1, 82, 5, 12705),
(1, 83, 1, 2541),
(1, 85, 1, 2541),
(2, 1, 2, 2536),
(2, 40, 9, 32868),
(2, 41, 9, 32868),
(2, 42, 9, 32868),
(2, 46, 1, 3652),
(2, 51, 1, 3652),
(2, 58, 1, 3652),
(2, 60, 1, 3652),
(2, 62, 1, 3652),
(2, 68, 1, 3652),
(2, 70, 1, 3652),
(2, 77, 1, 3652),
(2, 78, 2, 7304),
(2, 79, 5, 18260),
(2, 80, 1, 3652),
(2, 81, 6, 21912),
(2, 82, 2, 7304),
(2, 85, 5, 18260),
(2, 86, 1, 3652),
(8, 51, 1, 78200),
(8, 64, 1, 78200),
(8, 67, 9, 703800),
(8, 68, 1, 78200),
(8, 69, 5, 391000),
(8, 71, 5, 391000),
(8, 77, 2, 156400),
(8, 78, 1, 78200),
(8, 79, 1, 78200),
(8, 83, 2, 156400),
(8, 84, 2, 156400),
(8, 85, 1, 78200),
(8, 86, 1, 78200);*/

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE IF NOT EXISTS `societe` (
  `CODE_SOCIETE` int(11) NOT NULL AUTO_INCREMENT,
  `RAISON_SOCIAL` text,
  `TEL1` text,
  `TEL2` text,
  `BP` text,
  `VILLE` text,
  `PAYS` text,
  `SITUATION_GEO` text,
  `COPYRIGHT` text,
  `LOGO` text,
  `NIF` text,
  PRIMARY KEY (`CODE_SOCIETE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `societe`
--

/*INSERT INTO `societe` (`CODE_SOCIETE`, `RAISON_SOCIAL`, `TEL1`, `TEL2`, `BP`, `VILLE`, `PAYS`, `SITUATION_GEO`, `COPYRIGHT`, `LOGO`, `NIF`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);*/

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

CREATE TABLE IF NOT EXISTS `sortie` (
  `CODE_SORTIE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_MOTIF` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `DATE_SORTIE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_SORTIE`),
  KEY `FK_EFFECTUER_SORTIE` (`CODE_USER`),
  KEY `FK_JUSTIFIER` (`CODE_MOTIF`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sortie`
--

/*INSERT INTO `sortie` (`CODE_SORTIE`, `CODE_MOTIF`, `CODE_USER`, `DATE_SORTIE`) VALUES
(1, 2, 7, '0000-00-00'),
(2, 2, 7, '0000-00-00'),
(3, 2, 7, '0000-00-00'),
(4, 2, 7, '0000-00-00'),
(5, 3, 7, '0000-00-00');*/

-- --------------------------------------------------------

--
-- Structure de la table `sortie_caisse`
--

CREATE TABLE IF NOT EXISTS `sortie_caisse` (
  `code_sortie_caisse` int(11) NOT NULL AUTO_INCREMENT,
  `code_journee` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `montant_sortie_caisse` int(10) DEFAULT NULL,
  `date_sortie_caisse` date DEFAULT NULL,
  `motif_sortie_caisse` text,
  `demandeur` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`code_sortie_caisse`),
  KEY `code_journee` (`code_journee`,`code_user`),
  KEY `code_user` (`code_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sortie_caisse`
--

/*INSERT INTO `sortie_caisse` (`code_sortie_caisse`, `code_journee`, `code_user`, `montant_sortie_caisse`, `date_sortie_caisse`, `motif_sortie_caisse`, `demandeur`) VALUES
(1, 1, 1, 500, '2017-09-13', 'Ampoule cassée', 'Kokou'),
(2, 40, 8, 500, '2017-09-13', 'Ampoule cassée', 'Yéhowa Bé i'),
(3, 40, 8, 500, '0000-00-00', 'Ampoule cassée', 'Kokou'),
(4, 40, 8, 500, '0000-00-00', 'Ampoule cassÃ©e', 'Kokou'),
(5, 40, 8, 500, '0000-00-00', 'Ampoule cassÃ©e', 'Kokou'),
(6, 40, 13, 5000, '0000-00-00', 'toto', 'lolo');*/

-- --------------------------------------------------------

--
-- Structure de la table `souscripteur`
--

CREATE TABLE IF NOT EXISTS `souscripteur` (
  `CODE_SOUSCRIPTEUR` int(7) NOT NULL AUTO_INCREMENT,
  `NOM_SOUSCRIPTEUR` text,
  PRIMARY KEY (`CODE_SOUSCRIPTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `CODE_SPECIALITE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_SPECIALITE` text,
  `NUM_SPECIALITE` text,
  PRIMARY KEY (`CODE_SPECIALITE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specialite`
--

/*INSERT INTO `specialite` (`CODE_SPECIALITE`, `NOM_SPECIALITE`, `NUM_SPECIALITE`) VALUES
(1, 'Fièvre', NULL),
(2, 'Paludisme', NULL),
(3, 'TOUX', NULL),
(5, 'grippe aviaire', NULL);*/

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

CREATE TABLE IF NOT EXISTS `travailler` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_JOURNEE` int(11) NOT NULL,
  PRIMARY KEY (`CODE_USER`,`CODE_JOURNEE`),
  KEY `FK_TRAVAILLER` (`CODE_JOURNEE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `CODE_USER` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_PRIVILEGE` int(11) NOT NULL,
  `NOM_USER` text,
  `PRENOM_USER` text,
  `LOGIN` text,
  `PWD` text,
  `STATUT` tinyint(1) DEFAULT NULL,
  `DATE_ENREGISTREMENT` datetime DEFAULT NULL,
  PRIMARY KEY (`CODE_USER`),
  KEY `FK_AVOIR` (`CODE_PRIVILEGE`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`CODE_USER`, `CODE_PRIVILEGE`, `NOM_USER`, `PRENOM_USER`, `LOGIN`, `PWD`, `STATUT`, `DATE_ENREGISTREMENT`) VALUES
(1, 1, 'administrateur', 'admini', 'admin', 'admin', 0, NULL),
(2, 1, 'nom_user', 'prenom_use', 'user', '12dea96fec20593566ab75692c9949596833adc9', 1, NULL),
(3, 2, 'test_nom', 'test_prenom', 'test', '5f2db4ccf14c861f406e678c4c5eb0e45053f604', 0, NULL),
(4, 1, 'Agbogan', 'yonam', 'yoni', 'b2512009c2b5cd932b662cb06095af865f40213b', 0, '2017-08-11 12:38:17'),
(5, 2, 'agosssou', 'sodogan', 'akos', NULL, 0, '2017-08-18 19:58:52'),
(6, 1, 'Administrateur', 'Super', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, '2017-08-28 13:32:33'),
(7, 1, 'ola', 'ola', 'ola', '61bc16255be997b276408b668d064d3491e95831', 1, '2017-08-28 13:33:45'),
(8, 1, 'Lord', 'Arendal', 'Alex', 'd1f3732a9a6a6d5ae438388e1df2164bdb35d371', 0, '2017-08-31 16:04:43'),
(11, 1, 'testDefine', 'testDefine', 'testDefine', NULL, 1, '2017-08-31 19:46:29'),
(12, 1, 'testFinal', 'testFinal', 'testFinal', 'c1a4b699ac7c4165f069e090378df87bed215c96', 0, '2017-08-31 20:41:34'),
(13, 5, 'ola', 'ola', 'ola', '793f970c52ded1276b9264c742f19d1888cbaf73', 0, '2017-08-31 20:50:34'),
(14, 1, 'yoni', 'yoni', 'yoni', '2f08d35865d11f22231d399c1cf6782ec563404f', 0, '2017-08-31 21:05:22'),
(15, 1, 'Sexy', 'couilles', 'sexy', NULL, 1, '2017-09-04 13:38:04'),
(16, 1, 'Sexy', 'couilles', 'sexiest', NULL, 1, '2017-09-04 13:38:19'),
(17, 1, 'topiko', 'kopito', 'zamunokopita', NULL, 0, '2017-09-04 13:41:43'),
(18, 1, 'azer', 'ty', 'azer', '782dd27ea8e3b4f4095ffa38eeb4d20b59069077', 1, '2017-09-08 21:54:33'),
(19, 2, 'testComptoir', 'testComptoir', 'testComptoir', '7741d280d6191f4705c753c9384906e4bdfc3ee3', 0, '2017-09-11 21:44:31'),
(20, 2, 'LEGER', 'LEGER', 'LEGER', '4cbc020b938d39036f3866c0b511f51b146489ce', 0, '2017-09-16 13:56:26'),
(21, 5, 'pass', 'pass', 'pass', '9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684', 0, '2017-09-16 14:01:15'),
(22, 3, 'Abalo', 'Dosseh', 'Abalo', '2dbd61761afe1083aba76cff6885627f82d30167', 0, '2017-09-21 17:05:49'),
(23, 1, 'Kodjo', 'Amoussou', 'Kodjo', '503099cf8879d0fac7f290d5c7be0216e12d8945', 0, '2017-09-21 17:06:19'),
(24, 2, 'Afi', 'Wawa', 'Afi', 'a87b877e94143d8997748f33aa6161e207bfceb1', 0, '2017-09-21 17:06:37');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
  `CODE_VENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_ANNULATION` int(11) DEFAULT NULL,
  `CODE_JOURNEE` int(11) NOT NULL,
  `CODE_CLI` int(11) DEFAULT NULL,
  `CODE_ENCAISSEMENT` int(11) DEFAULT NULL,
  `CODE_USER` int(11) NOT NULL,
  `CODE_BORDEREAU` int(11) DEFAULT NULL,
  `DATE_VENTE` date DEFAULT NULL,
  `POURCENTAGE` float DEFAULT NULL,
  `STATUT` tinyint(1) DEFAULT NULL,
  `HEURE_VENTE` time DEFAULT NULL,
  PRIMARY KEY (`CODE_VENTE`),
  KEY `FK_B` (`CODE_ANNULATION`),
  KEY `FK_CONTRACTER` (`CODE_CLI`),
  KEY `FK_EFFECTUER` (`CODE_USER`),
  KEY `FK_JV` (`CODE_JOURNEE`),
  KEY `FK_MATERIALISER` (`CODE_BORDEREAU`),
  KEY `FK_RELATIONSHIP_1` (`CODE_ENCAISSEMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vente`
--

/*INSERT INTO `vente` (`CODE_VENTE`, `CODE_ANNULATION`, `CODE_JOURNEE`, `CODE_CLI`, `CODE_ENCAISSEMENT`, `CODE_USER`, `CODE_BORDEREAU`, `DATE_VENTE`, `POURCENTAGE`, `STATUT`, `HEURE_VENTE`) VALUES
(1, NULL, 1, 1, 1, 1, 1, '2017-08-03', 0, 1, '18:24:00'),
(37, NULL, 16, NULL, 23, 8, NULL, '2017-09-05', NULL, 1, '13:09:29'),
(40, NULL, 16, NULL, 4, 8, NULL, '2017-09-05', NULL, 1, '13:14:57'),
(41, NULL, 16, NULL, 2, 8, NULL, '2017-09-05', NULL, 1, '13:16:31'),
(42, NULL, 16, NULL, 14, 8, NULL, '2017-09-05', NULL, 1, '13:27:18'),
(45, NULL, 16, NULL, 5, 4, NULL, '2017-09-05', NULL, 1, '13:59:56'),
(46, NULL, 16, NULL, 15, 4, NULL, '2017-09-05', NULL, 1, '14:29:05'),
(51, NULL, 16, NULL, 23, 8, NULL, '2017-09-05', NULL, 1, '18:08:46'),
(54, NULL, 16, NULL, 22, 4, NULL, '2017-09-07', NULL, 1, '12:46:46'),
(58, NULL, 16, NULL, 21, 4, NULL, '2017-09-07', NULL, 1, '17:08:32'),
(59, NULL, 16, NULL, 20, 4, NULL, '2017-09-07', NULL, 1, '17:10:59'),
(60, NULL, 16, NULL, 13, 4, NULL, '2017-09-07', NULL, 1, '17:13:40'),
(62, NULL, 16, NULL, 8, 8, NULL, '2017-09-07', NULL, 1, '17:15:18'),
(63, NULL, 16, NULL, 25, 8, NULL, '2017-09-07', NULL, 1, '17:16:59'),
(64, NULL, 16, NULL, 7, 8, NULL, '2017-09-07', NULL, 1, '17:17:14'),
(65, NULL, 16, NULL, 6, 8, NULL, '2017-09-07', NULL, 1, '17:20:03'),
(66, NULL, 16, NULL, 24, 8, NULL, '2017-09-07', NULL, 1, '17:20:36'),
(67, NULL, 16, NULL, 16, 8, NULL, '2017-09-08', NULL, 1, '17:19:02'),
(68, NULL, 16, NULL, 17, 8, NULL, '2017-09-08', NULL, 1, '19:32:03'),
(69, NULL, 27, NULL, 18, 14, NULL, '2017-09-12', NULL, 1, '14:20:54'),
(70, NULL, 34, NULL, 19, 4, NULL, '2017-09-12', NULL, 1, '22:42:36'),
(71, NULL, 38, NULL, 23, 4, NULL, '2017-09-13', NULL, 1, '14:46:16'),
(72, NULL, 38, NULL, 26, 4, NULL, '2017-09-13', NULL, 1, '14:49:46'),
(73, NULL, 38, NULL, 28, 4, NULL, '2017-09-13', NULL, 1, '14:51:13'),
(74, NULL, 38, NULL, 27, 4, NULL, '2017-09-13', NULL, 1, '14:51:34'),
(76, NULL, 39, NULL, 29, 4, NULL, '2017-09-13', NULL, 1, '18:59:21'),
(77, NULL, 40, NULL, 30, 4, NULL, '2017-09-14', NULL, 1, '11:16:36'),
(78, NULL, 40, NULL, 31, 4, NULL, '2017-09-14', NULL, 1, '11:17:45'),
(79, NULL, 40, NULL, 33, 4, NULL, '2017-09-14', NULL, 1, '12:11:32'),
(80, NULL, 40, NULL, 34, 4, NULL, '2017-09-14', NULL, 1, '13:17:36'),
(81, NULL, 40, NULL, 35, 4, NULL, '2017-09-15', NULL, 1, '10:39:26'),
(82, NULL, 42, NULL, 36, 13, NULL, '2017-09-15', NULL, 1, '15:23:44'),
(83, NULL, 43, NULL, 37, 13, NULL, '2017-09-15', NULL, 1, '15:54:58'),
(84, NULL, 43, NULL, NULL, 7, NULL, '2017-09-16', NULL, 0, '00:46:17'),
(85, NULL, 44, NULL, NULL, 4, NULL, '2017-09-16', NULL, 0, '07:37:33'),
(86, NULL, 44, NULL, NULL, 4, NULL, '2017-09-16', NULL, 0, '07:37:46');*/

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  ADD CONSTRAINT `FK_B2` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_RABATTRE` FOREIGN KEY (`CODE_COM`) REFERENCES `commerciale` (`CODE_COM`);

--
-- Contraintes pour la table `contrat_souscripteur`
--
ALTER TABLE `contrat_souscripteur`
  ADD CONSTRAINT `FK_ETRE_LIE` FOREIGN KEY (`CODE_SOUSCRIPTEUR`) REFERENCES `souscripteur` (`CODE_SOUSCRIPTEUR`);

--
-- Contraintes pour la table `definir_pourcentage`
--
ALTER TABLE `definir_pourcentage`
  ADD CONSTRAINT `FK_DEFINIR_POURCENTAGE` FOREIGN KEY (`CODE_SOUSCRIPTEUR`) REFERENCES `souscripteur` (`CODE_SOUSCRIPTEUR`),
  ADD CONSTRAINT `FK_DEFINIR_POURCENTAGE2` FOREIGN KEY (`CODE_FAMILLE`) REFERENCES `famille_produit` (`CODE_FAMILLE`);

--
-- Contraintes pour la table `depense`
--
ALTER TABLE `depense`
  ADD CONSTRAINT `FK_DEPENSER` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `encaissement`
--
ALTER TABLE `encaissement`
  ADD CONSTRAINT `FK_FAIRE` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_JOURNALISER` FOREIGN KEY (`CODE_JOURNEE`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `FK_PAYER` FOREIGN KEY (`CODE_PAYEMENT`) REFERENCES `mode_payement` (`CODE_PAYEMENT`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Contraintes pour la table `entree`
--
ALTER TABLE `entree`
  ADD CONSTRAINT `FK_EFFECTUER_ENTREE` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `historique_modif`
--
ALTER TABLE `historique_modif`
  ADD CONSTRAINT `FK_HISTORISER` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Contraintes pour la table `journee`
--
ALTER TABLE `journee`
  ADD CONSTRAINT `FK_CLOTURER_JOURNEE` FOREIGN KEY (`CODE_USER_CLOTURER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_FERMER_JOURNEE` FOREIGN KEY (`CODE_USER_FERMER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_OUVRIR_JOURNEE` FOREIGN KEY (`CODE_USER_OUVRIR`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `FK_POSSEDER` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `mode_payement`
--
ALTER TABLE `mode_payement`
  ADD CONSTRAINT `FK_ASSOCIER` FOREIGN KEY (`CODE_BANQUE`) REFERENCES `banque` (`CODE_BANQUE`),
  ADD CONSTRAINT `FK_PAYER_PAR` FOREIGN KEY (`CODE_SOUSCRIPTEUR`) REFERENCES `souscripteur` (`CODE_SOUSCRIPTEUR`);

--
-- Contraintes pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FK_MVE` FOREIGN KEY (`CODE_ENTREE`) REFERENCES `entree` (`CODE_ENTREE`),
  ADD CONSTRAINT `FK_MVS` FOREIGN KEY (`CODE_SORTIE`) REFERENCES `sortie` (`CODE_SORTIE`),
  ADD CONSTRAINT `FK_MVV` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Contraintes pour la table `operationcompte`
--
ALTER TABLE `operationcompte`
  ADD CONSTRAINT `FK_LIER` FOREIGN KEY (`CODE_CLI`) REFERENCES `client` (`CODE_CLI`);

--
-- Contraintes pour la table `operation_fournisseur`
--
ALTER TABLE `operation_fournisseur`
  ADD CONSTRAINT `FK_OPERER` FOREIGN KEY (`CODE_FOURNISSEUR`) REFERENCES `fournisseur` (`CODE_FOURNISSEUR`),
  ADD CONSTRAINT `FK_SUIVRE` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_APPARTENIR` FOREIGN KEY (`CODE_FAMILLE`) REFERENCES `famille_produit` (`CODE_FAMILLE`),
  ADD CONSTRAINT `FK_AVOIR_CLASSE` FOREIGN KEY (`CODE_CLASSE`) REFERENCES `classe_produit` (`CODE_CLASSE`),
  ADD CONSTRAINT `FK_AVOIR_FORME` FOREIGN KEY (`CODE_FORME`) REFERENCES `forme` (`CODE_FORME`),
  ADD CONSTRAINT `FK_ETRE_GENERIQUE` FOREIGN KEY (`PRO_CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`),
  ADD CONSTRAINT `FK_EXPLOITER` FOREIGN KEY (`CODE_EXPLOITANT`) REFERENCES `exploitant` (`CODE_EXPLOITANT`),
  ADD CONSTRAINT `FK_FABRIQUER` FOREIGN KEY (`CODE_LAB`) REFERENCES `laboratoire` (`CODE_LAB`),
  ADD CONSTRAINT `FK_LOCALISER` FOREIGN KEY (`CODE_LOCALISATION`) REFERENCES `localisation` (`CODE_LOCALISATION`),
  ADD CONSTRAINT `FK_SPECIALISER` FOREIGN KEY (`CODE_SPECIALITE`) REFERENCES `specialite` (`CODE_SPECIALITE`);

--
-- Contraintes pour la table `produit_entree_fournisseur`
--
ALTER TABLE `produit_entree_fournisseur`
  ADD CONSTRAINT `FK_PRODUIT_ENTREE_FOURNISSEUR` FOREIGN KEY (`CODE_FOURNISSEUR`) REFERENCES `fournisseur` (`CODE_FOURNISSEUR`),
  ADD CONSTRAINT `FK_PRODUIT_ENTREE_FOURNISSEUR2` FOREIGN KEY (`CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`),
  ADD CONSTRAINT `FK_PRODUIT_ENTREE_FOURNISSEUR3` FOREIGN KEY (`CODE_ENTREE`) REFERENCES `entree` (`CODE_ENTREE`);

--
-- Contraintes pour la table `produit_sortie`
--
ALTER TABLE `produit_sortie`
  ADD CONSTRAINT `FK_PRODUIT_SORTIE` FOREIGN KEY (`CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`),
  ADD CONSTRAINT `FK_PRODUIT_SORTIE2` FOREIGN KEY (`CODE_SORTIE`) REFERENCES `sortie` (`CODE_SORTIE`);

--
-- Contraintes pour la table `produit_vendu`
--
ALTER TABLE `produit_vendu`
  ADD CONSTRAINT `FK_PRODUIT_VENDU` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`),
  ADD CONSTRAINT `FK_PRODUIT_VENDU2` FOREIGN KEY (`CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`);

--
-- Contraintes pour la table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `FK_EFFECTUER_SORTIE` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_JUSTIFIER` FOREIGN KEY (`CODE_MOTIF`) REFERENCES `motif` (`CODE_MOTIF`);

--
-- Contraintes pour la table `sortie_caisse`
--
ALTER TABLE `sortie_caisse`
  ADD CONSTRAINT `ctn1` FOREIGN KEY (`code_journee`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `ctn2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD CONSTRAINT `FK_TRAVAILLER` FOREIGN KEY (`CODE_JOURNEE`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `FK_TRAVAILLER2` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_AVOIR` FOREIGN KEY (`CODE_PRIVILEGE`) REFERENCES `privileges` (`CODE_PRIVILEGE`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_B` FOREIGN KEY (`CODE_ANNULATION`) REFERENCES `annulation_vente` (`CODE_ANNULATION`),
  ADD CONSTRAINT `FK_CONTRACTER` FOREIGN KEY (`CODE_CLI`) REFERENCES `client` (`CODE_CLI`),
  ADD CONSTRAINT `FK_EFFECTUER` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_JV` FOREIGN KEY (`CODE_JOURNEE`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `FK_MATERIALISER` FOREIGN KEY (`CODE_BORDEREAU`) REFERENCES `bordereau` (`CODE_BORDEREAU`),
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`CODE_ENCAISSEMENT`) REFERENCES `encaissement` (`CODE_ENCAISSEMENT`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
