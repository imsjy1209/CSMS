package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;

@Controller
public class MessageController {

	@GetMapping("message")
	public String test() {
		return "message/messagez";
	}
	
	@GetMapping("/message/getteacher")
	public @ResponseBody Student getschool(@SessionAttribute("parent") Parent parent){
		List<Student> students = parent.getStudent();
		Student student = students.get(0);;
		System.out.println(student.getId());
//		School school= students.get(0).getClassStudentLists().get(0).getClassList().getSchool();
//		System.out.println(school.getName());
		return student;
	}
	
	
//	@GetMapping("/a")
//	public String scoreEdit() {
//		return "/cs_score/scoreEdit";
//	}
	
	
}
