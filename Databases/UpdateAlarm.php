<?php 
session_start();
include "db_conn.php";

if(isset($_POST["update-button"])){
    if($_GET['action'] == "update"){
        $NumarAlarme = $_GET['NumarAlarme'];
        $idAlerta = $_GET['idAlerta'];
        $idActivitati = $_GET['idActivitati'];

        if($NumarAlarme != 0){
        $sql1 = "UPDATE alerta SET Status = 'Read' WHERE idAlerta = '$idAlerta' AND Activitati_idActivitati = '$idActivitati'";
        mysqli_query($conn, $sql1);

        $sql2 ="SELECT MIN(Calendar_Data) FROM alerta WHERE Activitati_idActivitati = '$idActivitati' AND Status = 'Unread'";
        $result2 = mysqli_query($conn, $sql2);
        $row2 = mysqli_fetch_array($result2);
        echo $row2[0];

        $sql3 = "UPDATE activitati SET DataInceput = '$row2[0]' WHERE idActivitati = '$idActivitati'";
        mysqli_query($conn, $sql3);
        }      
        header("Location: MyEvents.php?Succes=alarmread");
        exit();   
    }
}