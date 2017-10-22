<?php
/**
 * Created by PhpStorm.
 * User: OLA
 * Date: 19/07/2017
 * Time: 22:54
 */
include "../../include/connexionDB.php";
if (isset($_POST['addcli'])){

                $commercial = isset($_POST['commercial']) ? $_POST['commercial'] : null;
                $titre = isset($_POST['titre']) ? $_POST['titre'] : null;
                $nom = isset($_POST['nom']) ? $_POST['nom'] : null;
                $prenom = isset($_POST['prenom']) ? $_POST['prenom'] : null;
                $datep = isset($_POST['datep']) ? $_POST['datep'] : null;
                $piece = isset($_POST['piece']) ? $_POST['piece'] : null;
                $numpiece = isset($_POST['numpiece']) ? $_POST['numpiece'] : null;
                $droit = isset($_POST['droit']) ? $_POST['droit'] : '0';
                $email = isset($_POST['email']) ? $_POST['email'] : null;
                $tel1 = isset($_POST['tel1']) ? $_POST['tel1'] : null;
                $tel2 = isset($_POST['tel2']) ? $_POST['tel2'] : null;
                $adresse = isset($_POST['adresse']) ? $_POST['adresse'] : null;
                $credit = isset($_POST['credit']) ? $_POST['credit'] : null;
                $remise = isset($_POST['remise']) ? $_POST['remise'] : null;
                $depassement = isset($_POST['depassement']) ? $_POST['depassement'] : null;
                $delai = isset($_POST['delai']) ? $_POST['delai'] : null;
                //Formattage
                $nom = htmlspecialchars($nom);
                $prenom = htmlspecialchars($prenom);
                $email = htmlspecialchars($email);
                $adresse = utf8_decode($adresse);
                $tel1 = htmlspecialchars($tel1);
                $tel2 = htmlspecialchars($tel2);
                $numpiece = htmlspecialchars($numpiece);
                $piece = htmlspecialchars($piece);



                        $req = $bdd->prepare("INSERT INTO client (CODE_COM,TITRE, NOM_CLI, PRENOM_CLI, TYPE_PIECE, NUM_PIECE, DATE_PIECE,EMAIL, ADRESSE, TEL1, TEL2, STATUT,TOTAL_DU, CREDIT_MAX, DELAI_PAIEMENT, REMISE, DROIT_CREDIT, DEPASSEMENT) VALUES(:code_com,:titre,:Nom_cli,:prenom_cli,:type_piece,:num_piece, :date_piece,:Email,:adresse,:tel1,:tel2,:statut,:total_du,:credit_max,:delai_paiement,:remise, :droit_credit,:depassement)");
                        $req->execute(array(
                        'code_com'=>$commercial,
                        'titre' =>$titre,
						'Nom_cli'=>$nom, 
						'prenom_cli'=>$prenom, 
						'type_piece'=>$piece, 
						'num_piece'=>$numpiece,
						'date_piece'=>$datep, 
						'Email'=>$email,
						'adresse'=>$adresse,
						'tel1'=>$tel1, 
						'tel2'=>$tel2, 
						'statut'=>'0',
						'total_du'=>0, 
						'credit_max'=>$credit,
						'delai_paiement'=>$delai, 
						'remise' =>$remise,
						'droit_credit'=>$droit,
						'depassement' =>$depassement));
                        $lastId = (int)$bdd->lastInsertId();
                        

                    }
               
				echo '<body onload ="alert(\'Client ajouté avec succès\')">';
				 echo '<meta http-equiv="refresh" content="0;URL=../../../index.php?page=list_client">';
          //  }
     //  }
//}


?>