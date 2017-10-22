<?php
global $bdd;
$commercial= $bdd->prepare('SELECT code_com, nom_com, prenom_com FROM commerciale where deleted = 0');
$commercial->execute();
$data=$commercial->fetchAll();
$four=array();

?>
        
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header col-lg-6 col-lg-offset-3">ENREGISTREMENT CLIENT</h1>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">

                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="row">

                                <form role="form" method="post" action="pages/administration/Client/script_ajout_client.php">


                                    <formgroup class="col-lg-6">
                                        <div class=" form-group col-lg-12">
                                            <h3 class="col-lg-10 col-lg-offset-1">INFORMATIONS GENERALES</h3>

                                            <div class="form-group col-lg-4">
                                                <label for="titre">* Titre</label>
                                                <select class="form-control" id="titre" name="titre">
                                                    <option value="Mr">Monsieur</option>
                                                    <option value="Mme">Madame</option>
                                                    <option value="Dle">Demoiselle</option>
                                                </select> 
                                            </div>   

                                            <div class="form-group col-lg-8">
                                                <label for="nom">* Nom du client</label>
                                                <input class="form-control" type="text" id="nom" name="nom" REQUIRED/>
                                            </div>

                                            <div class="form-group col-lg-12">
                                                <label for="prenom">* Prénom(s) du client</label>
                                                <input class="form-control" type="text" id="prenom" name="prenom" REQUIRED/>
                                            </div>


                                            <div class="form-group col-lg-6">
                                                <label for="piece">* Type piece </label>
                                                <select  class="form-control"  id="piece" name="piece">
                                                    <option value="CNI" selected>CNI</option>
                                                    <option value="PP">PASSEPORT</option>
                                                    <option value="CE">CARTE ELECTEUR</option>
                                                </select>
                                            </div>

                                            <div class="form-group col-lg-6">
                                                <label for="datep">*Date piece </label> <i class="fa fa-calendar"></i>
                                                <input type="text" class="form-control datepicker" data-provide="datepicker" placeholder="YYYY/MM/DD" id="datep" name="datep" REQUIRED/>
                                            </div>

                                            <div class="form-group col-lg-6 col-lg-offset-3">
                                                <label class="col-lg-8 col-lg-offset-2" for="numpiece">*Numero Piece</label>
                                                <input type="text" class="form-control" id="numpiece" name="numpiece" REQUIRED/>
                                            </div>

                                        </div>
                                    </formgroup> 

                                    <formgroup class="col-lg-6">
                                        <div class=" form-group col-lg-12">
                                            <h3 class="col-lg-10 col-lg-offset-1">INFORMATIONS DE COMPTE</h3>
                                                
                                            <div class="form-group col-lg-6">
                                                <label for="commercial">* Commercial</label>
                                                <select class="form-control" id="commercial" name="commercial">
                                                <?php foreach ($data as $d) { ?>
                                                    <option value="<?php echo $d->code_com; ?>"><?php echo $d->nom_com." ".$d->prenom_com; ?></option>
                                                <?php } ?>
                                                </select>
                                            </div>

                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="remise">Remise (%)</label>
                                                <input type="number" class="form-control" id="remise" name="remise">
                                            </div>

                                            <hr class="form-group col-lg-8 col-lg-offset-2">                                       
                                    
                                            <div class="form-group col-lg-10 col-lg-offset-1">
                                                <label class="col-lg-6 col-lg-offset-1">Droit au credit</label>
                                                <input class="col-lg-1 col-lg-offset-3" type="checkbox"  onclick="desactiveCDD();" id="droit" name="droit" value="1">
                                            </div>
                                            

                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="credit">Credit maximum (FCFA)</label>
                                                <input type="number" disabled class="form-control" id="credit" name="credit">
                                            </div>

                                            <div class="form-group col-lg-6">
                                                <label for="depassement">Depassement (%)</label>
                                                <select class="form-control" disabled id="depassement" name="depassement">
                                                    <option value="1">1</option>
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                    <option value="15">15</option>
                                                    <option value="30">30</option>
                                                </select>
                                            </div>

                                            <div class="form-group col-lg-6 col-lg-offset-3">
                                                <label class="col-lg-8 col-lg-offset-2" for="delai">Delai(en jours)</label>
                                                <select class="form-control" id="delai" disabled name="delai">
                                                    <option value="15">15</option>
                                                    <option value="30">30</option>
                                                    <option value="45">45</option>
                                                    <option value="60">60</option>
                                                    <option value="90">90</option>
                                                    <option value="180">180</option>
                                                </select> 
                                            </div> 

                                        </div>
                                    </formgroup> 

                                    <hr class="form-group col-lg-8 col-lg-offset-2">

                                    <formgroup class="col-lg-8 col-lg-push-2">
                                        <div class=" form-group col-lg-12">
                                            <h3 class="col-lg-10 col-lg-push-3">CONTACTS DU CLIENT</h3>

                                            <div class="form-group col-lg-3">
                                                <label for="tel1">* Téléphone 1</label>
                                                <input type="number" class="form-control" id="tel1" name="tel1" REQUIRED/>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <label for="tel2">Téléphone 2</label>
                                                <input type="number" class="form-control" id="tel2" name="tel2">
                                            </div>

                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email">
                                            </div>

                                            <div class="form-group col-lg-12 col-xm-2">
                                                <label for="adresse">* Adresse</label>
                                                <input class="form-control" id="adresse" name="adresse" REQUIRED/>
                                            </div>

                                        </div>
                                    </formgroup>                                        

                                    <hr class="form-group col-lg-10 col-lg-offset-1">

                                    
                                    <div class="col-lg-8 col-lg-push-2">
                                        <input type="reset" class="btn btn-default btn-lg  col-lg-5" value="ANNULER" name="reset" />
                                        <input type="submit" class="btn btn-success btn-lg  col-lg-5 col-lg-push-2" name="addcli" value="ENREGISTRER" />
                                    </div>
                                </form>
                            </div>

                            </div>
                    </div>
                </div>

            </div>

    <!-- Custom Theme JavaScript -->


    <script type="text/javascript" src="../../../assets/js/bootstrap-datepicker.min.js"></script>
    <script>

    function desactiveCDD(){
        if (document.getElementById('droit').checked == true){
           document.getElementById('credit').disabled = false;
           document.getElementById('depassement').disabled = false;
           document.getElementById('delai').disabled = false;
        }else{
            document.getElementById('credit').disabled = true;
            document.getElementById('depassement').disabled = true;
            document.getElementById('delai').disabled = true;
        }
    };

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