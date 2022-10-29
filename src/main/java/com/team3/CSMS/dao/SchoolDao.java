package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.School;

public interface SchoolDao extends JpaRepository<School,Integer> {
	@Query(value = "from School where name = :name")
	public School getTeacherByName(@Param("name")String name);
}
