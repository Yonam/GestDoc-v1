<?php
    global $bdd;

    // if (isset($_POST['encaisserCli'])) {
        

    //     $sqlPayCom = "";

    //     $reqPayCom = $bdd->query($sqlPayCom);


    //     echo '<div class="alert alert-success alert-dismissable col-lg-8 col-lg-offset-2">
    //             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    //             Règlement effectué avec succès. 
    //         </div>';
    // }

$commerciale= $bdd->prepare('SELECT code_com,nom_com,prenom_com,date_emb,tel_com, tel_urg, chiffre, pourcentage FROM commerciale where deleted = 0');
$commerciale->execute();
$data=$commerciale->fetchAll();
$four=array();
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">GESTION COMMERCIAUX</h1>
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
                            <a class="btn btn-outline btn-warning fa fa-plus" href="?page=ajout_commercial"> NOUVEAU</a>
                            <B>  <h3> Liste des commerciaux </h3></B>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Nom</th>
                                        <th>Prenom</th>
                                        <th>Date embauche</th>
                                        <th>Telephone </th>
                                        <th>Urgence</th>
                                        <th>Pourcentage</th>
                                        <th>Chiffre Affaire</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                               <?php foreach ($data as $d){?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $d->nom_com; ?></td>
                                        <td><?php echo $d->prenom_com; ?></td>
                                        <td><?php echo $d->date_emb; ?></td>
                                        <td><?php echo $d->tel_com; ?></td>
                                        <td><?php echo $d->tel_urg; ?></td>
                                        <td><?php echo $d->pourcentage; ?></td>
                                        <td><?php echo $d->chiffre; ?></td>
                                        <td class="center">
                                            <form action="" method="post">
                                                
                                                <input type="text" name="codeCom" hidden value="<?php if(isset($d)){ echo $d->code_com;} ?>">    
                                                <input type="text" name="pourcent" hidden value="<?php if(isset($d)){ echo $d->pourcentage;} ?>">    
                                                <input type="text" name="chiffre" hidden value="<?php if(isset($d)){ echo $d->chiffre;} ?>">    
                                                <button type="submit" class="btn btn-outline btn-success fa fa-money" name="payCom"
                                                <?php
                                                    if ($d->chiffre <= 0) {
                                                        echo "disabled";
                                                    }
                                                ?>
                                                > Pay</button>

    
                                                <a class="btn btn-outline btn-primary fa fa-edit" href="?page=update_commercial&amp;id=<?php echo $d->code_com; ?>"> Mod</a>
                                            
                                                <a class="btn btn-outline btn-warning fa fa-times" href="pages/administration/commercial/script_delete_commerciale.php?id=<?php echo $d->code_com; ?>" onclick = "if (! confirm('Confirmer la suppression?')) return false;"> Sup</a>
                                            </form>
                                        </td>
                                    </tr>
                                <?php } ?>
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


