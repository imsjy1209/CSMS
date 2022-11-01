package com.team3.CSMS.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.team3.CSMS.dao.ScoreDao;
import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Score;

@Service
@Transactional
public class ScoreService {

	@Autowired
	private ScoreDao scoreDao;

	// 【校方頁面】找全部
	public List<Score> findAllScore() {
		List<Score> scoreList = scoreDao.findAll();
		return scoreList;
	}
	// 【校方頁面】找全部score
	public List<ScoreDto2> findScoreByClassId(Integer classCodeId ,Integer frequency) {
		List<Score> scoreList = scoreDao.getScoreByclasslistId(classCodeId, frequency);
		ArrayList<ScoreDto2> scdtoList = new ArrayList<>();
		for (Score score : scoreList) {
			ScoreDto2 scDto = new ScoreDto2(score);
			scdtoList.add(scDto);

		}
		return scdtoList;
	}
	
	// 【校方頁面】找及格score
	public List<ScoreDto2> findPassScoreByclasslistId(Integer classCodeId ,Integer frequency) {
		List<Score> scorePassList = scoreDao.getPassScoreByclasslistId(classCodeId, frequency);
		ArrayList<ScoreDto2> scdtoList = new ArrayList<>();
		for (Score score : scorePassList) {
			ScoreDto2 scDto = new ScoreDto2(score);
			scdtoList.add(scDto);

		}
		return scdtoList;
	}

	
	// 【校方頁面】找不及格score
		public List<ScoreDto2> findNotPassScoreByclasslistId(Integer classCodeId ,Integer frequency) {
			List<Score> scoreNotPassList = scoreDao.getNotPassScoreByclasslistId(classCodeId, frequency);
			ArrayList<ScoreDto2> scdtoList = new ArrayList<>();
			for (Score score : scoreNotPassList) {
				ScoreDto2 scDto = new ScoreDto2(score);
				scdtoList.add(scDto);

			}
			return scdtoList;
		}
	

	// 【家長頁面】選擇學生後，帶出該學生在該課堂的歷次考試成績
	public List<ScoreDto2> getChildScoreListByStudentId(Integer studentId) {
		List<Score> scoreList = scoreDao.getChildScoreListByStudentId(studentId);
		ArrayList<ScoreDto2> scdtoList = new ArrayList<>();
		for (Score score : scoreList) {
			ScoreDto2 scDto = new ScoreDto2(score);
			scdtoList.add(scDto);
		}
		return scdtoList;
	}
	
	
	public List<Score> getscoreforParent(Parent parent){
		return scoreDao.scoreforParent(parent);
	}
	
	//[MODEL]
	public List<Score> top3ScoreforParent(Integer sessionParentId) {
		return scoreDao.top3ScoreforParent(sessionParentId);
	}
	

	// 新增
	public void insertScore(Score score) {
		scoreDao.save(score);
	}


	// 刪除
	public void deleteScore(Score score) {
		System.out.println("123124jwiefhwihfiwhfwehfkweh");
		scoreDao.delete(score);
	}

	public void deleteScore(Integer id) {
		System.out.println("2468jwiefhwihfiwhfwehfkweh");
		scoreDao.deleteById(id);
	}

	// 找scoreById
	public Score findScoreById(int id) {
		Optional<Score> score1 = scoreDao.findById(id);
		Score aScore = score1.get();
		return aScore;
	}
	public void saveScore(int score, int frequency) {
		// TODO Auto-generated method stub
		
	}

}
