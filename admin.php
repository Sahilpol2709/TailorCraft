<?php
session_start();

$admin_username = "admin";
$admin_password = "admin123";  

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username === $admin_username && $password === $admin_password) {
        $_SESSION['admin_logged_in'] = true;  
        header("Location: admin_dashboard.php"); 
        exit;
    } else {
        $error_message = "Invalid username or password!";  
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="adminn.css"> 
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const inputs = document.querySelectorAll('input[name="username"], input[name="password"]');
            const errorMessage = document.getElementById('error-message');

            inputs.forEach(input => {
                input.addEventListener('focus', () => {
                    if (errorMessage) {
                        errorMessage.style.display = 'none'; 
                    }
                });
            });
        });
    </script>
</head>
<body>
    <div class="login-container">
        <div class="admin-box">
            <h2>Admin Login</h2>
            <?php if (isset($error_message)) { echo "<p id='error-message' style='color: red;'>$error_message</p>"; } ?>
            <form method="POST" action="">
                <label for="username">Username:</label>
                <input type="text" name="username" required>

                <label for="password">Password:</label>
                <input type="password" name="password" required>

                <button type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
