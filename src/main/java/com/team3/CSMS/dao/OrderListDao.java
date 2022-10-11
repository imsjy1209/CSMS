package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.OrderList;

public interface OrderListDao extends JpaRepository<OrderList,Integer> {

}
