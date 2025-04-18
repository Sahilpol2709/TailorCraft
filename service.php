<?php

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About TailorCraft</title>
    <link rel="stylesheet" href="Service.css"> 
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

    <main>
        <section class="service-intro">
            <h2>Welcome To Our TailorCraft Service</h2>
            <p>At TailorCraft, we specialize in designing and tailoring the perfect blouses that complement your style and fit you flawlessly. Whether it's a classic, contemporary, or traditional design, we offer a wide range of blouse styles and customization options to match your taste.</p>
        </section>

        <section class="our-services">
            <div class="service-item">
                <img src="Silk_Blouse.jpg" alt="Silk Blouse" class="service-image">
                <div class="service-description">
                    <h3>Silk Blouses</h3>
                    <p>Luxurious silk blouses that add an elegant and refined touch to your wardrobe. Soft, smooth, and breathable, these blouses are perfect for formal events, office wear, and special occasions.</p>
                </div>
            </div>

            <div class="service-item">
                <img src="cotton_blouse.jpg" alt="Cotton Blouse" class="service-image">
                <div class="service-description">
                    <h3>Cotton Blouses</h3>
                    <p>Comfortable and breathable, cotton blouses are perfect for everyday wear. Available in a variety of colors and styles, these blouses are ideal for casual outings or even semi-formal gatherings.</p>
                </div>
            </div>

            <div class="service-item">
                <img src="embroidery_blouse.jpg" alt="Embroidered Blouse" class="service-image">
                <div class="service-description">
                    <h3>Embroidered Blouses</h3>
                    <p>Our custom-embroidered blouses add a personal touch to your wardrobe. Choose from intricate designs, patterns, and colors to create a blouse that tells your story.</p>
                </div>
            </div>

            <div class="service-item">
                <img src="Design_Blousess.jpg" alt="Designer Blouse" class="service-image">
                <div class="service-description">
                    <h3>Designer Blouses</h3>
                    <p>Our collection of designer blouses includes unique, stylish designs tailored to fit perfectly. Perfect for those who want to make a statement and stand out from the crowd.</p>
                </div>
            </div>

            <div class="service-item">
                <img src="party_blouse.jpg" alt="Party Blouse" class="service-image">
                <div class="service-description">
                    <h3>Party Blouses</h3>
                    <p>For an elegant evening or celebration, our party blouses add that perfect touch. With unique cuts, delicate fabrics, and modern designs, you'll be the center of attention.</p>
                </div>
            </div>
        </section>

        <section class="customization-options">
            <h2>Customization Options</h2>
            <p>At TailorCraft, we understand that every woman is unique, and so should her blouse. That's why we offer a variety of customization options:</p>
            <ul>
                <li><strong>1.Custom Fit:</strong> Choose your preferred fit - slim, relaxed, or tailored to your body shape.</li>
                <li><strong>2.Fabric Selection:</strong> Select from a wide range of premium fabrics including cotton, silk, satin, and more.</li>
                <li><strong>3.Neckline Styles:</strong> Choose from a variety of necklines such as v-neck, round neck, or high-neck styles.</li>
                <li><strong>4.Sleeve Styles:</strong> Add sleeves of your choice - cap sleeves, full sleeves, sleeveless, or bell sleeves.</li>
                <li><strong>5.Embroidery and Detailing:</strong> Add personalized embroidery, lace, or beadwork to give your blouse a distinctive flair.</li>
            </ul>
        </section>

        <section class="order-now">
            <h2>Ready for Your Perfect Blouse?</h2>
            <p>Get started today by scheduling a consultation with one of our expert tailors, and let’s create the blouse of your dreams!</p>
            <a href="categories.php" class="cta-button">Book a Consultation</a>
        </section>
    </main>

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
