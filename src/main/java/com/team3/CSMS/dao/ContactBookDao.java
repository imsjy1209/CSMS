package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ContactBook;

public interface ContactBookDao extends JpaRepository<ContactBook, Integer> {
	
	/* 老師 */
	// 老師聯絡簿選單By classListId
    @Query(value = "select * from [ContactBook] as CB "
    		+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
    		+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
    		+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
    		+ "where [fk_classlist_id] = :classListId and [phase] < 4 "
    		+ "order by CB.[create_at] desc, CB.[phase] asc, [cb_id] desc;"
    		, nativeQuery = true)
    List<ContactBook> getTeacherContactBookListByClassListId(@Param("classListId") Integer classListId);
	
    // 老師點「建立聯絡簿」，insert一筆資料By classListId  → insert ContactBook 使用
    @Query(value = "insert into ContactBook ([fk_classlist_id]) values (:classListId); "
    		+ "select top(1)* from ContactBook where [fk_classlist_id] = :classListId "
    		+ "order by [create_at] desc, [phase] asc, [cb_id] desc;"
    		, nativeQuery = true)
    ContactBook insertTheClassListIdIntoContactBook(@Param("classListId") Integer classListId);
    
    // 抓insert的該筆資料的cb_id(同聯絡簿首頁清單排序方式) → insert ContactBookSign 使用
    @Query(value = "select top(1)* from ContactBook where [fk_classlist_id] = :classListId "
    		+ "order by [create_at] desc, [phase] asc, [cb_id] desc" , nativeQuery = true)
    ContactBook findTopOneByclassListIdFromOrderedContactBook(@Param("classListId") Integer classListId);    
    
    // 老師點「確認送出」，update聯絡簿欄位和phase=2，並insert簽名資料
    @Query(value = "update ContactBook set courseContent=:courseContent, "
    		+ "homework=:homework, quizNotice=:quizNotice, phase = 2 "
    		+ "where [cb_id] = :cbId; "
    		+ "select * from ContactBook [cb_id] = :cbId; "
    		, nativeQuery = true)
    ContactBook updateContactBookById(
    		@Param("courseContent") Integer courseContent, 
    		@Param("homework") Integer homework, 
    		@Param("quizNotice") Integer quizNotice,
    		@Param("cbId") Integer cbId);
    
    
    // 老師點「回上一頁」，若phase==1，delete該筆資料By cb_id
    
    
    /* 校方 */
	// 校方聯絡簿選單By classListId
	@Query(value = "select * from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where  CB.[fk_classlist_id] = :classListId and ([phase] = 2 or [phase] = 3) "
			+ "order by CB.[create_at] desc, CB.[phase] asc, [cb_id] desc;", nativeQuery = true)
	List<ContactBook> getSchoolContactBookListByClassListId(@Param("classListId") Integer classListId);
	
	
	/* 學生 */
	// 學生聯絡簿選單By classListId
	@Query(value = "select * from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where [fk_classlist_id] = :classListId and [phase] = 3 "
			+ "order by CB.[create_at] desc, CB.[phase] asc, [cb_id] desc;", nativeQuery = true)
	List<ContactBook> getStudentContactBookListByClassListId(@Param("classListId") Integer classListId);
	
	/* 家長 */
	// 家長聯絡簿選單By classListId, studentId
	@Query(value = "select * from [ContactBook] as CB \r\n"
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classList_id] "
			+ "inner join [Student] as STU on STU.[student_id] = CSL.[fk_student_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where [classlist_id] = :classListId and [student_id] = :studentId and [phase] = 3 "
			+ "order by CB.[create_at] desc, CB.[phase] asc, [cb_id] desc;", nativeQuery = true)
	List<ContactBook> getParentContactBookListByClassListId(@Param("classListId") Integer classListId, Integer studentId);
	
	
	
	
}
