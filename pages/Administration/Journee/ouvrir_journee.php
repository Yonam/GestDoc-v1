
<?php
try {
    $journee = $bdd->prepare('SELECT J.CODE_JOURNEE, J.DATE, J.DATE_OUVERTURE,J.DATE_FERMETURE,J.DATE_CLOTURE,U.LOGIN,J.STATUT FROM journee J JOIN utilisateur U ON J.CODE_USER_OUVRIR=U.CODE_USER ORDER BY code_journee DESC LIMIT 0, 30');
    $journee->execute();
} catch (Exception $e) {
    // En cas d'erreur précédemment, on affiche un message et on arrête tout
    die('Erreur : ' . $e->getMessage());
}

if (!empty($_POST['go'])) {

    try{
        $reqm=$bdd->query("SELECT COUNT(CODE_JOURNEE) AS nombre FROM journee WHERE date='".$_POST['date']."' ");
        $doms=$reqm->fetch();
        if($doms->nombre==0){
            $reqt=$bdd->query("SELECT COUNT(CODE_JOURNEE) AS nombre2, CODE_JOURNEE FROM journee WHERE statut = 0");
            $domas=$reqt->fetch();
            
            if($domas->nombre2==0){
                $req= $bdd->prepare('INSERT INTO journee(CODE_USER_OUVRIR, DATE, DATE_OUVERTURE, STATUT) VALUES(:code, :dated, :date_ouverture, :stat)');

                $req->execute(array ('code'=>$_SESSION['Auth']->code_user,'dated'=>(htmlspecialchars($_POST['date'])),'date_ouverture'=>(htmlspecialchars($_POST['date_ouverture'])), 'stat'=>0));
                ?>
                <script > alert('Ouverture réussie ') </script><?php
                $reqt=$bdd->query("SELECT CODE_JOURNEE FROM journee WHERE statut = 0");
                $code=$reqt->fetch();
                $_SESSION['journee']=$code->CODE_JOURNEE;
                echo '<meta http-equiv="refresh"';
            }else{
                ?><script > alert('Une journée est deja ouverte, Fermez la avant toute autre opération ') </script><?php
                $_SESSION['journee']=$domas->CODE_JOURNEE;
            }
        }else{
            ?>
            <script > alert('Cette journée est deja ouverte ') </script>
        <?php }
    } catch (Exception $ex) {
        die('Erreur date : '.$e->getMessage());
    }
}

