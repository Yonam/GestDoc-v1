<?php
include("../../connexionDB.php");
$labo=$bdd->query('SELECT code_lab,nom_laboratoire FROM laboratoire');
$classe=$bdd->query('SELECT code_clas,description FROM classe');
$exploitant = $bdd->query('SELECT code_exploitant,libelle FROM exploitant');
$specialite=$bdd->query('SELECT code_specialite,nom_specialite FROM specialite');
$localisation=$bdd->query('SELECT code_localisation,nom_localisation FROM localisation');
$forme = $bdd->query('SELECT code_forme,nom_forme FROM forme');
?>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

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
                    <h1 class="page-header">Enregistrement d'un produit</h1>
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
                                    <h1>les identifiants</h1>
                                    <h3>Les codes</h3>
                                        <div class="row">
                                            <div class="form-group col-lg-4">
                                                <label for="cip">CIP</label>
                                                <input class="form-control" id="cip" name="cip">
                                            </div>
                                            <div class="form-group col-lg-4 col-xm-2">
                                                <label for="barre">Barre</label>
                                                <input class="form-control" id="barre" name="barre">
                                            </div>
                                            <div class="form-group col-lg-4 col-xm-2">
                                                <label for="interne">Interne</label>
                                                <input class="form-control" id="interne" name="interne">
                                            </div>
                                            
                                        </div>
                                        
                                    </div>   
                                    <div class="col-lg-3">
                                    <h3>La photo</h3>
                                        <div class="form-group">
                                        <br/>
                                            <textarea class="form-control" rows="4" id="photo"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="photo">File input</label>
                                            <input type="file" id="photo" name="photo">
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-8">
                                        
                                        <h3>Informations</h3>
                                         <div class="form-group">
                                            <label for="dci">Molecule de base</label>
                                            <input class="form-control" id="dci" name="dci">
                                        </div>
                                        <div class="form-group">
                                            <label for="designation">designation</label>
                                            <input class="form-control" id="designation" name="designation">
                                        </div>
                                        <div class="form-group">
                                            <label for="commercialisation">Date commercialisation</label>
                                            <input type="text" class="form-control mydatepicker" placeholder="DD/MM/YYY" id="commercialisation" name="commercialisation"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="peremption">Date peremption</label>
                                            <input type="text" class="form-control" placeholder="DD/MM/YYY" id="peremption" name="peremption"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="enregistrement">Date enregistrement</label>
                                            <input class="form-control" id="enregistrement" name="enregistrement" placeholder="DD/MM/YYY" type="text"/>
                                        </div>
                                    </div> 

                                    <div class="col-lg-8">
                                        <hr style="border: 0.1em solid black" />
                                        <h1 class="text-center">Prix</h1>
                                        <hr style="border: 0.1em solid black" />
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="1" id="tva" name="tva">Soumis a la TVA
                                                </label>
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="tva">taux TVA</label>
                                                <input class="form-control" id="tva" name="tva">
                                            </div>
                                            <div class="form-group col-lg-6">
                                                <label for="achat">Prix d'achat</label>
                                                <input class="form-control" id="achat" name="achat">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="coef">Coeficient</label>
                                                <input class="form-control" id="coef" name="coef">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="reduction">Reduction</label>
                                                <input class="form-control" id="reduction" name="reduction">
                                            </div>
                                            <div class="form-group col-lg-6 col-xm-2">
                                                <label for="vente">Prix de vente</label>
                                                <input class="form-control" id="vente" name="vente">
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-lg-8">
                                        <hr style="border: 0.1em solid black" />
                                        <h1 class="text-center">Autres informations</h1>
                                        <hr style="border: 0.1em solid black" />
                                            
                                            <div class="form-group col-lg-4">
                                                <label for="laboratoire">Laboratoire</label>
                                                <select class="form-control" id="laboratoire" name="laboratoire">
                                                    <?php while ($donnees = $labo->fetch()){
                                                        echo '<option value="'.$donnees['code_lab'].'">';

                                                        echo $donnees['nom_laboratoire'];

                                                        echo '</option>';
                                                    } ?>
                                                </select> 
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label for="localisation">Localisation</label>
                                                <select class="form-control" id="localisation" name="localisation">
                                                    <?php while ($donnees = $localisation->fetch()){
                                                        echo '<option value="'.$donnees['code_localisation'].'">';

                                                                echo $donnees['nom_localisation'];

                                                        echo '</option>';
                                                     } ?>
                                                </select> 
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label for="exploitant">Exploitant</label>
                                                <select class="form-control" id="exploitant" name="exploitant">
                                                    <?php while ($donnees = $exploitant->fetch()){
                                                        echo '<option value="'.$donnees['code_exploitant'].'">';

                                                        echo $donnees['libelle'];

                                                        echo '</option>';
                                                    } ?>
                                                </select> 
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label for="classe">Classe</label>
                                                <select class="form-control" id="classe" name="classe">
                                                    <?php while ($donnees = $classe->fetch()){
                                                        echo '<option value="'.$donnees['code_clas'].'">';

                                                        echo $donnees['description'];

                                                        echo '</option>';
                                                    } ?>
                                                </select> 
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label for="specialite">Specialite</label>
                                                <select class="form-control" id="specialite" name="specialite">
                                                    <?php while ($donnees = $specialite->fetch()){
                                                        echo '<option value="'.$donnees['code_specialite'].'">';

                                                        echo $donnees['nom_specialite'];

                                                        echo '</option>';
                                                    } ?>
                                                </select> 
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label for="forme">Forme</label>
                                                <select class="form-control" id="forme" name="forme">
                                                    <?php while ($donnees = $forme->fetch()){
                                                        echo '<option value="'.$donnees['code_forme'].'">';

                                                        echo $donnees['nom_forme'];

                                                        echo '</option>';
                                                    } ?>
                                                </select> 
                                            </div>
                                    </div>

                                    <div class="col-lg-8">
                                        <button type="submit" class="btn btn-success col-lg-5" name="submit">Enregistrer le produit</button>
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
    <script type="text/javascript" src="../bootstrap-datepicker.min.js"></script>
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
    <script>
        function noPreview() {
            $('#image-preview-div').css("display", "none");
            $('#preview-img').attr('src', 'noimage');
            $('upload-button').attr('disabled', '');
        }

        function selectImage(e) {
            $('#file').css("color", "green");
            $('#image-preview-div').css("display", "block");
            $('#preview-img').attr('src', e.target.result);
            $('#preview-img').css('max-width', '550px');
        }

        $(document).ready(function (e) {

            var maxsize = 500 * 1024; // 500 KB

            $('#max-size').html((maxsize/1024).toFixed(2));

            $('#upload-image-form').on('submit', function(e) {

                e.preventDefault();

                $('#message').empty();
                $('#loading').show();

                $.ajax({
                    url: "upload_image.php",
                    type: "POST",
                    data: new FormData(this),
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function(data)
                    {
                        $('#loading').hide();
                        $('#message').html(data);
                    }
                });

            });

            $('#file').change(function() {

                $('#message').empty();

                var file = this.files[0];
                var match = ["image/jpeg", "image/png", "image/jpg"];

                if ( !( (file.type == match[0]) || (file.type == match[1]) || (file.type == match[2]) ) )
                {
                    noPreview();

                    $('#message').html('<div class="alert alert-warning" role="alert">Unvalid image format. Allowed formats: JPG, JPEG, PNG.</div>');

                    return false;
                }

                if ( file.size > maxsize )
                {
                    noPreview();

                    $('#message').html('<div class=\"alert alert-danger\" role=\"alert\">The size of image you are attempting to upload is ' + (file.size/1024).toFixed(2) + ' KB, maximum size allowed is ' + (maxsize/1024).toFixed(2) + ' KB</div>');

                    return false;
                }

                $('#upload-button').removeAttr("disabled");

                var reader = new FileReader();
                reader.onload = selectImage;
                reader.readAsDataURL(this.files[0]);

            });

        });
    </script>






</body>

</html>