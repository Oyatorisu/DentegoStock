<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
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
<?php

$host="localhost";
$user="root";
$password="";
$base="dentegostock";
$conn = mysqli_connect($host,$user,$password,$base);
$req = "SELECT * FROM site";
$res = $conn->query($req);
if (isset($_GET['id']))
{
$var = $_GET['id'];
$req2 = "SELECT Libelle FROM site WHERE id=$var";
$res2 = $conn->query($req2);
$lib = mysqli_fetch_array($res2);

?>
  <form method="post" action="modif.php">
  <label for="site">Dans quel centre êtes-vous?
  <select name="site" id=site onchange='window.open("stock.php?id=" + this.options[this.selectedIndex].value,"_top")'>
    <option selected="selected"></option>
<?php
while ($donnees = mysqli_fetch_array($res)){
  ?>
  <option value=<?php echo $donnees['id']; ?>><?php echo $donnees['Libelle']; ?></option>;
  <?php
}
 ?>
</select>

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
    $sql = "SELECT stock.id, NomObjet, Quantite, PrixUnitaire FROM stock INNER JOIN site WHERE stock.id_site=site.id AND id_site='$var'";
	  $result = $conn->query($sql);

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	        echo "<tr><td>" . $row["id"]. "</td><td>" . $row["NomObjet"]. "</td><td>" . $row["Quantite"]. " </td><td>" . $row["PrixUnitaire"]."</td><td>". $row["Quantite"] * $row["PrixUnitaire"] ."</td></tr>";
	    }
	} else {
	    echo "0 results";
	}
	$conn->close();

 echo $lib['Libelle'];
 ?>
 	</table>
 	</div>
    <input type ="hidden" name="id" type="id" value=<?php echo $var ;?>>
    <input type="submit" value="Modifier stock">

  </form>

</body>
</html>
<?php
}
else {
  ?>
  <label for="site">Dans quel centre êtes-vous?
  <select name="site" id=site onchange='window.open("stock.php?id=" + this.options[this.selectedIndex].value,"_top")'>
    <option selected="selected"></option>
<?php
while ($donnees = mysqli_fetch_array($res)){
  ?>
  <option value=<?php echo $donnees['id']; ?>><?php echo $donnees['Libelle']; ?></option>;
  <?php
}
}
