package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.OrderDetailDao;
import com.team3.CSMS.model.OrderDetail;

@Service
@Transactional
public class OrderDetailService {
	
	@Autowired
	private OrderDetailDao orderDetailDao;

	// 找所有訂單明細OrderDetail
	public List<OrderDetail> findAllOrderDetail() {
		List<OrderDetail> orderDetailList = orderDetailDao.findAll();
		return orderDetailList;
	}
	
	//新增訂單明細
	public void insertOrderDetail(OrderDetail orderDetail) {
		orderDetailDao.save(orderDetail);
	}
	
	//刪除訂單明細
	public void deleteOrderDetailById(Integer id) {
		orderDetailDao.deleteById(id);
	}
	
	//依據學生id找尚未結帳(OrderList值為null，且confirmOrder為0)的訂單明細
	public List<OrderDetail> findOrderDetailListByIdAndOrderListValueIsNull(Integer id){
	List<OrderDetail> oneOrderDetailList = orderDetailDao.findOrderDetailListByIdAndOrderListValueIsNull(id);
	return oneOrderDetailList;
	}
	
	public OrderDetail findOrderDetailById(Integer id) {
		Optional<OrderDetail> oneOrderDetail = orderDetailDao.findById(id);
		OrderDetail aOrderDetail = oneOrderDetail.get();
		return aOrderDetail;
	}

}
