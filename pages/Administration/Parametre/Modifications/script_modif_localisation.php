<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['mod_loc'])){

    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare("UPDATE localisation SET NOM_LOCALISATION=:libelle WHERE CODE_LOCALISATION=:id ");
            $req->execute(array('libelle'=>$libelle, 'id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Localisation modifié avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}

if (isset($_POST['loc_sup'])){

    
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare(" DELETE FROM localisation WHERE CODE_LOCALISATION=:id ");
            $req->execute(array('id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'localisation supprimee avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>