package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Integer> {

	@Query("from Expense e where e.year=:year and e.semester=:semester")
	public Expense findBydate(@Param(value = ("year")) String year, @Param(value = ("semester")) String semester);

	@Query(value = "select *from expense where year between :first and :second order by year", nativeQuery = true)
	public List<Expense> findExpByYear(@Param(value = ("first")) String first,
			@Param(value = ("second")) String second);

	@Query(value = "select year from expense group by year", nativeQuery = true)
	public List<String> getAllYear();

	@Query(value = "select count(*) as 'num' from OrderDetail\r\n" 
			+ "join Course on fk_course_id = course_id\r\n"
			+ "where startdate between :up and :down\r\n" 
			+ "group by courseSubject", nativeQuery = true)
	public List<String> coursenum(@Param(value = ("up")) String up, @Param(value = ("down")) String down);

}