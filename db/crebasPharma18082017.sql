/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/08/2017 15:39:34                          */
/*==============================================================*/


drop table if exists ANNULATION_VENTE;

drop table if exists BANQUE;

drop table if exists BORDEREAU;

drop table if exists CLASSE_PRODUIT;

drop table if exists CLIENT;

drop table if exists COMMERCIALE;

drop table if exists COMPTE_PRODUIT_;

drop table if exists CONNEXION;

drop table if exists CONTRAT_SOUSCRIPTEUR;

drop table if exists DEFINIR_POURCENTAGE;

drop table if exists DEPENSE;

drop table if exists ENCAISSEMENT;

drop table if exists ENTREE;

drop table if exists EXPLOITANT;

drop table if exists FAMILLE_PRODUIT;

drop table if exists FORME;

drop table if exists FOURNISSEUR;

drop table if exists HISTORIQUE_MODIF;

drop table if exists JOURNEE;

drop table if exists LABORATOIRE;

drop table if exists LOCALISATION;

drop table if exists LOGS;

drop table if exists MODE_PAYEMENT;

drop table if exists MOTIF;

drop table if exists MOUVEMENT;

drop table if exists OPERATIONCOMPTE;

drop table if exists PRIVILEGES;

drop table if exists PRODUIT;

drop table if exists PRODUIT_ENTREE_FOURNISSEUR;

drop table if exists PRODUIT_SORTIE;

drop table if exists PRODUIT_VENDU;

drop table if exists SOCIETE;

drop table if exists SORTIE;

drop table if exists SOUSCRIPTEUR;

drop table if exists SPECIALITE;

drop table if exists TRAVAILLER;

drop table if exists UTILISATEUR;

drop table if exists VENTE;

/*==============================================================*/
/* Table: ANNULATION_VENTE                                      */
/*==============================================================*/
create table ANNULATION_VENTE
(
   CODE_ANNULATION      int(4) not null auto_increment,
   CODE_VENTE           int not null,
   DATE_ANNULATION      date,
   primary key (CODE_ANNULATION)
);

/*==============================================================*/
/* Table: BANQUE                                                */
/*==============================================================*/
create table BANQUE
(
   CODE_BANQUE          int not null auto_increment,
   NUM_BANQUE           text,
   DESCRIPTION          text,
   primary key (CODE_BANQUE)
);

/*==============================================================*/
/* Table: BORDEREAU                                             */
/*==============================================================*/
create table BORDEREAU
(
   CODE_BORDEREAU       int not null auto_increment,
   NUMERO_BORDEREAU_COURSIER text,
   BENEFICIAIRE         text,
   primary key (CODE_BORDEREAU)
);

/*==============================================================*/
/* Table: CLASSE_PRODUIT                                        */
/*==============================================================*/
create table CLASSE_PRODUIT
(
   CODE_CLASSE          int not null auto_increment,
   NUM_CLASS            text,
   DESCRIPTION          text,
   primary key (CODE_CLASSE)
);

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT
(
   CODE_CLI             int not null auto_increment,
   CODE_COM             int not null,
   TITRE                text,
   NOM_CLI              text,
   PRENOM_CLI           text,
   TYPE_PIECE           text,
   NUM_PIECE            text,
   DATE_PIECE           date,
   EMAIL                text,
   ADRESSE              text,
   TEL1                 text,
   TEL2                 text,
   STATUT               bool,
   TOTAL_DU             float(8,2),
   CREDIT_MAX           float(8,2),
   DELAI_PAIEMENT       int,
   REMISE               float,
   DROIT_CREDIT         bool,
   DEPASSEMENT          float,
   DATE_CREATION        datetime,
   primary key (CODE_CLI)
);

/*==============================================================*/
/* Table: COMMERCIALE                                           */
/*==============================================================*/
create table COMMERCIALE
(
   CODE_COM             int(10) not null auto_increment,
   NOM_COM              text,
   PRENOM_COM           text,
   DATE_EMB             date,
   TEL_COM              text,
   TEL_URG              text,
   ADRESSE              text,
   EMAIL                text,
   CHIFFRE              int,
   POURCENTAGE          float,
   primary key (CODE_COM)
);

/*==============================================================*/
/* Table: COMPTE_PRODUIT_                                       */
/*==============================================================*/
create table COMPTE_PRODUIT_
(
   CODE_C_FOURNISSEUR   int(11) not null auto_increment,
   CODE_FOURNISSEUR     int not null,
   CODE_USER            int not null,
   DATE_MAJ_COMPTE      date,
   MONTANT_MAJ_COMPTE   int,
   primary key (CODE_C_FOURNISSEUR)
);

