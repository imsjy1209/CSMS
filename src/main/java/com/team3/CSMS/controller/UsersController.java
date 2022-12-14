package com.team3.CSMS.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.CSMS.dto.UserParentDto;
import com.team3.CSMS.dto.UserSchoolDto;
import com.team3.CSMS.dto.UserStudentDto;
import com.team3.CSMS.dto.UserTeacherDto;
import com.team3.CSMS.model.Absent;
import com.team3.CSMS.model.Activity;
import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.ContactBook;
import com.team3.CSMS.model.Groups;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Post;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.AbsentService;
import com.team3.CSMS.service.ClassStudentListService;
import com.team3.CSMS.service.ContactBookService;
import com.team3.CSMS.service.OrderDetailService;
import com.team3.CSMS.service.ParentService;
import com.team3.CSMS.service.PostService;
import com.team3.CSMS.service.ScoreService;
import com.team3.CSMS.service.ScoreStudentService;
import com.team3.CSMS.service.StudentService;
import com.team3.CSMS.service.UserService;

@SessionAttributes(names = {"users","school","teacher","student","parent","shoppingCart"})
@Controller
public class UsersController {

	@Autowired
	private UserService userService;

	@Autowired
	private ParentService parentService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private ScoreStudentService scoreStudentService;

	@Autowired
	private ScoreService scoreService;

	@Autowired
	ContactBookService contactBookService;

	@Autowired
	private AbsentService absentService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ClassStudentListService classStudentListService;

	// ??????ID????????????
	@GetMapping(value = "/userProfile.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody Users getProfile(Integer userId) {
		Users usersProfile = userService.findUsersById(userId);
		return usersProfile;
	}

	// ======??????Users??????ById========
	@PostMapping(value = "/updateUsersPwdAjax.controller")
	public @ResponseBody Users updateUsersPwdAjax(@RequestParam(name = "userId") Integer userId,
			@RequestParam(name = "newPwd") String newPwd,
			@RequestParam(name = "userKeyInPrevPwd") String userKeyInPrevPwd, Model model) {
		Users oneUsers = userService.findUsersById(userId);
		String prevPwd = oneUsers.getPassword();

		if (prevPwd.equals(userKeyInPrevPwd)) {
			oneUsers.setPassword(newPwd);
			userService.insert(oneUsers);
//    		model.addAttribute("msg","OK");
			return oneUsers;
		} else {
//    		model.addAttribute("msg","NG");
			return null;
		}
	}

	// ===============??????????????????byid===============
	@PostMapping(value = "/updateUsersPhoneAjax.controller")
	public @ResponseBody Parent updateUsersPhoneAjax(@RequestParam(name = "userId") Integer userId,
			@RequestParam(name = "newPhone") String newPhone, @RequestParam(name = "oldCheckPwd") String oldCheckPwd) {
		System.out.println("====================controller in");
		Users oneUsers = userService.findUsersById(userId);
		Integer parentId = oneUsers.getParent().getId();
		Parent oneParent = parentService.findById(parentId);
		String oldPwd = oneUsers.getPassword();
		System.out.println("====================if start");
		if (oldPwd.equals(oldCheckPwd)) {
			oneParent.setTel(newPhone);
			;
			parentService.insert(oneParent);
			// model.addAttribute("msg","OK");
			return oneParent;
		} else {
			// model.addAttribute("msg","NG");
			return null;
		}

	}

