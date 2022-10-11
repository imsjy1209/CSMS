package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team3.CSMS.model.ClassStudentList;

public interface ClassStudentListDao extends JpaRepository<ClassStudentList,Integer> {

	@Query(value = "from ClassStudentList where classList = '?1'")
	List<ClassStudentList>findByNameLike(String name);

	
}
