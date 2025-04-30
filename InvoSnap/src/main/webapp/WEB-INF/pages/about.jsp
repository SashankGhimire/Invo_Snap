<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Invoice Management System</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1>About Our Invoice Management System</h1>
        <p>Welcome to the future of financial organization! Our <span class="highlight">Invoice Management System</span> is designed to simplify, streamline, and revolutionize the way businesses handle their invoicing processes.</p>
        
        <p>Built with passion and precision, our platform empowers businesses of all sizes to manage invoices effortlessly, track payments in real-time, and maintain flawless financial records. We believe in making your workday smoother, so you can focus on what truly matters—growing your business.</p>
        
        <div class="mission">
            <h2>Our Mission</h2>
            <i class="fas fa-bullseye mission-icon"></i>
            <p>To provide an intuitive, reliable, and innovative invoicing solution that transforms complexity into clarity, helping businesses thrive in a fast-paced world.</p>
        </div>
        
        <div class="vision">
            <h2>Our Vision</h2>
            <p>We envision a world where financial management is seamless and stress-free, enabling entrepreneurs and businesses to unlock their full potential without the burden of complex invoicing processes.</p>
        </div>
        
        <div class="journey">
            <h2>Our Journey</h2>
            <div class="timeline">
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <i class="fas fa-rocket"></i>
                        <h3>2018: Founded InvoSnap</h3>
                        <p>Started with a mission to simplify invoicing for small businesses.</p>
                    </div>
                </div>
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <i class="fas fa-code"></i>
                        <h3>2019: First Platform Release</h3>
                        <p>Launched our initial version, bringing intuitive invoicing to thousands.</p>
                    </div>
                </div>
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <i class="fas fa-users"></i>
                        <h3>2021: 10,000 Users</h3>
                        <p>Reached a milestone of 10,000 active users worldwide.</p>
                    </div>
                </div>
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <i class="fas fa-shield-alt"></i>
                        <h3>2023: Enhanced Security</h3>
                        <p>Introduced advanced encryption to protect user data.</p>
                    </div>
                </div>
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <i class="fas fa-globe"></i>
                        <h3>2025: Global Expansion</h3>
                        <p>Expanded our services to support businesses in over 50 countries.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="why-choose-us">
            <h2>Why Choose Us?</h2>
            <div class="features">
                <div class="feature">
                    <h3>Real-Time Tracking</h3>
                    <p>Monitor payments and invoices instantly with our powerful dashboard.</p>
                </div>
                <div class="feature">
                    <h3>User-Friendly Interface</h3>
                    <p>Navigate with ease thanks to our intuitive design.</p>
                </div>
                <div class="feature">
                    <h3>Secure & Reliable</h3>
                    <p>Your data is protected with top-tier security measures.</p>
                </div>
            </div>
        </div>
        
        <div class="contact-us">
            <h2>Get in Touch</h2>
            <p>Join us on this journey to redefine invoicing. Contact us today to learn more about how we can help your business thrive!</p>
            <a href="${pageContext.request.contextPath}/contact" class="contact-button">Contact Us Now</a>
        </div>
    </div>
</body>
</html>