<?php

/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 21/07/2017
 * Time: 22:54
 */
include "../../include/connexionDB.php";
if (isset($_POST['addfrs'])){
    //<editor-fold defaultstate="collapsed" desc=" case 'ajout_fournisseur' ">

    // if (isset($_GET['form'])) {
    if ( isset($_POST['raison']) && isset($_POST['per_contact']) && isset($_POST['tel1'])) {
        $raison = isset($_POST['raison']) ? $_POST['raison'] : '';
        $contact = isset($_POST['per_contact']) ? $_POST['per_contact'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $tel1 = isset($_POST['tel1']) ? $_POST['tel1'] : '';
        $tel2 = isset($_POST['tel2']) ? $_POST['tel2'] : '';
        $adresse = isset($_POST['adresse']) ? $_POST['adresse'] : '';
        //Formattage
        $raison = htmlspecialchars($raison);
        $contact = htmlspecialchars($contact);
        $email = htmlspecialchars($email);
        $adresse = htmlspecialchars($adresse);
        $tel1 = htmlspecialchars($tel1);
        $tel2 = htmlspecialchars($tel2);
        //TEST
     /*   ECHO $raison ; ?> </Br> <?Php
         ECHO $contact ; ?> </Br> <?Php
         ECHO $email ; ?> </Br> <?Php
         ECHO  $adresse ; ?> </Br> <?Php
         ECHO   $tel1 ; ?> </Br> <?Php
         ECHO  $tel2 ; ?> </Br> <?Php
       */

        //Traitement
        $json = array();
        $erreursChamp = array();
        $json['erreur'] = false;
        if ($raison === '') {
            $erreursChamp['raison'] = 'vide';
        }
        if ($contact === '') {
            $erreursChamp['prenom'] = 'vide';
        }
        if (!$adresse) {
            $erreursChamp['adresse'] = (!isset($_POST['adresse'])) ? 'vide' : '';
        }
        if (!$tel1) {
            $erreursChamp['tel1'] = (!isset($_POST['tel1'])) ? 'vide' : '';
        }
        if (!empty($erreursChamp)) {
            $json['erreur'] = 'champs';
            $json['liste_erreurs'] = $erreursChamp;
        }
        if (!$json['erreur']) {//Pas d erreur
            $req = $bdd->prepare("SELECT code_fournisseur FROM fournisseur WHERE raison_social=?");
            $req->execute(array($raison));
            if ($req->rowCount() != 0) {
                $json['erreur'] = 'doublon';
            } else {
                $req = $bdd->prepare("INSERT INTO fournisseur ( RAISON_SOCIAL, CONCTACT, TEL, TEL_URG, EMAIL, ADRESSE,  SOLDE_COMPTE)
                                                VALUES(:raison_social,:conctact, :tel, :tel_urg,:email, :adresse, :solde_compte)");
                $req->execute(array(
                    'raison_social'=>$raison,
                    'conctact'=>$contact,
                    'tel'=>$tel1,
                    'tel_urg'=>$tel2,
                    'email'=>$email,
                    'adresse'=>$adresse,
                    'solde_compte'=>0,));
                $lastId = (int)$bdd->lastInsertId();

            }
        }
      //   echo json_encode($json);
       echo '<body onload ="alert(\'Fournisseur ajouté avec succès\')">';
       echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_fournisseur">';
    }
    //  }
}
?>