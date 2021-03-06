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
	$reponse=$bdd->query("SELECT * FROM client order by code_cli");
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
                    <h2 align="center" >LISTE DES CLIENTS</h2>

	<table id="table" margin-top>

	       <thead>
				<tr>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Email</th>
					<th>Telephone</th>
					<th>Dette</th>
					<th>Plafond</th>
				</tr>
		  </thead>
		  
		   <tbody>	
                  <?php while ($donnees = $reponse->fetch()){  ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $donnees['NOM_CLI']; ?></td>
                                        <td><?php echo $donnees['PRENOM_CLI']; ?></td>
                                        <td><?php echo $donnees['EMAIL']; ?></td>
                                        <td><?php echo $donnees['TEL1']; ?></td>
                                    </tr>
                                <?php } ?>
		  </tbody>	
	</table>

</page>

<?php

$content = ob_get_clean();

require ('html2pdf/html2pdf.class.php');

try {

	$pdf = new HTML2PDF('landscape','A4','fr');
	$pdf->writeHTML($content);
	$pdf->Output("Liste des clients.pdf");

} catch (HTML2PDF_exception $e) {
	die($e);
}

?>