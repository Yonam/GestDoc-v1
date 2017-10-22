<?php
$dd="";
$df="";
if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];
     
     global $bdd;
$sql="SELECT
V.DATE_VENTE,
V.CODE_VENTE,
U.NOM_USER,
E.CODE_ENTREE,
S.CODE_SORTIE,
M.CODE_MOUVEMENT,
M.DATE,
S.DATE_SORTIE,
E.DATE_ENTREE
FROM
vente AS V
LEFT JOIN utilisateur AS U ON U.CODE_USER = V.CODE_USER LEFT JOIN mouvement AS M ON M.CODE_VENTE=V.CODE_VENTE
LEFT JOIN sortie AS S ON M.CODE_SORTIE=S.CODE_SORTIE LEFT JOIN entree AS E ON E.CODE_ENTREE=M.CODE_ENTREE WHERE E.DATE_ENTREE BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."' OR  S.DATE_SORTIE BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."' OR  V.DATE_VENTE BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."' ";
 $toto=$bdd->query($sql);
 /*var_dump($sql);*/
/* var_dump($toto->fetch(PDO::FETCH_ASSOC));*/
 

}else{
     $sql="SELECT
mouvement.LIBELLE,
mouvement.DATE,
PF.NOMBRE_ENTREE,
PV.MONTANT_VENTE,
PS.QTE_SORTIE,
P.CODE_PRODUIT,
PV.NB_VENDU,
U.LOGIN
FROM
mouvement ,
produit_entree_fournisseur AS PF inner  join produit  as P on  PF.CODE_PRODUIT=P.CODE_PRODUIT inner join 
produit_sortie AS PS inner  join produit on  PS.CODE_PRODUIT=P.CODE_PRODUIT INNER JOIN produit_vendu AS PV ON PV.CODE_PRODUIT=P.CODE_PRODUIT,utilisateur as U
";
}

 
    $req=$bdd->query($sql);


?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Recap mouvement</h1>
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
                                                
                                            <div class="form-group col-lg-4">
                                                <label for="date"> Date debut: </label>
                                                <input type="text" placeholder="Date debut" class="form-control datepicker" data-provide="datepicker" placeholder="DD/MM/YYYY" id="dated" name="dated"/>
                                            </div>
                                        
                                            <div class="form-group col-lg-4">
                                              <label for="date"> Date fin: </label>
                                                <input type="text" placeholder="Date fin" class="form-control datepicker" data-provide="datepicker" placeholder="DD/MM/YYYY" id="datef" name="datef"/>
                                           </div>
                                             <div class="form-group col-lg-3">
                                                    <label>Selectionner</label>
                                                        <select class="form-control" name="valu">
                                                             <option value="1">Vente</option>
                                                             <option value="2">Entree</option>
                                                             <option value="3">Sortie</option>
                                                        </select>                                        
                                             </div>

                                            <div class="form-group col-lg-0" style="padding-top:2em;">
                                                <input class="btn btn-outline btn-success btn-sm" type="submit" name="go" id="go" value="valider" />
                                            </div>
                                        </div>
                                    <!-- </div> -->
                              </form>
                         </div >
                            <hr style="border-top: 0.2em solid black; padding-bottom: 0.5em;" width="80%" />

                            <!-- <table class="table table-striped table-bordered table-hover"> -->
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                       <th>Type d'operation</th>
                                        <th>Date</th>
                                        <th>responsable</th>
                                        <th>Libelle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                if (isset($_POST['go'])) {
                             
                                       if ( ($_POST['dated'] !='' && $_POST['datef'] !='' && $_POST['valu']!='')) {
                                       // <?php var_dump(isset($donnees['CODE_VENTE']));
                                    
                                       // $donnees = $req->fetch(PDO::FETCH_ASSOC);
                                       // var_dump(isset($donnees['CODE_VENTE']));
                                        if ($_POST['valu']==1) {
                                        while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                            <tr class="odd gradeX">
                                                <td><?php echo $donnees['CODE_VENTE']; ?></td>
                                                <td><?php echo $donnees['DATE_VENTE']; ?></td>
                                                <td><?php echo $donnees['NOM_USER']; ?></td>
                                                <td><?php echo    'Vente' ; ?></td>
                                            </tr>
                                        <?php }
                                        }  elseif ($_POST['valu']==2) {
                                            while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $donnees['CODE_ENTREE']; ?></td>
                                                    <td><?php echo $donnees['DATE_ENTREE']; ?></td>
                                                    <td><?php echo $donnees['NOM_USER']; ?></td>
                                                    <td><?php echo    'Entree' ; ?></td>
                                                </tr>
                                            <?php }
                                         }
                                        elseif ($_POST['valu']==3) {
                                            while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $donnees['CODE_SORTIE']; ?></td>
                                                    <td><?php echo $donnees['DATE_SORIE']; ?></td>
                                                    <td><?php echo $donnees['NOM_USER']; ?></td>
                                                    <td><?php echo    'Sortie' ; ?></td>
                                                </tr>
                                            <?php }
                                        }
                                          
                                        }
                               
                                }else{
                                    /*$donnees = $req->fetch(PDO::FETCH_ASSOC);
                                    var_dump($donnees['CODE_VENTE']);
                                    var_dump($donnees['CODE_ENTREE']);
                                    var_dump(!is_null($donnees['CODE_VENTE']));*/
                                 while ($donnees = $req->fetch(PDO::FETCH_ASSOC)){
                                    if ($donnees['CODE_VENTE'] != null) {
                                          
                                            echo '<tr class="odd gradeX">
                                                    <td>'.$donnees['CODE_VENTE'].'</td>
                                                    <td>'.$donnees['DATE_VENTE'].'</td>
                                                    <td>'.$donnees['NOM_USER'].'</td>
                                                    <td></td>
                                                    </tr>';
                                            
                                        }elseif (isset($donnees['CODE_ENTREE'])) {
                                                echo '<tr class="odd gradeX">
                                                <td>'.$donnees['CODE_VENTE'].'</td>
                                                <td>'.$donnees['DATE_VENTE'].'</td>
                                                <td>'.$donnees['NOM_USER'].'</td>
                                                <td></td>';
                                        }
                                        elseif (isset($donnees['CODE_SORTIE'])) {
                                            echo '<tr class="odd gradeX">
                                                <td>'.$donnees['CODE_VENTE'].'</td>
                                                <td>'.$donnees['DATE_VENTE'].'</td>
                                                <td>'.$donnees['NOM_USER'].'</td>
                                                <td></td>'; }
                                        }  
                                }
                                
                              

                                ?>

                                </tbody>
                            </table>
                            <!-- </table> -->
                        </div>
                        <!-- /.panel-body -->
                    </div>

                <!-- fin tableau 1 -->



