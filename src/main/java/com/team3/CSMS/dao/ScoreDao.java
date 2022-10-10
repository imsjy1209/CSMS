package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.Score;

public interface ScoreDao extends JpaRepository<Score, Integer> {
	
	//public score findFirstByOrderByAddedDesc();

}