<?php 
session_start();
include "db_conn.php";

if (isset($_POST['eventname']) && isset($_POST['date']) 
&& isset($_POST['starttime']) && isset($_POST['street']) 
&& isset($_POST['number']) && isset($_POST['city'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$eventname = validate($_POST['eventname']);
    $date = validate($_POST['date']);
    $starttime = validate($_POST['starttime']);
    $street = validate($_POST['street']);
    $number = validate($_POST['number']);
    $city = validate($_POST['city']);
    $county = validate($_POST['county']);
    $country = validate($_POST['country']);

     
    if(empty($eventname)){
        header("Location: AddEvents.php?error=Event Name is required");
        exit();

    }else if(empty($date)){
        header("Location: AddEvents.php?error=Date is required");
        exit();

    }else if(empty($starttime)){
        header("Location: AddEvents.php?error=Start time is required");
        exit();

    }else if(empty($street)){
        header("Location: AddEvents.php?error=Street is required");
        exit();

    }else if(empty($number)){
        header("Location: AddEvents.php?error=Number is required");
        exit();
    }else if(empty($city)){
        header("Location: AddEvents.php?error=City is required");
        exit();
    }else{
        $sql3 = "SELECT idActivitati FROM activitati WHERE NumeActivitate = '$eventname' AND DataInceput = '$date' AND OraInceput = '$starttime'";
        $result3 = mysqli_query($conn, $sql3);
        $row = mysqli_fetch_array($result3, MYSQLI_NUM);
        $idActivitati = $row[0];

        $sql4 = "INSERT INTO locactivitati(idActivitati,Strada,Numar,Oras,Judet,Tara) VALUES('$idActivitati','$street','$number','$city','$county','$country')";
        $result4 = mysqli_query($conn, $sql4);
        if($result4){
            header("Location: AddEvents.php?success=Location added succesfully!");
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