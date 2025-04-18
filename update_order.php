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
    SELECT o.*, c.category_name, c.price_range
    FROM orders o
    LEFT JOIN blouse_categories c ON o.category_id = c.category_id
    WHERE o.order_id = $order_id
";
$result = $conn->query($sql);
$order = $result->fetch_assoc();

if (!$order) {
    die("Order not found.");
}

$category_result = $conn->query("SELECT * FROM blouse_categories");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $category_id = $_POST['category_id'];
    $bust = $_POST['bust'];
    $waist = $_POST['waist'];
    $shoulder = $_POST['shoulder'];
    $sleeve_length = $_POST['sleeve_length'];
    $blouse_length = $_POST['blouse_length'];
    $price_range = $_POST['price_range'];
    $payment_status = $_POST['payment_status'];

    $full_name = $_POST['full_name'];
    if (!preg_match("/^[a-zA-Z\s]*$/", $full_name)) {
        die("Full Name must contain only letters and spaces.");
    }

    $contact_no = $_POST['contact_no'];
    if (!preg_match("/^[0-9]{10}$/", $contact_no)) {
        die("Contact Number must be a 10-digit number.");
    }

    $email = $_POST['email'];

    $update_sql = "
        UPDATE orders
        SET category_id = '$category_id', bust = '$bust', waist = '$waist', shoulder = '$shoulder',
            sleeve_length = '$sleeve_length', blouse_length = '$blouse_length', full_name = '$full_name', email = '$email', contact_no = '$contact_no', payment_status = '$payment_status'
        WHERE order_id = $order_id
    ";
    $conn->query($update_sql);

    echo "Order updated successfully!";
    header('Location: admin_dashboard.php');
    exit;
}

if (isset($_GET['get_price_range']) && $_GET['get_price_range'] == '1') {
    $category_id = $_GET['category_id'];
    $price_range_sql = "SELECT price_range FROM blouse_categories WHERE category_id = $category_id";
    $price_range_result = $conn->query($price_range_sql);
    if ($price_range_result->num_rows > 0) {
        $category = $price_range_result->fetch_assoc();
        echo $category['price_range']; 
    } else {
        echo '';  
    }
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="update.css">
</head>
<body>
<header class="header-container">
    <img src="Logo.png" alt="TailorCraft Logo" class="logo">
    <h1>Update Customer Details</h1>
</header>
<form method="POST">
    <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
    <label>Full Name</label><input type="text" name="full_name" value="<?php echo $order['full_name']; ?>" id="full_name"><br>
    <label>Email</label><input type="email" name="email" value="<?php echo $order['email']; ?>"><br>
    <label>Contact No</label><input type="text" name="contact_no" value="<?php echo $order['contact_no']; ?>" id="contact_no"><br>
    
    <label>Category</label>
    <select name="category_id" id="category_id" onchange="updatePriceRange()">
        <?php
        while ($category = $category_result->fetch_assoc()) {
            $selected = $category['category_id'] == $order['category_id'] ? 'selected' : '';
            echo "<option value='" . $category['category_id'] . "' $selected>" . $category['category_name'] . "</option>";
        }
        ?>
    </select><br>

    <label>Bust</label><input type="text" name="bust" value="<?php echo $order['bust']; ?>"><br>
    <label>Waist</label><input type="text" name="waist" value="<?php echo $order['waist']; ?>"><br>
    <label>Shoulder</label><input type="text" name="shoulder" value="<?php echo $order['shoulder']; ?>"><br>
    <label>Sleeve Length</label><input type="text" name="sleeve_length" value="<?php echo $order['sleeve_length']; ?>"><br>
    <label>Blouse Length</label><input type="text" name="blouse_length" value="<?php echo $order['blouse_length']; ?>"><br>
    <label>Price Range</label><input type="text" name="price_range" id="price_range" value="<?php echo $order['price_range']; ?>" readonly><br>
    
    <label>Payment Status</label>
    <select name="payment_status">
        <option value="Success" <?php echo $order['payment_status'] == 'Success' ? 'selected' : ''; ?>>Success</option>
        <option value="Pending" <?php echo $order['payment_status'] == 'Pending' ? 'selected' : ''; ?>>Pending</option>
    </select><br>

    <button type="submit">Update Order</button>
    <a href="admin_dashboard.php">
        <button type="button">Back to Dashboard</button>
    </a>
</form>

<script>
function updatePriceRange() {
    var categoryId = document.getElementById('category_id').value;
    var orderId = document.querySelector('input[name="order_id"]').value; 

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "update_order.php?category_id=" + categoryId + "&order_id=" + orderId + "&get_price_range=1", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var priceRange = xhr.responseText.trim();  
            document.getElementById('price_range').value = priceRange;  
        }
    };
    xhr.send();
}

document.querySelector('form').addEventListener('submit', function(event) {
    const fullName = document.getElementById('full_name').value;
    const contactNo = document.getElementById('contact_no').value;

    const nameRegex = /^[a-zA-Z\s]*$/;
    if (!nameRegex.test(fullName)) {
        alert('Full Name must contain only letters and spaces.');
        event.preventDefault(); 
        return;
    }

    const contactNoRegex = /^[0-9]{10}$/;
    if (!contactNoRegex.test(contactNo)) {
        alert('Contact Number must be a 10-digit number.');
        event.preventDefault();
        return;
    }
});
</script>
</body>
</html>
