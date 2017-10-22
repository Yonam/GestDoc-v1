                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
/"<?php

if (isset($_SERVER['HTTP_REFERER'])) {
    if (strstr($_SERVER['HTTP_REFERER'], 'script_ajout_new.php')) {
    echo '<div class="alert alert-success alert-dismissable col-lg-8 col-lg-offset-1 pull-center">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Produit ajouté avec succès! 
        </div>';
}
}



$sqlImpr="SELECT * FROM `produit` p ORDER BY p.designation";
$sql="SELECT p.CODE_PRODUIT, p.DESIGNATION,p.SOUMIS_TVA,p.TAUX_TVA, p.DATE_COMMERCIALISATION, p.DATE_ENREGISTREMENT, p.DATE_MJ, p.QTE_STOCK, p.PRIX_PRODUIT, p.PRIX_VENTE, p.CODE_BARRE, NOM_FAMILLE, NOM_FORME, (SELECT DESIGNATION FROM produit p1 WHERE p1.CODE_PRODUIT = p.PRO_CODE_PRODUIT) AS DESIGNATION_DERIVE, NOM_LOCALISATION
FROM produit p
    JOIN famille_produit f ON p.CODE_FAMILLE = f.CODE_FAMILLE
    JOIN forme fe ON p.CODE_FORME = fe.CODE_FORME
    JOIN localisation l ON p.CODE_LOCALISATION = l.CODE_LOCALISATION";

$req = $bdd->query($sql);

if($req->rowCount() > 0){
    ?>
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">PRODUITS</h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <!-- <?php //echo '<a class="btn btn-outline btn-primary fa fa-print"  href="?page=etat_produit&sql='.$sqlImpr.'"' ?>> IMPRIMER</a> -->
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a>
                            <a class="btn btn-outline btn-warning fa fa-plus" href="?page=produit"> NOUVEAU</a>

                            <B>  <h3> Liste des produits </h3></B>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th style="text-align:center">Designation</th>
                                        <th style="text-align:center">Famille</th>
                                        <th style="text-align:center">Forme</th>
                                        <th style="text-align:center">Prix</th>
                                        <th style="text-align:center">Quantite</th>
                                        <th style="text-align:center">Action</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align:center">
                                <?php
                                $i = 0;
                                while($data = $req->fetch(PDO::FETCH_ASSOC)){
                                    $i ++;                              
                                ?>
                                <tr>
                                    <td><?php echo utf8_encode($data['DESIGNATION']) ?></td>
                                    <td><?php echo /*utf8_encode(*/$data['NOM_FAMILLE']//) ?></td>
                                    <td><?php echo /*utf8_encode(*/$data['NOM_FORME']//) ?></td>
                                    <td><?php echo $data['PRIX_PRODUIT'] ?></td>
                                    <td><?php echo $data['QTE_STOCK'] ?></td>
                                    <td class="center">


                                        <button class="btn btn-outline btn-success fa fa-eye" type="button" data-toggle="modal" data-target="#myModal<?php echo $i;?>"> Aff</button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal<?php echo $i;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Informations générales de <?php echo $data['DESIGNATION']?> </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                                            
                                                            <thead>
                                                            <tr>
                                                                <th style="text-align:center">Attribut</th>
                                                                <th style="text-align:center">Valeur</th>
                                                                
                                                            </tr>
                                                            </thead>
                                                            <tbody style="text-align:center">
                                                                
                                                                <tr>
                                                                <td>Désignation</td>
                                                                <td><?php echo $data['DESIGNATION'] ?></td>
                                                                </tr>
                                                                
                                                                <tr>   
                                                                <td>Soumis à la TVA?</td>
                                                                <td><?php echo $data['SOUMIS_TVA'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Taux de TVA</td>
                                                                <td><?php echo $data['TAUX_TVA'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Date de commercialisation</td>
                                                                <td><?php echo $data['DATE_COMMERCIALISATION'] ?></td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                <td>Date d'enregistrement</td>
                                                                <td><?php echo $data['DATE_ENREGISTREMENT'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Date de mise à jour</td>
                                                                <td><?php echo $data['DATE_MJ'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Quantité en stcok</td>
                                                                <td><?php echo $data['QTE_STOCK'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Prix du produit</td>
                                                                <td><?php echo $data['PRIX_PRODUIT'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Prix de vente du produit</td>
                                                                <td><?php echo $data['PRIX_VENTE'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <!-- <td>Code Barre</td>
                                                                <td><?php //echo $data['CODE_BARRE'] ?></td>
                                                                </tr> -->
                                                                <tr>
                                                                <td>Famille du produit</td>
                                                                <td><?php echo $data['NOM_FAMILLE'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Forme</td>
                                                                <td><?php echo $data['NOM_FORME'] ?></td>
                                                                </tr>
                                                                <!-- <tr>
                                                                <td>Classe</td>
                                                                <td><?php //echo $data['DESCRIPTION'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>Exploitant</td>
                                                                <td><?php //echo $data['LIBELLE'] ?></td>
                                                                </tr> -->
                                                                <!-- <tr>
                                                                <td>Code Produit dérivé</td>
                                                                <td><?php //echo $data['DESIGNATION_DERIVE'] ?></td>
                                                                </tr> -->
                                                                <tr>
                                                                <td>Localisation</td>
                                                                <td><?php echo $data['NOM_LOCALISATION'] ?></td>
                                                                </tr>
                                                                <!-- <tr>
                                                                <td>Spécialité</td>
                                                                <td><?php //echo $data['NOM_SPECIALITE'] ?></td>
                                                                </tr>
                                                                <tr>
                                                                <td>LAboratoire</td>
                                                                <td><?php //echo $data['NOM_LABORATOIRE'] ?></td>
                                                                </tr> -->
                                                            
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <!-- <a type="button" class="btn btn-primary fa fa-print " <?php //echo 'href="?page=etat_produit&sql=SELECT * FROM `produit` p WHERE p.code_produit =\''.$data['CODE_PRODUIT'].'\' "' ?>>Imprimer</a> -->
                                                        <button type="button" class="btn btn-danger fa fa-close" data-dismiss="modal">Fermer</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->

                                        <a class="btn btn-outline btn-primary fa fa-edit" href="?page=update_produit&amp;id=<?php echo $data['CODE_PRODUIT']; ?>"> Mod</a>
                                       
                                        <button class="btn btn-outline btn-danger fa fa-trash-o" type="button" data-toggle="modal" data-target="#myModalSupr<?php echo $i;?>"> Sup</button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="myModalSupr<?php echo $i;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog panel panel-red">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Suppression de <?php echo $data['DESIGNATION']?> </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                    <p>
                                                        VOULEZ VOUS VRAIMENT SUPPRIMER CE PRODUIT?
                                                    </p>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <a type="button" class="btn btn-danger fa fa-trash-o" href="pages/administration/Produit/script_delete_produit.php?id=<?php echo $data['CODE_PRODUIT']; ?>">Oui</a>
                                                        <button type="button" class="btn btn-default fa fa-close" data-dismiss="modal">Non</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.modal -->


                                    </td>
                                </tr>
                                <?php } ?>


                                    <?php }else{?>
                                        <br />
                                        <center class="ui-state-highlight ui-corner-all">Aucun article n'a été enregistré pour l' instant ...</center>
                                    <?php }
                                     ?>


                                </tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
              </div>
            </div>
