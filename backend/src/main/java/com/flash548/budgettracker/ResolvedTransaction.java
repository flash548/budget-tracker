package com.flash548.budgettracker;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

public class ResolvedTransaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String category;

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date date;
    private Float amount;
    private String remarks;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @JsonFormat(pattern="yyyy-MM-dd")
    public Date getDate() {
        return date;
    }

    @JsonFormat(pattern="yyyy-MM-dd")
    public void setDate(Date date) {
        this.date = date;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
