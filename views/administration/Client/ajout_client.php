
        
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Enregistrement d'un client</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                    <!-- /.section des identifiants -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="script_ajout.php">

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="form-group col-lg-4">
                                                    <label for="titre">Titre</label>
                                                    <select class="form-control" id="titre" name="titre">
                                                        <option value="Mr">Monsieur</option>
                                                        <option value="Mme">Madame</option>
                                                        <option value="Dle">Demoiselle</option>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="form-group col-lg-4 col-lg-push-2">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="1">droit au credit </input>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-8 col-lg-push-2">

                                         <div class="form-group">
                                            <label for="nom">Nom du client</label>
                                            <input class="form-control" id="nom" name="nom">
                                        </div>
                                        <div class="form-group">
                                            <label for="prenom">Prenom du client</label>
                                            <input class="form-control" id="prenom" name="prenom">
                                        </div>
                                        <div class="form-group">
                                            <label for="naissance">Date naissance</label>
                                            <input type="text" class="form-control mydatepicker" placeholder="DD/MM/YYY" id="naissance" name="naissance"/>
                                        </div>
                                    </div> 

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="tel1">Telephone 1</label>
                                                <input class="form-control" id="tel1" name="tel1">
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tel2">Telephone 2</label>
                                                <input class="form-control" id="tel2" name="tel2">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="adresse">Adresse</label>
                                                <input class="form-control" id="adresse" name="adresse">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="credit">Credit maximum</label>
                                                <input class="form-control" id="credit" name="credit">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="remise">Remise</label>
                                                <input class="form-control" id="remise" name="remise">
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group col-lg-6">
                                                    <label for="depassement">Depassement</label>
                                                    <select class="form-control" id="depassement" name="depassement">
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="15">15</option>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group col-lg-6">
                                                    <label for="delai">Delai(en jours)</label>
                                                    <select class="form-control" id="delai" name="delai">
                                                        <option value="1">1</option>
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                    </select> 
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    

                                    <div class="col-lg-8 col-lg-push-2">
                                        <button type="submit" class="btn btn-success col-lg-5" name="submit">Enregistrer le client</button>
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

</body>

</html>