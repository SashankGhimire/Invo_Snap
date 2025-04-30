package com.invosnap.model;

import java.sql.Date;

public class PaymentModel {
    private int paymentId;
    private double amountPaid;
    private Date paymentDate;
    private int paymentMethodId;

    public PaymentModel() {}

    public PaymentModel(int paymentId, double amountPaid, Date paymentDate, int paymentMethodId) {
        this.paymentId = paymentId;
        this.amountPaid = amountPaid;
        this.paymentDate = paymentDate;
        this.paymentMethodId = paymentMethodId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }
}
