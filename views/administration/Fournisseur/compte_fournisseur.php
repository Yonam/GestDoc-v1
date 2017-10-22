<?php 
    $produits = $bdd->query('SELECT designation,nom_forme,code_cip,dci FROM produit P JOIN forme F WHERE F.code_forme = P.code_forme');
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Liste des comptes fournisseurs</h1>
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
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Raison sociale</th>
                                        <th>Date</th>
                                        <th>Telephone 1</th>
                                        <th>Email</th>
                                        <th>Dette</th>
                                        <th>Etat</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php while ($donnees = $produits->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['code_cip']; ?></td>
                                        <td><?php echo $donnees['designation']; ?></td>
                                        <td><?php echo $donnees['dci']; ?></td>
                                        <td class="center"><?php echo $donnees['nom_forme']; ?></td>
                                        <td><?php echo $donnees['code_cip']; ?></td>
                                        <td>Regle</td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-gear" href="#">Modifier</a>
                                            <a class="btn btn-outline btn-success fa fa-times" href="#">Supp</a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#">Regler</a>
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


