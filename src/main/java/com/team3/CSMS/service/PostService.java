package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.PostRepository;
import com.team3.CSMS.model.Post;

@Service
@Transactional
public class PostService {
	@Autowired
	private PostRepository pDao;
	public void insert(Post p) {
		pDao.save(p);
	}
	public List<Post> getAll(){
		return pDao.findAll();
//		return aDao.getAll();
	}
	
	public Post findById(Integer id) {
		Optional<Post> optional = pDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	
	public void delete(int id) {
		pDao.deleteById(id);
//		aDao.delete(id);
	}
	public void already(int id) {
		pDao.already(id);
	}
	public void removed(int id) {
		pDao.remove(id);
	}
	public List<Post> viewAllBySchool(){
		List<Post> list = pDao.viewAllBySchool();
		return list;
	}
	public List<Post> viewAllByAll(){
		List<Post> list = pDao.viewAllByAll();
		return list;
	}
}
