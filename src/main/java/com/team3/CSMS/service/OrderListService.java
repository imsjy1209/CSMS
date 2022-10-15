package com.team3.CSMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.OrderListDao;
import com.team3.CSMS.model.OrderList;

@Service
@Transactional
public class OrderListService {
	
	@Autowired
	private OrderListDao orderListDao;

	// 找所有訂單紀錄OrderList
	public List<OrderList> findAllOrderList() {
		List<OrderList> orderListList = orderListDao.findAll();
		return orderListList;
	}
	
	//完成訂單(新增一筆付款完成的交易)
	public void insertOrderList(OrderList orderList) {
		orderListDao.save(orderList);
	}

}
