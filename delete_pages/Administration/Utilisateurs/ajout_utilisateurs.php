<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../../assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../assets/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../../assets/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <?php include("../../menu.php"); ?>

</div>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Enregistrement d'un nouvel utilisateur</h1>
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

                            <div class="col-lg-8">

                                <h3>Informations generales</h3>
                                <div class="form-group">
                                    <label for="nom">Nom </label>
                                    <input class="form-control" id="nom" name="nom">
                                </div>
                                <div class="form-group">
                                    <label for="prenom">prenom </label>
                                    <input class="form-control" id="prenom" name="prenom">
                                </div>

                                <h3>Informations de connexion</h3>
                                <div class="form-group">
                                    <label for="login">login</label>
                                    <input class="form-control" id="login">
                                </div>

                            </div>




                            <div class="col-lg-8">
                                <button type="submit" class="btn btn-success col-lg-5">Enregistrer l'utilisateur</button>
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
</div>
<!-- /.row -->




<script src="../../assets/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../../assets/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="../../assets/vendor/raphael/raphael.min.js"></script>
<script src="../../assets/vendor/morrisjs/morris.min.js"></script>
<script src="../../assets/data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../../assets/dist/js/sb-admin-2.js"></script>

</body>

</html>