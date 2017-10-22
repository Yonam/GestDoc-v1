<?php
global $bdd;
$sql="SELECT
C.TITRE,
C.NOM_CLI,
C.PRENOM_CLI,
C.DROIT_CREDIT,
C.CREDIT_MAX,
C.DELAI_PAIEMENT,
C.REMISE,
C.TOTAL_DU,
C.DEPASSEMENT,
O.SOLDE,
C.CODE_CLI
FROM client  AS C INNER JOIN operationcompte AS O ON O.CODE_CLI=O.CODE_CLI";
$req= $bdd->query($sql);
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">COMPTE CLIENT</h1>
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
                            <B>  <h3> Liste des comptes clients </h3></B>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Titre</th>
                                        <th>Nom</th>
                                        <th>Credit Max</th>
                                        <th>Delai</th>
                                        <th>Remise</th>
                                        <th>Solde</th>
                                        <th>Depassement</th>
                                    </tr>
                                <tbody>
                               <?php 
                                 $total = 0;
                                
                               while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){ 
                                   
                                ?>
                              
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['TITRE']; ?></td>
                                        <td><?php echo $donnees['NOM_CLI']; ?>
                                        <?php echo $donnees['PRENOM_CLI']; ?></td>
                                        <td><?php echo $donnees['CREDIT_MAX']; ?> FCFA</td>
                                        <td><?php echo $donnees['DELAI_PAIEMENT']; ?></td>
                                        <td><?php echo $donnees['REMISE']; ?></td>
                                        <td><?php echo $donnees['SOLDE']; ?></td>
                                        <td>

                                            <?php  
                                             $nb= $donnees['SOLDE'];
                                             $np=$donnees['CREDIT_MAX'];
                                            //var_dump($np);

                                             if ($nb>$np) {
                                            $total=$nb-$np;
                                            echo$total;
                                        } else {
                                                    $total=0;
                                                    echo $total;
                                                    } ?></td>
                                       
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

