<?php
     $ticket= $bdd->query('SELECT
J.CODE_JOURNEE,
J.`DATE`,
J.DATE_FERMETURE,
U.LOGIN,
J.STATUT,
V.CODE_VENTE
FROM
vente AS V inner Join
 encaissement  AS E  ON V.CODE_VENTE=E.CODE_VENTE
Inner Join journee AS J  ON E.CODE_JOURNEE=J.CODE_JOURNEE left JOIN  utilisateur AS U ON J.CODE_USER_OUVRIR = U.CODE_USER 
 where J.DATE_FERMETURE is not null 
ORDER BY J.CODE_JOURNEE  DESC

');
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Tickets a l'arret de caisse</h1>
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
                              <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                       <th>Date arrêt</th>
                                        <th>Id vente</th>
                                        <th>Responsable ouverture</th>
                                        <th>Responsable fermeture</th>
                                      <!--   <th>Action</th> -->
                                    </tr>
                                <tbody>
                               <?php while ($donnees = $ticket->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <tr class="odd gradeX">
                                        <td><?php echo $donnees->DATE_FERMETURE; ; ?></td>
                                        <td><?php echo $donnees->CODE_VENTE; ?>
                                        <td><?php echo $donnees->LOGIN;  ?></td>
                                        <td><?php echo $donnees->LOGIN; ; ?></td>
                                    </tr>
                                        <!-- <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#"> Pay</a>
                                            <a class="btn btn-outline btn-success fa fa-edit" href="#"> Mod</a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a>
                                        </td> -->
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


