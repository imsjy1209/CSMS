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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team3.CSMS.dto.AllClassListParentVerDto;
import com.team3.CSMS.dto.AllClassListSchoolVerDto;
import com.team3.CSMS.dto.AllClassListStudentVerDto;
import com.team3.CSMS.dto.AllClassListTeacherVerDto;
import com.team3.CSMS.dto.ContactBookListAdminVerDto;
import com.team3.CSMS.dto.ContactBookListParentVerDto;
import com.team3.CSMS.dto.ContactBookListSchoolVerDto;
import com.team3.CSMS.dto.ContactBookListStudentVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;
import com.team3.CSMS.dto.ContactBookSignParentVerDto;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.ContactBook;
import com.team3.CSMS.model.ContactBookSign;
import com.team3.CSMS.model.Users;
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

	//------------------------- 老師 -------------------------  進度：已完成 (有加入session測試)
	/* 進入聯絡簿系統 */
	// 【老師】聯絡簿首頁
	@GetMapping("/ContactBook/T_Index")
	public String teacherContactBookPage() {
		return "contactBook/teacher/tcbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【老師】課程選單
	@GetMapping(value = "/allTeacherClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListTeacherVerDto> getAllTeacherClassList(@SessionAttribute("users") Users users) { 
		System.out.println("teacher's sessionAccount = " + users.getAccount()); // BA001
		List<AllClassListTeacherVerDto> aclTDto = clService.getAllClassInfoListByTeacherAccount(users.getAccount()); // sessionAccount
		return aclTDto;
	}

	/* 依課程篩選後之聯絡簿清單 */
	// 【老師】課程選單對應聯絡簿清單
	@GetMapping(value = "/teacherContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListTeacherVerDto> getTeacherContactBookList(@RequestParam("classListId") Integer classListId) { 	
		List<ContactBookListTeacherVerDto> cblTDto = cbService.getTeacherContactBookListByClassListId(classListId); // 1
		return cblTDto;
	}

	/* 共用Json */
	// 【共用】新增/更新聯絡簿頁面上方的課程資訊
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
	
	/* 共用Json */
	// 【老師】點「建立聯絡簿」按鈕要做兩件事：
	// (1) ContactBook：insert一筆帶ClassListId資料
	// (2) ContactBookSign：接著insert一組資料By fk_cb_id, 每個班(fk_classlist_id)的student_id
	@PostMapping(value = "/insertTheClassListIdIntoContactBook.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ContactBook contactBookEstablish(@RequestParam("classListId") Integer classListId) {
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
	} // 某些符號不行...那些不行？前端限制只能打英數中小數點？

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
	
//	/* 取消聯絡簿 */  --  失敗待研究，但也可以試試body.click觸發提醒不讓他跳頁
//	@GetMapping("/ContactBook/T_Cancel")
//	public String teacherCancelOneContactBook(@RequestParam("cbId") Integer cbId) {
//		ContactBook cbBean = cbService.findById(cbId);
//		if (cbBean != null) {
//			cbBean.setPhase(4);
//			cbService.save(cbBean);
//		}
//		return "redirect:/ContactBook/T_Index";
//	}
	
	//------------------------- 校方 -------------------------  進度：已完成 (有加入session測試)
	/* 進入聯絡簿系統 */
	// 【校方】聯絡簿首頁
	@GetMapping("/ContactBook/Sc_Index")
	public String schoolContactBookPage() {
		return "contactBook/school/sccbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【校方】課程選單
	@GetMapping(value = "/allSchoolClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListSchoolVerDto> getAllSchoolClassList(@SessionAttribute("users") Users users) {
		System.out.println("school's sessionAccount = " + users.getAccount()); // AA002
		List<AllClassListSchoolVerDto> aclSDto = clService.getAllClassInfoListBySchoolAccount(users.getAccount()); // sessionAccount
		return aclSDto;
	}
	
	/* 依課程篩選後之聯絡簿清單 */
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
	
	/* 共用Json */
	// 【校方】於首頁挑選其中一筆聯絡簿進行新增/編輯
	@GetMapping(value = "/clickOneContactBook.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ContactBook clickOneContactBookToGoEditing(@RequestParam("cbId") Integer cbId) {
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
	} 
	
	// 【校方】點「回上一頁」
	@GetMapping("/ContactBook/Sc_GoPrevPage")
	public String schoolGoBackToContactBookIndex() {
		return "redirect:/ContactBook/Sc_Index";
	}
	
	/* 查看聯絡簿 */
	// 【校方】聯絡簿細項頁
	@GetMapping("/ContactBook/Sc_Check/{classListId}/{cbId}")
	public String schoolContactBookCheckPage
	(@PathVariable("classListId") Integer classListId, @PathVariable("cbId") Integer cbId) {
		return "contactBook/school/sccbCheck";
	}
	
	/* 共用Json */
	// 【校方】於首頁挑選其中一筆聯絡簿進行查看
	// (1) ContactBook：詳/clickOneContactBook.json
	// (2) ContactBookSign：班上學生及其家長簽名等細項
	@GetMapping(value = "/oneContactBookEachParentSign.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookSign> checkContactBookParentSign(@RequestParam("cbId") Integer cbId){
		List<ContactBookSign> cbsList = cbsService.findContactBookSignByCbId(cbId);
		return cbsList;
	}
	
	/* 取消聯絡簿 */
	@GetMapping("/ContactBook/Sc_Cancel")
	public String schoolCancelOneContactBook(@RequestParam("cbId") Integer cbId) {
		ContactBook cbBean = cbService.findById(cbId);
		if (cbBean != null) {
			cbBean.setPhase(4);
			cbService.save(cbBean);
		}
		return "redirect:/ContactBook/Sc_Index";
	}
	
	//------------------------- 學生 -------------------------  進度：已完成 (有加入session測試)
	/* 進入聯絡簿系統 */
	// 【學生】聯絡簿首頁
	@GetMapping("/ContactBook/St_Index")
	public String studentContactBookPage() {
		return "contactBook/student/stcbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【學生】課程選單
	@GetMapping(value = "/allStudentClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListStudentVerDto> getAllStudentClassList(@SessionAttribute("users") Users users) {
		System.out.println("student's sessionAccount = " + users.getAccount()); // CA001
		List<AllClassListStudentVerDto> aclStuDto = clService.getAllClassInfoListByStudentAccount(users.getAccount()); // sessionAccount
		return aclStuDto;
	}
	
	/* 依課程篩選後之聯絡簿清單 */
	// 【學生】課程選單對應聯絡簿清單
	@GetMapping(value = "/studentContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListStudentVerDto> getStudentContactBookList(@RequestParam("classListId") Integer classListId) { // CA001,1
		List<ContactBookListStudentVerDto> cblStuDto = cbService.getStudentContactBookListByClassListId(classListId);
		return cblStuDto;
	}
	
	//------------------------- 家長 -------------------------  進度：已完成 (有加入session測試)
	/* 進入聯絡簿系統 */	
	// 【家長】聯絡簿首頁
	@GetMapping("/ContactBook/P_Index")
	public String parentContactBookPage() {
		return "contactBook/parent/pcbIndex";
	}
	
	/* 依使用者帳號列出可選擇之課程清單 */
	// 【家長】課程選單
	@GetMapping(value = "/allParentClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<AllClassListParentVerDto> getAllParentClassList(@SessionAttribute("users") Users users) { 
		System.out.println("student's sessionAccount = " + users.getAccount()); // DA001
		List<AllClassListParentVerDto> aclPDto = clService.getAllClassInfoListByParentAccount(users.getAccount()); // sessionAccount
		return aclPDto;
	}
	
	/* 依課程篩選後之聯絡簿清單 */
	// 【家長】課程選單對應聯絡簿清單
	@GetMapping(value="/parentContactBookList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody Map<String,Object> getParentContactBookList
	(@RequestParam("classListId") Integer classListId, @RequestParam("studentId") Integer studentId) { // 1,1
		Map<String,Object> map = new HashMap<>();
		List<ContactBookListParentVerDto> cblpDto = cbService.getParentContactBookListByClassListId(classListId, studentId);
		List<ContactBookSignParentVerDto> cbspDto = cbsService.findParentContactBookByclassListIdAndStudentId(classListId, studentId);
        map.put("cblpDto", cblpDto);    
        map.put("cbspDto", cbspDto);
        return map;
	}
	
	/* 更新簽名紀錄 */
	// 【家長】單筆簽名
	@GetMapping("/ContactBook/P_Update")
	public @ResponseBody void parentSignOneContactBook(@RequestParam("cbsId") Integer cbsId) {
		cbsService.parentSignOneContactBook(cbsId);
	}
	
	//------------------------- Admin ------------------------- 進度：大致已完成，要加入session微調/測試
	/* 進入聯絡簿系統 */	
	// 【Admin】聯絡簿首頁
	@GetMapping("/ContactBook/Ad_Index")
	public String adminContactBookPage() {
		return "contactBook/admin/admincbIndex";
	}
	
	/* 列出所有課程清單 */
	// 【Admin】課程選單找全部課程
	@GetMapping(value="/allAdminClassList.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ClassList> getAllClassList() {
		 List<ClassList> clList = clService.findAll();
		 return clList;
	}
	
	/* 依課程篩選後之聯絡簿清單 */
	// 【Admin】ContactBook清單
	@GetMapping(value="/getAdminContactBookByclassListId.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<ContactBookListAdminVerDto>  geAdminContactBookByclassListId(Integer classListId) {
		List<ContactBookListAdminVerDto> cbDtoList = cbService.getAdminContactBookListByClassListId(classListId);
		return cbDtoList;
	}
	
	/* 新增聯絡簿 */
	// 【Admin】進入新增編輯頁
	@GetMapping("/ContactBook/Ad_Create/{classListId}")
	public String adminContactBookEditPage(@PathVariable("classListId") Integer classListId) {
		return "contactBook/admin/admincbCreate";
	}	
	
	/* 刪除聯絡簿 */
	// 【Admin】點「回上一頁」按鈕，先依當下的cbId抓到cbBean資料，再做以下兩件事：
	//  (1) 若phase == 1，要先完成以下兩件事，才返回聯絡簿首頁
	//      i. 以fk_cb_id刪除ContactBookSign資料
	//		ii.設定classlist_id=null，再刪除ContactBook資料
	//  (2) 若phase != 1，直接返回聯絡簿首頁
	@GetMapping("/ContactBook/Ad_D_GoPrevPage")
	public String adminGoBackToContactBookIndex(@RequestParam("cbId") Integer cbId) {
		ContactBook cbBean = cbService.findById(cbId);
		if (cbBean != null) {
			if (cbBean.getPhase() == 1) {
				cbsService.deleteContactBookSignByCbId(cbId);
				cbBean.setClassList(null);
				cbService.deleteThisContactBookData(cbBean);
			} 
		}
		return "redirect:/ContactBook/Ad_Index";
	}
	
	/* 更新聯絡簿 */
	// 【校方】聯絡簿編輯頁
	@GetMapping("/ContactBook/Ad_Edit/{classListId}/{cbId}")
	public String adminContactBookEditPage
	(@PathVariable("classListId") Integer classListId, @PathVariable("cbId") Integer cbId) {
		return "contactBook/admin/admincbEdit";
	}
	
	// 【校方】點「確認送出」按鈕，進入更新完成頁
	@PostMapping("/ContactBook/Ad_Update/{clsListId}")
	public String adminUpdateOneContactBook(@PathVariable("clsListId") Integer clsListId,
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
		return "contactBook/admin/admincbUpdate";
	} 
	
	// 【Admin】點「回上一頁」
	@GetMapping("/ContactBook/Ad_GoPrevPage")
	public String adminGoBackToContactBookIndex() {
		return "redirect:/ContactBook/Ad_Index";
	}
	
	/* 查看聯絡簿 */
	// 【Admin】聯絡簿細項頁
	@GetMapping("/ContactBook/Ad_Check/{classListId}/{cbId}")
	public String adminContactBookCheckPage
	(@PathVariable("classListId") Integer classListId, @PathVariable("cbId") Integer cbId) {
		return "contactBook/admin/admincbCheck";
	}
	
	/* 共用Json */
	// 【Admin】於首頁挑選其中一筆聯絡簿進行查看
	// (1) ContactBook：詳/clickOneContactBook.json
	// (2) ContactBookSign：詳/oneContactBookEachParentSign.json
	
	/* 取消聯絡簿 */
	@GetMapping("/ContactBook/Ad_Cancel")
	public String adminCancelOneContactBook(@RequestParam("cbId") Integer cbId) {
		ContactBook cbBean = cbService.findById(cbId);
		if (cbBean != null) {
			cbBean.setPhase(4);
			cbService.save(cbBean);
		}
		return "redirect:/ContactBook/Ad_Index";
	}
	
}
