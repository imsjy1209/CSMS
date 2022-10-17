package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.OrderDetail;

public interface OrderDetailDao extends JpaRepository<OrderDetail,Integer> {

	//依據學生id找尚未結帳(OrderList值為null)的訂單明細
	@Query(value="from OrderDetail where fk_student_id = ?1 AND confirmOrder=0 AND fk_orderList_id is null")
	List<OrderDetail> findOrderDetailListByIdAndOrderListValueIsNull(@Param(value="id")Integer id);
	
	
}
