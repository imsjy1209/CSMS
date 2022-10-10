package com.team3.CSMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ScoreDao;
import com.team3.CSMS.model.Score;

@Service
@Transactional
public class ScoreService {
	
	@Autowired
	private ScoreDao scoreDao;
	
	public Page<Score> findAll(Pageable pgb) {
		return null;
	}
}
