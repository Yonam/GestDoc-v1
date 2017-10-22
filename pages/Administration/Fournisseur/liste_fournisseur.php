<?php
global $bdd;
$fournisseur= $bdd->prepare('SELECT * FROM fournisseur where fournisseur.deleted = 0');
$fournisseur->execute();
$data=$fournisseur->fetchAll();
$four=array();
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">LISTE FOURNISSEURS</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-outline btn-primary fa fa-print" href="#"> IMPRIMER</a>
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a>
                            <a class="btn btn-outline btn-warning fa fa-plus" href="?page=ajout_fournisseur"> NOUVEAU</a>
                            <B>  <h3> Liste des fournisseurs pharmceutiques partenaires </h3></B>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Raison sociale</th>
                                        <th>Personne Contact </th>
                                        <th>Adresse</th>
                                        <th>Telephone </th>
                                        <th>Email</th>
                                        <th>Solde</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php foreach ($data as $d){?>

                                    <tr class="odd gradeX">
                                        <td><?php echo $d->RAISON_SOCIAL; ?></td>
                                        <td><?php echo $d->CONCTACT; ?></td>
                                        <td><?php echo $d->ADRESSE; ?></td>
                                        <td><?php echo $d->TEL; ?></td>
                                        <td><?php echo $d->EMAIL; ?></td>
                                        <td class="center"><?php echo $d->SOLDE_COMPTE; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-success fa fa-edit" href="?page=update_fournisseur&amp;id=<?php echo $d->CODE_FOURNISSEUR; ?>"> Mod</a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="pages/administration/Fournisseur/script_delete_fournisseur.php?id=<?php echo $d->CODE_FOURNISSEUR; ?>" onclick = "if (! confirm('Confirmer la suppression?')) return false;"> Sup</a>
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


