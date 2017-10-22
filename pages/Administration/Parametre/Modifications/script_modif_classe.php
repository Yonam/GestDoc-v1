<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['classe_mod'])){

    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare("UPDATE classe_produit SET DESCRIPTION=:libelle WHERE CODE_CLASSE=:id ");
            $req->execute(array('libelle'=>$libelle, 'id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Classe modifiee avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}

if (isset($_POST['classe_sup'])){

    
    $id = isset($_POST['memids']) ? $_POST['memids'] : '';


            $req = $bdd->prepare(" DELETE FROM classe_produit WHERE CODE_CLASSE=:id ");
            $req->execute(array('id'=>$id));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Classe supprimee avec succès\')">'; 
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>