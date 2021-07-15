<?php
session_start();

if(isset($_SESSION['id']) && isset($_SESSION['username'])){

?>
<!DOCTYPE html>
<html>

<head>
    <title>HOME</title>
    <link rel="stylesheet" href="style4new.css">   
</head>

<body>  
    <div class = "navbar">
        <ul>
            <li><a href = "MyEvents.php">My Events</a></li>
            <li><a href = "AddEvents.php">Add Events</a></li>
            <li><a href = "DeleteEvents.php">Delete Events</a></li>
            <li><a href = "MyFeedbacks.php">My Feedbacks</a></li>
            <li><a href = "MyContacts.php">My Contacts</a></li>
            <li><a href= "logout.php">Log Out</a><li>
        </ul>
    </div>

    <div class = "text"> Hello <?php echo $_SESSION['username'];?></div>    

</body>
</html>
<?php
}else{
    header("Location: index.php");
    exit();
}
?>