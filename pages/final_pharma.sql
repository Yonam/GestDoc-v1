-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 18 Juin 2017 à 10:34
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pharma`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `code_cli` int(10) NOT NULL AUTO_INCREMENT,
  `titre` varchar(10) NOT NULL,
  `Nom_cli` varchar(30) NOT NULL,
  `prenom_cli` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `tel1` int(15) NOT NULL UNIQUE,
  `tel2` int(15) NOT NULL,
  `statut` varchar(30) NOT NULL,
  `total_du` int(10) NOT NULL,
  `credit_maximun` int(11) NOT NULL,
  `nbr_jr_avant_paie` int(2) NOT NULL,
  `remise` int(4) NOT NULL,
  `droit_au_credit` tinyint(1) NOT NULL,
  `depassement` int(4) NOT NULL,
  PRIMARY KEY(code_cli)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

CREATE TABLE `privilege` (
  `code_priv` int(11) NOT NULL AUTO_INCREMENT,
  `denomination` varchar(20) NOT NULL,
  PRIMARY KEY(code_priv)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `code_user` int(11) NOT NULL AUTO_INCREMENT ,
  `code_priv` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `date_enregistrement` date NOT NULL
  PRIMARY KEY(code_user),

  FOREIGN KEY (code_priv)
      REFERENCES  privilege(code_priv)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `code_vente` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `jour_ouvert` date NOT NULL,
  `date_vente` int(10) NOT NULL,
  `pourcentage` float NOT NULL,
  `statut` varchar(3) NOT NULL,
  PRIMARY KEY(code_vente,code_cli,code_user),

    FOREIGN KEY (code_cli)
      REFERENCES  client(code_cli)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mode_paiement`
--

CREATE TABLE `mode_paiement` (
  `code_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(11) NOT NULL,
  PRIMARY KEY(code_paiement)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `journee`
--

CREATE TABLE `journee` (
  `code_journee` int(11) NOT NULL AUTO_INCREMENT,
  `code_user` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `date_ouverture` datetime(6) DEFAULT NULL,
  `date_fermeture` datetime(6) DEFAULT NULL,
  `date_cloture` datetime(6) DEFAULT NULL,
  `statut` int(255) DEFAULT NULL,
  `montant_fermeture` int(11) DEFAULT NULL,
  `montant_cloture` int(11) DEFAULT NULL,
  `montant_manquant` int(11) DEFAULT NULL,
  `montant_surplus` int(11) DEFAULT NULL,
  PRIMARY KEY (code_journee,code_user),
  
  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `encaissement`
--

CREATE TABLE `encaissement` (
  `code_encaissement` int(11) NOT NULL AUTO_INCREMENT,
  `code_paiement` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `code_journe` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `date_encaissement` datetime(6) NOT NULL,
  `statut` varchar(30) NOT NULL,
  PRIMARY KEY (code_encaissement,code_paiement,code_vente,code_user),

  FOREIGN KEY (code_paiement)
      REFERENCES  mode_paiement(code_paiement)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_vente)
      REFERENCES  vente(code_vente)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






-- --------------------------------------------------------

--
-- Structure de la table `compte`
--


CREATE TABLE `compte` (
  `code_compte` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  PRIMARY KEY (code_compte,code_cli),

  FOREIGN KEY (code_cli)
      REFERENCES  client(code_cli)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE `credit` (
  `code_credit` int(11) NOT NULL AUTO_INCREMENT,
  `code_encaissement` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_du` int(11) NOT NULL,
  PRIMARY KEY (code_credit,code_encaissement,code_compte),

  FOREIGN KEY (code_encaissement)
      REFERENCES  encaissement(code_encaissement)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_compte)
      REFERENCES  compte(code_compte)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `borderau`
--

