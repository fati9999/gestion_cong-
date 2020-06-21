<?php
session_start();
if (!isset($_SESSION ['name'])){
    header ('location:index.php');    
}
if (isset($_POST['déconnexion'])){
    header ('location:index.php');
    unset($_SESSION ['name']);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="admin.css">
</head>
<body>
    <form action="" method="POST">
    <button type=submit>chef de projet</button>
    <button type=submit><a href="accpteourefuse.php">Accepter/Refuser congé</a></button>
    <button type=submit><a href ="déconnexion.php">déconnexion</a></button>
    </form>
</body>
</html>