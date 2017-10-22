<?php
//Requete pour combo box des fournisseurs
$sqlFourn =  "SELECT * FROM fournisseur f where f.deleted = 0 ORDER BY f.raison_social";
$reqFourn = $bdd->query($sqlFourn);

//Affichage des produits pour le choix des produits entrants (2eme tabulation)
$sqlProd="SELECT * FROM produit p ORDER BY p.designation";
$reqProd = $bdd->query($sqlProd);

 //Fonction de sauvegarde des produits sélectionnés
 function selectAddProd(){
     $bool = true;
     foreach ($_SESSION['tabEntrant'] as $tabE){
         if ($tabE['code_produit'] == $_POST['code_produit']){
             $bool = false;
         }
     }

     if ($bool == true){
        $sqlSAP = "SELECT p.designation, p.prix_produit FROM produit p WHERE p.code_produit =".$_POST['code_produit'];
        global $bdd;
        $reqSAP = $bdd->query($sqlSAP);
        $desig = $reqSAP->fetch(PDO::FETCH_ASSOC);

        $tabEntrant2['code_produit'] = $_POST['code_produit'];
        $tabEntrant2['designation'] = $desig['designation'];
        $tabEntrant2['prix_produit'] = $desig['prix_produit'];
        $tabEntrant2['qte_gratuite'] = $_POST['qte_gratuite'];
        $tabEntrant2['qte_payante'] = $_POST['qte_payante'];
        $tabEntrant2['qte_totale'] = $_POST['qte_gratuite'] + $_POST['qte_payante'];
        $tabEntrant2['montant_du'] = $tabEntrant2['qte_totale'] * $tabEntrant2['prix_produit'];
        $tabEntrant2['achat_credit'] = $_POST['achat_credit'];
        $tabEntrant2['date_peremption'] =  date('Y-m-d',strtotime(str_replace('-', '/', $_POST['date_peremption'])));

        echo '<div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Produit ajouté avec succès. 
              </div>';

        return $tabEntrant2;
     }
 }

//Fonction de sauvegarde des infos fournisseurs
function keepInfosFourn(){
    
    $tabEntrant3['code_fournisseur'] = $_POST['code_fournisseur'];
    $tabEntrant3['numero_bordereau'] = $_POST['numero_bordereau'];

    $tabEntrant3['numero_bordereau'] = (isset($_POST['numero_bordereau']) && $_POST['numero_bordereau'] !='')  ? $_POST['numero_bordereau'] : '';

    $tabEntrant3['numero_facture'] = $_POST['numero_facture'];
    $tabEntrant3['date_entree'] = date('Y-m-d',strtotime(str_replace('-', '/', $_POST['date_entree'])));

    return $tabEntrant3;
}

//Passage dans le tableau des entrants
if (isset($_POST['envoi'])){
    $varTemp = selectAddProd();
    if ($varTemp != []){
        $_SESSION['tabEntrant'][] = $varTemp;
    }
}

//Passage dans le tableau des infos fournisseur
if (isset($_POST['envoiFourn'])){
    $varTemp = keepInfosFourn();
    if ($varTemp != []){
        $_SESSION['infosFourn'] = $varTemp;
            echo '<div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Informations de l\'entrée enregistrés avec succès. 
                  </div>';
    }

}

//Retirer un produit du tableau des entrants
if (isset($_POST['retire'])){
    $i=0;
    foreach ($_SESSION['tabEntrant'] as $prod) {
        if($_POST['retire'] == $prod['code_produit']){
            unset($_SESSION['tabEntrant'][$i]);
        }
        $i++;
    }
}

/*//Annuler les infos du fournisseur
if (isset($_POST['retire'])){
    $i=0;
    foreach ($_SESSION['tabEntrant'] as $prod) {
        if($_POST['retire'] == $prod['code_produit']){
            unset($_SESSION['tabEntrant'][$i]);
        }
        $i++;
    }
}*/

//Initialisation ou réinitialisation du tableau au premier chargement de la page   WARNING!!! Réinitialisation bosse pas bien
if (!isset($_POST['envoi']) && !isset($_POST['retire']) && !isset($_POST['envoiFourn']) && !isset($_POST['valider'])){
    unset($_SESSION['tabEntrant']);
    unset($_SESSION['infosFourn']);
}



