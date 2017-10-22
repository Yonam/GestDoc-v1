<?php 

global $bdd;






if (isset($_GET['liste'])) {
  $encaissement->liste($_GET['liste']);
}

/*var_dump($_POST);*/

$reqt=$bdd->query("SELECT CODE_JOURNEE FROM journee WHERE statut = 0");
    $domas=$reqt->fetch();
    $final = 0;
    if ($domas == false) {
        echo '<meta http-equiv="refresh" content="0;URL=?page=interdit">';
    }else{
        if ($domas->CODE_JOURNEE != 0) { 
            $final=$domas->CODE_JOURNEE;


              $bdd->beginTransaction();
                $vente= $bdd->prepare("SELECT V.DATE_VENTE, V.HEURE_VENTE,U.NOM_USER, U.PRENOM_USER, V.CODE_VENTE, V.STATUT, V.CODE_ENCAISSEMENT, E.CODE_USER, U1.NOM_USER NOM_ENCAISSEUR, U1.PRENOM_USER PRENOM_ENCAISSEUR, M.MONTANT MONTANT FROM vente V JOIN utilisateur U ON V.CODE_USER = U.CODE_USER JOIN encaissement E ON V.CODE_ENCAISSEMENT = E.CODE_ENCAISSEMENT JOIN utilisateur U1 ON E.CODE_USER = U1.CODE_user JOIN mode_payement M ON E.CODE_PAYEMENT = M.CODE_PAYEMENT WHERE V.CODE_ENCAISSEMENT IS NOT NULL");
                $vente->execute();
            $bdd->commit(); 
?>


           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Liste des tickets de caisse de la journee </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th style="text-align:center">Date et Heure</th>
                                        <th style="text-align:center">Vendeur</th>
                                        <th style="text-align:center">Montant</th>
                                        <th style="text-align:center">Statut</th>
                                        <th style="text-align:center">Action</th>
                                    </tr>
                                <tbody>
                               <?php foreach ($vente as $d) { ?>
                                    <tr class="odd gradeX">
                                        <td style="text-align:center"><?php echo $d->DATE_VENTE.' '.$d->HEURE_VENTE; ?></td>
                                        <td style="text-align:center"><?php echo $d->PRENOM_USER.' '.$d->NOM_USER; ?></td>
                                        <td style="text-align:center"><?php echo $d->MONTANT; ?></td>
                                        <td style="text-align:center">
                                            <?php if ($d->CODE_ENCAISSEMENT) {
                                                echo "Encaisse par ".$d->NOM_ENCAISSEUR." ".$d->PRENOM_ENCAISSEUR;
                                            }else {
                                                echo "Annule par ".$d->NOM_ENCAISSEUR." ".$d->PRENOM_ENCAISSEUR;
                                                } ?>
                                       
                                        </td>
                                        <td style="text-align:center"> <a class="btn btn-primary fa fa-print"> Re-imprimer le ticket</a></td>

                                        <!-- <form method="post" name="annuler" action=""> -->
                                            <!-- <input type="text" name="vente" value="<?= $d->CODE_VENTE; ?>"> -->
                                            
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


            

            