package com.flash548.budgettracker;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;


public interface RangeRepository extends CrudRepository<Range, Long> {

    @Query(value="select c.category, r.low, r.high from ranges as r inner join categories as c on (c.id = r.category)", nativeQuery = true)
    public ResolvedRange[] getResolvedRanges();

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value="UPDATE ranges SET low = :low, high = :high where id = (select id from categories where category = :category)", nativeQuery = true)
    public void updateRange(Float low, Float high, String category);
}
