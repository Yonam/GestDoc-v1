           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">DICTIONNAIRE DES DONNEES</h1>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#banque">Banque</a></li>
                    <!-- <li><a data-toggle="tab" href="#classe">Classe</a></li>
                    <li><a data-toggle="tab" href="#laboratoire">Laboratoire</a></li>
                    <li><a data-toggle="tab" href="#specialite">Specialite</a></li>
                    <li><a data-toggle="tab" href="#exploitant">Exploitant</a></li> -->
                    <li><a data-toggle="tab" href="#famille">Famille</a></li>
                    <li><a data-toggle="tab" href="#forme">Forme</a></li>
                    <li><a data-toggle="tab" href="#localisation">Localisation</a></li>
                    <li><a data-toggle="tab" href="#motif">Motif</a></li>
                </ul>

        <div class="tab-content">
          <div id="banque" class="tab-pane fade in active">
                <div class="col-lg-12">
                    <h1 class="page-header">BANQUES</h1>
                </div>
                <!-- /.col-lg-12 -->

                <?php 
                    global $bdd;
                    $banque= $bdd->prepare('SELECT CODE_BANQUE, DESCRIPTION FROM banque');
                    $banque->execute();
                    $data=$banque->fetchAll();
					
                ?> 

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#banque_add"> AJOUTER</a>
                            <B>  <h3> Liste des Banques </h3></B>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th> Denomination Banque</th>
                                        <th>Action</th>
                                    </tr> </thead>
                                <tbody> 
                               <?php foreach ($data as $d) {
                                   # code...
                               ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $d->CODE_BANQUE; ?></td>
                                        <td><?php echo $d->DESCRIPTION; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#banque_mod<?= $d->CODE_BANQUE ?>"> MODIFIER</a>

                                                <!-- modal de modif -->

                                                    <div class="modal fade left" id="banque_mod<?= $d->CODE_BANQUE ?>">
                                                         <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">MODIFIER BANQUE <?= $d->DESCRIPTION ?></h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_banque.php">

                                                                        <input type="hidden" name="memids" value="<?php echo $d->CODE_BANQUE; ?>" />
                                                                            <span class="required">* Requis</span>
                                                                            <div class="form-group">
                                                                                <label for="code" class="col-sm-3 control-label">
                                                                                    <span class="required"></span> Codification:
                                                                                </label>
                                                                                <div class="col-sm-9">
                                                                                    <input type="text" class="form-control" id="code" name="code" value="
                                                                                    <?= $d->DESCRIPTION ?>
                                                                                    "/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                    <span class="required">*</span> Libelle:
                                                                                </label>
                                                                                <div class="col-sm-9">
                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="
                                                                                    <?php echo $d->DESCRIPTION ?>
                                                                                    " required/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="mod_bank" name="mod_bank" class="btn-lg btn-warning">Modifier</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                Modification banque
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                <!-- fin ;odal de modification -->

                                            <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#banque_sup<?= $d->CODE_BANQUE ?>"> SUPPRIMER</a>

                                            <div class="modal fade left" id="banque_sup<?= $d->CODE_BANQUE ?>">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h3 class="pull-left no-margin">SUPPRESSION BANQUE</h3>
                                                            <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">

                                                            <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_banque.php">
                                                                   <input type="hidden" name="memids" value="<?php echo $d->CODE_BANQUE; ?>" />
                                                                   <div class="form-group">        
                                                                    <div class="col-sm-9">
                                                                        Etes vous sur de vouloir supprimer ce enregistrement?
                                                                    <Br/>
                                                                    </div>
                                                                                  
                                                                    <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                        <button type="submit" id="bank_sup" name="bank_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                    </div>
                                                                </div>
                                                                <!--end Form-->
                                                            </form>
                                                              </div>
                                                         <div class="modal-footer">
                                                            <div class="col-xs-10 pull-left text-left text-muted">
                                                                <small>
                                                                    <strong>PS:</strong>
                                                                    
                                                                    Cette opÃ©ration est irreversible
                                                                </small>
                                                            </div>
                                                            <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
	    </div>

          <div id="classe" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">CLASSES</h1>
                        </div>
                        <!-- /.col-lg-12 -->

                        <?php
                            global $bdd;
                            $classe= $bdd->prepare('SELECT CODE_CLASSE, DESCRIPTION FROM classe_produit');
                            $classe->execute();
                            $data=$classe->fetchAll();
                        ?>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#classe_add"> AJOUTER</a>
                                        <B>  <h3> Liste des Classes </h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Denomination Classe</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                            <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $d->CODE_CLASSE; ?></td>
                                                    <td><?php echo $d->DESCRIPTION; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#classe_mod<?php echo $d->CODE_CLASSE; ?>"> MODIFIER</a>
                                                        <!-- modal modification de classe -->

                                                        <div class="modal fade left" id="classe_mod<?php echo $d->CODE_CLASSE; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">MODIFICATION DE LA CLASSE <?php echo $d->DESCRIPTION; ?> </h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_classe.php">

                                                                        <input type="hidden" name="memids" value="<?php echo $d->CODE_CLASSE; ?>" />
                                                                            <span class="required">* Requis</span>
                                                                            
                                                                            <div class="form-group">
                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                    <span class="required">*</span> Libelle:
                                                                                </label>
                                                                                <div class="col-sm-9">
                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="<?php echo $d->DESCRIPTION; ?>" required/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button class="btn-lg btn-primary" type="submit" id="classe_mod" name="classe_mod">Envoyer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                Formulaire de modification
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- fin modal modification de classe -->
                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#classe_sup"> SUPPRIMER</a>
                                                        <div class="modal fade left" id="classe_sup">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                                <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_classe.php">

                                                                        <input type="hidden" name="memids" value="<?php echo $d->CODE_CLASSE; ?>" />
                                                                               
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="classe_sup" name="classe_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversibler
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
        </div>
	
         <div id="exploitant" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">EXPLOITANTS</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                        <?php 
                            global $bdd;
                            $exploitant= $bdd->prepare('SELECT CODE_EXPLOITANT, LIBELLE FROM exploitant');
                            $exploitant->execute();
                            $data=$exploitant->fetchAll();
                        ?>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#exploitant_add"> AJOUTER</a>
                                        <B>  <h3> Liste des Exploitants</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Libelle Exploitant</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                            <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $d->CODE_EXPLOITANT; ?></td>
                                                    <td><?php echo $d->LIBELLE ; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#exploitant_mod<?php echo $d->CODE_EXPLOITANT; ?>"> MODIFIER</a>

                                                        <div class="modal fade left" id="exploitant_mod<?php echo $d->CODE_EXPLOITANT; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">MODIFIER </h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_exploitant.php">
                                                                            <span class="required">* Requis</span>
                                                                            
                                                                            <input type="hidden" name="memids" value="<?php echo $d->CODE_EXPLOITANT; ?>" />
                                                                            <div class="form-group">
                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                    <span class="required">*</span> Libelle:
                                                                                </label>
                                                                                <div class="col-sm-9">
                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="
                                                                                    <?Php echo $d->LIBELLE ;?>" required/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="exp_mod" name="exp_mod" class="btn-lg btn-warning">Modifier</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                Modification ...........
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#exploitant_sup<?php echo $d->CODE_EXPLOITANT; ?>"> SUPPRIMER</a>

                                                        <div class="modal fade left" id="exploitant_sup<?php echo $d->CODE_EXPLOITANT; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                                <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_exploitant.php">
                                                                               
                                                                               <input type="hidden" name="memids" value="<?php echo $d->CODE_EXPLOITANT; ?>" />
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="exp_sup" name="exp_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversible
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                     </div>
					
          <div id="famille" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">FAMILLE</h1>
                        </div>
                        <!-- /.col-lg-12 -->

                        <?php 
                            global $bdd;
                            $famille = $bdd->prepare('SELECT CODE_FAMILLE, NOM_FAMILLE FROM famille_produit');
                            $famille->execute();
                            $data=$famille->fetchAll();
                            ?>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#famille_add"> AJOUTER</a>
                                        <B>  <h3> Liste des Familles</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Libelle Famille</th>
                                                <th>Action</th></thead>
                                            </tr>
                                            <tbody>
                                           <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $d->CODE_FAMILLE; ?></td>
                                                    <td><?php echo $d->NOM_FAMILLE; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#famille_mod<?php echo $d->CODE_FAMILLE; ?>"> MODIFIER</a>





                                                      <div class="modal fade left" id="famille_mod<?php echo $d->CODE_FAMILLE; ?>">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h3 class="pull-left no-margin">MODIFIER </h3>
                                                                    <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">

                                                                    <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_famille.php">
                                                                        <span class="required">* Requis</span>
                                                                        
                                                                        <input type="hidden" name="memids" value="<?php echo $d->CODE_FAMILLE; ?>" />
                                                                        <div class="form-group">
                                                                            <label for="libelle" class="col-sm-3 control-label">
                                                                                <span class="required">*</span> Libelle:
                                                                            </label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" class="form-control" id="libelle" name="libelle" value="<?php echo $d->NOM_FAMILLE; ?>" " required/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                <button type="submit" id="modif_famille" name="modif_famille" class="btn-lg btn-warning">Modifier</button>
                                                                            </div>
                                                                        </div>
                                                                        <!--end Form-->
                                                                    </form>

                                                                </div>
                                                                <div class="modal-footer">
                                                                    <div class="col-xs-10 pull-left text-left text-muted">
                                                                        <small>
                                                                            <strong>PS:</strong>
                                                                            Modification ...........
                                                                        </small>
                                                                    </div>
                                                                    <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#famille_sup<?php echo $d->CODE_FAMILLE; ?>"> SUPPRIMER</a>

                                                    <div class="modal fade left" id="famille_sup<?php echo $d->CODE_FAMILLE; ?>">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                    <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                    </button>
                                                                </div>
                                                                           <div class="modal-body">

                                                                    <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_famille.php">
                                                                           
                                                                           <input type="hidden" name="memids" value="<?php echo $d->CODE_FAMILLE; ?>" />
                                                                           <div class="form-group">        
                                                                            <div class="col-sm-9">
                                                                                Etes vous sur de vouloir supprimer ce enregistrement?
                                                                            <Br/>
                                                                            </div>
                                                                                          
                                                                            <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                <button type="submit" id="famille_sup" name="famille_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                            </div>
                                                                        </div>
                                                                        <!--end Form-->
                                                                    </form>
                                                                      </div>
                                                                 <div class="modal-footer">
                                                                    <div class="col-xs-10 pull-left text-left text-muted">
                                                                        <small>
                                                                            <strong>PS:</strong>
                                                                            
                                                                            Cette opÃ©ration est irreversible
                                                                        </small>
                                                                    </div>
                                                                    <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                                                    					
          <div id="forme" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">FORME</h1>
                        </div>
                        <!-- /.col-lg-12 -->

                        <?php 
                            global $bdd;
                            $forme = $bdd->prepare('SELECT CODE_FORME, NOM_FORME FROM forme');
                            $forme->execute();
                            $data=$forme->fetchAll();
                        ?>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#forme_add"> AJOUTER</a>
                                        <B>  <h3> Liste des Formes</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Libelle Forme</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                            <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $d->CODE_FORME; ?></td>
                                                    <td><?php echo $d->NOM_FORME; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#forme_mod<?php echo $d->CODE_FORME; ?>"> MODIFIER</a>




                                                        <div class="modal fade left" id="forme_mod<?php echo $d->CODE_FORME; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">MODIFIER LA FORME <?= $d->NOM_FORME; ?></h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <form class="form-horizontal" method="post" action="pages/administration/parametre/Modifications/script_modif_forme.php">
                                                                            <span class="required">* Requis</span>
                                                                          
                                                                          <input type="hidden" name="memids" value="<?php echo $d->CODE_FORME; ?>" />
                                                                            <div class="form-group">
                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                    <span class="required">*</span> Libelle:
                                                                                </label>
                                                                                <div class="col-sm-9">
                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="<?= $d->NOM_FORME; ?>" required/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="forme_mod" name="forme_mod" class="btn-lg btn-warning">Modifier</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                Modification ...........
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>





                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#forme_sup<?php echo $d->CODE_FORME; ?>"> SUPPRIMER</a>

                                                        <div class="modal fade left" id="forme_sup<?php echo $d->CODE_FORME; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                        <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_forme.php">
                                                                               
                                                                               <input type="hidden" name="memids" value="<?php echo $d->CODE_FORME; ?>" />
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="forme_sup" name="forme_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversible
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                    </div>
					
          <div id="laboratoire" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">LABORATOIRE</h1>
                        </div>
                        <!-- /.col-lg-12 -->

                        <div class="row">
						 <?php 
                            global $bdd;
                            $laboratoire = $bdd->prepare('SELECT CODE_LAB, NOM_LABORATOIRE FROM laboratoire');
                            $laboratoire->execute();
                            $data=$laboratoire->fetchAll();
                        ?>
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#labo_add"> AJOUTER</a>
                                        <B>  <h3> Liste des Laboratoires</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Libelle Laboratoire</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                            <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $d->CODE_LAB; ?></td>
                                                    <td><?php echo $d->NOM_LABORATOIRE; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#labo_mod<?php echo $d->CODE_LAB; ?>"> MODIFIER</a>

                                                                <div class="modal fade left" id="labo_mod<?php echo $d->CODE_LAB; ?>">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h3 class="pull-left no-margin">MODIFIER LE LABORATOIRE <?php echo $d->NOM_LABORATOIRE; ?> </h3>
                                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">

                                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_laboratoire.php">
                                                                                            <span class="required">* Requis</span>
                                                                                            
                                                                                            <input type="hidden" name="memids" value="<?php echo $d->CODE_LAB; ?>" />
                                                                                            <div class="form-group">
                                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                                    <span class="required">*</span> Libelle:
                                                                                                </label>
                                                                                                <div class="col-sm-9">
                                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="<?php echo $d->NOM_LABORATOIRE; ?>" required/>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                                    <button type="submit" id="mod_labo" name="mod_labo" class="btn-lg btn-warning">Modifier</button>
                                                                                                </div>
                                                                                            </div>
                                                                                            <!--end Form-->
                                                                                        </form>

                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                                            <small>
                                                                                                <strong>PS:</strong>
                                                                                                Modification ...........
                                                                                            </small>
                                                                                        </div>
                                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>




                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#labo_sup<?php echo $d->CODE_LAB; ?>"> SUPPRIMER</a>

                                                        <div class="modal fade left" id="labo_sup<?php echo $d->CODE_LAB; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                               <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_laboratoire.php">
                                                                               
                                                                               <input type="hidden" name="memids" value="<?php echo $d->CODE_LAB; ?>" />
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="laboratoire_sup" name="laboratoire_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversible
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                    </div>
					
          <div id="localisation" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">LOCALISATION</h1>
                        </div>
                        <!-- /.col-lg-12 -->
	                    <?php 
                            global $bdd;
                            $localisation= $bdd->prepare('SELECT CODE_LOCALISATION, NOM_LOCALISATION FROM localisation');
                            $localisation->execute();
                            $data=$localisation->fetchAll();
                        ?>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#loc_add"> AJOUTER</a>
                                        <B>  <h3> Liste des Localisations</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Libelle Localisation</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                            <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $d->CODE_LOCALISATION; ?></td>
                                                    <td><?php echo $d->NOM_LOCALISATION; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#loc_mod<?php echo $d->CODE_LOCALISATION; ?>"> MODIFIER</a>




                                                                            <div class="modal fade left" id="loc_mod<?php echo $d->CODE_LOCALISATION; ?>">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h3 class="pull-left no-margin">MODIFIER LA LOCALISATION <?php echo $d->NOM_LOCALISATION; ?> </h3>
                                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">

                                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_localisation.php">
                                                                                            <span class="required">* Requis</span>
                                                                                            
                                                                                            <input type="hidden" name="memids" value="<?php echo $d->CODE_LOCALISATION; ?>" />
                                                                                            <div class="form-group">
                                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                                    <span class="required">*</span> Libelle:
                                                                                                </label>
                                                                                                <div class="col-sm-9">
                                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="<?php echo $d->NOM_LOCALISATION; ?>" required/>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                                    <button type="submit" id="mod_loc" name="mod_loc" class="btn-lg btn-warning">Modifier</button>
                                                                                                </div>
                                                                                            </div>
                                                                                            <!--end Form-->
                                                                                        </form>

                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                                            <small>
                                                                                                <strong>PS:</strong>
                                                                                                Modification ...........
                                                                                            </small>
                                                                                        </div>
                                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#loc_sup<?php echo $d->CODE_LOCALISATION; ?>"> SUPPRIMER</a>

                                                        <div class="modal fade left" id="loc_sup<?php echo $d->CODE_LOCALISATION; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_localisation.php">
                                                                               <input type="hidden" name="memids" value="<?php echo $d->CODE_LOCALISATION; ?>" />
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="loc_sup" name="loc_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversible
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                    </div>
					
          <div id="motif" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">MOTIFS</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                          <?php 
                            global $bdd;
                            $motif= $bdd->prepare('SELECT CODE_MOTIF, DESCRIPTION FROM motif');
                            $motif->execute();
                            $data=$motif->fetchAll();
                        ?>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#motif_add"> AJOUTER</a>
                                        <B>  <h3> Motifs de Mise en Rebus</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Code </th>
                                                <th>Libelle Motifs</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                             <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                   <td><?php echo $d->CODE_MOTIF; ?></td>
                                                    <td><?php echo $d->DESCRIPTION; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#motif_mod<?php echo $d->CODE_MOTIF; ?>"> MODIFIER</a>


                                                                            <div class="modal fade left" id="motif_mod<?php echo $d->CODE_MOTIF; ?>">
                                                                                <div class="modal-dialog">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header">
                                                                                            <h3 class="pull-left no-margin">MODIFIER LE MOTIF <?php echo $d->DESCRIPTION; ?></h3>
                                                                                            <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body">

                                                                                            <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_motif.php">

                                                                                            <input type="hidden" name="memids" value="<?php echo $d->CODE_MOTIF; ?>" />
                                                                                                <span class="required">* Requis</span>
                                                                                               
                                                                                                <div class="form-group">
                                                                                                    <label for="libelle" class="col-sm-3 control-label">
                                                                                                        <span class="required">*</span> Libelle:
                                                                                                    </label>
                                                                                                    <div class="col-sm-9">
                                                                                                        <input type="text" class="form-control" id="libelle" name="libelle" value="<?php echo $d->DESCRIPTION; ?>" required/>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                                        <button type="submit" id="motif_mod" name="motif_mod" class="btn-lg btn-warning">Modifier</button>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <!--end Form-->
                                                                                            </form>

                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <div class="col-xs-10 pull-left text-left text-muted">
                                                                                                <small>
                                                                                                    <strong>PS:</strong>
                                                                                                    Modification ...........
                                                                                                </small>
                                                                                            </div>
                                                                                            <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>



                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#motif_sup<?php echo $d->CODE_MOTIF; ?>"> SUPPRIMER</a>

                                                        <div class="modal fade left" id="motif_sup<?php echo $d->CODE_MOTIF; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                                <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_motif.php">
                                                                               
                                                                               <input type="hidden" name="memids" value="<?php echo $d->CODE_MOTIF; ?>" />
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="motif_sup" name="motif_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversible
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                    </div>
					
          <div id="specialite" class="tab-pane fade">
                        <div class="col-lg-12">
                            <h1 class="page-header">SPECIALITES</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                        <?php 
                            global $bdd;
                            $specialite= $bdd->prepare('SELECT CODE_SPECIALITE, NOM_SPECIALITE FROM specialite');
                            $specialite->execute();
                            $data=$specialite->fetchAll();
                        ?>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="btn btn-outline btn-primary fa fa-plus" data-toggle="modal" data-target="#special_add"> AJOUTER</a>
                                        <B>  <h3> Liste des specialites</h3></B>

                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                            <tr>
                                                <th>Codification </th>
                                                <th>Libelle Specialite</th>
                                                <th>Action</th>
                                            </tr></thead>
                                            <tbody>
                                            <?php foreach ($data as $d) {  ?>
                                                <tr class="odd gradeX">
                                                     <td><?php echo $d->CODE_SPECIALITE; ?></td>
                                                    <td><?php echo $d->NOM_SPECIALITE; ?></td>
                                                    <td class="center">
                                                        <a class="btn btn-outline btn-success fa fa-edit" data-toggle="modal" data-target="#special_mod<?php echo $d->CODE_SPECIALITE; ?>"> MODIFIER</a>


                                                        <div class="modal fade left" id="special_mod<?php echo $d->CODE_SPECIALITE; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">MODIFIER </h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_specialite.php">
                                                                            <span class="required">* Requis</span>

                                                                            <input type="hidden" name="memids" value="<?php echo $d->CODE_SPECIALITE; ?>" />
                                                                            <div class="form-group">
                                                                                <label for="libelle" class="col-sm-3 control-label">
                                                                                    <span class="required">*</span> Libelle:
                                                                                </label>
                                                                                <div class="col-sm-9">
                                                                                    <input type="text" class="form-control" id="libelle" name="libelle" value="<?php echo $d->NOM_SPECIALITE; ?>" required/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="special_mod" name="special_mod" class="btn-lg btn-warning">Modifier</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                Modification ...........
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <a class="btn btn-outline btn-warning fa fa-times" data-toggle="modal" data-target="#special_sup<?php echo $d->CODE_SPECIALITE; ?>"> SUPPRIMER</a>

                                                        <div class="modal fade left" id="special_sup<?php echo $d->CODE_SPECIALITE; ?>">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h3 class="pull-left no-margin">SUPPRESSION</h3>
                                                                        <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                                                                        </button>
                                                                    </div>
                                                                                <div class="modal-body">

                                                                        <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/Modifications/script_modif_specialite.php">
                                                                               
                                                                               <input type="hidden" name="memids" value="<?php echo $d->CODE_SPECIALITE; ?>" />
                                                                               <div class="form-group">        
                                                                                <div class="col-sm-9">
                                                                                    Etes vous sur de vouloir supprimer ce enregistrement?
                                                                                <Br/>
                                                                                </div>
                                                                                              
                                                                                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                                                                                    <button type="submit" id="special_sup" name="special_sup" class="btn-lg btn-danger">Supprimer</button>
                                                                                </div>
                                                                            </div>
                                                                            <!--end Form-->
                                                                        </form>
                                                                          </div>
                                                                     <div class="modal-footer">
                                                                        <div class="col-xs-10 pull-left text-left text-muted">
                                                                            <small>
                                                                                <strong>PS:</strong>
                                                                                
                                                                                Cette opÃ©ration est irreversible
                                                                            </small>
                                                                        </div>
                                                                        <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                    </div>

       </div>
</div>

<!-- formulaire popup -->
<!--Begin Modal Window-->
<!-- Modal Window  banque-->
<div class="modal fade left" id="banque_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUTER BANQUE</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_banque.php">
                    <span class="required">* Requis</span>
                    <div class="form-group">
                        <label for="numero_banque" class="col-sm-3 control-label">
                            <span class="required"></span> Numero:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="numero_banque" name="numero_banque" placeholder="Codification"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="bank_add" name="bank_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajout des banques
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal Window  classe-->


<div class="modal fade left" id="classe_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">CREATION DE CLASSE </h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_classe.php">
                    <span class="required">* Requis</span>
                    
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="
                            <?Php


                            ?>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="classe_add" name="classe_add" class="btn-lg btn-warning">creer la classe</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Modification ...........
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal Window  exploitant-->
<div class="modal fade left" id="exploitant_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT D'UN EXPLOITANT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_exploitant.php">
                    <span class="required">* Requis</span>
                    
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="exp_add" name="exp_add" class="btn-lg btn-primary">Enregistrer l'exploitant</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal Window  famille-->
<div class="modal fade left" id="famille_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_famille.php">
                    <span class="required">* Requis</span>
                    
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="famille_add" name="famille_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Window  forme-->
<div class="modal fade left" id="forme_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_forme.php">
                    <span class="required">* Requis</span>
                    
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="forme_add" name="forme_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>




<!-- Modal Window  labortatoire-->
<div class="modal fade left" id="labo_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_laboratoire.php">
                    <span class="required">* Requis</span>
                   
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="labo_add" name="labo_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>




<!-- Modal Window  localisation-->
<div class="modal fade left" id="loc_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_localisation.php">
                    <span class="required">* Requis</span>
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="loc_add" name="loc_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal Window  motif-->
<div class="modal fade left" id="motif_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_motif.php">
                    <span class="required">* Requis</span>
                    
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="motif_add" name="motif_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>




<!-- Modal Window  specialite-->
<div class="modal fade left" id="special_add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="pull-left no-margin">AJOUT</h3>
                <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
                </button>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="pages/administration/parametre/ajouts/script_ajout_specialite.php">
                    <span class="required">* Requis</span>
                    <div class="form-group">
                        <label for="libelle" class="col-sm-3 control-label">
                            <span class="required">*</span> Libelle:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="libelle" name="libelle" placeholder="" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                            <button type="submit" id="special_add" name="special_add" class="btn-lg btn-primary">Envoyer</button>
                        </div>
                    </div>
                    <!--end Form-->
                </form>

            </div>
            <div class="modal-footer">
                <div class="col-xs-10 pull-left text-left text-muted">
                    <small>
                        <strong>PS:</strong>
                        Formulaire d'ajouts
                    </small>
                </div>
                <button class="btn-sm close" type="button" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>



