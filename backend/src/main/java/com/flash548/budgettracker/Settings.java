package com.flash548.budgettracker;

import javax.persistence.*;

@Entity
@Table(name = "settings")
public class Settings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Float income;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Float getIncome() {
        return income;
    }

    public void setIncome(Float income) {
        this.income = income;
    }
}
