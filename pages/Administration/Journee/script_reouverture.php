<?php
//including the database connection file
include "../../include/connexionDB.php";
 
//getting id of the data from url
$id =$_GET['id'];
$user =$_GET['identif'];
//deleting the row from table


/*$query = $bdd->prepare("DELETE FROM fournisseur WHERE code_fournisseur=?");
$query->execute(array($id));*/

$req = $bdd->prepare("UPDATE journee SET CODE_USER_OUVRIR=:ouvrir, CODE_USER_FERMER=NULL, DATE_FERMETURE=NULL, STATUT=0 WHERE CODE_JOURNEE=:id");
$req->execute(array('ouvrir' => $user,
					'id' => $id));
$lastId = (int)$bdd->lastInsertId();
 
//redirecting to the display page (index.php in our case)
echo '<body onload ="alert(\'Journee reouverte avec succès\')">';
echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=ouvrir_journee">';
?>