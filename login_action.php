// login_action.php
<?php
session_start();
include('db_connection.php');

$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];

$query = "SELECT * FROM users WHERE username='$username' AND password='$password' AND email='$email'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    $_SESSION['username'] = $username;
    header('Location: categories.php');
} else {
    echo "Invalid login credentials";
}
?>