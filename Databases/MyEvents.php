<?php
session_start();
include "db_conn.php";
?> 

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style8new.css">   
</head>

<body>
<div class = "navbar">
    <ul>
        <li><a href = "MyEvents.php">My Events</a></li>
        <li><a href = "AddEvents.php">Add Events</a></li>
        <li><a href = "MyFeedbacks.php">My Feedbacks</a></li>
        <li><a href = "MyContacts.php">My Contacts</a></li>
        <li><a href = "MyReview.php"> My Review</a></li>
        <li><a href= "logout.php">Log Out</a><li>
    </ul>
</div>
<div class = "up">
<?php 
        $sql7 = "SELECT count(idActivitati)
        FROM activitati LEFT JOIN alerta ON idActivitati = Activitati_idActivitati
        LEFT JOIN calendar ON  Calendar_Data = Data
        WHERE TipData =  'Workday'";
        $result7 = mysqli_query($conn, $sql7);  
        while($row = mysqli_fetch_array($result7)){
            echo "
            <div class = 'up1'> Number of events on Workdays: "; echo $row[0];"</div>";
        }
    ?> <div>
<div class = "column">
<div class="event-container">
    <?php 
        $sql = "SELECT * FROM activitati ORDER BY DataInceput ASC";
        $result = mysqli_query($conn, $sql);  
        while($row = mysqli_fetch_array($result)){
            echo "
            <div class = 'event'>
            <div class ='date'>"; echo $row[2]; echo "</div>
            <div class = 'event-name'>"; echo $row[1]; echo"</div>
            <div class ='event-description'>"; echo $row[6]; echo "</div>
            <div class = 'event-time'>"; echo $row[3]; echo "</div>
            <div class = 'event-time'>"; echo $row[4]; echo "</div>
            <div class = 'event-repeat'>"; echo $row[5]; echo "</div>
            </div>
            <form action = 'DeleteEvents.php?action=delete&NumeActivitate=$row[1]&DataInceput=$row[2]&OraInceput=$row[3]' method='post'>
                <button class='delete-button' type='submit' name='delete-button'>Delete</button>
            </form>";
        }
    ?>
</div>
<div class = "event-alarm">
<?php 
        $sql_alarm = "SELECT COUNT(AL.DeclansareAlerta), A.NumeActivitate, AL.idAlerta, A.idActivitati FROM alerta AL LEFT JOIN activitati A ON AL.Activitati_idActivitati = A.idActivitati WHERE Status = 'Unread' GROUP BY AL.Activitati_idActivitati ";
        $result_alarm = mysqli_query($conn, $sql_alarm);
        while($row_alarm = mysqli_fetch_array($result_alarm)){
            echo "
            <div class = 'alarm'>
            <div class = 'event-name-alarm'>"; echo $row_alarm[1]; echo"</div>
            <div class ='event-number-alarm'>"; echo $row_alarm[0]; echo "</div>
            </div>
            <form action = 'UpdateAlarm.php?action=update&NumarAlarme=$row_alarm[0]&idAlerta=$row_alarm[2]&idActivitati=$row_alarm[3]' method='post'>
                <button class='update-button' type='submit' name='update-button'>Read</button>
            </form>";
        }
        ?>
</div>
</div>
</body>
</html>    