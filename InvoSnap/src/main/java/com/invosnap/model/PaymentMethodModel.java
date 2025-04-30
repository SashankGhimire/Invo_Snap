package com.invosnap.model;

public class PaymentMethodModel {
    private int paymentMethodId;
    private String paymentType;
    private String paymentDetails;

    public PaymentMethodModel() {}

    public PaymentMethodModel(int paymentMethodId, String paymentType, String paymentDetails) {
        this.paymentMethodId = paymentMethodId;
        this.paymentType = paymentType;
        this.paymentDetails = paymentDetails;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getPaymentDetails() {
        return paymentDetails;
    }

    public void setPaymentDetails(String paymentDetails) {
        this.paymentDetails = paymentDetails;
    }
}
