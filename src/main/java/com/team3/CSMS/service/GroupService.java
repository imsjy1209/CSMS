package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.GroupDao;
import com.team3.CSMS.dao.TeacherDao;
import com.team3.CSMS.model.Groups;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Teacher;

@Service
@Transactional
public class GroupService {
	
	@Autowired
	private GroupDao gDao;
	
	//find teacher by id--Neil 1015
	public Groups findById(Integer id) {
		Optional<Groups> oneTeacher = gDao.findById(id);
		return oneTeacher.get();
		
	}
	
	//find All Teacher--Neil 1023
	public List<Groups> findAllTeacher(){
		return gDao.findAll();
	}
	public void insert(Groups p) {
		gDao.save(p);
	}
}
