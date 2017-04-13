<?php

$host="localhost";
$user="root";
$password="";
$base="dentegostock";

$conn = mysqli_connect($host,$user,$password,$base);
$req = "SELECT * FROM site";
$res = $conn->query($req);
echo "Quel est votre centre ?";
echo '<select name="myname">';

while ($donnees = mysqli_fetch_array($res)){
echo '<option value="'.$donnees['Libelle'].'">'.$donnees['Libelle'].'</option>';
}

echo '</select>';



 ?>
