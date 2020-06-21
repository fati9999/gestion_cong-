<?php
include("connect.php");
session_start();
if(isset($_POST['submit'])){

    //Récupérer POST ::
    $name=htmlspecialchars(strtolower(trim($_POST['cin'])));
    $password=$_POST['password'];

    //Réquête
    $query = "SELECT id FROM auth WHERE login='$name' && pwd='$password'";
    $result = mysqli_query($con,$query);
    
    if(mysqli_num_rows($result)>0){
        //Récupérer ID Login
        $row = mysqli_fetch_assoc($result);
        $query_ID = "SELECT * FROM employe WHERE id_login='$row[id]'";
        $result_id = mysqli_query($con,$query_ID);

        //Récupérer ID Employe
        $id_employe = mysqli_fetch_assoc($result_id);
        var_dump($id_employe);
    
        //Enregistre Name & ID_Employe dans la session

        $_SESSION['name']=$name;
        $_SESSION['id_employe']=$id_employe['id'];
        $_SESSION['nom']=$id_employe['nom'];
        $_SESSION['prenom']=$id_employe['prenom'];
        var_dump($_SESSION);
        if($id_employe['id_service']==2)
            header("location:admin.php");
            
        else
        header("Location:home.php");
        
        
    }else{
        echo "name ou password est faut";
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>LoginIn</title>
</head>
<center>
<body>
    <form action="" method="POST">
        <input type="text" name="cin" placeholder="Entrer your cin" require><br>
        <input type="password" name="password" placeholder="Entrer your password" require><br>
        <button type=submit name="submit">LoginIn</button>
    </form>
</body>

   <div class="app">
   </div>
</center>

</html>