<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['modif_famille'])){

    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare("UPDATE famille_produit SET NOM_FAMILLE=:libelle WHERE CODE_FAMILLE=:id ");
            $req->execute(array('libelle'=>$libelle, 'id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Famille modifiée avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}

if (isset($_POST['famille_sup'])){

    
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare(" DELETE FROM famille_produit WHERE CODE_FAMILLE=:id ");
            $req->execute(array('id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Famille supprimee avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>