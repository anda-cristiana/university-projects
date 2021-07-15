<?php
session_start();
include "db_conn.php";
?> 

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style6.css">   
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
<div class = "row">
    <div class = "column">
    <form class = 'main' action="AddFeedback-check.php" method="post">
        <h2>Add feedback</h2>
        <?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
            <?php } ?>

        <?php if (isset($_GET['success'])) { ?>
     		 <p class="success"><?php echo $_GET['success']; ?></p>
        <?php } ?>

         <label>Event Name</label>
         <?php if (isset($_GET['eventname'])) { ?>
            <input type="text" 
                name="eventname" 
                placeholder="Event name" 
                value="<?php echo $_GET['eventname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="eventname" 
                placeholder="Event name"><br> 
         <?php }?>

         <label>Date</label>
         <?php if (isset($_GET['date'])) { ?>
            <input type="date" 
                name="date" 
                placeholder="Date" 
                value="<?php echo $_GET['date']; ?>"><br> 
         <?php } else {?>
            <input type="date" 
                name="date" 
                placeholder="Date"><br> 
         <?php }?>

         <label>Start time</label>
         <?php if (isset($_GET['starttime'])) { ?>
            <input type="time" 
                name="starttime" 
                placeholder="Start time" 
                value="<?php echo $_GET['starttime']; ?>"><br> 
         <?php } else {?>
            <input type="time" 
                name="starttime" 
                placeholder="Start time"><br> 
         <?php }?> 
         <label>Feedback</label>
         <?php if (isset($_GET['feedback'])) { ?>
            <input type="text" 
                name="feedback" 
                placeholder="Feedback" 
                value="<?php echo $_GET['feedback']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="feedback" 
                placeholder="Feedback"><br> 
         <?php }?> 
        <button class="confirm" type="submit">Add feedback</button><br>
    </form>
    </div>
    <div class="column">
    <h2> My Feedbacks </h2>
    <?php 
        $sql = "SELECT A.idActivitati, A.NumeActivitate, F.Feedback FROM feedback F LEFT JOIN activitati A ON F.idActivitati = A.idActivitati";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            echo "
            <div class = 'event-agenda'>
            <div class ='name'>"; echo $row[1]; echo "</div>
            <div class ='phone'>"; echo $row[2]; echo "</div>
            </div>
            <div class ='butoane'>
            <form class = 'other' action = 'DeleteFeedback.php?action=delete&idActivitati=$row[0]&Feedback=$row[2]' method='post'>
                <button class='delete-button' type='submit' name='delete-button'>Delete</button>
            </form>
            <form class = 'other' action = 'UpdateFeedback.php?action=update&idActivitati=$row[0]&Feedback=$row[2]' method='post'>
                <input type = 'text' name='Newfeedback' placeholder='New feedback'><br> 
                <button class='update-button' type='submit' name='update-button'>Update feedback</button>    
            </form>
            </div>";
        }
    ?>
</div>
</div>
</body>
</html>