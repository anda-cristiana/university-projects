<?php
session_start();
include "db_conn.php";
?> 
<!DOCTYPE html>
<html>

<head>
    <title>HOME</title>
    <link rel="stylesheet" href="style9.css">   
</head>

<body>  
    <div class = "navbar">
        <ul>
            <li><a href = "MyEvents.php">My Events</a></li>
            <li><a href = "AddEvents.php">Add Events</a></li>
            <li><a href = "DeleteEvents.php">Delete Events</a></li>
            <li><a href = "MyFeedbacks.php">My Feedbacks</a></li>
            <li><a href = "MyContacts.php">My Contacts</a></li>
            <li><a href = "MyReview.php"> My Review</a></li>
            <li><a href= "logout.php">Log Out</a><li>
        </ul>
    </div>
    <div>
    <?php 
        $sql = "SELECT A.NumeActivitate FROM activitati A  LEFT JOIN alerta AL ON A.idActivitati = AL.Activitati_idActivitati LEFT JOIN calendar C ON AL.Calendar_Data = C.Data  WHERE C.Data = '2020-12-24'";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            echo "
            <div class ='text'> Do you fancy events on Christmas Eve? Events list: "; echo $row[0];"</div>
            ";
        }
        $sql1 = "SELECT I.Nume, I.Prenume FROM invitati I
        WHERE I.idInvitati IN (SELECT IE.Invitati_idInvitati FROM invitatieveniment IE WHERE IE.Activitati_idActivitati IN 
        (SELECT A.idActivitati FROM activitati A WHERE A.DataInceput > '2020-12-24' AND A.DataInceput < '2020-12-31'))";
        $result1 = mysqli_query($conn, $sql1);
        while($row = mysqli_fetch_array($result1)){
            echo "
            <div class ='text1'> Meeting "; echo $row[0];echo " ";echo $row[1]; echo " after Christmas? Think about buying some presents:) </div>
            ";
        }

        $sql2 = "SELECT I.idInvitati, I.Nume, I.Prenume
        FROM invitati I
        WHERE I.idInvitati NOT IN(
        SELECT IE.Invitati_idInvitati
        FROM invitatieveniment IE
        )";
        $result2 = mysqli_query($conn, $sql2);
        while($row = mysqli_fetch_array($result2)){
            echo "
            <div class ='text2'> You have't met "; echo $row[1];echo " ";echo $row[2]; echo " in a while. You should say hi!</div>
            ";
        }

        $sql3 = "SELECT Nume, Prenume
        FROM invitati
        WHERE idInvitati IN (
        SELECT Invitati_idInvitati
        FROM invitatieveniment
        WHERE Activitati_idActivitati IN(
        SELECT idActivitati
        FROM locactivitati
        WHERE Tara = 'Romania'))";
        $result3 = mysqli_query($conn, $sql3);
        while($row = mysqli_fetch_array($result3)){
            echo "
            <div class ='text3'> You have seen our country with "; echo $row[0];echo " ";echo $row[1]; echo "</div>
            ";
        }

        $sql4 = "SELECT NumeActivitate
        FROM activitati
        WHERE idActivitati NOT IN (
        SELECT idActivitati
        FROM feedback
        WHERE Feedback = 'Nice')";
        $result4 = mysqli_query($conn, $sql4);
        while($row = mysqli_fetch_array($result4)){
            echo "
            <div class ='text4'> This event "; echo $row[0]; echo " doesn't have a positive feedback :( Better luck next time. </div>
            ";
        }
    ?>
    </div>


</body>
</html>