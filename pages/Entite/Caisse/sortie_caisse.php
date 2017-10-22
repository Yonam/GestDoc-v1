<?php
global $bdd;
if (isset($_POST['addSortieCaisse'])) {
    $sqlInsert = 'INSERT INTO sortie_caisse (code_journee, code_user, montant_sortie_caisse, date_sortie_caisse, motif_sortie_caisse, demandeur) values ((select code_journee from journee where statut = 0),'.$_SESSION["Auth"]->code_user.','.$_POST["montant"].',"'.$_POST["date"].'","'.$_POST["motif"].'","'.$_POST["demandeur"].'")';
    $bool = $bdd->query($sqlInsert);

    if ($bool) {
        echo '<div class="alert alert-success alert-dismissable col-lg-8 col-lg-offset-2">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Sortie de caisse enregistrée avec succès! 
        </div>';
    }

}
    
?>

        
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sortie de caisse</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.section des identifiants -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="">


                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label for="motif">Motif de sortie de caisse</label>
                                                <textarea class="form-control" id="motif" name="motif" rows="3" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="montant">Montant</label>
                                                <input class="form-control" type="number" id="montant" name="montant" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="date">Date</label>
                                                <input type="text" readonly class="form-control datepicker" data-provide="datepicker" placeholder="YYYY/MM/DD" id="date" value="<?php echo date('Y/m/d');  ?>" name="date">
                                            </div>
                                            <div class="form-group">
                                                <label for="demandeur">Demandeur</label>
                                                <input class="form-control" id="demandeur" name="demandeur" required>
                                            </div>
                                        </div>
                                    </div> 
                                    

                                    <div class="col-lg-8 col-lg-push-2">
                                       <button type="reset" class="btn btn-defalt col-lg-5">Annuler l'enregistrement</button> 
                                       <button type="submit" class="btn btn-success col-lg-5 col-lg-push-2" name="addSortieCaisse">Enregistrer la sortie</button>
                                        
                                    </div>
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