package com.team3.CSMS.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.CSMS.dto.SessionForCourseDto;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.Room;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.CourseService;
import com.team3.CSMS.service.OrderDetailService;
import com.team3.CSMS.service.RoomService;
import com.team3.CSMS.service.SchoolService;
import com.team3.CSMS.service.StudentService;
import com.team3.CSMS.service.TeacherService;

@SessionAttributes(names = {"shoppingCart"})
@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private ClassListService classListService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private StudentService studentService;
	
	//刪除Course資料
		@GetMapping("/deleteCourseData.controller")
		public String deleteCourse(@RequestParam(name="id") Integer id, Model model) {
			Optional<Course> oneCourse = courseService.findCourseById(id);
			Course courseForDelete = oneCourse.get();
			courseService.deleteCourse(courseForDelete);
			return "redirect:/courseAllPageBackAjax.page";
		}
		

		
		
		//刪除Course資料-ajax
		@GetMapping("/deleteCourseDataAjax.controller")
		public @ResponseBody void deleteCourseDataAjax(@RequestParam(name="id") Integer id, Model model) {
			ClassList oneClassList = classListService.findClassListByCourseId(id);
			oneClassList.setCourse(null);
			oneClassList.setRoom(null);
			oneClassList.setSchool(null);
			oneClassList.setTeacher(null);
			classListService.deleteClassList(oneClassList);
			
			Optional<Course> oneCourse = courseService.findCourseById(id);
			Course courseForDelete = oneCourse.get();
			courseService.deleteCourse(courseForDelete);
		}
	//更改Course上下架資料
		@GetMapping("/updateCourseDataOnOrOff.controller")
		public @ResponseBody void updateCourseDataOnOrOff(@RequestParam(name="id") Integer id,@RequestParam(name="onOrOff") Integer onOrOff, Model model) {
			Optional<Course> oneCourse = courseService.findCourseById(id);
			Course courseForUpdataOnOrOff = oneCourse.get();
			courseForUpdataOnOrOff.setCourseOnOff(onOrOff);
			courseService.insertCourse(courseForUpdataOnOrOff);
		}
		//更改Course授課日期資料
		@GetMapping("/updateCourseTeachTime.controller")
		public @ResponseBody void updateCourseTeachTime(@RequestParam(name="id") Integer id,@RequestParam(name="teachTime") String teachTime, Model model) {
			Optional<Course> oneCourse = courseService.findCourseById(id);
			Course courseForUpdataOnOrOff = oneCourse.get();
			courseForUpdataOnOrOff.setCourseTeachTime(teachTime);
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
		
		
		
		//===================Update Course資料-Ajax==================
				@PostMapping("/updateCourseDataAjax.controller")
				public @ResponseBody void updateCourseDataAjax(Course oneCourse){
					System.out.println(oneCourse.getStartDate());
					System.out.println(oneCourse.getEndDate());
						courseService.insertCourse(oneCourse);
				}	
				
		//===================Create Course資料-Ajax==================
				@PostMapping("/createCourseDataAjax.controller")
				public @ResponseBody void createCourseDataAjax(@RequestParam(name="courseYear") int courseYear,
						@RequestParam(name="courseSemester") String courseSemester,
						@RequestParam(name="courseCategory") String courseCategory,
						@RequestParam(name="courseSubject") String courseSubject,
						@RequestParam(name="courseGrade") String courseGrade,
						@RequestParam(name="courseClass") int courseClass,
						@RequestParam(name="coursePrice") int coursePrice,
						@RequestParam(name="courseTeachTime") String courseTeachTime,
						@RequestParam(name="courseMember") int courseMember,
						@RequestParam(name="startDate") Date startDate,
						@RequestParam(name="endDate") Date endDate,
						@RequestParam(name="courseOnOff") int courseOnOff
//						@RequestParam(name="coursePic") String coursePic
						){
					System.out.println("ttttttttttttttttt");
					Course course1 = new Course();
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
//					course1.setCoursePic(coursePic);
						courseService.insertCourse(course1);
				}	
	
	//建立Course方案+ClassList
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
		System.out.println(startDate);
		System.out.println(endDate);
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
			
			String classCode = "";
			if(courseSubject.equals("國文")) {
				
				classCode += "CH" + courseYear;
				System.out.println(classCode);
				ClassList oneClassList = classListService.findLatestClassListByClassCode(classCode);
				String firstClassCodeStr = oneClassList.getClassCode();
				String oldClassCodeStr = firstClassCodeStr.substring(6);
				Integer newClassCode = Integer.valueOf(oldClassCodeStr);
				classCode += "0" + (newClassCode+1);
			}	
			else if(courseSubject.equals("英文")){
				classCode += "EN" + courseYear;
				System.out.println(classCode);
				ClassList oneClassList = classListService.findLatestClassListByClassCode(classCode);
				String firstClassCodeStr = oneClassList.getClassCode();
				String oldClassCodeStr = firstClassCodeStr.substring(6);
				Integer newClassCode = Integer.valueOf(oldClassCodeStr);
				classCode += "0" + (newClassCode+1);
			}
			
			else if(courseSubject.equals("數學")) {
				classCode += "MA" + courseYear;
				System.out.println(classCode);
				ClassList oneClassList = classListService.findLatestClassListByClassCode(classCode);
				String firstClassCodeStr = oneClassList.getClassCode();
				String oldClassCodeStr = firstClassCodeStr.substring(6);
				Integer newClassCode = Integer.valueOf(oldClassCodeStr);
				classCode += "0" + (newClassCode+1);
				
			}
				Room oneRoom = roomService.findRoomById(4);
				School oneSchool = schoolService.findSchoolById(1);
				Teacher oneTeacher = teacherService.findTeacherById(1);
				
				ClassList newClassList = new ClassList();
				newClassList.setClassCode(classCode);
				newClassList.setClassMember(0);
				newClassList.setRoom(oneRoom);
				newClassList.setSchool(oneSchool);
				newClassList.setTeacher(oneTeacher);
				newClassList.setCourse(course1);
				classListService.insertClassList(newClassList);
			
			return "redirect:/courseCreate.page";
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
			return "redirect:/courseCreate.page";
		}
	}
	
	//建立Course方案+ClassList
		@PostMapping("/courseDataCreate2.controller")
		public String courseDataCreate2(
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
			System.out.println(startDate);
			System.out.println(endDate);
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
				
				String classCode = "";
				if(courseSubject.equals("國文")) {
					
					classCode += "CH" + courseYear;
					System.out.println(classCode);
					ClassList oneClassList = classListService.findLatestClassListByClassCode(classCode);
					String firstClassCodeStr = oneClassList.getClassCode();
					String oldClassCodeStr = firstClassCodeStr.substring(6);
					Integer newClassCode = Integer.valueOf(oldClassCodeStr);
					classCode += "0" + (newClassCode+1);
				}	
				else if(courseSubject.equals("英文")){
					classCode += "EN" + courseYear;
					System.out.println(classCode);
					ClassList oneClassList = classListService.findLatestClassListByClassCode(classCode);
					String firstClassCodeStr = oneClassList.getClassCode();
					String oldClassCodeStr = firstClassCodeStr.substring(6);
					Integer newClassCode = Integer.valueOf(oldClassCodeStr);
					classCode += "0" + (newClassCode+1);
				}
				
				else if(courseSubject.equals("數學")) {
					classCode += "MA" + courseYear;
					System.out.println(classCode);
					ClassList oneClassList = classListService.findLatestClassListByClassCode(classCode);
					String firstClassCodeStr = oneClassList.getClassCode();
					String oldClassCodeStr = firstClassCodeStr.substring(6);
					Integer newClassCode = Integer.valueOf(oldClassCodeStr);
					classCode += "0" + (newClassCode+1);
					
				}
					Room oneRoom = roomService.findRoomById(4);
					School oneSchool = schoolService.findSchoolById(1);
					Teacher oneTeacher = teacherService.findTeacherById(1);
					
					ClassList newClassList = new ClassList();
					newClassList.setClassCode(classCode);
					newClassList.setClassMember(0);
					newClassList.setRoom(oneRoom);
					newClassList.setSchool(oneSchool);
					newClassList.setTeacher(oneTeacher);
					newClassList.setCourse(course1);
					classListService.insertClassList(newClassList);
				
				return "redirect:/courseAllPageBackAjax.page";
			} catch (IOException e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("errorMsg", "上傳失敗，請重新上傳");
				return "redirect:/courseAllPageBackAjax.page";
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
	
	//======Super Cool~~~~~~~~=====商品總total頁面-移除該學生已購買過的商品(for前台)--Ajax===========
	@PostMapping("/AllOnCourseExceptAlreadyBuyAjax.controller")
	public @ResponseBody List<Course> AllOnCourseExceptAlreadyBuyAjax(@RequestParam(name="stuIdForFindAlreadyBuy")Integer stuIdForFindAlreadyBuy) {
		
		List<Course> courseList = courseService.findCourseByOn();
		
		
		Student oneStudent = studentService.findStudentById(stuIdForFindAlreadyBuy);
		
		//======抓出該學生已經購買過的商品============
		List<OrderDetail> orderDetailList = orderDetailService.findByStudentIsAndConfirmOrderIs(oneStudent, 2);
		
		//=====將total商品list移除已購買過的商品=====
		for(OrderDetail oneOrderDetail:orderDetailList) {
			Course oneCourse = oneOrderDetail.getCourse();
			courseList.removeIf(o->oneCourse==o);
		}
		
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
//	@GetMapping("/findAllCourseByCategoryAjax.page")
//	public @ResponseBody List<Course> findCourseByCategory(@RequestParam(name="category")String category,Model model,@RequestParam(name="stuIdForFindAlreadyBuy")Integer stuIdForFindAlreadyBuy) {
//		
//		List<Course> courseList = courseService.findCourseByCategory(category);
//		
//		Student oneStu = studentService.findStudentById(stuIdForFindAlreadyBuy);
//		List<OrderDetail> ordList = orderDetailService.findByStudentIsAndConfirmOrderIs(oneStu, 2);
//		for(OrderDetail oneOrd:ordList) {
//			Course aCourse = oneOrd.getCourse();
//			courseList.removeIf(o->aCourse==o);
//		}
//		return courseList;
//	}
	
	//商品總total頁面--以多選關鍵字搜尋(for前台)--Ajax
	@GetMapping("/findAllCourseByKeyWordAjax.controller")
	public @ResponseBody List<Course> findAllCourseByKeyWordAjax
	(@RequestParam(name="cs")String cs,@RequestParam(name="cg")String cg,@RequestParam(name="cc")String cc,@RequestParam(name="stuIdForFindAlreadyBuy")Integer stuIdForFindAlreadyBuy) {
		String newCS = "%"+cs+"%";
		String newCG = "%"+cg+"%";
		String newCC = "%"+cc+"%";
		
		List<Course> courseList = courseService.findCourseByKeyWord(newCS,newCG,newCC);
		
		Student oneStu = studentService.findStudentById(stuIdForFindAlreadyBuy);
		List<OrderDetail> ordList = orderDetailService.findByStudentIsAndConfirmOrderIs(oneStu, 2);
		for(OrderDetail oneOrd:ordList) {
			Course aCourse = oneOrd.getCourse();
			courseList.removeIf(o->aCourse==o);
		}
		
		return courseList;
	}
	
	//商品總total頁面--以單一關鍵字搜尋(for前台)--Ajax
	@GetMapping("/findAllCourseByMoHuAjax.controller")
	public @ResponseBody List<Course> findAllCourseByMoHuAjax(@RequestParam(name="mohu")String mohu,@RequestParam(name="stuIdForFindAlreadyBuy")Integer stuIdForFindAlreadyBuy) {
		
		List<Course> mohuList1 = courseService.findByCourseOnOffIsAndCourseSemesterContainingOrCourseOnOffIsAndCourseCategoryContainingOrCourseOnOffIsAndCourseSubjectContainingOrCourseOnOffIsAndCourseGradeContaining(1,mohu,1,mohu,1,mohu,1,mohu);
		
		Student oneStu = studentService.findStudentById(stuIdForFindAlreadyBuy);
		List<OrderDetail> ordList = orderDetailService.findByStudentIsAndConfirmOrderIs(oneStu, 2);
		for(OrderDetail oneOrd:ordList) {
			Course aCourse = oneOrd.getCourse();
			mohuList1.removeIf(o->aCourse==o);
		}
		
		
		return mohuList1;
	}
	
	//===find Course By Id====
	@GetMapping("/findCourseByIdAjax.controller")
	public @ResponseBody Course findCourseByIdAjax(@RequestParam(name="courseIdFromSession")Integer courseIdFromSession) {
		Optional<Course> aCourse = courseService.findCourseById(courseIdFromSession);
		Course oneCourseForSession = aCourse.get();
		return oneCourseForSession;
	}
	
	//====購物車暫存Session==============
	List<SessionForCourseDto> sessionList = new ArrayList<SessionForCourseDto>();
	
	@ResponseBody
	@PostMapping("/shoppingCartSession.controller")
	public void shoppingCartSession
	(@RequestParam(name="course_id")String course_id,@RequestParam(name="stuIdForSession")String stuIdForSession,Model m) {
		SessionForCourseDto oneSessionForCourse = new SessionForCourseDto();
		
		oneSessionForCourse.setCourse_id(Integer.valueOf(course_id));
		oneSessionForCourse.setStuIdForSession(Integer.valueOf(stuIdForSession));
		
		sessionList.add(oneSessionForCourse);
		
		for(SessionForCourseDto oneSession :sessionList) {
			System.out.println(oneSession.getCourse_id());
		}
		
		m.addAttribute("shoppingCart",sessionList);
	}
	
	//=====移除Session裡面的Course===========
	@ResponseBody
	@PostMapping("/removeShoppingCartSession.controller")
	public void shoppingCartSessionForRemove(@RequestParam(name="course_id")String course_id,@RequestParam(name="stuIdForSession")String stuIdForSession,Model m) {
		System.out.println("=======================");
		System.out.println(course_id);
		System.out.println(stuIdForSession);
		System.out.println("=======================");
		
		List<SessionForCourseDto> sessionList = (List<SessionForCourseDto>) m.getAttribute("shoppingCart");
		System.out.println(sessionList);
		
		for(SessionForCourseDto oneSessionForRemove :sessionList) {
			if(oneSessionForRemove.getCourse_id().equals(Integer.valueOf(course_id))) {
				System.out.println("idEach="+oneSessionForRemove.getCourse_id());
				System.out.println("idForR="+Integer.valueOf(course_id));
				sessionList.remove(oneSessionForRemove);
			}
			
		}
		
	}
	
	
	//新增訂單明細
		@GetMapping("/orderDetailCreateAjax.controller")
		public @ResponseBody void orderDetailCreateAjax
		(@RequestParam(name="courseId")Integer courseId,@RequestParam(name="studentId")Integer studentId,SessionStatus sessionStatus) {
			
//			System.out.println();
//			System.out.println(courseId);
//			System.out.println(studentId);
			
			Student oneStuden = studentService.findStudentById(studentId);
			Optional<Course> aCourseOptional = courseService.findCourseById(courseId);
			Course oneCourse = aCourseOptional.get();
			
			OrderDetail newOD = new OrderDetail();
			newOD.setCourse(oneCourse);
			newOD.setStudent(oneStuden);
			newOD.setOrderList(null);
			newOD.setArrangeClassList(0);
			newOD.setConfirmOrder(0);
			
			orderDetailService.insertOrderDetail(newOD);
			
			sessionStatus.setComplete();
			
		}


}
