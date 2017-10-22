<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['forme_mod'])){

    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare("UPDATE forme SET NOM_FORME=:libelle WHERE CODE_FORME=:id ");
            $req->execute(array('libelle'=>$libelle, 'id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'forme ajoutée avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}

if (isset($_POST['forme_sup'])){

    
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare(" DELETE FROM forme WHERE CODE_FORME=:id ");
            $req->execute(array('id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Forme supprimee avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>