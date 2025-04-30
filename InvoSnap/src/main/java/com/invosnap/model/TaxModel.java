package com.invosnap.model;

public class TaxModel {
    private int taxDetailsId;
    private double taxPercentage;
    private double taxAmount;

    public TaxModel() {}

    public TaxModel(int taxDetailsId, double taxPercentage, double taxAmount) {
        this.taxDetailsId = taxDetailsId;
        this.taxPercentage = taxPercentage;
        this.taxAmount = taxAmount;
    }

    public int getTaxDetailsId() {
        return taxDetailsId;
    }

    public void setTaxDetailsId(int taxDetailsId) {
        this.taxDetailsId = taxDetailsId;
    }

    public double getTaxPercentage() {
        return taxPercentage;
    }

    public void setTaxPercentage(double taxPercentage) {
        this.taxPercentage = taxPercentage;
    }

    public double getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(double taxAmount) {
        this.taxAmount = taxAmount;
    }
}
