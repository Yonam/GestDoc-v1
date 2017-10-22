<?php
//$int = 5;
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
	$reponse=$bdd->query("SELECT * FROM produit order by code_produit");
}

ob_start();

?>

<style type="text/css">
	table{width: 100%; border-collapse: collapse;margin-top:5mm;}
	#table tr{background-color:white;  color: black}
	#table tr th{border: 1px solid #aaa; width: 14%; text-align:center; padding: 15px}
	#table tr td{border: 1px solid #aaa; width: 14%; text-align:center; text-decoration:blink; padding: 15px}
	h2{font: normal 175% Arial, Helvetica, sans-serif;
  color: #008000;
  letter-spacing: -1px;
  margin: 0 0 10px 0;
  padding: 5px 0 0 0; }
</style>

<page backtop='60mm' footer="date;heure;page;">


	<page_header>
		<table>
			<tr>
				<td style="width:30%">
					<img src="pages/html2pdf/logoPharma1.png" height="90" width="90" />
				</td>

				<td style="width:40%; text-align:center;">
					<h1>Pharmacie LA FRATERNITE</h1>
					[Informations complémentaires]  <br>
					Tel:(+228)[00 00 00 00]

				</td>

				<td style="width:30%; text-align:right;">

					<img src="pages/html2pdf/logoPharma1.png" height="90" width="90" />
				</td>
			</tr>
		</table>

		<hr>
	</page_header>

	<page_footer>
		<hr>

	</page_footer>
                    <h2 align="center" >LISTE DES PRODUITS</h2>

	<table id="table" margin-top>

	       <thead>
				<tr>
					<th>CIP</th>
<!--					<th>Code barre</th>-->
<!--					<th>Code interne</th>-->
<!--					<th>Code localisation</th>-->
<!--					<th>Code laboratoire</th>-->
<!--					<th>Code exploitant</th>-->
<!--					<th>Code spécialité</th>-->
<!--					<th>Code classe</th>-->
<!--					<th>Code forme</th>-->
					<th>DCI</th>
					<th>Désignation</th>
					<th>Soumis TVA</th>
					<th>Date de commercialisation</th>
					<th>Photo</th>
					<th>Date de mise à jour</th>
					<th>Date de péremption</th>
					<th>Quantité en stock</th>
					<th>Prix produit</th>
				</tr>
		  </thead>
		  
		   <tbody>	
                  <?php while ($donnees = $reponse->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['CIP']; ?></td>
<!--                                        <td>--><?php //echo $donnees['CODE_BARRE']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_INTERNE']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_LOCALISATION']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_LAB']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_EXPLOITANT']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_SPECIALITE']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_CLASSE']; ?><!--</td>-->
<!--                                        <td>--><?php //echo $donnees['CODE_FORME']; ?><!--</td>-->
                                        <td><?php echo $donnees['DCI']; ?></td>
                                        <td><?php echo $donnees['DESIGNATION']; ?></td>
                                        <td><?php echo $donnees['SOUMIS_TVA']; ?></td>
                                        <td><?php echo $donnees['DATE_COMMERCIALISATION']; ?></td>
                                        <td><?php echo $donnees['PHOTO']; ?></td>
										<td><?php echo $donnees['DATE_ENREGISTREMENT']; ?></td>
                                        <td><?php echo $donnees['DATE_MJ']; ?></td>
                                        <td><?php echo $donnees['DATE_PEREMPTION']; ?></td>
                                        <td><?php echo $donnees['PRIX_PRODUIT']; ?></td>
                                    </tr>
                                <?php } ?>
		  </tbody>	
	</table>

</page>

<?php

$content = ob_get_clean();
require ('html2pdf/html2pdf.class.php');

try {
	$pdf = new HTML2PDF('LANDSCAPE','A4','fr');
	$pdf->writeHTML($content);
	$pdf->Output("Liste des produits.pdf");

} catch (HTML2PDF_exception $e) {
	die($e);
}

?>