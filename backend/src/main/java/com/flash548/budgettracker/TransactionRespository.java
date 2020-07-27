package com.flash548.budgettracker;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;


public interface TransactionRespository extends CrudRepository<Transaction, Long> {

    public String tranQuery = "select t.id, t.category, t.date, t.amount, t.remarks from transactions as " +
            "t inner join categories as c on (t.category = c.id) where c.category in (:categories) and " +
            "t.amount between ifnull(:fromAmount, 0) and ifnull(:toAmount,~0) and date between ifnull(:fromDate, '0000-01-01') "+
            "and ifnull(:toDate, '9999-12-31') order by t.date asc";

    @Query(value=tranQuery, nativeQuery = true)
    public Transaction[] searchTransactions(Iterable<String> categories, Float fromAmount, Float toAmount, Date fromDate, Date toDate);


}