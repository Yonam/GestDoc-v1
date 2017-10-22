-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2017 at 03:18 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharma`
--

-- --------------------------------------------------------

--
-- Table structure for table `annulation_vente`
--

CREATE TABLE `annulation_vente` (
  `CODE_ANNULATION` int(4) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `DATE_ANNULATION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banque`
--

CREATE TABLE `banque` (
  `CODE_BANQUE` int(11) NOT NULL,
  `NUM_BANQUE` text,
  `DESCRIPTION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banque`
--

INSERT INTO `banque` (`CODE_BANQUE`, `NUM_BANQUE`, `DESCRIPTION`) VALUES
(1, '854789655', 'UTB');

-- --------------------------------------------------------

--
-- Table structure for table `bordereau`
--

CREATE TABLE `bordereau` (
  `CODE_BORDEREAU` int(11) NOT NULL,
  `NUMERO_BORDEREAU_COURSIER` text,
  `BENEFICIAIRE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bordereau`
--

INSERT INTO `bordereau` (`CODE_BORDEREAU`, `NUMERO_BORDEREAU_COURSIER`, `BENEFICIAIRE`) VALUES
(1, 'AZR7854693PLO', 'Toto'),
(2, 'ERTG85479652', 'Gerant');

-- --------------------------------------------------------

--
-- Table structure for table `classe_produit`
--

CREATE TABLE `classe_produit` (
  `CODE_CLASSE` int(11) NOT NULL,
  `NUM_CLASS` text,
  `DESCRIPTION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classe_produit`
--

INSERT INTO `classe_produit` (`CODE_CLASSE`, `NUM_CLASS`, `DESCRIPTION`) VALUES
(1, NULL, 'bacterie'),
(2, NULL, 'Anti-biotique');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `CODE_CLI` int(11) NOT NULL,
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
  `DATE_CREATION` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`CODE_CLI`, `CODE_COM`, `TITRE`, `NOM_CLI`, `PRENOM_CLI`, `TYPE_PIECE`, `NUM_PIECE`, `DATE_PIECE`, `EMAIL`, `ADRESSE`, `TEL1`, `TEL2`, `STATUT`, `TOTAL_DU`, `CREDIT_MAX`, `DELAI_PAIEMENT`, `REMISE`, `DROIT_CREDIT`, `DEPASSEMENT`, `DATE_CREATION`) VALUES
(1, 1, 'monsieur', 'toto', 'tata', 'CNI', '989990ki7', '2017-07-05', 'yoyo@yaya.com', 'klikan', '90909090', '98989898', 1, 8900.00, 234456.00, 7, 20, 1, 10000, '2017-07-30 03:22:14'),
(3, 2, 'Mr', 'corbeau', 'yoann', 'CNI', '098889765', '2017-07-20', 'yoann@rookit.com', 'paris', '09988987', '90999988', 0, 0.00, 90000.00, 15, 30, 0, 1, NULL),
(5, 2, 'Mr', 'Notokpe', 'Aicha', 'CNI', '12345678901', '2017-08-17', 'riri@rara.com', 'telessou', '09988987', '003378995544', 0, 0.00, 90000.00, 15, 30, 1, 10, NULL),
(6, 1, 'Mr', 'Notokpe', 'Alex', 'PP', '90888765', '2017-08-09', 'arendal@gmail.com', 'Agoe', '09988987', '97125812', 0, 0.00, 70000.00, 15, 30, 1, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commerciale`
--

