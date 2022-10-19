package com.team3.CSMS.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.team3.CSMS.dto.OrderDetailDto;
import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.OrderList;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.CourseService;
import com.team3.CSMS.service.OrderDetailService;
import com.team3.CSMS.service.OrderListService;
import com.team3.CSMS.service.StudentService;

@Controller
public class OrderDetailController {
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private OrderListService orderListService;
	
	@Autowired
	private CourseService courseService;
	
	//刪除訂單明細ById
	@GetMapping("/deleteOrderDetailByIdAjax.controller")
	public @ResponseBody void deleteOrderDetailByIdAjax(@RequestParam(name="id")Integer id) {
		orderDetailService.deleteOrderDetailById(id);
	}
	
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
		newOD.setArrangeClassList(0);
		newOD.setConfirmOrder(0);
		
		orderDetailService.insertOrderDetail(newOD);
	}
	
	//依據學生id找尚未結帳(OrderList值為null)的訂單明細
	@GetMapping("/findOrderDetailListByIdAndOrderListValueIsNullAjax.controller")
	public String findOrderDetailListByIdAndOrderListValueIsNull(@RequestParam(name="id")Integer id,Model model){
		List<OrderDetail> orderDetailList = orderDetailService.findOrderDetailListByIdAndOrderListValueIsNull(id);
		model.addAttribute(orderDetailList);
		return "cs_orderPage/orderPage";
	}
	
	
	//批量更新orderDetail資料(Revise confirmOrder from 0 to 2)And OrderList資料
	@ResponseBody
	@PostMapping("/updateOrderListAndOrderDetailData.controller")
	public void updateOrderListAndOrderDetailData
	(@RequestBody List<OrderDetailDto> orderDetailDtoList,@RequestParam(name="amount")Integer amount,@RequestParam(name="payment")String payment,@RequestParam(name="studentId")Integer studentId){
		
		Student oneStudent = studentService.findStudentById(studentId);
		Date date = new Date();
		
		OrderList newOrderList = new OrderList();
		
		newOrderList.setAmount(amount);
		newOrderList.setPayment(payment);
		newOrderList.setOrderDate(date);
		newOrderList.setStudent(oneStudent);

		orderListService.insertOrderList(newOrderList);
		
		for(OrderDetailDto oneOrderDetailDto:orderDetailDtoList) {
			Integer userODId = oneOrderDetailDto.getoDId();
			Integer userCourseId = oneOrderDetailDto.getCourseInfoId();
			Integer userStudentId = oneOrderDetailDto.getStudentId();
			System.out.println("OD:" + userODId + "," + "CourseId:" +userCourseId+ "," + "StudentId:" +userStudentId);
			OrderDetail oneOrderDetail = orderDetailService.findOrderDetailById(userODId);
			oneOrderDetail.setOrderList(newOrderList);
			oneOrderDetail.setConfirmOrder(2);
			
			orderDetailService.insertOrderDetail(oneOrderDetail);
		}
		
	}
	
	//批量更新orderDetail資料-不購買(Revise confirmOrder from 0 to 1)
		@ResponseBody
		@PostMapping("/updateOrderDetailData.controller")
		public void updateOrderDetailData
		(@RequestBody List<OrderDetailDto> orderDetailDtoList){

			for(OrderDetailDto oneOrderDetailDto:orderDetailDtoList) {
				Integer userODId = oneOrderDetailDto.getoDId();
				Integer userCourseId = oneOrderDetailDto.getCourseInfoId();
				Integer userStudentId = oneOrderDetailDto.getStudentId();
				System.out.println("OD:" + userODId + "," + "CourseId:" +userCourseId+ "," + "StudentId:" +userStudentId);
				OrderDetail oneOrderDetail = orderDetailService.findOrderDetailById(userODId);
				oneOrderDetail.setConfirmOrder(1);
				
				orderDetailService.insertOrderDetail(oneOrderDetail);
			}
			
		}
		
		
		//找全部訂單明細
				@GetMapping(value ="/findAllOrderDetail.controller",produces = {"application/json;charset=UTF-8"})
				public @ResponseBody List<OrderDetail> findAllOrderDetail(Model model) {
					 List<OrderDetail> orderDetailList = orderDetailService.findAllOrderDetail();
					 return orderDetailList;
				}
	
}
