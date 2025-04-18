<?php
include('db_connection.php');

$category_id = isset($_GET['category_id']) ? (int)$_GET['category_id'] : 0;

$query = "SELECT * FROM blouse_categories WHERE category_id = $category_id";
$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query failed: " . mysqli_error($conn));
}

$related_images_query = "SELECT image_path FROM related_images WHERE category_id = $category_id";
$related_images_result = mysqli_query($conn, $related_images_query);

$related_images = [];
if ($related_images_result) {
    while ($related_image = mysqli_fetch_assoc($related_images_result)) {
        $related_images[] = $related_image['image_path'];
    }
}

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
} else {
    echo "Blouse not found.";
    exit;
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tailor Management System</title>
    <link rel="stylesheet" href="Details1.css"> 
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
    <section id="prodetails1" class="blouse-info">
    <div class="blouse-details-container">
        <div class="product-image">
            <img src="assets/images/<?php echo $row['image']; ?>" alt="<?php echo $row['category_name']; ?>" id="MainImg" width="100%" />
            
            <div class="small-img-group">
                <?php foreach ($related_images as $image): ?>
                    <div class="small-img-col">
                        <img src="assets/images/<?php echo $image; ?>" class="small-img" width="100%" alt="Related Image">
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        
        <div class="product-info">
            <h2><?php echo $row['category_name'];?></h2>
            <h4>Price Range: <?php echo $row['price_range']; ?></h4>
            <p><strong>Material:</strong> <?php echo $row['material']; ?></p>
            <p><strong>Completion Time:</strong> <?php echo $row['completion_days']; ?></p>
            <p><strong>Product Details: </strong><?php echo $row['Product_Details'];?></p>
            <br>
            <button><a href="place_order.php?category_id=<?php echo $row['category_id']; ?>" class="place-order-btn">Place Order</a></button>
        </div>
    </div>
</section>

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
        document.addEventListener("DOMContentLoaded", function() {
    const smallImages = document.querySelectorAll('.small-img');

    const mainImage = document.getElementById('MainImg');

    smallImages.forEach(function(img) {
        img.addEventListener('click', function() {
            mainImage.src = this.src;  
        });
    });
});
</script>
</body>
</html>
