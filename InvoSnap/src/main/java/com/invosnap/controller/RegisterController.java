package com.invosnap.controller;

import java.io.IOException;
import java.sql.Timestamp;

import com.invosnap.model.UserModel;
import com.invosnap.service.LoginService;
import com.invosnap.service.RegisterService;
import com.invosnap.util.PasswordUtil;
import com.invosnap.util.RedirectionUtil;
import com.invosnap.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ValidationUtil validationUtil;
    private RedirectionUtil redirectionUtil;
    private RegisterService registerService;
    private LoginService loginService;

    private final String registerPage = "/WEB-INF/pages/register.jsp";
    private final String homePage = "/WEB-INF/pages/home.jsp";

    public RegisterController() {
        this.validationUtil = new ValidationUtil();
        this.redirectionUtil = new RedirectionUtil();
        this.registerService = new RegisterService();
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(registerPage).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        System.out.println("Registering Username: [" + username + "], Password: [" + password + "], FullName: [" + fullName + "], Email: [" + email + "], Phone: [" + phoneNumber + "]");

        if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password) ||
            validationUtil.isNullOrEmpty(fullName) || validationUtil.isNullOrEmpty(email)) {
            System.out.println("Validation failed: Redirecting to register.jsp");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all required fields!", registerPage);
        } else {
            UserModel userModel = new UserModel();
            userModel.setUsername(username);
            userModel.setPassword(PasswordUtil.encrypt(username, password));
            userModel.setFullName(fullName);
            userModel.setEmail(email);
            userModel.setPhoneNumber(phoneNumber);
            userModel.setRoleId(2); // Example: 1=admin, 2=user
            Timestamp now = new Timestamp(System.currentTimeMillis());
            userModel.setCreatedAt(now);
            userModel.setUpdatedAt(now);

            // Check if username already exists
            Boolean userExists = loginService.loginUser(userModel);
            if (userExists != null && userExists) {
                System.out.println("Username already exists: Redirecting to register.jsp");
                redirectionUtil.setMsgAndRedirect(req, resp, "error", "Username already taken!", registerPage);
            } else {
                Boolean registered = registerService.registerUser(userModel);
                if (registered == null) {
                    System.out.println("Database connection error: Redirecting to register.jsp");
                    redirectionUtil.setMsgAndRedirect(req, resp, "error", "Database error, please try again later!", registerPage);
                } else if (registered) {
                    System.out.println("Registration successful: Redirecting to home.jsp");
                    req.getSession().setAttribute("username", username); // Set "username" to match filter
                    redirectionUtil.setMsgAndRedirect(req, resp, "success", "Registration successful!", homePage);
                } else {
                    System.out.println("Registration failed: Redirecting to register.jsp");
                    redirectionUtil.setMsgAndRedirect(req, resp, "error", "Registration failed, please try again!", registerPage);
                }
            }
        }
    }
}