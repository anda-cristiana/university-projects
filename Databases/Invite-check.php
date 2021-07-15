<?php 
session_start();
include "db_conn.php";

if (isset($_POST['eventname']) && isset($_POST['date']) 
&& isset($_POST['starttime']) && isset($_POST['lastname']) 
&& isset($_POST['firstname'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$eventname = validate($_POST['eventname']);
    $date = validate($_POST['date']);
    $starttime = validate($_POST['starttime']);
    $lastname = validate($_POST['lastname']);
    $firstname = validate($_POST['firstname']);
    $message = validate($_POST['message']);

     
    if(empty($eventname)){
        header("Location: AddEvents.php?error=Event Name is required");
        exit();

    }else if(empty($date)){
        header("Location: AddEvents.php?error=Date is required");
        exit();

    }else if(empty($starttime)){
        header("Location: AddEvents.php?error=Start time is required");
        exit();

    }else if(empty($lastname)){
        header("Location: AddEvents.php?error=Last Name is required");
        exit();

    }else if(empty($firstname)){
        header("Location: AddEvents.php?error=First Name is required");
        exit();
    }else{

        $sql3 = "SELECT idActivitati FROM activitati WHERE NumeActivitate = '$eventname' AND DataInceput = '$date' AND OraInceput = '$starttime'";
        $result3 = mysqli_query($conn, $sql3);
        $row3 = mysqli_fetch_array($result3, MYSQLI_NUM);
        $idActivitati = $row3[0];

        $sql31 = "SELECT idInvitati FROM invitati WHERE Nume = '$lastname' AND Prenume = '$firstname'";
        $result31 = mysqli_query($conn, $sql31);
        $row31 = mysqli_fetch_array($result31, MYSQLI_NUM);
        $idInvitati = $row31[0];

        $sql5 = "INSERT INTO invitatieveniment (Mesaj, Invitati_idInvitati, Activitati_idActivitati) VALUES ('$message', '$idInvitati', '$idActivitati')";
        $result4 = mysqli_query($conn, $sql5);
        if($result4){
            header("Location: AddEvents.php?success=Contact added succesfully!");
            exit();
        }else{
            header("Location: AddEvents.php?error=unknown error occurred");
            exit();
        }
    }	
}else{
	    header("Location: AddEvents.php");
	    exit();
    }