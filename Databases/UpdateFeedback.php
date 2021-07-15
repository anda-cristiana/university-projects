<?php 
session_start();
include "db_conn.php";

if(isset($_POST["update-button"])){
    if($_GET['action'] == "update"){
        $idActivitati = $_GET['idActivitati'];
        $feedback = $_GET['Feedback']; 
        $newFeedback = $_POST['Newfeedback'];

        echo  $idActivitati;
        echo $feedback; 
        echo $newFeedback;


        $sql1 = "UPDATE feedback F SET F.Feedback = '$newFeedback' WHERE F.idActivitati = '$idActivitati' AND F.feedback = '$feedback'";
        mysqli_query($conn, $sql1);
                
        header("Location: MyFeedbacks.php?Succes=updatesuccesfull");
        exit();
    }
}