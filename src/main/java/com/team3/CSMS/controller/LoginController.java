package com.team3.CSMS.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.CSMS.model.Groups;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.GroupService;
import com.team3.CSMS.service.ParentService;
import com.team3.CSMS.service.SchoolService;
import com.team3.CSMS.service.StudentService;
import com.team3.CSMS.service.TeacherService;
import com.team3.CSMS.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService uSer;
	@Autowired
	private SchoolService sSer;
	@Autowired
	private TeacherService tSer;
	@Autowired
	private StudentService stSer;
	@Autowired
	private ParentService pSer;
	@Autowired
	private GroupService gSer;
	
	@GetMapping("register/form")
	public String form() {
		return "register/registerform";
	}
	
	@GetMapping("register/edit")
	public String edit() {
		return "register/manageusers";
	}
	
	@GetMapping("register/addschool")
	public String addschool(
			@RequestParam("account") String account,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("title") String title,
			@RequestParam("hiredate") String hiredate,
			@RequestParam("resigndate") String resigndate) throws ParseException {
		java.text.SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(hiredate);
		Date date1 = formatter.parse(resigndate);
		Groups groups = gSer.findById(2);
		Users users = new Users(account,password,groups);
		uSer.insert(users);
		School school = new School(users,name,title,date,date1);
		sSer.insert(school);
		return "register/registerform";
	}
	
	@GetMapping("register/addteacher")
	public String addteacher(
			@RequestParam("account") String account,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("title") String title,
			@RequestParam("hiredate") String hiredate,
			@RequestParam("resigndate") String resigndate,
			@RequestParam("expertise") String expertise) throws ParseException {
		java.text.SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(hiredate);
		Date date1 = formatter.parse(resigndate);
		Groups groups = gSer.findById(3);
		Users users = new Users(account,password,groups);
		uSer.insert(users);
		Teacher teacher = new Teacher(users,name,title,date,date1,expertise);
		tSer.insert(teacher);
		return "register/registerform";
	}
	@GetMapping("register/addStudent")
	public String addStudent(
			@RequestParam("account") String account,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("gender") String gender,
			@RequestParam("schoolType") String schoolType,
			@RequestParam("schoolName") String schoolName,
			@RequestParam("grade") String grade,
			@RequestParam("parentname") String parentname,
			@RequestParam("relationship") String relationship) throws ParseException {
		Groups groups = gSer.findById(4);
		Users users = new Users(account,password,groups);
		uSer.insert(users);
		Parent parent = pSer.searchParentByname(parentname);
		Student student = new Student(users,name,gender,schoolType,schoolName,grade,parent,relationship);
		stSer.insert(student);
		return "register/registerform";
	}
	
	@GetMapping("register/addParent")
	public String addParent(
			@RequestParam("account") String account,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("gender") String gender,
			@RequestParam("tel") String tel,
			@RequestParam("email") String email) throws ParseException {
		Groups groups = gSer.findById(5);
		Users users = new Users(account,password,groups);
		uSer.insert(users);
		Parent parent = new Parent(users,name,gender,tel,email);
		pSer.insert(parent);
		return "register/registerform";
	}
	
//	@GetMapping("/a")
//	public String scoreEdit() {
//		return "/cs_score/scoreEdit";
//	}
	
	
}
