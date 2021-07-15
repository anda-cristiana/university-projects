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
    <form class = 'main' action="AddContacts-check.php" method="post">
        <h2>Add contacts to my agenda</h2>
        <?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
            <?php } ?>

        <?php if (isset($_GET['success'])) { ?>
     		 <p class="success"><?php echo $_GET['success']; ?></p>
        <?php } ?>

         <label>Last Name</label>
         <?php if (isset($_GET['lastname'])) { ?>
            <input type="text" 
                name="lastname" 
                placeholder="Last name" 
                value="<?php echo $_GET['lastname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="lastname" 
                placeholder="Last Name"><br> 
         <?php }?>

         <label>First Name</label>
         <?php if (isset($_GET['firstname'])) { ?>
            <input type="text" 
                name="firstname" 
                placeholder="First name" 
                value="<?php echo $_GET['firstname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="firstname" 
                placeholder="First name"><br> 
         <?php }?>

         <label>Phone number</label>
         <?php if (isset($_GET['phone'])) { ?>
            <input type="text" 
                name="phone" 
                placeholder="Phone number" 
                value="<?php echo $_GET['phone']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="phone" 
                placeholder="Phone number"><br> 
         <?php }?> 
        <button class="confirm" type="submit">Add contact</button><br>
    </form>
    </div>
    <div class="column">
    <h2> My agenda </h2>
    <?php 
        $sql = "SELECT * FROM invitati";
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_array($result)){
            echo "
            <div class = 'event-agenda'>
            <div class ='name'>"; echo $row[1]; echo " "; echo $row[2]; echo "</div>
            <div class ='phone'>"; echo $row[3]; echo "</div>
            </div>
            <div class ='butoane'>
            <form class = 'other' action = 'DeleteContacts.php?action=delete&Nume=$row[1]&Prenume=$row[2]' method='post'>
                <button class='delete-button' type='submit' name='delete-button'>Delete</button>
            </form>
            <form class = 'other' action = 'UpdateContacts.php?action=update&Phone=$row[3]' method='post'>
                <input type = 'text' name='phoneNumber' placeholder='New phone number'><br> 
                <button class='update-button' type='submit' name='update-button'>Update number</button>    
            </form>
            </div>";

        }
    ?>
</div>
</div>
</body>
</html>