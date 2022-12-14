package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Messagez;
import com.team3.CSMS.model.OrderList;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;

public interface MessagezDao extends JpaRepository<Messagez, Integer> {
	@Query(value="  select School.name from ClassStudentList\r\n"
			+ "  join classlist on fk_classlist_id = ClassList.classList_id\r\n"
			+ "  join student on student_id =Student.student_id\r\n"
			+ "  join Parent on Student.fk_parent_id=Parent.parent_id\r\n"
			+ "  join School on fk_school_id = school_id\r\n"
			+ "  where Student.student_id=:id group by School.name",nativeQuery = true)
	public List<String>getTeacherName(@Param("id") int id);
	
	@Query(value="from Messagez where school=:school and toSchool=0")
	public List<Messagez> getAllBySchool(@Param("school") School school);
	
	@Query(value="from Messagez where parent=:parent and toSchool=1")
	public List<Messagez> getAllByParent(@Param("parent") Parent parent);
	
	//========Neil 1103===============================
	//==from school
	List<Messagez> findBySchoolIsAndToSchoolIsOrderByCreateTimeDesc(School school,Integer toSchool);
	
	//==from parent
	List<Messagez> findByParentIsAndToSchoolIsOrderByCreateTimeDesc(Parent parent,Integer toSchool);
	//========Neil 1103===============================
	
	//已讀方法
	@Modifying
	@Query(value="update Messagez set readOrNot =1 where id=:id")
	public void readOrNot(@Param("id") int id);
}

