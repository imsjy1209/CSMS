package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ParentDao;
import com.team3.CSMS.dao.PostRepository;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Post;

@Service
@Transactional
public class ParentService {
	@Autowired
	private ParentDao pDao;

	public void insert(Parent p) {
		pDao.save(p);
	}

	public List<Parent> getAll() {
		return pDao.findAll();
//		return aDao.getAll();
	}

	public Parent findById(Integer id) {
		Optional<Parent> optional = pDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}
	public Parent searchParentByname(String name) {		
		return pDao.searchParent(name);
	}
}