/*==============================================================*/
/* Table: CONNEXION                                             */
/*==============================================================*/
create table CONNEXION
(
   CODE_CONNEXION       int not null auto_increment,
   LOGIN                text,
   STATUT               bool,
   IP                   text,
   DATE_CONNEXION       datetime,
   ACTION               text,
   primary key (CODE_CONNEXION)
);

/*==============================================================*/
/* Table: CONTRAT_SOUSCRIPTEUR                                  */
/*==============================================================*/
create table CONTRAT_SOUSCRIPTEUR
(
   ID_CONTRAT           int(11) not null auto_increment,
   CODE_SOUSCRIPTEUR    int not null,
   NOM_CONTRACTANT      text,
   PRENOM_CONTRACTANT   text,
   NUM_CONTRAT          text,
   ECHEANCIER           int,
   DATE_DEBUT           date,
   DATE_FIN             date,
   primary key (ID_CONTRAT)
);

/*==============================================================*/
/* Table: DEFINIR_POURCENTAGE                                   */
/*==============================================================*/
create table DEFINIR_POURCENTAGE
(
   CODE_FAMILLE         int not null,
   CODE_SOUSCRIPTEUR    int not null,
   POURCENTAGE_PAYE     float,
   primary key (CODE_FAMILLE, CODE_SOUSCRIPTEUR)
);

/*==============================================================*/
/* Table: DEPENSE                                               */
/*==============================================================*/
create table DEPENSE
(
   CODE_DEPENSE         int not null auto_increment,
   CODE_USER            int not null,
   OBJET                text,
   MONTANT              int,
   DATE                 date,
   COMMENTAIRE          text,
   primary key (CODE_DEPENSE)
);

/*==============================================================*/
/* Table: ENCAISSEMENT                                          */
/*==============================================================*/
create table ENCAISSEMENT
(
   CODE_ENCAISSEMENT    int not null auto_increment,
   CODE_JOURNEE         int not null,
   CODE_PAIEMENT        int not null,
   CODE_VENTE           int not null,
   CODE_USER            int not null,
   TYPE                 text,
   DATE_ENCAISSEMENT    datetime,
   STATUT               bool,
   primary key (CODE_ENCAISSEMENT)
);

/*==============================================================*/
/* Table: ENTREE                                                */
/*==============================================================*/
create table ENTREE
(
   CODE_ENTREE          int(10) not null auto_increment,
   CODE_USER            int not null,
   DATE_ENTREE          date,
   NUMERO_FACTURE       text,
   NUMERO_BORDEREAU     text,
   primary key (CODE_ENTREE)
);

/*==============================================================*/
/* Table: EXPLOITANT                                            */
/*==============================================================*/
create table EXPLOITANT
(
   CODE_EXPLOITANT      int(11) not null auto_increment,
   NUM_EXPLOITANT       text,
   LIBELLE              text,
   primary key (CODE_EXPLOITANT)
);

/*==============================================================*/
/* Table: FAMILLE_PRODUIT                                       */
/*==============================================================*/
create table FAMILLE_PRODUIT
(
   CODE_FAMILLE         int(10) not null auto_increment,
   NUM_FAMILLE          text,
   NOM_FAMILLE          text,
   primary key (CODE_FAMILLE)
);

/*==============================================================*/
/* Table: FORME                                                 */
/*==============================================================*/
create table FORME
(
   CODE_FORME           int(11) not null auto_increment,
   NOM_FORME            text,
   NUM_FORME            text,
   primary key (CODE_FORME)
);

/*==============================================================*/
/* Table: FOURNISSEUR                                           */
/*==============================================================*/
create table FOURNISSEUR
(
   CODE_FOURNISSEUR     int(11) not null auto_increment,
   RAISON_SOCIAL        text,
   CONCTACT             text,
   TEL                  text,
   TEL_URG              text,
   EMAIL                text,
   ADRESSE              text,
   SOLDE_COMPTE         int,
   primary key (CODE_FOURNISSEUR)
);

/*==============================================================*/
/* Table: HISTORIQUE_MODIF                                      */
/*==============================================================*/
create table HISTORIQUE_MODIF
(
   CODE_HISTORIQUE      int not null auto_increment,
   CODE_VENTE           int not null,
   ANCIEN               int,
   QTEANCAV             float,
   QTEANCAP             float,
   NOUVEAU              float,
   QTENOUVAV            float,
   QTENOUVAP            float,
   DATE_OPERATION       datetime,
   LOGIN                text,
   primary key (CODE_HISTORIQUE)
);

