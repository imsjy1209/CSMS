package com.team3.CSMS.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.Course;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.CourseService;
import com.team3.CSMS.service.OrderDetailService;
import com.team3.CSMS.service.StudentService;

@Controller
public class OrderDetailController {
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;
	
	//新增訂單明細
	@GetMapping("/orderDetailCreateAjax.controller")
	public @ResponseBody void orderDetailCreateAjax
	(@RequestParam(name="courseId")Integer courseId,@RequestParam(name="studentId")Integer studentId) {
		
		System.out.println();
		System.out.println(courseId);
		System.out.println(studentId);
		
		Student oneStuden = studentService.findStudentById(studentId);
		Optional<Course> aCourseOptional = courseService.findCourseById(courseId);
		Course oneCourse = aCourseOptional.get();
		
		OrderDetail newOD = new OrderDetail();
		newOD.setCourse(oneCourse);
		newOD.setStudent(oneStuden);
		newOD.setOrderList(null);
		
		orderDetailService.insertOrderDetail(newOD);
	}
	
	//依據學生id找尚未結帳(OrderList值為null)的訂單明細
	@GetMapping("/findOrderDetailListByIdAndOrderListValueIsNullAjax.controller")
	public String findOrderDetailListByIdAndOrderListValueIsNull(@RequestParam(name="id")Integer id,Model model){
		List<OrderDetail> orderDetailList = orderDetailService.findOrderDetailListByIdAndOrderListValueIsNull(id);
		model.addAttribute(orderDetailList);
		return "cs_orderPage/orderPage";
	}
	
	
			

}
