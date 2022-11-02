package com.team3.CSMS.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.team3.CSMS.dto.ScoreCatchDto;
import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ScoreService;
import com.team3.CSMS.service.StudentService;

@Controller
public class ScoreController {

	@Autowired
	private ScoreService scoreService;

	@Autowired
	private ClassListService classListService;

	@Autowired
	private StudentService studentService;

	// 顯示校方頁面(有crud功能)
	@GetMapping("/score")
	public String showScoreIndexAjax() {
		return "/cs_score/score";
	}
	

	// 顯示校方頁面----及格
	@GetMapping("/passscore")
	public String showScoreIndexAjax2() {
		return "/cs_score/scorePass";
	}
	// 顯示校方頁面---不及格
		@GetMapping("/notPassscore")
		public String showScoreIndexAjax3() {
			return "/cs_score/scoreNotPass";
		}

	// 顯示校方頁面---的新增按鈕---新增頁面
	@GetMapping("/scoreAdd")
	public String showScoreIndexAjax1() {
		return "/cs_score/scoreAdd";
	}

	// 找全部score
	@GetMapping("/findAllScore.controller")
	public @ResponseBody List<Score> findAll() {
		return scoreService.findAllScore();
	}

	// 找到所有classcode與Id
	@GetMapping("/scoreaList.controller")
	public String getAll() {
		return "cs_score/score";
	}

	// 透過classCodeId找全部score
	@GetMapping("/findAllScore2.controller")
	public @ResponseBody Map<String, Object> getScoreInformationById(Integer classCodeId, Integer frequency) {
		Map<String, Object> map = new HashMap<>();
		List<ScoreDto2> sidto = scoreService.findScoreByClassId(classCodeId, frequency);
		ClassList fcList = classListService.findClassListById(classCodeId);
		map.put("sidto", sidto);
		map.put("fcList", fcList);
		return map;
	}

	// 透過classCodeId找及格score
	@GetMapping("/findPassScore.controller")
	public @ResponseBody Map<String, Object> getPassScoreInformationById(Integer classCodeId, Integer frequency) {
		Map<String, Object> map = new HashMap<>();
		List<ScoreDto2> sidto = scoreService.findPassScoreByclasslistId(classCodeId, frequency);
		ClassList fcList = classListService.findClassListById(classCodeId);
		map.put("sidto", sidto);
		map.put("fcList", fcList);
		return map;
	}

	
	// 透過classCodeId找不及格score
		@GetMapping("/findNotPassScore.controller")
		public @ResponseBody Map<String, Object> getNotPassScoreInformationById(Integer classCodeId, Integer frequency) {
			Map<String, Object> map = new HashMap<>();
			List<ScoreDto2> sidto = scoreService.findNotPassScoreByclasslistId(classCodeId, frequency);
			ClassList fcList = classListService.findClassListById(classCodeId);
			map.put("sidto", sidto);
			map.put("fcList", fcList);
			return map;
		}
	
	
	
	
	// 更改score
	@GetMapping("/scoreData/edit")
	public String editScore(@RequestParam(name = "id") Integer id, Model model) {
		Score score1 = scoreService.findScoreById(id);
		model.addAttribute("score1", score1);
		return "cs_score/scoreUpdate";
	}

	/**
	 * @param scoreListJsonString
	 */
	// 新增score
	@PostMapping("/scoreDataCreate")
	public @ResponseBody String insertScore(@RequestBody List<ScoreCatchDto> scoreListJsonString) {
		for (ScoreCatchDto scoreCatchDto : scoreListJsonString) {
			System.out.println("for earch start");
			
			Integer studentId = scoreCatchDto.getStudentId();
			Integer classCodeId = scoreCatchDto.getClasscode();
			Integer frequency = scoreCatchDto.getFrequency();
			Integer score = scoreCatchDto.getScore();
			Student oneStu = studentService.findStudentById(studentId);
			Parent parentId = oneStu.getParent(); // System.out.println("get parents");
			ClassList findClassListById = classListService.findClassListById(classCodeId);
			School schoolId = findClassListById.getSchool(); // System.out.println("get school");
			Teacher teacher = findClassListById.getTeacher();
			Score score2 = new Score();
			score2.setFrequency(frequency);
			score2.setScore(score);
			score2.setSchool(schoolId);
			score2.setTeacher(teacher);
			score2.setStudent(oneStu);
			score2.setClasslist(findClassListById);
			score2.setParent(parentId);
			scoreService.insertScore(score2);
			System.out.println("end of insert");
		}
		return "cs_score/scoreAdd";
	}

	// update score
	@PostMapping("/scoreDataUpdateAAA")
	public String scoreUpdateAction(@RequestParam(name = "scoreId", required = true) int id,
			@RequestParam(name = "score", required = true) int score) {
		Score oldScore = scoreService.findScoreById(id);
		oldScore.setScore(score);
		System.out.println("testtttt");
		scoreService.insertScore(oldScore);
		return "redirect:/scoreaList.controller";
	}

	// 刪除SCORE資料
	@GetMapping("/scoreData/delete")
	public String deleteScore(@RequestParam(name = "id") Integer id) {
		System.out.println("deleteScore in");
		scoreService.deleteScore(id);
		return "redirect:/score";
	}
}
