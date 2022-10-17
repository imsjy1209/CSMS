package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.CourseDao;
import com.team3.CSMS.model.Course;

@Service
@Transactional
public class CourseService {
	
	@Autowired
	private CourseDao courseDao;
	

	
	//刪除課程商品
		public void deleteCourse(Course course) {
			courseDao.delete(course);
		}
	
	//新增課程商品
	public void insertCourse(Course course) {
		courseDao.save(course);
	}
	//找課程商品圖片
	public Course getCoursePicById(Integer id) {
		Optional<Course> op = courseDao.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	//找所有商品for後端使用
	public List<Course> findAllCourse(){
		return courseDao.findAll();
	}
	
	//找所有上架中的商品
	public List<Course> findCourseByOn(){
		 List<Course> courseList = courseDao.findCourseByOnOrOff(1);
		 return courseList;
	}
	
	//找對應的學級商品
	public List<Course> findCourseByGrade(String grade){
		return courseDao.findCourseByGrade(grade,1);
	}
	
	//找對應的主科商品
	public List<Course> findCourseBySubject(String subject){
		return courseDao.findCourseBySubject(subject,1);
	}
	
	//找對應的主科商品
	public List<Course> findCourseByCategory(String category){
		return courseDao.findCourseByCategory(category,1);
	}
	
	//找單筆商品ById
	public Optional<Course> findCourseById(Integer id) {

		return courseDao.findById(id);
	}
	
	//課程方案多選處理(模糊查詢)
	public List<Course> findCourseByKeyWord
	(String courseSubject,String courseGrade,String courseCategory){
		return courseDao.findByLike(courseSubject, courseGrade, courseCategory);
	}
	
	//課程模糊搜尋1
	public List<Course> findByCourseCategoryContaing(String courseCategory){
		return courseDao.findByCourseCategoryContaining(courseCategory);
	}
	//課程模糊搜尋2
	public List<Course> findByCourseSubjectContaing(String courseSubject){
		return courseDao.findByCourseSubjectContaining(courseSubject);
	}
	//課程模糊搜尋3
	public List<Course> findByCourseGradeContaing(String courseGrade){
		return courseDao.findByCourseGradeContaining(courseGrade);
	}
	//課程模糊搜尋4
	public List<Course> findByCourseSemesterContaing(String courseSemester){
		return courseDao.findByCourseSemesterContaining(courseSemester);
	}
	
	//課程模糊搜尋5
	public List<Course> findByCourseOnOffIsAndCourseSemesterContainingOrCourseOnOffIsAndCourseCategoryContainingOrCourseOnOffIsAndCourseSubjectContainingOrCourseOnOffIsAndCourseGradeContaining(Integer courseOnOff1,String courseSemester,Integer courseOnOff2,String courseCategory,Integer courseOnOff3,String courseSubject,Integer courseOnOff4,String courseGrade){
		return courseDao.findByCourseOnOffIsAndCourseSemesterContainingOrCourseOnOffIsAndCourseCategoryContainingOrCourseOnOffIsAndCourseSubjectContainingOrCourseOnOffIsAndCourseGradeContaining(courseOnOff1,courseSemester,courseOnOff2,courseCategory,courseOnOff3,courseSubject,courseOnOff4,courseGrade);
	}
	
//	//課程方案多選處理(模糊查詢)
//	public List<Course> findCourseByKeyWord
//	(String courseSubject1,String courseSubject2,String courseSubject3,String courseGrade1,String courseGrade2,String courseGrade3,String courseCategory1,String courseCategory2){
//		return courseDao.findByLike2(courseSubject1, courseSubject2, courseSubject3, courseGrade1, courseGrade2, courseGrade3, courseCategory1, courseCategory2);
//	}
	
}
