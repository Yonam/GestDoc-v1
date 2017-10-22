<?php 
    $produits = $bdd->query('SELECT DESIGNATION,NOM_FORME,CIP,DCI FROM produit P JOIN forme F WHERE F.CODE_FORME = P.CODE_FORME');
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Historique de caisse de la journee</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Historique de caisse de la journee
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>Utilisateur</th>
                                        <th>Identifiant</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php while ($donnees = $produits->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['CIP']; ?></td>
                                        <td><?php echo $donnees['DESIGNATION']; ?></td>
                                        <td><?php echo $donnees['DCI']; ?></td>
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

