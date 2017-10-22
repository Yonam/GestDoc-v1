
<?php
session_start();


    try
    {
        $bdd = new PDO('mysql:host=localhost;dbname=pharma', 'root', '');
    }
    catch (Exception $e)
    {
        die('Erreur : ' . $e->getMessage());
    }



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
$commercialisation=isset($_POST['commercialisation']) ? $_POST['commercialisation']:'';
$enregistrement=isset($_POST['enregistrement']) ? $_POST['enregistrement']:'';
$taux_tva=isset($_POST['tva']) ? $_POST['tva']:'';
$forme=isset($_POST['forme']) ? $_POST['forme']:'';


$insertion = array(
        'code_cip' => '$cip' , 
        'code_barre' => '$barre' ,
        'code_interne' => '$interne',
        'code_lab' => '$labo',
        'code_clas' => '$classe',
        'code_localisation' => '$localisation',
        'code_exploitant' => '$exploitant' ,
        'code_specialite' => '$specialite' ,
        'code_forme' => '$forme' , 
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

$sql="INSERT INTO produit( code_cip,code_barre, code_interne,code_lab,code_clas,code_localisation,code_exploitant,code_specialite,code_forme,designation,dci,Soumis_tva,commercialisation,enregistrement,date_peremption,prix_achat,prix_vente,tva,multiplicateur,reduction )
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