	// ?????? ?????????????????? ???????????????
	@GetMapping(value = "/GroupProfile.json", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<Users> getUsersFromGroupId(Integer groupId) {
		List<Users> usersList = userService.getUsersFromGroupId(groupId);
		return usersList;
	}

	// ??????????????????
	@GetMapping(value = "/getSchoolList.page", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<UserSchoolDto> getSchoolList() {
		int groupId = 2;
		List<UserSchoolDto> usDto = userService.getSchoolFromGroupId(groupId);
		return usDto;
	}

	// ??????????????????
	@GetMapping(value = "/getTeacherList.page", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<UserTeacherDto> getTeacherList() {
		int groupId = 3;
		List<UserTeacherDto> utDto = userService.getTeacherFromGroupId(groupId);
		return utDto;
	}

	// ??????????????????
	@GetMapping(value = "/getStudentList.page", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<UserStudentDto> getStudentList() {
		int groupId = 4;
		List<UserStudentDto> usDto = userService.getStudentFromGroupId(groupId);
		return usDto;
	}

	// ??????????????????
	@GetMapping(value = "/getParentList.page", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody List<UserParentDto> getParentList() {
		int groupId = 5;
		List<UserParentDto> upDto = userService.getParentFromGroupId(groupId);
		return upDto;
	}

	// ??????????????????
	@GetMapping(value = "/updateUsersPermisson")
	public @ResponseBody void updateUserPermisson(@RequestParam(name = "userId") Integer userId,
			@RequestParam(name = "permission") Integer permission) {
		Users users = userService.findUsersById(userId);
		users.setAccRight(permission);
		userService.insert(users);
		// return "redirect:/absentUpdate.page"
	}

	@GetMapping("login")
	public String login() {
		return "login/login";
	}


	@PostMapping("users/checklogin")
	public String checkLogin(@RequestParam(name = "username") String username, @RequestParam(name = "pwd") String pwd,
			SessionStatus status, Model m, RedirectAttributes rm) {
		Users users = userService.checkLogin(username, pwd);
		if (users == null) {
			//m.addAttribute("LoginError", "????????????????????????????????????");
			//return "login/login";
			rm.addFlashAttribute("LoginError","????????????????????????????????????"); // ??????redirect+??????modal
			return "redirect:/login";
		} else if (users.getAccRight() == 0) {
			//m.addAttribute("LoginError", "?????????????????????????????????????????????");
			//return "login/login";
			rm.addFlashAttribute("LoginError","?????????????????????????????????????????????"); // ??????redirect+??????modal
			return "redirect:/login";
		} else if (users.getIsFirst() == 1) {
			m.addAttribute("users", users);
			return "login/firstLoginTest";
		} else {
			m.addAttribute("users", users);
		}
		Groups groups = users.getGroups();
		Integer id = groups.getId();
		switch (id) {
        case 1:
        	return "cs_course/courseIndexBackAjax"; // Admin-??????
		case 2:
			School school = users.getSchool();
			m.addAttribute("school", school);
			return "redirect:/ContactBook/Sc_Index"; // ??????(??????)-??????
		
		case 3:
			Teacher teacher = users.getTeacher();
			m.addAttribute("teacher", teacher);
			List<Post> pListAll = postService.viewAllByAll();
			m.addAttribute("pListAll", pListAll);
			return "cs_homePage/teacherHomepage"; // ??????-??????
			
		case 4:
			Student student = users.getStudent();
			m.addAttribute("student", student);
			
			//======Course Info which already have===========
			List<OrderDetail> oneOrderList = orderDetailService.findByStudentIsAndConfirmOrderIs(student, 2);
			//======End of Course Info which already have====
			
			//======Class Info===============================
			List<ClassStudentList> oneCSL = classStudentListService.findByStudentIs(student);
			//======End of Class Info========================
			
			List<OrderDetail> aOrderDetailList = orderDetailService.findByStudentIs(student);
			List<Absent> personalAbsent = absentService.selectAbsentByStudent(student);
			List<Score> scoreforStudent = scoreStudentService.getScoreforStudent(student.getId());
			List<ContactBook> top3cbList = contactBookService.getTop3StudentContactBookList(student.getId());
			Set<Activity> activities = studentService.getMyAct(student.getId());
			m.addAttribute("aOrderDetailList", aOrderDetailList);
			m.addAttribute("personalAbsent", personalAbsent);
			m.addAttribute("scoreforStudent", scoreforStudent);
			m.addAttribute("top3cbList", top3cbList);
			m.addAttribute("activities", activities);
			
			m.addAttribute("oneOrderDetailList", oneOrderList);
			m.addAttribute("oneCSL", oneCSL);
			
			return "cs_homePage/studentHomepage"; // ??????-??????	 
			
        case 5:
        	Parent parent = users.getParent();
        	m.addAttribute("parent",parent);       	         
			//List<Score> scoreforParent = scoreService.getscoreforParent(parent); // ????????????3???
			List<Absent> kidsAbsent = new ArrayList<Absent>(); 
			List<Score> scoreforParent = scoreService.top3ScoreforParent(parent.getId());
			List<Post> pListforAll = postService.viewAllByAll();
			List<Student> kids=studentService.getKidByParent(parent);
			for(Student kid: kids){
				List<Absent> goToSchool=absentService.selectAbsentByStudent(kid);
				for(Absent a:goToSchool){
					kidsAbsent.add(a);
				}
			}
			m.addAttribute("scoreforParent",scoreforParent);
			m.addAttribute("pListforAll", pListforAll);
			m.addAttribute("kidsGotoSchool", kidsAbsent);
            return "cs_homePage/parentHomepage"; // // ??????-??????
    	}
    	return "cs_homePage/parentHomepage"; // ?????????????????????
    }
    
	@GetMapping("users/gotohomepage")
	public String gotoHomePage(@SessionAttribute("users") Users users, Model m) {
		Groups groups = users.getGroups();
		Integer id = groups.getId();
		switch (id) {
		case 3:
			Teacher teacher = users.getTeacher();
			m.addAttribute("teacher", teacher);
			List<Post> pListAll = postService.viewAllByAll();
			m.addAttribute("pListAll", pListAll);
			return "cs_homePage/teacherHomepage";
		case 4:
			Student student = users.getStudent();
			
			//======Course Info which already have===========
			List<OrderDetail> oneOrderList = orderDetailService.findByStudentIsAndConfirmOrderIs(student, 2);
			//======End of Course Info which already have====
			
			//======Class Info===============================
			List<ClassStudentList> oneCSL = classStudentListService.findByStudentIs(student);
			//======End of Class Info========================
			
			List<OrderDetail> aOrderDetailList = orderDetailService.findByStudentIs(student);
			List<Absent> personalAbsent = absentService.selectAbsentByStudent(student);
			List<Score> scoreforStudent = scoreStudentService.getScoreforStudent(student.getId());
			List<ContactBook> top3cbList = contactBookService.getTop3StudentContactBookList(student.getId());
			Set<Activity> activities = studentService.getMyAct(student.getId());
			m.addAttribute("aOrderDetailList", aOrderDetailList);
			m.addAttribute("personalAbsent", personalAbsent);
			m.addAttribute("scoreforStudent", scoreforStudent);
			m.addAttribute("top3cbList", top3cbList);
			m.addAttribute("activities", activities);
			m.addAttribute("oneOrderDetailList", oneOrderList);
			m.addAttribute("oneCSL", oneCSL);
			return "cs_homePage/studentHomepage";
		case 5:
			Parent parent = users.getParent();
			List<Score> scoreforParent = scoreService.getscoreforParent(parent);
			List<Post> pListforAll = postService.viewAllByAll();
			m.addAttribute("scoreforParent",scoreforParent);
			m.addAttribute("pListforAll", pListforAll);
			return "cs_homePage/parentHomepage";
		}
		return "cs_homePage/teacherHomepage";
	}

	@PostMapping(value = "users/updateFirstLogin")
	public String updateFirstLogin(@SessionAttribute("users") Users users,
			@RequestParam(name = "newPassword") String newPwd, Model model, SessionStatus status) {
		users.setPassword(newPwd);
		users.setIsFirst(0);
		userService.insert(users);
		status.setComplete();
		return "redirect:/login";
	}

	@GetMapping("/CSMSHomePage")
	public String goToHomePage() {
		return "activity/homepage";
	}

	@GetMapping("/signout")
	public String deletestu(SessionStatus status, Model m) {
		status.setComplete();
		m.addAttribute("LoginError", "?????????");
		return "login/login";
	}

	@GetMapping("/users/open/{id}")
	public String openAccount(@PathVariable int id) {
		userService.open(id);
		return "register/manageusers";
	}

	@GetMapping("/users/close/{id}")
	public String closeAccount(@PathVariable int id) {
		System.out.println("close" + id);
		userService.close(id);
		return "register/manageusers";
	}
}
