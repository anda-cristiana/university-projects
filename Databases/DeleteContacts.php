<?php 
session_start();
include "db_conn.php";

if(isset($_POST["delete-button"])){
    if($_GET['action'] == "delete"){
        $Nume = $_GET['Nume'];
        $Prenume = $_GET['Prenume'];
       

        $sql = "SELECT idInvitati FROM invitati WHERE Nume = '$Nume' AND Prenume = '$Prenume'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);

        $sql1 = "DELETE FROM invitatieveniment WHERE Invitati_idInvitati = '$row[0]'";
        mysqli_query($conn, $sql1);
 
        $sql2 = "DELETE FROM invitati WHERE Nume = '$Nume' AND Prenume = '$Prenume'";
        mysqli_query($conn, $sql2);
                
        header("Location: MyContacts.php?Succes=deletesuccesfull");
        exit();
    }
}