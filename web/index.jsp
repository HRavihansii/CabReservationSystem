<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cabs</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                scroll-behavior: smooth;
                background-color: #f4f7fc;
                padding-top: 70px;
            }
            .navbar {
                background-color: black;
                padding: 15px;
                border-bottom: 3px solid #FFBF00;
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000;
            }
            .navbar-brand {
                color: #FFBF00 !important;
                font-size: 1.8rem;
                margin-left: 40px;
                font-weight: bold;
            }
            .nav-link {
                color: white !important;
                padding: 10px 15px;
                font-weight: 500;
                margin: 0 10px;
            }
            .nav-link:hover, .nav-link.active {
                color: #FFBF00 !important;
                font-weight: bold;
            }
            .explore-btn {
                background-color: #FFBF00;
                color: black;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
                margin-top: 2px;
                margin-right: 40px;
                transition: background-color 0.3s ease;
            }
            .explore-btn:hover {
                background-color: #e6a800;
                color: white;
            }
            .hero {
                min-height: 100vh;
                display: flex;
                align-items: center;
                background-color: #f8f9fa; /* Same as Cabs section */
                padding: 100px 0;
            }
            .hero-content {
                padding: 50px;
            }
            .hero-content h1 {
                font-size: 3.5rem;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
            }
            .hero-content p {
                font-size: 1.25rem;
                color: #555;
                margin-bottom: 30px;
            }
            .hero-image {
                background: url('images/main.png') no-repeat center center/cover;
                min-height: 500px;
                border-radius: 20px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }
            .about-section, .contact-section {
                padding: 100px 0;
                background-color: #ffffff; /* Same for About and Contact sections */
            }
            .cabs-section {
                padding: 100px 0;
                background-color: #f8f9fa; /* Same as Home section */
            }
            .about-section h2, .cabs-section h2, .contact-section h2 {
                font-size: 2.75rem;
                font-weight: bold;
                margin-bottom: 30px;
                color: black;
            }
            .about-section .lead, .cabs-section .lead, .contact-section .lead {
                font-size: 1.25rem;
                color: #555;
                max-width: 800px;
                margin: 0 auto 50px auto;
            }
            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            }
            .card-title {
                font-size: 1.75rem;
                font-weight: bold;
                margin-bottom: 15px;
                color: black;
            }
            .card-text {
                font-size: 1.1rem;
                color: #555;
            }
            .custom-btn {
                background-color: #FFBF00 !important;
                border-color: #FFBF00 !important;
                color: black !important;
            }
            .view-all-link {
                font-size: 1.1rem;
                color: #FFBF00;
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s ease;
            }
            .view-all-link:hover {
                color: #e6a800;
                text-decoration: underline;
            }
            .contact-info {
                background-color: #fff;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }
            .contact-info h4 {
                font-size: 1.75rem;
                font-weight: bold;
                margin-bottom: 20px;
                color: black;
            }
            .contact-info ul {
                list-style: none;
                padding: 0;
            }
            .contact-info ul li {
                font-size: 1.1rem;
                color: #555;
                margin-bottom: 15px;
            }
            .contact-info ul li i {
                color: #FFBF00;
                margin-right: 10px;
            }
            .footer {
                background-color: black;
                color: white;
                text-align: center;
                padding: 30px;
                margin-top: 2px;
            }
            .footer a {
                color: #FFBF00;
                text-decoration: none;
                transition: color 0.3s ease;
            }
            .footer a:hover {
                color: #e6a800;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Mega City Cabs</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="#lgin">Login</a></li>
                    </ul>
                </div>
                <a href="login.jsp" class="explore-btn">Book Now</a>
            </div>
        </nav>

        <!-- Hero Section -->
        <section id="home" class="container-fluid hero">
            <div class="row w-100">
                <!-- Left Side Content -->
                <div class="col-md-6 d-flex align-items-center">
                    <div class="hero-content">
                        <h1 class="text-dark">Your Ride, Your Way</h1>
                        <p>Fast, reliable, and comfortable rides at your fingertips. Book now and get where you need to be—hassle-free!</p>
                        <a href="login.jsp" class="explore-btn">Get a Ride</a>
                    </div>
                </div>
                <!-- Right Side Image -->
                <div class="col-md-6 hero-image"></div>
            </div>
        </section>

        <!-- About Us Section -->
        <section id="about" class="about-section">
            <div class="container">
                <div class="text-center">
                    <h2>About Us</h2>
                    <p class="lead">We are a reliable and customer-focused cab service, dedicated to making every journey a safe, comfortable, and affordable experience.</p>
                </div>

                <!-- Cards -->
                <div class="row mt-5">
                    <!-- Card 1: Safe Experience -->
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 text-center p-4" style="border: 2px solid #FFBF00; background-color: #f8f9fa;">
                            <div class="card-body">
                                <i class="fas fa-shield-alt fa-3x mb-3" style="color: #FFBF00;"></i>
                                <h5 class="card-title">Safe Experience</h5>
                                <p class="card-text">We prioritize your safety with well-trained drivers and vehicles that are maintained to the highest standards.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2: Comfortable Rides -->
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 text-center p-4" style="border: 2px solid #FFBF00; background-color: #f8f9fa;">
                            <div class="card-body">
                                <i class="fas fa-couch fa-3x mb-3" style="color: #FFBF00;"></i>
                                <h5 class="card-title">Comfortable Rides</h5>
                                <p class="card-text">Enjoy a smooth and relaxing journey in our fleet of modern, well-maintained vehicles.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Affordable Rates -->
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 text-center p-4" style="border: 2px solid #FFBF00; background-color: #f8f9fa;">
                            <div class="card-body">
                                <i class="fas fa-wallet fa-3x mb-3" style="color: #FFBF00;"></i>
                                <h5 class="card-title">Affordable Price</h5>
                                <p class="card-text">Get the best value for your money with our competitive pricing, without compromising on quality.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="contact-section">
            <div class="container">
                <div class="text-center">
                    <h2>Contact Us</h2>
                    <p class="lead">Have any questions or Want to book a Cab?</p>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="contact-info">
                            <h4>Contact Information</h4>
                            <ul>
                                <li><i class="fas fa-phone"></i>+94 112 513 874</li>
                                <li><i class="fas fa-envelope"></i>support@megacitycabs.com</li>
                                <li><i class="fas fa-map-marker-alt"></i>123, Mega City St, Colombo, Sri Lanka</li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="contact-info">
                            <h4>Business Hours</h4>
                            <ul>
                                <li><i class="fas fa-clock"></i>Mon - Fri: 9:00 AM - 7:00 PM</li>
                                <li><i class="fas fa-clock"></i>Sat - Sun: 10:00 AM - 5:00 PM</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 All rights reserved by Mega City Cabs</p>
            <p>
                <a href="#">Privacy Policy</a> | 
                <a href="#">Terms of Service</a>
            </p>
        </footer>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
