<?php
$_SESSION=array();
header("Location:?page=login");
?>
<?php include("pages/include/headerNormal.php"); ?>



<div class="container" >
    <div class="row">
        <div class="col-md-4 col-md-offset-4 ">
            <div class="login-panel panel panel-default">
                <div class="panel-heading" >
                    <h2 class="panel-title">CONNECTEZ VOUS A OWO PHARMA</h2>
                </div>
                <div class="panel-body">
                    <form role="form" action="" method="post" name="connect">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Nom de utilisateur" name="Login" type="text" id = "Login" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Mot de Passe" name="Pwd" type="password"  id = "Pwd" value="">
                            </div>
                            <div class="checkbox btn-warning">
                                <label  >
                                    <input  name="remember" type="checkbox" value="Remember Me">   Se Rappeler </input>
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit"  name="Submit" class="btn btn-lg btn-success btn-block" value="Connexion">

                        </fieldset>

                </form>

                </div>


            </div>
        </div>
        <h1>Session</h1>
                <pre><?php print_r($_SESSION);?></pre>
    </div>
</div>
