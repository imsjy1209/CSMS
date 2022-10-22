package com.team3.CSMS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.AllClassListParentVerDto;
import com.team3.CSMS.dto.AllClassListSchoolVerDto;
import com.team3.CSMS.dto.AllClassListStudentVerDto;
import com.team3.CSMS.dto.AllClassListTeacherVerDto;
import com.team3.CSMS.dto.ClassListParentVerDto;
import com.team3.CSMS.dto.ContactBookListParentVerDto;
import com.team3.CSMS.dto.ContactBookListSchoolVerDto;
import com.team3.CSMS.dto.ContactBookListStudentVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.ContactBook;

import com.team3.CSMS.service.ClassListService;
import com.team3.CSMS.service.ContactBookService;
import com.team3.CSMS.service.ContactBookSignService;

@Controller
public class ContactBookController {

	@Autowired
	private ClassListService clService;

	@Autowired
	private ContactBookService cbService;
	
	@Autowired
	private ContactBookSignService cbsService;

	//------------------------- 老師 -------------------------  進度：大致ok，只差一些特殊操情境的前端卡控
	/* 進入聯絡簿系統 */
	// 【老師】聯絡簿首頁
	@GetMapping("/ContactBook/T_Index")
	public String teacherContactBookPage() {
		return "contactBook/teacher/tcbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【老師】課程選單
	@GetMapping(value = "/allTeacherClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListTeacherVerDto> getAllTeacherClassList(String sessionAccount) { // BA001
		// 預想：
		// LoginController會寫@SessionAttributes(names = {"account"}) -- 延伸：聽說每個controller都要寫，否則會取不到(待查)
		// getAttribute() -- 抓session的account資料餵給json -- how?? 忘記了 要查一下~~
		List<AllClassListTeacherVerDto> aclTDto = clService.getAllClassInfoListByTeacherAccount("BA001"); // 之後要改回sessionAccount
		return aclTDto;
	}

	/* 依課程篩選後之聯絡簿清單 */
	// 【老師】課程選單對應聯絡簿清單
	@GetMapping(value = "/teacherContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListTeacherVerDto> getTeacherContactBookList(@RequestParam("classListId") Integer classListId) { // 1	
		List<ContactBookListTeacherVerDto> cblTDto = cbService.getTeacherContactBookListByClassListId(classListId);
		return cblTDto;
	}

	/* 共用 */
	// 【共用Json】新增/更新聯絡簿頁面上方的課程資訊
	@GetMapping(value = "/findClsInfoByClassListId.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ClassList findClsInfoByClsListID(@RequestParam("classListId") Integer classListId) {
		return clService.findById(classListId);
	}
	
	/* 新增聯絡簿 */
	// 【老師】進入新增編輯頁
	@GetMapping("/ContactBook/T_Edit/{classListId}")
	public String teacherContactBookEditPage(@PathVariable("classListId") Integer classListId) {
		return "contactBook/teacher/tcbEdit";
	}	
	
	// 【老師】點「建立聯絡簿」按鈕要做兩件事：
	// (1) ContactBook：insert一筆帶ClassListId資料
	// (2) ContactBookSign：接著insert一組資料By fk_cb_id, 每個班(fk_classlist_id)的student_id
	@PostMapping(value = "/insertTheClassListIdIntoContactBook.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ContactBook teacherContactBookEstablish(@RequestParam("classListId") Integer classListId) {
		ContactBook cbBean = cbService.insertTheClassListIdIntoContactBook(classListId);
		cbsService.insertContactBookSignByCbIdAndStudentId(classListId);
		return cbBean;
	}
	
	/* 更新聯絡簿 */
	// 【老師】點「確認送出」按鈕，進入更新完成頁
	@PostMapping("/ContactBook/T_Update/{clsListId}")
	public String teacherUpdateOneContactBook(@PathVariable("clsListId") Integer clsListId,
			@RequestParam("courseContent") String courseContent, @RequestParam("homework") String homework, 
			@RequestParam("quizNotice") String quizNotice, @RequestParam("cbId") Integer cbId, Model model) {
		ContactBook cbBean = cbService.findById(cbId);
		if (cbBean != null) {
			cbBean.setCourseContent(courseContent);
			cbBean.setHomework(homework);
			cbBean.setQuizNotice(quizNotice);
			cbBean.setPhase(2);
			cbService.save(cbBean);
		}
		model.addAttribute("cbBean", cbBean);
		return "contactBook/teacher/tcbUpdate";
	} // 某些符號不行，前端限制只能打英數中小數點？

	/* 刪除聯絡簿 */
	// 【老師】點「回上一頁」按鈕，先依當下的cbId抓到cbBean資料，再做以下兩件事：
	//  (1) 若phase == 1，要先完成以下兩件事，才返回聯絡簿首頁
	//      i. 以fk_cb_id刪除ContactBookSign資料
	//		ii.設定classlist_id=null，再刪除ContactBook資料
	//  (2) 若phase != 1，直接返回聯絡簿首頁
	@GetMapping("/ContactBook/T_GoPrevPage")
	public String teacherGoBackToContactBookIndex(@RequestParam("cbId") Integer cbId) {
		ContactBook cbBean = cbService.findById(cbId);
		if (cbBean != null) {
			if (cbBean.getPhase() == 1) {
				cbsService.deleteContactBookSignByCbId(cbId);
				cbBean.setClassList(null);
				cbService.deleteThisContactBookData(cbBean);
			} 
		}
		return "redirect:/ContactBook/T_Index";
	}
	
	//------------------------- 校方 -------------------------  進度：施工中(還差查詢簽名進度、取消退件功能、考慮加入前台送出功能)
	/* 進入聯絡簿系統 */
	// 【校方】聯絡簿首頁
	@GetMapping("/ContactBook/Sc_Index")
	public String schoolContactBookPage() {
		return "contactBook/school/sccbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【校方】課程選單
	@GetMapping(value = "/allSchoolClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListSchoolVerDto> getAllSchoolClassList(String sessionAccount) { // AA002
		List<AllClassListSchoolVerDto> aclSDto = clService.getAllClassInfoListBySchoolAccount("AA002"); // 之後要改回sessionAccount
		return aclSDto;
	}
	
	// 【校方】課程選單對應聯絡簿清單
	@GetMapping(value = "/schoolContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListSchoolVerDto> getSchoolContactBookList(@RequestParam("classListId") Integer classListId) { // AA002,1
		List<ContactBookListSchoolVerDto> cblSDto = cbService.getSchoolContactBookListByClassListId(classListId);
		return cblSDto;
	}
	
	/* 更新聯絡簿 */
	// 【校方】聯絡簿編輯頁
	@GetMapping("/ContactBook/Sc_Edit/{classListId}/{cbId}")
	public String schoolContactBookEditPage
	(@PathVariable("classListId") Integer classListId, @PathVariable("cbId") Integer cbId) {
		return "contactBook/school/sccbEdit";
	}
	
	// 【校方】於首頁挑選其中一筆聯絡簿進行編輯/查看
	@GetMapping(value = "/schoolClickOneContactBook.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ContactBook schoolClickOneContactBookToGoEditing(@RequestParam("cbId") Integer cbId) {
		ContactBook cbBean = cbService.findById(cbId);
		return cbBean;
	}
	
	// 【校方】點「確認送出」按鈕，進入更新完成頁
	@PostMapping("/ContactBook/Sc_Update/{clsListId}")
	public String schoolUpdateOneContactBook(@PathVariable("clsListId") Integer clsListId,
			@RequestParam("courseContent") String courseContent, @RequestParam("homework") String homework, 
			@RequestParam("quizNotice") String quizNotice, @RequestParam("cbId") Integer cbId, Model model) {
		ContactBook cbBean = cbService.findById(cbId);
		if (cbBean != null) {
			cbBean.setCourseContent(courseContent);
			cbBean.setHomework(homework);
			cbBean.setQuizNotice(quizNotice);
			cbBean.setPhase(3);
			cbService.save(cbBean);
		}
		model.addAttribute("cbBean", cbBean);
		return "contactBook/school/sccbUpdate";
	} // 某些符號不行，前端限制只能打英數中小數點？
	
	// 【校方】點「回上一頁」
	@GetMapping("/ContactBook/Sc_GoPrevPage")
	public String schoolGoBackToContactBookIndex() {
		return "redirect:/ContactBook/Sc_Index";
	}
	
	
	//------------------------- 學生 -------------------------  進度：已完成
	/* 進入聯絡簿系統 */
	// 【學生】聯絡簿首頁
	@GetMapping("/ContactBook/St_Index")
	public String studentContactBookPage() {
		return "contactBook/student/stcbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【學生】課程選單
	@GetMapping(value = "/allStudentClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListStudentVerDto> getAllStudentClassList(String sessionAccount) { // CA001
		List<AllClassListStudentVerDto> aclStuDto = clService.getAllClassInfoListByStudentAccount("CA001"); // 之後要改回sessionAccount
		return aclStuDto;
	}
	
	// 【學生】課程選單對應聯絡簿清單
	@GetMapping(value = "/studentContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListStudentVerDto> getStudentContactBookList(@RequestParam("classListId") Integer classListId) { // CA001,1
		List<ContactBookListStudentVerDto> cblStuDto = cbService.getStudentContactBookListByClassListId(classListId);
		return cblStuDto;
	}
	
	//------------------------- 家長 -------------------------  進度：施工中
	/* 進入聯絡簿系統 */	
	// 【家長】聯絡簿首頁
	@GetMapping("/ContactBook/P_Index")
	public String parentContactBookPage() {
		return "contactBook/parent/pcbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【家長】課程選單
	@GetMapping(value = "/allParentClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListParentVerDto> getAllParentClassList(String sessionAccount) { // DA001
		List<AllClassListParentVerDto> aclPDto = clService.getAllClassInfoListByParentAccount(sessionAccount); // 之後要改回sessionAccount
		return aclPDto;
	}
	
	// 【家長】課程選單對應聯絡簿清單(要改)
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
	
	//------------------------- Admin -------------------------  進度：規劃待施行

	
}
