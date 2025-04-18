<?php
include('db_connection.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['forgotPasswordEmail'])) {
        $forgotPasswordEmail = $_POST['forgotPasswordEmail'];

        $query = "SELECT * FROM users WHERE email = '$forgotPasswordEmail' LIMIT 1";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $forgotPasswordMessage = "Password reset email sent.";
        } else {
            $forgotPasswordError = "No user found with that email address.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TailorCraft - Forgot Password</title>
    <link rel="stylesheet" href="Loginpage.css">
</head>
<body>
    <div class="container">
        <h1 class="project-name">TailorCraft</h1>

        <div class="form-container">
            <h2>Forgot Password</h2>
            <form method="POST" action="forgot_password.php">
                <input type="email" name="forgotPasswordEmail" placeholder="Enter your email" required>
                <button type="submit">Submit</button>
                <button type="button" onclick="window.location.href='login.php';">Back To Login</button>
            </form>
            <p class="error-message"><?php echo isset($forgotPasswordMessage) ? $forgotPasswordMessage : ''; ?></p>
            <p class="error-message"><?php echo isset($forgotPasswordError) ? $forgotPasswordError : ''; ?></p>

            <div class="signup-link">
            </div>
        </div>
    </div>
</body>
</html>