/*==============================================================*/
/* Table: JOURNEE                                               */
/*==============================================================*/
create table JOURNEE
(
   CODE_JOURNEE         int not null auto_increment,
   CODE_USER_OUVRIR     int not null,
   CODE_USER_FERMER     int,
   CODE_USER_CLOTURER   int,
   DATE                 date,
   DATE_OUVERTURE       datetime,
   DATE_FERMETURE       datetime,
   DATE_CLOTURE         datetime,
   STATUT               bool,
   MONTANT_FERMETURE    float(8,2),
   MONTANT_CLOTURE      float(8,2),
   MONTANT_MANQUANT     float(8,2),
   MONTANT_SURPLUS      float(8,2),
   primary key (CODE_JOURNEE)
);

/*==============================================================*/
/* Table: LABORATOIRE                                           */
/*==============================================================*/
create table LABORATOIRE
(
   CODE_LAB             int(10) not null auto_increment,
   NUMERO_LAB           text,
   NOM_LABORATOIRE      text,
   primary key (CODE_LAB)
);

/*==============================================================*/
/* Table: LOCALISATION                                          */
/*==============================================================*/
create table LOCALISATION
(
   CODE_LOCALISATION    int(11) not null auto_increment,
   NUM_LOCALISATION     text,
   NOM_LOCALISATION     text,
   primary key (CODE_LOCALISATION)
);

/*==============================================================*/
/* Table: LOGS                                                  */
/*==============================================================*/
create table LOGS
(
   CODE_LOG             int not null auto_increment,
   CODE_USER            int not null,
   LOGIN                text,
   HEURE                datetime,
   EVENEMENT            text,
   STATUT               bool,
   primary key (CODE_LOG)
);

/*==============================================================*/
/* Table: MODE_PAYEMENT                                         */
/*==============================================================*/
create table MODE_PAYEMENT
(
   CODE_PAIEMENT        int not null auto_increment,
   CODE_BANQUE          int,
   CODE_SOUSCRIPTEUR    int,
   DESCRIPTION          text,
   NUM_CHEQUE           int,
   MONTANT              int,
   MONTANT_PAYE_        int,
   MONTANT_RESTE        int,
   DATE_CHEQUE          date,
   primary key (CODE_PAIEMENT)
);

/*==============================================================*/
/* Table: MOTIF                                                 */
/*==============================================================*/
create table MOTIF
(
   CODE_MOTIF           int not null auto_increment,
   DESCRIPTION          text,
   primary key (CODE_MOTIF)
);

/*==============================================================*/
/* Table: MOUVEMENT                                             */
/*==============================================================*/
create table MOUVEMENT
(
   CODE_MOUVEMENT       int(10) not null auto_increment,
   CODE_SORTIE          int,
   CODE_ENTREE          int,
   CODE_VENTE           int,
   LIBELLE              text,
   DATE                 date,
   primary key (CODE_MOUVEMENT)
);

/*==============================================================*/
/* Table: OPERATIONCOMPTE                                       */
/*==============================================================*/
create table OPERATIONCOMPTE
(
   CODE_COMPTE          int not null auto_increment,
   CODE_CLI             int not null,
   SOLDE                float(8,2),
   MONTANT_VERSE        float(8,2),
   RESTE                float(8,2),
   DATE                 date,
   primary key (CODE_COMPTE)
);

/*==============================================================*/
/* Table: PRIVILEGES                                            */
/*==============================================================*/
create table PRIVILEGES
(
   CODE_PRIVILEGE       int not null auto_increment,
   DESIGNATION          text,
   LEVEL                int,
   primary key (CODE_PRIVILEGE)
);

/*==============================================================*/
/* Table: PRODUIT                                               */
/*==============================================================*/
create table PRODUIT
(
   CODE_PRODUIT         int not null auto_increment,
   CODE_FAMILLE         int not null,
   CODE_FORME           int not null,
   CODE_CLASSE          int,
   CODE_EXPLOITANT      int not null,
   PRO_CODE_PRODUIT     int,
   CODE_LOCALISATION    int not null,
   CODE_SPECIALITE      int not null,
   CODE_LAB             int not null,
   DESIGNATION          text,
   DCI                  text,
   SOUMIS_TVA           bool,
   TAUX_TVA             float,
   DATE_COMMERCIALISATION date,
   PHOTO                text,
   DATE_ENREGISTREMENT  datetime,
   DATE_MJ              date,
   DATE_PEREMPTION      date,
   QTE_STOCK            int,
   PRIX_VENTE           float,
   PRIX_PRODUIT           float,
   CIP                  varchar(40),
   CODE_BARRE           int,
   primary key (CODE_PRODUIT)
);

