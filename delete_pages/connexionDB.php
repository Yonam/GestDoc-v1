<?php
try
{
	$bdd = new PDO('mysql:host=localhost;dbname=pharma', 'root', '');
}
catch (Exception $e)
{
	die('Erreur : ' . $e->getMessage());
}

?>



<?php
// session_start();

/* function db_connect(){
    try
    {
        $bdd = new PDO('mysql:host=localhost;dbname=pharma', 'root', '');
    }
    catch (Exception $e)
    {
        die('Erreur : ' . $e->getMessage());
    }

    return $bdd;
} */

//Fonction pour valider les valeurs saisies dans les champs en fonction de la taille

// les variables

$barre=isset($_POST['barre']) ? $_POST['barre'] : '';
$cip=isset($_POST['cip']) ? $_POST['cip']:'';
$interne=isset($_POST['interne']) ? $_POST['interne']:'';
$dci=isset($_POST['dci']) ? $_POST['dci']:'';
$designation=isset($_POST['designation']) ? $_POST['designation']:'';
$peremption=isset($_POST['peremption']) ? $_POST['peremption']:'';
$tva=isset($_POST['tva']) ? $_POST['tva']:'';
$achat=isset($_POST['achat']) ? $_POST['achat']:'';
$coef=isset($_POST['coef']) ? $_POST['coef']:'';
$reduction=isset($_POST['reduction']) ? $_POST['reduction']:'';
$vente=isset($_POST['vente']) ? $_POST['vente']:'';
$labo=isset($_POST['laboratoire']) ? $_POST['laboratoire']:'';
$localisation=isset($_POST['localisation']) ? $_POST['localisation']:'';
$exploitant=isset($_POST['exploitant']) ? $_POST['exploitant']:'';
$classe=isset($_POST['classe']) ? $_POST['classe']:'';
$specialite=isset($_POST['specialite']) ? $_POST['specialite']:'';
$forme=isset($_POST['forme']) ? $_POST['forme']:'';

//Si cliquer sur envoyer
if (isset($_POST['submit'])) {
    $bdd=db_connect();
    //si aucune erreur, on verifie les valeurs et on enregistre
    $requete = $bdd->prepare('INSERT INTO produit(code_barre, code_cip, code_interne,dci,designation,date_peremption,Soumis_tva,prix_achat,multiplicateur,reduction,prix_vente,code_lab,code_localisation,code_exploitant, code_clas,code_specialite,code_forme)
                                VALUES(:barre,:cip,:interne,:dci,:designation,:permption,:tva,:achat,:coef,:reduction,:vente,:labo,:localisation,:exploitant,:classe,:specialite,:forme)');
// On lie les variables définie au-dessus au paramètres de la requête préparée
    $requete->bindValue(':barre', $barre, PDO::PARAM_STR);
    $requete->bindValue(':cip', $cip, PDO::PARAM_STR);
    $requete->bindValue(':interne', $interne, PDO::PARAM_STR);
    $requete->bindValue(':dci', $dci, PDO::PARAM_STR);
    $requete->bindValue(':designation', $designation, PDO::PARAM_STR);
    $requete->bindValue(':peremption', $peremption, PDO::PARAM_STR);
    $requete->bindValue(':tva', $tva, PDO::PARAM_STR);
    $requete->bindValue(':achat', $achat, PDO::PARAM_STR);
    $requete->bindValue(':coef', $coef, PDO::PARAM_STR);
    $requete->bindValue(':reduction', $reduction, PDO::PARAM_STR);
    $requete->bindValue(':vente', $vente, PDO::PARAM_STR);
    $requete->bindValue(':labo', $labo, PDO::PARAM_STR);
    $requete->bindValue(':localisation', $localisation, PDO::PARAM_STR);
    $requete->bindValue(':exploitant', $exploitant, PDO::PARAM_STR);
    $requete->bindValue(':classe', $classe, PDO::PARAM_STR);
    $requete->bindValue(':specialite', $specialite, PDO::PARAM_STR);
    $requete->bindValue(':forme', $forme, PDO::PARAM_STR);
//On exécute la requête
    $requete->execute();

    // Un petit message pour confirmer l'insertion

    echo "Insertion reussie!";
    http_redirect();


}

?>
