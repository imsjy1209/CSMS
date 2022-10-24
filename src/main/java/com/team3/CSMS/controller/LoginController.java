package com.team3.CSMS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("register/form")
	public String form() {
		return "register/registerform";
	}
	
	
//	@GetMapping("/a")
//	public String scoreEdit() {
//		return "/cs_score/scoreEdit";
//	}
	
	
}
