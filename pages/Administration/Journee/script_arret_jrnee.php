<?php
//including the database connection file
include "../../include/connexionDB.php";
 
//getting id of the data from url
$id =$_GET['id'];
$user =$_GET['identif'];


$req = $bdd->prepare("UPDATE journee SET CODE_USER_FERMER=:fermer, DATE_FERMETURE=:fermeture, STATUT=1 WHERE CODE_JOURNEE=:id");
$req->execute(array('fermer' => $user,
					'fermeture' => date("Y-m-d      H:i:s"),
					'id' => $id));
$lastId = (int)$bdd->lastInsertId();
 
//redirecting to the display page (index.php in our case)
echo '<body onload ="alert(\'Journee arretee avec succès\')">';
echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=ouvrir_journee">';
?>