<?php
    global $bdd;
    $id=$_GET['id'];
$commerciale= $bdd->prepare('SELECT code_com,nom_com,prenom_com,date_emb,tel_com, tel_urg, chiffre, pourcentage,email,adresse FROM commerciale WHERE code_com=?');
$commerciale->execute(array($id));
$data=$commerciale->fetchAll();
$four=array();
?>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">MISE A JOUR COMMERCIAL</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.section des identifiants -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="pages/administration/Commercial/script_update_commercial.php">

                                    
                                <?php foreach ($data as $d) {  ?>
                                    <div class="col-lg-8 col-lg-push-2">
                                        <input type="hidden" name="memids" value="<?php echo $id; ?>" />
                                         <div class="form-group col-lg-6">
                                            <label for="nom">Nom du commercial</label>
                                            <input class="form-control" id="nom" name="nom" REQUIRED value="<?php echo $d->nom_com ?>" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="prenom">Prenom du commercial</label>
                                            <input class="form-control" id="prenom" name="prenom" REQUIRED value="<?php echo $d->prenom_com ?>" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="embauche">Date Embauche <i class="fa fa-calendar"></i></label>
                                            <input type="text" class="form-control mydatepicker" data-provide="datepicker" placeholder="DD/MM/YYY" id="embauche" name="embauche" REQUIRED value="<?php echo $d->date_emb ?>" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="pourcentage">Pourcentage</label>
                                            <input type="text" class="form-control" id="pourcentage" name="pourcentage" value="<?php echo $d->pourcentage ?>">
                                        </div>
                                    </div> 

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="tel1">Telephone standard</label>
                                                <input class="form-control" id="tel1" name="tel1" REQUIRED value="<?php echo $d->tel_com ?>" />
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tel2">Telephone d'urgence</label>
                                                <input class="form-control" id="tel2" name="tel2" value="<?php echo $d->tel_urg ?>" >
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" value="<?php echo $d->email ?>" />
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="adresse">Adresse</label>
                                                <input class="form-control" id="adresse" name="adresse" REQUIRED value="<?php echo $d->adresse ?>" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-lg-push-2">
                                        <button type="submit" class="btn btn-success col-lg-5" name="update_com">Enregistrer </button>
                                        <button type="reset" class="btn btn-danger col-lg-5 col-lg-push-2">Annuler </button>
                                    </div>
                                <?php } ?>
                                </form>
                            </div>
                                <!-- /.col-lg-6 (nested) -->
                                
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                    </div>
                        <!-- /.panel-body -->
                </div>
                    <!-- /.section des prix -->

                    <!-- /.panel -->
            </div>
        
            <!-- /.row -->






    <!-- Custom Theme JavaScript -->
    
    <script type="text/javascript" src="/assets/js/bootstrap-datepicker.min.js"></script>
    <script>
    $(document).ready(function(){
        var date_input=$('input[name="peremption"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'dd/mm/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
    </script>
    <script>
    $(document).ready(function(){
        var date_input=$('input[name="enregistrement"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'dd/mm/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
    </script>
    <script>
    $(document).ready(function(){
        var date_input=$('input[name="commercialisation"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'dd/mm/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
    </script>

</body>

</html>