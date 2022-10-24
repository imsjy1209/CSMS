package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Parent;

public interface ParentDao extends JpaRepository<Parent,Integer> {
 @Query(value="from Parent where name=:name")
 public Parent searchParent(@Param("name") String name);
}
