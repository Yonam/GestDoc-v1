-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2017 at 01:25 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `code_annulation` int(4) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `date_annulation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banque`
--

CREATE TABLE `banque` (
  `code_banque` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `borderau`
--

CREATE TABLE `borderau` (
  `code_borderau` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `numero_borderau_coursier` int(11) NOT NULL,
  `beneficiaire` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cheque`
--

CREATE TABLE `cheque` (
  `code_cheque` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_banque` int(11) NOT NULL,
  `tireur` varchar(50) NOT NULL,
  `numero` int(30) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `code_clas` int(11) NOT NULL,
  `num_clas` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`code_clas`, `num_clas`, `description`) VALUES
(1, 989876, 'VIP');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `code_cli` int(10) NOT NULL,
  `titre` varchar(10) NOT NULL,
  `Nom_cli` varchar(30) NOT NULL,
  `prenom_cli` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `tel1` int(15) NOT NULL,
  `tel2` int(15) NOT NULL,
  `statut` varchar(30) NOT NULL,
  `total_du` int(10) NOT NULL,
  `credit_maximun` int(11) NOT NULL,
  `nbr_jr_avant_paie` int(2) NOT NULL,
  `remise` int(4) NOT NULL,
  `droit_au_credit` tinyint(1) NOT NULL,
  `depassement` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commerciale`
--

CREATE TABLE `commerciale` (
  `code_com` int(10) NOT NULL,
  `nom_com` varchar(30) NOT NULL,
  `prenom_com` varchar(50) NOT NULL,
  `date_emb` date NOT NULL,
  `tel_com` int(12) NOT NULL,
  `tel_urg` int(12) NOT NULL,
  `chiffre` int(7) NOT NULL,
  `pourcentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `code_compte` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `montant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE `credit` (
  `code_credit` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_du` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `depense`
--

CREATE TABLE `depense` (
  `code_depense` int(11) NOT NULL,
  `objet` varchar(100) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `commentaire` varchar(100) NOT NULL,
  `code_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `encaissement`
--

CREATE TABLE `encaissement` (
  `code_encaissement` int(11) NOT NULL,
  `code_paiement` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `code_journe` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `date_encaissement` datetime(6) NOT NULL,
  `statut` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entree`
--

CREATE TABLE `entree` (
  `code_entree` int(10) NOT NULL,
  `code_fournisseur` int(10) NOT NULL,
  `numero_facture` varchar(20) DEFAULT NULL,
  `numero_bordereau` varchar(20) DEFAULT NULL,
  `code_user` int(10) NOT NULL,
  `date_entree` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `espece`
--

CREATE TABLE `espece` (
  `code_espece` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `montant_remi` int(11) NOT NULL,
  `montant_regle` int(11) NOT NULL,
  `relicat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exploitant`
--

CREATE TABLE `exploitant` (
  `code_exploitant` int(11) NOT NULL,
  `numero_exploitant` varchar(10) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exploitant`
--

INSERT INTO `exploitant` (`code_exploitant`, `numero_exploitant`, `libelle`) VALUES
(1, '098787', 'biafra'),
(2, '098787', 'biafra');

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

CREATE TABLE `facture` (
  `code_facture` int(1) NOT NULL,
  `numero_facture` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `facture_regularisation`
--

CREATE TABLE `facture_regularisation` (
  `code_facture` int(11) NOT NULL,
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `famille`
--

CREATE TABLE `famille` (
  `code_famille` int(10) NOT NULL,
  `nom_famille` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forme`
--

CREATE TABLE `forme` (
  `code_forme` int(11) NOT NULL,
  `nom_forme` varchar(50) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forme`
--

INSERT INTO `forme` (`code_forme`, `nom_forme`, `commentaire`) VALUES
(1, 'gelulles', NULL),
(2, 'gelulles', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `code_fournisseur` int(10) NOT NULL,
  `raison_social` varchar(255) NOT NULL,
  `tel` int(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `historique_client`
--

CREATE TABLE `historique_client` (
  `code_historique` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `total_du` int(11) NOT NULL,
  `montant_paye` int(11) NOT NULL,
  `solde_restant` int(11) NOT NULL,
  `date_regularisation` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `historique_modif`
--

CREATE TABLE `historique_modif` (
  `code_historique` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `ancien` varchar(255) NOT NULL,
  `QteAncAv` float NOT NULL,
  `QteAncAP` float NOT NULL,
  `Nouveau` varchar(255) NOT NULL,
  `QteNouAv` float NOT NULL,
  `QteNouAp` float NOT NULL,
  `DateOperation` datetime(6) NOT NULL,
  `login` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `journee`
--

CREATE TABLE `journee` (
  `code_journee` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `date_ouverture` datetime(6) DEFAULT NULL,
  `date_fermeture` datetime(6) DEFAULT NULL,
  `date_cloture` datetime(6) DEFAULT NULL,
  `statut` int(255) DEFAULT NULL,
  `montant_fermeture` int(11) DEFAULT NULL,
  `montant_cloture` int(11) DEFAULT NULL,
  `montant_manquant` int(11) DEFAULT NULL,
  `montant_surplus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `laboratoire`
--

CREATE TABLE `laboratoire` (
  `code_lab` int(10) NOT NULL,
  `numero_labo` varchar(10) DEFAULT NULL,
  `nom_laboratoire` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `laboratoire`
--

INSERT INTO `laboratoire` (`code_lab`, `numero_labo`, `nom_laboratoire`) VALUES
(1, '#BI01', 'Biafra');

-- --------------------------------------------------------

--
-- Table structure for table `localisation`
--

CREATE TABLE `localisation` (
  `code_localisation` int(11) NOT NULL,
  `nom_localisation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `localisation`
--

INSERT INTO `localisation` (`code_localisation`, `nom_localisation`) VALUES
(1, 'aile-sud');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `code_log` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `heure` datetime(6) DEFAULT NULL,
  `evenement` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mode_paiement`
--

CREATE TABLE `mode_paiement` (
  `code_paiement` int(11) NOT NULL,
  `description` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `motif`
--

CREATE TABLE `motif` (
  `code_motif` int(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `motif`
--

INSERT INTO `motif` (`code_motif`, `description`) VALUES
(1, 'toto');

-- --------------------------------------------------------

--
-- Table structure for table `mouvement`
--

CREATE TABLE `mouvement` (
  `code_mouvement` int(10) NOT NULL,
  `code_vente` int(10) NOT NULL,
  `code_sortie` int(10) NOT NULL,
  `code_entree` int(10) NOT NULL,
  `libelle` varchar(25) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mouvement_log`
--

CREATE TABLE `mouvement_log` (
  `code_mouvement` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `code_log` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panier`
--

CREATE TABLE `panier` (
  `code_panier` int(4) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `nb_vendu` int(3) NOT NULL,
  `prix_vente` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

CREATE TABLE `privilege` (
  `code_priv` int(11) NOT NULL,
  `designation` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `level` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`code_priv`, `designation`, `slug`, `level`) VALUES
(1, 'Administrateur', 'admin', 5),
(2, 'Comptoir', 'comptoir', 4),
(3, 'Caisse', 'caisse', 3);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `code_produit` int(10) NOT NULL,
  `code_cip` int(20) NOT NULL,
  `code_barre` int(20) NOT NULL,
  `code_interne` int(20) NOT NULL,
  `code_lab` int(10) NOT NULL,
  `code_clas` int(11) NOT NULL,
  `code_localisation` int(11) NOT NULL,
  `code_exploitant` int(11) NOT NULL,
  `code_specialite` int(11) NOT NULL,
  `code_forme` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `dci` varchar(255) NOT NULL,
  `Soumis_tva` tinyint(1) NOT NULL,
  `date_commercialisation` date NOT NULL,
  `photo` varchar(100) NOT NULL,
  `date_enregistrement` date NOT NULL,
  `date_mj` date NOT NULL,
  `date_peremption` date NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `prix_achat` float NOT NULL,
  `prix_vente` float NOT NULL,
  `taux_tva` float NOT NULL,
  `multiplicateur` int(2) NOT NULL,
  `reduction` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`code_produit`, `code_cip`, `code_barre`, `code_interne`, `code_lab`, `code_clas`, `code_localisation`, `code_exploitant`, `code_specialite`, `code_forme`, `designation`, `dci`, `Soumis_tva`, `date_commercialisation`, `photo`, `date_enregistrement`, `date_mj`, `date_peremption`, `statut`, `prix_achat`, `prix_vente`, `taux_tva`, `multiplicateur`, `reduction`) VALUES
(1, 1234, 4321, 1233, 1, 1, 1, 2, 1, 2, 'savon', 'ethanol', 1, '2017-07-02', '', '2017-07-04', '2017-07-05', '2018-01-05', 1, 6000, 8000, 18, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `produit_entrant`
--

CREATE TABLE `produit_entrant` (
  `code_transaction_entree` int(11) NOT NULL,
  `code_entree` int(11) NOT NULL,
  `code_produit` int(11) NOT NULL,
  `nombre_entree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produit_sortie`
--

CREATE TABLE `produit_sortie` (
  `code_transaction_sortie` int(11) NOT NULL,
  `code_sortie` int(11) NOT NULL,
  `code_produit` int(10) NOT NULL,
  `nombre_sortie` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produit_vendu`
--

CREATE TABLE `produit_vendu` (
  `code_produit` int(10) NOT NULL,
  `code_vente` int(10) NOT NULL,
  `nb_vendu` float NOT NULL,
  `total_vendu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `regularisation`
--

CREATE TABLE `regularisation` (
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_regularisation` int(11) NOT NULL,
  `date_regularisation` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sortie`
--

CREATE TABLE `sortie` (
  `code_sortie` int(10) NOT NULL,
  `code_motif` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `date_sortie` datetime(6) DEFAULT NULL,
  `code_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

CREATE TABLE `specialite` (
  `code_specialite` int(11) NOT NULL,
  `nom_specialite` varchar(50) NOT NULL,
  `observation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`code_specialite`, `nom_specialite`, `observation`) VALUES
(1, 'fievre', '');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `code_stock` int(10) NOT NULL,
  `code_produit` int(10) NOT NULL,
  `qte_stock` int(7) NOT NULL,
  `qte_achat` float NOT NULL,
  `qte_gratuit` float NOT NULL,
  `date_maj` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_caisse`
--

CREATE TABLE `ticket_caisse` (
  `code_ticket` int(11) NOT NULL,
  `code_espece` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `heure` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `code_user` int(11) NOT NULL,
  `code_priv` int(11) NOT NULL,
  `nom_u` varchar(50) NOT NULL,
  `prenom_u` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `date_enregistrement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`code_user`, `code_priv`, `nom_u`, `prenom_u`, `login`, `pwd`, `statut`, `date_enregistrement`) VALUES
(1, 1, 'ANLONSOU', 'kossiwa', '@anlonsou', 'kossiwa2017', 0, '2017-07-20 10:18:12'),
(2, 2, 'KONOR', 'kodjo', '@konor', 'kodjo2017', 1, '2017-07-13 10:46:29'),
(3, 1, 'yoni', 'yoni', 'yoni', 'yoni', 1, '2017-07-24 22:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `code_vente` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `jour_ouvert` date NOT NULL,
  `date_vente` int(10) NOT NULL,
  `pourcentage` float NOT NULL,
  `statut` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  ADD PRIMARY KEY (`code_annulation`),
  ADD KEY `code_vente` (`code_vente`);

--
-- Indexes for table `banque`
--
ALTER TABLE `banque`
  ADD PRIMARY KEY (`code_banque`);

--
-- Indexes for table `borderau`
--
ALTER TABLE `borderau`
  ADD PRIMARY KEY (`code_borderau`,`code_compte`),
  ADD KEY `code_compte` (`code_compte`);

--
-- Indexes for table `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`code_cheque`,`code_encaissement`,`code_banque`),
  ADD KEY `code_banque` (`code_banque`),
  ADD KEY `code_encaissement` (`code_encaissement`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`code_clas`),
  ADD UNIQUE KEY `code_clas` (`code_clas`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`code_cli`),
  ADD UNIQUE KEY `tel1` (`tel1`);

--
-- Indexes for table `commerciale`
--
ALTER TABLE `commerciale`
  ADD PRIMARY KEY (`code_com`);

--
-- Indexes for table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`code_compte`,`code_cli`),
  ADD KEY `code_cli` (`code_cli`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`code_credit`,`code_encaissement`,`code_compte`),
  ADD KEY `code_encaissement` (`code_encaissement`),
  ADD KEY `code_compte` (`code_compte`);

--
-- Indexes for table `depense`
--
ALTER TABLE `depense`
  ADD PRIMARY KEY (`code_depense`);

--
-- Indexes for table `encaissement`
--
ALTER TABLE `encaissement`
  ADD PRIMARY KEY (`code_encaissement`,`code_paiement`,`code_vente`,`code_user`),
  ADD KEY `code_paiement` (`code_paiement`),
  ADD KEY `code_user` (`code_user`),
  ADD KEY `code_vente` (`code_vente`);

--
-- Indexes for table `entree`
--
ALTER TABLE `entree`
  ADD PRIMARY KEY (`code_entree`,`code_fournisseur`,`code_user`),
  ADD UNIQUE KEY `code_fournisseur` (`code_fournisseur`),
  ADD UNIQUE KEY `code_user` (`code_user`);

--
-- Indexes for table `espece`
--
ALTER TABLE `espece`
  ADD PRIMARY KEY (`code_espece`,`code_encaissement`),
  ADD KEY `code_encaissement` (`code_encaissement`);

--
-- Indexes for table `exploitant`
--
ALTER TABLE `exploitant`
  ADD PRIMARY KEY (`code_exploitant`),
  ADD UNIQUE KEY `code_exploitant` (`code_exploitant`);

--
-- Indexes for table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`code_facture`,`code_cli`,`code_vente`,`code_encaissement`,`code_user`),
  ADD KEY `code_cli` (`code_cli`),
  ADD KEY `code_vente` (`code_vente`),
  ADD KEY `code_encaissement` (`code_encaissement`),
  ADD KEY `code_user` (`code_user`);

--
-- Indexes for table `facture_regularisation`
--
ALTER TABLE `facture_regularisation`
  ADD PRIMARY KEY (`code_facture`,`code_regularisation`,`code_cli`),
  ADD KEY `code_cli` (`code_cli`),
  ADD KEY `code_regularisation` (`code_regularisation`);

--
-- Indexes for table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`code_famille`);

--
-- Indexes for table `forme`
--
ALTER TABLE `forme`
  ADD PRIMARY KEY (`code_forme`),
  ADD UNIQUE KEY `code_forme` (`code_forme`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`code_fournisseur`);

--
-- Indexes for table `historique_client`
--
ALTER TABLE `historique_client`
  ADD PRIMARY KEY (`code_historique`,`code_cli`),
  ADD KEY `code_cli` (`code_cli`);

--
-- Indexes for table `historique_modif`
--
ALTER TABLE `historique_modif`
  ADD PRIMARY KEY (`code_historique`,`code_vente`),
  ADD KEY `code_vente` (`code_vente`);

--
-- Indexes for table `journee`
--
ALTER TABLE `journee`
  ADD PRIMARY KEY (`code_journee`,`code_user`),
  ADD KEY `code_user` (`code_user`);

--
-- Indexes for table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD PRIMARY KEY (`code_lab`);

--
-- Indexes for table `localisation`
--
ALTER TABLE `localisation`
  ADD PRIMARY KEY (`code_localisation`),
  ADD UNIQUE KEY `code_localisation` (`code_localisation`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`code_log`,`code_user`),
  ADD UNIQUE KEY `code_log` (`code_log`),
  ADD UNIQUE KEY `code_user` (`code_user`);

--
-- Indexes for table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  ADD PRIMARY KEY (`code_paiement`);

--
-- Indexes for table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`code_motif`);

--
-- Indexes for table `mouvement`
--
ALTER TABLE `mouvement`
  ADD PRIMARY KEY (`code_mouvement`,`code_vente`,`code_sortie`,`code_entree`),
  ADD UNIQUE KEY `code_mouvement` (`code_mouvement`),
  ADD UNIQUE KEY `code_vente` (`code_vente`),
  ADD UNIQUE KEY `code_sortie` (`code_sortie`),
  ADD UNIQUE KEY `code_entree` (`code_entree`);

--
-- Indexes for table `mouvement_log`
--
ALTER TABLE `mouvement_log`
  ADD PRIMARY KEY (`code_mouvement`,`code_log`,`code_user`),
  ADD UNIQUE KEY `code_mouvement` (`code_mouvement`),
  ADD UNIQUE KEY `code_user` (`code_user`),
  ADD UNIQUE KEY `code_log` (`code_log`);

--
-- Indexes for table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`code_panier`),
  ADD KEY `code_vente` (`code_vente`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`code_priv`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`code_produit`,`code_cip`),
  ADD UNIQUE KEY `code_produit` (`code_produit`),
  ADD UNIQUE KEY `code_cip` (`code_cip`),
  ADD KEY `code_specialite` (`code_specialite`),
  ADD KEY `code_lab` (`code_lab`),
  ADD KEY `code_clas` (`code_clas`),
  ADD KEY `code_localisation` (`code_localisation`),
  ADD KEY `code_forme` (`code_forme`),
  ADD KEY `code_exploitant` (`code_exploitant`);

--
-- Indexes for table `produit_entrant`
--
ALTER TABLE `produit_entrant`
  ADD PRIMARY KEY (`code_transaction_entree`,`code_entree`,`code_produit`),
  ADD UNIQUE KEY `code_entree` (`code_entree`),
  ADD UNIQUE KEY `code_produit` (`code_produit`);

--
-- Indexes for table `produit_sortie`
--
ALTER TABLE `produit_sortie`
  ADD PRIMARY KEY (`code_transaction_sortie`,`code_sortie`,`code_produit`),
  ADD UNIQUE KEY `code_sortie` (`code_sortie`),
  ADD UNIQUE KEY `code_produit` (`code_produit`);

--
-- Indexes for table `produit_vendu`
--
ALTER TABLE `produit_vendu`
  ADD PRIMARY KEY (`code_produit`,`code_vente`),
  ADD KEY `code_vente` (`code_vente`);

--
-- Indexes for table `regularisation`
--
ALTER TABLE `regularisation`
  ADD PRIMARY KEY (`code_regularisation`,`code_cli`,`code_compte`),
  ADD KEY `code_cli` (`code_cli`),
  ADD KEY `code_compte` (`code_compte`);

--
-- Indexes for table `sortie`
--
ALTER TABLE `sortie`
  ADD PRIMARY KEY (`code_sortie`,`code_motif`,`code_user`),
  ADD UNIQUE KEY `code_produit` (`code_produit`),
  ADD KEY `code_user` (`code_user`),
  ADD KEY `code_motif` (`code_motif`);

--
-- Indexes for table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`code_specialite`),
  ADD UNIQUE KEY `code_specialite` (`code_specialite`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`code_stock`,`code_produit`),
  ADD KEY `code_produit` (`code_produit`);

--
-- Indexes for table `ticket_caisse`
--
ALTER TABLE `ticket_caisse`
  ADD PRIMARY KEY (`code_ticket`,`code_espece`,`code_vente`,`code_encaissement`,`code_user`),
  ADD KEY `code_espece` (`code_espece`),
  ADD KEY `code_vente` (`code_vente`),
  ADD KEY `code_encaissement` (`code_encaissement`),
  ADD KEY `code_user` (`code_user`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`code_user`),
  ADD KEY `code_priv` (`code_priv`);

--
-- Indexes for table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`code_vente`,`code_cli`,`code_user`),
  ADD KEY `code_cli` (`code_cli`),
  ADD KEY `code_user` (`code_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  MODIFY `code_annulation` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banque`
--
ALTER TABLE `banque`
  MODIFY `code_banque` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `borderau`
--
ALTER TABLE `borderau`
  MODIFY `code_borderau` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cheque`
--
ALTER TABLE `cheque`
  MODIFY `code_cheque` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `code_clas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `code_cli` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commerciale`
--
ALTER TABLE `commerciale`
  MODIFY `code_com` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `compte`
--
ALTER TABLE `compte`
  MODIFY `code_compte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
  MODIFY `code_credit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `depense`
--
ALTER TABLE `depense`
  MODIFY `code_depense` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `encaissement`
--
ALTER TABLE `encaissement`
  MODIFY `code_encaissement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `entree`
--
ALTER TABLE `entree`
  MODIFY `code_entree` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `espece`
--
ALTER TABLE `espece`
  MODIFY `code_espece` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exploitant`
--
ALTER TABLE `exploitant`
  MODIFY `code_exploitant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `facture`
--
ALTER TABLE `facture`
  MODIFY `code_facture` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `facture_regularisation`
--
ALTER TABLE `facture_regularisation`
  MODIFY `code_facture` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `famille`
--
ALTER TABLE `famille`
  MODIFY `code_famille` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forme`
--
ALTER TABLE `forme`
  MODIFY `code_forme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `code_fournisseur` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `historique_client`
--
ALTER TABLE `historique_client`
  MODIFY `code_historique` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `historique_modif`
--
ALTER TABLE `historique_modif`
  MODIFY `code_historique` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journee`
--
ALTER TABLE `journee`
  MODIFY `code_journee` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `laboratoire`
--
ALTER TABLE `laboratoire`
  MODIFY `code_lab` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `localisation`
--
ALTER TABLE `localisation`
  MODIFY `code_localisation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `code_log` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  MODIFY `code_paiement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `motif`
--
ALTER TABLE `motif`
  MODIFY `code_motif` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `code_mouvement` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mouvement_log`
--
ALTER TABLE `mouvement_log`
  MODIFY `code_mouvement` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `panier`
--
ALTER TABLE `panier`
  MODIFY `code_panier` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `code_priv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `code_produit` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produit_entrant`
--
ALTER TABLE `produit_entrant`
  MODIFY `code_transaction_entree` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produit_sortie`
--
ALTER TABLE `produit_sortie`
  MODIFY `code_transaction_sortie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produit_vendu`
--
ALTER TABLE `produit_vendu`
  MODIFY `code_produit` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regularisation`
--
ALTER TABLE `regularisation`
  MODIFY `code_regularisation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sortie`
--
ALTER TABLE `sortie`
  MODIFY `code_sortie` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `code_specialite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `code_stock` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket_caisse`
--
ALTER TABLE `ticket_caisse`
  MODIFY `code_ticket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `code_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vente`
--
ALTER TABLE `vente`
  MODIFY `code_vente` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `annulation_vente`
--
ALTER TABLE `annulation_vente`
  ADD CONSTRAINT `annulation_vente_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`);

--
-- Constraints for table `borderau`
--
ALTER TABLE `borderau`
  ADD CONSTRAINT `borderau_ibfk_1` FOREIGN KEY (`code_compte`) REFERENCES `compte` (`code_compte`) ON UPDATE CASCADE;

--
-- Constraints for table `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`code_banque`) REFERENCES `banque` (`code_banque`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cheque_ibfk_2` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE;

--
-- Constraints for table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE;

--
-- Constraints for table `credit`
--
ALTER TABLE `credit`
  ADD CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_ibfk_2` FOREIGN KEY (`code_compte`) REFERENCES `compte` (`code_compte`) ON UPDATE CASCADE;

--
-- Constraints for table `encaissement`
--
ALTER TABLE `encaissement`
  ADD CONSTRAINT `encaissement_ibfk_1` FOREIGN KEY (`code_paiement`) REFERENCES `mode_paiement` (`code_paiement`) ON UPDATE CASCADE,
  ADD CONSTRAINT `encaissement_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `encaissement_ibfk_3` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE;

--
-- Constraints for table `entree`
--
ALTER TABLE `entree`
  ADD CONSTRAINT `entree_ibfk_1` FOREIGN KEY (`code_fournisseur`) REFERENCES `fournisseur` (`code_fournisseur`) ON UPDATE CASCADE,
  ADD CONSTRAINT `entree_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE;

--
-- Constraints for table `espece`
--
ALTER TABLE `espece`
  ADD CONSTRAINT `espece_ibfk_1` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE;

--
-- Constraints for table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  ADD CONSTRAINT `facture_ibfk_2` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `facture_ibfk_3` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE,
  ADD CONSTRAINT `facture_ibfk_4` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE;

--
-- Constraints for table `facture_regularisation`
--
ALTER TABLE `facture_regularisation`
  ADD CONSTRAINT `facture_regularisation_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  ADD CONSTRAINT `facture_regularisation_ibfk_2` FOREIGN KEY (`code_regularisation`) REFERENCES `regularisation` (`code_regularisation`) ON UPDATE CASCADE;

--
-- Constraints for table `historique_client`
--
ALTER TABLE `historique_client`
  ADD CONSTRAINT `historique_client_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE;

--
-- Constraints for table `historique_modif`
--
ALTER TABLE `historique_modif`
  ADD CONSTRAINT `historique_modif_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE;

--
-- Constraints for table `journee`
--
ALTER TABLE `journee`
  ADD CONSTRAINT `journee_ibfk_1` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE;

--
-- Constraints for table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `mouvement_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mouvement_ibfk_2` FOREIGN KEY (`code_sortie`) REFERENCES `sortie` (`code_sortie`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mouvement_ibfk_3` FOREIGN KEY (`code_entree`) REFERENCES `entree` (`code_entree`) ON UPDATE CASCADE;

--
-- Constraints for table `mouvement_log`
--
ALTER TABLE `mouvement_log`
  ADD CONSTRAINT `mouvement_log_ibfk_1` FOREIGN KEY (`code_mouvement`) REFERENCES `mouvement` (`code_mouvement`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mouvement_log_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mouvement_log_ibfk_3` FOREIGN KEY (`code_log`) REFERENCES `logs` (`code_log`) ON UPDATE CASCADE;

--
-- Constraints for table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`code_specialite`) REFERENCES `specialite` (`code_specialite`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`code_lab`) REFERENCES `laboratoire` (`code_lab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_3` FOREIGN KEY (`code_clas`) REFERENCES `classe` (`code_clas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_4` FOREIGN KEY (`code_localisation`) REFERENCES `localisation` (`code_localisation`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_5` FOREIGN KEY (`code_forme`) REFERENCES `forme` (`code_forme`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_6` FOREIGN KEY (`code_exploitant`) REFERENCES `exploitant` (`code_exploitant`) ON UPDATE CASCADE;

--
-- Constraints for table `produit_entrant`
--
ALTER TABLE `produit_entrant`
  ADD CONSTRAINT `produit_entrant_ibfk_1` FOREIGN KEY (`code_entree`) REFERENCES `entree` (`code_entree`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_entrant_ibfk_2` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE;

--
-- Constraints for table `produit_sortie`
--
ALTER TABLE `produit_sortie`
  ADD CONSTRAINT `produit_sortie_ibfk_1` FOREIGN KEY (`code_sortie`) REFERENCES `sortie` (`code_sortie`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_sortie_ibfk_2` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE;

--
-- Constraints for table `produit_vendu`
--
ALTER TABLE `produit_vendu`
  ADD CONSTRAINT `produit_vendu_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_vendu_ibfk_2` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE;

--
-- Constraints for table `regularisation`
--
ALTER TABLE `regularisation`
  ADD CONSTRAINT `regularisation_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  ADD CONSTRAINT `regularisation_ibfk_2` FOREIGN KEY (`code_compte`) REFERENCES `compte` (`code_compte`) ON UPDATE CASCADE;

--
-- Constraints for table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `sortie_ibfk_1` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sortie_ibfk_2` FOREIGN KEY (`code_motif`) REFERENCES `motif` (`code_motif`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sortie_ibfk_3` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE;

--
-- Constraints for table `ticket_caisse`
--
ALTER TABLE `ticket_caisse`
  ADD CONSTRAINT `ticket_caisse_ibfk_1` FOREIGN KEY (`code_espece`) REFERENCES `espece` (`code_espece`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_caisse_ibfk_2` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_caisse_ibfk_3` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_caisse_ibfk_4` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE;

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`code_priv`) REFERENCES `privilege` (`code_priv`);

--
-- Constraints for table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