/*==============================================================*/
/* Table: PRODUIT_ENTREE_FOURNISSEUR                            */
/*==============================================================*/
create table PRODUIT_ENTREE_FOURNISSEUR
(
   CODE_PRODUIT         int not null,
   CODE_ENTREE          int not null,
   CODE_FOURNISSEUR     int not null,
   NOMBRE_ENTREE        int,
   QTE_ACHAT            int,
   QTE_GRATUIT          int,
   DATE_MAJ             date,
   MONTANT_DU           int,
   ACHAT_CREDIT         bool,
   DATE_PEREMPTION      date,
   primary key (CODE_PRODUIT, CODE_ENTREE, CODE_FOURNISSEUR)
);

/*==============================================================*/
/* Table: PRODUIT_SORTIE                                        */
/*==============================================================*/
create table PRODUIT_SORTIE
(
   CODE_SORTIE          int not null,
   CODE_PRODUIT         int not null,
   QTE_SORTIE           int,
   DATE_SORTIE          date,
   primary key (CODE_SORTIE, CODE_PRODUIT)
);

/*==============================================================*/
/* Table: PRODUIT_VENDU                                         */
/*==============================================================*/
create table PRODUIT_VENDU
(
   CODE_PRODUIT         int not null,
   CODE_VENTE           int not null,
   NB_VENDU             int,
   MONTANT_VENTE        float,
   primary key (CODE_PRODUIT, CODE_VENTE)
);

/*==============================================================*/
/* Table: SOCIETE                                               */
/*==============================================================*/
create table SOCIETE
(
   CODE_SOCIETE         int not null auto_increment,
   RAISON_SOCIAL        text,
   TEL1                 text,
   TEL2                 text,
   BP                   text,
   VILLE                text,
   PAYS                 text,
   SITUATION_GEO        text,
   COPYRIGHT            text,
   LOGO                 text,
   primary key (CODE_SOCIETE)
);

/*==============================================================*/
/* Table: SORTIE                                                */
/*==============================================================*/
create table SORTIE
(
   CODE_SORTIE          int not null auto_increment,
   CODE_MOTIF           int not null,
   CODE_USER            int not null,
   DATE_SORTIE          date,
   primary key (CODE_SORTIE)
);

/*==============================================================*/
/* Table: SOUSCRIPTEUR                                          */
/*==============================================================*/
create table SOUSCRIPTEUR
(
   CODE_SOUSCRIPTEUR    int(7) not null auto_increment,
   NOM_SOUSCRIPTEUR     text,
   primary key (CODE_SOUSCRIPTEUR)
);

/*==============================================================*/
/* Table: SPECIALITE                                            */
/*==============================================================*/
create table SPECIALITE
(
   CODE_SPECIALITE      int(11) not null auto_increment,
   NOM_SPECIALITE       text,
   NUM_SPECIALITE       text,
   primary key (CODE_SPECIALITE)
);

/*==============================================================*/
/* Table: TRAVAILLER                                            */
/*==============================================================*/
create table TRAVAILLER
(
   CODE_USER            int not null,
   CODE_JOURNEE         int not null,
   primary key (CODE_USER, CODE_JOURNEE)
);

/*==============================================================*/
/* Table: UTILISATEUR                                           */
/*==============================================================*/
create table UTILISATEUR
(
   CODE_USER            int not null auto_increment,
   CODE_PRIVILEGE       int not null,
   NOM_USER             text,
   PRENOM_USER          text,
   LOGIN                text,
   PWD                  text,
   STATUT               bool,
   DATE_ENREGISTREMENT  datetime,
   primary key (CODE_USER)
);

/*==============================================================*/
/* Table: VENTE                                                 */
/*==============================================================*/
create table VENTE
(
   CODE_VENTE           int not null auto_increment,
   CODE_ANNULATION      int,
   CODE_JOURNEE         int not null,
   CODE_CLI             int not null,
   CODE_ENCAISSEMENT    int,
   CODE_USER            int not null,
   CODE_BORDEREAU       int not null,
   DATE_VENTE           date,
   POURCENTAGE          float,
   STATUT               bool,
   HEURE_VENTE          time,
   primary key (CODE_VENTE)
);

alter table ANNULATION_VENTE add constraint FK_B2 foreign key (CODE_VENTE)
      references VENTE (CODE_VENTE) on delete restrict on update restrict;

alter table CLIENT add constraint FK_RABATTRE foreign key (CODE_COM)
      references COMMERCIALE (CODE_COM) on delete restrict on update restrict;

