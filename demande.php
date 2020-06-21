<?php
//test
include("connect.php");
session_start();
if (!isset($_SESSION ['name']))
    header ('location:index.php');
//Remplir La liste
$query_type = "SELECT * FROM type_conge";
$result = mysqli_query($con,$query_type);


/////////////////////////////












//Formulaire
if(isset($_POST['Valider']))
{
  $date_debut=htmlspecialchars(trim($_POST['date_debut']));
  $date_fin=htmlspecialchars(trim($_POST['date_fin']));
  $msg = 'invalid date';
  $date_demande=date("Y-m-d");
  $id_employe= $_SESSION['id_employe'];
  $nom = $_SESSION['nom'];
  $prenom = $_SESSION['prenom'];

  if ($date_debut < $date_demande || $date_fin < $date_debut) {
    // die("<script>alert('$msg')</script>");
    echo "<script>alert('$msg')</script>";

  }else {
    $type_congé=htmlspecialchars(trim($_POST['pets']));
    $query_dcongé = "INSERT INTO demande_conge(nom, prenom, date_debut,date_fin,date_demande,id_employe,id_type)VALUE('$nom','$prenom','$date_debut','$date_fin','$date_demande','$id_employe','$type_congé')";

      if(mysqli_query($con,$query_dcongé)){
          echo "la demande est envoyé";
      }
      header("Location:valider.php");
  }
  }
  // echo $date_fin. " " .$date ;


  //Date de demande ::



?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Style-horloge.css">
    <title>cp</title>
    <link rel="stylesheet" href="demande.css">
</head>
<body>
<center>
   <div>
   

      <h3>Ajouter la demande de congé</h3>
        <hr>
     <div>
            <form action="" method="POST">

      <div>
        <label for="date_debut">date debut*</label><br>
        <input type="date" id="date_debut"  name="date_debut" value="<?php echo date('Y-m-d'); ?>" ><br><br>
      </div>
      <div>
        <label for="date_fin">date fin*</label><br>
        <input type="date" id="date_fin" name="date_fin" ><br><br>
      </div>
      <div>
      <div>
      
        <label for="matricule">id employe*</label><br>
        <input type="text" name="id_employe" placeholder="<?=$_SESSION['id_employe'];?>" disabled><br><br>
      </div>
      <div>
        <label for="type_conge">Type de congé*</label><br>


        <select name="pets" id="pet-select">
        <?php
          if(mysqli_num_rows($result)>0){
            while($row = mysqli_fetch_assoc($result)) {
              ?>
              <option value="<?=$row['id'];?>" ><?=$row["libelle"];?></option>
              <?php
            }
          }else{
            echo "0 result";
          }
        ?>
        </select>

      </div>

      <div>
        
       <button type="submit" name="Valider">Valider</button><br><br>
      </div>
      
      <div>
      <button type=submit><a href = "déconnexion.php">déconnexion</a></button>
      </div>

    </form>
 </div>

</div>
</center>
<script>
  // var dateDebut = document.getElementById('date_debut').addEventListner("change", (e) => {
  //   document.getElementById('dateDebut') > document.getElementById('date_fin').min})
    document.getElementById("date_debut").addEventListener('change', (e) => {
          document.getElementById("date_fin").min = e.target.value;
        })

        document.getElementById("date_fin").addEventListener('change', (e) => {
              document.getElementById("date_debut").max = e.target.value;
          })

        function SetMinDate() {
          var now = new Date();

          var day = ("0" + now.getDate()).slice(-2);
          var month = ("0" + (now.getMonth() + 1)).slice(-2);

          var today = now.getFullYear() + "-" + (month) + "-" + (day);


          document.getElementById("date_debut").min = today;
          document.getElementById("date_fin").min = today;
     }
    SetMinDate();
    </script>
</body>

</html>
