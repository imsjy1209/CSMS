package com.team3.CSMS.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.team3.CSMS.model.OrderList;

public interface OrderListDao extends JpaRepository<OrderList,Integer> {
	
	List<OrderList> findAllByOrderByOrderDateDesc();
	List<OrderList> findAllByOrderByOrderDateAsc();
	
	List<OrderList> findAllByOrderByIdDesc();
	List<OrderList> findAllByOrderByIdAsc();
}