//Insertion dans la base  WARNING!!! Erreur php lors d'une seconde insertion!!!
if (isset($_POST['valider'])){

    //Requete d'insertion des infos complémentaire à l'entrance
    $sqlInsert1 = "INSERT INTO entree (code_user, date_entree, numero_facture, numero_bordereau) VALUES (".$_SESSION['Auth']->code_user.",'".$_SESSION['infosFourn']['date_entree']."','" .$_SESSION['infosFourn']['numero_facture']."', '".$_SESSION['infosFourn']['numero_bordereau']."')";

    
    $sqlInsert2 ="INSERT INTO mouvement (libelle, date) VALUES ('Entrée', '".$_SESSION['infosFourn']['date_entree']."')";

    global $bdd;
    $bdd->query($sqlInsert1);
    $bdd->query($sqlInsert2);

    //Insertion des produits entrants et mise à jour des quantités
    foreach ($_SESSION['tabEntrant'] as $tab) {
            if ($tab['achat_credit'] == true) {
                $sqlInsert5 = "update fournisseur set solde_compte = (".$tab['qte_payante']." * (select prix_produit from produit where code_produit = ".$tab['code_produit'].")) where code_fournisseur = ".$_SESSION['infosFourn']['code_fournisseur'];
                $bdd->query($sqlInsert5);
            }

        $sqlInsert3 = "INSERT INTO produit_entree_fournisseur (code_fournisseur, code_produit, code_entree, nombre_entree, qte_achat, qte_gratuit, date_maj, montant_du, achat_credit, date_peremption) VALUES (".$_SESSION['infosFourn']['code_fournisseur'].",".$tab['code_produit'].", (SELECT max(code_entree) FROM entree WHERE numero_facture ='".$_SESSION['infosFourn']['numero_facture']."'),".$tab['qte_totale'].",".$tab['qte_payante'].",".$tab['qte_gratuite'].",'".$_SESSION['infosFourn']['date_entree']."',".$tab['montant_du'].",".$tab['achat_credit'].",'".$tab['date_peremption']."')";   
        $sqlInsert4 ="UPDATE produit SET date_mj = '".$_SESSION['infosFourn']['date_entree']."', qte_stock = qte_stock + ".$tab['qte_totale']." WHERE code_produit = ".$tab['code_produit'];  


        $bdd->query($sqlInsert3);
        $bdd->query($sqlInsert4);
    }  

echo '<div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Entrée de produits enregistrée avec succès. 
    </div>';
}


?>

