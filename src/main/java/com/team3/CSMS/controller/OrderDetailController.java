package com.team3.CSMS.controller;

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
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.OrderList;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.ClassListService;
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
	
	@Autowired
	private ClassListService classListService;
	
	//刪除訂單明細ById
	@GetMapping("/deleteOrderDetailByIdAjax.controller")
	public @ResponseBody void deleteOrderDetailByIdAjax(@RequestParam(name="id")Integer id) {
		orderDetailService.deleteOrderDetailById(id);
	}
	
	
	
	//依據學生id找尚未結帳(OrderList值為null)的訂單明細
	@GetMapping("/findOrderDetailListByIdAndOrderListValueIsNullAjax.controller")
	public String findOrderDetailListByIdAndOrderListValueIsNull(@RequestParam(name="id")Integer id,Model model){
		List<OrderDetail> orderDetailList = orderDetailService.findOrderDetailListByIdAndOrderListValueIsNull(id);
		model.addAttribute(orderDetailList);
		return "cs_orderPage/orderPage";
	}
	
	//=======更新OrderDetail資料-不購買Ajax(Revise confirmOrder from 0 to 1)============
	@ResponseBody
	@GetMapping("/updateOrderDetailDataOnlyOne.controller")
	public void updateOrderDetailDataOnlyOne(@RequestParam (name="orderId")Integer orderId){
		OrderDetail oneOrderDetail = orderDetailService.findOrderDetailById(orderId);
		oneOrderDetail.setConfirmOrder(1);
		orderDetailService.insertOrderDetail(oneOrderDetail);
	}
	
	//=======更新OrderDetail資料-待確認Ajax(Revise confirmOrder from 1 to 0)============
	@ResponseBody
	@GetMapping("/updateOrderDetailDataOnlyOne2.controller")
	public void updateOrderDetailDataOnlyOne2(@RequestParam (name="orderId")Integer orderId){
		OrderDetail oneOrderDetail = orderDetailService.findOrderDetailById(orderId);
		oneOrderDetail.setConfirmOrder(0);
		orderDetailService.insertOrderDetail(oneOrderDetail);
	}
	
	
	//批量更新orderDetail資料(Revise confirmOrder from 0 to 2)And OrderList資料
	@ResponseBody
	@PostMapping("/updateOrderListAndOrderDetailData.controller")
	public void updateOrderListAndOrderDetailData
	(@RequestBody List<OrderDetailDto> orderDetailDtoList,@RequestParam(name="amount")Integer amount,@RequestParam(name="payment")String payment,@RequestParam(name="studentId")Integer studentId){
		System.out.println("studentId=" + studentId);
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
			Optional<Course> oneCourseOpt = courseService.findCourseById(userCourseId);
			Course oneCourse = oneCourseOpt.get();
			int oneCourseMember = oneCourse.getCourseMember();
			if(oneCourseMember-1 != 0) {
				oneCourse.setCourseMember(oneCourseMember-1);
				courseService.insertCourse(oneCourse);
				
				ClassList oneClassList = classListService.findClassListByCourseId(userCourseId);
				oneClassList.setClassMember(oneClassList.getClassMember()+1);
				classListService.insertClassList(oneClassList);
			}else {
				System.out.println("已額滿");
			}
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
				
		//========find OrderDetail By Id And ConfirmOrder Is 2===========		
				@GetMapping(value ="/findByStudentIsAndConfirmOrderIsAjax.controller")
				public @ResponseBody List<OrderDetail> findByStudentIsAndConfirmOrderIsAjax(@RequestParam(name="stuIdForFindAlreadyBuy")Integer stuIdForFindAlreadyBuy) {
					Student oneStudent = studentService.findStudentById(stuIdForFindAlreadyBuy);
					 List<OrderDetail> orderDetailList = orderDetailService.findByStudentIsAndConfirmOrderIs(oneStudent,2);
					 return orderDetailList;
				}	
				
				
				
				
	
}
