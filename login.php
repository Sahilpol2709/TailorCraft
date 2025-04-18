<?php
session_start();

include('db_connection.php');

if (isset($_SESSION['user_logged_in']) && $_SESSION['user_logged_in'] === true) {
    header("Location: categories.php");
    exit();
} 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['loginUsername']) && isset($_POST['loginPassword'])) {
        $loginUsername = mysqli_real_escape_string($conn, $_POST['loginUsername']);
        $loginPassword = $_POST['loginPassword'];

        $query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        $stmt = mysqli_prepare($conn, $query);
        mysqli_stmt_bind_param($stmt, 's', $loginUsername);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if (mysqli_num_rows($result) > 0) {
            $user = mysqli_fetch_assoc($result);
            
            if (Password_verify($loginPassword, $user['Password'])) {
                $_SESSION['user_logged_in'] = true;
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                
                header("Location: categories.php");
                exit();
            } else {
                $loginError = "Incorrect password!";
            }
        } else {
            $loginError = "Invalid username!";
        }
    }
}
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TailorCraft</title>
    <link rel="stylesheet" href="Loginpage.css">
</head>
<body>
    <div class="container">
        <h1 class="project-name">TailorCraft</h1>
        <div id="loginForm" class="form-container">
            <h2>Login</h2>
            <form method="POST" action="login.php">
                <input type="text" id="loginUsername" name="loginUsername" placeholder="Username" required>
                <input type="password" id="loginPassword" name="loginPassword" placeholder="Password" required>
                <button type="submit">Login</button>
                <p id="loginErrorMessage" class="error-message">
                    <?php echo isset($loginError) ? $loginError : ''; ?>
                </p>
                <div class="forgot-links">
                    <a href="http://localhost/Tailor/forgot_username.php" onclick="showForgotUsername()">Forgot Username?</a>
                    <a href="http://localhost/Tailor/forgot_password.php" onclick="showForgotPassword()">Forgot Password?</a>
                </div>
                <div class="signup-link">
                    <p>New User? <a href="http://localhost/Tailor/signup.php" onclick="toggleForm('signup')">Sign up</a></p>
                </div>
            </form>
        </div>
        <script>
        function toggleForm(formType) {
            if (formType === 'signup') {
                document.getElementById('loginForm').style.display = 'none';
                document.getElementById('signupForm').style.display = 'block';
            } else {
                document.getElementById('loginForm').style.display = 'block';
                document.getElementById('signupForm').style.display = 'none';
            }
        }

        function validateSignUp() {
            const username = document.getElementById('signupUsername').value;
            const password = document.getElementById('signupPassword').value;
            const email = document.getElementById('signupEmail').value;
            const errorMessage = document.getElementById('signupErrorMessage');
            
            if (username && password && email) {
                const userData = { username, password, email };
                localStorage.setItem('userData', JSON.stringify(userData));
                
                alert("Registration successful! You can now log in.");
                toggleForm('login');
                return false;
            } else {
                errorMessage.textContent = "Please fill in all fields!";
                return false;
            }
        }

        function validateLogin() {
            const username = document.getElementById('loginUsername').value;
            const password = document.getElementById('loginPassword').value;
            const errorMessage = document.getElementById('loginErrorMessage');

            const storedUserData = JSON.parse(localStorage.getItem('userData'));

            if (storedUserData) {
                if (username === storedUserData.username && password === storedUserData.password) {
                    alert("Login successful!");
                    window.location.href = "dashboard.html";
                } else {
                    errorMessage.textContent = "Invalid username or password!";
                }
            } else {
                errorMessage.textContent = "No user found. Please sign up first.";
            }

            return false;
        }

        function showForgotUsername() {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('forgotUsernameForm').style.display = 'block';
        }

        function showForgotPassword() {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('forgotPasswordForm').style.display = 'block';
        }
        
        function backToLogin() {
            document.getElementById('forgotUsernameForm').style.display = 'none';
            document.getElementById('forgotPasswordForm').style.display = 'none';
            document.getElementById('loginForm').style.display = 'block';
        }

        function handleForgotUsername() {
            const email = document.getElementById('forgotUsernameEmail').value;
            alert("A recovery email for username has been sent to: " + email);
            backToLogin();
            return false;
        }

        function handleForgotPassword() {
            const email = document.getElementById('forgotPasswordEmail').value;
            alert("A password reset email has been sent to: " + email);
            backToLogin();
            return false;
        }
    </script>
    </body>
</html>
