package com.team3.CSMS.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ScoreDao;

import com.team3.CSMS.model.Score;

@Service
@Transactional
public class ScoreService {

	@Autowired
	private ScoreDao scoreDao;

	// 找全部
	public List<Score> findAllScore() {
		List<Score> scoreList = scoreDao.findAll();
		return scoreList;
	}

	// 新增
	public void insertScore(Score score) {
		scoreDao.save(score);
	}
	// 新增
//	public Score save(Score score) {
//		scoreDao.save(score);
//		return null;
//	}

	// 刪除
	public void deleteScore(Score score) {
		scoreDao.delete(score);
	}

	// 找scoreById
	public Score findScoreById(int id) {
		Optional<Score> score1 = scoreDao.findById(id);
		Score aScore = score1.get();
		return aScore;
	}
   
	
	

	

	

}
