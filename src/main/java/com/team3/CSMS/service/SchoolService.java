package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.SchoolDao;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;

@Service
@Transactional
public class SchoolService {
	
	@Autowired
	private SchoolDao schoolDao;
	
	//find School by id--Neil 1015
	public School findSchoolById(Integer id) {
		Optional<School> oneSchool = schoolDao.findById(id);
		return oneSchool.get();
		
	}
	
	//find All School--Neil 1023
	public List<School> findAllSchool() {
		return schoolDao.findAll();
	}
	public void insert(School p) {
		schoolDao.save(p);
	}
	
}
