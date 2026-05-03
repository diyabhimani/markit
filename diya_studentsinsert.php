<?php
include 'connect.php';

$name  = mysqli_real_escape_string($con, $_POST["name"] ?? '');
$roll_no = mysqli_real_escape_string($con, $_POST["roll_no"] ?? '');
$class_id = mysqli_real_escape_string($con, $_POST["class_id"] ?? '');

if ($name == "" || $roll_no == "" || $class_id == "") {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO diya_students (name, roll_no, class_id) 
        VALUES ('$name', '$roll_no', '$class_id')";

if(mysqli_query($con, $sql)){
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>