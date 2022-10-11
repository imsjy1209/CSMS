package com.team3.CSMS.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.ClassRecord;
import com.team3.CSMS.model.Course;
import com.team3.CSMS.service.ClassRecordService;

@Controller
public class ClassRecordController {
	
	@Autowired
	private ClassRecordService classRecordService;
	
	//找全部課程
		@GetMapping("/findAllClassRecord.controller")
		public String findAllClassRecord(Model model) {
			 List<ClassRecord> classRecordList = classRecordService.findAllClassRecord();
			 model.addAttribute("classRecordList", classRecordList);
			 return "cs_classRecord/classRecordIndex";
		}
		
		//找全部課程
		@GetMapping("/findAllClassRecordAjax.controller")
		public @ResponseBody List<ClassRecord> findAllClassRecordAjax(Model model) {
			 List<ClassRecord> classRecordList = classRecordService.findAllClassRecord();
			 return classRecordList;
		}

}
