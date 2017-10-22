
<?php
//session_start();


//require "pages/include/classes/class.auth.php";
//

ob_start();


function traitementOut ($dci){
//    include("pages/include/connexionDB.php");
    $id = $_GET['id'];

    $sql2 = "SELECT p.cip, p.designation, p.dci, p.prix_produit, p.qte_stock FROM `produit` p WHERE p.dci = '". $dci."' ORDER BY p.designation";
    $req2 = $bdd->query($sql2);
    $fetch = implode(";", $req2->fetch(PDO::FETCH_ASSOC));
    return $fetch;

}

//$id = $_GET['id'];
//
//$sql2 = "SELECT p.cip, p.designation, p.dci, p.prix_produit, p.qte_stock FROM `produit` p WHERE p.dci = '". $_GET['dci'] ."' ORDER BY p.designation";
//$req2 = $bdd->query($sql2);
//$fetch = implode(";", $req2->fetch(PDO::FETCH_ASSOC));
////$fetch = explode(";", $fetch);
////var_dump($fetch[1]);
//
////$fetch = $req2->fetch(PDO::FETCH_OBJ);
////var_dump($fetch);
//header('Location:'.$_SERVER['HTTP_REFERER'].'&result='.$fetch.'&id='.$id);





