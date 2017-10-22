
<?php
session_start();


include "../../include/connexionDB.php";
if (isset($_POST['addprod'])){
        if (isset($_POST['cip']) && isset($_POST['interne']) && isset($_POST['achat']) && isset($_POST['designation']) && isset($_POST['vente'])) {


//Fonction pour valider les valeurs saisies dans les champs en fonction de la taille

// les variables

    $barre = isset($_POST['barre']) ? $_POST['barre'] : '';
    $cip = isset($_POST['cip']) ? $_POST['cip'] : '';
    $interne = isset($_POST['interne']) ? $_POST['interne'] : '';
    $dci = isset($_POST['dci']) ? $_POST['dci'] : '';
    $designation = isset($_POST['designation']) ? $_POST['designation'] : '';
    $peremption = isset($_POST['peremption']) ? $_POST['peremption'] : '';
    $tva = isset($_POST['tva']) ? $_POST['tva'] : '';
    $prix_achat = isset($_POST['achat']) ? $_POST['achat'] : '';
    $coef = isset($_POST['coef']) ? $_POST['coef'] : '';
    $reduction = isset($_POST['reduction']) ? $_POST['reduction'] : '';
    $prix_vente = isset($_POST['vente']) ? $_POST['vente'] : '';
    $labo = isset($_POST['laboratoire']) ? $_POST['laboratoire'] : '';
    $localisation = isset($_POST['localisation']) ? $_POST['localisation'] : '';
    $exploitant = isset($_POST['exploitant']) ? $_POST['exploitant'] : '';
    $classe = isset($_POST['classe']) ? $_POST['classe'] : '';
    $specialite = isset($_POST['specialite']) ? $_POST['specialite'] : '';
    $commercialisation = isset($_POST['commercialisation']) ? $_POST['commercialisation'] : '';
    $enregistrement = isset($_POST['enregistrement']) ? $_POST['enregistrement'] : '';
    $taux_tva = isset($_POST['tva']) ? $_POST['tva'] : '';
    $forme = isset($_POST['forme']) ? $_POST['forme'] : '';
    //Formattage
    $designation = htmlspecialchars($designation);
    $dci = utf8_decode($dci);
    $indice = htmlspecialchars($indice);
    $prix_achat = htmlspecialchars($prix_achat);
    $prix_vente = htmlspecialchars($prix_vente);
    $barre = htmlspecialchars($barre);
    //Traitement
    $json = array();
    $erreursChamp = array();
    $json['erreur'] = false;
    if ($dci === '') {
        $erreursChamp['nom_article'] = 'vide';
    }
    if (!$designation) {
        $erreursChamp['designation'] = (!isset($_POST['designation'])) ? 'vide' : '';
    }
    if (!$indice) {
        $erreursChamp['prix_vente'] = (!isset($_POST['prix_vente'])) ? 'vide' : '';
    }
    if (!empty($erreursChamp)) {
        $json['erreur'] = 'champs';
        $json['liste_erreurs'] = $erreursChamp;
    }
    if (!$json['erreur']) {//Pas d erreur
        $req = $bdd->prepare("SELECT ID FROM article WHERE nom_article=?");
        $req->execute(array($nom_article));
        if ($req->rowCount() != 0) {
            $json['erreur'] = 'doublon';
        } else {
            $req = $bdd->prepare("INSERT INTO article VALUES('',?,?,?,?,?,?,NOW())");
            $req->execute(array($famille, $nom_article, $description, $indice, $prix_u, $prix_a));
            $lastId = (int)$bdd->lastInsertId();
            $req = $bdd->prepare("INSERT INTO stock VALUES('',?,0,NOW())");
            $req->execute(array($lastId));
        }
    }
    echo json_encode($json);


    $insertion = array(
        'code_cip' => '$cip',
        'code_barre' => '$barre',
        'code_interne' => '$interne',
        'code_lab' => '$labo',
        'code_clas' => '$classe',
        'code_localisation' => '$localisation',
        'code_exploitant' => '$exploitant',
        'code_specialite' => '$specialite',
        'code_forme' => '$forme',
        'designation' => '$designation',
        'dci' => '$dci',
        'Soumis_tva' => '$tva',
        'commercialisation' => '$commercialisation',
        'enregistrement' => '$enregistrement',
        'date_peremption' => '$peremption',
        'prix_achat' => '$achat',
        'prix_vente' => '$vente',
        'tva' => '$taux_tva',
        'multiplicateur' => '$coef',
        'reduction' => '$reduction'
    );

    $sql = "INSERT INTO produit( code_cip,code_barre, code_interne,code_lab,code_clas,code_localisation,code_exploitant,code_specialite,code_forme,designation,dci,Soumis_tva,commercialisation,enregistrement,date_peremption,prix_achat,prix_vente,tva,multiplicateur,reduction )
                                VALUES(:cip,:barre,:interne,:labo,:classe,:localisation,:exploitant,:specialite,:forme,:designation,:dci,:tva,:commercialisation,enregistrement,:peremption,:achat,:vente,:taux_tva,:coef,:reduction)";

//Si cliquer sur envoyer
    if (isset($_POST['submit'])) {

        //si aucune erreur, on verifie les valeurs et on enregistre
        $requete = $bdd->prepare($sql);
// On lie les variables définie au-dessus au paramètres de la requête préparée
        $requete->execute($insertion);


        // Un petit message pour confirmer l'insertion

        echo 'Insertion reussie!';


    }
}
?>
