package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.service.TeacherService;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
	//find All Teacher--Ajax
	@GetMapping("/findAllTeacherAjax.controller")
	public @ResponseBody List<Teacher> findAllTeacherAjax() {
		List<Teacher> teacherList = teacherService.findAllTeacher();
		return teacherList;
	}
	

}
