<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['mod_bank'])){

    $numero = isset($_POST['numero_banque']) ? $_POST['numero_banque'] : '';
    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare("UPDATE banque SET NUM_BANQUE=:numero,DESCRIPTION=:libelle WHERE CODE_BANQUE=:id ");
            $req->execute(array('numero'=>$numero,'libelle'=>$libelle, 'id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'banque ajoutée avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}


if (isset($_POST['bank_sup'])){

    
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare(" DELETE FROM banque WHERE CODE_BANQUE=:id ");
            $req->execute(array('id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'banque supprimee avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}

?>