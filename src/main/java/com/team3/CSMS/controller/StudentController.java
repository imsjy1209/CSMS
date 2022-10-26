package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
