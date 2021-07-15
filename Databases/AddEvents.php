<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style5.css">   
</head>

<body>
<div class = "navbar">
        <ul>
            <li><a href = "MyEvents.php">My Events</a></li>
            <li><a href = "AddEvents.php">Add Events</a></li>
            <li><a href = "MyContacts.php">My Contacts</a></li>
            <li><a href = "MyFeedbacks.php">My Feedbacks</a></li>
            <li><a href = "MyReview.php"> My Review</a></li>
            <li><a href= "logout.php">Log Out</a><li>
        </ul>
    </div>

<div id="divMare" style ="width: 95%;">
    <div id="div1" style="display:inline-block;width:45%;float:left;">
        <form action="AddEvents-check.php" method="post">
            <h2>Add Events</h2>
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
                placeholder="Name of the event" 
                value="<?php echo $_GET['eventname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="eventname" 
                placeholder="Name of the event"><br> 
         <?php }?>

         <label>Date</label>
         <?php if (isset($_GET['date'])) { ?>
            <input type="date" 
                name="date" 
                placeholder="Date of the event" 
                value="<?php echo $_GET['date']; ?>"><br> 
         <?php } else {?>
            <input type="date" 
                name="date" 
                placeholder="Date of the event"><br> 
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

         <label>End time</label>
         <?php if (isset($_GET['endtime'])) { ?>
            <input type="time" 
                name="endtime" 
                placeholder="End time" 
                value="<?php echo $_GET['endtime']; ?>"><br> 
         <?php } else {?>
            <input type="time" 
                name="endtime" 
                placeholder="End time"><br> 
         <?php }?>

        <label>Does the event repeat?</label>
         <?php if (isset($_GET['repeat'])) { ?>
            <input type="text" 
                name="repeat" 
                placeholder="no/weekly/monthly/yearly" 
                value="<?php echo $_GET['repeat']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="repeat" 
                placeholder="no/weekly/monthly/yearly"><br> 
         <?php }?>

                 <label>Description?</label>
         <?php if (isset($_GET['description'])) { ?>
            <input type="text" 
                name="description" 
                placeholder="Description" 
                value="<?php echo $_GET['description']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="description" 
                placeholder="Description"><br> 
         <?php }?> 
        <button type="submit">Add event</button><br>
    </form>
    </div>

    <div id="div2" style = "display:inline-block;width:45%;float:right;">        
    <form  action="AddLocation-check.php" method="post">
        <h2>Add Location</h2>
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
                placeholder="Name of the event" 
                value="<?php echo $_GET['eventname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="eventname" 
                placeholder="Name of the event"><br> 
         <?php }?>

         <label>Date</label>
         <?php if (isset($_GET['date'])) { ?>
            <input type="date" 
                name="date" 
                placeholder="Date of the event" 
                value="<?php echo $_GET['date']; ?>"><br> 
         <?php } else {?>
            <input type="date" 
                name="date" 
                placeholder="Date of the event"><br> 
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

         <label>Street</label>
         <?php if (isset($_GET['street'])) { ?>
            <input type="text" 
                name="street" 
                placeholder="Eg. Bd-ul Iuliu Maniu" 
                value="<?php echo $_GET['street']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="street" 
                placeholder="Eg. Bd-ul Iuliu Maniu"><br> 
         <?php }?>

        <label>Number</label>
         <?php if (isset($_GET['number'])) { ?>
            <input type="text" 
                name="number" 
                placeholder="Street number" 
                value="<?php echo $_GET['number']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="number" 
                placeholder="Street number"><br> 
         <?php }?>

        <label>City</label>
         <?php if (isset($_GET['city'])) { ?>
            <input type="text" 
                name="city" 
                placeholder="City" 
                value="<?php echo $_GET['city']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="city" 
                placeholder="City"><br> 
         <?php }?> 

         <label>County</label>
         <?php if (isset($_GET['county'])) { ?>
            <input type="text" 
                name="county" 
                placeholder="County" 
                value="<?php echo $_GET['county']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="county" 
                placeholder="County"><br> 
         <?php }?> 

         <label>Country</label>
         <?php if (isset($_GET['country'])) { ?>
            <input type="text" 
                name="country" 
                placeholder="Country - optional" 
                value="<?php echo $_GET['country']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="country" 
                placeholder="Country - optional"><br> 
         <?php }?> 
        <button type="submit">Add Location</button><br> 
    </form>
    </div>

    <div id="div3" style = "display:inline-block;width:45%;float:left;">        
    <form  action="Invite-check.php" method="post">
        <h2>Invite someone</h2>
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
                placeholder="Name of the event" 
                value="<?php echo $_GET['eventname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="eventname" 
                placeholder="Name of the event"><br> 
         <?php }?>

         <label>Date</label>
         <?php if (isset($_GET['date'])) { ?>
            <input type="date" 
                name="date" 
                placeholder="Date of the event" 
                value="<?php echo $_GET['date']; ?>"><br> 
         <?php } else {?>
            <input type="date" 
                name="date" 
                placeholder="Date of the event"><br> 
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

         <label>Last Name</label>
         <?php if (isset($_GET['lastname'])) { ?>
            <input type="text" 
                name="lastname" 
                placeholder="Last Name" 
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
                placeholder="First Name" 
                value="<?php echo $_GET['firstname']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="firstname" 
                placeholder="First Name"><br> 
         <?php }?>

         <label>Send Message</label>
         <?php if (isset($_GET['message'])) { ?>
            <input type="text" 
                name="message" 
                placeholder="Send Message" 
                value="<?php echo $_GET['message']; ?>"><br> 
         <?php } else {?>
            <input type="text" 
                name="message" 
                placeholder="Send Message"><br> 
         <?php }?> 

        <button type="submit">Add Contact</button><br> 
    </form>
    </div>       


    </div>    

</body>
</html>