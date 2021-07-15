<?php 
session_start();
include "db_conn.php";

if (isset($_POST['eventname']) && isset($_POST['date']) 
&& isset($_POST['starttime']) && isset($_POST['endtime']) 
&& isset($_POST['repeat'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$eventname = validate($_POST['eventname']);
    $date = validate($_POST['date']);
    $starttime = validate($_POST['starttime']);
    $endtime = validate($_POST['endtime']);
    $repeat = validate($_POST['repeat']);
    $description = validate($_POST['description']);

     
    if(empty($eventname)){
        header("Location: AddEvents.php?error=Event Name is required");
        exit();

    }else if(empty($date)){
        header("Location: AddEvents.php?error=Date is required");
        exit();

    }else if(empty($starttime)){
        header("Location: AddEvents.php?error=Start time is required");
        exit();

    }else if(empty($endtime)){
        header("Location: AddEvents.php?error=End time is required");
        exit();

    }else if(empty($repeat)){
        header("Location: AddEvents.php?error=Repeat field is required");
        exit();
    }else{
        $sql = "SELECT * FROM activitati WHERE DataInceput='$date' AND ( NOT((OraInceput > '$endtime' AND OraInceput > '$starttime') OR (OraFinal < '$endtime' AND OraFinal < '$starttime')))";

        $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) > 0){
            header("Location: AddEvents.php?error = Date and hours already taken!");
            exit();
        }else{
            $sql2 = "INSERT INTO activitati(NumeActivitate,DataInceput,OraInceput,OraFinal,Repetare,Descriere) VALUES('$eventname','$date','$starttime','$endtime','$repeat','$description')";
            $result2 = mysqli_query($conn, $sql2);
            if($result2){
                header("Location: AddEvents.php?success=Event added succesfully!");
                exit();
            }else{
                header("Location: AddEvents.php?error=unknown error occurred");
                exit();
            }
        }
    }
	
}else{
	header("Location: AddEvents.php");
	exit();
}