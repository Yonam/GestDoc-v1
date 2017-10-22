
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">ENREGISTREMENT COMMERCIAL</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.section des identifiants -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="pages/administration/Commercial/script_commercial.php">

                                    
                                    
                                    <div class="col-lg-8 col-lg-push-2">

                                         <div class="form-group col-lg-6">
                                            <label for="nom">Nom du commercial</label>
                                            <input class="form-control" id="nom" name="nom" REQUIRED/>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="prenom">Prenom du commercial</label>
                                            <input class="form-control" id="prenom" name="prenom" REQUIRED/>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="embauche">Date Embauche <i class="fa fa-calendar"></i></label>
                                            <input type="text" class="form-control mydatepicker" data-provide="datepicker" placeholder="DD/MM/YYY" id="embauche" name="embauche" REQUIRED/>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label for="pourcentage">Pourcentage</label>
                                            <select class="form-control" id="pourcentage" name="pourcentage">
                                                <option value="0.1">0,1</option>
                                                <option value="0.2">0,2</option>
                                                <option value="0.5">0,5</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                            </select>
                                        </div>
                                    </div> 

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="tel1">Telephone standard</label>
                                                <input class="form-control" id="tel1" name="tel1" REQUIRED/>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tel2">Telephone d'urgence</label>
                                                <input class="form-control" id="tel2" name="tel2">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email"/>
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="adresse">Adresse</label>
                                                <input class="form-control" id="adresse" name="adresse" REQUIRED/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-lg-push-2">
                                        <button type="submit" class="btn btn-success col-lg-5" name="addcom">Enregistrer </button>
                                        <button type="reset" class="btn btn-danger col-lg-5 col-lg-push-2">Annuler </button>
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