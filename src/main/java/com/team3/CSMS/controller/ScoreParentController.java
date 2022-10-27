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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team3.CSMS.dto.ClassInfoForStudentScorePageDto;
//import com.team3.CSMS.dto.ClassListTeacherVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;

import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ParentService;
import com.team3.CSMS.service.ScoreService;
import com.team3.CSMS.service.ScoreStudentService;

@Controller
public class ScoreParentController {

	@Autowired
	private ScoreService scoreService;

	@Autowired
	private ParentService parentService;

	// 進入【Parent頁面】
	@GetMapping("/frontParentscore")
	public String showScoreIndexAjax() {
		
		return "/cs_score/scoreParent";
	}

	// 【Parent頁面】上方學生選單
	@GetMapping(value = "/findParentidPage.json", produces = {"application/json;charset=UTF-8"})
	public @ResponseBody List<Parent> getChildScoreListByParentId(@SessionAttribute("users") Users user){ 
		System.out.println(user.getId());
		List<Parent> pList = parentService.getChildScoreListByParentId(user.getId()); // 之後要改回sessionUserId
		return pList;
	}

	
	// 【Parent頁面】選擇學生後，帶出該學生在該課堂的歷次考試成績
	@GetMapping(value = "/findChildScoreList.json", produces = {"application/json;charset=UTF-8"})
	public @ResponseBody List<ScoreDto2> getChildScoreListByStudentId
	(@RequestParam("studentId") Integer studentId) { 
		List<ScoreDto2> scdtoList = scoreService.getChildScoreListByStudentId(studentId);
		return scdtoList;
	}


	// 找全部score
	@GetMapping("/frontParentAllScore.controller")
	public @ResponseBody List<Score> findAll() {
		return scoreService.findAllScore();
	}

	// 找到所有classcode與Id
	@GetMapping("/scoreaList3.controller")
	public String getAll() {
		return "cs_score/scoreParent";
	}

}
