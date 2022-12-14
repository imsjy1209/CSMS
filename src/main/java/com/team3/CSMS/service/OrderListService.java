package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

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
	
	// 找所有訂單紀錄OrderList--依照OrderDate降序o
	public List<OrderList> findAllByOrderByOrderDateDesc() {
		List<OrderList> orderListList = orderListDao.findAllByOrderByOrderDateDesc();
		return orderListList;
	}
	
	// 找所有訂單紀錄OrderList--依照OrderDate升序
	public List<OrderList> findAllByOrderByOrderDateAsc() {
		List<OrderList> orderListList = orderListDao.findAllByOrderByOrderDateAsc();
		return orderListList;
	}
	
	// 找所有訂單紀錄OrderList--依照OrderListId降序
	public List<OrderList> findAllByOrderByIdDesc() {
		List<OrderList> orderListList = orderListDao.findAllByOrderByIdDesc();
		return orderListList;
	}
	
	// 找所有訂單紀錄OrderList--依照OrderListId升序
	public List<OrderList> findAllByOrderByIdAsc() {
		List<OrderList> orderListList = orderListDao.findAllByOrderByIdAsc();
		return orderListList;
	}
	
	//完成訂單(新增一筆付款完成的交易)
	public void insertOrderList(OrderList orderList) {
		orderListDao.save(orderList);
	}

	
	//找訂單By 訂單Id
	public OrderList findOrderListById(Integer orderListId) {
		Optional<OrderList> oneOrderListOpt = orderListDao.findById(orderListId);
		OrderList oneOrderList = oneOrderListOpt.get();
		return oneOrderList;
	}
	//刪除訂單
	public void deleteOrderListByEntity(OrderList orderList) {
		orderListDao.delete(orderList);
	}
	
	

}
