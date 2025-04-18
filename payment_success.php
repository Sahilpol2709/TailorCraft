<?php
session_start();

$conn = new mysqli("localhost", "root", "", "tailor_management_system");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$order_id = isset($_GET['order_id']) ? (int)$_GET['order_id'] : 0;
$razorpay_payment_id = isset($_GET['razorpay_payment_id']) ? $_GET['razorpay_payment_id'] : '';

if ($order_id === 0 || empty($razorpay_payment_id)) {
    die("Invalid request! Missing order_id or razorpay_payment_id.");
}

$order_query = $conn->query("SELECT * FROM orders WHERE order_id = $order_id");
if ($order_query->num_rows === 0) {
    die("Order not found!");
}

$order = $order_query->fetch_assoc();
$category_id = $order['category_id'];

$category_query = $conn->query("SELECT category_name, price_range FROM prices WHERE category_id = $category_id");
if ($category_query->num_rows === 0) {
    die("Category not found!");
}

$category = $category_query->fetch_assoc();

$category_name = $category['category_name'];
$price_range = $category['price_range'];
$customer_name = $order['full_name'];
$email = $order['email'];
$contact_no = $order['contact_no'];
$payment_status = $order['payment_status'];

$payment_status = 'Success'; 
$update_query = $conn->prepare("UPDATE orders SET razorpay_payment_id = ?, payment_status = ? WHERE order_id = ?");
$update_query->bind_param("ssi", $razorpay_payment_id, $payment_status, $order_id);
$update_query->execute();

if ($update_query->affected_rows > 0) {
    $payment_status_message = "Payment successful! Your order has been placed.";
} else {
    $payment_status_message = "Error in updating payment status.";
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <link rel="stylesheet" href="success.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<header>
    <div class="container">
        <img src="Logo.png" alt="TailorCraft Logo" class="logo">
        <nav>
                <ul>
                    <li>
                        <a href="Homepage.php" class="nav-link">
                            <img src="Home.png" alt="Home Logo" class="nav-logo">
                            <br>
                            <span class="nav-name">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="about.php" class="nav-link">
                            <img src="about.png" alt="About Logo" class="nav-logo">
                            <br>
                            <span class="nav-name">About</span>
                        </a>
                    </li>
                    <li>
                        <a href="service.php" class="nav-link">
                            <img src="services.png" alt="Services Logo" class="nav-logo">
                            <br>
                            <span class="nav-name">Services</span>
                        </a>
                    </li>
                    <li>
                        <a href="login.php" class="nav-link">
                            <img src="login.png" alt="Login Logo" class="nav-logo">
                            <br>
                            <span class="nav-name">Login</span>
                        </a>
                    </li>
                    <li>
                        <a href="logout.php" class="nav-link">
                            <img src="logout.png" alt="Admin Logo" class="nav-logo">
                            <br>
                            <span class="nav-name">Logout</span>
                        </a>
                    </li>
                </ul>
            </nav>
    </div>
</header>

<h1>Payment Confirmation</h1>
<div class="order-details">
    <p><strong>Order ID:</strong> <?php echo htmlspecialchars($order_id); ?></p>
    <p><strong>Payment ID:</strong><?php echo htmlspecialchars($razorpay_payment_id);?></p>
    <p><strong>Category:</strong> <?php echo $category_name; ?></p>
    <p><strong>Customer Name:</strong> <?php echo htmlspecialchars($customer_name); ?></p>
    <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
    <p><strong>Contact Number:</strong> <?php echo htmlspecialchars($contact_no); ?></p>
    <p><strong>Price:</strong> Rs.<?php echo number_format($price_range, 2); ?></p>
    <p><strong>Payment Status:</strong> <?php echo htmlspecialchars($payment_status); ?></p>
</div>

<div class="download-pdf-container">
    <div class="download-pdf">
        <button onclick="window.location.href='generate_pdf.php?order_id=<?php echo $order['order_id']; ?>&category_name=<?php echo urlencode($category_name); ?>'">Download PDF Receipt</button>
    </div>
</div>

<div class="Home-container">
    <div class="Home">
        <button type="button" onclick="window.location.href='logout.php';">Back To Home Page</button>
    </div>
</div>

<div class="popup" id="popupMessage">
    <p><?php echo $payment_status_message; ?></p>
    <p><strong>Shop Address:</strong></p>
    <p>Shop no.30, Shiva Samarth Apartment, Diva(East), Thane-400612</p>
</div>

<script>
    window.onload = function() {
        const popup = document.getElementById('popupMessage');
        popup.classList.add('show');
        
        setTimeout(function() {
            popup.classList.remove('show');
        }, 5000);
    };
</script>

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

</body>
</html>
