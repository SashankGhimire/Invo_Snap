<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - InvoSnap</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <i class="fas fa-file-invoice-dollar fa-3x"></i>
        </div>
        <h1>InvoSnap</h1>
        <h2>Welcome Back</h2>
        <p class="tagline">Your smart bill companion.</p>

        <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Login</button>
        </form>

        <div class="login-links">
            <a href="${pageContext.request.contextPath}/forgotpassword">Forgot Password?</a>
            <a href="${pageContext.request.contextPath}/register">Create Account</a>
        </div>
    </div>
</body>
</html>
