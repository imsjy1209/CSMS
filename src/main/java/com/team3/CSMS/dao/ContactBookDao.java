package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ContactBook;

public interface ContactBookDao extends JpaRepository<ContactBook, Integer> {

	//------------------------- 老師 -------------------------
	// 老師聯絡簿選單By classListId
    @Query(value = "select * from [ContactBook] as CB "
    		+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
    		+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
    		+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
    		+ "where [fk_classlist_id] = :classListId "
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
    
    //------------------------- 校方 -------------------------
	// 校方聯絡簿選單By classListId
	@Query(value = "select * from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where  CB.[fk_classlist_id] = :classListId and [phase] > 1 "
			+ "order by CB.[create_at] desc, CB.[phase] asc, [cb_id] desc;", nativeQuery = true)
	List<ContactBook> getSchoolContactBookListByClassListId(@Param("classListId") Integer classListId);
	
	//------------------------- 學生 -------------------------
	// 學生聯絡簿選單By classListId
	@Query(value = "select * from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where [fk_classlist_id] = :classListId and [phase] = 3 "
			+ "order by CB.[create_at] desc, CB.[phase] asc, [cb_id] desc", nativeQuery = true)
	List<ContactBook> getStudentContactBookListByClassListId(@Param("classListId") Integer classListId);
	
	// 學生首頁Modal：顯示前3三筆聯絡簿(日期、課程代號、科目、上課內容、回家作業、下週考試)
	@Query(value = "select top(3)* from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "inner join [ClassStudentList] as CSL on CL.[classlist_id] = CSL.[fk_classlist_id] "
			+ "where CB.[phase] = 3 and CSL.[fk_student_id] = :sessionStuId "
			+ "order by CB.[create_at] desc", nativeQuery = true)
	List<ContactBook> getTop3StudentContactBookList(@Param("sessionStuId") Integer sessionStuId);

	//------------------------- 家長 -------------------------
	// 家長聯絡簿選單By classListId, studentId
	@Query(value = "select * from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
			+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classList_id] "
			+ "inner join [Student] as STU on STU.[student_id] = CSL.[fk_student_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where [classlist_id] = :classListId and [student_id] = :studentId and [phase] = 3 "
			+ "order by CB.[create_at] desc, CB.[cb_id] desc;", nativeQuery = true)
	List<ContactBook> getParentContactBookListByClassListId(@Param("classListId") Integer classListId, @Param("studentId")Integer studentId);
	
//	// 家長首頁Modal：篩選學生後顯示前3三筆聯絡簿資料
//	@Query(value = "select * from [ContactBook] as CB "
//			+ "inner join [ClassList] as CL on CB.[fk_classlist_id] = CL.[classlist_id] "
//			+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classList_id] "
//			+ "inner join [Student] as STU on STU.[student_id] = CSL.[fk_student_id] "
//			+ "where [student_id] = :studentId and [phase] = 3 "
//			+ "order by CB.[create_at] desc, CB.[cb_id] desc;", nativeQuery = true)
//	List<ContactBook> getTop3ParentContactBookList(@Param("studentId") Integer studentId);
	
	//------------------------- Admin -------------------------	
	// Admin聯絡簿選單By classListId 
	@Query(value = "select * from [ContactBook] as CB "
			+ "inner join [ClassList] as CL on CL.[classList_id] = CB.[fk_classlist_id] "
			+ "inner join [Teacher] as T on T.[teacher_id] = CL.[fk_teacher_id] "
			+ "inner join [School] as S on S.[school_id] = CL.[fk_school_id] "
			+ "where [fk_classlist_id] = :classListId " 
			+ "order by CB.[create_at] desc, CB.[cb_id] desc", nativeQuery = true)
	List<ContactBook> getAdminContactBookListByClassListId(@Param("classListId") Integer classListId);
	
}
