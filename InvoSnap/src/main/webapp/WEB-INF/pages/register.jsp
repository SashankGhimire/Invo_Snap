<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Invosnap</title>
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/register.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <div class="register-container">
        <div class="logo">Invosnap</div>
        <h1>Create Account</h1>
        <p class="register-description">Start managing your bills smartly</p>
        
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="card">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" id="fullName" name="fullName" placeholder="Full Name" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-user-circle"></i>
                    <input type="text" id="username" name="username" placeholder="Username" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-phone"></i>
                    <input type="tel" id="phone" name="phoneNumber" placeholder="Phone Number" pattern="[0-9]{10}" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>

                <button type="submit">Register</button>

                <div class="register-links">
                    <a href="${pageContext.request.contextPath}/login">Already have an account? Login</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>