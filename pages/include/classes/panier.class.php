<?php
class panier{

	// private $id= $_SESSION["Auth"]->code_user;
	 

	public function __construct(){
		
		
		if (!isset($_SESSION['panier'])) {
			$_SESSION['panier'] = array();
		}

		if (isset($_POST['panier'])){
			if (isset($_POST['panier']) && $_POST['panier'] == "Valider la vente"){
				$this->store();
			}
			if(isset($_POST['reinitialiser'])){
				$_SESSION['panier'] = array();
			}

			if (isset($_POST['recalculer'])){
				if (isset($_POST['panier']['quantite'])){
					$this->recalc();
				}
			}
		}
		
		
	}

	public function recalc(){
		foreach ($_SESSION['panier'] as $product_id => $quantite) {
			if(isset($_POST['panier']['quantite'][$product_id])){
				$_SESSION['panier'][$product_id] = $_POST['panier']['quantite'][$product_id];
			}
		}
	}

	public function add($product_id){
		if (isset($_SESSION['panier'][$product_id])) {
			$_SESSION['panier'][$product_id]++;
		}else {
			$_SESSION['panier'][$product_id] = 1;	
		}
	}

	public function del($product_id){
		
			unset($_SESSION['panier'][$product_id]);
		
		echo '<meta http-equiv="refresh" content="0;URL=index.php?page=vente#ancorPanier">';

	}


	public function total(){
		$total = 0;
		$ids = array_keys($_SESSION['panier']);
         if (empty($ids)) {
           $produit =array();
         }else{

          global $bdd;
          $produit=$bdd->prepare('SELECT CODE_PRODUIT,PRIX_PRODUIT FROM produit WHERE code_produit IN ('.implode(',',$ids).')');
          $produit->execute();
          $produit=$produit->fetchAll(PDO::FETCH_OBJ);
         }
		foreach ($produit as $p ) {
			$total += $p->PRIX_PRODUIT * $_SESSION['panier'][$p->CODE_PRODUIT];
		}

		return $total;
	}

	public function reviens($product_id){
		$reviens = 0;
		$ids = $product_id;
         if (empty($ids)) {
           $produit =array();
         }else{

          global $bdd;
          $produit=$bdd->prepare('SELECT CODE_PRODUIT,PRIX_PRODUIT FROM produit WHERE code_produit =:id');
          $produit->execute(array('id'=>$ids));
          $produit=$produit->fetchAll(PDO::FETCH_OBJ);
         }
		foreach ($produit as $p ) {
			$reviens += $p->PRIX_PRODUIT * $_SESSION['panier'][$product_id];
		}

		return $reviens;
	}

	public function count(){
		return array_sum($_SESSION['panier']);
	}

	public function store(){
		global $bdd;
		
		if ($_SESSION['panier'] == array())

		$tab = array('ids' => array(), 'qte' => array());
		foreach ($_SESSION['panier'] as $panier => $qte) {

			$tab['ids'][]=$panier;
			$tab['qte'][]=$qte;

		}

		//Insertion des données de la vente en premier (création de la vente)
	    $sqlVente = 'INSERT INTO vente (code_journee, code_user, date_vente, statut, heure_vente) values ((select code_journee from journee where statut = 0), '.$_SESSION["Auth"]->code_user.', CURDATE(), 0, CURTIME() )';
	    $bdd->query($sqlVente);

		foreach ($_SESSION['panier'] as $id => $qte) {
			$sqlCod = 'select MAX(code_vente) as max_code from vente';
			$codeVente = $bdd->query($sqlCod);
			$codeVente = $codeVente->fetch(PDO::FETCH_ASSOC);

			$sqlPrix = 'select prix_vente, prix_produit from produit where code_produit = '.$id;
			$prixVente = $bdd->query($sqlPrix);
			$prixVente = $prixVente->fetch(PDO::FETCH_ASSOC);

			if ($prixVente['prix_vente'] == null) {
				$prixVente['prix_vente'] = $prixVente['prix_produit'];
			}

			$sqlProduitVendu = 'INSERT INTO produit_vendu (code_produit, code_vente, nb_vendu, montant_vente) values ('.$id.', '.$codeVente["max_code"]. ','.$qte.', '.$prixVente["prix_vente"].'*'.$qte.')';
			$bdd->query($sqlProduitVendu);
		}	    

		echo '<div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Vente envoyée à la caisse avec succès. 
    	</div>';

    	$_SESSION['panier'] = array();

	}
}