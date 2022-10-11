package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.OrderDetail;

public interface OrderDetailDao extends JpaRepository<OrderDetail,Integer> {

}
