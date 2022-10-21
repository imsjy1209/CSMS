package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ActivityRepository;
import com.team3.CSMS.model.Activity;
import com.team3.CSMS.model.Student;

@Service
@Transactional
public class ActivityService {
	@Autowired
	private ActivityRepository aDao;
	public void insert(Activity a) {
		aDao.save(a);
	}
	public List<Activity> getAll(){
//		return aDao.findAll();
		return aDao.getAll();
	}
	public List<Activity> findAll(){
		return aDao.findAll();
	}
	
	public Activity findById(Integer id) {
		Optional<Activity> optional = aDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	
	public void delete(int id) {
		aDao.deleteById(id);
//		aDao.delete(id);
	}

	public void join(int act_id,Student student) {
		Activity activity = findById(act_id);
		Set<Student> students = activity.getStudents();
		students.add(student);
//		System.out.println(students);
//		students.remove(student);
		activity.setStudents(students);
		aDao.save(activity);
	}
	public void quit(int act_id,int stu_id) {
		aDao.quit(act_id, stu_id);
	}
	public void already(int id) {
		aDao.already(id);
	}
	public void removed(int id) {
		aDao.remove(id);
	}
}
