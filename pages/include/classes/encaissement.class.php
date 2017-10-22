<?php
class encaissement{

	public function __construct(){
		
		
		if (!isset($encaissement)) {
			$encaissement = array();
		}

		if(isset($_POST['encaisser'])){
			$this->store();
		}

		if(isset($_POST['annuler'])){
			$this->clean();
		}
	}
	 

	public function liste($codeVente){
		
	global $bdd;
    $liste=$bdd->prepare('SELECT P.DESIGNATION,P.PRIX_PRODUIT, P.PRIX_VENTE,PV.NB_VENDU, PV.MONTANT_VENTE, V.CODE_VENTE  FROM produit_vendu PV JOIN produit P ON PV.CODE_PRODUIT = P.CODE_PRODUIT JOIN vente V ON V.CODE_VENTE = PV.CODE_VENTE WHERE V.CODE_VENTE ='.$codeVente);
    $liste->execute();
    $liste = $liste->fetchAll();
    return $liste;

	}


	public function compte($codeClient){
		
	global $bdd;
    $compte=$bdd->prepare('SELECT C.code_cli, solde, montant_verse,reste,date FROM operationcompte O JOIN client C ON O.code_cli = '.$codeClient);
    $compte->execute();
    $compte = $compte->fetchAll();
    return $compte;

	}


	public function store(){
    	global $bdd;
		
		//Création du mode de payement
    	$sqlModPay = 'INSERT INTO mode_payement (montant, montant_paye, montant_reste) values ('.$_POST["encaisser"].','.$_POST["encaisser"].' , 0)';
	    $bdd->query($sqlModPay);

		//Création de l'encaissement
	    $sqlEncaissement = 'INSERT INTO encaissement (code_journee, code_payement, code_vente, code_user, type, date_encaissement) values ((select code_journee from journee where statut = 0), (select max(code_payement) from mode_payement),'.$_POST["codeVente"].' , '.$_SESSION["Auth"]->code_user.', "Espèce", CURDATE())';
	    $bdd->query($sqlEncaissement);

	    //Mise à jour de la vente
	    $sqlVente = 'UPDATE vente SET code_encaissement = (select MAX(code_encaissement) from encaissement), statut = 1 WHERE code_vente = '.$_POST["codeVente"];
	    $bdd->query($sqlVente);


		echo '<div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Vente encaissée avec succès. 
    	</div>';

    	// header("Location:?page=etat_ticket&sql=SELECT * FROM `encaissement` e WHERE e.code_encaissement = ");

	}

	public function clean(){
		global $bdd;
		var_dump($_POST);
		$sqlCleanProd = 'DELETE FROM produit_vendu WHERE CODE_VENTE='.$_POST['codeVente'];
	    $bdd->query($sqlCleanProd);

		$sqlClean = 'DELETE FROM vente WHERE CODE_VENTE='.$_POST['codeVente'];
	    $bdd->query($sqlClean);

	    echo '<div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Vente supprimee avec succès. 
    	</div>';
	}

}