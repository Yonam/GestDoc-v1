<?php 
    global $bdd;
    $id=$_GET['id'];
$clients= $bdd->prepare('SELECT * FROM fournisseur WHERE CODE_FOURNISSEUR=?');
    $clients->execute(array($id));
$data=$clients->fetchAll();
$four=array();

?>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">MISE A JOUR FOURNISSEUR</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.section des identifiants -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="pages/administration/Fournisseur/script_update_fournisseur.php">

                                    
                                    <?php foreach ($data as $d) { ?>
                                    <div class="col-lg-8 col-lg-push-2">

                                        <input type="hidden" name="memids" value="<?php echo $id; ?>" />
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="raison">Raison Sociale du Fournisseur</label>
                                                <input class="form-control" id="raison" name="raison" REQUIRED value="<?php echo $d->RAISON_SOCIAL ?>" />
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="per_contact">Personne Contact</label>
                                                <input class="form-control" id="per_contact" name="per_contact" REQUIRED value="<?php echo $d->CONCTACT ?>" />
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tel1">Telephone standard</label>
                                                <input class="form-control" id="tel1" name="tel1" REQUIRED value="<?php echo $d->TEL ?>" />
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tel2">Telephone d'urgence</label>
                                                <input class="form-control" id="tel2" name="tel2" value="<?php echo $d->TEL_URG ?>" >
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" value="<?php echo $d->EMAIL ?>" >
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="adresse">Adresse</label>
                                                <input class="form-control" id="adresse" name="adresse"REQUIRED value="<?php echo $d->ADRESSE ?>" />
                                            </div>
                                        </div>
                                    </div> 
                                    

                                    <div class="col-lg-8 col-lg-push-2">
                                        <button type="submit" class="btn btn-success col-lg-5" name="update_frs">Enregistrer </button>
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