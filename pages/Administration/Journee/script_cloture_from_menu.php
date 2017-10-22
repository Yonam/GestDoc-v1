<?php
//including the database connection file
include "../../include/connexionDB.php";

//getting id of the data from url
$id =isset($_GET['id']) ? $_GET['id'] : '';
$user =isset($_GET['id']) ? $_GET['identif'] : '';
//deleting the row from table


/*$query = $bdd->prepare("DELETE FROM fournisseur WHERE code_fournisseur=?");
$query->execute(array($id));*/

/*$query = $bdd->prepare("DELETE FROM fournisseur WHERE code_fournisseur=?");
$query->execute(array($id));*/

$req = $bdd->prepare("UPDATE journee SET CODE_USER_FERMER=:fermer, DATE_FERMETURE=:fermeture, STATUT=1 WHERE CODE_JOURNEE=:id");
$req->execute(array('fermer' => $user,
					'fermeture' => date("Y-m-d      H:i:s"),
					'id' => $id));
$lastId = (int)$bdd->lastInsertId();
 
//redirecting to the display page (index.php in our case)
echo '<body onload ="alert(\'Journee arretee avec succès\')">';
echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=ouvrir_journee">';
$code = 0;
?>