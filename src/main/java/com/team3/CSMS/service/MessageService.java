package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.GroupDao;
import com.team3.CSMS.dao.MessagezDao;
import com.team3.CSMS.dao.TeacherDao;
import com.team3.CSMS.model.Groups;
import com.team3.CSMS.model.Messagez;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Teacher;

@Service
@Transactional
public class MessageService {
	
	@Autowired
	private MessagezDao mDao;
	
	//find teacher by id--Neil 1015
	public Messagez findById(Integer id) {
		Optional<Messagez> oneTeacher = mDao.findById(id);
		return oneTeacher.get();
		
	}
	
	//find All Teacher--Neil 1023
	public List<Messagez> findAllMessagez(){
		return mDao.findAll();
	}
	
	//===find 
	public List<Messagez> findBySchoolIsAndToSchoolIsOrderByCreateTimeDesc(School school){
		return mDao.findBySchoolIsAndToSchoolIsOrderByCreateTimeDesc(school,0);
	}
	
	public void insert(Messagez p) {
		mDao.save(p);
	}
	public List<String>findschoolname(int id){
		return mDao.getTeacherName(id);
	}
	
	public List<Messagez>getAllBySchool(School school){
		return mDao.getAllBySchool(school);
	}
	
	public List<Messagez>getAllByParent(Parent parent){
		return mDao.getAllByParent(parent);
	}
	
	//已讀方法
	public Messagez readornot(int id) {
		Messagez messagez = findById(id);
		mDao.readOrNot(id);
		return messagez;
	}
}
