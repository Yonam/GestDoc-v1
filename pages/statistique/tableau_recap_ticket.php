<?php
$dd="";
$df="";

if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];

  global $bdd;

  $sql2= "SELECT
P.DESIGNATION,
E.CODE_ENCAISSEMENT,
U.LOGIN,
PV.MONTANT_VENTE,
E.DATE_ENCAISSEMENT
FROM
produit AS P inner join 
produit_vendu AS PV ON PV.CODE_PRODUIT=P.CODE_PRODUIT inner join vente AS V ON V.CODE_VENTE=PV.CODE_VENTE  inner join encaissement  as E on V.CODE_ENCAISSEMENT=E.CODE_ENCAISSEMENT inner join
utilisateur AS U ON U.CODE_USER=E.CODE_USER 
WHERE E.DATE_ENCAISSEMENT BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."'" ;
     $req2= $bdd->query($sql2); 


  }else{
   $sql= "SELECT
P.DESIGNATION,
E.CODE_ENCAISSEMENT,
U.LOGIN,
PV.MONTANT_VENTE,
E.DATE_ENCAISSEMENT
FROM
produit AS P inner join 
produit_vendu AS PV ON PV.CODE_PRODUIT=P.CODE_PRODUIT inner join vente AS V ON V.CODE_VENTE=PV.CODE_VENTE  inner join encaissement  as E on V.CODE_ENCAISSEMENT=E.CODE_ENCAISSEMENT inner join
utilisateur AS U ON U.CODE_USER=E.CODE_USER";
     $req= $bdd->query($sql); 
   }
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Liste des tickets de caisses</h1>
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
                          <a class="btn btn-outline btn-warning fa fa-plus" href=""> NOUVEAU</a>
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
                            <!-- <hr style="border-top: 0.2em solid black; padding-bottom: 0.5em;" width="80%" /> -->
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>ID ENCAISSEMENT</th>
                                        <th>PRODUIT</th>
                                        <th>MONTANT</th>
                                        <th>OPERATEUR</th> 
                                        <th>Action</th>                                                                               
                                    </tr>
                                  </thead>
                                <tbody>
                                <?php 
                                    if (!isset($_POST['go']) || ($_POST['dated'] =='' && $_POST['datef'] =='')) {
                                    while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                         <td><?php echo $donnees['DATE_ENCAISSEMENT']; ?></td>
                                        <td><?php echo $donnees['CODE_ENCAISSEMENT']; ?></td>
                                        <td><?php echo $donnees['DESIGNATION']; ?></td>
                                        <td><?php echo $donnees['MONTANT_VENTE']; ?></td>
                                        <td><?php echo $donnees['LOGIN']; ?></td>
                                          <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#">Imprimer</a>
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#">Afficher</a>
                                        </td>
                                    </tr>
                                <?php } 


                                 }else{
                                     if (!empty($_POST['dated']) && !empty($_POST['datef'])){
                                           
                                     if (isset($req2)) {
                                    while ($donnees2 = $req2->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                         <td><?php echo $donnees2['DATE_ENCAISSEMENT']; ?></td>
                                        <td><?php echo $donnees2['CODE_ENCAISSEMENT']; ?></td>
                                        <td><?php echo $donnees2['DESIGNATION']; ?></td>
                                        <td><?php echo $donnees2['MONTANT_VENTE']; ?></td>
                                        <td><?php echo $donnees2['LOGIN']; ?></td>
                                          <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#">Imprimer</a>
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#">Afficher</a>
                                        </td>
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