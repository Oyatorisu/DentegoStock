<Doctype!>

	<head>
		<title>Stock page</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</head>
	<body>
	<div class="container">
		<table class="table">
			<tr>
				<td>ID</td>
				<td>Nom</td>
				<td>Quantité</td>
				<td>Prix Unitaire</td>
				<td>Total</td>
			</tr>

	

<?php
	$con = mysqli_connect("localhost","root","","dentegostock");	
	if (mysqli_connect_errno())
  	{
  		echo "Failed to connect to MySQL: " . mysqli_connect_error();
  	}

  	$sql = "SELECT id, NomObjet, Quantite, PrixUnitaire FROM stock";
	$result = $con->query($sql);

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        echo "<tr><td>" . $row["id"]. "</td><td>" . $row["NomObjet"]. "</td><td>" . $row["Quantite"]. " </td><td>" . $row["PrixUnitaire"]."</td><td>". $row["Quantite"] * $row["PrixUnitaire"] ."</td></tr>";
	    }
	} else {
	    echo "0 results";
	}
	$con->close();

 ?>
 	</table>
 	</div>
	</body>