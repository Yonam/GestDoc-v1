-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2017 at 08:41 PM
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
  `DATE_ANNULATION` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banque`
--

CREATE TABLE `banque` (
  `CODE_BANQUE` int(11) NOT NULL,
  `NUM_BANQUE` text,
  `DESCRIPTION` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bordereau`
--

CREATE TABLE `bordereau` (
  `CODE_BORDEREAU` int(11) NOT NULL,
  `NUMERO_BORDEREAU_COURSIER` text,
  `BENEFICIAIRE` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classe_produit`
--

CREATE TABLE `classe_produit` (
  `CODE_CLASSE` int(11) NOT NULL,
  `NUM_CLASS` text,
  `DESCRIPTION` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `STATUT` text,
  `TOTAL_DU` float(8,2) DEFAULT NULL,
  `CREDIT_MAX` float(8,2) DEFAULT NULL,
  `DELAI_PAIEMENT` int(11) DEFAULT NULL,
  `REMISE` float DEFAULT NULL,
  `DROIT_CREDIT` tinyint(1) DEFAULT NULL,
  `DEPASSEMENT` float DEFAULT NULL,
  `DATE_CREATION` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connexion`
--

CREATE TABLE `connexion` (
  `CODE_CONNEXION` int(11) NOT NULL,
  `LOGIN` text,
  `STATUT` text,
  `IP` text,
  `DATE_CONNEXION` datetime DEFAULT NULL,
  `ACTION` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `encaissement`
--

CREATE TABLE `encaissement` (
  `CODE_ENCAISSEMENT` int(11) NOT NULL,
  `CODE_JOURNEE` int(11) NOT NULL,
  `CODE_PAIEMENT` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `TYPE` text,
  `DATE_ENCAISSEMENT` datetime DEFAULT NULL,
  `STATUT` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entree`
--

CREATE TABLE `entree` (
  `CODE_ENTREE` int(10) NOT NULL,
  `DATE_ENTREE` date DEFAULT NULL,
  `NUMERO_FACTURE` text,
  `NUMERO_BORDEREAU` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exploitant`
--

CREATE TABLE `exploitant` (
  `CODE_EXPLOITANT` int(11) NOT NULL,
  `NUM_EXPLOITANT` text,
  `LIBELLE` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `famille_produit`
--

CREATE TABLE `famille_produit` (
  `CODE_FAMILLE` int(10) NOT NULL,
  `NUM_FAMILLE` text,
  `NOM_FAMILLE` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forme`
--

CREATE TABLE `forme` (
  `CODE_FORME` int(11) NOT NULL,
  `NOM_FORME` text,
  `NUM_FORME` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fournir`
--

CREATE TABLE `fournir` (
  `CODE_FOURNISSEUR` int(11) NOT NULL,
  `CODE_PRODUIT` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`CODE_FOURNISSEUR`, `RAISON_SOCIAL`, `CONCTACT`, `TEL`, `TEL_URG`, `EMAIL`, `ADRESSE`, `SOLDE_COMPTE`) VALUES
(1, 'toto', 'tata', '92593461', '98628723', 'riri@rara.com', 'klikame', 0),
(2, 'titi', 'toto', '97125812', '91486620', 'brice@jim.com', 'telessou', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `STATUT` text,
  `MONTANT_FERMETURE` float(8,2) DEFAULT NULL,
  `MONTANT_CLOTURE` float(8,2) DEFAULT NULL,
  `MONTANT_MANQUANT` float(8,2) DEFAULT NULL,
  `MONTANT_SURPLUS` float(8,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `laboratoire`
--

CREATE TABLE `laboratoire` (
  `CODE_LAB` int(10) NOT NULL,
  `NUMERO_LAB` text,
  `NOM_LABORATOIRE` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `localisation`
--

CREATE TABLE `localisation` (
  `CODE_LOCALISATION` int(11) NOT NULL,
  `NUM_LOCALISATION` text,
  `NOM_LOCALISATION` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `STATUT` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `motif`
--

CREATE TABLE `motif` (
  `CODE_MOTIF` int(11) NOT NULL,
  `DESCRIPTION` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `CODE_PRIVILEGE` int(11) NOT NULL,
  `DESIGNATION` text,
  `LEVEL` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`CODE_PRIVILEGE`, `DESIGNATION`, `LEVEL`) VALUES
(1, 'Administrateur', 5),
(2, 'Caissier', 4),
(3, 'Vendeur', 3);

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
  `SOUMIS_TVA` tinyint(1) DEFAULT NULL,
  `DATE_COMMERCIALISATION` date DEFAULT NULL,
  `PHOTO` text,
  `DATE_ENREGISTREMENT` datetime DEFAULT NULL,
  `DATE_MJ` date DEFAULT NULL,
  `DATE_PEREMPTION` date DEFAULT NULL,
  `QTE_STOCK` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produit_entree`
--

CREATE TABLE `produit_entree` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_ENTREE` int(11) NOT NULL,
  `NOMBRE_ENTREE` int(11) DEFAULT NULL,
  `QTE_ACHAT` int(11) DEFAULT NULL,
  `QTE_GRATUIT` int(11) DEFAULT NULL,
  `DATE_MAJ` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produit_sortie`
--

CREATE TABLE `produit_sortie` (
  `CODE_SORTIE` int(11) NOT NULL,
  `CODE_PRODUIT` int(11) NOT NULL,
  `QTE_SORTIE` int(11) DEFAULT NULL,
  `DATE_SORTIE` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produit_vendu`
--

CREATE TABLE `produit_vendu` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `NB_VENDU` int(11) DEFAULT NULL,
  `MONTANT_VENTE` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sortie`
--

CREATE TABLE `sortie` (
  `CODE_SORTIE` int(11) NOT NULL,
  `CODE_MOTIF` int(11) NOT NULL,
  `DATE_SORTIE` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

CREATE TABLE `specialite` (
  `CODE_SPECIALITE` int(11) NOT NULL,
  `NOM_SPECIALITE` text,
  `NUM_SPECIALITE` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `travailler`
--

CREATE TABLE `travailler` (
  `CODE_USER` int(11) NOT NULL,
  `CODE_JOURNEE` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`CODE_USER`, `CODE_PRIVILEGE`, `NOM_USER`, `PRENOM_USER`, `LOGIN`, `PWD`, `STATUT`, `DATE_ENREGISTREMENT`) VALUES
(1, 1, 'admin nom', 'admin prenom', 'admin', 'admin', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `CODE_VENTE` int(11) NOT NULL,
  `CODE_JOURNEE` int(11) NOT NULL,
  `CODE_CLI` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `CODE_BORDEREAU` int(11) NOT NULL,
  `DATE_VENTE` date DEFAULT NULL,
  `POURCENTAGE` float DEFAULT NULL,
  `STATUT` text,
  `HEURE_VENTE` time DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  ADD PRIMARY KEY (`CODE_ANNULATION`);

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
  ADD KEY `FK_PAYER` (`CODE_PAIEMENT`);

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
-- Indexes for table `fournir`
--
ALTER TABLE `fournir`
  ADD PRIMARY KEY (`CODE_FOURNISSEUR`,`CODE_PRODUIT`),
  ADD KEY `FK_FOURNIR` (`CODE_PRODUIT`);

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
  ADD PRIMARY KEY (`CODE_JOURNEE`);

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
-- Indexes for table `produit_entree`
--
ALTER TABLE `produit_entree`
  ADD PRIMARY KEY (`CODE_PRODUIT`,`CODE_ENTREE`),
  ADD KEY `FK_PRODUIT_ENTREE` (`CODE_ENTREE`);

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
  ADD KEY `FK_CONTRACTER` (`CODE_CLI`),
  ADD KEY `FK_EFFECTUER` (`CODE_USER`),
  ADD KEY `FK_JV` (`CODE_JOURNEE`),
  ADD KEY `FK_MATERIALISER` (`CODE_BORDEREAU`);

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
  MODIFY `CODE_BANQUE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bordereau`
--
ALTER TABLE `bordereau`
  MODIFY `CODE_BORDEREAU` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classe_produit`
--
ALTER TABLE `classe_produit`
  MODIFY `CODE_CLASSE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `CODE_CLI` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commerciale`
--
ALTER TABLE `commerciale`
  MODIFY `CODE_COM` int(10) NOT NULL AUTO_INCREMENT;
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
  MODIFY `CODE_ENCAISSEMENT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `entree`
--
ALTER TABLE `entree`
  MODIFY `CODE_ENTREE` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exploitant`
--
ALTER TABLE `exploitant`
  MODIFY `CODE_EXPLOITANT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `famille_produit`
--
ALTER TABLE `famille_produit`
  MODIFY `CODE_FAMILLE` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forme`
--
ALTER TABLE `forme`
  MODIFY `CODE_FORME` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `CODE_FOURNISSEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `historique_modif`
--
ALTER TABLE `historique_modif`
  MODIFY `CODE_HISTORIQUE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journee`
--
ALTER TABLE `journee`
  MODIFY `CODE_JOURNEE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `laboratoire`
--
ALTER TABLE `laboratoire`
  MODIFY `CODE_LAB` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `localisation`
--
ALTER TABLE `localisation`
  MODIFY `CODE_LOCALISATION` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `CODE_LOG` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mode_payement`
--
ALTER TABLE `mode_payement`
  MODIFY `CODE_PAIEMENT` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `CODE_PRIVILEGE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `CODE_PRODUIT` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `CODE_SPECIALITE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `CODE_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vente`
--
ALTER TABLE `vente`
  MODIFY `CODE_VENTE` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
