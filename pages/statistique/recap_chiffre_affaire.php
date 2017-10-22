<?php
$dd="";
$df="";

if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];

  global $bdd;

  $sql2= "SELECT code_com,nom_com,prenom_com,date_emb,tel_com, tel_urg, chiffre, pourcentage FROM commerciale where deleted = 0
WHERE date_emb BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."'" ;
     $req2= $bdd->query($sql2); 


  }else{
     $sql= "SELECT code_com,nom_com,prenom_com,date_emb,tel_com, tel_urg, chiffre, pourcentage FROM commerciale where deleted = 0";
     $req= $bdd->query($sql); 
   }
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Liste des chiffres d'affaires</h1>
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
                          <ul class="nav nav-tabs">
                          <li class="active"><a data-toggle="tab" href="#tab1" >Periode</a></li>
                          <li><a data-toggle="tab" href="#tab2" >Nombre de jours</a></li>
                        </ul>
                    <form role="form" method="post" action="">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="col-lg-12">
                                <h1>Trie sur une periode</h1>
                                    <div class="row">
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
                            </div>


                           
                        <div class="tab-pane" id="tab2">
                              <div class="row"> 
                                <div class="form-group col-lg-5">
                                                      <label for="date"> Nombre de jour: </label>
                                                        <input type="text" placeholder="entrer un nombre de jour" class="form-control" id="nb" name="nb"/>
                                                   </div> 
                                                          <div class="form-group col-lg-0" style="padding-top:2em;">
                                                        <input class="btn btn-outline btn-success btn-sm" type="submit" name="go" id="go" value="valider" />
                                                    </div>
                               
                                                  
                                                   
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
                                       <th>Nom</th>
                                        <th>Date embauche</th>
                                        <th>Telephone </th>
                                        <th>Urgence</th>
                                        <th>Pourcentage</th>
                                        <th>Chiffre Affaire</th>
                                    </tr>
                                <tbody>
                               <?php 
                                    if (!isset($_POST['go']) || ($_POST['dated'] =='' && $_POST['datef'] =='')) {
                                    while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['nom_com']; ?>
                                        <?php echo $donnees['prenom_com']; ?></td>
                                        <td><?php echo $donnees['date_emb']; ?></td>
                                        <td><?php echo $donnees['tel_com']; ?></td>
                                        <td><?php echo $donnees['tel_urg']; ?></td>
                                        <td><?php echo $donnees['pourcentage']; ?></td>
                                        <td><?php echo $donnees['chiffre']; ?></td>
                                    </tr>
                                <?php } 


                                 }else{
                                     if (!empty($_POST['dated']) && !empty($_POST['datef'])){
                                           
                                     if (isset($req2)) {
                                    while ($donnees2 = $req2->fetch(PDO::FETCH_ASSOC)){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['nom_com']; ?></td>
                                        <td><?php echo $donnees['prenom_com']; ?></td>
                                        <td><?php echo $donnees['date_emb']; ?>
                                        <?php echo $donnees['tel_com']; ?></td>
                                        <td><?php echo $donnees['tel_urg']; ?></td>
                                        <td><?php echo $donnees['pourcentage']; ?></td>
                                        <td><?php echo $donnees['chiffre']; ?></td>
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


