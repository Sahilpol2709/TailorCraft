<?php
session_start();
require 'razorpay-php/Razorpay.php'; 
use Razorpay\Api\Api;


$order_id = isset($_POST['order_id']) ? (int)$_POST['order_id'] : 0;
if ($order_id == 0) {
    die("Error: Invalid order ID!");
}

$conn = new mysqli('localhost', 'root', '', 'tailor_management_system');
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$order_query = $conn->prepare("SELECT category_id, full_name, email, contact_no FROM orders WHERE order_id = ?");
$order_query->bind_param("i", $order_id);
$order_query->execute();
$order_result = $order_query->get_result();

if ($order_result->num_rows > 0) {
    $order = $order_result->fetch_assoc();
    $category_id = (int)$order['category_id'];
    
    $category_query = $conn->prepare("SELECT category_name, price_range FROM prices WHERE category_id = ?");
    $category_query->bind_param("i", $category_id);
    $category_query->execute();
    $category_result = $category_query->get_result();

    if ($category_result->num_rows > 0) {
        $category = $category_result->fetch_assoc();
        $category_name = htmlspecialchars($category['category_name']);
        $price_range = (float)$category['price_range'];
    } else {
        die("Error: Category not found in prices table!");
    }
} else {
    die("Error: Order not found!");
}

$amount_in_paisa = max($price_range * 100, 100);

$key_id = "YOUR_RAZORPAY_KEY_ID";
$key_secret = "YOUR_RAZORPAY_SECRET";
$api = new Api($key_id, $key_secret);

$razorpayOrder = $api->order->create([
    'receipt' => "Order_" . $order_id,
    'amount' => $amount_in_paisa,
    'currency' => 'INR',
    'payment_capture' => 1
]);

$_SESSION['razorpay_order_id'] = $razorpayOrder['id'];
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <link rel="stylesheet" href="completes.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<header>
    <div class="container">
        <img src="Logo.png" alt="TailorCraft Logo" class="logo">
        <nav>
            <ul>
                <li><a href="Homepage.php" class="nav-link"><img src="Home.png" class="nav-logo"><br><span class="nav-name">Home</span></a></li>
                <li><a href="about.php" class="nav-link"><img src="about.png" class="nav-logo"><br><span class="nav-name">About</span></a></li>
                <li><a href="service.php" class="nav-link"><img src="services.png" class="nav-logo"><br><span class="nav-name">Services</span></a></li>
                <li><a href="login.php" class="nav-link"><img src="login.png" class="nav-logo"><br><span class="nav-name">Login</span></a></li>
                <li><a href="logout.php" class="nav-link"><img src="logout.png" class="nav-logo"><br><span class="nav-name">Logout</span></a></li>
            </ul>
        </nav>
    </div>
</header>

<h1>Confirm Your Payment</h1>
<div class="order-details">
    <p><strong>Order ID:</strong> <?php echo htmlspecialchars($order_id); ?></p>
    <p><strong>Category:</strong> <?php echo $category_name; ?></p>
    <p><strong>Customer Name:</strong> <?php echo htmlspecialchars($order['full_name']); ?></p>
    <p><strong>Email:</strong> <?php echo htmlspecialchars($order['email']); ?></p>
    <p><strong>Contact Number:</strong> <?php echo htmlspecialchars($order['contact_no']); ?></p>
    <p><strong>Price:</strong> Rs.<?php echo number_format($price_range, 2); ?></p>
</div>
<div class="submit-button">
    <button type="button" id="payNowButton"> Pay Now </button>
</div>

<footer>
    <div class="social-links">
        <ul>
            <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
            <li><a href="https://x.com/"><i class="fab fa-twitter"></i></a></li>
            <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
            <li><a href="https://in.linkedin.com/"><i class="fab fa-linkedin-in"></i></a></li>
        </ul>
    </div>
    <p>&copy; 2025 TailorCraft. All Rights Reserved.</p>
</footer>

<script>
document.getElementById('payNowButton').addEventListener('click', function() {
    var options = {
        "key": "<?php echo $key_id; ?>",
        "amount": <?php echo $amount_in_paisa; ?>,
        "currency": "INR",
        "name": "TailorCraft",
        "description": "Order Payment",
        "order_id": "<?php echo $_SESSION['razorpay_order_id']; ?>",
        "handler": function (response) {
            window.location.href = "payment_success.php?order_id=<?php echo $order_id; ?>&razorpay_payment_id=" + response.razorpay_payment_id ;
        },
        "theme": {
            "color": "#3399cc"
        }
    };
    var rzp1 = new Razorpay(options);
    rzp1.open();
})
</script>
</body>
</html>
