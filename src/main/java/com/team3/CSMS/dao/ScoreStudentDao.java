package com.team3.CSMS.dao;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Score;

public interface ScoreStudentDao extends JpaRepository<Score, Integer> {

	@Query(value = "SELECT * from [Score] where [fk_classlist_id] = :classCodeId and  [fk_student_id] = "
			+ "(select [student_id] from Student where [fk_user_id] = :sessionUserId)", nativeQuery = true)
	List<Score> getScoreByclasslistIdAndStudentId(@Param("classCodeId") Integer classCodeId,
			@Param("sessionUserId") Integer sessionUserId);

}
