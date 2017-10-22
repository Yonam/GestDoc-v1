
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">CONFIGURATION SOCIETE</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                                      <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="pages/administration/Client/script_ajout_client.php">

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="type">Type</label>
                                                <select class="form-control" id="type" name="type">
                                                    <option value="Ets">Etablissement</option>
                                                    <option value="Sarl">SARL</option>
                                                    <option value="SA">Societe Anonyme</option>
													<option value="SA">Autre</option>
                                                </select> 
                                            </div>
											<div class="form-group col-lg-6" >
                                            <label for="rs">Raison Social</label>
                                            <input class="form-control" type="text" id="rs" name="rs" REQUIRED/>
                                        </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-8 col-lg-push-2">

                                         <div class="form-group col-lg-6" >
                                            <label for="nif">NIF OU COE</label>
                                            <input class="form-control" type="text" id="nif" name="nif" REQUIRED/>
                                        </div>
								
                                         <div class="form-group col-lg-6">
                                                    <label for="copy">Copyright</label>
                                                    <input type="text" class="form-control" id="copy" name="copy">
                                         </div>
                                         
                                    </div> 

                                    <div class="col-lg-8 col-lg-push-2">
                                        <div class="form-group">
                                            <div class="form-group col-lg-6">
                                                <label for="tel1">Telephone 1 </label>
                                                <input type="phone" class="form-control" id="tel1" name="tel1" REQUIRED/>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tel2">Telephone 2</label>
                                                <input type="phone" class="form-control" id="tel2" name="tel2">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email">
                                            </div>
                                            
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="bp"> BP</label>
                                                <input type="text" class="form-control" id="bp" name="bp">
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group col-lg-6 col-xm-2">
                                                <label for="ville">Ville</label>
                                                <input type="text" class="form-control" id="ville" name="ville">
                                            </div>
											<div class="form-group col-lg-6 col-xm-2">
                                                <label for="pays">Pays</label>
                                                <input type="text" class="form-control" id="pays" name="pays">
                                            </div>
                                            </div>
											<div class="form-group col-lg-6 col-xm-2">
                                                <label for="adresse">Adresse</label>
                                                <textarea class="form-control" id="adresse" name="adresse" REQUIRED> 
												Situation Géographique
												</textarea>
                                            </div>
											<div class="form-group col-lg-6 col-xm-2">
                                    <h3>LOGO</h3>
                                    <div class="form-group" id="prev">
                                    </div>
                                    <div class="form-group">
                                        <label for="photo">File input</label>
                                        <input type="file" id="photo" name="photo">
                                    </div>
                                </div>
                                            
                                        </div>
                                    </div> 
                                    

                                    <div class="col-lg-8 col-lg-push-2">
                                        <input type="submit" class="btn btn-success col-lg-5" name="addcli" value="Enregistrer" />
                                        <input type="reset" class="btn btn-danger col-lg-5 col-lg-push-2" value="Annuler" name="reset" />
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

    <script type="text/javascript" src="../../../assets/js/bootstrap-datepicker.min.js"></script>
    <script>
    $(document).ready(function(){
        var date_input=$('input[name="datep"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            language: 'fr',
            format: 'yyyy/mm/dd',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
    </script>

</body>

</html>