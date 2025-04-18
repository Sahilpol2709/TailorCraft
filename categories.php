<?php
session_start(); 
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {
    header("Location: login.php");
    exit(); 
}
include('db_connection.php');

$query = "SELECT * FROM blouse_categories"; 
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blouse Categories</title>
    <h1>Blouse Categories</h1>
    <link rel="stylesheet" href="categoriess.css">
</head>
<body>
    <div class="blouse-categories">

        <?php while($row = mysqli_fetch_assoc($result)): ?>
        <div class="blouse-category">
            <img src="assets/images/<?php echo $row['image']; ?>" alt="<?php echo $row['category_name']; ?>">
            <h3><?php echo $row['category_name']; ?></h3>
            <p>Price Range: <?php echo $row['price_range']; ?></p>
            <a href="blouse_details.php?category_id=<?php echo $row['category_id']; ?>">View More</a>
        </div>
        <?php endwhile; ?> 
    </div>
    <script src="category.js"></script>
</body>
</html>
