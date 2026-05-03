<?php
include 'connect.php';

$name  = $_POST["name"] ?? '';
$attendance_id = $_POST["attendance_id"] ?? '';
$student_id = $_POST["student_id"] ?? '';
$status  = $_POST["status"] ?? '';

if ($attendance_id == "" || $student_id == "" || $status == "") {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO diya_attendance_records (name, attendance_id, student_id, status) 
        VALUES (?, ?, ?, ?)";

$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "siis", $name, $attendance_id, $student_id, $status);

if (mysqli_stmt_execute($stmt)) {
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>