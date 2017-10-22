<?php class Auth{

	/**
	* Permet d'identifier un utilisateur et de garder ses infos dans une variable SESSION
	**/
	function login($d){
		global $bdd;
    $bdd->beginTransaction();

        $reload=$bdd->prepare('SELECT code_user,login FROM utilisateur WHERE login=:login AND pwd IS NULL');
        $reload->execute(array(':login'=>$d['Login']));
        $reload=$reload->fetchAll();

        $req=$bdd->prepare('SELECT code_user,login,pwd,utilisateur.code_privilege,privileges.designation,privileges.level FROM utilisateur LEFT JOIN privileges ON utilisateur.code_privilege=privileges.code_privilege WHERE login=:login AND pwd=:pwd');
        $req->execute(array(':login'=>$d['Login'], ':pwd'=>sha1($d['Pwd'])));
		$data=$req->fetchAll();
    $bdd->commit();


		if(count($reload)>0){
			foreach ($reload as $r) {
				$identif=$r->code_user;
			}
			echo '<body onload ="alert(\'Votre mot de passe doit etre renseigné \')">';
			echo '<meta http-equiv="refresh" content="0;URL=?page=reload_mdp_2&amp;id='.$identif.'">';
		}
		//print_r($data);
		if(count($data)>0){
			$_SESSION['Auth']=$data[0];
			return true;
		}
		return false;
	}	

	function vente($d){
		$tva = $_POST['tva']; 
		$achat =  $_POST['achat']; 
		$coef = $_POST['coef']; 
		$reduction = $_POST['reduction'];
		$vente = (((($tva * $achat)/100)*$coef))- $reduction;
		
			return $vente;
	}


	/**
	* Permet a l'utilisateur d'avoir une page forbidden en cas de non autorisation
	**/

	function allow($rang){
		global $bdd;
		$req=$bdd->prepare('SELECT level FROM privileges');
		$req->execute();
		$data=$req->fetchAll();
		$roles= array();
		foreach ($data as $d) {
			$roles[$d->level]=$d->level;
		}
		$this->user('level');
	}

	/**
	* Recupere des informations de l'utilisateur
	**/

	function user($field){
		if(isset($_SESSION['Auth']->slug)){
			
		}
	}

}

$Auth=new Auth();