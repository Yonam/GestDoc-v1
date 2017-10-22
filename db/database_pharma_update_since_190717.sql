------ Modification base après le script du 19/07/2017 à 23:26

ALTER TABLE `client` CHANGE `tel1` `tel1` VARCHAR( 30 ) NOT NULL ,
CHANGE `tel2` `tel2` VARCHAR( 30 ) NULL DEFAULT NULL ;

-----------------------------------------------------
ALTER TABLE `client` CHANGE `code_cli` `code_cli` INT(10) NOT NULL AUTO_INCREMENT, CHANGE `titre` `titre` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `Nom_cli` `Nom_cli` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `prenom_cli` `prenom_cli` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `type_piece` `type_piece` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `num_piece` `num_piece` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `date_piece` `date_piece` DATE NULL DEFAULT NULL, CHANGE `Email` `Email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `adresse` `adresse` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `tel1` `tel1` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `tel2` `tel2` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `statut` `statut` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `total_du` `total_du` INT(10) NOT NULL, CHANGE `credit_maximum` `credit_maximum` INT(11) NULL DEFAULT NULL, CHANGE `nbr_jr_avant_paie` `nbr_jr_avant_paie` INT(2) NULL DEFAULT NULL, CHANGE `remise` `remise` INT(4) NULL DEFAULT NULL, CHANGE `droit_au_credit` `droit_au_credit` TINYINT(1) NULL DEFAULT NULL, CHANGE `depassement` `depassement` INT(4) NULL DEFAULT NULL, CHANGE `date_creation` `date_creation` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

--------------------------------------------------------------

ALTER TABLE `produit` CHANGE `code_produit` `code_produit` INT(10) NOT NULL, CHANGE `code_cip` `code_cip` INT(20) NOT NULL, CHANGE `code_barre` `code_barre` INT(20) NULL, CHANGE `code_interne` `code_interne` INT(20) NULL, CHANGE `code_lab` `code_lab` INT(10) NOT NULL, CHANGE `code_clas` `code_clas` INT(11) NOT NULL, CHANGE `code_localisation` `code_localisation` INT(11) NOT NULL, CHANGE `code_exploitant` `code_exploitant` INT(11) NOT NULL, CHANGE `code_specialite` `code_specialite` INT(11) NOT NULL, CHANGE `code_forme` `code_forme` INT(11) NOT NULL, CHANGE `designation` `designation` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `dci` `dci` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `Soumis_tva` `Soumis_tva` TINYINT(1) NOT NULL, CHANGE `date_commercialisation` `date_commercialisation` DATE NOT NULL, CHANGE `photo` `photo` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, CHANGE `date_enregistrement` `date_enregistrement` DATE NOT NULL, CHANGE `date_mj` `date_mj` DATE NOT NULL, CHANGE `date_peremption` `date_peremption` DATE NOT NULL, CHANGE `statut` `statut` TINYINT(1) NOT NULL, CHANGE `prix_achat` `prix_achat` FLOAT NOT NULL, CHANGE `prix_vente` `prix_vente` FLOAT NOT NULL, CHANGE `taux_tva` `taux_tva` FLOAT NOT NULL, CHANGE `multiplicateur` `multiplicateur` INT(2) NULL, CHANGE `reduction` `reduction` FLOAT NULL DEFAULT NULL;

--------------------------------------------------------------------
ALTER TABLE `produit` ADD PRIMARY KEY ( `code_produit` ) ;
--------------------------------------------------------------
ALTER TABLE `produit` CHANGE `code_produit` `code_produit` INT( 10 ) NOT NULL AUTO_INCREMENT ;
-----------------------------------------------------------------------
ALTER TABLE `commerciale` ADD `adresse` VARCHAR( 255 ) NOT NULL AFTER `tel_urg` ,
ADD `email` VARCHAR( 255 ) NOT NULL AFTER `adresse` ;
------------------------------------------------------------

