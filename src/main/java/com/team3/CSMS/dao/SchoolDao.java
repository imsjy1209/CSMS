package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.School;

public interface SchoolDao extends JpaRepository<School,Integer> {

}
