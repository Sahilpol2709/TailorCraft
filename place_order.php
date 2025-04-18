<?php
session_start();

include('db_connection.php');

$category_id = isset($_GET['category_id']) ? (int)$_GET['category_id'] : 0;

$query = "SELECT * FROM blouse_categories WHERE category_id = $category_id";
$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query failed: " . mysqli_error($conn));
}

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
} else {
    echo "Blouse not found.";
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $full_name = mysqli_real_escape_string($conn, $_POST['full_name']);
    $contact_no = mysqli_real_escape_string($conn, $_POST['contact_no']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $bust = mysqli_real_escape_string($conn, $_POST['bust']);
    $waist = mysqli_real_escape_string($conn, $_POST['waist']);
    $shoulder = mysqli_real_escape_string($conn, $_POST['shoulder']);
    $sleeve_length = mysqli_real_escape_string($conn, $_POST['sleeve_length']);
    $blouse_length = mysqli_real_escape_string($conn, $_POST['blouse_length']);
    $manual_measurements = isset($_POST['manual_measurements']) ? 1 : 0;

    $insert_query = "INSERT INTO orders (category_id, full_name, contact_no, email, bust, waist, shoulder, sleeve_length, blouse_length, manual_measurements, price_range) 
                     VALUES ('$category_id', '$full_name', '$contact_no', '$email', '$bust', '$waist', '$shoulder', '$sleeve_length', '$blouse_length', '$manual_measurements', '$price_range')";

    if (mysqli_query($conn, $insert_query)) {
        $order_id = mysqli_insert_id($conn);

        $_SESSION['order_details'] = [
            'category_name' => $row['category_name'], 
            'price_range' => $row['price_range'], 
            'order_id' => $order_id 
        ];

        header("Location: checkout.php?order_id=" . $order_id); 
        exit;
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <link rel="stylesheet" href="orderr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
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
<div class="order-form-container">
        <h2>Enter Your Details</h2>

        <form method="POST" action="place_order.php?category_id=<?php echo $category_id; ?>" onsubmit="return validateForm()">
            <div class="user-details">
                <label for="category_name" style="color:black; font-weight: bold; font-size: 25px; text-decoration: underline;"><?php echo $row['category_name']; ?></label>
                <br>
                <br>
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" required><br>

                <label for="contact_no">Contact Number:</label>
                <input type="text" id="contact_no" name="contact_no" required><br>

                <label for="email">Email ID:</label>
                <input type="email" id="email" name="email" required><br>
            </div>

            <h3>Measurements (In Inches):</h3>
            <div class="measurements">
                <label for="bust">Bust:</label>
                <input type="text" id="bust" name="bust"><br>

                <label for="waist">Waist:</label>
                <input type="text" id="waist" name="waist"><br>

                <label for="shoulder">Shoulder:</label>
                <input type="text" id="shoulder" name="shoulder"><br>

                <label for="sleeve_length">Sleeve Length:</label>
                <input type="text" id="sleeve_length" name="sleeve_length"><br>

                <label for="blouse_length">Blouse Length:</label>
                <input type="text" id="blouse_length" name="blouse_length">
                <br>
                <label for="price_range" style="font-weight: bold; font-size: 20px;">Price Range: <?php echo $row['price_range']; ?></label>
            </div>

            <div class="manual-measurements">
                <label for="manual_measurements">Do you want to provide measurements manually? (Visit Tailor Shop)</label>
                <input type="checkbox" id="manual_measurements" name="manual_measurements">
                <br>
                <p>If you check this box, you can visit the tailor shop for measurements:</p>
                <p>Shop Address: <strong>Shop no.30, Shiva Samarth Apartment, Diva(East), Thane-400612</strong></p>
            </div>

            <div class="submit-button">
                <button type="submit">Confirm Order</button>
                </div>
        </form>
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
    document.addEventListener("DOMContentLoaded", function () {
    const contactInput = document.getElementById("contact_no");
    const fullNameInput = document.getElementById("full_name");
    const manualMeasurements = document.getElementById("manual_measurements");
    const measurementInputs = document.querySelectorAll(".measurements input");
    const form = document.querySelector("form");

    function toggleMeasurementFields() {
        if (manualMeasurements.checked) {
            measurementInputs.forEach(input => {
                input.disabled = true;
                input.style.backgroundColor = "#e0e0e0"; 
            });
        } else {
            measurementInputs.forEach(input => {
                input.disabled = false;
                input.style.backgroundColor = ""; 
            });
        }
    }

    manualMeasurements.addEventListener("change", toggleMeasurementFields);

    toggleMeasurementFields();

    contactInput.addEventListener("input", function () {
        this.value = this.value.replace(/[^0-9]/g, ''); 
        if (this.value.length > 10) {
            alert("Contact Number cannot exceed 10 digits!");
            this.value = this.value.slice(0, 10);
        }
    });

    contactInput.addEventListener("blur", function () {
        if (this.value.length !== 10) {
            alert("Contact Number must be exactly 10 digits.");
            this.style.border = "2px solid red";
        } else {
            this.style.border = "";
        }
    });

    fullNameInput.addEventListener("input", function () {
        if (!/^[a-zA-Z\s]*$/.test(this.value)) {
            alert("Full Name must contain only letters and spaces.");
            this.value = this.value.replace(/[^a-zA-Z\s]/g, '');
        }
    });

    measurementInputs.forEach(input => {
        input.addEventListener("input", function () {
            if (/[^0-9.]/.test(this.value)) {
                alert("Only numerical values are allowed for measurements.");
                this.value = this.value.replace(/[^0-9.]/g, '');
            }
        });
    });

    form.addEventListener("submit", function (event) {
        let valid = true;
        let contactValue = contactInput.value.trim();
        let fullNameValue = fullNameInput.value.trim();

        if (!/^[a-zA-Z\s]+$/.test(fullNameValue)) {
            alert("Full Name is invalid.");
            valid = false;
        }

        if (contactValue.length !== 10) {
            alert("Contact Number must be exactly 10 digits.");
            valid = false;
        }

        if (!manualMeasurements.checked) {
            measurementInputs.forEach(input => {
                if (input.value.trim() === "" || isNaN(input.value)) {
                    alert("All measurements must be filled with numeric values.");
                    valid = false;
                }
            });
        }

        if (!valid) {
            event.preventDefault(); 
        }
    });
});

</script>
</body>
</html>
