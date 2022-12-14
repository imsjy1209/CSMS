package com.team3.CSMS.dao;

import java.util.List;

// import javax.servlet.jsp.jstl.sql.Result;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Absent;
// import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Student;


public interface AbsentDao extends JpaRepository<Absent, Integer> {

    // 透過日期 和 班級代號 找到出勤名單
    @Query(value =  "select * from absentOrNot as abs "+
                    "where CONVERT(varchar(12) , [days], 112 )= :days "+
                    "and fk_classId_id= :classCodeId ", nativeQuery = true)
    List<Absent>selectAbsentByDaysAndClassCodeId(@Param("classCodeId") Integer classCodeId,@Param("days") String days);
    
    
    
    @Query(value ="select * from absentOrNot " +
    		"join student on student.student_id=absentOrNot.fk_student_id " +
    		"where CONVERT(varchar(12),[days], 112 )= ?2 " +
    		"and fk_classId_id= ?1 and name like ?3 ", nativeQuery = true)
    List<Absent>selectAbsentByDaysAndClassCodeIdAndStuNameMohu(Integer classCodeId,String days,String studentName);
    
    // SQL insert 資料 
    
    @Modifying
    @Query (value= "insert into absentOrNot (fk_classId_id,fk_student_id,arrivedOrNot) "+
            "values(:classId,:studentId,:arrivedValue) ", nativeQuery = true)
    void insertAbsentData(@Param("classId") Integer classId,@Param("studentId") Integer studentId ,@Param("arrivedValue")Integer arrivedValue);
    

    //HQL 透過學生找出缺勤
    @Query(value="from Absent where student= :student")
    List<Absent>selectAbsentByStudentId(@Param("student")Student student);
    
    // 可以空值得寫法
    // @Query(value= "SELECT 'Table 1' AS MSG, COLUMN1, COLUMN2 COLUMN3, COLUMN4, COLUMN5 FROM TABLE1 "+
    // "WHERE COLUMN1 = :column1 AND COLUMN2 = :column2 AND COLUMN3 = :column3 "+
    // "UNION SELECT 'table2' AS MSG, COLUMN1, COLUMN2 COLUMN3, COLUMN4, COLUMN5 FROM TABLE2"+
    // " WHERE COLUMN1 = :column1 AND COLUMN2 = :column2 AND COLUMN3 = :column3 ", nativeQuery = true)
    // List<Result> getResultByParameters(@Param("column1") String column1, 
    // @Param("column2")String column2,@Param("column3") String column3);
}