<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="view.css">
</head>
<body>
<header class="header-container">
    <img src="Logo.png" alt="TailorCraft Logo" class="logo">
    <h1>View Order Details</h1>
</header>
<?php
session_start();

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: admin.php");  
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

$sql = "
    SELECT o.*, c.category_name, pr.price_range
    FROM orders o
    LEFT JOIN blouse_categories c ON o.category_id = c.category_id
    LEFT JOIN prices pr ON c.category_id = pr.category_id
    WHERE o.order_id = $order_id
";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $order = $result->fetch_assoc();
} else {
    die("Order not found.");
}

$conn->close();
?>

<div class="table-container">
    <table>
        <tr><td>Order ID</td><td><?php echo $order['order_id']; ?></td></tr>
        <tr><td>Payment ID</td><td><?php echo $order['razorpay_payment_id']; ?></td></tr>
        <tr><td>Category Name</td><td><?php echo $order['category_name']; ?></td></tr>
        <tr><td>Full Name</td><td><?php echo $order['full_name']; ?></td></tr>
        <tr><td>Email</td><td><?php echo $order['email']; ?></td></tr>
        <tr><td>Contact No</td><td><?php echo $order['contact_no']; ?></td></tr>
        <tr><td>Bust</td><td><?php echo $order['bust']; ?></td></tr>
        <tr><td>Waist</td><td><?php echo $order['waist']; ?></td></tr>
        <tr><td>Shoulder</td><td><?php echo $order['shoulder']; ?></td></tr>
        <tr><td>Sleeve Length</td><td><?php echo $order['sleeve_length']; ?></td></tr>
        <tr><td>Blouse Length</td><td><?php echo $order['blouse_length']; ?></td></tr>
        <tr><td>Manual Measurements</td><td><?php echo $order['manual_measurements'] ? 'Yes' : 'No'; ?></td></tr>
        <tr><td>Price Range</td><td><?php echo $order['price_range']; ?></td></tr>
        <tr><td>Payment Status</td><td><?php echo $order['payment_status']; ?></td></tr>
    </table>
</div>
<div class="action-buttons">
    <a href="admin_dashboard.php">
        <button type="button">Back to Dashboard</button>
    </a>
</div>
</body>
</html>
