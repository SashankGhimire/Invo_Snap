<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @charset "UTF-8";

        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #fafafa;
            line-height: 1.5;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            width: 100%;
            margin: 0;
            position: relative;
            z-index: 1000;
        }

        .logo-nav-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .logo a {
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 0.9em;
            font-weight: 700;
            color: #1e293b;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .logo a i {
            font-size: 0.9em;
            transition: transform 0.2s ease;
        }

        .logo a:hover i {
            transform: scale(1.1);
        }

        .logo a:hover {
            color: #2563eb;
        }

        .divider {
            color: #64748b;
            font-size: 1.1em;
            margin: 0 5px;
        }

        .main-nav {
            display: flex;
            list-style: none;
            gap: 10px;
        }

        .main-nav li a {
            display: flex;
            align-items: center;
            gap: 6px;
            text-decoration: none;
            color: #64748b;
            font-size: 0.9em;
            font-weight: 500;
            padding: 6px 12px;
            transition: all 0.2s ease;
            position: relative;
        }

        .main-nav li.active a {
            color: #2563eb;
        }

        .main-nav li.active a::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 30px;
            height: 3px;
            background: #2563eb;
            border-radius: 2px;
        }

        .main-nav li a:hover {
            color: #2563eb;
        }

        .main-nav li a i {
            font-size: 1.1em;
            transition: transform 0.2s ease;
        }

        .main-nav li a:hover i {
            transform: scale(1.1);
        }

        .user-profile {
            position: relative;
        }

        .user-profile-toggle {
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: #1e293b;
            font-weight: 500;
            padding: 6px 12px;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .user-profile-toggle:hover {
            background: #f1f5f9;
            color: #2563eb;
        }

        .user-profile i {
            font-size: 1.6em;
            transition: transform 0.2s ease;
        }

        .user-profile-toggle:hover i {
            transform: scale(1.1);
        }

        .user-name {
            font-size: 0.9em;
        }

        .profile-menu {
            position: absolute;
            top: 100%;
            right: 0;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 200px;
            opacity: 0;
            visibility: hidden;
            transform: translateY(8px);
            transition: all 0.2s ease;
        }

        .profile-menu.active {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .profile-menu-header {
            padding: 10px;
            border-bottom: 1px solid #e5e7eb;
            background: #2563eb;
            color: #ffffff;
            border-radius: 8px 8px 0 0;
        }

        .profile-menu-header h3 {
            margin: 0;
            font-size: 0.95em;
            font-weight: 600;
        }

        .profile-menu-header p {
            margin: 4px 0 0;
            font-size: 0.8em;
            opacity: 0.9;
        }

        .profile-menu ul {
            list-style: none;
            padding: 8px 0;
        }

        .profile-menu ul li a {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            text-decoration: none;
            color: #1e293b;
            font-size: 0.85em;
            transition: all 0.2s ease;
        }

        .profile-menu ul li a:hover {
            background: #f1f5f9;
            color: #2563eb;
        }

        .profile-menu ul li a i {
            font-size: 1.1em;
        }

        .auth-buttons {
            display: flex;
            gap: 10px;
        }

        .auth-button {
            display: flex;
            align-items: center;
            gap: 6px;
            text-decoration: none;
            color: #ffffff;
            background: #2563eb;
            font-size: 0.9em;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .auth-button:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        .auth-button i {
            font-size: 1.1em;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 10px;
                padding: 10px;
            }

            .logo-nav-container {
                flex-direction: column;
                gap: 8px;
            }

            .main-nav {
                flex-direction: row;
                gap: 8px;
            }

            .main-nav li a {
                padding: 8px;
            }

            .profile-menu {
                width: 100%;
                right: 0;
            }

            .auth-buttons {
                flex-direction: column;
                width: 100%;
            }

            .auth-button {
                justify-content: center;
            }
        }

        @media (min-width: 769px) and (max-width: 1024px) {
            .main-nav {
                gap: 8px;
            }

            .user-profile i {
                font-size: 1.5em;
            }

            .profile-menu {
                width: 180px;
            }
        }
    </style>
</head>
<body>
    <div id="header">
        <header class="header">
            <div class="logo-nav-container">
                <h1 class="logo">
                    <a href="${pageContext.request.contextPath}/home"><i class="fas fa-file-alt"></i> InvoSnap</a>
                </h1>
                <span class="divider">|</span>
                <ul class="main-nav">
                    <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-chart-line"></i> Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> About</a></li>
                </ul>
            </div>
            <% if (session.getAttribute("userName") != null) { %>
                <div class="user-profile">
                    <a href="#" class="user-profile-toggle" onclick="toggleProfileMenu()">
                        <i class="fas fa-user-circle"></i>
                        <span class="user-name">${sessionScope.userName}</span>
                    </a>
                    <div class="profile-menu" id="profileMenu">
                        <div class="profile-menu-header">
                            <h3>${sessionScope.userName}</h3>
                            <p>${sessionScope.userEmail != null ? sessionScope.userEmail : 'guest@example.com'}</p>
                        </div>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/profile/edit"><i class="fas fa-edit"></i> Edit Profile</a></li>
                            <li><a href="${pageContext.request.contextPath}/settings"><i class="fas fa-cog"></i> Settings</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            <% } else { %>
                <div class="auth-buttons">
                    <a href="${pageContext.request.contextPath}/login" class="auth-button">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                    <a href="${pageContext.request.contextPath}/signup" class="auth-button">
                        <i class="fas fa-user-plus"></i> Sign Up
                    </a>
                </div>
            <% } %>
        </header>
    </div>
    <script>
        function toggleProfileMenu() {
            const menu = document.getElementById('profileMenu');
            if (menu) {
                menu.classList.toggle('active');
            }
        }

        document.addEventListener('click', function(event) {
            const profileMenu = document.getElementById('profileMenu');
            const userProfile = document.querySelector('.user-profile-toggle');
            if (profileMenu && userProfile && !userProfile.contains(event.target) && !profileMenu.contains(event.target)) {
                profileMenu.classList.remove('active');
            }
        });

        function setActiveNav() {
            const navItems = document.querySelectorAll('.main-nav li');
            const currentPath = window.location.pathname;

            navItems.forEach(item => {
                const link = item.querySelector('a');
                const href = link.getAttribute('href');
                item.classList.remove('active');

                if (href === currentPath || (href.includes('/home') && currentPath === '/')) {
                    item.classList.add('active');
                }
            });
        }

        document.addEventListener('DOMContentLoaded', setActiveNav);

        document.querySelectorAll('.main-nav li a').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelectorAll('.main-nav li').forEach(item => item.classList.remove('active'));
                this.parentElement.classList.add('active');
            });
        });
    </script>
</body>
</html>