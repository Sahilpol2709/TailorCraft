<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About TailorCraft</title>
    <link rel="stylesheet" href="About.css"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> 
</head>
<body>
    <div id="preloader"></div>
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
                        <a href="admin.php" class="nav-link <?php echo ($_SERVER['PHP_SELF'] == '/admin.php' ? 'active' : ''); ?>">
                            <img src="admin.png" alt="Admin Logo" class="nav-logo">
                            <br>
                            <span class="nav-name">Admin</span>
                        </a>
                    </li>
                </ul>
            </nav>            
        </div>
    </header>

    <section id="about" class="about">
            <div class="container">
                <h2>About TailorCraft</h2>
                <div class="about-content">
                    <img src="img.jpg" alt="About TailorCraft" class="about-image">
                    <p>TailorCraft is a specialized, independent tailoring service dedicated exclusively to crafting an exceptional variety of blouses for women. We focus on delivering high-quality, custom-made blouses that are tailored to your individual style and fit, all designed to keep up with the latest trends. At TailorCraft, we understand the importance of having the perfect blouse for any occasion — be it for daily wear, a special event, or a stylish addition to your wardrobe. We offer a broad range of blouse designs, from classic styles to the latest trendy cuts, ensuring every woman can find the perfect fit that enhances her personality.</p>
            </div>
            </div>
        </section>
    <section id="choose" class="choose">
        <div class="container">
        <h3>Why Choose TailorCraft?</h3>
        <ul>
            <li><strong>Exclusively for Ladies' Blouses:</strong> TailorCraft specializes in creating custom blouses for women, offering a wide variety of designs to suit every taste.</li>
            <li><strong>Latest Trending Styles:</strong> Stay ahead of fashion trends with modern and stylish blouse designs, tailored to fit your unique look.</li>
            <li><strong>Personalized Tailoring:</strong> Get the perfect fit with custom tailoring, created to your specific measurements for maximum comfort and style.</li>
            <li><strong>Quality & Precision:</strong> Our expert tailors ensure every blouse meets the highest standards of craftsmanship and quality.</li>
            <li><strong>Order from Our Website:</strong> Place your order easily online through our official website. Explore the variety of blouse designs and select your style.</li>
        </ul>
        </div>
    </section>
    <section id="collect" class="collect">
    <div class="container">
        <h3>Our Collection</h3>
        <div class="image-gallery">
            <div class="image-item">
                <img src="About.jpg" alt="Collection" class="small-img">
            </div>
            <div class="image-item">
                <img src="About1.png" alt="Collection" class="small-img">
            </div>
            <div class="image-item">
                <img src="About2.jpg" alt="Collection" class="small-img">
            </div>
            <div class="image-item">
                <img src="About3.png" alt="Collection" class="small-img">
            </div>
        </div>
        <p>From elegant evening blouses to trendy everyday styles, TailorCraft offers a wide range of options for every occasion. Whether you need a sophisticated blouse for a special event or a chic top for casual wear, we have the perfect fit for you.</p>
        <h3>Place Your Order Today</h3>
        <p>Ready to get started? Visit the <a href="http://localhost/tailor/Homepage.php" class="cta-link">TailorCraft website</a> to explore our wide range of blouse styles and place your custom order today. TailorCraft is here to bring your vision to life, one stitch at a time.</p>
    </div>
</section>

    <section class="shop-info">
        <h2>Visit Us</h2>
        <p><strong>Shop Address:</strong> Shop no.30, Shiva Samarth Apartment, Diva(East), Thane-400612</p>
        <p><strong>Shop Contact No.:</strong> +91 9833364089</p>
    </section>

    <!-- Footer -->
    <footer>
    <div class="social-links">
            <ul>
                <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                <li><a href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
                <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
                <li><a href="https://www.linkedin.com/"><i class="fab fa-linkedin-in"></i></a></li>
            </ul>
        </div>
        <p>&copy; 2025 TailorCraft. All Rights Reserved.</p>
    </footer>
</body>
</html>
