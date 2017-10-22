<?php
//including the database connection file
include "../../include/connexionDB.php";
 
//getting id of the data from url
$id =$_GET['id'];
 
//deleting the row from table


$query = $bdd->prepare("UPDATE fournisseur SET fournisseur.deleted = 1 WHERE fournisseur.code_fournisseur=?");
$query->execute(array($id));
 
//redirecting to the display page (index.php in our case)
echo '<body onload ="alert(\'Fournisseur supprime avec succès\')">';
echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_fournisseur">';
?>