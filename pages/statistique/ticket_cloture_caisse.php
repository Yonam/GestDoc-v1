

<?php
$dd="";
$df="";

if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];

  global $bdd;
 $sql2= "SELECT 
J.CODE_JOURNEE,
J.DATE_CLOTURE,
U.LOGIN,
V.CODE_VENTE,
V.DATE_VENTE
FROM
vente AS V inner Join
 encaissement  AS E  ON V.CODE_VENTE=E.CODE_VENTE
Inner Join journee AS J  ON E.CODE_JOURNEE=J.CODE_JOURNEE left JOIN  utilisateur AS U ON J.CODE_USER_OUVRIR = U.CODE_USER 
 where J.DATE_CLOTURE is not null 
AND J.DATE_CLOTURE BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."'" ;
 $req2= $bdd->query($sql2); 


  }
     $sql= "SELECT
J.CODE_JOURNEE,
J.DATE_CLOTURE,
U.LOGIN,
J.STATUT,
V.CODE_VENTE
FROM
vente AS V inner Join
 encaissement  AS E  ON V.CODE_VENTE=E.CODE_VENTE
Inner Join journee AS J  ON E.CODE_JOURNEE=J.CODE_JOURNEE left JOIN  utilisateur AS U ON J.CODE_USER_OUVRIR = U.CODE_USER 
 where J.DATE_CLOTURE is not null 
ORDER BY J.CODE_JOURNEE  DESC";
     $req= $bdd->query($sql); 
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Tickets Cloture de caisse</h1>
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
                                 </form>
                               </div>   
                            <table class="table table-striped table-bordered table-hover">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                       <th>Date cloture</th>
                                        <th>Code vente</th>
<!--                                         <th>Client</th> -->
                                        <th>Responsable ouverture</th>
                                        <th>Responsable fermeture</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                                <?php 
                                    if (!isset($_POST['go']) || ($_POST['dated'] =='' && $_POST['datef'] =='')) {
                                    while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['DATE_CLOTURE']; ?></td>
                                        <td><?php echo $donnees['CODE_VENTE']; ?></td>
                                        <td><?php echo $donnees['LOGIN']; ?>
                                        <td><?php echo $donnees['LOGIN']; ?></td>
                                    
                                          <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#"> </a>
                                           <!--  <a class="btn btn-outline btn-success fa fa-edit" href="#"> Mod</a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a> -->
                                        </td>

                                </tr>
                                <?php } 


                                 }else{
                                     if (!empty($_POST['dated']) && !empty($_POST['datef'])){
                                           
                                     if (isset($req2)) {
                                    while ($d = $req2->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $d['DATE_CLOTURE']; ?></td>
                                        <td><?php echo $d['CODE_VENTE']; ?></td>
                                        <td><?php echo $d['LOGIN']; ?>
                                        <td><?php echo $d['LOGIN']; ?></td>

                                          }
                                          <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-money" href="#"> </a>
                                           <!--  <a class="btn btn-outline btn-success fa fa-edit" href="#"> Mod</a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a> -->
                                        </td>


                                     </tr> 
                                          
                                          <?php }

                                       } 
                                 } 
                              }

                               ?>
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


