package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ClassList;

public interface ClassListDao extends JpaRepository<ClassList, Integer>{
    @Query(value = "SELECT * from [ClassList] as [cl] "+
    "inner join [Room] as room on room.room_id =[cl].fk_room_id "+
    "inner join [Course] as course on course.course_id = [cl].fk_course_id "+
	"where course.startDate <= GETDATE() "+
	"and course.endDate >= GETDATE() "+
    "and [cl].classList_id = :classCodeId ", nativeQuery = true)
    List<ClassList> getClassInfoByClassCodeId(@Param("classCodeId") Integer classCodeId);
    
    // 【Score】學生課堂資訊
    @Query(value="SELECT * from [ClassList] as cl "+
    "inner join [Room] as room on room.[room_id] = cl.[fk_room_id] "+
    "inner join [Course] as course on course.[course_id] = [cl].[fk_course_id] "+
    "inner join [ClassStudentList] as cls on cls.[fk_classlist_id] = cl.[classList_id] "+
    "inner join [Student] as s on cls.[fk_student_id]=s.[student_id]"+
    "WHERE cls.[fk_student_id] = (select [student_id] from Student where [fk_user_id] = :sessionUserId)"
     , nativeQuery = true)
    List<ClassList> getClassInfoByClassCodeIdAndStudentId(@Param("sessionUserId") Integer sessionUserId); 
    
    
//	 【Score】家長查詢學生課堂資訊
    @Query(value="SELECT * from [ClassList] as cl "+
    "inner join [Room] as room on room.[room_id] = cl.[fk_room_id] "+
    "inner join [Course] as course on course.[course_id] = [cl].[fk_course_id] "+
    "inner join [ClassStudentList] as cls on cls.[fk_classlist_id] = cl.[classList_id] "+
    "inner join [Student] as s on cls.[fk_student_id]=s.[student_id]"+
    "WHERE s.[fk_parent_id] = (select [parent_id] from Parent where [fk_user_id] = :sessionUserId)"
    , nativeQuery = true)
    List<ClassList> getClassInfoByClassCodeIdAndParentId(@Param("sessionUserId") Integer sessionUserId); 
    
    /* 聯絡簿課程選單使用：列出該帳號可以選的所有課程 */
    // 老師課程選單By account
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "where fk_teacher_id = (select [teacher_id] from Teacher "
    		+ "where [fk_user_id] = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getAllClassInfoListByTeacherAccount(@Param("sessionAccount") String sessionAccount);
    
    // 校方課程選單By account
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "where fk_school_id = (select [school_id] from School "
    		+ "where [fk_user_id] = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getAllClassInfoListBySchoolAccount(@Param("sessionAccount") String sessionAccount);
    
    // 學生課程選單By account
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classlist_id] "
    		+ "inner join [Student] as S on S.[student_id] = CSL.[fk_student_id] "
    		+ "where fk_student_id = (select student_id from Student "
    		+ "where fk_user_id = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getAllClassInfoListByStudentAccount(@Param("sessionAccount") String sessionAccount);
    
    // 家長課程選單By account
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classlist_id] "
    		+ "inner join [Student] as S on S.[student_id] = CSL.[fk_student_id] "
    		+ "inner join [Parent] as P on P.[parent_id] = S.[fk_parent_id] "
    		+ "where fk_parent_id = (select parent_id from Parent "
    		+ "where fk_user_id = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getAllClassInfoListByParentAccount(@Param("sessionAccount") String sessionAccount);

    /* 聯絡簿清單使用：課程選單選了哪一項(可能要改) */
    // 老師課程選單By account, classListId
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "where fk_teacher_id = (select [teacher_id] from Teacher "
    		+ "where [fk_user_id] = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and CL.[classList_id] = :classListId "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getClassInfoListByTeacherAccount
    (@Param("sessionAccount") String sessionAccount, @Param("classListId") Integer classListId);
    
    // 校方課程選單By account, classListId
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "where fk_school_id = (select [school_id] from School "
    		+ "where [fk_user_id] = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and CL.[classList_id] = :classListId "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getClassInfoListBySchoolAccount
    (@Param("sessionAccount") String sessionAccount, @Param("classListId") Integer classListId);
    
    // 學生課程選單By account, classListId
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classlist_id] "
    		+ "inner join [Student] as S on S.[student_id] = CSL.[fk_student_id] "
    		+ "where fk_student_id = (select student_id from Student "
    		+ "where fk_user_id = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and CL.[classList_id] = :classListId "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getClassInfoListByStudentAccount
    (@Param("sessionAccount") String sessionAccount, @Param("classListId") Integer classListId);
    
    // 家長課程選單By account, classListId, studentId
    @Query(value = "select * from [ClassList] as CL "
    		+ "inner join [Course] as C on CL.[fk_course_id] = C.[course_id] "
    		+ "inner join [ClassStudentList] as CSL on CSL.[fk_classlist_id] = CL.[classlist_id] "
    		+ "inner join [Student] as S on S.[student_id] = CSL.[fk_student_id] "
    		+ "inner join [Parent] as P on P.[parent_id] = S.[fk_parent_id] "
    		+ "where fk_parent_id = (select parent_id from Parent "
    		+ "where fk_user_id = (select [users_id] from USERS "
    		+ "where [account] = :sessionAccount)) "
    		+ "and CL.[classList_id] = :classListId "
    		+ "and S.[student_id] = :studentId "
    		+ "and C.[startDate] <= CONVERT(date, getDate()) and C.[endDate] >= CONVERT(date, getDate())"
    		, nativeQuery = true)
    List<ClassList> getClassInfoListByParentAccount
    (@Param("sessionAccount") String sessionAccount, @Param("classListId") Integer classListId,
     @Param("studentId") Integer studentId);
    
    
    
    //find ClassList by CourseId--Neil 1015
    @Query(value = "from ClassList where fk_course_id = ?1")
    ClassList findClassListByCourseId(Integer courseId);

    
    //find ClassList by ClassCode Like--Neil 1015
    @Query(value = "SELECT TOP(1) * from ClassList WHERE classCode like ?1% order BY classCode DESC", nativeQuery = true)
    ClassList findLatestClassListByClassCode(String classCode);
    
}



