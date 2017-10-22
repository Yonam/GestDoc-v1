
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Nouvelle vente</h1>
                </div>
                <div class="row">

                <div class="col-sm-6 col-sm-offset-3">
                <form method="post" action='http://localhost/OwoNew/index.php?page=vente'>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                    <input type="search" name="search" class="form-control">
                     <span class="input-group-btn"><button type="submit" name="submit" class="btn btn-default"> go</button></span>
                </div>
                   
                </form>
                
                </div>
                <div class="col-lg-12">                    
                </div>
                <div class="col-sm-6"></div>

                    <form class="form-horizontal">
                        <label>
                            
                        </label>
                    </form>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12" style="height:200px; overflow:auto;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Base de donnee des produits
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <?php if (count($produits) > 0): ?>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Code CIP</th>
                                        <th>Designation</th>
                                        <th>DCI</th>
                                        <th>Forme</th>
                                        <th>Prix</th>
                                        <th>Action</th>
                                    </tr>
                                <tbody>
                                <?php foreach ($produits as $produit): ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $produit->code_cip; ?></td>
                                        <td><?php echo $produit->designation; ?></td>
                                        <td><?php echo $produit->dci; ?></td>
                                        <td ><?php echo $produit->code_forme; ?></td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-gear" href="#"></a>
                                            <a class="btn btn-outline btn-success fa fa-times" href="?page=vente&amp;code_produit=<?php echo $produit->code_produit; ?>"></a>
                                            <a class="btn btn-outline btn-warning fa fa-times" href="#"></a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
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

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Panier du client</h2>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         <?php if (count($panier) > 0): ?>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Code CIP</th>
                                        <th>Designation</th>
                                        <th>DCI</th>
                                        <th>Forme</th>
                                        <th>Prix</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <?php foreach ($panier as $produit): ?>
                                    <tr class="odd gradeX">
                                        <td></td>
                                        <td><?php echo $produit['designation']; ?></td>
                                        <td>Win 95+</td>
                                        <td class="center">4</td>
                                        <td class="center">xxx</td>
                                        <td class="center">
                                            <a class="btn btn-outline btn-primary fa fa-check" href="#"></a>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?php else: ?>
                                    panier vide
                                <?php endif; ?>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>