<div class="row dropdown-s">
    <h1 class="page-header">ENTREE DE PRODUIT(S)</h1>
    <div class="panel panel-default">

        <div class="panel-body">
            <!-- Nav tabs -->

                <?php if (isset($_POST['envoi'])) {
                ?>
                <ul class="nav nav-tabs">
                    <li><a href="#tab1" data-toggle="tab">Infos Entree</a>
                    </li>
                    <li><a href="#tab2" data-toggle="tab">Infos Produit(s)</a>
                    </li>
                    <li class="active"><a href="#tab3" data-toggle="tab">Validation</a>
                    </li>
                </ul>

                <div class="tab-content">
                        <div class="tab-pane fade" id="tab1">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <B><h3> Informations du fournisseur de l'entree </h3></B>
                                </div>

                                <div class="panel-body">
                                    <form role="form" method="post">
                                        <div class="form-group col-lg-6">
                                            <label for="fournisseur">Fournisseur</label>
                                            <select class="form-control" name="code_fournisseur" required>
                                                <option value="">++FOURNISSEUR++</option>

                                                <?php
                                                while($dataFourn = $reqFourn->fetch(PDO::FETCH_ASSOC)){
                                                    echo '<option value="'.$dataFourn['CODE_FOURNISSEUR'].'">'.$dataFourn['RAISON_SOCIAL'].'</option>';
                                                }?>

                                            </select>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="date_entree">Date d'entree</label>
                                            <input class="form-control datepicker" required readonly data-provide="datepicker" id="dated" name="date_entree" value="<?php echo date('Y/m/d');  ?>"
                                            <?php
                                                if(isset($_POST['envoiFourn']) && isset($_POST['date_entree'])){
                                                    echo ' value="'.$_POST["date_entree"].'" ';
                                                }
                                            ?>
                                            >
                                        </div>
                                        <div class="form-group col-lg-6 col-xm-2">
                                            <label for="facture">Numero facture</label>
                                            <input type="text" required class="form-control" name="numero_facture"
                                            <?php
                                                if(isset($_POST['envoiFourn']) && isset($_POST['numero_facture'])){
                                                    echo ' value="'.$_POST["numero_facture"].'" ';
                                                }
                                            ?>
                                            >
                                        </div>
                                        <div class="form-group col-lg-6 col-xm-2">
                                            <label for="bordereau">Numero de bordereau</label>
                                            <input type="text" class="form-control" name="numero_bordereau"
                                            <?php
                                                if(isset($_POST['envoiFourn']) && isset($_POST['numero_bordereau'])){
                                                    echo ' value="'.$_POST["numero_bordereau"].'" ';
                                                }
                                            ?>
                                            >
                                        </div>
                                    <button type="reset" name="cancelFourn" class="btn btn-default col-md-3 col-md-offset-1"> Annuler</button>
                                    <button type="submit" name="envoiFourn" class="btn btn-success col-md-3 col-md-offset-4"> Enregistrer</button>
                                    </form>
                                </div>

                                <div class="panel-footer">
                                    <a type="button" class="btn btn-primary fa fa-hand-o-right" data-toggle="tab" href="#tab2"> Suivant</a>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade in" id="tab2">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <B>  <h3>Selection Produit(s) entrant(s) </h3></B>
                                </div>

                                <div class="panel-body">

                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                        <thead>
                                        <tr>
                                            <th style="text-align:center">Code CIP</th>
                                            <th style="text-align:center">Designation</th>
                                            <th style="text-align:center">Quantite</th>
                                            <th style="text-align:center">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody style="text-align:center">
                                        <?php
                                        $i = 0;
                                        while($dataProd = $reqProd->fetch(PDO::FETCH_ASSOC)){
                                            $i ++;
                                            ?>
                                            <tr>
                                                <td><?php 
                                                if ($dataProd['CIP'] == '' || $dataProd['CIP'] == null) {
                                                    echo "-";
                                                }else{
                                                    echo $dataProd['CIP']; 
                                                }
                                                ?>
                                                </td> 
                                                <td><?php echo utf8_encode($dataProd['DESIGNATION']) ?></td>
                                                <td><?php 
                                                if ($dataProd['QTE_STOCK'] == '' || $dataProd['QTE_STOCK'] == null) {
                                                    echo 0;
                                                }else{
                                                    echo $dataProd['QTE_STOCK']; 
                                                }
                                                ?>
                                                </td>                                                
                                                <td>
                                                    <button class="btn btn-outline btn-primary fa fa-plus" type="button" data-toggle="modal" data-target="#myModal<?php echo $i; ?>"> Ajouter</button>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="myModal<?php echo $i;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form role="form" method="post">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    <h4 class="modal-title" id="myModalLabel">Ajout de  <?php echo $dataProd['DESIGNATION']?> </h4>
                                                                </div>
                                                                <form role="form" method="post">
                                                                <div class="modal-body">

                                                                    <div class="form-group col-lg-6">
                                                                        <label for="payante" class="control-label">Quantite payante</label>
                                                                        <input type="number" class="form-control" id="payante" name="qte_payante" placeholder="Quantite payante" required>
                                                                    </div>

                                                                    <div class="form-group col-lg-6">
                                                                        <label for="gratuite" class="control-label">Quantite gratuite</label>
                                                                        <input type="number" class="form-control" id="gratuite" name="qte_gratuite" placeholder="Quantite gratuite" required>
                                                                    </div>

                                                                    <div class="form-group col-lg-6">
                                                                        <label for="achat_credit">Achat a credit ?</label>
                                                                        <p>
                                                                            Oui:
                                                                            <input type="radio" name="achat_credit" value=true > 
                                                                            Non:
                                                                            <input type="radio" name="achat_credit" value=false required >
                                                                        </p>

                                                                    </div>
                                                                    <div class="form-group col-lg-6">
                                                                        <label for="date_entree">Date de peremption</label>
                                                                        <input class="form-control datepicker" required readonly data-provide="datepicker"  placeholder="YYYY/MM/DD" id="dated" name="date_peremption">
                                                                    </div>

                                                                    <input type="text" class="hidden" name="i" value="<?php echo $i ?>">
                                                                    <input type="text" class="hidden" name="code_produit" value="<?php echo $dataProd['CODE_PRODUIT'] ?>"> 

                                                                </div>
                                                                
                                                                <div class="row"></div>
                                                                
                                                                <div class="modal-footer">
                                                                    <button type="submit" id="submit" name="envoi" class="btn-lg btn-success fa fa-send"> Envoyer</button>
                                                                </div>
                                                                <!--end Form-->
                                                                </form>
                                                            </div>
                                                                    
                                                        </div>
                                                                
                                                    </div>

                                                </td>
                                            </tr>
                                        <?php } ?>

                                        </tbody>
                                    </table>

                                </div>

                                <div class="panel-footer">
                                    <a type="button" class="btn btn-default fa fa-hand-o-left" data-toggle="tab" href="#tab1"> Precedent</a>
                                    <a type="button" class="btn btn-primary fa fa-hand-o-right" data-toggle="tab" href="#tab3"> Suivant</a>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade in active" id="tab3">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <B>  <h3> Liste des produits en entrance </h3></B>
                                </div>

                                <div class="panel-body">

                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                        <thead>
                                        <tr>
                                            <th style="text-align:center">Designation</th>
                                            <th style="text-align:center">Quantite gratuite</th>
                                            <th style="text-align:center">Quantite payante</th>
                                            <th style="text-align:center">Quantite livree</th>
                                            <th style="text-align:center">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody style="text-align:center">
                                        <?php
                                        foreach($_SESSION['tabEntrant'] as $prod){
                                            ?>
                                                <tr>
                                                    <td><?php echo $prod['designation'] ?></td>
                                                    <td><?php echo $prod['qte_payante'] ?></td>
                                                    <td><?php echo $prod['qte_gratuite'] ?></td>
                                                    <td><?php echo $prod['qte_totale'] ?></td>
                                                    <td class="center">
                                                        <form role="form" method="post">
                                                            <button type="submit" name="retire" value="<?php echo $prod['code_produit'] ?>" class="btn btn-outline btn-danger fa fa-times"> Retirer</button>
                                                        </form>
                                                    </td>
                                                </tr>

                                        <?php } ?>

                                        </tbody>
                                    </table>

                                    <form role="form" method="post">
                                        <?php
                                            if (isset($_SESSION['infosFourn']) && $_SESSION['infosFourn']!=array()) {
                                                echo '<button type="submit" name="valider" class="btn btn-success col-md-3 col-md-offset-8" data-toggle="tab1"> VALIDER</button>';
                                            }else{
                                                echo '<div class="alert alert-warning alert-dismissable">
                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                        Vous n\'avez pas renseigné les informations du fournisseur de l\'entrée! 
                                                    </div>';
                                            }
                                        ?>
                                        
                                    </form>
                                </div>

                                <div class="panel-footer">
                                    <a type="button" class="btn btn-default fa fa-hand-o-left" data-toggle="tab" href="#tab2"> Precedent</a>
                                </div>
                            </div>

                        </div>
                </div>

                <?php }else{?>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">Infos Entree</a>
                    </li>
                    <li><a href="#tab2" data-toggle="tab">Infos Produit(s)</a>
                    </li>
                    <li><a href="#tab3" data-toggle="tab">Validation</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab1">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <B>  <h3> Informations du fournisseur de l'entree </h3></B>
                            </div>

                            <div class="panel-body">
                                <form role="form" method="post">
                                    <div class="form-group col-lg-6">
                                        <label for="fournisseur">Fournisseur</label>
                                        <select class="form-control" name="code_fournisseur" required>
                                            <option value="">++FOURNISSEUR++</option>

                                            <?php
                                            while($dataFourn = $reqFourn->fetch(PDO::FETCH_ASSOC)){
                                                echo '<option value="'.$dataFourn['CODE_FOURNISSEUR'].'">'.$dataFourn['RAISON_SOCIAL'].'</option>';
                                            }?>

                                        </select>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label for="date_entree">Date d'entree</label>
                                        <input class="form-control datepicker" required readonly data-provide="datepicker" id="dated" name="date_entree"  value="<?php echo date('Y/m/d');  ?>">
                                    </div>
                                    <div class="form-group col-lg-6 col-xm-2">
                                        <label for="facture">Numero facture</label>
                                        <input type="text" required class="form-control" name="numero_facture">
                                    </div>
                                    <div class="form-group col-lg-6 col-xm-2">
                                        <label for="bordereau">Numero de bordereau</label>
                                        <input type="text" class="form-control" name="numero_bordereau">
                                    </div>
                                    <button type="reset" name="cancelFourn" class="btn btn-default col-md-3 col-md-offset-1"> Annuler</button>
                                    <button type="submit" name="envoiFourn" class="btn btn-success col-md-3 col-md-offset-4"> Enregistrer</button>
                                </form>
                            </div>
                                
                            <div class="panel-footer">
                                <a type="button" class="btn btn-primary fa fa-hand-o-right" data-toggle="tab" href="#tab2"> Suivant</a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="tab2">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <B>  <h3>Selection des Produit(s) entrant(s) </h3></B>
                            </div>

                            <div class="panel-body">

                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center">Code CIP</th>
                                        <th style="text-align:center">Designation</th>
                                        <th style="text-align:center">Quantite</th>
                                        <th style="text-align:center">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center">
                                    <?php
                                    $i = 0;
                                    while($dataProd = $reqProd->fetch(PDO::FETCH_ASSOC)){
                                        $i ++;
                                        ?>
                                        <tr>
                                            <td><?php 
                                            if ($dataProd['CIP'] == '' || $dataProd['CIP'] == null) {
                                                echo "-";
                                            }else{
                                                echo $dataProd['CIP']; 
                                            }
                                            ?>
                                            </td> 
                                            <td><?php echo utf8_encode($dataProd['DESIGNATION']) ?></td>
                                            <td><?php 
                                            if ($dataProd['QTE_STOCK'] == '' || $dataProd['QTE_STOCK'] == null) {
                                                echo 0;
                                            }else{
                                                echo $dataProd['QTE_STOCK']; 
                                            }
                                            ?>
                                            </td>  
                                            <td>
                                                <button class="btn btn-outline btn-primary fa fa-plus" type="button" data-toggle="modal" data-target="#myModal<?php echo $i; ?>"> Ajouter</button>

                                                <!-- Modal -->
                                                    <div class="modal fade" id="myModal<?php echo $i;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form role="form" method="post">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    <h4 class="modal-title" id="myModalLabel">Ajout de  <?php echo $dataProd['DESIGNATION']?> </h4>
                                                                </div>
                                                                <form role="form" method="post">
                                                                <div class="modal-body">

                                                                    <div class="form-group col-lg-6">
                                                                        <label for="payante" class="control-label">Quantite payante</label>
                                                                        <input type="number" class="form-control" id="payante" name="qte_payante" placeholder="Quantite payante" required>
                                                                    </div>

                                                                    <div class="form-group col-lg-6">
                                                                        <label for="gratuite" class="control-label">Quantite gratuite</label>
                                                                        <input type="number" class="form-control" id="gratuite" name="qte_gratuite" placeholder="Quantite gratuite" required>
                                                                    </div>

                                                                    <div class="form-group col-lg-6">
                                                                        <label for="achat_credit">Achat a credit ?</label>
                                                                        <p>
                                                                            Oui:
                                                                            <input type="radio" name="achat_credit" value=true > 
                                                                            Non:
                                                                            <input type="radio" name="achat_credit" value=false required >
                                                                        </p>

                                                                    </div>
                                                                    <div class="form-group col-lg-6">
                                                                        <label for="date_entree">Date de peremption</label>
                                                                        <input class="form-control datepicker" required readonly data-provide="datepicker" value="<?php echo date('Y/m/d');  ?>" id="dated" name="date_peremption">
                                                                    </div>

                                                                    <input type="text" class="hidden" name="i" value="<?php echo $i ?>">
                                                                    <input type="text" class="hidden" name="code_produit" value="<?php echo $dataProd['CODE_PRODUIT'] ?>">

                                                                </div>
                                                                
                                                                <div class="modal-footer">
                                                                    <button type="submit" id="submit" name="envoi" class="btn-lg btn-success fa fa-send"> Envoyer</button>
                                                                </div>
                                                                <!--end Form-->
                                                                </form>
                                                            </div>
                                                                    
                                                        </div>
                                                                
                                                    </div>
                                                <!-- /.modal -->


                                            </td>
                                        </tr>
                                    <?php } ?>

                                    </tbody>
                                </table>

                            </div>

                            <div class="panel-footer">
                                <a type="button" class="btn btn-default fa fa-hand-o-left" data-toggle="tab" href="#tab1"> Precedent</a>
                                <a type="button" class="btn btn-primary fa fa-hand-o-right" data-toggle="tab" href="#tab3"> Suivant</a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="tab3">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <B>  <h3> Liste des produits en entrance </h3></B>
                            </div>

                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center">Designation</th>
                                        <th style="text-align:center">Quantite gratuite</th>
                                        <th style="text-align:center">Quantite payante</th>
                                        <th style="text-align:center">Quantite livree</th>
                                        <th style="text-align:center">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center">
                                        <tr>

                                        </tr>

                                    </tbody>
                                </table>

                            </div>

                            <div class="panel-footer">
                                <a type="button" class="btn btn-default fa fa-hand-o-left" data-toggle="tab" href="#tab2"> Precedent</a>
                            </div>
                        </div>

                    </div>

                </div>

                <?php } ?>


            <!-- Tab panes -->

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>