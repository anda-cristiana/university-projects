<?php 
session_start();
include "db_conn.php";

if(isset($_POST["update-button"])){
    if($_GET['action'] == "update"){
        $Phone = $_GET['Phone'];//vechi
        $phoneNumber = $_POST['phoneNumber'];//nou

        $sql = "SELECT idInvitati FROM invitati WHERE Telefon = '$Phone'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);
        $sql1 = "UPDATE invitati I SET I.Telefon = '$phoneNumber' WHERE I.idInvitati = '$row[0]'";
        mysqli_query($conn, $sql1);
                
        header("Location: MyContacts.php?Succes=updatesuccesfull");
        exit();
    }
}