alter table COMPTE_PRODUIT_ add constraint FK_OPERER foreign key (CODE_FOURNISSEUR)
      references FOURNISSEUR (CODE_FOURNISSEUR) on delete restrict on update restrict;

alter table COMPTE_PRODUIT_ add constraint FK_SUIVRE foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table CONTRAT_SOUSCRIPTEUR add constraint FK_ETRE_LIE foreign key (CODE_SOUSCRIPTEUR)
      references SOUSCRIPTEUR (CODE_SOUSCRIPTEUR) on delete restrict on update restrict;

alter table DEFINIR_POURCENTAGE add constraint FK_DEFINIR_POURCENTAGE foreign key (CODE_SOUSCRIPTEUR)
      references SOUSCRIPTEUR (CODE_SOUSCRIPTEUR) on delete restrict on update restrict;

alter table DEFINIR_POURCENTAGE add constraint FK_DEFINIR_POURCENTAGE2 foreign key (CODE_FAMILLE)
      references FAMILLE_PRODUIT (CODE_FAMILLE) on delete restrict on update restrict;

alter table DEPENSE add constraint FK_DEPENSER foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table ENCAISSEMENT add constraint FK_FAIRE foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table ENCAISSEMENT add constraint FK_JOURNALISER foreign key (CODE_JOURNEE)
      references JOURNEE (CODE_JOURNEE) on delete restrict on update restrict;

alter table ENCAISSEMENT add constraint FK_PAYER foreign key (CODE_PAIEMENT)
      references MODE_PAYEMENT (CODE_PAIEMENT) on delete restrict on update restrict;

alter table ENCAISSEMENT add constraint FK_RELATIONSHIP_2 foreign key (CODE_VENTE)
      references VENTE (CODE_VENTE) on delete restrict on update restrict;

alter table ENTREE add constraint FK_EFFECTUER_ENTREE foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table HISTORIQUE_MODIF add constraint FK_HISTORISER foreign key (CODE_VENTE)
      references VENTE (CODE_VENTE) on delete restrict on update restrict;

