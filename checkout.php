<?php
session_start();

$order_id = isset($_GET['order_id']) ? (int)$_GET['order_id'] : 0;

if ($order_id == 0) {
    echo "Invalid order ID!";
    exit;
}

$order_details = isset($_SESSION['order_details']) ? $_SESSION['order_details'] : null;

if (!$order_details) {
    echo "Order details not found!";
    exit;
}

$conn = new mysqli('localhost', 'root', '', 'tailor_management_system');
$order_result = $conn->query("SELECT * FROM orders WHERE order_id = $order_id");

if ($order_result->num_rows > 0) {
    $order = $order_result->fetch_assoc();
} else {
    echo "Order not found!";
    exit;
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <link rel="stylesheet" href="check.css">
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

    <h2>Details for Order <?php echo htmlspecialchars($order_details['category_name']); ?></h2>

    <div class="order-details">
        <p><strong>Category:</strong> <?php echo htmlspecialchars($order_details['category_name']); ?></p>
        <p><strong>Customer Name:</strong> <?php echo htmlspecialchars($order['full_name']); ?></p>
        <p><strong>Email:</strong> <?php echo htmlspecialchars($order['email']); ?></p>
        <p><strong>Contact Number:</strong> <?php echo htmlspecialchars($order['contact_no']); ?></p>
        <p><strong>Bust:</strong> <?php echo htmlspecialchars($order['bust']); ?> "</p>
        <p><strong>Waist:</strong> <?php echo htmlspecialchars($order['waist']); ?> "</p>
        <p><strong>Shoulder:</strong> <?php echo htmlspecialchars($order['shoulder']); ?> "</p>
        <p><strong>Sleeve Length:</strong> <?php echo htmlspecialchars($order['sleeve_length']); ?> "</p>
        <p><strong>Blouse Length:</strong> <?php echo htmlspecialchars($order['blouse_length']); ?> "</p>
        <p><strong>Manual Measurements:</strong> <?php echo $order['manual_measurements'] ? 'Yes' : 'No'; ?></p>
        <p><strong>Price Range:</strong><?php echo htmlspecialchars($order_details['price_range']); ?></p>
    </div>

    <form action="payment_completed.php" method="POST">
        <input type="hidden" name="order_id" value="<?php echo $order['order_id']; ?>">
        <button type="submit">Process Payment</button>
    </form>
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
    document.addEventListener('DOMContentLoaded', function () {
        const formElement = document.querySelector('form');
        if (formElement) {
            formElement.scrollIntoView({ behavior: 'smooth' });
        }
    });
    document.querySelector('form').addEventListener('submit', function (e) {
        const confirmation = confirm('Are you sure you want to process the payment?');
        if (!confirmation) {
            e.preventDefault(); 
            }
        });
        </script>
</body>
</html>
