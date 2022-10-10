package com.team3.CSMS.dao;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Absent;
import com.team3.CSMS.model.ClassList;

public interface AbsentDao extends JpaRepository<Absent, Integer> {
    
    @Query(value = "SELECT csl.studentId , stu.[name] ,stu.id,cls.classCode from [dbo].[ClassStudentList] as csl "+
    "inner join [dbo].[Classlist] as cls on cls.id = csl.fk_classlist_id "+
    "inner join [dbo].[student] as stu on stu.id = csl.fk_student_id "+
    "inner join [dbo].[Room] as room on room.id =cls.fk_room_id "+
    "inner join [dbo].[Course] as course on course.id = cls. fk_course_id "+
    "WHERE cls.classCode = :classCode ", nativeQuery = true)
	List<Result> whoinclass(@Param("classCode") String classCode); 
    
    @Query(value = "SELECT cl.[classCode], room.roomName ,course.courseSubject ,course.courseCategory,course.courseGrade,course.courseClass" + 
    "FROM [dbo].[ClassList] as cl" +
    "join [dbo].Room as room on cl.fk_room_id= room.id" +
    "join [dbo].[Course] as course on course.id = cl.fk_course_id" +
    "where cl.[classCode] = :classCode", nativeQuery = true)
	List<ClassList> classInfo(@Param("classCode") String classCode); 
    
    // @Query(value= "SELECT 'Table 1' AS MSG, COLUMN1, COLUMN2 COLUMN3, COLUMN4, COLUMN5 FROM TABLE1 "+
    // "WHERE COLUMN1 = :column1 AND COLUMN2 = :column2 AND COLUMN3 = :column3 "+
    // "UNION SELECT 'table2' AS MSG, COLUMN1, COLUMN2 COLUMN3, COLUMN4, COLUMN5 FROM TABLE2"+
    // " WHERE COLUMN1 = :column1 AND COLUMN2 = :column2 AND COLUMN3 = :column3 ", nativeQuery = true)
    // List<Result> getResultByParameters(@Param("column1") String column1, 
    //     @Param("column2")String column2,@Param("column3") String column3);

}