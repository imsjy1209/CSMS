package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.dto.StudentListDto;
import com.team3.CSMS.model.ClassStudentList;

public interface ClassStudentListDao extends JpaRepository<ClassStudentList, Integer> {
    @Query(value= "SELECT * from [ClassStudentList] as [csl] "+
    "inner join [student] as stu on [stu].student_id = [csl].fk_student_id "+
    "where [csl].fk_classlist_id = :classCodeId ", nativeQuery = true)
     List <ClassStudentList> getStudentListByCodeId(@Param("classCodeId")Integer classCodeId);
    
}
