<?php 
    global $bdd;

    if (isset($_POST['encaisserCli']) && $_POST['montant']!="") {
        
        $reste = $_POST['soldeMaj']-$_POST['montant'];

        $sqlOpFourn = "insert into operation_fournisseur (code_fournisseur, code_user, solde_maj_compte, montant_maj_compte, reste_maj_compte, date_maj_compte) values (".$_POST['codeFourn'].",".$_SESSION['Auth']->code_user.",".$_POST['soldeMaj'].",".$_POST['montant'].",".$reste.", now())";
        $sqlMajFourn = "update fournisseur set solde_compte = ".$reste." where code_fournisseur = ".$_POST['codeFourn'];

        $reqOpFourn = $bdd->query($sqlOpFourn);
        $reqMajFourn = $bdd->query($sqlMajFourn);


        echo '<div class="alert alert-success alert-dismissable col-lg-8 col-lg-offset-2">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Règlement effectué avec succès. 
            </div>';
    }

    $fournisseurs = $bdd->prepare('SELECT * FROM fournisseur');
    $fournisseurs->execute();
    $data=$fournisseurs->fetchAll();
    $four=array();

?>

            <div class="row">
                <div class="col-lg-12">
                    <!-- <h1 class="page-header"> Page a revoir - doit retracer l'historique des regularisations de comptes</h1> -->
                    <h1 class="page-header"> Compte Fournisseur</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Liste des comptes fournisseurs
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Raison sociale</th>
                                        <th>Telephone 1</th>
                                        <th>Email</th>
                                        <th>Dette</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php foreach ($data as $d){?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $d->RAISON_SOCIAL; ?></td>
                                        <td><?php echo $d->TEL; ?></td>
                                        <td><?php echo $d->EMAIL; ?></td>
                                        <td class="center"><?php echo $d->SOLDE_COMPTE; ?></td>
                                        <td class="center">


                                            <button class="btn btn-outline btn-default fa fa-history" type="button" data-toggle="modal" data-target="#myModalHist<?= $d->CODE_FOURNISSEUR; ?>" > Historique</button>
                                            
                                            <div class="modal fade" id="myModalHist<?= $d->CODE_FOURNISSEUR; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <form method="post" action="">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="myModalLabel">Liste des mouvements du fournisseur <?= $d->RAISON_SOCIAL ?>  </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <?php
                                                            $opCompte = 'SELECT * FROM operation_fournisseur where code_fournisseur ='.$d->CODE_FOURNISSEUR.' order by code_operation desc'; 
                                                            $opCompte = $bdd->query($opCompte);
                                                            $liste = $opCompte->fetchAll();
                                                            // var_dump($liste);

                                                            ?>
                                                        
                                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                                                    <?php if(isset($liste) && $liste ==true){ ?>  
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="text-align:center">Date</th>
                                                                                <th style="text-align:center">Solde</th>
                                                                                <th style="text-align:center">Montant versé</th>
                                                                                <th style="text-align:center">Restant à payer</th>
                                                                            </tr>
                                                                        </thead>

                                                                        <tbody>
                                                                            <tr>
                                                                            <?php
                                                                                $total = 0;
                                                                             foreach ($liste as $l) { ?>

                                                    
                                                                                <td style="text-align:center"><?=$l->DATE_MAJ_COMPTE;?></td>
                                                                                <td style="text-align:center"><?=$l->SOLDE_MAJ_COMPTE;?></td>
                                                                                <td style="text-align:center"><?=$l->MONTANT_MAJ_COMPTE;?></td>
                                                                                <td style="text-align:center"><?=$l->RESTE_MAJ_COMPTE;?></td>

                                                                            </tr>
                                                                            <?php  } } else{?>
                                                                                <br />
                                                                                <center class="ui-state-highlight ui-corner-all">Aucun opération n'a été faite pour l'instant ...</center>
                                                                            <?php } ?>

                                                                        </tbody>
                                                                    </table>
                                                       </div>
                                                        <div class="modal-footer">
                                                            
                                                            <button type="button" class="btn btn-danger fa fa-close" data-dismiss="modal"> Fermer</button>
                                                        </div>
                                                    </div>
                                                    </form>
                                                    <!-- /.modal-content -->
                                                </div>
                                            </div>



                                            <button class="btn btn-outline btn-primary  fa fa-money" type="button" data-toggle="modal" data-target="#myModal<?= $d->CODE_FOURNISSEUR; ?>"
                                            <?php
                                                if ($d->SOLDE_COMPTE <= 0) {
                                                    echo "disabled";
                                                }
                                            ?>
                                             > Encaisser</button>

                                            <div class="modal fade" id="myModal<?= $d->CODE_FOURNISSEUR; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <form method="post" action="">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Encaissement pour le compte de <?= $d->RAISON_SOCIAL?>  </h4>

                                                    </div>
                                                    <div class="modal-body">
                                                        
                                                       <div class="form-group col-lg-12">
                                                            <label for="montant">Montant versé</label>
                                                            <input type="number" required class="form-control" id="montant" name="montant">
                                                        </div>

                                                        <div class="row">   
                                                            

                                                        </div>
                                                    </div>
                                                    
                                                    <div class="modal-footer">
                                                        <input type="text" name="soldeMaj" hidden value="<?php if(isset($d)){ echo $d->SOLDE_COMPTE;} ?>">
                                                        <input type="text" name="codeFourn" hidden value="<?php if(isset($d)){ echo $d->CODE_FOURNISSEUR;} ?>">
                                                        <button type="submit" class="btn btn-success fa fa-money" name="encaisserCli"> Encaisser</button>
                                                        <button type="button" class="btn btn-danger fa fa-close" data-dismiss="modal"> Fermer</button> 

                                                    </div>
                                                    
                                                </div>
                                                </form>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                            </div>


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


