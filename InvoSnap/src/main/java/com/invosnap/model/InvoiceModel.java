package com.invosnap.model;

import java.sql.Date;

public class InvoiceModel {
    private int invoiceId;
    private int userId;
    private String invoiceNumber;
    private double subtotal;
    private int taxDetailsId;
    private double totalAmount;
    private String paymentStatus;
    private Date dueDate;
    private Date issueDate;
    private int paymentId;

    public InvoiceModel() {}

    public InvoiceModel(int invoiceId, int userId, String invoiceNumber, double subtotal, int taxDetailsId, double totalAmount, String paymentStatus, Date dueDate, Date issueDate, int paymentId) {
        this.invoiceId = invoiceId;
        this.userId = userId;
        this.invoiceNumber = invoiceNumber;
        this.subtotal = subtotal;
        this.taxDetailsId = taxDetailsId;
        this.totalAmount = totalAmount;
        this.paymentStatus = paymentStatus;
        this.dueDate = dueDate;
        this.issueDate = issueDate;
        this.paymentId = paymentId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public int getTaxDetailsId() {
        return taxDetailsId;
    }

    public void setTaxDetailsId(int taxDetailsId) {
        this.taxDetailsId = taxDetailsId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }
}
