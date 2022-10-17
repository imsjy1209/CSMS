package com.team3.CSMS.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Course;

public interface CourseDao extends JpaRepository<Course,Integer> {

	
	@Query(value = "from Course where courseOnOff = ?1")
	List<Course> findCourseByOnOrOff(int courseOnOff);
	
	@Query(value = "from Course where courseGrade = ?1 and courseOnOff = ?2")
	List<Course> findCourseByGrade(String grade,int courseOnOff);
	
	@Query(value = "from Course where courseSubject = ?1 and courseOnOff = ?2")
	List<Course> findCourseBySubject(String subject,int courseOnOff);
	
	@Query(value = "from Course where courseCategory = ?1 and courseOnOff = ?2")
	List<Course> findCourseByCategory(String category,int courseOnOff);
	
	@Query(value = "select * from Course where courseOnOff=1 AND"
		    + "(courseSubject LIKE :courseSubject "
		    + " AND courseGrade LIKE :courseGrade "
		    + " AND courseCategory LIKE :courseCategory) "
		    , nativeQuery = true)
		List<Course> findByLike(@Param("courseSubject") String courseSubject, @Param("courseGrade") String courseGrade,@Param("courseCategory") String courseCategory);


	List<Course> findByCourseCategoryContaining(String courseCategory);
	List<Course> findByCourseSubjectContaining(String courseSubject);
	List<Course> findByCourseGradeContaining(String courseGrade);
	List<Course> findByCourseSemesterContaining(String courseSemester);
	
	List<Course> findByCourseOnOffIsAndCourseSemesterContainingOrCourseOnOffIsAndCourseCategoryContainingOrCourseOnOffIsAndCourseSubjectContainingOrCourseOnOffIsAndCourseGradeContaining
	(Integer courseOnOff1,String courseSemester,Integer courseOnOff2,String courseCategory,Integer courseOnOff3,String courseSubject,Integer courseOnOff4,String courseGrade);

//	List<Course> findByCourseSemesterContainingOrCourseCategoryContainingOrCourseSubjectContainingOrCourseGradeContaining
//	(String courseSemester,String courseCategory,String courseSubject,String courseGrade);

	
//	@Query(value = "select * from Course where courseOnOff=1 and"
//		    + " (courseSubject = :courseSubject1 "
//		    + " or courseSubject = :courseSubject2 "
//		    + " or courseSubject = :courseSubject3 "
//		    + " or courseGrade = :courseGrade1 "
//		    + " or courseGrade = :courseGrade2 "
//		    + " or courseGrade = :courseGrade3 "
//		    + " or courseCategory = :courseCategory1 "
//		    + " or courseCategory = :courseCategory2) "
//		    , nativeQuery = true)
//		List<Course> findByLike2
//		(@Param("courseSubject1") String courseSubject1, @Param("courseSubject2") String courseSubject2,@Param("courseSubject3") String courseSubject3,
//		 @Param("courseGrade1") String courseGrade1,@Param("courseGrade2") String courseGrade2,@Param("courseGrade3") String courseGrade3,
//		 @Param("courseCategory1") String courseCategory1,@Param("courseCategory2") String courseCategory2
//		 );

}
