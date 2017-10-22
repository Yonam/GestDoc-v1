
        
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Entree en stock</h1>
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

                                    
                                    <div class="row">
                                        
                                        <div class="col-lg-10 col-lg-push-1">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label for="fournisseur">Fournisseur</label>
                                                    <select class="form-control" id="fournisseur" name="fournisseur">
                                                        <option value="fournisseur1">fournisseur1</option>
                                                        <option value="fournisseur12">fournisseur12</option>
                                                        <option value="fournisseur13">fournisseur13</option>
                                                    </select> 
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <label for="date">Date d'entree</label>
                                                    <input class="form-control" id="date" name="date">
                                                </div>
                                                <div class="form-group col-lg-6 col-xm-2">
                                                    <label for="facture">Numero facture</label>
                                                    <input type="facture" class="form-control" id="facture" name="facture">
                                                </div>
                                                <div class="form-group col-lg-12 col-xm-2">
                                                    <label for="bordereau">Numero de bordereau</label>
                                                    <input class="form-control" id="bordereau" name="bordereau">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- tableau de produits existants dans la base-->
                                    <div class="row">
                                        <div class="col-lg-10 col-lg-push-1">
                                            <div class="form-group">
                                                <div class="form-group">
                                                <hr style="border-top: 0.2em solid grey">
                                                    <label for="produit" ><h2 >Produit</h2></label>
                                                <hr style="border-top: 0.2em solid grey">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            Base de donnee des produits
                                                        </div>
                                                        <!-- /.panel-heading -->
                                                        <div class="panel-body">
                                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Designation</th>
                                                                        <th>Qte en stock</th>
                                                                        <th>Forme</th>
                                                                        <th>DCI</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td class="center">
                                                                            <button class="btn btn-outline btn-primary fa fa-plus" id="popup" onclick="div_show()">Ajouter</button>
                                                                        </td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!-- /.panel-body -->
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    
                                    <!-- tableau des produits livres avec leurs quantites respectives -->
                                    <div class="row">
                                        <div class="col-lg-10 col-lg-push-1">
                                            <div class="form-group">
                                                <div class="form-group">
                                                <hr style="border-top: 0.2em solid grey">
                                                    <label for="produit" ><h2 >Entree en stock</h2></label>
                                                <hr style="border-top: 0.2em solid grey">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            Liste des produits
                                                        </div>
                                                        <!-- /.panel-heading -->
                                                        <div class="panel-body">
                                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Designation</th>
                                                                        <th>Quantite livree</th>
                                                                        <th>Qte gratuite</th>
                                                                        <th>Qte payante</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td><?php echo 'donnees'; ?></td>
                                                                        <td class="center">
                                                                            <a class="btn btn-outline btn-primary fa fa-gear" href="#"></a>
                                                                            <a class="btn btn-outline btn-success fa fa-times" href="#"></a>
                                                                        </td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!-- /.panel-body -->
                                                    </div> 
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

            <!-- formulaire popup -->
            <form action="#" id="form" method="post" name="form">
                <div id="body" style="overflow: hidden;">
                    <div class="row" id="abc">
                        <div class="col-lg-8" id="popupContact">
                            <div class="form-group">
                                <h2> les quantites</h2>
                                <div class="form-group col-lg-6">
                                    <label for="quantite">Quantite livree</label>
                                    <input class="form-control" id="quantite" name="quantite">
                                </div>
                                <div class="form-group">
                                    <div class="form-group col-lg-6">
                                        <label for="payante">Quantite payante</label>
                                        <input class="form-control" id="payante" name="payante">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group col-lg-6">
                                        <label for="gratuite">Quantite gratuite </label>
                                        <input class="form-control" id="gratuite" name="gratuite    ">
                                    </div>
                                </div>
                                <div class="col-lg-8 col-lg-push-2">
                                    <a class="btn btn-outline btn-primary fa fa-check" href="javascript:%20check_empty()" id="submit">Valider</a>
                                    <a class="btn btn-outline btn-danger fa fa-times" href="#" onclick="div_hide()" id="close"></a>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>
            </form>





    <!-- Custom Theme JavaScript -->
    
    <script type="text/javascript" src="/assets/js/bootstrap-datepicker.min.js"></script>
    <script>
        // Validating Empty Field
function check_empty() {
if (document.getElementById('quantite').value == "" || document.getElementById('payante').value == "" || document.getElementById('gratuite').value == "") {
alert("Remplissez tous les champs !");
} else {
document.getElementById('form').submit();
alert("Enregistre...");
}
}
//Function To Display Popup
function div_show() {
document.getElementById('abc').style.display = "block";
}
//Function to Hide Popup
function div_hide(){
document.getElementById('abc').style.display = "none";
}
    </script>
    
</body>

</html>