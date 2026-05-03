<?php
include 'connect.php';
header('Content-Type: application/json');

$id = $_POST['id'] ?? null;
$name  = $_POST['name'] ?? null;
$created_at = $_POST['created_at'] ?? null;

if (!$id) {
    echo json_encode(["message" => "ID is required"]);
    exit;
}

$sql = "UPDATE diya_classes SET name=?, created_at=? WHERE id=?";
$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "ssi", $name, $created_at, $id);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode(["message" => "Record updated"]);
} else {
    echo json_encode(["message" => "Error: " . mysqli_error($con)]);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>