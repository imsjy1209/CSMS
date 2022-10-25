//package com.team3.CSMS.dao;
//
//import java.util.List;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//
//// import com.team3.CSMS.dto.StudentListDto;
//import com.team3.CSMS.model.ClassList;
//import com.team3.CSMS.model.Score;
//
//
//
//public interface ScoreDao extends JpaRepository<Score, Integer>{
//    // 課堂資訊
//    @Query(value="SELECT * from [Score] as [cl] ", nativeQuery = true)
//    List<ClassList> getScoreByclasslistId(@Param("classCodeId")Integer classCodeId);
//
//
//
//
//
//
//
//	
//}


package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.Groups;

public interface GroupDao extends JpaRepository<Groups,Integer> {

}
