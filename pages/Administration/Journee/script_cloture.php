<?php
//including the database connection file
include "../../include/connexionDB.php";
 if (isset($_POST['cloturer'])){
//getting id of the data from url
$id =isset($_POST['codeVente']) ? $_POST['codeVente'] : '';
$user =isset($_POST['codeUser']) ? $_POST['codeUser'] : '';
$theorique = isset($_POST['theorie']) ? $_POST['theorie'] : '';
$pratique = isset($_POST['pratique']) ? $_POST['pratique'] : '';
$ecart = $pratique-$theorique;
if ($ecart>0) {
	$surplus=$ecart;
	$manquant=0;
}else {
	$surplus=0;
	$manquant=$ecart;
}

//deleting the row from table


/*$query = $bdd->prepare("DELETE FROM fournisseur WHERE code_fournisseur=?");
$query->execute(array($id));*/

$req = $bdd->prepare("UPDATE journee SET CODE_USER_CLOTURER=:cloturer,DATE_CLOTURE=:cloture,MONTANT_FERMETURE=:fermeture,MONTANT_CLOTURE=:montant_final,MONTANT_MANQUANT=:manquant,MONTANT_SURPLUS=:surplus WHERE CODE_JOURNEE=:identif");
$req->execute(array('cloturer' => $user,
					'cloture' => date("Y-m-d H:i:s"),
					'fermeture' => $theorique,
					'montant_final' => $pratique,
					'manquant' => $manquant,
					'surplus' => $surplus,
					'identif' => $id));
}
var_dump($id);
 
//redirecting to the display page (index.php in our case)
echo '<body onload ="alert(\'Journee cloturee avec succès\')">';
echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=ouvrir_journee">';
?>