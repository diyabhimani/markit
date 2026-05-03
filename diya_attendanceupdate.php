<?php
include 'connect.php';
header('Content-Type: application/json');

$id = $_POST['id'] ?? null;
$class_id = $_POST['class_id'] ?? null;
$date = $_POST['date'] ?? null;

if (!$id) {
    echo json_encode(["message" => "ID is required"]);
    exit;
}

$sql = "UPDATE diya_attendance SET class_id=?, date=? WHERE id=?";
$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "isi", $class_id, $date, $id);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode(["message" => "Attendance updated"]);
} else {
    echo json_encode(["message" => "Error: " . mysqli_error($con)]);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>