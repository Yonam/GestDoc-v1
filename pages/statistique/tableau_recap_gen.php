<?php
     $produits= $bdd->query('SELECT * FROM produit');
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Generiques des produits</h1>
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
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Code CIP</th>
                                        <th>Designation</th>
                                        <th>DCI</th>
                                        <th>Forme</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php while ($donnees = $produits->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['code_cip']; ?></td>
                                        <td><?php echo $donnees['contact']; ?></td>
                                        <td><?php echo $donnees['adresse']; ?></td>
                                        <td><?php echo $donnees['tel']; ?></td>
                                        <td><?php echo $donnees['email']; ?></td>
                                        <td class="center"><?php echo $donnees['solde_compte']; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#"> Pay</a>
                                            <a class="btn btn-outline btn-success fa fa-edit" href="#"> Mod</a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a>
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


