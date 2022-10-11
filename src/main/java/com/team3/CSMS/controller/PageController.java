package com.team3.CSMS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	
	@GetMapping("/course.page")
	public String coursePage() {
		return "cs_course/courseIndex";
	}
	
	@GetMapping("/sideBarCheck")
	public String testPage() {
		return "framePage/sideBar";
	}
	
	//商品All頁面-Course(for前台)
	@GetMapping("/courseAllOnPageAjax.page")
	public String courseAllOnPage() {
		return "cs_course/courseIndexAjax";
	}
	
	//商品All頁面-Course(for後台)
	@GetMapping("/courseAllPageBackAjax.page")
	public String courseAllPageBackAjax() {
		return "cs_course/courseIndexBackAjax";
	}
	
//	//商品All頁面-Course(for後台)test
//	@GetMapping("/courseAllPageBackAjax2.page")
//	public String courseAllPageBackAjax2() {
//		return "cs_course/courseIndexBackAjax2";
//	}
	
	//商品Create頁面-Course(for後台)
	@GetMapping("/courseCreate.page")
	public String courseCreatePage() {
		return "cs_course/courseCreate";
	}
	
	//教室Create頁面-Room(for後台)
	@GetMapping("/roomCreate.page")
	public String roomCreatePage() {
		return "cs_room/roomCreate";
	}
	
	//教室findAll頁面-Room(for後台)
	@GetMapping("/roomIndex.page")
	public String roomAllPage() {
		return "cs_room/roomIndex";
	}
	
	//教室Update頁面-Room(for後台)
	@GetMapping("/roomUpdate.page")
	public String roomUpdatePage() {
		return "cs_room/roomUpdate";
	}

}
