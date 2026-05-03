<?php
include 'connect.php';

$class_id  = $_POST["class_id"] ?? '';
$date = $_POST["date"] ?? '';

if ($class_id == "" || $date == "") {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO diya_attendance (class_id, date) VALUES (?, ?)";
$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "is", $class_id, $date);

if (mysqli_stmt_execute($stmt)) {
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>