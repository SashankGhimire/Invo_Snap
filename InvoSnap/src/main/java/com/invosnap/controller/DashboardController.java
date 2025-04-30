
package com.invosnap.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class DashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String dashboardPage = "dashboard";

    public DashboardController() {
        // No dependencies needed
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Set a default username for header.jsp if none exists
        HttpSession session = req.getSession(true); // Create session if none exists
        if (session.getAttribute("username") == null) {
            session.setAttribute("username", "Guest");
            session.setAttribute("userName", "Guest"); // For header.jsp
        }

        // Simulated data for the dashboard (replace with actual database queries in a real app)
        int totalInvoices = 120;
        int paidInvoices = 80;
        int unpaidInvoices = 30;
        int overdueInvoices = 10;

        // Simulated recent invoices
        List<Invoice> recentInvoices = new ArrayList<>();
        recentInvoices.add(new Invoice("INV001", "Acme Corp", 1500.00, "2025-05-01", "Paid"));
        recentInvoices.add(new Invoice("INV002", "Beta LLC", 2300.50, "2025-04-28", "Unpaid"));
        recentInvoices.add(new Invoice("INV003", "Gamma Inc", 900.75, "2025-04-15", "Overdue"));
        recentInvoices.add(new Invoice("INV004", "Delta Co", 3200.00, "2025-05-10", "Paid"));

        // Add data to the request
        req.setAttribute("totalInvoices", totalInvoices);
        req.setAttribute("paidInvoices", paidInvoices);
        req.setAttribute("unpaidInvoices", unpaidInvoices);
        req.setAttribute("overdueInvoices", overdueInvoices);
        req.setAttribute("recentInvoices", recentInvoices);

        // Forward to the dashboard JSP
        req.getRequestDispatcher("/WEB-INF/pages/" + dashboardPage + ".jsp").forward(req, resp);
    }

    // Invoice class for demonstration
    public static class Invoice {
        private String id;
        private String client;
        private double amount;
        private String dueDate;
        private String status;

        public Invoice(String id, String client, double amount, String dueDate, String status) {
            this.id = id;
            this.client = client;
            this.amount = amount;
            this.dueDate = dueDate;
            this.status = status;
        }

        public String getId() { return id; }
        public String getClient() { return client; }
        public double getAmount() { return amount; }
        public String getDueDate() { return dueDate; }
        public String getStatus() { return status; }
    }
}