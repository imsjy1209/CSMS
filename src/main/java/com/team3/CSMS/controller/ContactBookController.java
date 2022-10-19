package com.team3.CSMS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.AllClassListParentVerDto;
import com.team3.CSMS.dto.AllClassListSchoolVerDto;
import com.team3.CSMS.dto.AllClassListStudentVerDto;
import com.team3.CSMS.dto.AllClassListTeacherVerDto;
import com.team3.CSMS.dto.ClassListParentVerDto;
import com.team3.CSMS.dto.ClassListSchoolVerDto;
import com.team3.CSMS.dto.ClassListStudentVerDto;
import com.team3.CSMS.dto.ContactBookListParentVerDto;
import com.team3.CSMS.dto.ContactBookListSchoolVerDto;
import com.team3.CSMS.dto.ContactBookListStudentVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;
import com.team3.CSMS.dto.InputSelectedClassListIdDto;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.ContactBook;
import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ContactBookService;

@Controller
public class ContactBookController {

	@Autowired
	private ClassListService clService;

	@Autowired
	private ContactBookService cbService;

	/* 進入聯絡簿系統 */
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
	public String parentContactBookPage() {
		return "contactBook/parent/pcbIndex";
	}
	
	// 【校方】聯絡簿編輯頁
	@GetMapping("/ContactBook/Sc_Edit")
	public String schoolContactBookEditPage() {
		return "contactBook/school/tcbEdit";
	}

	/* 依使用者帳號列出可選擇之課程清單 */
	// 【老師】課程選單對應聯絡簿清單
	@GetMapping(value = "/allTeacherClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListTeacherVerDto> getAllTeacherClassList(String sessionAccount) { // BA001
		// 預想：
		// LoginController會寫@SessionAttributes(names = {"account"}) -- 延伸：聽說每個controller都要寫，否則會取不到(待查)
		// getAttribute() -- 抓session的account資料餵給json -- how?? 忘記了 要查一下~~
		List<AllClassListTeacherVerDto> aclTDto = clService.getAllClassInfoListByTeacherAccount("BA001"); // 之後要改回sessionAccount
		return aclTDto;
	}

	// 【校方】課程選單對應聯絡簿清單
	@GetMapping(value = "/allSchoolClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListSchoolVerDto> getAllSchoolClassList(String sessionAccount) { // AA002
		List<AllClassListSchoolVerDto> aclSDto = clService.getAllClassInfoListBySchoolAccount(sessionAccount); // 之後要改回sessionAccount
		return aclSDto;
	}

	// 【學生】課程選單對應聯絡簿清單
	@GetMapping(value = "/allStudentClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListStudentVerDto> getAllStudentClassList(String sessionAccount) { // CA001
		List<AllClassListStudentVerDto> aclStuDto = clService.getAllClassInfoListByStudentAccount(sessionAccount); // 之後要改回sessionAccount
		return aclStuDto;
	}

	// 【家長】課程選單對應聯絡簿清單
	@GetMapping(value = "/allParentClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListParentVerDto> getAllParentClassList(String sessionAccount) { // DA001
		List<AllClassListParentVerDto> aclPDto = clService.getAllClassInfoListByParentAccount(sessionAccount); // 之後要改回sessionAccount
		return aclPDto;
	}

	/* 依課程篩選後之聯絡簿清單(需要消滅一些Dto!!!) */
	// 【老師】課程選單對應聯絡簿清單
	@GetMapping(value = "/teacherContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListTeacherVerDto> getTeacherContactBookList(@RequestParam("classListId") Integer classListId) { // 1	
		List<ContactBookListTeacherVerDto> cblTDto = cbService.getTeacherContactBookListByClassListId(classListId);
		return cblTDto;
	}

	// 【校方】課程選單對應聯絡簿清單
	@GetMapping(value = "/schoolContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody Map<String, Object> getSchoolContactBookList(String sessionAccount, Integer classListId) { // AA002,1
		Map<String, Object> map = new HashMap<>();
		List<ClassListSchoolVerDto> clSDto = clService.getClassInfoListBySchoolAccount(sessionAccount, classListId);
		List<ContactBookListSchoolVerDto> cblSDto = cbService.getSchoolContactBookListByClassListId(classListId);
		map.put("clSDto", clSDto);
		map.put("cblSDto", cblSDto);
		return map;
	}

	// 【學生】課程選單對應聯絡簿清單
	@GetMapping(value = "/studentContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody Map<String, Object> getStudentContactBookList(String sessionAccount, Integer classListId) { // CA001,1
		Map<String, Object> map = new HashMap<>();
		List<ClassListStudentVerDto> clStuDto = clService.getClassInfoListByStudentAccount(sessionAccount, classListId);
		List<ContactBookListStudentVerDto> cblStuDto = cbService.getStudentContactBookListByClassListId(classListId);
		map.put("clStuDto", clStuDto);
		map.put("cblStuDto", cblStuDto);
		return map;
	}

	// 【家長】課程選單對應聯絡簿清單
	@GetMapping(value = "/parentContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody Map<String, Object> getParentContactBookList(String sessionAccount, Integer classListId,
			Integer studentId) { // DA001,1,1
		Map<String, Object> map = new HashMap<>();
		List<ClassListParentVerDto> clPDto = clService.getClassInfoListByParentAccount(sessionAccount, classListId,
				studentId);
		List<ContactBookListParentVerDto> cblPDto = cbService.getParentContactBookListByClassListId(classListId,
				studentId);
		map.put("clPDto", clPDto);
		map.put("cblPDto", cblPDto);
		return map;
	}
	
	
	/* 新增聯絡簿 */
	// 【老師】進入新增編輯頁
	@GetMapping("/ContactBook/T_Edit/{classListId}")
	public String teacherContactBookEstablishPage(@PathVariable("classListId") Integer classListId) {
		return "contactBook/teacher/tcbEdit";
	}	
	
	// 【共用Json】新增/編輯聯絡部上方的課程資訊
	@GetMapping(value = "/findClsInfoByClassListId.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ClassList findClsInfoByClsListID(@RequestParam("classListId") Integer classListId) {
		return clService.findById(classListId);
	}

	// 【老師】點「建立聯絡簿」按鈕insert一筆帶ClassListId資料
	@GetMapping(value = "/insertTheClassListIdIntoContactBook.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ContactBook teacherContactBookEstablish(@PathVariable("classListId") Integer classListId) {
		ContactBook cbBean = cbService.insertTheClassListIdIntoContactBook(classListId);
		return cbBean;
	}



}
