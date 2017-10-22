<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../include/connexionDB.php";

if (isset($_GET['id'])) {
  $id = $_GET['id'];
  $req = $bdd->prepare("UPDATE `utilisateur` SET `STATUT` = '1' WHERE `utilisateur`.`CODE_USER`=:code");
  $req->execute(array('code'=>$id));
  echo '<body onload ="alert(\'Utilisateur bloqué avec succès\')">';
  echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_utilisateur">';
}elseif (isset($_GET['idActive'])) {
  $id = $_GET['idActive'];
  $req = $bdd->prepare("UPDATE `utilisateur` SET `STATUT` = '0' WHERE `utilisateur`.`CODE_USER`=:code");
  $req->execute(array('code'=>$id));
  echo '<body onload ="alert(\'Utilisateur débloqué avec succès\')">';
  echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_utilisateur">';
}elseif (isset($_GET['idReinit'])) {
  $id = $_GET['idReinit'];
  $req = $bdd->prepare("UPDATE `utilisateur` SET `PWD` = null WHERE `utilisateur`.`CODE_USER`=:code");
  $req->execute(array('code'=>$id));
  echo '<body onload ="alert(\'Utilisateur réinitialisé avec succès\')">';
  echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_utilisateur">';
}
    

?>