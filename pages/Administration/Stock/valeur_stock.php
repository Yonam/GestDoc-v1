<?php
$stock = $bdd->query('SELECT cip,designation,dci,prix_produit,qte_stock,(qte_stock * prix_produit) as montant_stock FROM produit p');
$total=0;
$cout=0;
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">VALEUR STOCK </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <!-- <a class="btn btn-outline btn-primary fa fa-print" href="#"> IMPRIMER</a>
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a> -->
                           <B>  <h3>Valeur du stock de la date du <?php echo $datetime = date("d-m-Y")?> </h3></B>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th style="text-align:center">Designation</th>
                                        <th style="text-align:center">Prix unitaire</th>
                                        <th style="text-align:center">Quantite en stock</th>
                                        <th style="text-align:center">Total</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align:center">
                               <?php while ($donnees = $stock->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">

                                        <td><?php echo $donnees['designation']; ?></td>
                                        <td><?php echo $donnees['prix_produit']; ?></td>

                                        <td><?php 
                                        if ($donnees['qte_stock'] == '' || $donnees['qte_stock'] == null) {
                                            echo 0;
                                        }else{
                                            echo $donnees['qte_stock']; 
                                        }
                                        ?>
                                        </td>

                                        <td class="center"><?php 
                                        if ($donnees['montant_stock'] == '' || $donnees['montant_stock'] == null) {
                                            echo 0;
                                        }else{
                                            echo $donnees['montant_stock']; 
                                        }
                                        ?>
                                        </td>

                                    </tr>
                                <?php $total+=$donnees['montant_stock'];
                               }
                               ?>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th  style="text-align:center" colspan="3" class="col_num">Total</th>
                                    <th  style="text-align:center" colspan="1" class="col_num"><?php echo $total; ?></th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>


