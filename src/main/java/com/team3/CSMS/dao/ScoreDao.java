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

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.OrderList;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.model.Student;

public interface ScoreDao extends JpaRepository<Score, Integer> {
	// 【Score】依課程全部學生課堂資訊
	@Query(value = "SELECT * from [Score] where fk_classlist_id = :classCodeId and frequency= :frequency ", nativeQuery = true)
	List<Score> getScoreByclasslistId(@Param("classCodeId") Integer classCodeId, @Param("frequency") Integer frequency);

	// 【Score】家長查詢學生課堂資訊
	@Query(value = "SELECT * from [Score] as S "
			+ "inner join [Student] as student on student.[student_id] = S.[fk_student_id] "
			+ "inner join [ClassList] as classList on classList.[classList_id] = S.[fk_classlist_id] "
			+ "full join [parent] as parent on parent.[parent_id] = S.[fk_parent_id] "
			+ "where student.[student_id] = :studentId", nativeQuery = true)
	 List<Score> getChildScoreListByStudentId(@Param("studentId") Integer studentId);
	
    //HQL: from Score
//	 @Query(value="from Score s where s.student=:student and  s.classList=:classList and s.parent=:parent ")
//	 List<Score> scoreforParent(
//			 @Param("student") Student student,
//			 @Param("classList") ClassList classList,
//			 @Param("parent") Parent parent		 
//			 );

	 //【Score】及格分數
		@Query(value = "SELECT * from [Score] where fk_classlist_id = :classCodeId and frequency= :frequency and score >=60 ", nativeQuery = true)
		List<Score> getPassScoreByclasslistId(@Param("classCodeId") Integer classCodeId,@Param("frequency") Integer frequency);

	//【Score】不及格分數
		@Query(value = "SELECT * from [Score] where fk_classlist_id = :classCodeId and frequency= :frequency and score <60 ", nativeQuery = true)
		List<Score> getNotPassScoreByclasslistId(@Param("classCodeId") Integer classCodeId,@Param("frequency") Integer frequency);	


}
