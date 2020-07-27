package com.flash548.budgettracker;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class TransactionRequest {
    private String[] categories;
    private Float fromAmount;
    private Float toAmount;
    private Date fromDate;
    private Date toDate;

    public String[] getCategories() {
        return categories;
    }

    public void setCategories(String[] categories) {
        this.categories = categories;
    }

    public Float getFromAmount() {
        return fromAmount;
    }

    public void setFromAmount(Float fromAmount) {
        this.fromAmount = fromAmount;
    }

    public Float getToAmount() {
        return toAmount;
    }

    public void setToAmount(Float toAmount) {
        this.toAmount = toAmount;
    }

    @JsonFormat(pattern="yyyy-MM-dd")
    public Date getFromDate() {
        return fromDate;
    }

    @JsonFormat(pattern="yyyy-MM-dd")
    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    @JsonFormat(pattern="yyyy-MM-dd")
    public Date getToDate() {
        return toDate;
    }

    @JsonFormat(pattern="yyyy-MM-dd")
    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }
}