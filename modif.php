<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Stock page</title>

    </head>

      <body>
      <div id="">
      <input type="button"
        <?php
        $con = mysqli_connect("localhost","root","","dentegostock");
      	if (mysqli_connect_errno())
        	{
        		echo "Failed to connect to MySQL: " . mysqli_connect_error();
        	}
        $id = $_POST['id'];
        $sql = "SELECT stock.id, NomObjet, Quantite, PrixUnitaire FROM stock INNER JOIN site WHERE stock.id_site=site.id AND id_site='$id'";
        $result = $con->query($sql);
        ?>
          <label for="modif">Que voulez-vous modifier ?
          <select name="modif" id=modif>
            <option selected="selected"></option>
        <?php
        while ($donnees = mysqli_fetch_array($result)){
          ?>
          <option value=<?php echo $donnees['NomObjet']; ?>><?php echo $donnees['NomObjet']; ?></option>;
          <?php
        }
         ?>
         <input type="button" value="ajouter" /> 

      </body>
      </html>