alter table JOURNEE add constraint FK_CLOTURER_JOURNEE foreign key (CODE_USER_CLOTURER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table JOURNEE add constraint FK_FERMER_JOURNEE foreign key (CODE_USER_FERMER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table JOURNEE add constraint FK_OUVRIR_JOURNEE foreign key (CODE_USER_OUVRIR)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table LOGS add constraint FK_POSSEDER foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table MODE_PAYEMENT add constraint FK_ASSOCIER foreign key (CODE_BANQUE)
      references BANQUE (CODE_BANQUE) on delete restrict on update restrict;

alter table MODE_PAYEMENT add constraint FK_PAYER_PAR foreign key (CODE_SOUSCRIPTEUR)
      references SOUSCRIPTEUR (CODE_SOUSCRIPTEUR) on delete restrict on update restrict;

alter table MOUVEMENT add constraint FK_MVE foreign key (CODE_ENTREE)
      references ENTREE (CODE_ENTREE) on delete restrict on update restrict;

alter table MOUVEMENT add constraint FK_MVS foreign key (CODE_SORTIE)
      references SORTIE (CODE_SORTIE) on delete restrict on update restrict;

alter table MOUVEMENT add constraint FK_MVV foreign key (CODE_VENTE)
      references VENTE (CODE_VENTE) on delete restrict on update restrict;

alter table OPERATIONCOMPTE add constraint FK_LIER foreign key (CODE_CLI)
      references CLIENT (CODE_CLI) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_APPARTENIR foreign key (CODE_FAMILLE)
      references FAMILLE_PRODUIT (CODE_FAMILLE) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_AVOIR_CLASSE foreign key (CODE_CLASSE)
      references CLASSE_PRODUIT (CODE_CLASSE) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_AVOIR_FORME foreign key (CODE_FORME)
      references FORME (CODE_FORME) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_ETRE_GENERIQUE foreign key (PRO_CODE_PRODUIT)
      references PRODUIT (CODE_PRODUIT) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_EXPLOITER foreign key (CODE_EXPLOITANT)
      references EXPLOITANT (CODE_EXPLOITANT) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_FABRIQUER foreign key (CODE_LAB)
      references LABORATOIRE (CODE_LAB) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_LOCALISER foreign key (CODE_LOCALISATION)
      references LOCALISATION (CODE_LOCALISATION) on delete restrict on update restrict;

alter table PRODUIT add constraint FK_SPECIALISER foreign key (CODE_SPECIALITE)
      references SPECIALITE (CODE_SPECIALITE) on delete restrict on update restrict;

alter table PRODUIT_ENTREE_FOURNISSEUR add constraint FK_PRODUIT_ENTREE_FOURNISSEUR foreign key (CODE_FOURNISSEUR)
      references FOURNISSEUR (CODE_FOURNISSEUR) on delete restrict on update restrict;

alter table PRODUIT_ENTREE_FOURNISSEUR add constraint FK_PRODUIT_ENTREE_FOURNISSEUR2 foreign key (CODE_PRODUIT)
      references PRODUIT (CODE_PRODUIT) on delete restrict on update restrict;

alter table PRODUIT_ENTREE_FOURNISSEUR add constraint FK_PRODUIT_ENTREE_FOURNISSEUR3 foreign key (CODE_ENTREE)
      references ENTREE (CODE_ENTREE) on delete restrict on update restrict;

alter table PRODUIT_SORTIE add constraint FK_PRODUIT_SORTIE foreign key (CODE_PRODUIT)
      references PRODUIT (CODE_PRODUIT) on delete restrict on update restrict;

alter table PRODUIT_SORTIE add constraint FK_PRODUIT_SORTIE2 foreign key (CODE_SORTIE)
      references SORTIE (CODE_SORTIE) on delete restrict on update restrict;

alter table PRODUIT_VENDU add constraint FK_PRODUIT_VENDU foreign key (CODE_VENTE)
      references VENTE (CODE_VENTE) on delete restrict on update restrict;

alter table PRODUIT_VENDU add constraint FK_PRODUIT_VENDU2 foreign key (CODE_PRODUIT)
      references PRODUIT (CODE_PRODUIT) on delete restrict on update restrict;

alter table SORTIE add constraint FK_EFFECTUER_SORTIE foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table SORTIE add constraint FK_JUSTIFIER foreign key (CODE_MOTIF)
      references MOTIF (CODE_MOTIF) on delete restrict on update restrict;

alter table TRAVAILLER add constraint FK_TRAVAILLER foreign key (CODE_JOURNEE)
      references JOURNEE (CODE_JOURNEE) on delete restrict on update restrict;

alter table TRAVAILLER add constraint FK_TRAVAILLER2 foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table UTILISATEUR add constraint FK_AVOIR foreign key (CODE_PRIVILEGE)
      references PRIVILEGES (CODE_PRIVILEGE) on delete restrict on update restrict;

alter table VENTE add constraint FK_B foreign key (CODE_ANNULATION)
      references ANNULATION_VENTE (CODE_ANNULATION) on delete restrict on update restrict;

alter table VENTE add constraint FK_CONTRACTER foreign key (CODE_CLI)
      references CLIENT (CODE_CLI) on delete restrict on update restrict;

alter table VENTE add constraint FK_EFFECTUER foreign key (CODE_USER)
      references UTILISATEUR (CODE_USER) on delete restrict on update restrict;

alter table VENTE add constraint FK_JV foreign key (CODE_JOURNEE)
      references JOURNEE (CODE_JOURNEE) on delete restrict on update restrict;

alter table VENTE add constraint FK_MATERIALISER foreign key (CODE_BORDEREAU)
      references BORDEREAU (CODE_BORDEREAU) on delete restrict on update restrict;

alter table VENTE add constraint FK_RELATIONSHIP_1 foreign key (CODE_ENCAISSEMENT)
      references ENCAISSEMENT (CODE_ENCAISSEMENT) on delete restrict on update restrict;


--
-- Dumping data for table `banque`
--

INSERT INTO `banque` (`CODE_BANQUE`, `NUM_BANQUE`, `DESCRIPTION`) VALUES
(1, '854789655', 'UTB');


--
-- Dumping data for table `bordereau`
--

INSERT INTO `bordereau` (`CODE_BORDEREAU`, `NUMERO_BORDEREAU_COURSIER`, `BENEFICIAIRE`) VALUES
(1, 'AZR7854693PLO', 'Toto'),
(2, 'ERTG85479652', 'Gerant');

--
-- Dumping data for table `classe_produit`
--

INSERT INTO `classe_produit` (`CODE_CLASSE`, `NUM_CLASS`, `DESCRIPTION`) VALUES
(1, NULL, 'bacterie'),
(2, NULL, 'Anti-biotique');

--
-- Dumping data for table `commerciale`
--

INSERT INTO `commerciale` (`CODE_COM`, `NOM_COM`, `PRENOM_COM`, `DATE_EMB`, `TEL_COM`, `TEL_URG`, `ADRESSE`, `EMAIL`, `CHIFFRE`, `POURCENTAGE`) VALUES
(1, 'Agbogan', 'oyoyo', '2017-07-05', '92593461', '98628723', 'telessou', 'scribe@scribe.tg', 0, 0.2),
(2, 'toto', 'baba', '2017-07-13', '97125812', '91486620', 'attiegou', 'atabre@gmail.com', 0, 0.5);

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`CODE_CLI`, `CODE_COM`, `TITRE`, `NOM_CLI`, `PRENOM_CLI`, `TYPE_PIECE`, `NUM_PIECE`, `DATE_PIECE`, `EMAIL`, `ADRESSE`, `TEL1`, `TEL2`, `STATUT`, `TOTAL_DU`, `CREDIT_MAX`, `DELAI_PAIEMENT`, `REMISE`, `DROIT_CREDIT`, `DEPASSEMENT`, `DATE_CREATION`) VALUES
(1, 1, 'monsieur', 'toto', 'tata', 'CNI', '989990ki7', '2017-07-05', 'yoyo@yaya.com', 'klikan', '90909090', '98989898', 1, 8900.00, 234456.00, 7, 20, 1, 10000, '2017-07-30 03:22:14'),
(3, 2, 'Mr', 'corbeau', 'yoann', 'CNI', '098889765', '2017-07-20', 'yoann@rookit.com', 'paris', '09988987', '90999988', 0, 0.00, 90000.00, 15, 30, 0, 1, NULL),
(5, 2, 'Mr', 'Notokpe', 'Aicha', 'CNI', '12345678901', '2017-08-17', 'riri@rara.com', 'telessou', '09988987', '003378995544', 0, 0.00, 90000.00, 15, 30, 1, 10, NULL),
(6, 1, 'Mr', 'Notokpe', 'Alex', 'PP', '90888765', '2017-08-09', 'arendal@gmail.com', 'Agoe', '09988987', '97125812', 0, 0.00, 70000.00, 15, 30, 1, 10, NULL);


--
-- Dumping data for table `exploitant`
--

INSERT INTO `exploitant` (`CODE_EXPLOITANT`, `NUM_EXPLOITANT`, `LIBELLE`) VALUES
(1, NULL, 'Dafra'),
(2, NULL, 'Medis');

--
-- Dumping data for table `famille_produit`
--

INSERT INTO `famille_produit` (`CODE_FAMILLE`, `NUM_FAMILLE`, `NOM_FAMILLE`) VALUES
(1, NULL, 'Gellule'),
(2, NULL, 'Effervescent');

--
-- Dumping data for table `forme`
--

INSERT INTO `forme` (`CODE_FORME`, `NOM_FORME`, `NUM_FORME`) VALUES
(1, 'Ronde', NULL),
(2, 'Liquide', NULL);

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`CODE_FOURNISSEUR`, `RAISON_SOCIAL`, `CONCTACT`, `TEL`, `TEL_URG`, `EMAIL`, `ADRESSE`, `SOLDE_COMPTE`) VALUES
(1, 'Coaret', NULL, 'kristar@live.fr', 'Tosti rue 228 ', '7459633', '7459633', 0),
(2, 'NSIA', 'Kossi Eucky', '90989796', '003378995544', 'riri@rara.com', 'paris', 0),
(3, 'WndH', 'yonam Agbogan', '97125812', '91486620', 'yoni@webandhack.com', 'klikame', 0);