$user=$_SESSION['Auth']->code_user;
?>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 ">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Bonjour! Merci de cliquer sur le bouton pour ouvrir la journee</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post">

                            <table class="table table-striped table-bordered table-hover">
                                <thead >
                                <div>
                                    <center><h3> OUVERTURE DE JOURNEE</h3></center>
                                </div>

                                </thead>
                                <?php
                                $req4=$bdd->query("SELECT ADDDATE(MAX(date),INTERVAL 1 DAY) as dates FROM journee ");

                             while($dat4=$req4->fetch()) {
                                ?>
                                <tbody>
                                <tr>
									<th><label for="date"> Date : </label></th>
									<td><input type="text" name="date" id="date"
                                            value="<?php echo $dat4->dates;
											} ?>" readonly="readonly"/>
											</td>
							     </tr>
                                <tr><th><label for="date_ouverture"> Date Ouverture: </label></th>
                                    <td><input type="text" name="date_ouverture" id="date_ouverture"
                                               value="<?php
                                               $datetime = date("Y-m-d      H:i:s");echo $datetime;?>" readonly="readonly"/></td></tr>
                                </tbody>
                            </table>
                            <td height="50" colspan="2"><div align="center"><br/>
                                    <input class="btn btn-outline btn-success" type="submit" name="go" id="go" value="Ouvrir" />
                                    <input class="btn btn-outline btn-success" type="reset" name="annuler" id="annuler" value="Annuler" />
                                </div></td>

                        </form>

                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <h1 class="page-header">Liste des Journees de caisse</h1>
            </div>
                <!-- /.col-lg-12 -->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Liste des Journees
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                <tr>
                                    <th>Journee</th>
                                    <th>Date ouverture</th>
                                    <th>Date fermeture</th>
                                    <th>Date cloture</th>
                                    <th>Operateur</th>
                                    <th>Etat</th>
                                    <th>Action</th>
                                </tr>
                                <tbody>
                                <?php while ($donnees = $journee->fetch()){  
                                    
                                    ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees->DATE; ?></td>
                                        <td><?php echo $donnees->DATE_OUVERTURE; ?></td>
                                        <td><?php echo $donnees->DATE_FERMETURE; ?></td>
                                        <td><?php echo $donnees->DATE_CLOTURE; ?></td>
                                        <td><?php echo $donnees->LOGIN; ?></td>
                                        <td><?php echo $donnees->STATUT; ?></td>
                                        <td class="center">
                                        <?php if($donnees->STATUT==0 && $donnees->DATE_CLOTURE==NULL){echo "<a class=\"btn btn-warning\" type=\"submit\" name=\"stop\" id=\"stop\" href=\"pages/administration/Journee/script_arret_jrnee.php?id=$donnees->CODE_JOURNEE&identif=$user\" > arreter </a>";} 
                                            elseif($donnees->STATUT==1 && $donnees->DATE_CLOTURE==NULL){echo "<a class=\"btn btn-success\" type=\"submit\" name=\"reouvrir\" id=\"reouvrir\" href=\"pages/administration/Journee/script_reouverture.php?id=$donnees->CODE_JOURNEE&identif=$user\" > reouvrir </a>";}
                                            elseif ($donnees->STATUT==1 && $donnees->DATE_CLOTURE!=NULL) {
                                                echo "#";
                                            }
                                            ?>


                                        <?php if($donnees->STATUT==1 && $donnees->DATE_CLOTURE==NULL){echo "<button class=\"btn btn-outline btn-danger fa fa-lock\" type=\"button\" data-toggle=\"modal\" data-target=\"#myModal$donnees->CODE_JOURNEE\" >cloturer </button>";}

                                            elseif ($donnees->STATUT==1 && $donnees->DATE_CLOTURE!=NULL) {
                                            echo "<a > Journee cloturee </a>";}

                                            else {
                                            echo "<a class=\"btn btn-danger\" disable> cloturer </a>";} 

                                        ?>



                                            <!-- section modal pour la cloture de caisse  -->



                                             <div class="modal fade" id="myModal<?= $donnees->CODE_JOURNEE; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <form method="post" name="cloturer" action="pages/administration/Journee/script_cloture.php?id=$donnees->CODE_JOURNEE&identif=$user">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel">Informations de cloture de la journee <?= $donnees->CODE_JOURNEE ?> 

                                                        <?php 
                                                        $total=$bdd->query("SELECT SUM(MONTANT_VENTE) as total FROM produit_vendu PV JOIN vente V ON PV.CODE_VENTE = V.CODE_VENTE WHERE V.CODE_JOURNEE=$donnees->CODE_JOURNEE");
                                                        ?>  </h4>
                                                    </div>
                                                    <?php while ($toto=$total->fetch()) { ?>
                                                    <div class="modal-body">
                                                        <div class="col-lg-12">
                                                            
                                                            <div class="row">
                                                                <div class="form-group col-lg-6     ">
                                                                    <label for="theorie">Total theorique</label>
                                                                    <input class="form-control" id="theorie" name="theorie" value="<?php echo $toto->total; ?>">
                                                                </div>
                                                                <div class="form-group col-lg-6     ">
                                                                    <label for="pratique">Total Pratique</label>
                                                                    <input class="form-control" id="pratique" name="pratique" >
                                                                </div>
                                                                <input type="text" name="codeVente" hidden value="<?php echo $donnees->CODE_JOURNEE; ?>">
                                                                <input type="text" name="codeUser" hidden value="<?php echo $user; ?>">
                                                            </div>
                                                        </div>
                                                        <h5 class="lead" style="margin-top:1em;">Veuillez entrer le solde dans le champs "Total pratique" svp</h5>
                                                    </div>
                                                    <?php } ?>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-success fa fa-money" name="cloturer"> cloturer</button>
                                                        <button type="button" class="btn btn-danger fa fa-close" data-dismiss="modal"> Fermer</button>
                                                    </div>
                                                </div>
                                                </form>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>





                                            <!-- fin du ;odql pour la cloture de caisse --> 


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
