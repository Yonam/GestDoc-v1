<?php
if (isset($_GET['del'])) {
  $panier->del($_GET['del']);
}

$reqt=$bdd->query("SELECT CODE_JOURNEE FROM journee WHERE statut = 0");
    $domas=$reqt->fetch();
    $final = 0;
    if ($domas == false) {
        echo '<meta http-equiv="refresh" content="0;URL=?page=interdit">';
    }else{
        if ($domas->CODE_JOURNEE != 0) { ?>
            
             <div class="panel-body">
     <div class="row">
       <div class="col-lg-12">
              <h2 style="text-align: center">Informations generales de vente</h2>
         <form role="form" method="post" action="pages/administration/Client/script_ajout_client.php">
            
         <div class="col-lg-5">
           <formgroup class="col-lg-12" style="border: grey 0.1em solid; height: 5em; border-radius: 1em;">
              <h3 class="col-lg-8 col-lg-offset-2">COMPTOIR</h3>
              <input class="col-lg-1" type="checkbox" name="comptoir" id="comptoir" checked>
            </formgroup>


            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>

            <formgroup class="col-lg-12" style="border: grey 0.1em solid; height: 11.5em; border-radius: 1em;">
              <div class="col-lg-12">
                <h4 class="col-lg-11">CHEQUE BANCAIRE</h4>
                <input class="col-lg-1" type="checkbox" disabled name="cheque_bancaire" id="cheque_bancaire">
              </div>
                <div class="form-group col-lg-12">
                  <select class="form-control" disabled id="id_banque" name="id_banque">
                    <option value="" selected>+BANQUE+</option>
                  </select> 
                </div>
              <div class="form-group col-lg-12">
                  <label class="control-label">Date du chèque</label>
                  <input type="number" class="form-control" id="date_cheque" name="date_cheque" disabled>
              </div >               
            </formgroup>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <div class="col-lg-12"></div>
            <formgroup class="col-lg-12" style="border: grey 0.1em solid; height: 11.5em; border-radius: 1em;">
              
              <div class="col-lg-12">
                <h4 class="col-lg-11">CLIENTS D'ENTREPRISE</h4>
                <input class="col-lg-1" type="checkbox" disbaled name="client_entreprise" id="client_entreprise">                
              </div>

              <div class="col-lg-12">
                <div class="form-group col-lg-12">
                  <select class="form-control" disabled id="id_client" name="id_client">
                      <option value="" selected>+DENOMINATION+</option>
                  </select> 
                </div>

                <div class="form-group col-lg-12">
                    <label class="control-label">Représentant</label>
                    <input type="number" class="form-control" id="representant" name="representant" disabled >
                </div>                

              </div>
            </formgroup>

         </div>
            


            
            <formgroup class="col-lg-7" style="border: grey 0.1em solid; height: 29em; border-radius: 1em;">
              
              <div class="col-lg-12">
                <h4 class="col-lg-5 col-lg-offset-3">CHEQUE PAYANT</h4>
                <input class="col-lg-4" type="checkbox" disbaled name="cheque_payant" id="cheque_payant">                
              </div>

              <div class="col-lg-12">
                <div class="form-group col-lg-8 col-lg-offset-2">
                  <select class="form-control" disabled id="id_souscripteur" name="id_souscripteur">
                      <option value="" selected>+SOUSCRIPTEUR+</option>
                  </select> 
                </div>

                <div class="form-group col-lg-10 col-lg-offset-1">
                    <label class="control-label">Numéro de contrat</label>
                    <input type="number" class="form-control" id="num_contrat" name="num_contrat" disabled >
                </div>                

                <div class="form-group col-lg-10 col-lg-offset-1">
                    <label class="control-label">Echéancier</label>
                    <input type="number" class="form-control" id="echeancier" name="echeancier" disabled >
                </div>                

                <div class="form-group col-lg-10 col-lg-offset-1">
                    <label class="control-label">Date de début</label>
                    <input type="number" class="form-control" id="date_debut" name="date_debut" disabled >
                </div>                

                <div class="form-group col-lg-10 col-lg-offset-1">
                    <label class="control-label">Date de fin</label>
                    <input type="number" class="form-control" id="date_fin" name="date_fin" disabled >
                </div>                
              </div>
            </formgroup>

            

          </form>

       </div>


     </div>

      <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Nouvelle vente</h1>
        </div>
       <!-- <div class="row">
          <div class="col-sm-6 col-sm-offset-3">
            <form method="post" action='http://localhost/Projet_Owo/index.php?page=vente'>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                    <input type="search" name="search" class="form-control">
                     <span class="input-group-btn"><button type="submit" name="search" class="btn btn-default"> go</button></span>
                </div>
            </form>
          </div>
        </div> -->
      </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Base de donnee des produits
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <?php if (count($produits) > 0): ?>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>Code CIP</th>
                                        <th>Désignation</th>
                                        <th>DCI</th>
                                        <th>Forme</th>
                                        <th>Prix</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($produits as $produit): ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $produit->CIP; ?></td>
                                        <td><?php echo $produit->DESIGNATION; ?></td>
                                        <td><?php echo $produit->DCI; ?></td>
                                        <td ><?php echo $produit->NOM_FORME; ?></td>
                                        <td ><?php echo $produit->PRIX_PRODUIT; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-success fa fa-plus" href="?page=addPanier&id=<?= $produit->CODE_PRODUIT; ?>"></a>
                                            <!-- <a class="btn btn-outline btn-success fa fa-plus" href="?page=vente&addOp=1&id=<?= $produit->CODE_PRODUIT; ?>"></a> -->
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?php else: ?>
                                    pas de produits
                            <?php endif; ?>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>


            <!--############### PANIER DES PRODUITS ################## -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          <div class="row">
                            <div class="col-lg-6">
                              <h2> Panier du client</h2><h4><?= $panier->count(); ?> Produits</h4> 
                            </div>
                          </div>
                        </div>
                        <!-- /.panel-heading -->
                        <form method="post" action="">
                             <div class="panel-body">
                             <div>
                              <input class="btn btn-outline btn-warning" type="submit" value="Recalculer" name="recalculer">
                              <input class="btn btn-outline btn-default col-lg-push-4" type="submit" value="Vider le panier" name="reinitialiser">
                               
                             </div>

                               <br/>
                              <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                  <thead>
                                      <tr>
                                          <th>Designation</th>
                                          <th>Nombre</th>
                                          <th>Prix unitaire</th>
                                          <th>Prix total</th>
                                          <th>Action</th>
                                      </tr>
                                  </thead>

                                  <tbody>
                                   <?php  
                                   // requete de recuperation des objets du panier
                                   $ids =array_keys($_SESSION['panier']);
                                   if (empty($ids)) {
                                     $produit = array();
                                   }else{

                                    global $bdd;
                                    $produit=$bdd->prepare('SELECT * FROM produit WHERE code_produit IN ('.implode(',',$ids).')');
                                    $produit->execute();
                                    $produit=$produit->fetchAll();
                                    
                                   }

                                  // recuperation des donnees
                                  foreach ($produit as $p) { ?>
                                    <tr class="odd gradeX">
                                      <td><?= $p->DESIGNATION; ?></td>
                                      <td><input type="text" value="<?= $_SESSION['panier'][$p->CODE_PRODUIT]; ?>" name="panier[quantite][<?= $p->CODE_PRODUIT ?>]" ></td>
                                      <td><?= $p->PRIX_PRODUIT; ?></td>
                                      <td><?= $panier->reviens($p->CODE_PRODUIT); ?></td>
                                      <td class="center">
                                          <a class="btn btn-outline btn-warning fa fa-trash-o" href="?page=vente&del=<?= $p->CODE_PRODUIT; ?>"></a>
                                      </td>
                                    </tr> 
                                         <?php } ?>
                                    <tr id="ancorPanier">
                                        <td colspan="2"><h3>Cout des marchandises : </h3></td>
                                        <td colspan="3"><h3><?= $panier->total(); ?></h3></td>
                                    </tr>
                                  </tbody>
                              </table>
                              <input class="btn btn-outline btn-primary" type="submit" name="panier" value="Valider la vente"
                              <?php  if($_SESSION['panier'] == []){ 
                                  echo "disabled";
                              }
                              ?>
                              >

                            <!-- <?= var_dump($_SESSION) ?> -->
                             </div>
                             
                        </form>
                        
                    
                    </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>


      <?php  }
        
    }

?>



          
