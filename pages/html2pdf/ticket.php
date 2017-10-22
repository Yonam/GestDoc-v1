<?php
try
{
	$bdd = new PDO('mysql:host=localhost;dbname=pharma', 'root', '');
}
catch (Exception $e)
{
	die('Erreur : ' . $e->getMessage());
}

if (isset($_GET['sql']) && $_GET['sql'] != ''){
				$reponse = $bdd->query($_GET['sql']);
			}else{		
				//la requete
       		$reponse=$bdd->query("SELECT * FROM client order by CODE_CLI");
			
			}

ob_start();

?>

<style type="text/css">
	table{width: 100%; border-collapse: collapse;margin-top:5mm;position: left; ali}
	#table tr{background-color:white;  color: black}
	#table tr th{border: 1px solid #aaa; width: 17%; text-align:left; padding: 15px}
	#table tr td{border: 1px solid #aaa; width: 17%; text-align:left; text-decoration:blink; padding: 15px}

	#table .date{border: 1px solid #aaa; width: 12%; text-align:center; padding: 15px}
	#table .date{border: 1px solid #aaa; width: 12%; text-align:left; text-decoration:blink; padding: 15px}
	h3{font: normal 100% Arial, Helvetica, sans-serif;
  color: #528CCC;
  letter-spacing: -1px;
  margin: 0 0 10px 0;
  padding: 5px 0 0 0; }
</style>

<page backtop='60mm' footer="date;heure;page;">

	<page_header>
	        <table>
	            <tr>
		
				<td style="width:50%; text-align:left;">
						<h3>MINISTERE DE L'ENSEIGNEMENT SUPERIEUR<br>
						ET DE LA RECHERCHE<br>
						ECOLE SUPERIEURE DES AFFAIRES ESA<br>
						1BP.9721 Lome1 TEL (228)22545859<br>
						LOME-TOGO</h3>
				</td>
				
				  <td style="width:60%; text-align:center;">
						<h4>B.P.F  ........................................................<br>
					N° ....................................................................<br>
						Recu de M. ....................................................................<br>
						..........................................................................</h4>
					
				</td>
				</tr>
			</table>	      
	</page_header>

	<page_footer>
	</page_footer>
	<table  style="width: 60%; text-align:center; position:center;">
				<tr>
				   <td>La somme de  ...........................................................................................................................................<br>........................................................................</td>
				</tr>                            
	</table>


	<table  style="width: 100%; text-align:left; position:center;">
	       <thead>
				<tr>
				    <th>Reste à payer</th>			
				</tr>
		  </thead>
		  
		   <tbody>	
		   <tr>
		   <?php while ($donnees = $reponse->fetch()){  ?>
                                        <td><?php echo $donnees['CODE_CLI']; ?></td>
                                <?php } ?></tr><tr>
		  </tbody>	<br>Lomé, le ........................................................................</h3></td>
				     <t> <td style="width:50%"><h3>Signature....................................................................</h3>
				   </td>
				</tr>                            
	</table>


</page>

<?php

$content = ob_get_clean();

require_once 'html2pdf-4.4.0/html2pdf.class.php';

try {

	$pdf = new HTML2PDF('landscape','A4','fr');
	$pdf->writeHTML($content);
	$pdf->Output("Liste des utilisateurs.pdf");

} catch (HTML2PDF_exception $e) {
	die($e);
}

?>