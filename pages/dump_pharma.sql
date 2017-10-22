/*
Navicat MySQL Data Transfer

Source Server         : MYSQL DB
Source Server Version : 50615
Source Host           : 192.168.137.1:3306
Source Database       : pharma

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2017-06-27 21:46:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `banque`
-- ----------------------------
DROP TABLE IF EXISTS `banque`;
CREATE TABLE `banque` (
  `code_banque` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code_banque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banque
-- ----------------------------

-- ----------------------------
-- Table structure for `borderau`
-- ----------------------------
DROP TABLE IF EXISTS `borderau`;
CREATE TABLE `borderau` (
  `code_borderau` int(11) NOT NULL AUTO_INCREMENT,
  `code_compte` int(11) NOT NULL,
  `numero_borderau_coursier` int(11) NOT NULL,
  `beneficiaire` varchar(11) NOT NULL,
  PRIMARY KEY (`code_borderau`,`code_compte`),
  KEY `code_compte` (`code_compte`),
  CONSTRAINT `borderau_ibfk_1` FOREIGN KEY (`code_compte`) REFERENCES `compte` (`code_compte`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borderau
-- ----------------------------

-- ----------------------------
-- Table structure for `cheque`
-- ----------------------------
DROP TABLE IF EXISTS `cheque`;
CREATE TABLE `cheque` (
  `code_cheque` int(11) NOT NULL AUTO_INCREMENT,
  `code_encaissement` int(11) NOT NULL,
  `code_banque` int(11) NOT NULL,
  `tireur` varchar(50) NOT NULL,
  `numero` int(30) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`code_cheque`,`code_encaissement`,`code_banque`),
  KEY `code_banque` (`code_banque`),
  KEY `code_encaissement` (`code_encaissement`),
  CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`code_banque`) REFERENCES `banque` (`code_banque`) ON UPDATE CASCADE,
  CONSTRAINT `cheque_ibfk_2` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cheque
-- ----------------------------

-- ----------------------------
-- Table structure for `classe`
-- ----------------------------
DROP TABLE IF EXISTS `classe`;
CREATE TABLE `classe` (
  `code_clas` int(11) NOT NULL AUTO_INCREMENT,
  `num_clas` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code_clas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classe
-- ----------------------------

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `code_cli` int(10) NOT NULL AUTO_INCREMENT,
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
  `depassement` int(4) NOT NULL,
  PRIMARY KEY (`code_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------

-- ----------------------------
-- Table structure for `commerciale`
-- ----------------------------
DROP TABLE IF EXISTS `commerciale`;
CREATE TABLE `commerciale` (
  `code_com` int(10) NOT NULL AUTO_INCREMENT,
  `nom_com` varchar(30) NOT NULL,
  `prenom_com` varchar(50) NOT NULL,
  `date_emb` date NOT NULL,
  `tel_com` int(12) NOT NULL,
  `tel_urg` int(12) NOT NULL,
  `chiffre` int(7) NOT NULL,
  `pourcentage` float NOT NULL,
  PRIMARY KEY (`code_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commerciale
-- ----------------------------

-- ----------------------------
-- Table structure for `compte`
-- ----------------------------
DROP TABLE IF EXISTS `compte`;
CREATE TABLE `compte` (
  `code_compte` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  PRIMARY KEY (`code_compte`,`code_cli`),
  KEY `code_cli` (`code_cli`),
  CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of compte
-- ----------------------------

-- ----------------------------
-- Table structure for `credit`
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit` (
  `code_credit` int(11) NOT NULL AUTO_INCREMENT,
  `code_encaissement` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_du` int(11) NOT NULL,
  PRIMARY KEY (`code_credit`,`code_encaissement`,`code_compte`),
  KEY `code_encaissement` (`code_encaissement`),
  KEY `code_compte` (`code_compte`),
  CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE,
  CONSTRAINT `credit_ibfk_2` FOREIGN KEY (`code_compte`) REFERENCES `compte` (`code_compte`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credit
-- ----------------------------

-- ----------------------------
-- Table structure for `depense`
-- ----------------------------
DROP TABLE IF EXISTS `depense`;
CREATE TABLE `depense` (
  `code_depense` int(11) NOT NULL AUTO_INCREMENT,
  `objet` varchar(100) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `commentaire` varchar(100) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY (`code_depense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depense
-- ----------------------------

-- ----------------------------
-- Table structure for `encaissement`
-- ----------------------------
DROP TABLE IF EXISTS `encaissement`;
CREATE TABLE `encaissement` (
  `code_encaissement` int(11) NOT NULL AUTO_INCREMENT,
  `code_paiement` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `code_journe` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `date_encaissement` datetime(6) NOT NULL,
  `statut` varchar(30) NOT NULL,
  PRIMARY KEY (`code_encaissement`,`code_paiement`,`code_vente`,`code_user`),
  KEY `code_paiement` (`code_paiement`),
  KEY `code_user` (`code_user`),
  KEY `code_vente` (`code_vente`),
  CONSTRAINT `encaissement_ibfk_1` FOREIGN KEY (`code_paiement`) REFERENCES `mode_paiement` (`code_paiement`) ON UPDATE CASCADE,
  CONSTRAINT `encaissement_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE,
  CONSTRAINT `encaissement_ibfk_3` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encaissement
-- ----------------------------

-- ----------------------------
-- Table structure for `entree`
-- ----------------------------
DROP TABLE IF EXISTS `entree`;
CREATE TABLE `entree` (
  `code_entree` int(10) NOT NULL AUTO_INCREMENT,
  `code_fournisseur` int(10) NOT NULL DEFAULT '0',
  `numero_facture` varchar(20) DEFAULT NULL,
  `numero_bordereau` varchar(20) DEFAULT NULL,
  `code_user` int(10) NOT NULL DEFAULT '0',
  `date_entree` date DEFAULT NULL,
  PRIMARY KEY (`code_entree`,`code_fournisseur`,`code_user`),
  KEY `code_fournisseur` (`code_fournisseur`),
  KEY `code_user` (`code_user`),
  CONSTRAINT `entree_ibfk_1` FOREIGN KEY (`code_fournisseur`) REFERENCES `fournisseur` (`code_fournisseur`) ON UPDATE CASCADE,
  CONSTRAINT `entree_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entree
-- ----------------------------

-- ----------------------------
-- Table structure for `espece`
-- ----------------------------
DROP TABLE IF EXISTS `espece`;
CREATE TABLE `espece` (
  `code_espece` int(11) NOT NULL AUTO_INCREMENT,
  `code_encaissement` int(11) NOT NULL,
  `montant_remi` int(11) NOT NULL,
  `montant_regle` int(11) NOT NULL,
  `relicat` int(11) NOT NULL,
  PRIMARY KEY (`code_espece`,`code_encaissement`),
  KEY `code_encaissement` (`code_encaissement`),
  CONSTRAINT `espece_ibfk_1` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of espece
-- ----------------------------

-- ----------------------------
-- Table structure for `exploitant`
-- ----------------------------
DROP TABLE IF EXISTS `exploitant`;
CREATE TABLE `exploitant` (
  `code_exploitant` int(11) NOT NULL AUTO_INCREMENT,
  `numero_exploitant` varchar(10) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`code_exploitant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exploitant
-- ----------------------------

-- ----------------------------
-- Table structure for `facture`
-- ----------------------------
DROP TABLE IF EXISTS `facture`;
CREATE TABLE `facture` (
  `code_facture` int(1) NOT NULL AUTO_INCREMENT,
  `numero_facture` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY (`code_facture`,`code_cli`,`code_vente`,`code_encaissement`,`code_user`),
  KEY `code_cli` (`code_cli`),
  KEY `code_vente` (`code_vente`),
  KEY `code_encaissement` (`code_encaissement`),
  KEY `code_user` (`code_user`),
  CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  CONSTRAINT `facture_ibfk_2` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  CONSTRAINT `facture_ibfk_3` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE,
  CONSTRAINT `facture_ibfk_4` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facture
-- ----------------------------

-- ----------------------------
-- Table structure for `facture_regularisation`
-- ----------------------------
DROP TABLE IF EXISTS `facture_regularisation`;
CREATE TABLE `facture_regularisation` (
  `code_facture` int(11) NOT NULL AUTO_INCREMENT,
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  PRIMARY KEY (`code_facture`,`code_regularisation`,`code_cli`),
  KEY `code_cli` (`code_cli`),
  KEY `code_regularisation` (`code_regularisation`),
  CONSTRAINT `facture_regularisation_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  CONSTRAINT `facture_regularisation_ibfk_2` FOREIGN KEY (`code_regularisation`) REFERENCES `regularisation` (`code_regularisation`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facture_regularisation
-- ----------------------------

-- ----------------------------
-- Table structure for `famille`
-- ----------------------------
DROP TABLE IF EXISTS `famille`;
CREATE TABLE `famille` (
  `code_famille` int(10) NOT NULL AUTO_INCREMENT,
  `nom_famille` varchar(255) NOT NULL,
  PRIMARY KEY (`code_famille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of famille
-- ----------------------------

-- ----------------------------
-- Table structure for `forme`
-- ----------------------------
DROP TABLE IF EXISTS `forme`;
CREATE TABLE `forme` (
  `code_forme` int(11) NOT NULL AUTO_INCREMENT,
  `nom_forme` varchar(50) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_forme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forme
-- ----------------------------

-- ----------------------------
-- Table structure for `fournisseur`
-- ----------------------------
DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE `fournisseur` (
  `code_fournisseur` int(10) NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) NOT NULL,
  `tel` int(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  PRIMARY KEY (`code_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fournisseur
-- ----------------------------

-- ----------------------------
-- Table structure for `historique_client`
-- ----------------------------
DROP TABLE IF EXISTS `historique_client`;
CREATE TABLE `historique_client` (
  `code_historique` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `total_du` int(11) NOT NULL,
  `montant_paye` int(11) NOT NULL,
  `solde_restant` int(11) NOT NULL,
  `date_regularisation` datetime(6) NOT NULL,
  PRIMARY KEY (`code_historique`,`code_cli`),
  KEY `code_cli` (`code_cli`),
  CONSTRAINT `historique_client_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of historique_client
-- ----------------------------

-- ----------------------------
-- Table structure for `historique_modif`
-- ----------------------------
DROP TABLE IF EXISTS `historique_modif`;
CREATE TABLE `historique_modif` (
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
  PRIMARY KEY (`code_historique`,`code_vente`),
  KEY `code_vente` (`code_vente`),
  CONSTRAINT `historique_modif_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of historique_modif
-- ----------------------------

-- ----------------------------
-- Table structure for `journee`
-- ----------------------------
DROP TABLE IF EXISTS `journee`;
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
  PRIMARY KEY (`code_journee`,`code_user`),
  KEY `code_user` (`code_user`),
  CONSTRAINT `journee_ibfk_1` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journee
-- ----------------------------

-- ----------------------------
-- Table structure for `laboratoire`
-- ----------------------------
DROP TABLE IF EXISTS `laboratoire`;
CREATE TABLE `laboratoire` (
  `code_lab` int(10) NOT NULL AUTO_INCREMENT,
  `numero_labo` varchar(10) DEFAULT NULL,
  `nom_laboratoire` varchar(255) NOT NULL,
  PRIMARY KEY (`code_lab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laboratoire
-- ----------------------------

-- ----------------------------
-- Table structure for `localisation`
-- ----------------------------
DROP TABLE IF EXISTS `localisation`;
CREATE TABLE `localisation` (
  `code_localisation` int(11) NOT NULL AUTO_INCREMENT,
  `nom_localisation` int(11) NOT NULL,
  PRIMARY KEY (`code_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of localisation
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `code_log` int(11) NOT NULL AUTO_INCREMENT,
  `code_user` int(11) NOT NULL DEFAULT '0',
  `login` varchar(255) DEFAULT NULL,
  `heure` datetime(6) DEFAULT NULL,
  `evenement` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_log`,`code_user`),
  KEY `code_user` (`code_user`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `mode_paiement`
-- ----------------------------
DROP TABLE IF EXISTS `mode_paiement`;
CREATE TABLE `mode_paiement` (
  `code_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(11) NOT NULL,
  PRIMARY KEY (`code_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mode_paiement
-- ----------------------------

-- ----------------------------
-- Table structure for `motif`
-- ----------------------------
DROP TABLE IF EXISTS `motif`;
CREATE TABLE `motif` (
  `code_motif` int(10) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`code_motif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of motif
-- ----------------------------

-- ----------------------------
-- Table structure for `mouvement`
-- ----------------------------
DROP TABLE IF EXISTS `mouvement`;
CREATE TABLE `mouvement` (
  `code_mouvement` int(10) NOT NULL AUTO_INCREMENT,
  `code_vente` int(10) NOT NULL DEFAULT '0',
  `code_sortie` int(10) NOT NULL DEFAULT '0',
  `code_entree` int(10) NOT NULL DEFAULT '0',
  `libelle` varchar(25) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`code_mouvement`,`code_vente`,`code_sortie`,`code_entree`),
  KEY `code_vente` (`code_vente`),
  KEY `code_sortie` (`code_sortie`),
  KEY `code_entree` (`code_entree`),
  CONSTRAINT `mouvement_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  CONSTRAINT `mouvement_ibfk_2` FOREIGN KEY (`code_sortie`) REFERENCES `sortie` (`code_sortie`) ON UPDATE CASCADE,
  CONSTRAINT `mouvement_ibfk_3` FOREIGN KEY (`code_entree`) REFERENCES `entree` (`code_entree`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mouvement
-- ----------------------------

-- ----------------------------
-- Table structure for `mouvement_log`
-- ----------------------------
DROP TABLE IF EXISTS `mouvement_log`;
CREATE TABLE `mouvement_log` (
  `code_mouvement` int(10) NOT NULL AUTO_INCREMENT,
  `code_user` int(10) NOT NULL,
  `code_log` int(11) NOT NULL,
  PRIMARY KEY (`code_mouvement`,`code_log`,`code_user`),
  KEY `code_user` (`code_user`),
  KEY `code_log` (`code_log`),
  CONSTRAINT `mouvement_log_ibfk_1` FOREIGN KEY (`code_mouvement`) REFERENCES `mouvement` (`code_mouvement`) ON UPDATE CASCADE,
  CONSTRAINT `mouvement_log_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE,
  CONSTRAINT `mouvement_log_ibfk_3` FOREIGN KEY (`code_log`) REFERENCES `logs` (`code_log`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mouvement_log
-- ----------------------------

-- ----------------------------
-- Table structure for `parametre`
-- ----------------------------
DROP TABLE IF EXISTS `parametre`;
CREATE TABLE `parametre` (
  `code_para` int(11) NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `logo` varchar(100) NOT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `adresses` varchar(255) DEFAULT NULL,
  `titre_responsable` varchar(255) DEFAULT NULL,
  `nom_responsable` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_para`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parametre
-- ----------------------------

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `code_priv` int(11) NOT NULL AUTO_INCREMENT,
  `denomination` varchar(20) NOT NULL,
  PRIMARY KEY (`code_priv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------

-- ----------------------------
-- Table structure for `produit`
-- ----------------------------
DROP TABLE IF EXISTS `produit`;
CREATE TABLE `produit` (
  `code_produit` int(10) NOT NULL AUTO_INCREMENT,
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
  `taux_tva` float NOT NULL,
  `multiplicateur` int(2) NOT NULL,
  PRIMARY KEY (`code_produit`,`code_cip`),
  KEY `code_specialite` (`code_specialite`),
  KEY `code_lab` (`code_lab`),
  KEY `code_clas` (`code_clas`),
  KEY `code_localisation` (`code_localisation`),
  KEY `code_forme` (`code_forme`),
  KEY `code_exploitant` (`code_exploitant`),
  CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`code_specialite`) REFERENCES `specialite` (`code_specialite`) ON UPDATE CASCADE,
  CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`code_lab`) REFERENCES `laboratoire` (`code_lab`) ON UPDATE CASCADE,
  CONSTRAINT `produit_ibfk_3` FOREIGN KEY (`code_clas`) REFERENCES `classe` (`code_clas`) ON UPDATE CASCADE,
  CONSTRAINT `produit_ibfk_4` FOREIGN KEY (`code_localisation`) REFERENCES `localisation` (`code_localisation`) ON UPDATE CASCADE,
  CONSTRAINT `produit_ibfk_5` FOREIGN KEY (`code_forme`) REFERENCES `forme` (`code_forme`) ON UPDATE CASCADE,
  CONSTRAINT `produit_ibfk_6` FOREIGN KEY (`code_exploitant`) REFERENCES `exploitant` (`code_exploitant`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit
-- ----------------------------

-- ----------------------------
-- Table structure for `produit_entrant`
-- ----------------------------
DROP TABLE IF EXISTS `produit_entrant`;
CREATE TABLE `produit_entrant` (
  `code_entree` int(11) NOT NULL AUTO_INCREMENT,
  `code_produit` int(11) NOT NULL,
  `nombre_entree` int(11) NOT NULL,
  PRIMARY KEY (`code_entree`,`code_produit`),
  KEY `code_produit` (`code_produit`),
  CONSTRAINT `produit_entrant_ibfk_1` FOREIGN KEY (`code_entree`) REFERENCES `entree` (`code_entree`) ON UPDATE CASCADE,
  CONSTRAINT `produit_entrant_ibfk_2` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit_entrant
-- ----------------------------

-- ----------------------------
-- Table structure for `produit_sortie`
-- ----------------------------
DROP TABLE IF EXISTS `produit_sortie`;
CREATE TABLE `produit_sortie` (
  `code_sortie` int(11) NOT NULL AUTO_INCREMENT,
  `code_produit` int(10) NOT NULL,
  `nombre_sortie` int(10) NOT NULL,
  PRIMARY KEY (`code_sortie`,`code_produit`),
  KEY `code_produit` (`code_produit`),
  CONSTRAINT `produit_sortie_ibfk_1` FOREIGN KEY (`code_sortie`) REFERENCES `sortie` (`code_sortie`) ON UPDATE CASCADE,
  CONSTRAINT `produit_sortie_ibfk_2` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit_sortie
-- ----------------------------

-- ----------------------------
-- Table structure for `produit_vendu`
-- ----------------------------
DROP TABLE IF EXISTS `produit_vendu`;
CREATE TABLE `produit_vendu` (
  `code_produit` int(10) NOT NULL AUTO_INCREMENT,
  `code_vente` int(10) NOT NULL,
  `nb_vendu` float NOT NULL,
  `total_vendu` float NOT NULL,
  PRIMARY KEY (`code_produit`,`code_vente`),
  KEY `code_vente` (`code_vente`),
  CONSTRAINT `produit_vendu_ibfk_1` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  CONSTRAINT `produit_vendu_ibfk_2` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit_vendu
-- ----------------------------

-- ----------------------------
-- Table structure for `regularisation`
-- ----------------------------
DROP TABLE IF EXISTS `regularisation`;
CREATE TABLE `regularisation` (
  `code_regularisation` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_regularisation` int(11) NOT NULL,
  `date_regularisation` datetime(6) NOT NULL,
  PRIMARY KEY (`code_regularisation`,`code_cli`,`code_compte`),
  KEY `code_cli` (`code_cli`),
  KEY `code_compte` (`code_compte`),
  CONSTRAINT `regularisation_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  CONSTRAINT `regularisation_ibfk_2` FOREIGN KEY (`code_compte`) REFERENCES `compte` (`code_compte`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regularisation
-- ----------------------------

-- ----------------------------
-- Table structure for `sortie`
-- ----------------------------
DROP TABLE IF EXISTS `sortie`;
CREATE TABLE `sortie` (
  `code_sortie` int(10) NOT NULL AUTO_INCREMENT,
  `code_motif` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `date_sortie` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`code_sortie`,`code_motif`,`code_user`),
  KEY `code_user` (`code_user`),
  KEY `code_motif` (`code_motif`),
  CONSTRAINT `sortie_ibfk_1` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE,
  CONSTRAINT `sortie_ibfk_2` FOREIGN KEY (`code_motif`) REFERENCES `motif` (`code_motif`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sortie
-- ----------------------------

-- ----------------------------
-- Table structure for `specialite`
-- ----------------------------
DROP TABLE IF EXISTS `specialite`;
CREATE TABLE `specialite` (
  `code_specialite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_specialite` varchar(50) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  PRIMARY KEY (`code_specialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specialite
-- ----------------------------

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `code_stock` int(10) NOT NULL AUTO_INCREMENT,
  `code_produit` int(10) NOT NULL,
  `qte_achat` float NOT NULL,
  `qte_gratuit` float NOT NULL,
  `date_maj` datetime(6) NOT NULL,
  PRIMARY KEY (`code_stock`,`code_produit`),
  KEY `code_produit` (`code_produit`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`code_produit`) REFERENCES `produit` (`code_produit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for `ticket_caisse`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_caisse`;
CREATE TABLE `ticket_caisse` (
  `code_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `code_espece` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `heure` datetime(6) NOT NULL,
  PRIMARY KEY (`code_ticket`,`code_espece`,`code_vente`,`code_encaissement`,`code_user`),
  KEY `code_espece` (`code_espece`),
  KEY `code_vente` (`code_vente`),
  KEY `code_encaissement` (`code_encaissement`),
  KEY `code_user` (`code_user`),
  CONSTRAINT `ticket_caisse_ibfk_1` FOREIGN KEY (`code_espece`) REFERENCES `espece` (`code_espece`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_caisse_ibfk_2` FOREIGN KEY (`code_vente`) REFERENCES `vente` (`code_vente`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_caisse_ibfk_3` FOREIGN KEY (`code_encaissement`) REFERENCES `encaissement` (`code_encaissement`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_caisse_ibfk_4` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket_caisse
-- ----------------------------

-- ----------------------------
-- Table structure for `utilisateur`
-- ----------------------------
DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `code_user` int(11) NOT NULL AUTO_INCREMENT,
  `code_priv` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`code_user`),
  KEY `code_priv` (`code_priv`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`code_priv`) REFERENCES `privilege` (`code_priv`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of utilisateur
-- ----------------------------

-- ----------------------------
-- Table structure for `vente`
-- ----------------------------
DROP TABLE IF EXISTS `vente`;
CREATE TABLE `vente` (
  `code_vente` int(11) NOT NULL AUTO_INCREMENT,
  `code_cli` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `jour_ouvert` date NOT NULL,
  `date_vente` int(10) NOT NULL,
  `pourcentage` float NOT NULL,
  `statut` varchar(3) NOT NULL,
  PRIMARY KEY (`code_vente`,`code_cli`,`code_user`),
  KEY `code_cli` (`code_cli`),
  KEY `code_user` (`code_user`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_cli`) ON UPDATE CASCADE,
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`code_user`) REFERENCES `utilisateur` (`code_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vente
-- ----------------------------
