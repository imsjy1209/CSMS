package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ClassStudentList;

public interface ClassStudentListDao extends JpaRepository<ClassStudentList, Integer> {
    @Query(value= "SELECT * from [ClassStudentList] as [csl] "+
    "inner join [student] as stu on [stu].student_id = [csl].fk_student_id "+
    "where [csl].fk_classlist_id = :classCodeId ", nativeQuery = true)
     List <ClassStudentList> getStudentListByCodeId(@Param("classCodeId")Integer classCodeId);
    

    //find ClassStudntList By ClassListId--Neil 1015
	@Query(value = "from ClassStudentList where fk_classlist_id = ?1")
	List<ClassStudentList>findClassStudentListByClassListId(Integer id);
	
    //find ClassStudntList By ClassListId And StudentId--Neil 1015
	@Query(value = "from ClassStudentList where fk_classlist_id = ?1 AND fk_student_id=?2")
	ClassStudentList findClassStudentListByClassListIdAndStudentId(Integer clId,Integer stId);
    
}
