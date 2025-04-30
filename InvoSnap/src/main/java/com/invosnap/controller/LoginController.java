package com.invosnap.controller;

import java.io.IOException;

import com.invosnap.model.UserModel;
import com.invosnap.service.LoginService;
import com.invosnap.util.RedirectionUtil;
import com.invosnap.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ValidationUtil validationUtil;
    private RedirectionUtil redirectionUtil;
    private LoginService loginService;

    private final String loginPage = "/WEB-INF/pages/login.jsp";
    private final String homePage = "/WEB-INF/pages/home.jsp";

    public LoginController() {
        this.validationUtil = new ValidationUtil();
        this.redirectionUtil = new RedirectionUtil();
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(loginPage).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println("Login attempt - Username: [" + username + "], Password: [" + password + "]");

        if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password)) {
            System.out.println("Validation failed: Redirecting to login.jsp");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all the fields!", loginPage);
        } else {
            UserModel userModel = new UserModel();
            userModel.setUsername(username);
            userModel.setPassword(password);
            Boolean isValid = loginService.loginUser(userModel);

            if (isValid == null) {
                System.out.println("Database connection error: Redirecting to login.jsp");
                redirectionUtil.setMsgAndRedirect(req, resp, "error", "Database error, please try again later!", loginPage);
            } else if (isValid) {
                System.out.println("Credentials valid: Redirecting to home.jsp");
                req.getSession().setAttribute("username", username); // Set "username" to match filter
                redirectionUtil.setMsgAndRedirect(req, resp, "success", "Successfully Logged In!", homePage);
            } else {
                System.out.println("Credentials invalid: Redirecting to login.jsp");
                redirectionUtil.setMsgAndRedirect(req, resp, "error", "Either username or password is incorrect!", loginPage);
            }
        }
    }
}