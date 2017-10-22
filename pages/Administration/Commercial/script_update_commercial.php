<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 21/07/2017
 * Time: 22:54
 */
include "../../include/connexionDB.php";
if (isset($_POST['update_com'])){
    //<editor-fold defaultstate="collapsed" desc=" case 'ajout_commercial' ">

    // if (isset($_GET['form'])) {
    if ( isset($_POST['nom']) && isset($_POST['prenom']) && isset($_POST['tel1']) && isset($_POST['embauche'])) {
        $nom = isset($_POST['nom']) ? $_POST['nom'] : '';
        $prenom = isset($_POST['prenom']) ? $_POST['prenom'] : '';
        $embauche = isset($_POST['embauche']) ? $_POST['embauche'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $tel1 = isset($_POST['tel1']) ? $_POST['tel1'] : '';
        $tel2 = isset($_POST['tel2']) ? $_POST['tel2'] : '';
        $adresse = isset($_POST['adresse']) ? $_POST['adresse'] : '';
        $pourcentage = isset($_POST['pourcentage']) ? $_POST['pourcentage'] : '';
        $id = isset($_POST['memids']) ? $_POST['memids'] : '';
        //Formattage
        $nom = htmlspecialchars($nom);
        $prenom = htmlspecialchars($prenom);
        $email = htmlspecialchars($email);
        $adresse = htmlspecialchars($adresse);
        $tel1 = htmlspecialchars($tel1);
        $tel2 = htmlspecialchars($tel2);
        //TEST
       /* ECHO $nom ; ?> </Br> <?Php
        ECHO $prenom ; ?> </Br> <?Php
        ECHO $email ; ?> </Br> <?Php
        ECHO  $adresse ; ?> </Br> <?Php
        ECHO   $tel1 ; ?> </Br> <?Php
        ECHO  $tel2 ; ?> </Br> <?Php
*/

        //Traitement
        $json = array();
        $erreursChamp = array();
        $json['erreur'] = false;
        if ($nom === '') {
            $erreursChamp['nom'] = 'vide';
        }
        if ($prenom === '') {
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
            $req = $bdd->prepare("SELECT code_com FROM commerciale WHERE nom_com=?");
            $req->execute(array($nom));
            if ($req->rowCount() != 0) {
                $json['erreur'] = 'doublon';
            } else {
                $req = $bdd->prepare("UPDATE commerciale SET nom_com=:nom_com, prenom_com=:prenom_com,date_emb=:date_emb,email=:email, adresse=:adresse, tel_com=:tel_com, tel_urg=:tel_urg,chiffre=:chiffre, pourcentage=:pourcentage WHERE code_com=:code");
                $req->execute(array(
                    'nom_com'=>$nom,
                    'prenom_com'=>$prenom,
                    'date_emb'=>$embauche,
                    'email'=>$email,
                    'adresse'=>$adresse,
                    'tel_com'=>$tel1,
                    'tel_urg'=>$tel2,
                    'chiffre'=>0,
                    'pourcentage'=>$pourcentage,
                    'code'=>$id));
                $lastId = (int)$bdd->lastInsertId();

            }
        }
        // echo json_encode($json);
      echo '<body onload ="alert(\'Commercial mis a jour avec succès\')">';
       echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_commercial">';
    }
    //  }
}
?>