CREATE TABLE `commerciale` (
  `CODE_COM` int(10) NOT NULL,
  `NOM_COM` text,
  `PRENOM_COM` text,
  `DATE_EMB` date DEFAULT NULL,
  `TEL_COM` text,
  `TEL_URG` text,
  `ADRESSE` text,
  `EMAIL` text,
  `CHIFFRE` int(11) DEFAULT NULL,
  `POURCENTAGE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commerciale`
--

INSERT INTO `commerciale` (`CODE_COM`, `NOM_COM`, `PRENOM_COM`, `DATE_EMB`, `TEL_COM`, `TEL_URG`, `ADRESSE`, `EMAIL`, `CHIFFRE`, `POURCENTAGE`) VALUES
(1, 'Agbogan', 'oyoyo', '2017-07-05', '92593461', '98628723', 'telessou', 'scribe@scribe.tg', 0, 0.2),
(2, 'toto', 'baba', '2017-07-13', '97125812', '91486620', 'attiegou', 'atabre@gmail.com', 0, 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `compte_produit_`
--

CREATE TABLE `compte_produit_` (
  `CODE_C_FOURNISSEUR` int(11) NOT NULL,
  `CODE_FOURNISSEUR` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `DATE_MAJ_COMPTE` date DEFAULT NULL,
  `MONTANT_MAJ_COMPTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `connexion`
--

CREATE TABLE `connexion` (
  `CODE_CONNEXION` int(11) NOT NULL,
  `LOGIN` text,
  `STATUT` tinyint(1) DEFAULT NULL,
  `IP` text,
  `DATE_CONNEXION` datetime DEFAULT NULL,
  `ACTION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depense`
--

CREATE TABLE `depense` (
  `CODE_DEPENSE` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `OBJET` text,
  `MONTANT` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `COMMENTAIRE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `encaissement`
--

CREATE TABLE `encaissement` (
  `CODE_ENCAISSEMENT` int(11) NOT NULL,
  `CODE_JOURNEE` int(11) NOT NULL,
  `CODE_PAIEMENT` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `TYPE` text,
  `DATE_ENCAISSEMENT` datetime DEFAULT NULL,
  `STATUT` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `encaissement`
--

INSERT INTO `encaissement` (`CODE_ENCAISSEMENT`, `CODE_JOURNEE`, `CODE_PAIEMENT`, `CODE_VENTE`, `CODE_USER`, `TYPE`, `DATE_ENCAISSEMENT`, `STATUT`) VALUES
(1, 1, 1, 1, 1, 'Liquide', '2017-08-09 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `entree`
--

CREATE TABLE `entree` (
  `CODE_ENTREE` int(10) NOT NULL,
  `DATE_ENTREE` date DEFAULT NULL,
  `NUMERO_FACTURE` text,
  `NUMERO_BORDEREAU` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exploitant`
--

CREATE TABLE `exploitant` (
  `CODE_EXPLOITANT` int(11) NOT NULL,
  `NUM_EXPLOITANT` text,
  `LIBELLE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exploitant`
--

INSERT INTO `exploitant` (`CODE_EXPLOITANT`, `NUM_EXPLOITANT`, `LIBELLE`) VALUES
(1, NULL, 'Dafra'),
(2, NULL, 'Medis');

-- --------------------------------------------------------

--
-- Table structure for table `famille_produit`
--

CREATE TABLE `famille_produit` (
  `CODE_FAMILLE` int(10) NOT NULL,
  `NUM_FAMILLE` text,
  `NOM_FAMILLE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `famille_produit`
--

INSERT INTO `famille_produit` (`CODE_FAMILLE`, `NUM_FAMILLE`, `NOM_FAMILLE`) VALUES
(1, NULL, 'Gellule'),
(2, NULL, 'Effervescent');

-- --------------------------------------------------------

--
-- Table structure for table `forme`
--

CREATE TABLE `forme` (
  `CODE_FORME` int(11) NOT NULL,
  `NOM_FORME` text,
  `NUM_FORME` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forme`
--

INSERT INTO `forme` (`CODE_FORME`, `NOM_FORME`, `NUM_FORME`) VALUES
(1, 'Ronde', NULL),
(2, 'Liquide', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `CODE_FOURNISSEUR` int(11) NOT NULL,
  `RAISON_SOCIAL` text,
  `CONCTACT` text,
  `TEL` text,
  `TEL_URG` text,
  `EMAIL` text,
  `ADRESSE` text,
  `SOLDE_COMPTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`CODE_FOURNISSEUR`, `RAISON_SOCIAL`, `CONCTACT`, `TEL`, `TEL_URG`, `EMAIL`, `ADRESSE`, `SOLDE_COMPTE`) VALUES
(1, 'Coaret', NULL, 'kristar@live.fr', 'Tosti rue 228 ', '7459633', '7459633', 0),
(2, 'NSIA', 'Kossi Eucky', '90989796', '003378995544', 'riri@rara.com', 'paris', 0),
(3, 'WndH', 'yonam Agbogan', '97125812', '91486620', 'yoni@webandhack.com', 'klikame', 0);

-- --------------------------------------------------------

--
-- Table structure for table `historique_modif`
--

CREATE TABLE `historique_modif` (
  `CODE_HISTORIQUE` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `ANCIEN` int(11) DEFAULT NULL,
  `QTEANCAV` float DEFAULT NULL,
  `QTEANCAP` float DEFAULT NULL,
  `NOUVEAU` float DEFAULT NULL,
  `QTENOUVAV` float DEFAULT NULL,
  `QTENOUVAP` float DEFAULT NULL,
  `DATE_OPERATION` datetime DEFAULT NULL,
  `LOGIN` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journee`
--

CREATE TABLE `journee` (
  `CODE_JOURNEE` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `DATE_OUVERTURE` datetime DEFAULT NULL,
  `DATE_FERMETURE` datetime DEFAULT NULL,
  `DATE_CLOTURE` datetime DEFAULT NULL,
  `STATUT` tinyint(1) DEFAULT NULL,
  `MONTANT_FERMETURE` float(8,2) DEFAULT NULL,
  `MONTANT_CLOTURE` float(8,2) DEFAULT NULL,
  `MONTANT_MANQUANT` float(8,2) DEFAULT NULL,
  `MONTANT_SURPLUS` float(8,2) DEFAULT NULL,
  `CODE_USER_OUVRIR` int(11) NOT NULL,
  `CODE_USER_FERMER` int(11) DEFAULT NULL,
  `CODE_USER_CLOTURER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journee`
--

INSERT INTO `journee` (`CODE_JOURNEE`, `DATE`, `DATE_OUVERTURE`, `DATE_FERMETURE`, `DATE_CLOTURE`, `STATUT`, `MONTANT_FERMETURE`, `MONTANT_CLOTURE`, `MONTANT_MANQUANT`, `MONTANT_SURPLUS`, `CODE_USER_OUVRIR`, `CODE_USER_FERMER`, `CODE_USER_CLOTURER`) VALUES
(1, '2017-08-09', '2017-08-09 00:00:00', '2017-08-16 00:00:00', '2017-08-10 00:00:00', 0, 250000.00, 254000.00, 0.00, 300.00, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laboratoire`
--

CREATE TABLE `laboratoire` (
  `CODE_LAB` int(10) NOT NULL,
  `NUMERO_LAB` text,
  `NOM_LABORATOIRE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratoire`
--

INSERT INTO `laboratoire` (`CODE_LAB`, `NUMERO_LAB`, `NOM_LABORATOIRE`) VALUES
(1, NULL, 'Bio-Pharma'),
(2, NULL, 'Dietetique');

-- --------------------------------------------------------

--
-- Table structure for table `localisation`
--

CREATE TABLE `localisation` (
  `CODE_LOCALISATION` int(11) NOT NULL,
  `NUM_LOCALISATION` text,
  `NOM_LOCALISATION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `localisation`
--

INSERT INTO `localisation` (`CODE_LOCALISATION`, `NUM_LOCALISATION`, `NOM_LOCALISATION`) VALUES
(1, NULL, 'Etagère 4'),
(2, NULL, 'Etagère 2');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `CODE_LOG` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `LOGIN` text,
  `HEURE` datetime DEFAULT NULL,
  `EVENEMENT` text,
  `STATUT` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mode_payement`
--

CREATE TABLE `mode_payement` (
  `CODE_PAIEMENT` int(11) NOT NULL,
  `CODE_BANQUE` int(11) DEFAULT NULL,
  `DESCRIPTION` text,
  `NUM_CHEQUE` int(11) DEFAULT NULL,
  `MONTANT` int(11) DEFAULT NULL,
  `DATE_CHEQUE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mode_payement`
--

INSERT INTO `mode_payement` (`CODE_PAIEMENT`, `CODE_BANQUE`, `DESCRIPTION`, `NUM_CHEQUE`, `MONTANT`, `DATE_CHEQUE`) VALUES
(1, 1, 'UTB', 25478965, 30000, '2017-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `motif`
--

CREATE TABLE `motif` (
  `CODE_MOTIF` int(11) NOT NULL,
  `DESCRIPTION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mouvement`
--

CREATE TABLE `mouvement` (
  `CODE_MOUVEMENT` int(10) NOT NULL,
  `CODE_SORTIE` int(11) DEFAULT NULL,
  `CODE_ENTREE` int(11) DEFAULT NULL,
  `CODE_VENTE` int(11) DEFAULT NULL,
  `LIBELLE` text,
  `DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `operationcompte`
--

CREATE TABLE `operationcompte` (
  `CODE_COMPTE` int(11) NOT NULL,
  `CODE_CLI` int(11) NOT NULL,
  `SOLDE` float(8,2) DEFAULT NULL,
  `MONTANT_VERSE` float(8,2) DEFAULT NULL,
  `RESTE` float(8,2) DEFAULT NULL,
  `DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `CODE_PRIVILEGE` int(11) NOT NULL,
  `DESIGNATION` text,
  `LEVEL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`CODE_PRIVILEGE`, `DESIGNATION`, `LEVEL`) VALUES
(1, 'administrateur', 5),
(2, 'Comptoir', 3);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_FAMILLE` int(11) NOT NULL,
  `CODE_FORME` int(11) NOT NULL,
  `CODE_CLASSE` int(11) DEFAULT NULL,
  `CODE_EXPLOITANT` int(11) NOT NULL,
  `PRO_CODE_PRODUIT` int(11) DEFAULT NULL,
  `CODE_LOCALISATION` int(11) NOT NULL,
  `CODE_SPECIALITE` int(11) NOT NULL,
  `CODE_LAB` int(11) NOT NULL,
  `DESIGNATION` text,
  `DCI` text,
  `SOUMIS_TVA` tinyint(1) DEFAULT '0',
  `DATE_COMMERCIALISATION` date DEFAULT NULL,
  `PHOTO` text,
  `DATE_ENREGISTREMENT` datetime DEFAULT NULL,
  `DATE_MJ` date DEFAULT NULL,
  `DATE_PEREMPTION` date DEFAULT NULL,
  `QTE_STOCK` int(11) DEFAULT NULL,
  `PRIX_PRODUIT` float DEFAULT NULL,
  `CIP` varchar(40) DEFAULT NULL,
  `CODE_BARRE` int(11) DEFAULT NULL,
  `TAUX_TVA` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`CODE_PRODUIT`, `CODE_FAMILLE`, `CODE_FORME`, `CODE_CLASSE`, `CODE_EXPLOITANT`, `PRO_CODE_PRODUIT`, `CODE_LOCALISATION`, `CODE_SPECIALITE`, `CODE_LAB`, `DESIGNATION`, `DCI`, `SOUMIS_TVA`, `DATE_COMMERCIALISATION`, `PHOTO`, `DATE_ENREGISTREMENT`, `DATE_MJ`, `DATE_PEREMPTION`, `QTE_STOCK`, `PRIX_PRODUIT`, `CIP`, `CODE_BARRE`, `TAUX_TVA`) VALUES
(1, 1, 1, 2, 2, NULL, 2, 1, 2, 'Efferlagant', 'H20', 1, '2017-06-15', NULL, '2017-07-09 00:00:00', '2017-07-15', '2017-12-22', 25, 2541, '', NULL, 0),
(2, 2, 1, 2, 2, NULL, 1, 2, 2, 'Neopred', 'Molecule', 1, '2017-06-04', NULL, '2017-07-25 00:00:00', '2017-07-28', '2017-10-21', 30, 3652, '', NULL, 0),
(7, 1, 1, 1, 1, NULL, 1, 1, 1, 'savon', 'ethanol', 1, '2017-08-16', NULL, '2017-08-11 00:00:00', NULL, '2017-08-07', NULL, 99059, '8988342', 123434, 18),
(8, 1, 1, 1, 1, NULL, 1, 1, 1, 'fervex', 'benzene', 1, '2017-08-11', NULL, '2017-08-24 00:00:00', NULL, '2017-08-22', NULL, 78200, '123456', 3743764, 20);

-- --------------------------------------------------------

--
-- Table structure for table `produit_entree_fournisseur`
--

CREATE TABLE `produit_entree_fournisseur` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_ENTREE` int(11) NOT NULL,
  `CODE_FOURNISSEUR` int(11) NOT NULL,
  `NOMBRE_ENTREE` int(11) DEFAULT NULL,
  `QTE_ACHAT` int(11) DEFAULT NULL,
  `QTE_GRATUIT` int(11) DEFAULT NULL,
  `DATE_MAJ` date DEFAULT NULL,
  `MONTANT_DU` int(11) DEFAULT NULL,
  `ACHAT_CREDIT` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produit_sortie`
--

CREATE TABLE `produit_sortie` (
  `CODE_SORTIE` int(11) NOT NULL,
  `CODE_PRODUIT` int(11) NOT NULL,
  `QTE_SORTIE` int(11) DEFAULT NULL,
  `DATE_SORTIE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produit_vendu`
--

CREATE TABLE `produit_vendu` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `NB_VENDU` int(11) DEFAULT NULL,
  `MONTANT_VENTE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit_vendu`
--

INSERT INTO `produit_vendu` (`CODE_PRODUIT`, `CODE_VENTE`, `NB_VENDU`, `MONTANT_VENTE`) VALUES
(2, 1, 2, 2536);

-- --------------------------------------------------------

--
-- Table structure for table `societe`
--

CREATE TABLE `societe` (
  `CODE_SOCIETE` int(11) NOT NULL,
  `RAISON_SOCIAL` text,
  `TEL1` text,
  `TEL2` text,
  `BP` text,
  `VILLE` text,
  `PAYS` text,
  `SITUATION_GEO` text,
  `COPYRIGHT` text,
  `LOGO` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sortie`
--

CREATE TABLE `sortie` (
  `CODE_SORTIE` int(11) NOT NULL,
  `CODE_MOTIF` int(11) NOT NULL,
  `DATE_SORTIE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

CREATE TABLE `specialite` (
  `CODE_SPECIALITE` int(11) NOT NULL,
  `NOM_SPECIALITE` text,
  `NUM_SPECIALITE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`CODE_SPECIALITE`, `NOM_SPECIALITE`, `NUM_SPECIALITE`) VALUES
(1, 'Fièvre', NULL),
(2, 'Paludisme', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `travailler`
--

CREATE TABLE `travailler` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_JOURNEE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_PRIVILEGE` int(11) NOT NULL,
  `NOM_USER` text,
  `PRENOM_USER` text,
  `LOGIN` text,
  `PWD` text,
  `STATUT` tinyint(1) DEFAULT NULL,
  `DATE_ENREGISTREMENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`CODE_USER`, `CODE_PRIVILEGE`, `NOM_USER`, `PRENOM_USER`, `LOGIN`, `PWD`, `STATUT`, `DATE_ENREGISTREMENT`) VALUES
(1, 1, 'administrateur', 'admini', 'admin', 'admin', 0, NULL),
(2, 1, 'nom_user', 'prenom_user', 'user', '12dea96fec20593566ab75692c9949596833adc9', 1, NULL),
(3, 2, 'test_nom', 'test_prenom', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 0, NULL),
(4, 1, 'Agbogan', 'yonam', 'yoni', 'b2512009c2b5cd932b662cb06095af865f40213b', 0, '2017-08-11 12:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `CODE_VENTE` int(11) NOT NULL,
  `CODE_ANNULATION` int(11) DEFAULT NULL,
  `CODE_JOURNEE` int(11) NOT NULL,
  `CODE_CLI` int(11) NOT NULL,
  `CODE_ENCAISSEMENT` int(11) DEFAULT NULL,
  `CODE_USER` int(11) NOT NULL,
  `CODE_BORDEREAU` int(11) NOT NULL,
  `DATE_VENTE` date DEFAULT NULL,
  `POURCENTAGE` float DEFAULT NULL,
  `STATUT` tinyint(1) DEFAULT NULL,
  `HEURE_VENTE` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vente`
--

INSERT INTO `vente` (`CODE_VENTE`, `CODE_ANNULATION`, `CODE_JOURNEE`, `CODE_CLI`, `CODE_ENCAISSEMENT`, `CODE_USER`, `CODE_BORDEREAU`, `DATE_VENTE`, `POURCENTAGE`, `STATUT`, `HEURE_VENTE`) VALUES
(1, NULL, 1, 1, NULL, 1, 1, '2017-08-03', 0, 0, '18:24:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  ADD PRIMARY KEY (`CODE_ANNULATION`),
  ADD KEY `FK_B2` (`CODE_VENTE`);

--
-- Indexes for table `banque`
--
ALTER TABLE `banque`
  ADD PRIMARY KEY (`CODE_BANQUE`);

--
-- Indexes for table `bordereau`
--
ALTER TABLE `bordereau`
  ADD PRIMARY KEY (`CODE_BORDEREAU`);

--
-- Indexes for table `classe_produit`
--
ALTER TABLE `classe_produit`
  ADD PRIMARY KEY (`CODE_CLASSE`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CODE_CLI`),
  ADD KEY `FK_RABATTRE` (`CODE_COM`);

--
-- Indexes for table `commerciale`
--
ALTER TABLE `commerciale`
  ADD PRIMARY KEY (`CODE_COM`);

--
-- Indexes for table `compte_produit_`
--
ALTER TABLE `compte_produit_`
  ADD PRIMARY KEY (`CODE_C_FOURNISSEUR`),
  ADD KEY `FK_OPERER` (`CODE_FOURNISSEUR`),
  ADD KEY `FK_SUIVRE` (`CODE_USER`);

--
-- Indexes for table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`CODE_CONNEXION`);

--
-- Indexes for table `depense`
--
ALTER TABLE `depense`
  ADD PRIMARY KEY (`CODE_DEPENSE`),
  ADD KEY `FK_DEPENSER` (`CODE_USER`);

--
-- Indexes for table `encaissement`
--
ALTER TABLE `encaissement`
  ADD PRIMARY KEY (`CODE_ENCAISSEMENT`),
  ADD KEY `FK_FAIRE` (`CODE_USER`),
  ADD KEY `FK_JOURNALISER` (`CODE_JOURNEE`),
  ADD KEY `FK_PAYER` (`CODE_PAIEMENT`),
  ADD KEY `FK_RELATIONSHIP_2` (`CODE_VENTE`);

--
-- Indexes for table `entree`
--
ALTER TABLE `entree`
  ADD PRIMARY KEY (`CODE_ENTREE`);

--
-- Indexes for table `exploitant`
--
ALTER TABLE `exploitant`
  ADD PRIMARY KEY (`CODE_EXPLOITANT`);

--
-- Indexes for table `famille_produit`
--
ALTER TABLE `famille_produit`
  ADD PRIMARY KEY (`CODE_FAMILLE`);

--
-- Indexes for table `forme`
--
ALTER TABLE `forme`
  ADD PRIMARY KEY (`CODE_FORME`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`CODE_FOURNISSEUR`);

--
-- Indexes for table `historique_modif`
--
ALTER TABLE `historique_modif`
  ADD PRIMARY KEY (`CODE_HISTORIQUE`),
  ADD KEY `FK_HISTORISER` (`CODE_VENTE`);

--
-- Indexes for table `journee`
--
ALTER TABLE `journee`
  ADD PRIMARY KEY (`CODE_JOURNEE`),
  ADD KEY `FK_FERMER_JOURNEE` (`CODE_USER_FERMER`),
  ADD KEY `FK_OUVRIR_JOURNEE` (`CODE_USER_OUVRIR`),
  ADD KEY `FK_CLOTURER_JOURNEE` (`CODE_USER_CLOTURER`);

--
-- Indexes for table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD PRIMARY KEY (`CODE_LAB`);

--
-- Indexes for table `localisation`
--
ALTER TABLE `localisation`
  ADD PRIMARY KEY (`CODE_LOCALISATION`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`CODE_LOG`),
  ADD KEY `FK_POSSEDER` (`CODE_USER`);

--
-- Indexes for table `mode_payement`
--
ALTER TABLE `mode_payement`
  ADD PRIMARY KEY (`CODE_PAIEMENT`),
  ADD KEY `FK_ASSOCIER` (`CODE_BANQUE`);

--
-- Indexes for table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`CODE_MOTIF`);

--
-- Indexes for table `mouvement`
--
ALTER TABLE `mouvement`
  ADD PRIMARY KEY (`CODE_MOUVEMENT`),
  ADD KEY `FK_MVE` (`CODE_ENTREE`),
  ADD KEY `FK_MVS` (`CODE_SORTIE`),
  ADD KEY `FK_MVV` (`CODE_VENTE`);

--
-- Indexes for table `operationcompte`
--
ALTER TABLE `operationcompte`
  ADD PRIMARY KEY (`CODE_COMPTE`),
  ADD KEY `FK_LIER` (`CODE_CLI`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`CODE_PRIVILEGE`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CODE_PRODUIT`),
  ADD KEY `FK_APPARTENIR` (`CODE_FAMILLE`),
  ADD KEY `FK_AVOIR_CLASSE` (`CODE_CLASSE`),
  ADD KEY `FK_AVOIR_FORME` (`CODE_FORME`),
  ADD KEY `FK_ETRE_GENERIQUE` (`PRO_CODE_PRODUIT`),
  ADD KEY `FK_EXPLOITER` (`CODE_EXPLOITANT`),
  ADD KEY `FK_FABRIQUER` (`CODE_LAB`),
  ADD KEY `FK_LOCALISER` (`CODE_LOCALISATION`),
  ADD KEY `FK_SPECIALISER` (`CODE_SPECIALITE`);

--
-- Indexes for table `produit_entree_fournisseur`
--
ALTER TABLE `produit_entree_fournisseur`
  ADD PRIMARY KEY (`CODE_PRODUIT`,`CODE_ENTREE`,`CODE_FOURNISSEUR`),
  ADD KEY `FK_PRODUIT_ENTREE_FOURNISSEUR` (`CODE_FOURNISSEUR`),
  ADD KEY `FK_PRODUIT_ENTREE_FOURNISSEUR3` (`CODE_ENTREE`);

--
-- Indexes for table `produit_sortie`
--
ALTER TABLE `produit_sortie`
  ADD PRIMARY KEY (`CODE_SORTIE`,`CODE_PRODUIT`),
  ADD KEY `FK_PRODUIT_SORTIE` (`CODE_PRODUIT`);

--
-- Indexes for table `produit_vendu`
--
ALTER TABLE `produit_vendu`
  ADD PRIMARY KEY (`CODE_PRODUIT`,`CODE_VENTE`),
  ADD KEY `FK_PRODUIT_VENDU` (`CODE_VENTE`);

--
-- Indexes for table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`CODE_SOCIETE`);

--
-- Indexes for table `sortie`
--
ALTER TABLE `sortie`
  ADD PRIMARY KEY (`CODE_SORTIE`),
  ADD KEY `FK_JUSTIFIER` (`CODE_MOTIF`);

--
-- Indexes for table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`CODE_SPECIALITE`);

--
-- Indexes for table `travailler`
--
ALTER TABLE `travailler`
  ADD PRIMARY KEY (`CODE_USER`,`CODE_JOURNEE`),
  ADD KEY `FK_TRAVAILLER` (`CODE_JOURNEE`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`CODE_USER`),
  ADD KEY `FK_AVOIR` (`CODE_PRIVILEGE`);

--
-- Indexes for table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`CODE_VENTE`),
  ADD KEY `FK_B` (`CODE_ANNULATION`),
  ADD KEY `FK_CONTRACTER` (`CODE_CLI`),
  ADD KEY `FK_EFFECTUER` (`CODE_USER`),
  ADD KEY `FK_JV` (`CODE_JOURNEE`),
  ADD KEY `FK_MATERIALISER` (`CODE_BORDEREAU`),
  ADD KEY `FK_RELATIONSHIP_1` (`CODE_ENCAISSEMENT`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  MODIFY `CODE_ANNULATION` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banque`
--
ALTER TABLE `banque`
  MODIFY `CODE_BANQUE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bordereau`
--
ALTER TABLE `bordereau`
  MODIFY `CODE_BORDEREAU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `classe_produit`
--
ALTER TABLE `classe_produit`
  MODIFY `CODE_CLASSE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `CODE_CLI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `commerciale`
--
ALTER TABLE `commerciale`
  MODIFY `CODE_COM` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `compte_produit_`
--
ALTER TABLE `compte_produit_`
  MODIFY `CODE_C_FOURNISSEUR` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `CODE_CONNEXION` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `depense`
--
ALTER TABLE `depense`
  MODIFY `CODE_DEPENSE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `encaissement`
--
ALTER TABLE `encaissement`
  MODIFY `CODE_ENCAISSEMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `entree`
--
ALTER TABLE `entree`
  MODIFY `CODE_ENTREE` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exploitant`
--
ALTER TABLE `exploitant`
  MODIFY `CODE_EXPLOITANT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `famille_produit`
--
ALTER TABLE `famille_produit`
  MODIFY `CODE_FAMILLE` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `forme`
--
ALTER TABLE `forme`
  MODIFY `CODE_FORME` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `CODE_FOURNISSEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `historique_modif`
--
ALTER TABLE `historique_modif`
  MODIFY `CODE_HISTORIQUE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journee`
--
ALTER TABLE `journee`
  MODIFY `CODE_JOURNEE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `laboratoire`
--
ALTER TABLE `laboratoire`
  MODIFY `CODE_LAB` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `localisation`
--
ALTER TABLE `localisation`
  MODIFY `CODE_LOCALISATION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `CODE_LOG` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mode_payement`
--
ALTER TABLE `mode_payement`
  MODIFY `CODE_PAIEMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `motif`
--
ALTER TABLE `motif`
  MODIFY `CODE_MOTIF` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `CODE_MOUVEMENT` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `operationcompte`
--
ALTER TABLE `operationcompte`
  MODIFY `CODE_COMPTE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `CODE_PRIVILEGE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `CODE_PRODUIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `societe`
--
ALTER TABLE `societe`
  MODIFY `CODE_SOCIETE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sortie`
--
ALTER TABLE `sortie`
  MODIFY `CODE_SORTIE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `CODE_SPECIALITE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `CODE_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vente`
--
ALTER TABLE `vente`
  MODIFY `CODE_VENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  ADD CONSTRAINT `FK_B2` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_RABATTRE` FOREIGN KEY (`CODE_COM`) REFERENCES `commerciale` (`CODE_COM`);

--
-- Constraints for table `compte_produit_`
--
ALTER TABLE `compte_produit_`
  ADD CONSTRAINT `FK_OPERER` FOREIGN KEY (`CODE_FOURNISSEUR`) REFERENCES `fournisseur` (`CODE_FOURNISSEUR`),
  ADD CONSTRAINT `FK_SUIVRE` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Constraints for table `depense`
--
ALTER TABLE `depense`
  ADD CONSTRAINT `FK_DEPENSER` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Constraints for table `encaissement`
--
ALTER TABLE `encaissement`
  ADD CONSTRAINT `FK_FAIRE` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_JOURNALISER` FOREIGN KEY (`CODE_JOURNEE`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `FK_PAYER` FOREIGN KEY (`CODE_PAIEMENT`) REFERENCES `mode_payement` (`CODE_PAIEMENT`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Constraints for table `historique_modif`
--
ALTER TABLE `historique_modif`
  ADD CONSTRAINT `FK_HISTORISER` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Constraints for table `journee`
--
ALTER TABLE `journee`
  ADD CONSTRAINT `FK_CLOTURER_JOURNEE` FOREIGN KEY (`CODE_USER_CLOTURER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_FERMER_JOURNEE` FOREIGN KEY (`CODE_USER_FERMER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_OUVRIR_JOURNEE` FOREIGN KEY (`CODE_USER_OUVRIR`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `FK_POSSEDER` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Constraints for table `mode_payement`
--
ALTER TABLE `mode_payement`
  ADD CONSTRAINT `FK_ASSOCIER` FOREIGN KEY (`CODE_BANQUE`) REFERENCES `banque` (`CODE_BANQUE`);

--
-- Constraints for table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FK_MVE` FOREIGN KEY (`CODE_ENTREE`) REFERENCES `entree` (`CODE_ENTREE`),
  ADD CONSTRAINT `FK_MVS` FOREIGN KEY (`CODE_SORTIE`) REFERENCES `sortie` (`CODE_SORTIE`),
  ADD CONSTRAINT `FK_MVV` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`);

--
-- Constraints for table `operationcompte`
--
ALTER TABLE `operationcompte`
  ADD CONSTRAINT `FK_LIER` FOREIGN KEY (`CODE_CLI`) REFERENCES `client` (`CODE_CLI`);

--
-- Constraints for table `produit`
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
-- Constraints for table `produit_entree_fournisseur`
--
ALTER TABLE `produit_entree_fournisseur`
  ADD CONSTRAINT `FK_PRODUIT_ENTREE_FOURNISSEUR` FOREIGN KEY (`CODE_FOURNISSEUR`) REFERENCES `fournisseur` (`CODE_FOURNISSEUR`),
  ADD CONSTRAINT `FK_PRODUIT_ENTREE_FOURNISSEUR2` FOREIGN KEY (`CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`),
  ADD CONSTRAINT `FK_PRODUIT_ENTREE_FOURNISSEUR3` FOREIGN KEY (`CODE_ENTREE`) REFERENCES `entree` (`CODE_ENTREE`);

--
-- Constraints for table `produit_sortie`
--
ALTER TABLE `produit_sortie`
  ADD CONSTRAINT `FK_PRODUIT_SORTIE` FOREIGN KEY (`CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`),
  ADD CONSTRAINT `FK_PRODUIT_SORTIE2` FOREIGN KEY (`CODE_SORTIE`) REFERENCES `sortie` (`CODE_SORTIE`);

--
-- Constraints for table `produit_vendu`
--
ALTER TABLE `produit_vendu`
  ADD CONSTRAINT `FK_PRODUIT_VENDU` FOREIGN KEY (`CODE_VENTE`) REFERENCES `vente` (`CODE_VENTE`),
  ADD CONSTRAINT `FK_PRODUIT_VENDU2` FOREIGN KEY (`CODE_PRODUIT`) REFERENCES `produit` (`CODE_PRODUIT`);

--
-- Constraints for table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `FK_JUSTIFIER` FOREIGN KEY (`CODE_MOTIF`) REFERENCES `motif` (`CODE_MOTIF`);

--
-- Constraints for table `travailler`
--
ALTER TABLE `travailler`
  ADD CONSTRAINT `FK_TRAVAILLER` FOREIGN KEY (`CODE_JOURNEE`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `FK_TRAVAILLER2` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_AVOIR` FOREIGN KEY (`CODE_PRIVILEGE`) REFERENCES `privileges` (`CODE_PRIVILEGE`);

--
-- Constraints for table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_B` FOREIGN KEY (`CODE_ANNULATION`) REFERENCES `annulation_vente` (`CODE_ANNULATION`),
  ADD CONSTRAINT `FK_CONTRACTER` FOREIGN KEY (`CODE_CLI`) REFERENCES `client` (`CODE_CLI`),
  ADD CONSTRAINT `FK_EFFECTUER` FOREIGN KEY (`CODE_USER`) REFERENCES `utilisateur` (`CODE_USER`),
  ADD CONSTRAINT `FK_JV` FOREIGN KEY (`CODE_JOURNEE`) REFERENCES `journee` (`CODE_JOURNEE`),
  ADD CONSTRAINT `FK_MATERIALISER` FOREIGN KEY (`CODE_BORDEREAU`) REFERENCES `bordereau` (`CODE_BORDEREAU`),
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`CODE_ENCAISSEMENT`) REFERENCES `encaissement` (`CODE_ENCAISSEMENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
