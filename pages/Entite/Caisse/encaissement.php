<?php 

global $bdd;

$bdd->beginTransaction();
    $vente= $bdd->prepare('SELECT V.DATE_VENTE, V.HEURE_VENTE,U.NOM_USER, U.PRENOM_USER, V.CODE_VENTE, V.STATUT  FROM vente V JOIN utilisateur U ON V.CODE_USER = U.CODE_USER WHERE V.STATUT = 0');
    $vente->execute();
$bdd->commit();

if (isset($_GET['liste'])) {
  $encaissement->liste($_GET['liste']);
}


$reqt=$bdd->query("SELECT CODE_JOURNEE FROM journee WHERE statut = 0");
    $domas=$reqt->fetch();
    $final = 0;
    if ($domas == false) {
        echo '<meta http-equiv="refresh" content="0;URL=?page=interdit">';
    }else{
        if ($domas->CODE_JOURNEE != 0) { ?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Ventes en attente d'encaissement</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Vente à encaisser
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th style="text-align:center">Date et Heure</th>
                                        <th style="text-align:center">Utilisateur</th>
                                        <th style="text-align:center">Encaissement comptoir</th>
                                        <th style="text-align:center">Autres encaissements</th>
                                        <th style="text-align:center">Action</th>
                                    </tr>
                                <tbody>
                               <?php foreach ($vente as $d) { ?>
                                    <tr class="odd gradeX">
                                        <td style="text-align:center"><?php echo $d->DATE_VENTE.' '.$d->HEURE_VENTE; ?></td>
                                        <td style="text-align:center"><?php echo $d->PRENOM_USER.' '.$d->NOM_USER; ?></td>
                                        <td style="text-align:center">
                                            <button class="btn btn-outline btn-success fa fa-money" type="button" data-toggle="modal" data-target="#myModal<?= $d->CODE_VENTE; ?>" > <?php echo "Encaisser vente ".$d->CODE_VENTE; ?></button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal<?= $d->CODE_VENTE; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <form method="post" name="encaisser" action="">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Liste des produits de la vente <?= $d->CODE_VENTE  ?>  </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <?php 
                                                        $liste = $encaissement->liste($d->CODE_VENTE);
                                                         ?>
                                                    
                                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                                                <?php if(isset($liste)){ ?>  
                                                                    <thead>
                                                                        <tr>
                                                                            <th style="text-align:center">Produit</th>
                                                                            <th style="text-align:center">Prix unitaire</th>
                                                                            <th style="text-align:center">Quantite</th>
                                                                            <th style="text-align:center">Prix total</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                        <tr>
                                                                        <?php
                                                                            $total = 0;
                                                                         foreach ($liste as $l) { ?>

                                                
                                                                            <td style="text-align:center"><?=$l->DESIGNATION;?></td>
                                                                            <td style="text-align:center"><?=$l->PRIX_PRODUIT;?></td>
                                                                            <td style="text-align:center"><?=$l->NB_VENDU;?></td>
                                                                            <td style="text-align:center"><?=$l->MONTANT_VENTE;?></td>

                                                                        </tr>
                                                                        <?php  $total+= $l->MONTANT_VENTE;} } else{?>
                                                                            <br />
                                                                            <center class="ui-state-highlight ui-corner-all">Aucun article n'a été enregistré pour l' instant ...</center>
                                                                        <?php } ?>
                                                            
                                                                        <tr>

                                                                            <td colspan="2"><h3>Cout des marchandises : </h3></td>
                                                                            <td colspan="3"><h3><?= $total; ?></h3></td>
                                                                        </tr>
                                                                    
                                                                    </tbody>
                                                                </table>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="text" name="codeVente" hidden value="<?php if(isset($d)){ echo $d->CODE_VENTE;} ?>">
                                                        <button type="submit" class="btn btn-success fa fa-money" value="<?php if(isset($total)){ echo $total; }?>
                                                            " name="encaisser"
                                                            <?php if(!isset($l)){ 
                                                                echo "disabled";
                                                            }
                                                            ?>
                                                
                                                        > Encaisser</button>
                                                        <button type="button" class="btn btn-danger fa fa-close" data-dismiss="modal"> Fermer</button>
                                                    </div>
                                                </div>
                                                <!-- </form> -->
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->
                                        </td>

                                        <!-- <form method="post" name="annuler" action=""> -->
                                            <!-- <input type="text" name="vente" value="<?= $d->CODE_VENTE; ?>"> -->
                                            <td style="text-align:center">
                                                <a class="btn btn-outline btn-primary fa fa-credit-card" href="#"
                                                <?php if(!isset($l)){ 
                                                    echo "disabled";
                                                }
                                                ?>
                                                disabled> Encaisser</a>
                                                 <!-- l'appuie du bouton doit declencher un popup pour definir le mode de paiement et les informations necessaires -->
                                            </td>
                                            <td style="text-align:center">
                                                
                                                <button type="submit" class="btn btn-outline btn-danger fa fa-times" name="annuler"> Annuler </button>
                                            </td>
                                        </form>
                                    </tr>
                                <?php   } ?>
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

        <?php 
        }
    }
     ?>


            

            