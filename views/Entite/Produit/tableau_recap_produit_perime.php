<?php 
    $produits = $bdd->query('SELECT designation,nom_forme,code_cip,dci FROM produit P JOIN forme F WHERE F.code_forme = P.code_forme');
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Historique des produiuts</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         <div class="col-lg-8 col-lg-push-2">
                                <button type="imprimer" class="btn btn-success col-lg-3" name="imprimer">Imprimer</button>
                                <button type="exporter" class="btn btn-danger col-lg-3 col-lg-push-1" name="exporter">Exporter</button>
                                    </div>
                            Liste des produiuts perimes
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
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <?php while ($donnees = $produits->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['code_cip']; ?></td>
                                        <td><?php echo $donnees['designation']; ?></td>
                                        <td><?php echo $donnees['dci']; ?></td>
                                        <td><?php echo $donnees['dci']; ?></td>
                                        <td class="center"><?php echo $donnees['nom_forme']; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-gear" href=""></a>
                                            <a class="btn btn-outline btn-success fa fa-times" href="#"></a>
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

