<?php

$sname = "localhost";
$unmae ="root";
$password = "Cristiana22!";
$db_name = "planner";

$conn = mysqli_connect($sname, $unmae, $password, $db_name);

if(!$conn){
    echo "Connection failed!";
}