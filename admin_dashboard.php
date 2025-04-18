<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Admin_DashBoard.css">
</head>
<div>
<header class="header-container">
    <img src="Logo.png" alt="TailorCraft Logo" class="logo">
    <h1>Admin Dashboard</h1>
</header>
<?php
session_start();

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: admin.php");  
    exit;
}

$conn = new mysqli('localhost', 'root', '', 'tailor_management_system');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "
    SELECT 
        o.order_id, o.category_id, c.category_name, o.full_name, o.email, o.contact_no,
        c.price_range, o.payment_method, o.payment_status
    FROM orders o
    LEFT JOIN payments p ON o.order_id = p.order_id
    LEFT JOIN blouse_categories c ON o.category_id = c.category_id
    GROUP BY o.order_id
";

$result = $conn->query($sql);

if (!$result) {
    die("Error in SQL query: " . $conn->error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $selected_order_id = isset($_POST['order_id']) ? $_POST['order_id'] : '';
    $action = isset($_POST['action']) ? $_POST['action'] : '';

    if ($selected_order_id) {
        switch ($action) {
            case 'view':
                header("Location: view_order.php?order_id=$selected_order_id");
                exit;
            case 'update':
                header("Location: update_order.php?order_id=$selected_order_id");
                exit;
            case 'delete':
                header("Location: delete_order.php?order_id=$selected_order_id");
                exit;
            default:
                echo "Invalid action!";
                exit;
        }
    } else {
        echo "Please select an order.";
    }
}

if ($result->num_rows > 0) {
    echo '<form method="POST" action="">'; 

    echo '<table class="order-table">
            <tr>
                <th>Select</th>
                <th>Order ID</th>
                <th>Category Name</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Contact No</th>
                <th>Price Range</th>
                <th>Payment Status</th>
            </tr>';

    while ($row = $result->fetch_assoc()) {
        echo '<tr>';
        
        echo '<td><input type="radio" name="order_id" value="' . $row['order_id'] . '" required></td>';

        echo '<td>' . $row['order_id'] . '</td>';
        echo '<td>' . $row['category_name'] . '</td>';
        echo '<td>' . $row['full_name'] . '</td>';
        echo '<td>' . $row['email'] . '</td>';
        echo '<td>' . $row['contact_no'] . '</td>';
        echo '<td>' . ($row['price_range'] ? $row['price_range'] : 'Not Available') . '</td>';
        echo '<td>' . $row['payment_status'] . '</td>';

        echo '</tr>';
    }

    echo '</table>';

    echo '<div class="action-buttons">
            <button type="submit" name="action" value="view">View</button>
            <button type="submit" name="action" value="update">Update</button>
            <button type="submit" name="action" value="delete" onclick="return confirm(\'Are you sure you want to delete this order?\')">Delete</button>
          </div>';

    echo '</form>'; 
} else {
    echo "No orders found.";
}

$conn->close();
?>

<!-- Logout Button -->
<div class="log-button">
<form method="POST" action="logout.php">
    <button type="submit" class="logout-btn">Logout</button>
</form>
</div>

</body>
</html>
