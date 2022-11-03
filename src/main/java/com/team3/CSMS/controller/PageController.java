package com.team3.CSMS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PageController {
	
	@GetMapping("/course.page")
	public String coursePage() {
		return "cs_course/courseIndex";
	}
	
	@GetMapping("/ecpayOk.page")
	public String ecpayOk() {
		return "cs_orderList/orderListIndex";
	}
	
	@GetMapping("/sideBarCheck")
	public String testPage() {
		return "framePage/sideBar";
	}
	
	//商品結帳頁面-OrderDetail=>OrderList(for前台)
	@GetMapping("/orderPage")
	public String OrderDetailPage() {
		return "cs_orderPage/orderPage";
	}
	
	//商品All頁面-Course(for前台)
	@GetMapping("/courseAllOnPageAjax.page")
	public String courseAllOnPage() {
		return "cs_course/courseIndexAjax";
	}
	
//	//商品All頁面-Course(for前台)
//	@GetMapping("/courseAllOnPageAjax2.page")
//	public String courseAllOnPage2() {
//		return "cs_course/courseIndexAjax2";
//	}
	
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
	
	//商品Create頁面Ajax-Course(for後台)
	@GetMapping("/courseCreateAjax.page")
	public String courseCreateAjax() {
		return "cs_course/courseCreateTest";
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
	// 出缺勤跳轉
	@GetMapping("/absent.page")
	public String absentCheckPage(){
		return "cs_absent/absentCheck";
	}

	
	@GetMapping("/scoreAdd.page")
	public String scoreAddPage() {
		return "cs_score/scoreAdd";}

	// 更改出缺勤
	@GetMapping("/absentUpdate.page")
	public String absentUpdatePage(){
		return "cs_absent/absentUpdate";
	}
	
	// 傳送訊息跳轉
	// @GetMapping("/messages.page")
	// public String messagesPage(){
	// 	return "cs_messagez/messagez";
	// }

	// 更改個人密碼用
	@GetMapping("/passw0rdUpdate.page")
	public String pwdUpdatePage(){
		return "cs_updateProfile/updatePWD";
	}
	
	// 更改School密碼用----Neil
	@GetMapping("/passw0rdUpdateForQueen.page")
	public String passw0rdUpdateForQueen(){
		return "cs_updateProfile/updatePwdForSchool";
	}

	// 更改成員權限
	@GetMapping("/userControl.page")
	public String usersControl(){
		return "cs_user/userUpdate";

	}

	@GetMapping("/controlUser")
	public String Control() {
		return "/register/controllUser";
	}
	

//	@GetMapping("/youAreFirst")
//	public String firstLogin(){
//		return "/login/firstLogin";
//	}

//	// 測試用
	@GetMapping("/dongdong")
	public String testme(){
		return "/testDontUse/test";	
	}
	
	@GetMapping("/youAreFirst")
	public String firstLogin2(){
		return "/login/firstLoginTest";
	}
	
}
