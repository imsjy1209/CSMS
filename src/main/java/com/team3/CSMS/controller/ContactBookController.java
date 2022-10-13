package com.team3.CSMS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.ClassListParentVerDto;
import com.team3.CSMS.dto.ClassListSchoolVerDto;
import com.team3.CSMS.dto.ClassListStudentVerDto;
import com.team3.CSMS.dto.ClassListTeacherVerDto;
import com.team3.CSMS.dto.ContactBookListParentVerDto;
import com.team3.CSMS.dto.ContactBookListSchoolVerDto;
import com.team3.CSMS.dto.ContactBookListStudentVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ContactBookService;

@Controller
public class ContactBookController {
	
	@Autowired
	private ClassListService clService;
	
	@Autowired
	private ContactBookService cbService;
	
	// 【老師】聯絡簿首頁
	@GetMapping("/ContactBook/T_Index")
	public String teacherContactBookPage() {
		return "contactBook/teacher/tcbIndex";
	}
	
	// 【校方】聯絡簿首頁
	@GetMapping("/ContactBook/Sc_Index")
	public String schoolContactBookPage() {
		return "contactBook/school/sccbIndex";
	}
	
	// 【學生】聯絡簿首頁
	@GetMapping("/ContactBook/St_Index")
	public String studentContactBookPage() {
		return "contactBook/student/stcbIndex";
	}
	
	// 【家長】聯絡簿首頁
	@GetMapping("/ContactBook/P_Index")
	public String parentContactBookList() {
		return "contactBook/parent/pcbIndex";
	}
	
	
	// 【老師】課程選單對應聯絡簿清單
	@GetMapping(value = "/teacherContactBookList.json", produces = {"application/json;charset=UTF-8"})
	public @ResponseBody Map<String,Object> getTeacherContactBookList(String sessionAccount,Integer classListId){ // BA001,1
		Map<String,Object> map = new HashMap<>();
		List<ClassListTeacherVerDto> clTDto = clService.getClassInfoListByTeacherAccount(sessionAccount, classListId);
		List<ContactBookListTeacherVerDto> cblTDto = cbService.getTeacherContactBookListByClassListId(classListId);
		map.put("clTDto", clTDto);
		map.put("cblTDto", cblTDto);
		return map;
	}
	
	// 【校方】課程選單對應聯絡簿清單
	@GetMapping(value = "/schoolContactBookList.json", produces = {"application/json;charset=UTF-8"})
	public @ResponseBody Map<String,Object> getSchoolContactBookList(String sessionAccount,Integer classListId){ // AA002,1
		Map<String,Object> map = new HashMap<>();
		List<ClassListSchoolVerDto> clSDto = clService.getClassInfoListBySchoolAccount(sessionAccount, classListId);
		List<ContactBookListSchoolVerDto> cblSDto = cbService.getSchoolContactBookListByClassListId(classListId);
		map.put("clSDto", clSDto);
		map.put("cblSDto", cblSDto);
		return map;
	}
	
	// 【學生】課程選單對應聯絡簿清單
	@GetMapping(value = "/studentContactBookList.json", produces = {"application/json;charset=UTF-8"})
	public @ResponseBody Map<String,Object> getStudentContactBookList(String sessionAccount,Integer classListId){ // CA001,1
		Map<String,Object> map = new HashMap<>();
		List<ClassListStudentVerDto> clStuDto = clService.getClassInfoListByStudentAccount(sessionAccount, classListId);
		List<ContactBookListStudentVerDto> cblStuDto = cbService.getStudentContactBookListByClassListId(classListId);
		map.put("clStuDto", clStuDto);
		map.put("cblStuDto", cblStuDto);
		return map;
	}
	
	// 【家長】課程選單對應聯絡簿清單
	@GetMapping(value = "/parentContactBookList.json", produces = {"application/json;charset=UTF-8"})
	public @ResponseBody Map<String,Object> getParentContactBookList(String sessionAccount,Integer classListId, Integer studentId){ // DA001,1,1
		Map<String,Object> map = new HashMap<>();
		List<ClassListParentVerDto> clPDto = clService.getClassInfoListByParentAccount(sessionAccount, classListId, studentId);
		List<ContactBookListParentVerDto> cblPDto = cbService.getParentContactBookListByClassListId(classListId, studentId);
		map.put("clPDto", clPDto);
		map.put("cblPDto", cblPDto);
		return map;
	}
	
	
	
	
	
}
