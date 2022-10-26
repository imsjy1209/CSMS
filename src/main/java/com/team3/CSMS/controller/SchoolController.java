package com.team3.CSMS.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.service.SchoolService;

@Controller
public class SchoolController {
	
	@Autowired
	private SchoolService schoolService;
	
	//find All School--Ajax
	@GetMapping("/findAllSchoolAjax.controller")
	public @ResponseBody List<School> findAllSchoolAjax() {
		List<School> schoolList = schoolService.findAllSchool();
		return schoolList;
	}

//	@GetMapping("school/edit")
//	public String edit() {
//		return "edit/schoolEdit";
//	}
//	
//	@PostMapping("school/update")
//	public String update(@RequestParam("name")String name,
//			@RequestParam("gender")String gender,
//			@RequestParam("schoolType")String schoolType,
//			@RequestParam("schoolName")String schoolName,
//			@RequestParam("grade")String grade,
//			@SessionAttribute("student") Student student) {
//		student.setName(name);
//		student.setGender(gender);
//		student.setSchoolType(schoolType);
//		student.setSchoolName(schoolName);
//		student.setGrade(grade);
//		schoolService.insert(student);
//		return "edit/studentEdit";
//	}
	
}
