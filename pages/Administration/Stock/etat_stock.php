<?php 
    $stock = $bdd->query('SELECT p.cip,p.designation,p.dci,p.qte_stock,NOM_FORME,NOM_FAMILLE FROM produit p JOIN forme f ON p.CODE_FORME = f.CODE_FORME JOIN famille_produit fp ON p.CODE_FAMILLE = fp.CODE_FAMILLE ORDER BY p.designation');
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Stock</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-outline btn-primary fa fa-print" href="#"> IMPRIMER</a>
                            <a class="btn btn-outline btn-danger fa fa-file" href="#"> EXPORTER</a>
                            <a class="btn btn-outline btn-success fa fa-times" href="?page=entree_stock"> ENTREE</a>
                            <a class="btn btn-outline btn-warning fa fa-times" href="?page=mise_rebus"> SORTIE</a>
                            <B>  <h3> Liste des produits en stock </h3></B>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" style="text-align:center" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th style="text-align:center">Designation</th>
                                        <th style="text-align:center">Categorie</th>
                                        <th style="text-align:center">Forme</th>
                                        <th style="text-align:center">Quantite en stock</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align:center">
                               <?php while ($donnees = $stock->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">

                                        <td><?php echo $donnees['designation']; ?></td>
                                        <td><?php echo $donnees['NOM_FAMILLE']; ?></td>
                                        <td><?php echo $donnees['NOM_FORME']; ?></td>
                                        <td class="center"><?php 
                                        if ($donnees['qte_stock'] == '' || $donnees['qte_stock'] == null) {
                                            echo 0;
                                        }else{
                                            echo $donnees['qte_stock']; 
                                        }
                                        ?>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>

                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>


