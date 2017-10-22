<?php
global$bdd;
$dd="";
$df="";

if (isset($_POST['dated']) && isset($_POST['datef']) && $_POST['dated'] !='' && $_POST['datef'] !='' ) {
     $dd = $_POST['dated'];
     $df = $_POST['datef'];

     $produit1=$bdd->prepare("SELECT
P.DCI,
F.NOM_FORME,
F.CODE_FORME,
P.DESIGNATION,
P.DATE_COMMERCIALISATION,
P.DATE_ENREGISTREMENT,
PF.DATE_PEREMPTION,
PF.CODE_PRODUIT,
PS.QTE_SORTIE
FROM
produit AS P
Inner Join forme AS F ON P.CODE_FORME = F.CODE_FORME INNER JOIN 
produit_entree_fournisseur AS PF ON PF.CODE_PRODUIT=P.CODE_PRODUIT
 inner join
produit_sortie AS  PS ON PS.CODE_PRODUIT=P.CODE_PRODUIT
WHERE PF.DATE_PEREMPTION
   BETWEEN '".$_POST['dated']."' AND '".$_POST['datef']."'");
$produit1->execute();
$data1=$produit1->fetchAll();


}elseif((isset($_POST['nb'])) && $_POST['nb']!=''){
    $nb=$_POST['nb'];

     $produit2=$bdd->prepare("SELECT
P.DCI,
F.NOM_FORME,
F.CODE_FORME,
P.DESIGNATION,
P.DATE_COMMERCIALISATION,
P.DATE_ENREGISTREMENT,
PF.DATE_PEREMPTION,
PF.CODE_PRODUIT,
PS.QTE_SORTIE
FROM
produit AS P
Inner Join forme AS F ON P.CODE_FORME = F.CODE_FORME INNER JOIN 
produit_entree_fournisseur AS PF ON PF.CODE_PRODUIT=P.CODE_PRODUIT inner join
produit_sortie AS  PS ON PS.CODE_PRODUIT=P.CODE_PRODUIT WHERE PF.DATE_PEREMPTION<=(CURdate()-'".$_POST['nb']."')");
$produit2->execute();
$data2=$produit2->fetchAll();

 }else{
$produit3= $bdd->prepare('SELECT
P.DCI,
F.NOM_FORME,
F.CODE_FORME,
P.DESIGNATION,
P.DATE_COMMERCIALISATION,
P.DATE_ENREGISTREMENT,
PF.DATE_PEREMPTION,
PF.CODE_PRODUIT,
PS.QTE_SORTIE
FROM
produit AS P
Inner Join forme AS F ON P.CODE_FORME = F.CODE_FORME
Inner Join produit_entree_fournisseur AS PF ON PF.CODE_PRODUIT = P.CODE_PRODUIT inner join
produit_sortie AS  PS ON PS.CODE_PRODUIT=P.CODE_PRODUIT
');
$produit3->execute();
$data3=$produit3->fetchAll();

}

$four=array();
?>

            <div class="row">
                <div class="collg-12">
                    <h1 class="page-header">Liste des produits perimés</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="btn btn-outline btn-primary fa fa-print" href="#"> IMPRIMER</a>
                            <a class="btn btn-outline btn-success fa fa-file" href="#"> EXPORTER</a>
                        </div>
                        <!-- /.panel-heading -->

        <div class="panel-body">
            <ul class="nav nav-tabs">
                          <li class="active"><a data-toggle="tab" href="#tab1" >Periode</a></li>
                          <li><a data-toggle="tab" href="#tab2" >Nombre de jours</a></li>
                        </ul>
            <form role="form" method="post" action="">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                        <div class="col-lg-12">
                        <h1>Trie sur une periode</h1>
                            <div class="row">
                                 <div class="form-group col-lg-5">
                                                <label for="date"> Date debut: </label>
                                                <input type="text" placeholder="Date debut" class="form-control datepicker" data-provide="datepicker" placeholder="DD/MM/YYYY" id="dated" name="dated"/>
                                            </div>
                                        
                                            <div class="form-group col-lg-5">
                                              <label for="date"> Date fin: </label>
                                                <input type="text" placeholder="Date fin" class="form-control datepicker" data-provide="datepicker" placeholder="DD/MM/YYYY" id="datef" name="datef"/>
                                           </div> 
                                                  <div class="form-group col-lg-0" style="padding-top:2em;">
                                                <input class="btn btn-outline btn-success btn-sm" type="submit" name="go" id="go" value="valider" />
                                            </div>
                            
                               
                            </div>  
                        </div>
                    </div>


                   
                <div class="tab-pane" id="tab2">
                      <div class="row"> 
                        <div class="form-group col-lg-5">
                                              <label for="date"> Nombre de jour: </label>
                                                <input type="text" placeholder="entrer un nombre de jour" class="form-control" id="nb" name="nb"/>
                                           </div> 
                                                  <div class="form-group col-lg-0" style="padding-top:2em;">
                                                <input class="btn btn-outline btn-success btn-sm" type="submit" name="go" id="go" value="valider" />
                                            </div>
                       
                                          
                                           
                </div> 
                 </div>
               </div> 
            </form>



                            <table class="table table-striped table-bordered table-hover">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                <thead>
                                    <tr>
                                        <th>DCI</th>
                                        <th>Designation</th>
                                        <th>Quantite</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                                <?php
                                if (isset($_POST['go'])) {
                             
                                       if ( ($_POST['dated'] !='' && $_POST['datef'] !='')) {

                                        foreach ($data1 as $d){ ?>
                                            <tr class="odd gradeX">
                                                <td><?php echo $d->DCI; ?></td>
                                                <td><?php echo $d->DESIGNATION; ?></td>
                                                <td><?php echo $d->QTE_SORTIE; ?></td>
                                                 <td class="center">
                                                 <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a>
                                                 </td>
                                            </tr>
                                        <?php }
                                          }
                                        } elseif (isset($_POST['go2'])){
                                            if ($_POST['nb'] !='') {
                                            foreach ($data2 as $d){ ?>
                                                <tr class="odd gradeX">
                                                     <td><?php echo $d->DCI; ?></td>
                                                     <td><?php echo $d->DESIGNATION; ?></td>
                                                     <td><?php echo $d->QTE_SORTIE; ?></td>
                                                      <td class="center">
                                                     <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a>
                                                 </td>
                                                </tr>
                                            <?php }
                                              }
                                            
                                       }else {
                                            foreach ($data3 as $p){ ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo $p->DCI; ?></td>
                                                    <td><?php echo $p->DESIGNATION; ?></td>
                                                    <td><?php echo $p->QTE_SORTIE; ?></td>
                                                    <td class="center">
                                                     <a class="btn btn-outline btn-warning fa fa-times" href="#"> Sup</a>
                                                  </td>
                                                </tr>
                                            <?php }   
                                        }
                                ?>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>


