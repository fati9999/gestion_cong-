<?php

include("connect.php");
session_start();
if (!isset($_SESSION ['name']))
    header ('location:index.php');   
$id_employe = $_SESSION['id_employe'];
$nom = $_SESSION['nom'];


if (isset($_GET['edit_dc'])) {
  $_SESSION['id_modif'] = $_GET['edit_dc'];
  header('location: formulaire_modif.php');
}

//Remplir La liste
$query_type = "SELECT * FROM demande_conge where id_employe = '$id_employe'";
$result = mysqli_query($con,$query_type);

//suprimer la demande de congé
if(isset($_GET['delete_dc'])){
  $id = $_GET['delete_dc'];
  global $con;
  $sql = "DELETE FROM `demande_conge` WHERE id = $id";
  $res = mysqli_query($con,$sql);
}
if (isset($_POST['déconnecté'])){
  unset($_SESSION ['name']);
  header('location: index.php');
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>resultat</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<table border=1>
<tr>
            <td>id employer</td>
            <td>nom</td>
            <td>prénom</td>
            <td>date de debut</td>
            <td>date de fin</td>
            <td>Date de demande</td>
            <td>Decision</td>
            <td>suprimer</td>
            <td>Modifier</td>
        </tr>
<?php



if(mysqli_num_rows($result)>0 ){


    //var_dump($row);
    while($row = mysqli_fetch_assoc($result) ) {
      ?>
      <tr>
        <td><?=$row['id_employe'];?></td>
        <td><?=$row['nom'];?></td>
        <td><?=$row['prenom'];?></td>
        <td><?=$row['date_debut'];?></td>
        <td><?=$row['date_fin'];?></td>
        <td><?=$row['date_demande'];?></td>
        <td><?=$row['decision'];?></td>
        <td><a href="resultat.php?delete_dc=<?=$row['id'];?>">Suprimer</a></td>
        <td><a href="resultat.php?edit_dc=<?=$row['id'];?>">Modifier</a></td>

      </tr>
      <?php
    }
  }else{
    echo "0 result";
  }

?>



        <?php
        include("connect.php");
            // $r=mysqli_query($con,"select * from demande_conge where id=1")
        ?>
    </table>

    <form action="" method="POST">
        <button type=submit name="submit1">solde de congé</button>
        <button type=submit name="déconnecté">déconnecté</button>
    </form>

</body>
</html>
