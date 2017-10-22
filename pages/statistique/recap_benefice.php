<?php
$dd="";
$df="";

if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];
     
     global $bdd;

    $sql2="SELECT produit.DESIGNATION, produit.SOUMIS_TVA, 
    produit.TAUX_TVA,produit.PRIX_PRODUIT, produit.PRIX_PRODUIT*(produit.TAUX_TVA/100) AS 'TVA SUR LE PRODUIT',
    produit.PRIX_PRODUIT+(produit.PRIX_PRODUIT*(produit.TAUX_TVA/100)) AS 'MONTANT TOTAL', produit.PRIX_PRODUIT+(produit.PRIX_PRODUIT*(produit.TAUX_TVA/100)) - produit.PRIX_PRODUIT AS 'BENEFICE'
     FROM produit WHERE produit.DATE_ENREGISTREMENT BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."'" ;

    $req2= $bdd->query($sql2);
    
}



    $sql=" SELECT produit.DESIGNATION,produit.SOUMIS_TVA,produit.TAUX_TVA,produit.PRIX_PRODUIT,
      produit.PRIX_PRODUIT*(produit.TAUX_TVA/100) AS 'TVA SUR LE PRODUIT',produit.PRIX_PRODUIT+(produit.PRIX_PRODUIT*(produit.TAUX_TVA/100)) AS 'MONTANT TOTAL', 
      produit.PRIX_PRODUIT+(produit.PRIX_PRODUIT*(produit.TAUX_TVA/100)) - produit.PRIX_PRODUIT AS 'BENEFICE' FROM produit";
     $req= $bdd->query($sql);


?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Liste des benefices realisees</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-outline btn-primary fa fa-print" <?php echo 'href="?page=etat_benefice&sql='.$sql.'"' ?>> IMPRIMER</a>
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                          <div class="container">
                            <form role="form" method="post" >
                            
                                          <input type="text" class="hidden" name="page" value="recap_benefice" />

                                           <div class="col-lg-8 col-lg-push-0 text-align-center">
                                                
                                            <div class="form-group col-lg-5">
                                                <label for="date"> Date debut: </label>
                                                <input type="text" placeholder="Date debut" class="form-control datepicker" data-provide="datepicker" placeholder="DD/MM/YYYY" id="dated" name="dated"/>
                                            </div>
                                        
                                            <div class="form-group col-lg-5">
                                              <label for="date"> Date fin: </label>
                                                <input type="text" placeholder="Date fin" class="form-control datepicker" data-provide="datepicker" placeholder="DD/MM/YYYY" id="datef" name="datef"/>
                                           </div>

                                            <div class="form-group col-lg-0" style="padding-top:2em;">
                                                <input class="btn btn-outline btn-success btn-sm" type="submit" name="go" id="go" value="valider" />
                                            </div>
                                        </div>
                                    </div>
                              </form>
                            </div >
                            <hr style="border-top: 0.2em solid black; padding-bottom: 0.5em;" width="80%" />

                            <table class="table table-striped table-bordered table-hover">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                       <th>Designation produit</th>
                                        <th>Prix achat</th>
                                        <th>TVA</th>
                                        <th>Taux de TVA</th>
                                        <th>Montant total</th>
                                        <th>Benefice</th>
                                    </tr>
                                <tbody>
                              

                               

                                
                              <?php
                              if (!isset($_POST['go']) || ($_POST['dated'] =='' && $_POST['datef'] =='')) {
                                    while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                    <td><?php echo $donnees['DESIGNATION']; ?></td>
                                    <td><?php echo $donnees['PRIX_PRODUIT']; ?></td>
                                    <td><?php echo $donnees['SOUMIS_TVA']; ?></td>
                                    <td><?php echo $donnees['TAUX_TVA']; ?></td>
                                    <td><?php echo $donnees['MONTANT TOTAL']; ?></td>
                                    <td><?php echo $donnees['BENEFICE']; ?></td>
                                    </tr>
                                <?php } 
                              }else{
                                 if (!empty($_POST['dated']) && !empty($_POST['datef'])){
                                       
                                          if (isset($req2)) {
                                            while ($donnees2 = $req2->fetch(PDO::FETCH_ASSOC)){  ?>
                                                <tr class="odd gradeX">
                                                <td><?php echo $donnees2['DESIGNATION']; ?></td>
                                                <td><?php echo $donnees2['PRIX_PRODUIT']; ?></td>
                                                <td><?php echo $donnees2['SOUMIS_TVA']; ?></td>
                                                <td><?php echo $donnees2['TAUX_TVA']; ?></td>
                                                <td><?php echo $donnees2['MONTANT TOTAL']; ?></td>
                                                <td><?php echo $donnees2['BENEFICE']; ?></td>
                                               </tr>
                                          }
                                         
                                          
                                          <?php }

                                       } 
                                 } 
                              }

                                   

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