CREATE TABLE `borderau` (
  `code_borderau` int(11) NOT NULL AUTO_INCREMENT,
  `code_compte` int(11) NOT NULL,
  `numero_borderau_coursier` int(11) NOT NULL,
  `beneficiaire` varchar(11) NOT NULL,
  PRIMARY KEY(code_borderau,code_compte),

   FOREIGN KEY (code_compte)
      REFERENCES  compte(code_compte)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `banque` (
  `code_banque` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (code_banque)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------



--
-- Structure de la table `cheque`
--

CREATE TABLE `cheque` (
  `code_cheque` int(11) NOT NULL AUTO_INCREMENT,
  `code_encaissement` int(11) NOT NULL,
  `code_banque` int(11) NOT NULL,
  `tireur` varchar(50) NOT NULL,
  `numero` int(30) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (code_cheque,code_encaissement,code_banque),

  FOREIGN KEY (code_banque)
      REFERENCES  banque(code_banque)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_encaissement)
      REFERENCES  encaissement(code_encaissement)
      ON UPDATE CASCADE ON DELETE RESTRICT  	  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

-- Structure de la table `panier`
--

CREATE TABLE `panier`(
  `code_panier` int(4) AUTO_INCREMENT,
  `code_vente` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `nb_vendu` int(3) NOT NULL,
  `prix_vente` float(7) NOT NULL,
  PRIMARY KEY(code_panier),

  FOREIGN KEY(code_vente)
    REFERENCES vente(code_vente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `annulation_vente`(
  `code_annulation` int(4) AUTO_INCREMENT,
  `code_vente` int(11) NOT NULL,
  `date_annulation` date NOT NULL,
  PRIMARY KEY(code_annulation),
  FOREIGN KEY(code_vente)
    REFERENCES vente(code_vente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `commerciale`
--

CREATE TABLE `commerciale` (
  `code_com` int(10) NOT NULL AUTO_INCREMENT,
  `nom_com` varchar(30) NOT NULL,
  `prenom_com` varchar(50) NOT NULL,
  `date_emb` date NOT NULL,
  `tel_com` int(12) NOT NULL,
  `tel_urg` int(12) NOT NULL,
  `chiffre` int(7) NOT NULL,
  `pourcentage` float(3) NOT NULL,
  PRIMARY KEY (code_com)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `depense`
--

CREATE TABLE `depense` (
  `code_depense` int(11) NOT NULL AUTO_INCREMENT,
  `objet` varchar(100) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `commentaire` varchar(100) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY(code_depense)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `code_facture` int(1) NOT NULL AUTO_INCREMENT,
  `numero_facture` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY(code_facture,code_cli,code_vente,code_encaissement,code_user),

  FOREIGN KEY (code_cli)
      REFERENCES  client(code_cli)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_vente)
      REFERENCES  vente(code_vente)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_encaissement)
      REFERENCES  encaissement(code_encaissement)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
	  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `code_fournisseur` int(10) NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) NOT NULL,
  `tel` int(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  PRIMARY KEY(code_fournisseur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `entree`
--

CREATE TABLE `entree` (
  `code_entree` int(10) AUTO_INCREMENT,
  `code_fournisseur` int(10) UNIQUE,
  `numero_facture` varchar(20) DEFAULT NULL,
  `numero_bordereau` varchar(20) DEFAULT NULL,
  `code_user` int(10) UNIQUE,
  `date_entree` date DEFAULT NULL,
  PRIMARY KEY(code_entree,code_fournisseur,code_user),

  FOREIGN KEY (code_fournisseur)
      REFERENCES  fournisseur(code_fournisseur)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE `espece` (
  `code_espece` int(11) NOT NULL AUTO_INCREMENT,
  `code_encaissement` int(11) NOT NULL,
  `montant_remi` int(11) NOT NULL,
  `montant_regle` int(11) NOT NULL,
  `relicat` int(11) NOT NULL,
  PRIMARY KEY(code_espece,code_encaissement),

  FOREIGN KEY (code_encaissement)
      REFERENCES  encaissement(code_encaissement)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `regularisation`
--

CREATE TABLE `regularisation` (
  `code_regularisation` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_regularisation` int(11) NOT NULL,
  `date_regularisation` datetime(6) NOT NULL,
  PRIMARY KEY(code_regularisation,code_cli,code_compte),

  FOREIGN KEY (code_cli)
      REFERENCES  client(code_cli)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_compte)
      REFERENCES  compte(code_compte)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facture_regularisation`
--

CREATE TABLE `facture_regularisation` (
  `code_facture` int(11) NOT NULL AUTO_INCREMENT,
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  PRIMARY KEY(code_facture,code_regularisation,code_cli),
  
  FOREIGN KEY (code_cli)
      REFERENCES  client(code_cli)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
 FOREIGN KEY (code_regularisation)
      REFERENCES  regularisation(code_regularisation)
      ON UPDATE CASCADE ON DELETE RESTRICT
	   
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `code_famille` int(10) NOT NULL AUTO_INCREMENT,
  `nom_famille` varchar(255) NOT NULL,
  PRIMARY KEY (code_famille)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;









-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `code_log` int(11) UNIQUE AUTO_INCREMENT,
  `code_user` int(11) UNIQUE,
  `login` varchar(255) DEFAULT NULL,
  `heure` datetime(6) DEFAULT NULL,
  `evenement` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  PRIMARY KEY(code_log,code_user),

  FOREIGN KEY (code_user)
      REFERENCES  utilisateur (code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `motif`
--   motif de mise en rebus

CREATE TABLE `motif` (
  `code_motif` int(10) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (code_motif)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

CREATE TABLE `sortie` (
  `code_sortie` int(10) NOT NULL AUTO_INCREMENT,
  `code_motif` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `date_sortie` datetime(6) DEFAULT NULL,
  PRIMARY KEY(code_sortie,code_motif,code_user),
  
  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_motif)
      REFERENCES  motif(code_motif)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE `mouvement` (
  `code_mouvement` int(10) NOT NULL AUTO_INCREMENT,
  `code_vente` int(10) DEFAULT NULL,
  `code_sortie` int(10) DEFAULT NULL,
  `code_entree` int(10) DEFAULT NULL,
  `libelle` varchar(25) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY(code_mouvement,code_vente,code_sortie,code_entree),

  FOREIGN KEY (code_vente)
      REFERENCES  vente(code_vente)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_sortie)
      REFERENCES  sortie(code_sortie)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_entree)
      REFERENCES  entree(code_entree)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement_log`
--

CREATE TABLE `mouvement_log` (
  `code_mouvement` int(10) UNIQUE AUTO_INCREMENT,
  `code_user` int(10) UNIQUE,
  `code_log` int(11) UNIQUE,
  PRIMARY KEY(code_mouvement,code_log,code_user),
  
  FOREIGN KEY (code_mouvement)
      REFERENCES  mouvement(code_mouvement)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  
  
  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_log)
      REFERENCES  logs(code_log)
      ON UPDATE CASCADE ON DELETE RESTRICT
	   
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

CREATE TABLE `parametre` (
  `code_para` int(11) NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `logo` varchar(100) NOT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `adresses` varchar(255) DEFAULT NULL,
  `titre_responsable` varchar(255) DEFAULT NULL,
  `nom_responsable` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  PRIMARY KEY(code_para)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `code_specialite` int(11) UNIQUE AUTO_INCREMENT,
  `nom_specialite` varchar(50) NOT NULL,
  `observation` varchar(255) NOT NULL,
  PRIMARY KEY(code_specialite)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

CREATE TABLE `laboratoire` (
  `code_lab` int(10) NOT NULL AUTO_INCREMENT,
  `numero_labo` varchar(10) DEFAULT NULL,
  `nom_laboratoire` varchar(255) NOT NULL,
  PRIMARY KEY(code_lab)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exploitant`
--

CREATE TABLE `exploitant` (
  `code_exploitant` int(11) UNIQUE AUTO_INCREMENT,
  `numero_exploitant` varchar(10) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (code_exploitant)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `code_clas` int(11) UNIQUE AUTO_INCREMENT,
  `num_clas` int(11) ,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (code_clas)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE `localisation` (
  `code_localisation` int(11) UNIQUE AUTO_INCREMENT,
  `nom_localisation` varchar(50) NOT NULL,
  PRIMARY KEY(code_localisation)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Structure de la table `forme`
--

CREATE TABLE `forme` (
  `code_forme` int(11) UNIQUE AUTO_INCREMENT,
  `nom_forme` varchar(50) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY(code_forme)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `code_produit` int(10) UNIQUE AUTO_INCREMENT,
  `code_cip` int(20) UNIQUE,
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
  `prix_achat` float(7) NOT NULL,
  `prix_vente` float(7) NOT NULL,
  `taux_tva` float(2) NOT NULL,
  `multiplicateur` int(2) NOT NULL,
  PRIMARY KEY(code_produit,code_cip),
 
 FOREIGN KEY (code_specialite)
      REFERENCES  specialite(code_specialite)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  
  FOREIGN KEY (code_lab)
      REFERENCES  laboratoire(code_lab)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_clas)
      REFERENCES  classe(code_clas)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_localisation)
      REFERENCES  localisation(code_localisation)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_forme)
      REFERENCES  forme(code_forme)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  
  FOREIGN KEY (code_exploitant)
      REFERENCES  exploitant(code_exploitant)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit_entrant`
--

CREATE TABLE `produit_entrant` (
  `code_transaction_entree` int(11) UNIQUE AUTO_INCREMENT,
  `code_entree` int(11) UNIQUE,
  `code_produit` int(11) UNIQUE,
  `nombre_entree` int(11) NOT NULL,
  PRIMARY KEY(code_transaction_entree,code_entree,code_produit),
  
  FOREIGN KEY (code_entree)
      REFERENCES  entree(code_entree)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  
  FOREIGN KEY (code_produit)
      REFERENCES  produit(code_produit)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------



--
-- Structure de la table `produit_vendu`
--

CREATE TABLE `produit_vendu` (
  `code_produit` int(10) NOT NULL AUTO_INCREMENT,
  `code_vente` int(10) NOT NULL,
  `nb_vendu` float NOT NULL,
  `total_vendu` float NOT NULL,
  PRIMARY KEY(code_produit,code_vente),
  
  FOREIGN KEY (code_vente)
      REFERENCES  vente(code_vente)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
  FOREIGN KEY (code_produit)
      REFERENCES  produit(code_produit)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------
--
-- Structure de la table `produit_sortie`
--

CREATE TABLE `produit_sortie` (
  `code_transaction_sortie` int(11) NOT NULL AUTO_INCREMENT,
  `code_sortie` int(11) UNIQUE,
  `code_produit` int(10) UNIQUE,
  `nombre_sortie` int(10) NOT NULL,
  PRIMARY KEY(code_transaction_sortie,code_sortie,code_produit),
  
  FOREIGN KEY (code_sortie)
      REFERENCES  sortie(code_sortie)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  	  
  FOREIGN KEY (code_produit)
      REFERENCES  produit(code_produit)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `code_stock` int(10) NOT NULL AUTO_INCREMENT,
  `code_produit` int(10) NOT NULL,
  `qte_stock` int(7) NOT NULL,
  `qte_achat` float NOT NULL,
  `qte_gratuit` float NOT NULL,
  `date_maj` datetime(6) NOT NULL,
  PRIMARY KEY(code_stock,code_produit),

  FOREIGN KEY (code_produit)
      REFERENCES  produit(code_produit)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ticket_caisse`
--

CREATE TABLE `ticket_caisse` (
  `code_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `code_espece` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `heure` datetime(6) NOT NULL,
  PRIMARY KEY(code_ticket,code_espece,code_vente,code_encaissement,code_user),

  FOREIGN KEY (code_espece)
      REFERENCES  espece(code_espece)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_vente)
      REFERENCES  vente(code_vente)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (code_encaissement)
      REFERENCES  encaissement(code_encaissement)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	  
	  FOREIGN KEY (code_user)
      REFERENCES  utilisateur(code_user)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


-- Structure de la table `historique`
-- Historique de modification des ventes


CREATE TABLE `historique_Modif` (
  `code_historique` int(11) NOT NULL AUTO_INCREMENT,
  `code_vente` int(11) NOT NULL,
  `ancien` varchar(255) NOT NULL,
  `QteAncAv` float NOT NULL,
  `QteAncAP` float NOT NULL,
  `Nouveau` varchar(255) NOT NULL,
  `QteNouAv` float NOT NULL,
  `QteNouAp` float NOT NULL,
  `DateOperation` datetime(6) NOT NULL,
  `login` varchar(100) NOT NULL,
  PRIMARY KEY (code_historique,code_vente),

  FOREIGN KEY (code_vente)
      REFERENCES  vente(code_vente)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

------------------------------------------------------


---- Structure de la table `historique_client`
---- table provisoire

CREATE TABLE `historique_client` (
  `code_historique` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `total_du` int(11) NOT NULL,
  `montant_paye` int(11) NOT NULL,
  `solde_restant` int(11) NOT NULL,
  `date_regularisation` datetime(6) NOT NULL,
  PRIMARY KEY (code_historique,code_cli),

  FOREIGN KEY (code_cli)
      REFERENCES  client(code_cli)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





-----------------------------------------------------
-----------------  TABLES TEMPORAIRES ---------------
-----------------------------------------------------


------------------------------------------------------



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
