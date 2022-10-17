package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ClassStudentListService;
import com.team3.CSMS.service.OrderDetailService;
import com.team3.CSMS.service.StudentService;

@Controller
public class ClassStudentListController {
	
	@Autowired
	private ClassStudentListService classStudentListService;
	
	@Autowired
	private ClassListService classListService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	//找全部班級對應學生清單
		@GetMapping("/findAllClassStudentList.controller")
		public String findAllClassStudentList(Model model) {
			 List<ClassStudentList> cslList = classStudentListService.findAllClassStudentList();
			 model.addAttribute("cslList", cslList);
			 return "cs_classStudentList/classStudentListIndex";
		}
	//找全部班級對應學生清單
		@GetMapping(value = "/findAllClassStudentListAjax.controller",produces = {"application/json;charset=UTF-8"})
		public @ResponseBody List<ClassStudentList> findAllClassStudentListAjax(Model model) {
			 List<ClassStudentList> cslList = classStudentListService.findAllClassStudentList();
			 return cslList;
		}
		
		//更新CSL By Id
		@GetMapping(value = "/updateClassStudentListByIdAjax.controller")
		public @ResponseBody void updateClassStudentListByIdAjax
		(@RequestParam(name="newStuNo")Integer newStuNo,@RequestParam(name="cslId")Integer cslId) {
			ClassStudentList oneCSL = classStudentListService.findClassStudentListById(cslId);
			oneCSL.setStudentNo(newStuNo);
			classStudentListService.insertClassStudentList(oneCSL);
		}
		
		//刪除CSL By Id
		@GetMapping(value = "/deleteClassStudentListByIdAjax.controller")
		public @ResponseBody void deleteClassStudentListById(@RequestParam(name="cslId")Integer cslId) {
			System.out.println(cslId);
			classStudentListService.deleteClassStudentListById(cslId);
			System.out.println("delete finished");
		}
		
		//刪除CSL By Entity
		@GetMapping(value = "/deleteClassStudentListByEntityAjax.controller")
		public @ResponseBody void deleteClassStudentListByEntityAjax(@RequestParam(name="cslId")Integer cslId) {
			System.out.println(cslId);
			ClassStudentList oneCSL = classStudentListService.findClassStudentListById(cslId);
			classStudentListService.deleteClassStudentListByEntity(oneCSL);
			System.out.println("delete finished");
		}
		
		
		
	//先從OrderDetail找到CourseId對應的ClassListId後再到ClassStudentList裡面找到對應的學生清單
		@GetMapping("/findClassStudentListByCourseIdAndClassListIdAjax.controller")
		public @ResponseBody void findClassStudentListByCourseIdAndClassListId
		(@RequestParam(name="studentId")Integer studentId,@RequestParam(name="courseId")Integer courseId,@RequestParam(name="orderId")Integer orderId){
			
			System.out.println("================================================");
			System.out.println(orderId);
			OrderDetail oneOrderDetail = orderDetailService.findOrderDetailById(orderId);
			oneOrderDetail.setArrangeClassList(1);
			orderDetailService.insertOrderDetail(oneOrderDetail);
			
			//依據OrderDetail中已購買課程的StudentId及CourseId找到對應的ClassList Bean和Student Bean
			ClassList oneClassList = classListService.findClassListByCourseId(courseId);
			Student oneStudent = studentService.findStudentById(studentId);
			
			//將取得道的Student和ClassList新增到ClassStudentList中
			ClassStudentList newClassStudentList=new ClassStudentList();
			newClassStudentList.setClassList(oneClassList);
			newClassStudentList.setStudent(oneStudent);
			newClassStudentList.setStudentNo(999);
			classStudentListService.insertClassStudentList(newClassStudentList);
			
//			Integer oneClassListId = oneClassList.getId();
//			List<ClassStudentList> cslList = classStudentListService.findClassStudentListByClassListId(oneClassListId);
//			return cslList;
		}
		
	//將OrderDetail中已排課的學生從ClassStudentList中移除，找到CourseId對應的ClassListId後再到ClassStudentList裡面找到對應的學生清單
		@GetMapping("/findClassStudentListByClassListIdAndStudentId.controller")
		public @ResponseBody void findClassStudentListByClassListIdAndStudentId
		(@RequestParam(name="studentId")Integer studentId,@RequestParam(name="courseId")Integer courseId,@RequestParam(name="orderId")Integer orderId){
			
			//將OrderDetail的排課狀態改成未排課(Revise ArrangeClassList from 1 to 0)
			OrderDetail oneOrderDetail = orderDetailService.findOrderDetailById(orderId);
			oneOrderDetail.setArrangeClassList(0);
			orderDetailService.insertOrderDetail(oneOrderDetail);
			
			//透過CourseId找到對應的ClassListId
			ClassList oneClassList = classListService.findClassListByCourseId(courseId);
			Integer oneClassListId = oneClassList.getId();
			
			//透過ClassListId和StudentId刪除對應的ClassStudentList
			ClassStudentList oneClassStudentList = classStudentListService.findClassStudentListByClassListIdAndStudentId(oneClassListId, studentId);
			classStudentListService.deleteClassStudentListByEntity(oneClassStudentList);
			

		
		}
}
