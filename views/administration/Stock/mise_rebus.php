 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sortie de stock</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.section des identifiants -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="http://localhost/OwoNew/index.php?page=entree_stock">

                                    
                                    
                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label for="fournisseur">Fournisseur</label>
                                                <select class="form-control" id="fournisseur" name="fournisseur">
                                                    <option value="fournisseur1">fournisseur1</option>
                                                    <option value="fournisseur12">fournisseur12</option>
                                                    <option value="fournisseur13">fournisseur13</option>
                                                </select> 
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label for="produit">Produit</label>
                                                <select class="form-control" id="produit" name="produit">
                                                    <option value="produit1">produit1</option>
                                                    <option value="produit12">produit12</option>
                                                    <option value="produit13">produit13</option>
                                                </select> 
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="quantite">Quantite</label>
                                                <input class="form-control" id="quantite" name="quantite">
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="date">Date d'entree</label>
                                                <input class="form-control" id="date" name="date">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="facture">Numero facture</label>
                                                <input type="facture" class="form-control" id="facture" name="facture">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="bordereau">Numero de bordereau</label>
                                                <input class="form-control" id="bordereau" name="bordereau">
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group col-lg-6">
                                                    <label for="payante">Quantite payante</label>
                                                    <input class="form-control" id="payante" name="payante">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group col-lg-6">
                                                    <label for="gratuite    ">Quantite gratuite </label>
                                                    <input class="form-control" id="gratuite    " name="gratuite    ">
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    

                                    <div class="col-lg-8 col-lg-push-2">
                                        <button type="submit" class="btn btn-success col-lg-5" name="submit">Enregistrer le commercial</button>
                                        <button type="reset" class="btn btn-danger col-lg-5 col-lg-push-2">Annuler l'enregistrement</button>
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

