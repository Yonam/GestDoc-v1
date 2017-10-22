-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 22 oct. 2017 à 01:55
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `stock`
--
CREATE DATABASE IF NOT EXISTS `stock` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `stock`;

-- --------------------------------------------------------

--
-- Structure de la table `annulation_vente`
--

DROP TABLE IF EXISTS `annulation_vente`;
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

DROP TABLE IF EXISTS `banque`;
CREATE TABLE IF NOT EXISTS `banque` (
  `CODE_BANQUE` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_BANQUE` text,
  `DESCRIPTION` text,
  PRIMARY KEY (`CODE_BANQUE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `banque`
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

DROP TABLE IF EXISTS `bordereau`;
CREATE TABLE IF NOT EXISTS `bordereau` (
  `CODE_BORDEREAU` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_BORDEREAU_COURSIER` text,
  `BENEFICIAIRE` text,
  PRIMARY KEY (`CODE_BORDEREAU`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bordereau`
--

INSERT INTO `bordereau` (`CODE_BORDEREAU`, `NUMERO_BORDEREAU_COURSIER`, `BENEFICIAIRE`) VALUES
(1, 'AZR7854693PLO', 'Toto'),
(2, 'ERTG85479652', 'Gerant');

-- --------------------------------------------------------

--
-- Structure de la table `classe_produit`
--

DROP TABLE IF EXISTS `classe_produit`;
CREATE TABLE IF NOT EXISTS `classe_produit` (
  `CODE_CLASSE` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_CLASS` text,
  `DESCRIPTION` text,
  PRIMARY KEY (`CODE_CLASSE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commerciale`
--

DROP TABLE IF EXISTS `commerciale`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
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

DROP TABLE IF EXISTS `contrat_souscripteur`;
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

DROP TABLE IF EXISTS `definir_pourcentage`;
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

DROP TABLE IF EXISTS `depense`;
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

DROP TABLE IF EXISTS `encaissement`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `encaissement`
--

INSERT INTO `encaissement` (`CODE_ENCAISSEMENT`, `CODE_JOURNEE`, `CODE_PAYEMENT`, `CODE_VENTE`, `CODE_USER`, `TYPE`, `DATE_ENCAISSEMENT`, `STATUT`) VALUES
(1, 2, 1, 1, 4, 'EspÃ¨ce', '2017-10-19 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `entree`
--

DROP TABLE IF EXISTS `entree`;
CREATE TABLE IF NOT EXISTS `entree` (
  `CODE_ENTREE` int(10) NOT NULL AUTO_INCREMENT,
  `CODE_USER` int(11) NOT NULL,
  `DATE_ENTREE` date DEFAULT NULL,
  `NUMERO_FACTURE` text,
  `NUMERO_BORDEREAU` text,
  PRIMARY KEY (`CODE_ENTREE`),
  KEY `FK_EFFECTUER_ENTREE` (`CODE_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entree`
--

INSERT INTO `entree` (`CODE_ENTREE`, `CODE_USER`, `DATE_ENTREE`, `NUMERO_FACTURE`, `NUMERO_BORDEREAU`) VALUES
(1, 4, '2017-10-18', '23RTF34998', '9088HUID4453');

-- --------------------------------------------------------

--
-- Structure de la table `exploitant`
--

DROP TABLE IF EXISTS `exploitant`;
CREATE TABLE IF NOT EXISTS `exploitant` (
  `CODE_EXPLOITANT` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_EXPLOITANT` text,
  `LIBELLE` text,
  PRIMARY KEY (`CODE_EXPLOITANT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `famille_produit`
--

DROP TABLE IF EXISTS `famille_produit`;
CREATE TABLE IF NOT EXISTS `famille_produit` (
  `CODE_FAMILLE` int(10) NOT NULL AUTO_INCREMENT,
  `NUM_FAMILLE` text,
  `NOM_FAMILLE` text,
  PRIMARY KEY (`CODE_FAMILLE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `famille_produit`
--

INSERT INTO `famille_produit` (`CODE_FAMILLE`, `NUM_FAMILLE`, `NOM_FAMILLE`) VALUES
(1, NULL, 'alimentaire');

-- --------------------------------------------------------

--
-- Structure de la table `forme`
--

DROP TABLE IF EXISTS `forme`;
CREATE TABLE IF NOT EXISTS `forme` (
  `CODE_FORME` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_FORME` text,
  `NUM_FORME` text,
  PRIMARY KEY (`CODE_FORME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `forme`
--

INSERT INTO `forme` (`CODE_FORME`, `NOM_FORME`, `NUM_FORME`) VALUES
(1, 'poudre', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`CODE_FOURNISSEUR`, `RAISON_SOCIAL`, `CONCTACT`, `TEL`, `TEL_URG`, `EMAIL`, `ADRESSE`, `SOLDE_COMPTE`, `deleted`) VALUES
(1, 'fan milk', 'Kokou', '90989796', '98429813', 'arendal@gmail.com', 'sito aeroporte', 31080, 0);

-- --------------------------------------------------------

--
-- Structure de la table `historique_modif`
--

DROP TABLE IF EXISTS `historique_modif`;
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

DROP TABLE IF EXISTS `journee`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `journee`
--

INSERT INTO `journee` (`CODE_JOURNEE`, `CODE_USER_OUVRIR`, `CODE_USER_FERMER`, `CODE_USER_CLOTURER`, `DATE`, `DATE_OUVERTURE`, `DATE_FERMETURE`, `DATE_CLOTURE`, `STATUT`, `MONTANT_FERMETURE`, `MONTANT_CLOTURE`, `MONTANT_MANQUANT`, `MONTANT_SURPLUS`) VALUES
(1, 4, 4, 4, '2017-10-11', '2017-10-19 05:13:00', '2017-10-19 12:09:50', '2017-10-19 12:10:40', 1, 90000.00, 90000.00, 0.00, 0.00),
(2, 4, NULL, NULL, '2017-10-12', '2017-10-19 12:09:52', NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

DROP TABLE IF EXISTS `laboratoire`;
CREATE TABLE IF NOT EXISTS `laboratoire` (
  `CODE_LAB` int(10) NOT NULL AUTO_INCREMENT,
  `NUMERO_LAB` text,
  `NOM_LABORATOIRE` text,
  PRIMARY KEY (`CODE_LAB`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

DROP TABLE IF EXISTS `localisation`;
CREATE TABLE IF NOT EXISTS `localisation` (
  `CODE_LOCALISATION` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_LOCALISATION` text,
  `NOM_LOCALISATION` text,
  PRIMARY KEY (`CODE_LOCALISATION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `localisation`
--

INSERT INTO `localisation` (`CODE_LOCALISATION`, `NUM_LOCALISATION`, `NOM_LOCALISATION`) VALUES
(1, NULL, 'etagere 1');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

DROP TABLE IF EXISTS `logs`;
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

DROP TABLE IF EXISTS `mode_payement`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mode_payement`
--

INSERT INTO `mode_payement` (`CODE_PAYEMENT`, `CODE_BANQUE`, `CODE_SOUSCRIPTEUR`, `DESCRIPTION`, `NUM_CHEQUE`, `MONTANT`, `MONTANT_PAYE`, `MONTANT_RESTE`, `DATE_CHEQUE`) VALUES
(1, NULL, NULL, NULL, NULL, 872, 872, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

DROP TABLE IF EXISTS `motif`;
CREATE TABLE IF NOT EXISTS `motif` (
  `CODE_MOTIF` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text,
  PRIMARY KEY (`CODE_MOTIF`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `motif`
--

INSERT INTO `motif` (`CODE_MOTIF`, `DESCRIPTION`) VALUES
(1, 'perime');

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

DROP TABLE IF EXISTS `mouvement`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mouvement`
--

INSERT INTO `mouvement` (`CODE_MOUVEMENT`, `CODE_SORTIE`, `CODE_ENTREE`, `CODE_VENTE`, `LIBELLE`, `DATE`) VALUES
(1, NULL, NULL, NULL, 'EntrÃ©e', '2017-10-18'),
(2, NULL, NULL, NULL, 'Sortie', '2017-10-18');

-- --------------------------------------------------------

--
-- Structure de la table `operationcompte`
--

DROP TABLE IF EXISTS `operationcompte`;
CREATE TABLE IF NOT EXISTS `operationcompte` (
  `CODE_COMPTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_CLI` int(11) NOT NULL,
  `SOLDE` float(8,2) DEFAULT NULL,
  `MONTANT_VERSE` float(8,2) DEFAULT NULL,
  `RESTE` float(8,2) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_COMPTE`),
  KEY `FK_LIER` (`CODE_CLI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `operation_fournisseur`
--

DROP TABLE IF EXISTS `operation_fournisseur`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `CODE_PRIVILEGE` int(11) NOT NULL AUTO_INCREMENT,
  `DESIGNATION` text,
  `LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODE_PRIVILEGE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privileges`
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

DROP TABLE IF EXISTS `produit`;
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
  `SOUMIS_TVA` tinyint(1) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`CODE_PRODUIT`, `CODE_FAMILLE`, `CODE_FORME`, `CODE_CLASSE`, `CODE_EXPLOITANT`, `PRO_CODE_PRODUIT`, `CODE_LOCALISATION`, `CODE_SPECIALITE`, `CODE_LAB`, `DESIGNATION`, `DCI`, `SOUMIS_TVA`, `TAUX_TVA`, `DATE_COMMERCIALISATION`, `PHOTO`, `DATE_ENREGISTREMENT`, `DATE_MJ`, `QTE_STOCK`, `PRIX_VENTE`, `PRIX_PRODUIT`, `CIP`, `CODE_BARRE`) VALUES
(1, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 'milo', NULL, 1, 0.18, '2017-10-04', NULL, '2017-10-18 00:00:00', NULL, 0, NULL, 6540, NULL, NULL),
(2, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 'lait', NULL, 1, 0.18, '2017-10-06', NULL, '2017-10-18 00:00:00', '2017-10-18', 10, NULL, 2072, NULL, NULL),
(3, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 'bledina', NULL, 0, 0, '2017-10-05', NULL, '2017-10-18 00:00:00', NULL, 0, NULL, 39200, NULL, NULL),
(4, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 'gari', NULL, 1, 0.18, '2017-10-07', NULL, '2017-10-18 00:00:00', NULL, 0, NULL, 436, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit_entree_fournisseur`
--

DROP TABLE IF EXISTS `produit_entree_fournisseur`;
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
-- Déchargement des données de la table `produit_entree_fournisseur`
--

INSERT INTO `produit_entree_fournisseur` (`CODE_PRODUIT`, `CODE_ENTREE`, `CODE_FOURNISSEUR`, `NOMBRE_ENTREE`, `QTE_ACHAT`, `QTE_GRATUIT`, `DATE_MAJ`, `MONTANT_DU`, `ACHAT_CREDIT`, `DATE_PEREMPTION`) VALUES
(2, 1, 1, 20, 15, 5, '2017-10-18', 41440, 0, '2017-10-31');

-- --------------------------------------------------------

--
-- Structure de la table `produit_sortie`
--

DROP TABLE IF EXISTS `produit_sortie`;
CREATE TABLE IF NOT EXISTS `produit_sortie` (
  `CODE_SORTIE` int(11) NOT NULL,
  `CODE_PRODUIT` int(11) NOT NULL,
  `QTE_SORTIE` int(11) DEFAULT NULL,
  `DATE_SORTIE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_SORTIE`,`CODE_PRODUIT`),
  KEY `FK_PRODUIT_SORTIE` (`CODE_PRODUIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit_sortie`
--

INSERT INTO `produit_sortie` (`CODE_SORTIE`, `CODE_PRODUIT`, `QTE_SORTIE`, `DATE_SORTIE`) VALUES
(1, 2, 10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit_vendu`
--

DROP TABLE IF EXISTS `produit_vendu`;
CREATE TABLE IF NOT EXISTS `produit_vendu` (
  `CODE_PRODUIT` int(11) NOT NULL,
  `CODE_VENTE` int(11) NOT NULL,
  `NB_VENDU` int(11) DEFAULT NULL,
  `MONTANT_VENTE` float DEFAULT NULL,
  PRIMARY KEY (`CODE_PRODUIT`,`CODE_VENTE`),
  KEY `FK_PRODUIT_VENDU` (`CODE_VENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit_vendu`
--

INSERT INTO `produit_vendu` (`CODE_PRODUIT`, `CODE_VENTE`, `NB_VENDU`, `MONTANT_VENTE`) VALUES
(4, 1, 2, 872);

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

DROP TABLE IF EXISTS `societe`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

DROP TABLE IF EXISTS `sortie`;
CREATE TABLE IF NOT EXISTS `sortie` (
  `CODE_SORTIE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE_MOTIF` int(11) NOT NULL,
  `CODE_USER` int(11) NOT NULL,
  `DATE_SORTIE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_SORTIE`),
  KEY `FK_EFFECTUER_SORTIE` (`CODE_USER`),
  KEY `FK_JUSTIFIER` (`CODE_MOTIF`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sortie`
--

INSERT INTO `sortie` (`CODE_SORTIE`, `CODE_MOTIF`, `CODE_USER`, `DATE_SORTIE`) VALUES
(1, 1, 4, '2017-10-18');

-- --------------------------------------------------------

--
-- Structure de la table `sortie_caisse`
--

DROP TABLE IF EXISTS `sortie_caisse`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `souscripteur`
--

DROP TABLE IF EXISTS `souscripteur`;
CREATE TABLE IF NOT EXISTS `souscripteur` (
  `CODE_SOUSCRIPTEUR` int(7) NOT NULL AUTO_INCREMENT,
  `NOM_SOUSCRIPTEUR` text,
  PRIMARY KEY (`CODE_SOUSCRIPTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `CODE_SPECIALITE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_SPECIALITE` text,
  `NUM_SPECIALITE` text,
  PRIMARY KEY (`CODE_SPECIALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

DROP TABLE IF EXISTS `travailler`;
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

DROP TABLE IF EXISTS `utilisateur`;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
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
(24, 2, 'Afi', 'Wawa', 'Afi', 'a87b877e94143d8997748f33aa6161e207bfceb1', 0, '2017-09-21 17:06:37'),
(25, 2, 'caisse', 'caissier', 'caisse', 'abecdd24c34f12215f3198c2c7fbb478b296ac92', 0, '2017-10-18 15:59:41');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`CODE_VENTE`, `CODE_ANNULATION`, `CODE_JOURNEE`, `CODE_CLI`, `CODE_ENCAISSEMENT`, `CODE_USER`, `CODE_BORDEREAU`, `DATE_VENTE`, `POURCENTAGE`, `STATUT`, `HEURE_VENTE`) VALUES
(1, NULL, 2, NULL, 1, 4, NULL, '2017-10-19', NULL, 1, '13:11:29');

--
-- Contraintes pour les tables déchargées
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
