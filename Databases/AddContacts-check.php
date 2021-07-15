<?php 
session_start();
include "db_conn.php";

if (isset($_POST['lastname']) 
&& isset($_POST['firstname'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

    $lastname = validate($_POST['lastname']);
    $firstname = validate($_POST['firstname']);
    $phone = validate($_POST['phone']);

     
    if(empty($lastname)){
        header("Location: MyContacts.php?error=Last Name is required");
        exit();

    }else if(empty($firstname)){
        header("Location: MyContacts.php?error=First Name is required");
        exit();
    }else{
        $sql5 = "INSERT INTO invitati (Nume, Prenume, Telefon) VALUES ('$lastname', '$firstname', '$phone')";
        $result4 = mysqli_query($conn, $sql5);
        if($result4){
            header("Location: MyContacts.php?success=Contact added succesfully!");
            exit();
        }else{
            header("Location: MyContacts.php?error=unknown error occurred");
            exit();
        }
    }	
}else{
	    header("Location: MyContacts.php");
	    exit();
    }