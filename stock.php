<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Stock</title>
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
?>

<form method="post" action="pagestock.php">
  <label for="site">Dans quel centre êtes-vous?
  <select name="site" id=site>
<?php
while ($donnees = mysqli_fetch_array($res)){
  ?>
  <option value=<?php echo $donnees['Libelle']; ?>><?php echo $donnees['Libelle']; ?></option>;
  <?php
}
 ?>
</select>
 <input type="submit" value="ok">
</form>
</body>
</html>
