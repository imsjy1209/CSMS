package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.StudentDao;
import com.team3.CSMS.model.Activity;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;

@Service
@Transactional
public class StudentService {
	
	@Autowired
	private StudentDao studentDao;
	
	//找學生ById
	public Student findStudentById(Integer id) {
		Optional<Student> oneStudent = studentDao.findById(id);
		return oneStudent.get();
	}
	//抓取學生活動
	public Set<Activity> getMyAct(int id){
		Student student = findStudentById(id);
		Set<Activity> activities = student.getActivities();
		return activities;
	}
	public void insert(Student p) {
		studentDao.save(p);
	}
	public List<Student> findall(){
		return studentDao.findAll();
	}
	
}
