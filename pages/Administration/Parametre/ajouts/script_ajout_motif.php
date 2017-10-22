<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../../include/connexionDB.php";
if (isset($_POST['motif_add'])){

    $libelle = isset($_POST['libelle']) ? $_POST['libelle'] : '';


            $req = $bdd->prepare("INSERT INTO motif (DESCRIPTION) VALUES(:libelle)");
            $req->execute(array('libelle'=>$libelle));
            
            // print_r($_POST);
            echo '<body onload ="alert(\'Motif ajoutée avec succès\')">';
            echo '<meta http-equiv="refresh" content="0;URL=../../../../?page=dictionnaire">';

}
?>