<?php 
    $ventes = $bdd->query('SELECT J.DATE_OUVERTURE,U.LOGIN,V.CODE_VENTE, E.CODE_ENCAISSEMENT, M.MONTANT, V.STATUT FROM journee J JOIN vente V ON V.CODE_JOURNEE=J.CODE_JOURNEE JOIN utilisateur U ON V.CODE_USER=U.CODE_USER LEFT JOIN encaissement E ON V.CODE_ENCAISSEMENT = E.CODE_ENCAISSEMENT LEFT JOIN mode_payement M ON E.CODE_PAYEMENT = M.CODE_PAYEMENT');

    $sorties = $bdd->query('SELECT NOM_USER, PRENOM_USER , MONTANT_SORTIE_CAISSE, DATE_SORTIE_CAISSE, MOTIF_SORTIE_CAISSE, DEMANDEUR FROM sortie_caisse S JOIN utilisateur U on S.CODE_USER = U.CODE_USER');
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Historique de caisse </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Historique de caisse  de total 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Journee de caisse</th>
                                        <th>Type</th>
                                        <th>Montant</th>
                                        <th>Utilisateur</th>
                                        <th>Etat</th>
                                        <th>Actions</th>
                                        <!-- <th>Action</th> -->
                                    </tr>
                                <tbody>
                               <?php 
                               $total = 0;
                               while ($donnees = $ventes->fetch()){ 
                                ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees->DATE_OUVERTURE; ?></td>
                                        <td><?php echo "Vente ".$donnees->CODE_VENTE; ?></td>
                                        <td><?php echo $donnees->MONTANT; ?></td>
                                        <td><?php echo $donnees->LOGIN; ?></td>
                                        <td><?php if ($donnees->STATUT==0) {
                                            echo "en attente";
                                        } else { echo "encaisse";} ?></td>
                                         <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-gear" href="#"> Modifier</a>
                                            <a class="btn btn-outline btn-danger fa fa-times" href="#"> Supprimer</a>
                                        </td> 
                                    </tr>
                                <?php 
                                $total += $donnees->MONTANT;
                                } ?>

                                <div style="padding: 2em; font-size: 20px;">Le montant des venntes s'eleve a <?= $total ?> </div>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>





            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Historique des sorties de caisse </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Historique de sorties 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Date de la sortie</th>
                                        <th>Administrateur</th>
                                        <th>Montant</th>
                                        <th>Motif</th>
                                        <th>Demandeur</th>
                                        <!-- <th>Action</th> -->



                                    </tr>
                                <tbody>
                               <?php while ($donnees = $sorties->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees->DATE_SORTIE_CAISSE; ?></td>
                                        <td><?php echo $donnees->NOM_USER." ".$donnees->PRENOM_USER; ?></td>
                                        <td><?php echo $donnees->MONTANT_SORTIE_CAISSE; ?></td>
                                        <td><?php echo $donnees->MOTIF_SORTIE_CAISSE; ?></td>
                                        <td><?php echo $donnees->DEMANDEUR; ?></td>
                                        <!-- <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-gear" href="#"></a>
                                            <a class="btn btn-outline btn-success fa fa-times" href="#"></a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"></a>
                                        </td> -->
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

