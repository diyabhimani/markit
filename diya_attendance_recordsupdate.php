<?php
include 'connect.php';
header('Content-Type: application/json');

$id = $_POST['id'] ?? null;
$attendance_id = $_POST['attendance_id'] ?? null;
$student_id = $_POST['student_id'] ?? null;
$status = $_POST['status'] ?? null;

if (!$id) {
    echo json_encode(["message" => "ID is required"]);
    exit;
}

$sql = "UPDATE diya_attendance_records 
        SET attendance_id=?, student_id=?, status=? 
        WHERE id=?";

$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "iisi", $attendance_id, $student_id, $status, $id);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode(["message" => "Record updated"]);
} else {
    echo json_encode(["message" => "Error: " . mysqli_error($con)]);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>