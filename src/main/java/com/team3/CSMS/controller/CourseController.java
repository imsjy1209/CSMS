package com.team3.CSMS.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.service.CourseService;


@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	//刪除Course資料
		@GetMapping("/deleteCourseData.controller")
		public String deleteCourse(@RequestParam(name="id") Integer id, Model model) {
			Optional<Course> oneCourse = courseService.findCourseById(id);
			Course courseForDelete = oneCourse.get();
			courseService.deleteCourse(courseForDelete);
			return "redirect:/courseAllPageBackAjax.page";
		}
	//更改Course上下架資料
		@GetMapping("/updateCourseDataOnOrOff.controller")
		public @ResponseBody void updateCourseDataOnOrOff(@RequestParam(name="id") Integer id,@RequestParam(name="onOrOff") Integer onOrOff, Model model) {
			Optional<Course> oneCourse = courseService.findCourseById(id);
			Course courseForUpdataOnOrOff = oneCourse.get();
			courseForUpdataOnOrOff.setCourseOnOff(onOrOff);
			courseService.insertCourse(courseForUpdataOnOrOff);
		}	
	
	
	//更改Course資料1
	@GetMapping("/updateCourseData1.controller")
	public String getCourseForUpdate(@RequestParam(name="id") Integer id, Model model) {
		Optional<Course> oneCourse = courseService.findCourseById(id);
		Course courseForUpdate = oneCourse.get();
		model.addAttribute("courseForUpdate",courseForUpdate);
		return "cs_course/courseEdit";
	}
	
	//更改Course資料2
		@PostMapping("updateCourseData2.controller")
		public String updateCourseAction(
				@RequestParam(name="id", required = true) int id,
				@RequestParam(name="courseYear", required = true) int courseYear,
				@RequestParam(name="courseSemester", required = true) String courseSemester,
				@RequestParam(name="courseCategory", required = true) String courseCategory,
				@RequestParam(name="courseSubject", required = true) String courseSubject,
				@RequestParam(name="courseGrade", required = true) String courseGrade,
				@RequestParam(name="courseClass", required = true) int courseClass,
				@RequestParam(name="coursePrice", required = true) int coursePrice,
				@RequestParam(name="courseTeachTime", required = true) String courseTeachTime,
				@RequestParam(name="courseMember", required = true) int courseMember,
				@RequestParam(name="startDate", required = true) Date startDate,
				@RequestParam(name="endDate", required = true) Date endDate,
				@RequestParam(name="courseOnOff", required = true) int courseOnOff,
				@RequestParam(name="coursePic") MultipartFile file,RedirectAttributes redirectAttributes){
			Optional<Course> oldCourse = courseService.findCourseById(id);
			Course oneCourse = oldCourse.get();
			try {
				oneCourse.setCourseCategory(courseCategory);
				oneCourse.setCourseClass(courseClass);
				oneCourse.setCourseGrade(courseGrade);
				oneCourse.setCourseMember(courseMember);
				oneCourse.setCourseOnOff(courseOnOff);
				oneCourse.setCoursePrice(coursePrice);
				oneCourse.setCourseSemester(courseSemester);
				oneCourse.setCourseSubject(courseSubject);
				oneCourse.setCourseTeachTime(courseTeachTime);
				oneCourse.setCourseYear(courseYear);
				oneCourse.setEndDate(endDate);
				oneCourse.setStartDate(startDate);
				
				
				//圖片轉base64
				if(!file.isEmpty() && file != null) {
					byte[] bytes = file.getBytes();
					byte[] encodeBase64 = Base64.encodeBase64(bytes);
					String base64Encoded = new String(encodeBase64,"UTF-8");
					oneCourse.setCoursePic(base64Encoded);
				}
				courseService.insertCourse(oneCourse);
				return "redirect:/courseAllPageBackAjax.page";
			} catch (IOException e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
				return "redirect:/courseAllPageBackAjax.page";
			}
		}
	
	//課程方案建立Course
	@PostMapping("courseDataCreate.controller")
	public String courseCreateAction(
			@RequestParam(name="courseYear", required = true) int courseYear,
			@RequestParam(name="courseSemester", required = true) String courseSemester,
			@RequestParam(name="courseCategory", required = true) String courseCategory,
			@RequestParam(name="courseSubject", required = true) String courseSubject,
			@RequestParam(name="courseGrade", required = true) String courseGrade,
			@RequestParam(name="courseClass", required = true) int courseClass,
			@RequestParam(name="coursePrice", required = true) int coursePrice,
			@RequestParam(name="courseTeachTime", required = true) String courseTeachTime,
			@RequestParam(name="courseMember", required = true) int courseMember,
			@RequestParam(name="startDate", required = true) Date startDate,
			@RequestParam(name="endDate", required = true) Date endDate,
			@RequestParam(name="courseOnOff", required = true) int courseOnOff,
			@RequestParam(name="coursePic") MultipartFile file,RedirectAttributes redirectAttributes){
		Course course1 = new Course();
		try {
			course1.setCourseCategory(courseCategory);
			course1.setCourseClass(courseClass);
			course1.setCourseGrade(courseGrade);
			course1.setCourseMember(courseMember);
			course1.setCourseOnOff(courseOnOff);
			course1.setCoursePrice(coursePrice);
			course1.setCourseSemester(courseSemester);
			course1.setCourseSubject(courseSubject);
			course1.setCourseTeachTime(courseTeachTime);
			course1.setCourseYear(courseYear);
			course1.setEndDate(endDate);
			course1.setStartDate(startDate);
			
			
			//圖片轉base64
			if(!file.isEmpty() && file != null) {
				byte[] bytes = file.getBytes();
				byte[] encodeBase64 = Base64.encodeBase64(bytes);
				String base64Encoded = new String(encodeBase64,"UTF-8");
				course1.setCoursePic(base64Encoded);
			}
			courseService.insertCourse(course1);
			return "redirect:/courseCreate.page";
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
			return "redirect:/courseCreate.page";
		}
	}
	
	//商品總total頁面(for後台)--Ajax
	@GetMapping("/AllCourseBackAjax.page")
	public @ResponseBody List<Course> findAllCourse(Model model) {
		List<Course> courseList = courseService.findAllCourse();
		return courseList;
	}
	
	
	//商品總total頁面(for前台)--Ajax
	@GetMapping("/AllOnCourseAjax.page")
	public @ResponseBody List<Course> findAllOnCourse() {
		List<Course> courseList = courseService.findCourseByOn();
		return courseList;
	}
	
	//商品總total頁面--以學級(小學/國中/高中)篩選(for前台)--Ajax
	@GetMapping("/findAllCourseByGradeAjax.page")
	public @ResponseBody List<Course> findAllCourseByGrade(@RequestParam(name="grade")String grade,Model model) {
		List<Course> courseList = courseService.findCourseByGrade(grade);
		return courseList;
	}
	
	//商品總total頁面--以科目(國/英/數)篩選(for前台)--Ajax
	@GetMapping("/findAllCourseBySubjectAjax.page")
	public @ResponseBody List<Course> findCourseBySubject(@RequestParam(name="subject")String subject,Model model) {
		List<Course> courseList = courseService.findCourseBySubject(subject);
		return courseList;
	}
	
	//商品總total頁面--以類型(日常/衝刺)篩選(for前台)--Ajax
	@GetMapping("/findAllCourseByCategoryAjax.page")
	public @ResponseBody List<Course> findCourseByCategory(@RequestParam(name="category")String category,Model model) {
		List<Course> courseList = courseService.findCourseByCategory(category);
		return courseList;
	}
	
	
	
//	//商品總total頁面(for前台)
//	@GetMapping("/AllOnCourse.page")
//	public String findAllOnCourse(Model model) {
//		List<Course> courseList = courseService.findCourseByOn();
//		model.addAttribute("courseList",courseList);
//		return "cramschool/courseIndex";
//	}
	
//	//商品總total頁面--圖片(for前台)
//	@GetMapping("AllOnCoursePic/{id}")
//	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id){
//		Course Course1 = courseService.getCoursePicById(id);
//		byte[] photoFile = Course1.getCoursePic();
//		
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_JPEG);
//		// 資料, header, HttpStatus
//		return new ResponseEntity<byte[]>(photoFile, headers, HttpStatus.OK);
//	}

}
