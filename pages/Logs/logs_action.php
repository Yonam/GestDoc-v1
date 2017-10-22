<?php 
    global $bdd;
    $log = $bdd->prepare('SELECT * FROM logs');
    $log->execute();
    $data=$log->fetchAll();
    $logs=array()
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">EVENEMENTS| Page en developpement</h1>
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
                            <B>  <h3>  Logs systemes -- suivi des actions utilisateurs </h3></B>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Date et heure</th>
                                        <th>Utilisateur</th>
                                        <th>Evenement</th>
                                        <th>statut</th>
                                    </tr>
                                <tbody>
                               <?php foreach ($data as $d){?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $d->HEURE; ?></td>
                                        <td><?php echo $d->LOGIN; ?></td>
                                        <td><?php echo $d->EVENEMENT; ?></td>
                                        <td class="center"><?php echo $d->STATUT; ?></td>
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

