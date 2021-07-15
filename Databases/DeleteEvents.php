<?php 
session_start();
include "db_conn.php";

if(isset($_POST["delete-button"])){
    if($_GET['action'] == "delete"){
        $NumeActivitate = $_GET['NumeActivitate'];
        $OraInceput = $_GET['OraInceput'];
        $DataInceput = $_GET['DataInceput'];

        $sql = "SELECT idActivitati FROM activitati WHERE NumeActivitate = '$NumeActivitate' AND OraInceput = '$OraInceput' AND DataInceput = '$DataInceput'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);

        $sql1 = "DELETE FROM locactivitati WHERE idActivitati = '$row[0]'";
        mysqli_query($conn, $sql1);

        
        $sql2 = "DELETE FROM invitatieveniment WHERE Activitati_idActivitati = '$row[0]'";
        mysqli_query($conn, $sql2);

        
        $sql3 = "DELETE FROM alerta WHERE Activitati_idActivitati = '$row[0]'";
        mysqli_query($conn, $sql3);

        $sql5 = "DELETE FROM feedback WHERE idActivitati = '$row[0]'";
        mysqli_query($conn, $sql5);
                
        $sql4 = "DELETE FROM activitati WHERE idActivitati = '$row[0]'";
        mysqli_query($conn, $sql4);
        
        header("Location: MyEvents.php?Succes=deletesuccesfull");
        exit();
    }
}