<?php 
global $bdd;
$clients= $bdd->prepare('SELECT CODE_CLI, TITRE, NOM_CLI, PRENOM_CLI, EMAIL, ADRESSE, TEL1, TEL2, STATUT,TOTAL_DU, CREDIT_MAX, DELAI_PAIEMENT, REMISE, DROIT_CREDIT, DEPASSEMENT FROM client where client.DELETE = 0');
$clients->execute();
$data=$clients->fetchAll();
$four=array();


if (isset($_SERVER['HTTP_REFERER'])) {
    if (strstr($_SERVER['HTTP_REFERER'], 'script_update_client.php')) {
    echo '<div class="alert alert-success alert-dismissable col-lg-8 col-lg-offset-1 pull-center">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Modification effectuée avec succès! 
        </div>';
    }
}


?>


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">LISTE CLIENTS</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <?php echo '<a class="btn btn-outline btn-primary fa fa-print"  href="?page=etat_liste_client"' ?>> IMPRIMER</a>
                            <!-- <a class="btn btn-outline btn-primary fa fa-print" href="#"> IMPRIMER</a> -->
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a>
                            <a class="btn btn-outline btn-warning fa fa-plus" href="?page=ajout_client"> NOUVEAU</a>
                            <B>  <h3> Information sur les clients </h3></B>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Nom & prénom(s)</th>
                                        <th>Telephone</th>
                                        <th>Email</th>
                                        <th>Credit</th>
                                        <th>Statut</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php 
                               $i = 0;
                               foreach ($data as $d){ 
                                $i++;
                                ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $d->CODE_CLI; ?></td>
                                        <td><?php echo $d->TITRE." ".$d->NOM_CLI." ".$d->PRENOM_CLI; ?></td>
                                        <td><?php echo $d->TEL1; ?></td>
                                        <td><?php echo $d->EMAIL; ?></td>
                                        <td><?php echo $d->TOTAL_DU."FCFA"; ?></td>
                                        <td class="center"><?php if($d->STATUT==0){echo "En regle";} else{echo "Credit";} ?></td>
                                        <td class="center">
                                            <a type="button" id="" class="btn btn-primary fa fa-edit" href="?page=update_client&amp;id=<?php echo $d->CODE_CLI; ?>"> Mod</a>
                                            

                                        <button class="btn btn-outline btn-success fa fa-eye" type="button" data-toggle="modal" data-target="#myModal<?php echo $i;?>"> Aff</button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal<?php echo $i;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Informations générales de <?php echo $d->NOM_CLI.' '.$d->PRENOM_CLI ?> </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                                            
                                                            <thead>
                                                            <!-- <tr>
                                                                <th style="text-align:center">Attribut</th>
                                                                <th style="text-align:center">Valeur</th>
                                                                
                                                            </tr> -->
                                                            </thead>
                                                            <tbody style="text-align:center">
                                                                <tr>
                                                                <td>CODE</td>
                                                                <td><?php echo $d->CODE_CLI ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>NOM</td>
                                                                <td><?php echo $d->NOM_CLI ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>PRENOM(S)</td>
                                                                <td><?php echo $d->PRENOM_CLI ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>TELEPHONE 1</td>
                                                                <td><?php echo $d->TEL1 ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>TELEPHONE 2</td>
                                                                <td><?php echo $d->TEL2 ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>EMAIL</td>
                                                                <td><?php echo $d->EMAIL ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>TOTAL DU</td>
                                                                <td><?php echo $d->TOTAL_DU."FCFA" ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>DROIT AU CREDIT ?</td>
                                                                <td><?php echo $d->DROIT_CREDIT == 1? "Oui": "Non" ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>CREDIT MAXIMUM</td>
                                                                <td><?php echo $d->CREDIT_MAX."FCFA" ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>REMISE</td>
                                                                <td><?php echo $d->REMISE."%" ?></td>
                                                                </tr>

                                                                <tr>
                                                                <td>DEPASSEMENT</td>
                                                                <td><?php echo $d->DEPASSEMENT."%" ?></td>
                                                                </tr>
                                                                
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <a type="button" class="btn btn-primary fa fa-print " <?php echo 'href="?page=etat_client&sql=SELECT * FROM `client` p WHERE p.code_cli =\''.$d->CODE_CLI.'\' "' ?>>Imprimer</a>
                                                        <!-- <a type="button" class="btn btn-primary fa fa-print" href="#">Imprimer</a> -->
                                                        <button type="button" class="btn btn-danger fa fa-close" data-dismiss="modal">Fermer</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->


                                        <button class="btn btn-outline btn-danger fa fa-trash-o" type="button" data-toggle="modal" data-target="#myModalSupr<?php echo $i;?>"> Sup</button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModalSupr<?php echo $i;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog panel panel-red">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Suppression de <?php echo $d->NOM_CLI.' '.$d->PRENOM_CLI ?> </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                    <p>
                                                        VOULEZ VOUS VRAIMENT SUPPRIMER CE CLIENT?
                                                    </p>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <a type="button" class="btn btn-danger fa fa-trash-o" href="pages/administration/Client/script_delete_client.php?id=<?php echo $d->CODE_CLI; ?>">Oui</a>
                                                        <button type="button" class="btn btn-default fa fa-close" data-dismiss="modal">Non</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->


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


