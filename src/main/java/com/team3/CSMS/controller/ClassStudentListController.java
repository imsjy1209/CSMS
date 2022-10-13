package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.service.ClassStudentListService;

@Controller
public class ClassStudentListController {
	
	@Autowired
	private ClassStudentListService classStudentListService;
	
	//找全部班級對應學生清單
		@GetMapping("/findAllClassStudentList.controller")
		public String findAllClassStudentList(Model model) {
			 List<ClassStudentList> cslList = classStudentListService.findAllClassStudentList();
			 model.addAttribute("cslList", cslList);
			 return "cs_classStudentList/classStudentListIndex";
		}
	//找全部班級對應學生清單
		@GetMapping(value = "/findAllClassStudentListAjax.controller",produces = {"application/json;charset=UTF-8"})
		public @ResponseBody List<ClassStudentList> findAllClassStudentListAjax(Model model) {
			 List<ClassStudentList> cslList = classStudentListService.findAllClassStudentList();
			 
			 for(ClassStudentList oneCSL:cslList) {
				 ClassList classList = oneCSL.getClassList();
				 String classCode = classList.getClassCode();
				 System.out.println(classCode);
			 }
			 System.out.println(cslList);
			 return cslList;
		}
		
	//找單一班級對應學生清單
		@GetMapping("/findClassStudentListByClassListId.controller")
		public @ResponseBody List<ClassStudentList> findClassStudentListByClassListId(@RequestParam(name="id")String id,Model model) {
			 List<ClassStudentList> cslList = classStudentListService.findClassStudentListByClassListId(id);
//			 model.addAttribute("cslList", cslList);
			 return cslList;
		}	
		

}
