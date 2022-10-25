package com.team3.CSMS.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.model.Room;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ScoreService;

@Controller
public class ScoreController {

	@Autowired
	private ScoreService scoreService;

	@Autowired
	private ClassListService classListService;

	// 顯示後端頁面
		@GetMapping("/score")
		public String showScoreIndexAjax() {
			return "/cs_score/score";
		}
	
	
	
	// 測試
	@GetMapping("/scoreAdd")
	public String showScoreIndexAjax1() {
		return "/cs_score/scoreAdd";
	}

	// 找後端全部score
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



	// 更改score
	@GetMapping("/scoreData/edit")
	public String editScore(@RequestParam(name = "id") Integer id, Model model) {
		Score score1 = scoreService.findScoreById(id);
		model.addAttribute("score1", score1);
		return "cs_score/scoreUpdate";

	}

	// 新增score
	@PostMapping("/scoreDataCreate.controller")
	public String scoreCreateAction(@RequestParam(name = "score", required = true) int score,
			                        @RequestParam(name = "frequency", required = true) int frequency) {		
		scoreService.saveScore(score,frequency);
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
