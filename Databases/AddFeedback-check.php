<?php 
session_start();
include "db_conn.php";

if (isset($_POST['eventname']) && isset($_POST['date']) 
&& isset($_POST['starttime']) 
&& isset($_POST['feedback'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$eventname = validate($_POST['eventname']);
    $date = validate($_POST['date']);
    $starttime = validate($_POST['starttime']);
    $feedback = validate($_POST['feedback']);

    if(empty($eventname)){
        header("Location: MyFeedbacks.php?error=Event Name is required");
        exit();

    }else if(empty($date)){
        header("Location: MyFeedbacks.php?error=Date is required");
        exit();

    }else if(empty($starttime)){
        header("Location: MyFeedbacks.php?error=Start time is required");
        exit();

    }else if(empty($feedback)){
        header("Location: MyFeedbacks.php?error=End time is required");
        exit();

    }else{
        $sql1 = "SELECT idActivitati from activitati WHERE NumeActivitate = '$eventname' AND DataInceput = '$date' AND OraInceput = '$starttime'";
        $result1 = mysqli_query($conn, $sql1);
        $row = mysqli_fetch_array($result1);

        $sql2 = "INSERT INTO feedback(idActivitati,Feedback) VALUES('$row[0]','$feedback')";
        $result2 = mysqli_query($conn, $sql2);
        if($result2){
                header("Location: MyFeedbacks.php?success=Event added succesfully!");
                exit();
            }else{
                header("Location: MyFeedbacks.php?error=unknown error occurred");
                exit();
            }
        }
    }else{
	header("Location: MyFeedbacks.php");
	exit();
}