<?php

include "../../include/connexionDB.php";
if (isset($_POST['update_frs'])){

    if ( isset($_POST['raison']) && isset($_POST['per_contact']) && isset($_POST['tel1'])) {
        $raison = isset($_POST['raison']) ? $_POST['raison'] : '';
        $contact = isset($_POST['per_contact']) ? $_POST['per_contact'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $tel1 = isset($_POST['tel1']) ? $_POST['tel1'] : '';
        $tel2 = isset($_POST['tel2']) ? $_POST['tel2'] : '';
        $adresse = isset($_POST['adresse']) ? $_POST['adresse'] : '';
        $id = isset($_POST['memids']) ? $_POST['memids'] : '';
        //Formattage
        $raison = htmlspecialchars($raison);
        $contact = htmlspecialchars($contact);
        $email = htmlspecialchars($email);
        $adresse = htmlspecialchars($adresse);
        $tel1 = htmlspecialchars($tel1);
        $tel2 = htmlspecialchars($tel2);


        $req = $bdd->prepare("UPDATE fournisseur SET raison_social=:raison_social, conctact=:conctact, tel=:tel, tel_urg=:tel_urg, email=:email, adresse=:adresse,  solde_compte=:solde_compte WHERE code_fournisseur=:id");
        $req->execute(array(
                    'raison_social'=>$raison,
                    'conctact'=>$contact,
                    'tel'=>$tel1,
                    'tel_urg'=>$tel2,
                    'email'=>$email,
                    'adresse'=>$adresse,
                    'solde_compte'=>0,
                    'id' => $id));


    }
}       
echo '<body onload ="alert(\'Fournisseur mis a jour avec succès\')">';
echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=liste_fournisseur">';
?>