--
-- Dumping data for table `laboratoire`
--

INSERT INTO `laboratoire` (`CODE_LAB`, `NUMERO_LAB`, `NOM_LABORATOIRE`) VALUES
(1, NULL, 'Bio-Pharma'),
(2, NULL, 'Dietetique');

--
-- Dumping data for table `localisation`
--

INSERT INTO `localisation` (`CODE_LOCALISATION`, `NUM_LOCALISATION`, `NOM_LOCALISATION`) VALUES
(1, NULL, 'Etagère 4'),
(2, NULL, 'Etagère 2');

--
-- Dumping data for table `mode_payement`
--

INSERT INTO `mode_payement` (`CODE_PAIEMENT`, `CODE_BANQUE`, `DESCRIPTION`, `NUM_CHEQUE`, `MONTANT`, `DATE_CHEQUE`) VALUES
(1, 1, 'UTB', 25478965, 30000, '2017-08-16');

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`CODE_PRIVILEGE`, `DESIGNATION`, `LEVEL`) VALUES
(1, 'administrateur', 5),
(2, 'Comptoir', 3);

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`CODE_SPECIALITE`, `NOM_SPECIALITE`, `NUM_SPECIALITE`) VALUES
(1, 'Fièvre', NULL),
(2, 'Paludisme', NULL);

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`CODE_PRODUIT`, `CODE_FAMILLE`, `CODE_FORME`, `CODE_CLASSE`, `CODE_EXPLOITANT`, `PRO_CODE_PRODUIT`, `CODE_LOCALISATION`, `CODE_SPECIALITE`, `CODE_LAB`, `DESIGNATION`, `DCI`, `SOUMIS_TVA`, `DATE_COMMERCIALISATION`, `PHOTO`, `DATE_ENREGISTREMENT`, `DATE_MJ`, `DATE_PEREMPTION`, `QTE_STOCK`, `PRIX_PRODUIT`, `CIP`, `CODE_BARRE`, `TAUX_TVA`) VALUES
(1, 1, 1, 2, 2, NULL, 2, 1, 2, 'Efferlagant', 'H20', 1, '2017-06-15', NULL, '2017-07-09 00:00:00', '2017-07-15', '2017-12-22', 25, 2541, '', NULL, 0),
(2, 2, 1, 2, 2, NULL, 1, 2, 2, 'Neopred', 'Molecule', 1, '2017-06-04', NULL, '2017-07-25 00:00:00', '2017-07-28', '2017-10-21', 30, 3652, '', NULL, 0),
(7, 1, 1, 1, 1, NULL, 1, 1, 1, 'savon', 'ethanol', 1, '2017-08-16', NULL, '2017-08-11 00:00:00', NULL, '2017-08-07', NULL, 99059, '8988342', 123434, 18),
(8, 1, 1, 1, 1, NULL, 1, 1, 1, 'fervex', 'benzene', 1, '2017-08-11', NULL, '2017-08-24 00:00:00', NULL, '2017-08-22', NULL, 78200, '123456', 3743764, 20);



