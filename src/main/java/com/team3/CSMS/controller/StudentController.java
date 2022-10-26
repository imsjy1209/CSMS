package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.service.StudentService;
import com.team3.CSMS.service.TeacherService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService sSer;
	
	//find All Teacher--Ajax
	@GetMapping("/findAllStudentAjax.controller")
	public @ResponseBody List<Student> findAllStudentAjax() {
		List<Student> StudentList = sSer.findall();
		return StudentList;
	}
	
	@GetMapping("student/edit")
	public String edit() {
		return "edit/studentEdit";
	}
	
	@PostMapping("student/update")
	public String update(@RequestParam("name")String name,
			@RequestParam("gender")String gender,
			@RequestParam("schoolType")String schoolType,
			@RequestParam("schoolName")String schoolName,
			@RequestParam("grade")String grade,
			@SessionAttribute("student") Student student) {
		student.setName(name);
		student.setGender(gender);
		student.setSchoolType(schoolType);
		student.setSchoolName(schoolName);
		student.setGrade(grade);
		sSer.insert(student);
		return "edit/studentEdit";
	}
	
}
