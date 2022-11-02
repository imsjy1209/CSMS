package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.team3.CSMS.dao.ScoreStudentDao;
import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.Score;

@Service
@Transactional
public class ScoreStudentService {

	@Autowired
	private ScoreStudentDao scoreStudentDao;

	// 找全部
	public List<Score> findAllScore() {
		List<Score> scoreStudentList = scoreStudentDao.findAll();
		return scoreStudentList;
	}

	// 【學生頁面】選擇課堂後，帶出該學生在該課堂的歷次考試成績
	public List<ScoreDto2> getScoreByclasslistIdAndStudentId(Integer classCodeId, Integer sessionUserId) {
		List<Score> scoreList = scoreStudentDao.getScoreByclasslistIdAndStudentId(classCodeId, sessionUserId);
		ArrayList<ScoreDto2> scdtoList = new ArrayList<>();
		for (Score score : scoreList) {
			ScoreDto2 scDto = new ScoreDto2(score);
			scdtoList.add(scDto);
		}
		return scdtoList;
	}
	
	//
	public List<Score> getScoreforStudent(Integer sessionStuId){
		return scoreStudentDao.scoreforStudent(sessionStuId);
	}

}
