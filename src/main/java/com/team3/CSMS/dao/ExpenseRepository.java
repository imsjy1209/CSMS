package com.team3.CSMS.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Integer> {

	@Query("from Expense e where e.year=:year and e.semester=:semester")
	public Expense findBydate(@Param(value = ("year"))String year,@Param(value = ("semester"))String semester);

	@Query(value="select *from expense where year between :first and :second order by year"
			,nativeQuery = true)
	public List<Expense> findExpByYear(@Param(value = ("first"))String first,@Param(value = ("second"))String second);
	
	@Query(value="select year from expense group by year"
			,nativeQuery = true)
	public List<String> getAllYear();
	
//	@Query(value="select courseSubject,count(*) from OrderDetail \r\n"
//			+ "join Course on fk_course_id = Course_id\r\n"
//			+ "group by courseSubject"
//			,nativeQuery = true)
//	public Map<String,String> coursenum();
}
