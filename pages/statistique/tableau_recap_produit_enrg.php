
<?php
$sql="SELECT
P.DCI,
F.NOM_FORME,
F.CODE_FORME,
P.DESIGNATION,
P.DATE_COMMERCIALISATION,
P.DATE_ENREGISTREMENT
FROM
produit AS P INNER JOIN forme AS F ON P.CODE_FORME=F.CODE_FORME";
$req = $bdd->query($sql);
if($req->rowCount() > 0)
    ?>
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">PRODUITS</h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-outline btn-primary fa fa-print" href="?page=etat_produit"> IMPRIMER</a>
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a>
                            <B>  <h3> Liste des produits </h3></B>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                         <th>DCI</th>
                                         <th>Designation</th>
                                         <th>Forme</th>
                                         <th>Date enregistrement</th>
                                         <th>Date commercialisation</th>
                                         <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                while($data = $req->fetch(PDO::FETCH_ASSOC)){
                                ?>
                                <tr>
                                    <td><?php echo utf8_encode($data['DCI']) ?></td>
                                    <td><?php echo /*utf8_encode(*/$data['DESIGNATION']//) ?></td>
                                    <td><?php echo $data['NOM_FORME'] ?></td>
                                    <td><?php echo $data['DATE_ENREGISTREMENT'] ?></td>
                                    <td><?php echo $data['DATE_COMMERCIALISATION'] ?></td>
                                    <td class="center">
                                        <a class="btn btn-outline btn-success fa fa-eye" href="#"> Aff</a>
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
            </div>
