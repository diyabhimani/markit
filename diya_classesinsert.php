<?php
include 'connect.php';

$name  = mysqli_real_escape_string($con, $_POST["name"] ?? '');
$created_at = mysqli_real_escape_string($con, $_POST["created_at"] ?? '');

if ($name == "" || $created_at == "") {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO diya_classes (name, created_at) 
        VALUES ('$name', '$created_at')";

if(mysqli_query($con, $sql)){
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>