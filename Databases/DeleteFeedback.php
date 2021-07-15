<?php 
session_start();
include "db_conn.php";

if(isset($_POST["delete-button"])){
    if($_GET['action'] == "delete"){
        $idActivitati = $_GET['idActivitati'];
        $Feedback = $_GET['Feedback'];
 
        $sql2 = "DELETE FROM feedback WHERE Feedback = '$Feedback' AND idActivitati = '$idActivitati'";
        mysqli_query($conn, $sql2);
                
        header("Location: MyFeedbacks.php?Succes=deletesuccesfull");
        exit();
    }
}