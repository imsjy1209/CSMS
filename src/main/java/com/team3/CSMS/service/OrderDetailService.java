package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.OrderDetailDao;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.Student;

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
	
	//============找所有訂單明細OrderDetail-Desc=============
	public List<OrderDetail> findByOrderByIdDesc() {
		List<OrderDetail> orderDetailList = orderDetailDao.findByOrderByIdDesc();
		return orderDetailList;
	}
	//============找所有訂單明細OrderDetail-Asc=============
	public List<OrderDetail> findByOrderByIdAsc() {
		List<OrderDetail> orderDetailList = orderDetailDao.findByOrderByIdAsc();
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
	
	//找訂單明細By OrderDetail Id
	public OrderDetail findOrderDetailById(Integer id) {
		Optional<OrderDetail> oneOrderDetail = orderDetailDao.findById(id);
		OrderDetail aOrderDetail = oneOrderDetail.get();
		return aOrderDetail;
	}
	
	//====找訂單明細By Student And ConfirmOrder====
	public List<OrderDetail> findByStudentIsAndConfirmOrderIs(Student student,Integer confirmOrder){
		List<OrderDetail> orderDetailList = orderDetailDao.findByStudentIsAndConfirmOrderIs(student, confirmOrder);
		return orderDetailList;
	}
	
	//=====找訂單明細By Student And Course=========
	public OrderDetail findByStudentIsAndCourseIs(Student student,Course course) {
		return orderDetailDao.findByStudentIsAndCourseIs(student, course);
	}
	
	//===找訂單明細By Student==================
	public List<OrderDetail> findByStudentIs(Student student){
		return orderDetailDao.findByStudentIs(student);
	}
	
	

}
