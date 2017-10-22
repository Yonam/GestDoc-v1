<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['labo_add'])){
    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';


            $req = $bdd->prepare("INSERT INTO laboratoire (NOM_LABORATOIRE) VALUES(:libelle)");
            $req->execute(array('libelle'=>$libelle));
            
            // print_r($_POST);
           echo '<body onload ="alert(\'laboratoire ajouté avec succès\')">';
           echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>