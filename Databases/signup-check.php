<?php 
session_start();
include "db_conn.php";

if (isset($_POST['uname']) && isset($_POST['password']) 
&& isset($_POST['lname']) && isset($_POST['fname']) 
&& isset($_POST['mail']) && isset($_POST['re_password'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$uname = validate($_POST['uname']);
    $pass = validate($_POST['password']);
    $lname = validate($_POST['lname']);
    $fname = validate($_POST['fname']);
    $email = validate($_POST['mail']);
    $re_password = validate($_POST['re_password']);
    $phone = validate($_POST['phone']);

    $user_data= 'uname='. $uname. '&name=' . $fname;
 
    
    if(empty($uname)){
        header("Location: signup.php?error=User Name is required&$user_data");
        exit();

    }else if(empty($pass)){
        header("Location: signup.php?error=Password is required&$user_data");
        exit();

    }else if(empty($lname)){
        header("Location: signup.php?error=Last Name is required&$user_data");
        exit();

    }else if(empty($fname)){
        header("Location: signup.php?error=First Name is required&$user_data");
        exit();

    }else if(empty($email)){
        header("Location: signup.php?error=Email is required&$user_data");
        exit();

    }else if(empty($re_password)){
        header("Location: signup.php?error= Password not confirmed&$user_data");
        exit();

    }else if($pass !==$re_password){
            header("Location: signup.php?error=The confirmation password does not match&$user_data");
            exit();

    }else{

        $sql = "SELECT * FROM user WHERE username='$uname'";

        $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) > 0){
            header("Location: signup.php?error=The User Name is taken try another&$user_data");
            exit();
        }else{
            $sql2 = "INSERT INTO user(username,email,password,Nume,Prenume,NumarTelefon) VALUES('$uname','$email','$pass','$lname','$fname','$phone')";
            $result2 = mysqli_query($conn, $sql2);
            if($result2){
                header("Location: signup.php?success=Your account has been created successfully!");
                exit();
            }else{
                header("Location: signup.php?error=unknown error occurred$user_data");
                exit();
            }
        }
    }
	
}else{
	header("Location: signup.php");
	exit();
}