--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`CODE_USER`, `CODE_PRIVILEGE`, `NOM_USER`, `PRENOM_USER`, `LOGIN`, `PWD`, `STATUT`, `DATE_ENREGISTREMENT`) VALUES
(1, 1, 'administrateur', 'admini', 'admin', 'admin', 0, NULL),
(2, 1, 'nom_user', 'prenom_user', 'user', '12dea96fec20593566ab75692c9949596833adc9', 1, NULL),
(3, 2, 'test_nom', 'test_prenom', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 0, NULL),
(4, 1, 'Agbogan', 'yonam', 'yoni', 'b2512009c2b5cd932b662cb06095af865f40213b', 0, '2017-08-11 12:38:17');

--
-- Dumping data for table `journee`
--

INSERT INTO `journee` (`CODE_JOURNEE`, `DATE`, `DATE_OUVERTURE`, `DATE_FERMETURE`, `DATE_CLOTURE`, `STATUT`, `MONTANT_FERMETURE`, `MONTANT_CLOTURE`, `MONTANT_MANQUANT`, `MONTANT_SURPLUS`, `CODE_USER_OUVRIR`, `CODE_USER_FERMER`, `CODE_USER_CLOTURER`) VALUES
(1, '2017-08-09', '2017-08-09 00:00:00', '2017-08-16 00:00:00', '2017-08-10 00:00:00', 0, 250000.00, 254000.00, 0.00, 300.00, 1, NULL, NULL);



--
-- Dumping data for table `vente`
--

INSERT INTO `vente` (`CODE_VENTE`, `CODE_ANNULATION`, `CODE_JOURNEE`, `CODE_CLI`, `CODE_ENCAISSEMENT`, `CODE_USER`, `CODE_BORDEREAU`, `DATE_VENTE`, `POURCENTAGE`, `STATUT`, `HEURE_VENTE`) VALUES
(1, NULL, 1, 1, NULL, 1, 1, '2017-08-03', 0, 0, '18:24:00');


--
-- Dumping data for table `produit_vendu`
--

INSERT INTO `produit_vendu` (`CODE_PRODUIT`, `CODE_VENTE`, `NB_VENDU`, `MONTANT_VENTE`) VALUES
(2, 1, 2, 2536);



--
-- Dumping data for table `encaissement`
--

INSERT INTO `encaissement` (`CODE_ENCAISSEMENT`, `CODE_JOURNEE`, `CODE_PAIEMENT`, `CODE_VENTE`, `CODE_USER`, `TYPE`, `DATE_ENCAISSEMENT`, `STATUT`) VALUES
(1, 1, 1, 1, 1, 'Liquide', '2017-08-09 00:00:00', 0);
