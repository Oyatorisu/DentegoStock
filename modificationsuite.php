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
      <div class="container">
  	  <div class="dropdown-content">
       	<?php
        $con = mysqli_connect("localhost","root","","dentegostock");
              if (mysqli_connect_errno())
                {
                        echo "Failed to connect to MySQL: " . mysqli_connect_error();
                }
        //$id = $_POST['id'];
        $sql = "SELECT stock.id, NomObjet, Quantite, PrixUnitaire FROM stock INNER JOIN site WHERE stock.id_site=site.id AND id_site='3'";
        $result = $con->query($sql);
        ?>
          <label for="modif">Que voulez-vous modifier ?</label>
          <select name="modif" id=modif>
            <option selected="selected"></option>
        <?php
        while ($donnees = mysqli_fetch_array($result)){
          ?>
          <option value=<?php echo $donnees['NomObjet']; ?>><?php echo $donnees['NomObjet']; ?></option>;
          <?php
        }
         ?>
         </select>
         </div>
    <table class="table">
    <tr>
      <td><input type="radio" name="type" value="entree">Entrée</td>
      <td><input type="radio" name="type" value="sortie">Sortie</td>
	  </tr>
		<tr>
      <td>Entrez la quantité ici</td>
      <td><input type="text" size="5" name="qte" placeholder="Quantité"/></td>
    </tr>
    <tr>
      <td><input type="submit" class="btn" value="OK"/></td>
    </tr>
  </table>
  </div>
      </body>
      </html>