
<?php
	$con = mysqli_connect("localhost","root","","dentegostock");
	if (mysqli_connect_errno())
  	{
  		echo "Failed to connect to MySQL: " . mysqli_connect_error();
  	}
		$id = $_POST['stock'];
		echo $id;
  	$sql = "INSERT INTO `historique`(`EntreeSortie`, `id_stock`, Quantite_modifiee`, datemodif`") VALUES ('',$id,);
	  $result = $con->query($sql);

	if ($result->num_rows > 0) 
	{

	}
	} else {
	    echo "0 results";
	}
	$con->close();

 ?>