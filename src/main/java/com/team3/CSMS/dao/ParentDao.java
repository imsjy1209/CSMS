package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team3.CSMS.model.Parent;

public interface ParentDao extends JpaRepository<Parent, Integer>{
    
}
