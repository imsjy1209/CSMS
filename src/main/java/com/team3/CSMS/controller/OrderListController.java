package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.OrderList;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.OrderListService;
import com.team3.CSMS.service.StudentService;

@Controller
public class OrderListController {
	
	@Autowired
	private OrderListService orderListService;
	
	@Autowired
	private StudentService studentService;
	
	//找全部訂單資訊
		@GetMapping("/findAllOrderList.controller")
		public String findAllOrderList(Model model) {
			 List<OrderList> orderListList = orderListService.findAllOrderList();
			 model.addAttribute("orderListList", orderListList);
			 return "cs_orderList/orderListIndex";
		}
	//找全部訂單資訊-ajax
		@GetMapping("/findAllOrderListAjax.controller")
		public @ResponseBody List<OrderList> findAllOrderListAjax(Model model) {
			 List<OrderList> orderListList = orderListService.findAllOrderList();
			 return orderListList;
		}	
	//完成訂單(新增一筆付款完成的交易)
		@GetMapping("/insertOrderList.controller")
		public void insertOrderList
		(@RequestParam(name="amount")Integer amount,@RequestParam(name="studentId")Integer studentId,@RequestParam(name="payment")String payment) {
			OrderList newOrderList = new OrderList();
			
			Student oneStudent = studentService.findStudentById(studentId);
			
			newOrderList.setStudent(oneStudent);
			newOrderList.setAmount(amount);
			newOrderList.setPayment(payment);
			
			orderListService.insertOrderList(newOrderList);
		}

}
