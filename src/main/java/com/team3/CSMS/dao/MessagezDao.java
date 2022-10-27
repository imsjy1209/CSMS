package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Messagez;

public interface MessagezDao extends JpaRepository<Messagez, Integer> {
	@Query(value="  select School.name from ClassStudentList\r\n"
			+ "  join classlist on fk_classlist_id = ClassList.classList_id\r\n"
			+ "  join student on student_id =Student.student_id\r\n"
			+ "  join Parent on Student.fk_parent_id=Parent.parent_id\r\n"
			+ "  join School on fk_school_id = school_id\r\n"
			+ "  where Student.student_id=:id group by School.name",nativeQuery = true)
	public List<String>getTeacherName(@Param("id") String id);
}
