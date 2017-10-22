<?php

if ($_SESSION['Auth']->level == "5") {
    require_once('pages/Generiques/acceuil.php');
}else{
	require_once('pages/Generiques/acceuilNAdmin.php');
}


