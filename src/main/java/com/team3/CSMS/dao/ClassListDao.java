package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

// import com.team3.CSMS.dto.StudentListDto;
import com.team3.CSMS.model.ClassList;



public interface ClassListDao extends JpaRepository<ClassList, Integer>{
    // 課堂資訊
    @Query(value="SELECT * from [ClassList] as [cl] "+
    "inner join [Room] as room on room.room_id =[cl].fk_room_id "+
    "inner join [Course] as course on course.course_id = [cl].fk_course_id "+
    "WHERE [cl].classList_id = :classCodeId ", nativeQuery = true)
    List<ClassList> getClassInfoByClassCodeId(@Param("classCodeId")Integer classCodeId);
}



