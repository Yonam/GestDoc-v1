<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['bank_add'])){

    $numero = isset($_POST['numero_banque']) ? $_POST['numero_banque'] : '';
    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';


            $req = $bdd->prepare("INSERT INTO banque (NUM_BANQUE,DESCRIPTION) VALUES(:numero,:libelle)");
            $req->execute(array('numero'=>$numero,'libelle'=>$libelle));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'banque ajoutée avec succès\')">';
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>