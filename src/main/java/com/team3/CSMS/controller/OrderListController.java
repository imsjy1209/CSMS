package com.team3.CSMS.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

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
		
		//找全部訂單資訊-ajax-依照OrderDate降序
		@GetMapping("/findAllByOrderByOrderDateDesc.controller")
		public @ResponseBody List<OrderList> findAllByOrderByOrderDateDesc(Model model) {
			 List<OrderList> orderListList = orderListService.findAllByOrderByOrderDateDesc();
			 return orderListList;
		}
		
		//找全部訂單資訊-ajax-依照OrderDate升序
		@GetMapping("/findAllByOrderByOrderDateAsc.controller")
		public @ResponseBody List<OrderList> findAllByOrderByOrderDateAsc(Model model) {
			 List<OrderList> orderListList = orderListService.findAllByOrderByOrderDateAsc();
			 return orderListList;
		}
		
		//找全部訂單資訊-ajax-依照OrderListId升序
		@GetMapping("/findAllByOrderByIdAsc.controller")
		public @ResponseBody List<OrderList> findAllByOrderByIdAsc(Model model) {
			 List<OrderList> orderListList = orderListService.findAllByOrderByIdAsc();
			 return orderListList;
		}
		
		//找全部訂單資訊-ajax-依照OrderListId降序
		@GetMapping("/findAllByOrderByIdDesc.controller")
		public @ResponseBody List<OrderList> findAllByOrderByIdDesc(Model model) {
			 List<OrderList> orderListList = orderListService.findAllByOrderByIdDesc();
			 return orderListList;
		}
		
	//刪除一筆OrderList-ajax
		@GetMapping("/deleteOrderListByIdAjax.controller")
		public @ResponseBody void deleteOrderListByIdAjax(@RequestParam("orderListId")Integer orderListId) {
			 OrderList oneOrderList = orderListService.findOrderListById(orderListId);
			 oneOrderList.setStudent(null);
			 orderListService.deleteOrderListByEntity(oneOrderList);
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
		
	//==================轉向綠界==================
		@GetMapping("/changeToEcpayPage.controller")
	    @ResponseBody
	    public String testEcpay(@RequestParam(name="amount")String amount) {

	        AllInOne all = new AllInOne(" ");
			AioCheckOutALL obj = new AioCheckOutALL();
			
			UUID uid = UUID.randomUUID();
			obj.setMerchantTradeNo(uid.toString().replaceAll("-", "").substring(0, 20));
//			obj.setMerchantTradeNo("testComp12enenenen2");
			
			Date dNow = new Date( );
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy/MM/dd hh:mm:ss");			
			obj.setMerchantTradeDate(ft.format(dNow));
//			obj.setMerchantTradeDate("2017/01/01 08:05:23");
			
			obj.setTotalAmount(amount);
//			obj.setTotalAmount("50");
			
			obj.setTradeDesc("test Description");
			obj.setItemName("TestItem");
			
			
			// ============跳轉頁面待更新==============
			obj.setReturnURL("http://localhost:8081/CSMS/");
			obj.setNeedExtraPaidInfo("N");
			obj.setClientBackURL("http://localhost:8081/CSMS/courseAllOnPageAjax.page");
			String form = all.aioCheckOut(obj, null);
			
			
			
			return form;
	    }
		
		

}
