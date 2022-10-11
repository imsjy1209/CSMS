package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.OrderList;
import com.team3.CSMS.service.OrderListService;

@Controller
public class OrderListController {
	
	@Autowired
	private OrderListService orderListService;
	
	//找全部班級對應學生清單
		@GetMapping("/findAllOrderList.controller")
		public String findAllOrderList(Model model) {
			 List<OrderList> orderListList = orderListService.findAllOrderList();
			 model.addAttribute("orderListList", orderListList);
			 return "cs_orderList/orderListIndex";
		}
	//找全部班級對應學生清單
		@GetMapping("/findAllOrderListAjax.controller")
		public @ResponseBody List<OrderList> findAllOrderListAjax(Model model) {
			 List<OrderList> orderListList = orderListService.findAllOrderList();
			 return orderListList;
		}	


}
