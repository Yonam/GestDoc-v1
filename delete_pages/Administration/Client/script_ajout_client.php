<?php 
    session_start();
    include_once("fonctions_panier.php");
    $produits = $bdd->query('SELECT designation,nom_forme,code_cip,dci FROM produit P JOIN forme F WHERE F.code_forme = P.code_forme');
?>
<!DOCTYPE html>
<html lang="en"><?php

try
{
    // initilisation de PDO
    // On stocke la connection à MySQL dans une variable en précisant le type de table, l'hote, le mon de la bdd, le pseudo et mot de passe
    $bdd = new PDO('mysql:host=localhost;dbname=db_ventes', 'root', '');
}
catch (Exception $e)
{
        // En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : ' . $e->getMessage());
}

// Il ne faut JAMAIS, AU GRAND JAMAIS faire confiance aux données qui viennent de l'utilisateur ($_GET, $_POST, $_COOKIES, ...)
// Il faut vérifier la présence (pour éviter des erreurs), que le format correspond (pour tout ce qui n'est pas string) avec ça : http://fr2.php.net/manual/fr/function.filter-input.php
$tab = array(
    ':titre'          => $_POST['titre'],
    ':nom_cli'        => $_POST['nom'],
    ':prenom_cli'    => $_POST['prenom'],
    ':date_naissance'  => $_POST['date_naissance'],
    ':email'       => $_POST['email'],
    ':adresse'             => $_POST['adresse'],
    ':tel1'        => $_POST['tel1'],
    ':etat'             => $_POST['etat'],
    ':credit_maximum'       => $_POST['credit_maximum'],
    ':nbre_jr_avant_paie'      => $_POST['nbre_jr_avant_paie'],
    ':remise'      => $_POST['remise'],
    ':droit_au_credit'      => $_POST['droit_au_credit'],
    ':depassement'      => $_POST['depassement']
);
        


//création de la requête SQL:
$sql = "INSERT INTO `client` (`titre`, `prenom_cli`, `date_naissance`, `Email`, `adresse`, `tel1`, `tel2`, `total_du`, `credit_maximum`, `nbre_jr_avant_paie`, `remise`,`droit_au_credit`,`depassement`) 
    VALUES (:titre, :prenom_cli, :date_date_naissance, :email, :adresse, :tel1, :tel2, :total_du, :credit_maximum, :nbre_jr_avant_paie,:remise,:droit_au_credit,:depassement)" ;

// ça, c'est juste le temps de comprendre ;)
echo $sql;

$req = $bdd->prepare($sql);
// cette méthode te retourne true/false si ça a réussi/échoué
$result = $req->execute($tab);

// Du coup, on peux tester sur le retour et afficher l'erreur en cas de soucis
if (!$result) {
    // ça t'affiche juste un code. C'est suffisant en prod pour que l'utilisateur te fasse un retour
    echo "Une erreur est survenue : " . $req->errorCode();

    // Mais en dev, pour comprendre, tu peux faire ça :
    print_r($req->errorInfo());
}


// fermeture de la connection à la bdd
if ($bdd) {
    $bdd = NULL;
}


<?php include("../headerNormal.php"); ?>

<body>

    <div id="wrapper">

       <?php include("../menu.php"); ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Nouvelle vente</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Base de donnee des produits
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Code CIP</th>
                                        <th>Designation</th>
                                        <th>DCI</th>
                                        <th>Forme</th>
                                        <th>Prix</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php while ($donnees = $produits->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['code_cip']; ?></td>
                                        <td><?php echo $donnees['designation']; ?></td>
                                        <td><?php echo $donnees['dci']; ?></td>
                                        <td class="center"><?php echo $donnees['nom_forme']; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-gear" href="#"></a>
                                            <a class="btn btn-outline btn-success fa fa-times" href="#"></a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"></a>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Panier du client</h2>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <?php
                            if (creationPanier())
                            { 
                                $nbArticles=count($_SESSION['panier']['libelleProduit']);
                                if ($nbArticles <= 0)
                                echo "Votre panier est vide";
                                else {
                                    for ($i=0 ;$i < $nbArticles ; $i++)
                                    {
                                ?>
                                <thead>
                                    <tr>
                                        <th>Code CIP</th>
                                        <th>Designation</th>
                                        <th>DCI</th>
                                        <th>Forme</th>
                                        <th>Prix</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><?php echo htmlspecialchars($_SESSION['panier']['designation'][$i]);?></td>
                                        <td><?php echo htmlspecialchars($_SESSION['panier']['nb_vendu'][$i]);?></td>
                                        <td>Win 95+</td>
                                        <td class="center">4</td>
                                        <td class="center"><?php echo htmlspecialchars($_SESSION['panier']['prixProduit'][$i]) ?></td>
                                        <td class="center">
                                            <?php echo "<td><a href=\"".htmlspecialchars("panier.php?action=suppression&l=".rawurlencode($_SESSION['panier']['libelleProduit'][$i]))."\">XX</a></td>" ?>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php include("../footerTab.php");?>

</body>

</html>
