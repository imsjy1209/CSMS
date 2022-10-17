package com.team3.CSMS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String test() {
		return "test";
	}
	
	
//	@GetMapping("/a")
//	public String scoreEdit() {
//		return "/cs_score/scoreEdit";
//	}
	
	
}
