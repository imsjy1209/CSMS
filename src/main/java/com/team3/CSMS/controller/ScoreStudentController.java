package com.team3.CSMS.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.ClassInfoForStudentScorePageDto;
//import com.team3.CSMS.dto.ClassListTeacherVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;
import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ScoreStudentService;

@Controller
public class ScoreStudentController {

	@Autowired
	private ScoreStudentService scoreStudentService;

	@Autowired
	private ClassListService classListService;

	// 進入【學生頁面】
	@GetMapping("/frontscore")
	public String showScoreIndexAjax() {
		return "/cs_score/scoreStudent";
	}

	// 【學生頁面】上方課堂選單
	@GetMapping(value = "/ClassInfoForStudentScorePage.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ClassInfoForStudentScorePageDto> getStudentClassInfoList(Integer sessionUserId) { // 15
		List<ClassInfoForStudentScorePageDto> dtoList = classListService.getClassInfoByClassCodeIdAndStudentId(15); // 之後要改回sessionUserId
		return dtoList;
	}

	// 【學生頁面】選擇課堂後，帶出該學生在該課堂的歷次考試成績
	@GetMapping(value = "/findStudentPersonalScoreList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ScoreDto2> getStudentScoreListByclasslistId(
			@RequestParam("classCodeId") Integer classCodeId, @RequestParam("sessionUserId") Integer sessionUserId) {
		List<ScoreDto2> scdtoList = scoreStudentService.getScoreByclasslistIdAndStudentId(classCodeId, sessionUserId);
		return scdtoList;
	}

	// 找全部score
	@GetMapping("/frontAllScore.controller")
	public @ResponseBody List<Score> findAll() {
		return scoreStudentService.findAllScore();
	}

	// 找到所有classcode與Id
	@GetMapping("/scoreaList2.controller")
	public String getAll() {

		return "cs_score/scoreStudent";
	}

}
