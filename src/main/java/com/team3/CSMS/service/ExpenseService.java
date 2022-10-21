package com.team3.CSMS.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ExpenseRepository;
import com.team3.CSMS.model.Expense;

@Service
@Transactional
public class ExpenseService {
	
	@Autowired
	private ExpenseRepository eDao;
	
	public void insert(Expense s) {
		eDao.save(s);
	}
	public List<Expense> getAll(){
		return eDao.findAll();
	}
	
	public Expense findById(Integer id) {
		Optional<Expense> optional = eDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	
	public void delete(int id) {
		eDao.deleteById(id);
//		aDao.delete(id);
	}
	public Expense findBydate(String year,String semester) {
		return eDao.findBydate(year, semester);
	}
	
	public List<Expense> findExpByYear(String first,String second){
		return eDao.findExpByYear(first, second);
	}
	public List<String> getAllYear(){
		return eDao.getAllYear();
	}
	
//	public List<String>coursenum(){
//		List<String> map = eDao.coursenum();
//		return map;
//	}
}
