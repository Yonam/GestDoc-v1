/*
Navicat MySQL Data Transfer

Source Server         : JJ
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : pharma

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2017-07-22 23:21:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `annulation_vente`
-- ----------------------------
DROP TABLE IF EXISTS `annulation_vente`;
CREATE TABLE `annulation_vente` (
  `code_annulation` int(4) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `date_annulation` date NOT NULL,
  PRIMARY KEY (`code_annulation`),
  KEY `code_vente` (`code_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of annulation_vente
-- ----------------------------
INSERT INTO `annulation_vente` VALUES ('1', '4', '2017-07-13');
INSERT INTO `annulation_vente` VALUES ('2', '5', '2017-07-13');

-- ----------------------------
-- Table structure for `banque`
-- ----------------------------
DROP TABLE IF EXISTS `banque`;
CREATE TABLE `banque` (
  `code_banque` int(11) NOT NULL AUTO_INCREMENT,
  `num_banque` varchar(50) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code_banque`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banque
-- ----------------------------
INSERT INTO `banque` VALUES ('1', null, 'BOA');
INSERT INTO `banque` VALUES ('2', null, 'BTCI');
INSERT INTO `banque` VALUES ('3', null, 'ECOBANK');

-- ----------------------------
-- Table structure for `borderau`
-- ----------------------------
DROP TABLE IF EXISTS `borderau`;
CREATE TABLE `borderau` (
  `code_borderau` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `numero_borderau_coursier` int(11) NOT NULL,
  `beneficiaire` varchar(11) NOT NULL,
  PRIMARY KEY (`code_borderau`,`code_compte`),
  KEY `code_compte` (`code_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borderau
-- ----------------------------
INSERT INTO `borderau` VALUES ('1', '1', '93022526', 'ANLONSOU');
INSERT INTO `borderau` VALUES ('2', '2', '22458796', '');

-- ----------------------------
-- Table structure for `cheque`
-- ----------------------------
DROP TABLE IF EXISTS `cheque`;
CREATE TABLE `cheque` (
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

-- ----------------------------
-- Records of cheque
-- ----------------------------
INSERT INTO `cheque` VALUES ('1', '2', '1', 'ROOK', '10258978', '100000', '2017-07-12 00:00:00');

-- ----------------------------
-- Table structure for `classe`
-- ----------------------------
DROP TABLE IF EXISTS `classe`;
CREATE TABLE `classe` (
  `code_clas` int(11) NOT NULL AUTO_INCREMENT,
  `num_clas` varchar(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code_clas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classe
-- ----------------------------
INSERT INTO `classe` VALUES ('1', '1', 'A');
INSERT INTO `classe` VALUES ('2', '2', 'B');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'Mr', 'lolo', 'lolo', 'CNI', '589658', '0000-00-00', '', '258', '589588956', '25952258', '0', '0', '50000000', '15', '0', '0', '1', '2017-07-20 01:13:29');
INSERT INTO `client` VALUES ('2', 'Mme', 'hermione', 'granG', 'CNI', '5689opui', '0000-00-00', 'qq@gmail.com', 'lome togo', '25898969', '22369545', '0', '0', '5000000', '15', '10', '0', '1', '2017-07-20 01:30:15');
INSERT INTO `client` VALUES ('3', 'Mr', 'lolo', 'lolo', 'CNI', '', '0000-00-00', '', '5265moloe', '25895895', '', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:32:15');
INSERT INTO `client` VALUES ('4', 'Mr', 'lolo', 'lolo', 'CNI', '', '0000-00-00', '', '5265moloe', '25895895', '', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:33:07');
INSERT INTO `client` VALUES ('5', 'Mr', 'lolo', 'lolo', 'CNI', '', '0000-00-00', '', '2522', '252895', '', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:33:42');
INSERT INTO `client` VALUES ('6', 'Mme', 'jeanne', 'komlan', 'CNI', '259522', '0000-00-00', '', '589552', '25255', '585258', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:40:04');
INSERT INTO `client` VALUES ('7', 'Mr', 'lolo', 'lolo', 'CNI', '255', '0000-00-00', '', '235245', '255', '65652', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:41:11');
INSERT INTO `client` VALUES ('8', 'Mr', 'kioklma', 'llklk', 'CNI', '', '0000-00-00', '', '5656522', '2552', '', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:42:11');
INSERT INTO `client` VALUES ('9', 'Mr', 'komlan', 'senou', 'PP', '589ppuuuu', '0000-00-00', '', 'µ', '2255', '25855', '0', '0', '0', '15', '0', '0', '1', '2017-07-20 01:45:26');

-- ----------------------------
-- Table structure for `commerciale`
-- ----------------------------
DROP TABLE IF EXISTS `commerciale`;
CREATE TABLE `commerciale` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commerciale
-- ----------------------------
INSERT INTO `commerciale` VALUES ('1', 'KODALO', 'david', '2016-09-06', '98745896', '90124589', '', '', '100000', '0.5');
INSERT INTO `commerciale` VALUES ('2', 'DOTIGRE', 'abalo', '2017-07-11', '96458721', '93254871', '', '', '100000', '0.5');
INSERT INTO `commerciale` VALUES ('3', 'BOBAGRE', 'yamanaso', '2017-07-11', '22564896', '22365478', '', '', '200000', '0.12');
INSERT INTO `commerciale` VALUES ('4', 'jean', 'mlondres', '0000-00-00', '22251608', '525', '70 ruedes hibisvus', 'jj@fmail.com', '0', '1');
INSERT INTO `commerciale` VALUES ('5', 'Kodjo', 'lolo', '0000-00-00', '22251608', '', '70 rue des', 'jj@fmail.com', '0', '1');
INSERT INTO `commerciale` VALUES ('6', 'bertrand', 'jules', '0000-00-00', '22251608', '25952258', '70 ruedes hibisvus', 'jj@fmail.com', '0', '1');
INSERT INTO `commerciale` VALUES ('7', 'jules', 'de londre', '0000-00-00', '22588955288', '', 'lome togo', '', '0', '0.1');

-- ----------------------------
-- Table structure for `compte`
-- ----------------------------
DROP TABLE IF EXISTS `compte`;
CREATE TABLE `compte` (
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

-- ----------------------------
-- Records of compte
-- ----------------------------
INSERT INTO `compte` VALUES ('1', '1', '100000', '0', '0', '0000-00-00', '0');
INSERT INTO `compte` VALUES ('2', '2', '3000', '0', '0', '0000-00-00', '0');

-- ----------------------------
-- Table structure for `connexion`
-- ----------------------------
DROP TABLE IF EXISTS `connexion`;
CREATE TABLE `connexion` (
  `code_con` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `date_con` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` varchar(2) NOT NULL,
  PRIMARY KEY (`code_con`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of connexion
-- ----------------------------
INSERT INTO `connexion` VALUES ('1', '@anlonsou', '0', '192.168.1.20', '2017-07-17 11:16:02', '0');
INSERT INTO `connexion` VALUES ('2', '@anlons', '1', '192.168.1.21', '2017-07-17 11:16:21', '0');
INSERT INTO `connexion` VALUES ('3', '@anlonsou', '0', '192.168.1.20', '2017-07-17 11:16:36', 'C');
INSERT INTO `connexion` VALUES ('4', '@anlonsou', '0', '192.168.1.20', '2017-07-17 11:16:47', 'C');

-- ----------------------------
-- Table structure for `credit`
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit` (
  `code_credit` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_du` int(11) NOT NULL,
  PRIMARY KEY (`code_credit`,`code_encaissement`,`code_compte`),
  KEY `code_encaissement` (`code_encaissement`),
  KEY `code_compte` (`code_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credit
-- ----------------------------
INSERT INTO `credit` VALUES ('1', '1', '1', '10000');
INSERT INTO `credit` VALUES ('2', '2', '2', '3000');
INSERT INTO `credit` VALUES ('3', '1', '1', '1000');
INSERT INTO `credit` VALUES ('4', '2', '2', '10000');

-- ----------------------------
-- Table structure for `depense`
-- ----------------------------
DROP TABLE IF EXISTS `depense`;
CREATE TABLE `depense` (
  `code_depense` int(11) NOT NULL,
  `objet` varchar(100) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `commentaire` varchar(100) NOT NULL,
  `code_user` int(11) NOT NULL,
  PRIMARY KEY (`code_depense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depense
-- ----------------------------
INSERT INTO `depense` VALUES ('1', 'reparation ampoule', '15000', '2017-07-18 12:08:17', 'important', '1');
INSERT INTO `depense` VALUES ('2', 'reglement transport', '50000', '2017-07-10 00:00:00', '', '1');

-- ----------------------------
-- Table structure for `encaissement`
-- ----------------------------
DROP TABLE IF EXISTS `encaissement`;
CREATE TABLE `encaissement` (
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

-- ----------------------------
-- Records of encaissement
-- ----------------------------
INSERT INTO `encaissement` VALUES ('1', '1', '1', '1', '1', 'espece', '2017-07-13 11:34:33', '');
INSERT INTO `encaissement` VALUES ('2', '2', '2', '1', '1', 'encaissement par cheque', '2017-07-13 07:18:17', '');
INSERT INTO `encaissement` VALUES ('3', '1', '3', '1', '1', 'espece', '2017-07-13 20:00:00', '');

-- ----------------------------
-- Table structure for `entree`
-- ----------------------------
DROP TABLE IF EXISTS `entree`;
CREATE TABLE `entree` (
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

-- ----------------------------
-- Records of entree
-- ----------------------------
INSERT INTO `entree` VALUES ('3', '1', '1', '1', '1', '2017-07-13');
INSERT INTO `entree` VALUES ('4', '2', '2', '2', '2', '2017-07-13');

-- ----------------------------
-- Table structure for `espece`
-- ----------------------------
DROP TABLE IF EXISTS `espece`;
CREATE TABLE `espece` (
  `code_espece` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `montant_remi` int(11) NOT NULL,
  `montant_regle` int(11) NOT NULL,
  `relicat` int(11) NOT NULL,
  PRIMARY KEY (`code_espece`,`code_encaissement`),
  KEY `code_encaissement` (`code_encaissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of espece
-- ----------------------------
INSERT INTO `espece` VALUES ('1', '2', '10000', '10000', '0');
INSERT INTO `espece` VALUES ('2', '3', '5000', '5000', '0');

-- ----------------------------
-- Table structure for `exploitant`
-- ----------------------------
DROP TABLE IF EXISTS `exploitant`;
CREATE TABLE `exploitant` (
  `code_exploitant` int(11) NOT NULL AUTO_INCREMENT,
  `num_exploitant` varchar(10) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`code_exploitant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exploitant
-- ----------------------------
INSERT INTO `exploitant` VALUES ('1', '01TP', 'Tools production');
INSERT INTO `exploitant` VALUES ('2', '02MP', 'Mobit production');

-- ----------------------------
-- Table structure for `facture`
-- ----------------------------
DROP TABLE IF EXISTS `facture`;
CREATE TABLE `facture` (
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

-- ----------------------------
-- Records of facture
-- ----------------------------
INSERT INTO `facture` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `facture` VALUES ('2', '2', '2', '2', '2', '1');

-- ----------------------------
-- Table structure for `facture_regularisation`
-- ----------------------------
DROP TABLE IF EXISTS `facture_regularisation`;
CREATE TABLE `facture_regularisation` (
  `code_facture` int(11) NOT NULL,
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  PRIMARY KEY (`code_facture`,`code_regularisation`,`code_cli`),
  KEY `code_cli` (`code_cli`),
  KEY `code_regularisation` (`code_regularisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facture_regularisation
-- ----------------------------
INSERT INTO `facture_regularisation` VALUES ('1', '1', '1');
INSERT INTO `facture_regularisation` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for `famille`
-- ----------------------------
DROP TABLE IF EXISTS `famille`;
CREATE TABLE `famille` (
  `code_famille` int(10) NOT NULL AUTO_INCREMENT,
  `num_famille` varchar(255) DEFAULT NULL,
  `nom_famille` varchar(255) NOT NULL,
  PRIMARY KEY (`code_famille`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of famille
-- ----------------------------
INSERT INTO `famille` VALUES ('1', null, 'produit cosmetique');
INSERT INTO `famille` VALUES ('2', null, 'nourisson');

-- ----------------------------
-- Table structure for `forme`
-- ----------------------------
DROP TABLE IF EXISTS `forme`;
CREATE TABLE `forme` (
  `code_forme` int(11) NOT NULL AUTO_INCREMENT,
  `nom_forme` varchar(255) NOT NULL,
  `num_forme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_forme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forme
-- ----------------------------
INSERT INTO `forme` VALUES ('1', 'gelule', 'pas necessaire');
INSERT INTO `forme` VALUES ('2', 'serum', 'pas important');

-- ----------------------------
-- Table structure for `fournisseur`
-- ----------------------------
DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE `fournisseur` (
  `code_fournisseur` int(10) NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `tel_urg` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adresse` varchar(50) NOT NULL,
  `solde_compte` int(11) NOT NULL,
  PRIMARY KEY (`code_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fournisseur
-- ----------------------------
INSERT INTO `fournisseur` VALUES ('1', 'ROOK IT ASSOCIATE', '', '90894549', null, 'rooktimail@gmail.com', 'agoe kleve super', '0');
INSERT INTO `fournisseur` VALUES ('2', 'Euck IT ', '', '93231033', null, 'eugenienantis@gmail.com', 'agoe telessou', '0');
INSERT INTO `fournisseur` VALUES ('3', 'ETS OLA', 'OLA', '22251608', '585258', 'jj@fmail.com', 'lome togo', '0');
INSERT INTO `fournisseur` VALUES ('4', 'ETS HH', 'Hubert', '22369845', '56892582', 'OO@GMAIL.COÂ§M', 'lome togo', '0');

-- ----------------------------
-- Table structure for `historique_client`
-- ----------------------------
DROP TABLE IF EXISTS `historique_client`;
CREATE TABLE `historique_client` (
  `code_historique` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `total_du` int(11) NOT NULL,
  `montant_paye` int(11) NOT NULL,
  `solde_restant` int(11) NOT NULL,
  `date_regularisation` datetime NOT NULL,
  PRIMARY KEY (`code_historique`,`code_cli`),
  KEY `code_cli` (`code_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of historique_client
-- ----------------------------
INSERT INTO `historique_client` VALUES ('1', '1', '11000', '1000', '10000', '2017-07-13 00:00:00');
INSERT INTO `historique_client` VALUES ('2', '2', '6000', '6000', '0', '2017-07-13 00:00:00');

-- ----------------------------
-- Table structure for `historique_modif`
-- ----------------------------
DROP TABLE IF EXISTS `historique_modif`;
CREATE TABLE `historique_modif` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journee
-- ----------------------------
INSERT INTO `journee` VALUES ('1', '2', '2017-07-11', '2017-07-11 07:18:25', '2017-07-11 22:40:44', '2017-07-11 22:44:21', '1', '150000', '150000', '0', '0');
INSERT INTO `journee` VALUES ('2', '2', '2017-07-12', '2017-07-12 07:00:00', '2017-07-12 22:32:38', '2017-07-12 22:40:18', '1', '180000', null, null, null);
INSERT INTO `journee` VALUES ('4', '1', '2017-07-13', '2017-07-22 19:43:01', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `laboratoire`
-- ----------------------------
DROP TABLE IF EXISTS `laboratoire`;
CREATE TABLE `laboratoire` (
  `code_lab` int(10) NOT NULL AUTO_INCREMENT,
  `numero_labo` varchar(10) DEFAULT NULL,
  `nom_laboratoire` varchar(255) NOT NULL,
  PRIMARY KEY (`code_lab`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laboratoire
-- ----------------------------
INSERT INTO `laboratoire` VALUES ('1', '001P', 'BIOPHARMA');
INSERT INTO `laboratoire` VALUES ('2', '002A', 'pharmapur');

-- ----------------------------
-- Table structure for `localisation`
-- ----------------------------
DROP TABLE IF EXISTS `localisation`;
CREATE TABLE `localisation` (
  `code_localisation` int(11) NOT NULL AUTO_INCREMENT,
  `num_localisation` varchar(50) DEFAULT NULL,
  `nom_localisation` varchar(50) NOT NULL,
  PRIMARY KEY (`code_localisation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of localisation
-- ----------------------------
INSERT INTO `localisation` VALUES ('1', null, 'rayons1, etage6');
INSERT INTO `localisation` VALUES ('2', null, 'raynon1,etgage2');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
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

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('3', '1', 'anlonsou2017', '2017-07-13 09:00:00', 'initialisation de vente', null);
INSERT INTO `logs` VALUES ('4', '2', 'kodjo2017', '2017-07-13 14:00:00', 'ouverture du journee', null);

-- ----------------------------
-- Table structure for `mode_paiement`
-- ----------------------------
DROP TABLE IF EXISTS `mode_paiement`;
CREATE TABLE `mode_paiement` (
  `code_paiement` int(11) NOT NULL,
  `description` varchar(11) NOT NULL,
  PRIMARY KEY (`code_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mode_paiement
-- ----------------------------
INSERT INTO `mode_paiement` VALUES ('1', 'ESPECE');
INSERT INTO `mode_paiement` VALUES ('2', 'CHEQUE');

-- ----------------------------
-- Table structure for `motif`
-- ----------------------------
DROP TABLE IF EXISTS `motif`;
CREATE TABLE `motif` (
  `code_motif` int(10) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`code_motif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of motif
-- ----------------------------
INSERT INTO `motif` VALUES ('1', 'perime depuis 3mois');
INSERT INTO `motif` VALUES ('2', 'exposition sur les etrageres');
INSERT INTO `motif` VALUES ('3', 'ils en approche de leurs date de premption');

-- ----------------------------
-- Table structure for `mouvement`
-- ----------------------------
DROP TABLE IF EXISTS `mouvement`;
CREATE TABLE `mouvement` (
  `code_mouvement` int(10) NOT NULL AUTO_INCREMENT,
  `code_vente` int(10) DEFAULT NULL,
  `code_sortie` int(10) DEFAULT NULL,
  `code_entree` int(10) DEFAULT NULL,
  `libelle` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`code_mouvement`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mouvement
-- ----------------------------
INSERT INTO `mouvement` VALUES ('3', '2', null, null, 'PRODUUT  euck IT', '2017-07-12 00:00:00');
INSERT INTO `mouvement` VALUES ('4', '4', null, null, 'PRODUUT  euck IT', '2017-07-12 00:00:00');
INSERT INTO `mouvement` VALUES ('5', null, null, '1', 'PRODUUT  euck IT', '2017-07-12 00:00:00');
INSERT INTO `mouvement` VALUES ('6', null, null, '2', 'PRODUUT  euck IT', '2017-07-12 00:00:00');
INSERT INTO `mouvement` VALUES ('7', null, '1', null, 'PRODUUT  euck IT', '2017-07-12 00:00:00');
INSERT INTO `mouvement` VALUES ('8', null, '2', null, 'PRODUUT  euck IT', '2017-07-12 00:00:00');

-- ----------------------------
-- Table structure for `mouvement_log`
-- ----------------------------
DROP TABLE IF EXISTS `mouvement_log`;
CREATE TABLE `mouvement_log` (
  `code_mouvement` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `code_log` int(11) NOT NULL,
  PRIMARY KEY (`code_mouvement`,`code_log`,`code_user`),
  UNIQUE KEY `code_mouvement` (`code_mouvement`),
  UNIQUE KEY `code_user` (`code_user`),
  UNIQUE KEY `code_log` (`code_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mouvement_log
-- ----------------------------
INSERT INTO `mouvement_log` VALUES ('1', '1', '3');
INSERT INTO `mouvement_log` VALUES ('2', '2', '4');

-- ----------------------------
-- Table structure for `panier`
-- ----------------------------
DROP TABLE IF EXISTS `panier`;
CREATE TABLE `panier` (
  `code_panier` int(4) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `nb_vendu` int(3) NOT NULL,
  `prix_vente` float NOT NULL,
  PRIMARY KEY (`code_panier`),
  KEY `code_vente` (`code_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of panier
-- ----------------------------
INSERT INTO `panier` VALUES ('1', '1', 'panadol', '2', '5000');
INSERT INTO `panier` VALUES ('2', '1', 'apramol', '2', '6000');
INSERT INTO `panier` VALUES ('3', '2', 'apramol', '10', '6000');

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `code_priv` int(11) NOT NULL AUTO_INCREMENT,
  `denomination` varchar(20) NOT NULL,
  PRIMARY KEY (`code_priv`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', 'Administrateur');
INSERT INTO `privilege` VALUES ('2', 'Comptoir');
INSERT INTO `privilege` VALUES ('3', 'Caisse');

-- ----------------------------
-- Table structure for `produit`
-- ----------------------------
DROP TABLE IF EXISTS `produit`;
CREATE TABLE `produit` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit
-- ----------------------------
INSERT INTO `produit` VALUES ('1', '121', '0', '1', '1', '1', '1', '1', '1', '1', 'panadol', 'apramol', '1', '2017-07-12', 'D:\\priv\\euck\\IMG-20170612-WA0027.jpg', '2017-07-13', '2017-07-13', '2017-08-31', '1', '3000', '5000', '0.18', '5', '0.5');
INSERT INTO `produit` VALUES ('2', '125', '0', '2', '2', '2', '2', '2', '2', '2', 'beclav500', 'IBEX', '1', '2017-07-20', 'IMG-20170612-WA0029.jpg', '2017-07-13', '2017-07-13', '2017-09-28', '1', '4000', '6000', '0.18', '5', '0.5');
INSERT INTO `produit` VALUES ('3', '1256', '0', '2', '2', '2', '2', '2', '2', '2', 'beclav600', 'IBEX6', '1', '2017-07-20', 'IMG-20170612-WA0029.jpg', '2017-07-13', '2017-07-13', '2017-09-28', '1', '4000', '6000', '0.18', '5', '0.5');
INSERT INTO `produit` VALUES ('4', '569', '0', '1', '1', '1', '1', '1', '1', '1', 'cac1000', 'vitcsandoz', '1', '2017-07-12', 'D:\\priv\\euck\\IMG-20170612-WA0027.jpg', '2017-07-13', '2017-07-13', '2017-08-31', '1', '3000', '5000', '0.18', '5', '0.5');
INSERT INTO `produit` VALUES ('5', '253', '0', '1', '1', '2', '1', '2', '1', '1', 'paracetamol', 'para01', '1', '2017-07-12', 'D:\\priv\\euck\\IMG-20170612-WA0027.jpg', '2017-07-13', '2017-07-13', '2017-08-31', '1', '5000', '8000', '0.18', '5', '0.5');

-- ----------------------------
-- Table structure for `produit_entrant`
-- ----------------------------
DROP TABLE IF EXISTS `produit_entrant`;
CREATE TABLE `produit_entrant` (
  `code_transaction_entree` int(11) NOT NULL,
  `code_entree` int(11) NOT NULL,
  `code_produit` int(11) NOT NULL,
  `nombre_entree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit_entrant
-- ----------------------------
INSERT INTO `produit_entrant` VALUES ('1', '3', '1', '50');
INSERT INTO `produit_entrant` VALUES ('2', '4', '2', '80');

-- ----------------------------
-- Table structure for `produit_sortie`
-- ----------------------------
DROP TABLE IF EXISTS `produit_sortie`;
CREATE TABLE `produit_sortie` (
  `code_transaction_sortie` int(11) NOT NULL,
  `code_sortie` int(11) NOT NULL,
  `code_produit` int(10) NOT NULL,
  `nombre_sortie` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit_sortie
-- ----------------------------
INSERT INTO `produit_sortie` VALUES ('1', '1', '1', '10');
INSERT INTO `produit_sortie` VALUES ('2', '2', '2', '30');

-- ----------------------------
-- Table structure for `produit_vendu`
-- ----------------------------
DROP TABLE IF EXISTS `produit_vendu`;
CREATE TABLE `produit_vendu` (
  `code_produit` int(10) NOT NULL,
  `code_vente` int(10) NOT NULL,
  `nb_vendu` float NOT NULL,
  `total_vendu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produit_vendu
-- ----------------------------
INSERT INTO `produit_vendu` VALUES ('1', '1', '20', '100000');
INSERT INTO `produit_vendu` VALUES ('2', '2', '10', '60000');

-- ----------------------------
-- Table structure for `regularisation`
-- ----------------------------
DROP TABLE IF EXISTS `regularisation`;
CREATE TABLE `regularisation` (
  `code_regularisation` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_compte` int(11) NOT NULL,
  `montant_regularisation` int(11) NOT NULL,
  `date_regularisation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regularisation
-- ----------------------------
INSERT INTO `regularisation` VALUES ('1', '1', '1', '1000', '2017-07-13 09:28:28');
INSERT INTO `regularisation` VALUES ('2', '2', '2', '3000', '2017-07-13 15:39:00');

-- ----------------------------
-- Table structure for `societe`
-- ----------------------------
DROP TABLE IF EXISTS `societe`;
CREATE TABLE `societe` (
  `code_societe` int(11) NOT NULL,
  `raison_social` varchar(255) DEFAULT NULL,
  `tel1` varchar(255) DEFAULT NULL,
  `tel2` varchar(255) DEFAULT NULL,
  `bp` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `situation_geo` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of societe
-- ----------------------------

-- ----------------------------
-- Table structure for `sortie`
-- ----------------------------
DROP TABLE IF EXISTS `sortie`;
CREATE TABLE `sortie` (
  `code_sortie` int(10) NOT NULL,
  `code_motif` int(10) NOT NULL,
  `code_user` int(10) NOT NULL,
  `date_sortie` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sortie
-- ----------------------------
INSERT INTO `sortie` VALUES ('1', '1', '2', '2017-07-10 08:21:26');
INSERT INTO `sortie` VALUES ('2', '1', '2', '2017-07-12 13:31:29');

-- ----------------------------
-- Table structure for `specialite`
-- ----------------------------
DROP TABLE IF EXISTS `specialite`;
CREATE TABLE `specialite` (
  `code_specialite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_specialite` varchar(255) NOT NULL,
  `num_specialite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specialite
-- ----------------------------
INSERT INTO `specialite` VALUES ('1', 'douleur et fievre', 'bonne');
INSERT INTO `specialite` VALUES ('2', 'paludisme', 'bonne');

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `code_stock` int(10) NOT NULL,
  `code_produit` int(10) NOT NULL,
  `qte_stock` int(7) NOT NULL,
  `qte_achat` float NOT NULL,
  `qte_gratuit` float NOT NULL,
  `date_maj` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', '1', '100', '50', '10', '2017-07-11 00:00:00');
INSERT INTO `stock` VALUES ('2', '2', '60', '80', '20', '2017-07-13 00:00:00');
INSERT INTO `stock` VALUES ('3', '3', '100', '50', '10', '2017-07-11 00:00:00');
INSERT INTO `stock` VALUES ('4', '4', '100', '50', '10', '2017-07-11 00:00:00');
INSERT INTO `stock` VALUES ('5', '5', '0', '0', '0', '2017-07-11 00:00:00');

-- ----------------------------
-- Table structure for `ticket_caisse`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_caisse`;
CREATE TABLE `ticket_caisse` (
  `code_ticket` int(11) NOT NULL,
  `code_espece` int(11) NOT NULL,
  `code_vente` int(11) NOT NULL,
  `code_encaissement` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `heure` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket_caisse
-- ----------------------------
INSERT INTO `ticket_caisse` VALUES ('3', '1', '1', '1', '1', '2017-07-13 11:28:32');
INSERT INTO `ticket_caisse` VALUES ('4', '2', '3', '3', '1', '2017-07-13 13:19:00');

-- ----------------------------
-- Table structure for `utilisateur`
-- ----------------------------
DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `code_user` int(11) NOT NULL AUTO_INCREMENT,
  `code_priv` int(11) NOT NULL,
  `nom_u` varchar(50) NOT NULL,
  `prenom_u` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `date_enregistrement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of utilisateur
-- ----------------------------
INSERT INTO `utilisateur` VALUES ('1', '1', 'ANLONSOU', 'kossiwa', '@anlonsou', 'kossiwa2017', '0', '2017-07-20 11:18:12');
INSERT INTO `utilisateur` VALUES ('2', '2', 'KONOR', 'kodjo', '@konor', 'kodjo2017', '1', '2017-07-13 11:46:29');

-- ----------------------------
-- Table structure for `vente`
-- ----------------------------
DROP TABLE IF EXISTS `vente`;
CREATE TABLE `vente` (
  `code_vente` int(11) NOT NULL,
  `code_cli` int(11) NOT NULL,
  `code_user` int(11) NOT NULL,
  `jour_ouvert` date NOT NULL,
  `date_vente` date NOT NULL,
  `pourcentage` float NOT NULL,
  `statut` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vente
-- ----------------------------
INSERT INTO `vente` VALUES ('1', '1', '1', '2017-07-13', '2017-07-13', '0.5', '');
INSERT INTO `vente` VALUES ('2', '2', '1', '2017-07-11', '2017-07-11', '0.5', '');
INSERT INTO `vente` VALUES ('3', '1', '1', '2017-07-13', '2017-07-13', '0.5', '');
INSERT INTO `vente` VALUES ('4', '1', '1', '2017-07-13', '2017-07-13', '0.12', '');
INSERT INTO `vente` VALUES ('5', '1', '1', '2017-07-11', '2017-07-11', '0.12', '');
