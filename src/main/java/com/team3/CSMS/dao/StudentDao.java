package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.Student;

public interface StudentDao extends JpaRepository<Student, Integer> {
	
	//public score findFirstByOrderByAddedDesc();

}