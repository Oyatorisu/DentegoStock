



<?php

$quanti=$_POST["quantite"];
 $con = mysqli_connect("localhost","root","","dentegostock");
            if (mysqli_connect_errno())
              {
                      echo "Failed to connect to MySQL: " . mysqli_connect_error();
              }
$sql = "INSERT INTO historique (Quantite_modif) VALUES (".$quanti.") ";
      $result = $con->query($sql);
      if ($result===true)
      	{
                      echo "Execution réussie";
              }
      else
      	{echo "Execution echouee";}
?>
