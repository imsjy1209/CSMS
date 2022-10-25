package com.team3.CSMS.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.team3.CSMS.model.School;
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

}
