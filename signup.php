<?php
include('db_connection.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['signupUsername']) && isset($_POST['signupPassword']) && isset($_POST['signupEmail'])) {
        $signupUsername = $_POST['signupUsername'];
        $signupPassword = password_hash($_POST['signupPassword'], PASSWORD_DEFAULT); 
        $signupEmail = $_POST['signupEmail'];

        $signupQuery = "INSERT INTO users (username, password, email) VALUES ('$signupUsername', '$signupPassword', '$signupEmail')";
        if (mysqli_query($conn, $signupQuery)) {
            header('Location: login.php'); 
            exit();
        } else {
            $signupError = "Error in sign-up: " . mysqli_error($conn);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TailorCraft - Sign Up</title>
    <link rel="stylesheet" href="Loginpage.css">
</head>
<body>
    <div class="container">
        <h1 class="project-name">TailorCraft</h1>

        <div class="form-container">
            <h2>Sign Up</h2>
            <form method="POST" action="signup.php">
                <input type="text" name="signupUsername" placeholder="Create Username" required>
                <input type="password" name="signupPassword" placeholder="Create Password" required>
                <input type="email" name="signupEmail" placeholder="Enter Your Email" required>
                <button type="submit">Sign Up</button>
                <button type="button" onclick="window.location.href='login.php';">Back To Login</button>
                <p id="signupErrorMessage" class="error-message"><?php echo isset($signupError) ? $signupError : ''; ?></p>

                <div class="signup-link">
                    <p>Already have an account? <a href="login.php">Login</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
