package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Score;


public interface ScoreStudentDao extends JpaRepository<Score, Integer> {

	@Query(value = "SELECT * from [Score] where [fk_classlist_id] = :classCodeId and  [fk_student_id] = "
			+ "(select [student_id] from Student where [fk_user_id] = :sessionUserId)", nativeQuery = true)
	List<Score> getScoreByclasslistIdAndStudentId(@Param("classCodeId") Integer classCodeId,
			@Param("sessionUserId") Integer sessionUserId);
	
	//HQL: from Score
	//SQL: select * from score 
	//bean裡面對應的Student 變數名稱 private Student student;
	@Query(value="select top(3)* from Score where fk_student_id = :sessionStuId order by id desc", nativeQuery = true)
	List<Score> scoreforStudent(@Param("sessionStuId") Integer sessionStuId);



}
