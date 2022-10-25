package com.team3.CSMS.dao;

import java.util.List;
// import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Activity;
import com.team3.CSMS.model.Student;

public interface StudentDao extends JpaRepository<Student, Integer> {
	
	@Query(value="select * from Student where name= :studentName",nativeQuery = true)
	Optional<Student> selectStudentByName(@Param("studentName")String studentName);
	
	@Query(value="select *from student_activity where id=:id",nativeQuery = true)
	public List<Activity> getMyAct(int id);
}