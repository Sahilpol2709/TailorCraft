<?php
session_start();

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: admin_login.php");
    exit;
}

$order_id = isset($_GET['order_id']) ? (int)$_GET['order_id'] : 0;
if ($order_id == 0) {
    die('Order ID is required');
}

$conn = new mysqli('localhost', 'root', '', 'tailor_management_system');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "DELETE FROM orders WHERE order_id = $order_id";
if ($conn->query($sql) === TRUE) {
    echo "Order deleted successfully!";
} else {
    echo "Error deleting order: " . $conn->error;
}

header('Location: admin_dashboard.php');
exit;
?>
