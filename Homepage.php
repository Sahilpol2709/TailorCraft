<?php

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TailorCraft - Tailor Management System</title>
    <link rel="stylesheet" href="homepage.css"> 
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
        <section id="home" class="hero">
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <h2>Your Perfect Fit, Tailored Just for You</h2>
                <p>Transform your wardrobe with our bespoke tailoring services. Designed for quality, comfort, and style.</p>
                <a href="login.php" class="cta-button">Shop Now</a>
            </div>
        </section>

        <section id="about" class="about">
            <div class="container">
                <h2>About TailorCraft</h2>
                <div class="about-content">
                    <img src="sewing.png" alt="About TailorCraft" class="about-image">
                <p>At TailorCraft, we specialize in creating custom blouses tailored to your unique style and fit. Whether you're looking for a classic blouse for everyday wear, a trendy design to keep up with fashion, or a luxurious blouse for weddings and special events, we offer a range of styles to suit every occasion. Our expert tailors work with a variety of fabrics, cuts, and embellishments to ensure each blouse is crafted with precision, comfort, and elegance, giving you a perfect fit that enhances your personality.</p>
            </div>
            </div>
        </section>

        <section id="services" class="services">
            <div class="container">
                <h2>Our Tailoring Services</h2>
                <div class="service-items">
                    <div class="service-item">
                        <i class="fas fa-tshirt fa-4x"></i>
                        <h3>Custom Tailoring</h3>
                        <p>We offer personalized clothing tailored to your unique measurements and style preferences.</p>
                    </div>
                    <div class="service-item">
                        <i class="fas fa-cogs fa-4x"></i>
                        <h3>Alterations & Repairs</h3>
                        <p>From adjusting hems to full redesigns, our alteration service guarantees a perfect fit.</p>
                    </div>
                    <div class="service-item">
                        <i class="fas fa-gem fa-4x"></i>
                        <h3>Premium Fabrics</h3>
                        <p>Choose from our curated selection of high-end fabrics for a luxurious, bespoke experience.</p>
                    </div>
                    <div class="service-item">
                        <i class="fas fa-users fa-4x"></i>
                        <h3>Customer Satisfaction</h3>
                        <p>We guarantee customer satisfaction with every order.</p>
                    </div>
                    <div class="service-item">
                        <i class="fas fa-wallet fa-4x"></i>
                        <h3>Affordable Pricing</h3>
                        <p>We offer competitive pricing without compromising quality.</p>
                    </div>
                </div>
            </div>
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

    <script>
        document.addEventListener('DOMContentLoaded', () => {
    const navLinks = document.querySelectorAll('.nav-link');
    const sections = document.querySelectorAll('section');

    window.addEventListener('scroll', () => {
        let currentSection = "";
        
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            if (window.scrollY >= sectionTop - 50) {
                currentSection = section.getAttribute("id");
            }
        });

        navLinks.forEach(link => {
            link.classList.remove("active");
            if (link.getAttribute("href") === `#${currentSection}`) {
                link.classList.add("active");
            }
        });
    });

    const preloader = document.getElementById("preloader");
    window.addEventListener('load', () => {
        preloader.style.display = 'none';
    });
});
    </script>
</body>
</html>
