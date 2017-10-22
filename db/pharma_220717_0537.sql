-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 18 Juin 2017 à 10:34
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pharma`
--

-- --------------------------------------------------------

--
-- Structure de la table `annulation_vente`
--

CREATE TABLE IF NOT EXISTS `annulation_vente` (
  `code_annulation` int(4) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `date_annulation` date NOT NULL,
  PRIMARY KEY (`code_annulation`),
  KEY `code_vente` (`code_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `annulation_vente`
--

INSERT INTO `annulation_vente` (`code_annulation`, `code_vente`, `date_annulation`) VALUES
(1, 4, '2017-07-13'),
(2, 5, '2017-07-13');

-- --------------------------------------------------------

--
-- Structure de la table `banque`
--

CREATE TABLE IF NOT EXISTS `banque` (
  `code_banque` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code_banque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `banque`
--

INSERT INTO `banque` (`code_banque`, `description`) VALUES
(1, 'BOA'),
(2, 'BTCI'),
(3, 'ECOBANK');

-- --------------------------------------------------------

--
-- Structure de la table `borderau`
--

CREATE TABLE IF NOT EXISTS `borderau` (
  `code_borderau` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `numero_borderau_coursier` int(11) NOT NULL,
  `beneficiaire` varchar(11) NOT NULL,
  PRIMARY KEY (`code_borderau`,`code_compte`),
  KEY `code_compte` (`code_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `borderau`
--

INSERT INTO `borderau` (`code_borderau`, `code_compte`, `numero_borderau_coursier`, `beneficiaire`) VALUES
(1, 1, 93022526, 'ANLONSOU'),
(2, 2, 22458796, '');

-- --------------------------------------------------------

--
-- Structure de la table `cheque`
--

CREATE TABLE IF NOT EXISTS `cheque` (
  `code_cheque` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_banque` int(11) NOT NULL,
  `tireur` varchar(50) NOT NULL,
  `numero` int(30) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`code_cheque`,`code_encaissement`,`code_banque`),
  KEY `code_banque` (`code_banque`),
  KEY `code_encaissement` (`code_encaissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cheque`
--

INSERT INTO `cheque` (`code_cheque`, `code_encaissement`, `code_banque`, `tireur`, `numero`, `montant`, `date`) VALUES
(1, 2, 1, 'ROOK', 10258978, 100000, '2017-07-12 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `code_clas` int(11) NOT NULL,
  `num_clas` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code_clas`),
  UNIQUE KEY `code_clas` (`code_clas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`code_clas`, `num_clas`, `description`) VALUES
(1, 1, 'A'),
(2, 2, 'B');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `code_cli` int(10) NOT NULL AUTO_INCREMENT,
  `titre` varchar(10) NOT NULL,
  `Nom_cli` varchar(30) NOT NULL,
  `prenom_cli` varchar(50) NOT NULL,
  `type_piece` varchar(20) DEFAULT NULL,
  `num_piece` varchar(255) DEFAULT NULL,
  `date_piece` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `adresse` varchar(100) NOT NULL,
  `tel1` varchar(30) NOT NULL,
  `tel2` varchar(30) DEFAULT NULL,
  `statut` varchar(30) NOT NULL,
  `total_du` int(10) NOT NULL,
  `credit_maximum` int(11) DEFAULT NULL,
  `nbr_jr_avant_paie` int(2) DEFAULT NULL,
  `remise` int(4) DEFAULT NULL,
  `droit_au_credit` tinyint(1) DEFAULT NULL,
  `depassement` int(4) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code_cli`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`code_cli`, `titre`, `Nom_cli`, `prenom_cli`, `type_piece`, `num_piece`, `date_piece`, `Email`, `adresse`, `tel1`, `tel2`, `statut`, `total_du`, `credit_maximum`, `nbr_jr_avant_paie`, `remise`, `droit_au_credit`, `depassement`, `date_creation`) VALUES
(1, 'Mr', 'lolo', 'lolo', 'CNI', '589658', '0000-00-00', '', '258', '589588956', '25952258', '0', 0, 50000000, 15, 0, 0, 1, '2017-07-20 01:13:29'),
(2, 'Mme', 'hermione', 'granG', 'CNI', '5689opui', '0000-00-00', 'qq@gmail.com', 'lome togo', '25898969', '22369545', '0', 0, 5000000, 15, 10, 0, 1, '2017-07-20 01:30:15'),
(3, 'Mr', 'lolo', 'lolo', 'CNI', '', '0000-00-00', '', '5265moloe', '25895895', '', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:32:15'),
(4, 'Mr', 'lolo', 'lolo', 'CNI', '', '0000-00-00', '', '5265moloe', '25895895', '', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:33:07'),
(5, 'Mr', 'lolo', 'lolo', 'CNI', '', '0000-00-00', '', '2522', '252895', '', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:33:42'),
(6, 'Mme', 'jeanne', 'komlan', 'CNI', '259522', '0000-00-00', '', '589552', '25255', '585258', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:40:04'),
(7, 'Mr', 'lolo', 'lolo', 'CNI', '255', '0000-00-00', '', '235245', '255', '65652', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:41:11'),
(8, 'Mr', 'kioklma', 'llklk', 'CNI', '', '0000-00-00', '', '5656522', '2552', '', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:42:11'),
(9, 'Mr', 'komlan', 'senou', 'PP', '589ppuuuu', '0000-00-00', '', 'µ', '2255', '25855', '0', 0, 0, 15, 0, 0, 1, '2017-07-20 01:45:26');

-- --------------------------------------------------------

--
-- Structure de la table `commerciale`
--

CREATE TABLE IF NOT EXISTS `commerciale` (
  `code_com` int(10) NOT NULL AUTO_INCREMENT,
  `nom_com` varchar(30) NOT NULL,
  `prenom_com` varchar(50) NOT NULL,
  `date_emb` date NOT NULL,
  `tel_com` varchar(30) NOT NULL,
  `tel_urg` varchar(30) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `chiffre` int(7) NOT NULL,
  `pourcentage` float NOT NULL,
  PRIMARY KEY (`code_com`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `commerciale`
--

INSERT INTO `commerciale` (`code_com`, `nom_com`, `prenom_com`, `date_emb`, `tel_com`, `tel_urg`, `adresse`, `email`, `chiffre`, `pourcentage`) VALUES
(1, 'KODALO', 'david', '2016-09-06', '98745896', '90124589', '', '', 100000, 0.5),
(2, 'DOTIGRE', 'abalo', '2017-07-11', '96458721', '93254871', '', '', 100000, 0.5),
(3, 'BOBAGRE', 'yamanaso', '2017-07-11', '22564896', '22365478', '', '', 200000, 0.12),
(4, 'jean', 'mlondres', '0000-00-00', '22251608', '525', '70 ruedes hibisvus', 'jj@fmail.com', 0, 1),
(5, 'Kodjo', 'lolo', '0000-00-00', '22251608', '', '70 rue des', 'jj@fmail.com', 0, 1),
(6, 'bertrand', 'jules', '0000-00-00', '22251608', '25952258', '70 ruedes hibisvus', 'jj@fmail.com', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `code_compte` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `solde` int(11) NOT NULL,
  `montant_verse` int(11) NOT NULL,
  `reste` int(11) NOT NULL,
  `date` date NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY (`code_compte`,`code_cli`),
  KEY `code_cli` (`code_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`code_compte`, `code_cli`, `solde`, `montant_verse`, `reste`, `date`, `code_user`) VALUES
(1, 1, 100000, 0, 0, '0000-00-00', 0),
(2, 2, 3000, 0, 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE IF NOT EXISTS `connexion` (
  `code_con` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `date_con` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` varchar(2) NOT NULL,
  PRIMARY KEY (`code_con`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`code_con`, `login`, `statut`, `ip`, `date_con`, `action`) VALUES
(1, '@anlonsou', 0, '192.168.1.20', '2017-07-17 11:16:02', '0'),
(2, '@anlons', 1, '192.168.1.21', '2017-07-17 11:16:21', '0'),
(3, '@anlonsou', 0, '192.168.1.20', '2017-07-17 11:16:36', 'C'),
(4, '@anlonsou', 0, '192.168.1.20', '2017-07-17 11:16:47', 'C');

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `code_credit` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_du` int(11) NOT NULL,
  PRIMARY KEY (`code_credit`,`code_encaissement`,`code_compte`),
  KEY `code_encaissement` (`code_encaissement`),
  KEY `code_compte` (`code_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `credit`
--

INSERT INTO `credit` (`code_credit`, `code_encaissement`, `code_compte`, `montant_du`) VALUES
(1, 1, 1, 10000),
(2, 2, 2, 3000),
(3, 1, 1, 1000),
(4, 2, 2, 10000);

-- --------------------------------------------------------

--
-- Structure de la table `depense`
--

CREATE TABLE IF NOT EXISTS `depense` (
  `code_depense` int(11) NOT NULL,
  `objet` varchar(100) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `commentaire` varchar(100) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY (`code_depense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `depense`
--

INSERT INTO `depense` (`code_depense`, `objet`, `montant`, `date`, `commentaire`, `code_user`) VALUES
(1, 'reparation ampoule', 15000, '2017-07-18 12:08:17', 'important', 1),
(2, 'reglement transport', 50000, '2017-07-10 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `encaissement`
--

CREATE TABLE IF NOT EXISTS `encaissement` (
  `code_encaissement` int(11) NOT NULL,
  `code_paiement` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `code_journe` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `date_encaissement` datetime NOT NULL,
  `statut` varchar(30) NOT NULL,
  PRIMARY KEY (`code_encaissement`,`code_paiement`,`code_vente`,`code_user`),
  KEY `code_paiement` (`code_paiement`),
  KEY `code_user` (`code_user`),
  KEY `code_vente` (`code_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `encaissement`
--

INSERT INTO `encaissement` (`code_encaissement`, `code_paiement`, `code_vente`, `code_user`, `code_journe`, `type`, `date_encaissement`, `statut`) VALUES
(1, 1, 1, 1, 1, 'espece', '2017-07-13 11:34:33', ''),
(2, 2, 2, 1, 1, 'encaissement par cheque', '2017-07-13 07:18:17', ''),
(3, 1, 3, 1, 1, 'espece', '2017-07-13 20:00:00', '');

-- --------------------------------------------------------

--
-- Structure de la table `entree`
--

CREATE TABLE IF NOT EXISTS `entree` (
  `code_entree` int(10) NOT NULL,
  `code_fournisseur` int(10) NOT NULL,
  `numero_facture` varchar(20) DEFAULT NULL,
  `numero_bordereau` varchar(20) DEFAULT NULL,
  `code_user` int(10) NOT NULL,
  `date_entree` date DEFAULT NULL,
  PRIMARY KEY (`code_entree`,`code_fournisseur`,`code_user`),
  UNIQUE KEY `code_fournisseur` (`code_fournisseur`),
  UNIQUE KEY `code_user` (`code_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `entree`
--

INSERT INTO `entree` (`code_entree`, `code_fournisseur`, `numero_facture`, `numero_bordereau`, `code_user`, `date_entree`) VALUES
(3, 1, '1', '1', 1, '2017-07-13'),
(4, 2, '2', '2', 2, '2017-07-13');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE IF NOT EXISTS `espece` (
  `code_espece` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `montant_remi` int(11) NOT NULL,
  `montant_regle` int(11) NOT NULL,
  `relicat` int(11) NOT NULL,
  PRIMARY KEY (`code_espece`,`code_encaissement`),
  KEY `code_encaissement` (`code_encaissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `espece`
--

INSERT INTO `espece` (`code_espece`, `code_encaissement`, `montant_remi`, `montant_regle`, `relicat`) VALUES
(1, 2, 10000, 10000, 0),
(2, 3, 5000, 5000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `exploitant`
--

CREATE TABLE IF NOT EXISTS `exploitant` (
  `code_exploitant` int(11) NOT NULL,
  `numero_exploitant` varchar(10) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`code_exploitant`),
  UNIQUE KEY `code_exploitant` (`code_exploitant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `exploitant`
--

INSERT INTO `exploitant` (`code_exploitant`, `numero_exploitant`, `libelle`) VALUES
(1, '01TP', 'Tools production'),
(2, '02MP', 'Mobit production');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `code_facture` int(1) NOT NULL,
  `numero_facture` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY (`code_facture`,`code_cli`,`code_vente`,`code_encaissement`,`code_user`),
  KEY `code_cli` (`code_cli`),
  KEY `code_vente` (`code_vente`),
  KEY `code_encaissement` (`code_encaissement`),
  KEY `code_user` (`code_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`code_facture`, `numero_facture`, `code_cli`, `code_vente`, `code_encaissement`, `code_user`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture_regularisation`
--

CREATE TABLE IF NOT EXISTS `facture_regularisation` (
  `code_facture` int(11) NOT NULL,
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  PRIMARY KEY (`code_facture`,`code_regularisation`,`code_cli`),
  KEY `code_cli` (`code_cli`),
  KEY `code_regularisation` (`code_regularisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `facture_regularisation`
--

INSERT INTO `facture_regularisation` (`code_facture`, `code_regularisation`, `code_cli`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE IF NOT EXISTS `famille` (
  `code_famille` int(10) NOT NULL,
  `nom_famille` varchar(255) NOT NULL,
  PRIMARY KEY (`code_famille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `famille`
--

INSERT INTO `famille` (`code_famille`, `nom_famille`) VALUES
(1, 'produit cosmetique'),
(2, 'nourisson');

-- --------------------------------------------------------

--
-- Structure de la table `forme`
--

CREATE TABLE IF NOT EXISTS `forme` (
  `code_forme` int(11) NOT NULL,
  `nom_forme` varchar(50) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_forme`),
  UNIQUE KEY `code_forme` (`code_forme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `forme`
--

INSERT INTO `forme` (`code_forme`, `nom_forme`, `commentaire`) VALUES
(1, 'gelule', 'pas necessaire'),
(2, 'serum', 'pas important');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `code_fournisseur` int(10) NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `tel_urg` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adresse` varchar(50) NOT NULL,
  `solde_compte` int(11) NOT NULL,
  PRIMARY KEY (`code_fournisseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`code_fournisseur`, `raison_social`, `contact`, `tel`, `tel_urg`, `email`, `adresse`, `solde_compte`) VALUES
(1, 'ROOK IT ASSOCIATE', '', '90894549', NULL, 'rooktimail@gmail.com', 'agoe kleve super', 0),
(2, 'Euck IT ', '', '93231033', NULL, 'eugenienantis@gmail.com', 'agoe telessou', 0),
(3, 'ETS OLA', 'OLA', '22251608', '585258', 'jj@fmail.com', 'lome togo', 0),
(4, 'ETS HH', 'Hubert', '22369845', '56892582', 'OO@GMAIL.COÂ§M', 'lome togo', 0);

-- --------------------------------------------------------

--
-- Structure de la table `historique_client`
--

CREATE TABLE IF NOT EXISTS `historique_client` (
  `code_historique` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `total_du` int(11) NOT NULL,
  `montant_paye` int(11) NOT NULL,
  `solde_restant` int(11) NOT NULL,
  `date_regularisation` datetime NOT NULL,
  PRIMARY KEY (`code_historique`,`code_cli`),
  KEY `code_cli` (`code_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `historique_client`
--

INSERT INTO `historique_client` (`code_historique`, `code_cli`, `total_du`, `montant_paye`, `solde_restant`, `date_regularisation`) VALUES
(1, 1, 11000, 1000, 10000, '2017-07-13 00:00:00'),
(2, 2, 6000, 6000, 0, '2017-07-13 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `historique_modif`
--

CREATE TABLE IF NOT EXISTS `historique_modif` (
  `code_historique` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `ancien` varchar(255) NOT NULL,
  `QteAncAv` float NOT NULL,
  `QteAncAP` float NOT NULL,
  `Nouveau` varchar(255) NOT NULL,
  `QteNouAv` float NOT NULL,
  `QteNouAp` float NOT NULL,
  `DateOperation` datetime NOT NULL,
  `login` varchar(100) NOT NULL,
  PRIMARY KEY (`code_historique`,`code_vente`),
  KEY `code_vente` (`code_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `journee`
--

CREATE TABLE IF NOT EXISTS `journee` (
  `code_journee` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fermeture` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `statut` int(255) DEFAULT NULL,
  `montant_fermeture` int(11) DEFAULT NULL,
  `montant_cloture` int(11) DEFAULT NULL,
  `montant_manquant` int(11) DEFAULT NULL,
  `montant_surplus` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_journee`,`code_user`),
  KEY `code_user` (`code_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `journee`
--

INSERT INTO `journee` (`code_journee`, `code_user`, `date`, `date_ouverture`, `date_fermeture`, `date_cloture`, `statut`, `montant_fermeture`, `montant_cloture`, `montant_manquant`, `montant_surplus`) VALUES
(0, 0, '2017-07-13', '2017-07-17 15:37:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, '2017-07-11', '2017-07-11 07:18:25', '2017-07-11 22:40:44', '2017-07-11 22:44:21', 1, 150000, 150000, 0, 0),
(2, 2, '2017-07-12', '2017-07-12 07:00:00', '2017-07-12 22:32:38', '2017-07-12 22:40:18', 1, 180000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

CREATE TABLE IF NOT EXISTS `laboratoire` (
  `code_lab` int(10) NOT NULL,
  `numero_labo` varchar(10) DEFAULT NULL,
  `nom_laboratoire` varchar(255) NOT NULL,
  PRIMARY KEY (`code_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `laboratoire`
--

INSERT INTO `laboratoire` (`code_lab`, `numero_labo`, `nom_laboratoire`) VALUES
(1, '001P', 'BIOPHARMA'),
(2, '002A', 'pharmapur');

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE IF NOT EXISTS `localisation` (
  `code_localisation` int(11) NOT NULL,
  `nom_localisation` varchar(50) NOT NULL,
  PRIMARY KEY (`code_localisation`),
  UNIQUE KEY `code_localisation` (`code_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `localisation`
--

INSERT INTO `localisation` (`code_localisation`, `nom_localisation`) VALUES
(1, 'rayons1, etage6'),
(2, 'raynon1,etgage2');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `code_log` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `heure` datetime DEFAULT NULL,
  `evenement` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_log`,`code_user`),
  UNIQUE KEY `code_log` (`code_log`),
  UNIQUE KEY `code_user` (`code_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `logs`
--

INSERT INTO `logs` (`code_log`, `code_user`, `login`, `heure`, `evenement`, `statut`) VALUES
(3, 1, 'anlonsou2017', '2017-07-13 09:00:00', 'initialisation de vente', NULL),
(4, 2, 'kodjo2017', '2017-07-13 14:00:00', 'ouverture du journee', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mode_paiement`
--

CREATE TABLE IF NOT EXISTS `mode_paiement` (
  `code_paiement` int(11) NOT NULL,
  `description` varchar(11) NOT NULL,
  PRIMARY KEY (`code_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mode_paiement`
--

INSERT INTO `mode_paiement` (`code_paiement`, `description`) VALUES
(1, 'ESPECE'),
(2, 'CHEQUE');

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE IF NOT EXISTS `motif` (
  `code_motif` int(10) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`code_motif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `motif`
--

INSERT INTO `motif` (`code_motif`, `description`) VALUES
(1, 'perime depuis 3mois'),
(2, 'exposition sur les etrageres'),
(3, 'ils en approche de leurs date de premption');

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE IF NOT EXISTS `mouvement` (
  `code_mouvement` int(10) NOT NULL AUTO_INCREMENT,
  `code_vente` int(10) DEFAULT NULL,
  `code_sortie` int(10) DEFAULT NULL,
  `code_entree` int(10) DEFAULT NULL,
  `libelle` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`code_mouvement`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `mouvement`
--

INSERT INTO `mouvement` (`code_mouvement`, `code_vente`, `code_sortie`, `code_entree`, `libelle`, `date`) VALUES
(3, 2, NULL, NULL, 'PRODUUT  euck IT', '2017-07-12 00:00:00'),
(4, 4, NULL, NULL, 'PRODUUT  euck IT', '2017-07-12 00:00:00'),
(5, NULL, NULL, 1, 'PRODUUT  euck IT', '2017-07-12 00:00:00'),
(6, NULL, NULL, 2, 'PRODUUT  euck IT', '2017-07-12 00:00:00'),
(7, NULL, 1, NULL, 'PRODUUT  euck IT', '2017-07-12 00:00:00'),
(8, NULL, 2, NULL, 'PRODUUT  euck IT', '2017-07-12 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `mouvement_log`
--

CREATE TABLE IF NOT EXISTS `mouvement_log` (
  `code_mouvement` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `code_log` int(11) NOT NULL,
  PRIMARY KEY (`code_mouvement`,`code_log`,`code_user`),
  UNIQUE KEY `code_mouvement` (`code_mouvement`),
  UNIQUE KEY `code_user` (`code_user`),
  UNIQUE KEY `code_log` (`code_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mouvement_log`
--

INSERT INTO `mouvement_log` (`code_mouvement`, `code_user`, `code_log`) VALUES
(1, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE IF NOT EXISTS `panier` (
  `code_panier` int(4) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `nb_vendu` int(3) NOT NULL,
  `prix_vente` float NOT NULL,
  PRIMARY KEY (`code_panier`),
  KEY `code_vente` (`code_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `panier`
--

INSERT INTO `panier` (`code_panier`, `code_vente`, `designation`, `nb_vendu`, `prix_vente`) VALUES
(1, 1, 'panadol', 2, 5000),
(2, 1, 'apramol', 2, 6000),
(3, 2, 'apramol', 10, 6000);

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

CREATE TABLE IF NOT EXISTS `privilege` (
  `code_priv` int(11) NOT NULL AUTO_INCREMENT,
  `denomination` varchar(20) NOT NULL,
  PRIMARY KEY (`code_priv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `privilege`
--

INSERT INTO `privilege` (`code_priv`, `denomination`) VALUES
(1, 'Administrateur'),
(2, 'Comptoir'),
(3, 'Caisse');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `code_produit` int(10) NOT NULL AUTO_INCREMENT,
  `code_cip` int(20) NOT NULL,
  `code_barre` int(20) DEFAULT NULL,
  `code_interne` int(20) DEFAULT NULL,
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
  `photo` varchar(100) DEFAULT NULL,
  `date_enregistrement` date NOT NULL,
  `date_mj` date NOT NULL,
  `date_peremption` date NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `prix_achat` float NOT NULL,
  `prix_vente` float NOT NULL,
  `taux_tva` float NOT NULL,
  `multiplicateur` int(2) DEFAULT NULL,
  `reduction` float DEFAULT NULL,
  PRIMARY KEY (`code_produit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`code_produit`, `code_cip`, `code_barre`, `code_interne`, `code_lab`, `code_clas`, `code_localisation`, `code_exploitant`, `code_specialite`, `code_forme`, `designation`, `dci`, `Soumis_tva`, `date_commercialisation`, `photo`, `date_enregistrement`, `date_mj`, `date_peremption`, `statut`, `prix_achat`, `prix_vente`, `taux_tva`, `multiplicateur`, `reduction`) VALUES
(1, 121, 0, 1, 1, 1, 1, 1, 1, 1, 'panadol', 'apramol', 1, '2017-07-12', 'D:\\priv\\euck\\IMG-20170612-WA0027.jpg', '2017-07-13', '2017-07-13', '2017-08-31', 1, 3000, 5000, 0.18, 5, 0.5),
(2, 125, 0, 2, 2, 2, 2, 2, 2, 2, 'beclav500', 'IBEX', 1, '2017-07-20', 'IMG-20170612-WA0029.jpg', '2017-07-13', '2017-07-13', '2017-09-28', 1, 4000, 6000, 0.18, 5, 0.5),
(3, 1256, 0, 2, 2, 2, 2, 2, 2, 2, 'beclav600', 'IBEX6', 1, '2017-07-20', 'IMG-20170612-WA0029.jpg', '2017-07-13', '2017-07-13', '2017-09-28', 1, 4000, 6000, 0.18, 5, 0.5),
(4, 569, 0, 1, 1, 1, 1, 1, 1, 1, 'cac1000', 'vitcsandoz', 1, '2017-07-12', 'D:\\priv\\euck\\IMG-20170612-WA0027.jpg', '2017-07-13', '2017-07-13', '2017-08-31', 1, 3000, 5000, 0.18, 5, 0.5),
(5, 253, 0, 1, 1, 2, 1, 2, 1, 1, 'paracetamol', 'para01', 1, '2017-07-12', 'D:\\priv\\euck\\IMG-20170612-WA0027.jpg', '2017-07-13', '2017-07-13', '2017-08-31', 1, 5000, 8000, 0.18, 5, 0.5);

-- --------------------------------------------------------

--
-- Structure de la table `produit_entrant`
--

CREATE TABLE IF NOT EXISTS `produit_entrant` (
  `code_transaction_entree` int(11) NOT NULL,
  `code_entree` int(11) NOT NULL,
  `code_produit` int(11) NOT NULL,
  `nombre_entree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produit_entrant`
--

INSERT INTO `produit_entrant` (`code_transaction_entree`, `code_entree`, `code_produit`, `nombre_entree`) VALUES
(1, 3, 1, 50),
(2, 4, 2, 80);

-- --------------------------------------------------------

--
-- Structure de la table `produit_sortie`
--

CREATE TABLE IF NOT EXISTS `produit_sortie` (
  `code_transaction_sortie` int(11) NOT NULL,
  `code_sortie` int(11) NOT NULL,
  `code_produit` int(10) NOT NULL,
  `nombre_sortie` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produit_sortie`
--

INSERT INTO `produit_sortie` (`code_transaction_sortie`, `code_sortie`, `code_produit`, `nombre_sortie`) VALUES
(1, 1, 1, 10),
(2, 2, 2, 30);

-- --------------------------------------------------------

--
-- Structure de la table `produit_vendu`
--

CREATE TABLE IF NOT EXISTS `produit_vendu` (
  `code_produit` int(10) NOT NULL,
  `code_vente` int(10) NOT NULL,
  `nb_vendu` float NOT NULL,
  `total_vendu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produit_vendu`
--

INSERT INTO `produit_vendu` (`code_produit`, `code_vente`, `nb_vendu`, `total_vendu`) VALUES
(1, 1, 20, 100000),
(2, 2, 10, 60000);

-- --------------------------------------------------------

--
-- Structure de la table `regularisation`
--

CREATE TABLE IF NOT EXISTS `regularisation` (
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_regularisation` int(11) NOT NULL,
  `date_regularisation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `regularisation`
--

INSERT INTO `regularisation` (`code_regularisation`, `code_cli`, `code_compte`, `montant_regularisation`, `date_regularisation`) VALUES
(1, 1, 1, 1000, '2017-07-13 09:28:28'),
(2, 2, 2, 3000, '2017-07-13 15:39:00');

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

CREATE TABLE IF NOT EXISTS `sortie` (
  `code_sortie` int(10) NOT NULL,
  `code_motif` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `date_sortie` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sortie`
--

INSERT INTO `sortie` (`code_sortie`, `code_motif`, `code_user`, `date_sortie`) VALUES
(1, 1, 2, '2017-07-10 08:21:26'),
(2, 1, 2, '2017-07-12 13:31:29');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `code_specialite` int(11) NOT NULL,
  `nom_specialite` varchar(50) NOT NULL,
  `observation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`code_specialite`, `nom_specialite`, `observation`) VALUES
(1, 'douleur et fievre', 'bonne'),
(2, 'paludisme', 'bonne');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `code_stock` int(10) NOT NULL,
  `code_produit` int(10) NOT NULL,
  `qte_stock` int(7) NOT NULL,
  `qte_achat` float NOT NULL,
  `qte_gratuit` float NOT NULL,
  `date_maj` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stock`
--

INSERT INTO `stock` (`code_stock`, `code_produit`, `qte_stock`, `qte_achat`, `qte_gratuit`, `date_maj`) VALUES
(1, 1, 100, 50, 10, '2017-07-11 00:00:00'),
(2, 2, 60, 80, 20, '2017-07-13 00:00:00'),
(3, 3, 100, 50, 10, '2017-07-11 00:00:00'),
(4, 4, 100, 50, 10, '2017-07-11 00:00:00'),
(5, 5, 0, 0, 0, '2017-07-11 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `ticket_caisse`
--

CREATE TABLE IF NOT EXISTS `ticket_caisse` (
  `code_ticket` int(11) NOT NULL,
  `code_espece` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `heure` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ticket_caisse`
--

INSERT INTO `ticket_caisse` (`code_ticket`, `code_espece`, `code_vente`, `code_encaissement`, `code_user`, `heure`) VALUES
(3, 1, 1, 1, 1, '2017-07-13 11:28:32'),
(4, 2, 3, 3, 1, '2017-07-13 13:19:00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `code_user` int(11) NOT NULL AUTO_INCREMENT,
  `code_priv` int(11) NOT NULL,
  `nom_u` varchar(50) NOT NULL,
  `prenom_u` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `date_enregistrement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`code_user`, `code_priv`, `nom_u`, `prenom_u`, `login`, `pwd`, `statut`, `date_enregistrement`) VALUES
(1, 1, 'ANLONSOU', 'kossiwa', '@anlonsou', 'kossiwa2017', 0, '2017-07-20 11:18:12'),
(2, 2, 'KONOR', 'kodjo', '@konor', 'kodjo2017', 1, '2017-07-13 11:46:29');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
  `code_vente` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `jour_ouvert` date NOT NULL,
  `date_vente` date NOT NULL,
  `pourcentage` float NOT NULL,
  `statut` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `vente`
--

INSERT INTO `vente` (`code_vente`, `code_cli`, `code_user`, `jour_ouvert`, `date_vente`, `pourcentage`, `statut`) VALUES
(1, 1, 1, '2017-07-13', '2017-07-13', 0.5, ''),
(2, 2, 1, '2017-07-11', '2017-07-11', 0.5, ''),
(3, 1, 1, '2017-07-13', '2017-07-13', 0.5, ''),
(4, 1, 1, '2017-07-13', '2017-07-13', 0.12, ''),
(5, 1, 1, '2017-07-11', '2017-07-11', 0.12, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
