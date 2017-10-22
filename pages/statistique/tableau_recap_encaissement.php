<?php
$dd="";
$df="";

if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];
     
     global $bdd;

   $sql4= "
SELECT
C.NOM_CLI,
C.PRENOM_CLI,
PV.CODE_VENTE,
U.LOGIN,
P.DESIGNATION,
PV.MONTANT_VENTE,
V.DATE_VENTE,
E.DATE_ENCAISSEMENT,
V.CODE_ENCAISSEMENT
FROM
 vente AS V inner join produit_vendu AS PV ON V.CODE_VENTE = PV.CODE_VENTE left  Join produit AS P ON PV.CODE_PRODUIT = P.CODE_PRODUIT
 left Join utilisateur AS U ON U.CODE_USER = V.CODE_USER left Join client AS C ON C.CODE_CLI = V.CODE_CLI left  join encaissement AS E ON E.CODE_ENCAISSEMENT=V.CODE_ENCAISSEMENT WHERE E.DATE_ENCAISSEMENT BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."'";
 $req=$bdd->query($sql4);



}else{
    $sql= "
SELECT
C.NOM_CLI,
C.PRENOM_CLI,
PV.CODE_VENTE,
U.LOGIN,
P.DESIGNATION,
PV.MONTANT_VENTE,
V.DATE_VENTE,
E.DATE_ENCAISSEMENT,
V.CODE_ENCAISSEMENT
FROM
 vente AS V inner join produit_vendu AS PV ON V.CODE_VENTE = PV.CODE_VENTE left  Join produit AS P ON PV.CODE_PRODUIT = P.CODE_PRODUIT
 left Join utilisateur AS U ON U.CODE_USER = V.CODE_USER left Join client AS C ON C.CODE_CLI = V.CODE_CLI left  join encaissement AS E ON E.CODE_ENCAISSEMENT=V.CODE_ENCAISSEMENT";
  $req=$bdd->query($sql);
}

?>
<div class="row">
                <div class="collg-12">
                    <h1 class="page-header"> Tableau des encaissements</h1>
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
                                        <th>Date encaissement</th>
                                        <th>Code Vente</th>
                                        <th>Nom</th>
                                        <th>Montant</th>
                                        <th>Operateur</th>
                                    </tr>
                                </thead>    
                                <tbody>
                               <?php  while($donnees = $req->fetch(PDO::FETCH_ASSOC)){?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['DATE_ENCAISSEMENT']; ?></td>    
                                        <td><?php echo $donnees['CODE_VENTE']; ?></td>
                                        <td><?php echo $donnees['NOM_CLI']; ?>
                                        <?php echo $donnees['PRENOM_CLI']; ?></td>        
                                        <td><?php echo $donnees['MONTANT_VENTE']; ?></td>
                                        <td><?php echo $donnees['LOGIN']; ?></td>
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


