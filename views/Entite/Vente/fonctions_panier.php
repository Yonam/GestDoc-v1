<?php
// ici sont les fonctions a utiliser sur le panier de vente

function creationPanier(){
   if (!isset($_SESSION['panier'])){
      $_SESSION['panier']=array();
      $_SESSION['panier']['designation'] = array();
      $_SESSION['panier']['nb_vendu'] = array();
      $_SESSION['panier']['prix_vente'] = array();
      $_SESSION['panier']['verrou'] = false;
   }
   return true;
}

function ajouterArticle($designation,$nb_vendu,$prix_vente){

   //Si le panier existe
   if (creationPanier() && !isVerrouille())
   {
      //Si le produit existe déjà on ajoute seulement la quantité
      $positionProduit = array_search($designation,  $_SESSION['panier']['designation']);

      if ($positionProduit !== false)
      {
         $_SESSION['panier']['nb_vendu'][$positionProduit] += $nb_vendu ;
      }
      else
      {
         //Sinon on ajoute le produit
         array_push( $_SESSION['panier']['designation'],$designation);
         array_push( $_SESSION['panier']['nb_vendu'],$nb_vendu);
         array_push( $_SESSION['panier']['prix_vente'],$prix_vente);
      }
   }
   else
   echo "Un problème est survenu veuillez contacter l'administrateur du site.";
}

function supprimerArticle($designation){
   //Si le panier existe
   if (creationPanier() && !isVerrouille())
   {
      //Nous allons passer par un panier temporaire
      $tmp=array();
      $tmp['designation'] = array();
      $tmp['qte_vendu'] = array();
      $tmp['prix_vente'] = array();
      $tmp['verrou'] = $_SESSION['panier']['verrou'];

      for($i = 0; $i < count($_SESSION['panier']['designation']); $i++)
      {
         if ($_SESSION['panier']['designation'][$i] !== $designation)
         {
            array_push( $tmp['designation'],$_SESSION['panier']['designation'][$i]);
            array_push( $tmp['qte_vendu'],$_SESSION['panier']['qte_vendu'][$i]);
            array_push( $tmp['prix_vente'],$_SESSION['panier']['prix_vente'][$i]);
         }

      }
      //On remplace le panier en session par notre panier temporaire à jour
      $_SESSION['panier'] =  $tmp;
      //On efface notre panier temporaire
      unset($tmp);
   }
   else
   echo "Un problème est survenu veuillez contacter l'administrateur du site.";
}

function modifierQTeArticle($designation,$nb_vendu){
   //Si le panier éxiste
   if (creationPanier() && !isVerrouille())
   {
      //Si la quantité est positive on modifie sinon on supprime l'article
      if ($nb_vendu > 0)
      {
         //Recharche du produit dans le panier
         $positionProduit = array_search($designation,  $_SESSION['panier']['designation']);

         if ($positionProduit !== false)
         {
            $_SESSION['panier']['nb_vendu'][$positionProduit] = $nb_vendu ;
         }
      }
      else
      supprimerArticle($designation);
   }
   else
   echo "Un problème est survenu veuillez contacter l'administrateur du site.";
}

function MontantGlobal(){
   $total=0;
   for($i = 0; $i < count($_SESSION['panier']['designation']); $i++)
   {
      $total += $_SESSION['panier']['nb_vendu'][$i] * $_SESSION['panier']['prix_vente'][$i];
   }
   return $total;
}

function isVerrouille(){
   if (isset($_SESSION['panier']) && $_SESSION['panier']['verrou'])
   return true;
   else
   return false;
}

function compterArticles()
{
   if (isset($_SESSION['panier']))
   return count($_SESSION['panier']['designation']);
   else
   return 0;

}

function supprimePanier(){
   unset($_SESSION['panier']);
}

function retournerPanier()
{
   # code...
   return $_SESSION['panier'];
}
?>