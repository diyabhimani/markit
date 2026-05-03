<?php
include 'connect.php';
header('Content-Type: application/json');

$id = $_POST['id'] ?? null;
$name  = $_POST['name'] ?? null;
$roll_no = $_POST['roll_no'] ?? null;
$class_id = $_POST['class_id'] ?? null;

if (!$id) {
    echo json_encode(["message" => "ID is reqsssuired"]);
    exit;
}

$sql = "UPDATE diya_students SET name=?, roll_no=?, class_id=? WHERE id=?";
$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "sdsi", $name, $roll_no, $class_id, $id);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode(["message" => "Product updated"]);
} else {
    echo json_encode(["message" => "Error: " . mysqli_error($con)]);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>