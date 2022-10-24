package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.TeacherDao;
import com.team3.CSMS.model.Teacher;

@Service
@Transactional
public class TeacherService {
	
	@Autowired
	private TeacherDao teacherDao;
	
	//find teacher by id--Neil 1015
	public Teacher findTeacherById(Integer id) {
		Optional<Teacher> oneTeacher = teacherDao.findById(id);
		return oneTeacher.get();
		
	}
	
	//find All Teacher--Neil 1023
	public List<Teacher> findAllTeacher(){
		return teacherDao.findAll();
	}

}
