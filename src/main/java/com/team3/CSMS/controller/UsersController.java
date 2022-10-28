package com.team3.CSMS.controller;

import java.util.List;

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

import com.team3.CSMS.dto.UserParentDto;
import com.team3.CSMS.dto.UserSchoolDto;
import com.team3.CSMS.dto.UserTeacherDto;
import com.team3.CSMS.dto.UserStudentDto;
import com.team3.CSMS.model.Absent;
import com.team3.CSMS.model.Groups;
import com.team3.CSMS.model.OrderDetail;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Score;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.AbsentService;
import com.team3.CSMS.service.OrderDetailService;
import com.team3.CSMS.service.ParentService;
import com.team3.CSMS.service.ScoreStudentService;
import com.team3.CSMS.service.UserService;

@SessionAttributes(names = {"users","school","teacher","student","parent"})
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
    private AbsentService absentService;
    // 透過ID找到個資
    @GetMapping(value = "/userProfile.json",
                produces = {"application/json;charset=UTF-8"})
    public @ResponseBody Users getProfile( Integer userId){
        Users usersProfile= userService.findUsersById(userId);
        return usersProfile;
    }
    
    
    //======更改Users密碼ById========
    @PostMapping(value = "/updateUsersPwdAjax.controller")
    public @ResponseBody Users updateUsersPwdAjax
    (@RequestParam(name="userId")Integer userId,@RequestParam(name="newPwd")String newPwd,@RequestParam(name="userKeyInPrevPwd")String userKeyInPrevPwd,Model model) {
    	Users oneUsers = userService.findUsersById(userId);
    	String prevPwd = oneUsers.getPassword();
    	
    	if(prevPwd.equals(userKeyInPrevPwd)) {
    		oneUsers.setPassword(newPwd);
    		userService.insert(oneUsers);
//    		model.addAttribute("msg","OK");
    		return oneUsers;
    	}
    	else {
//    		model.addAttribute("msg","NG");
    		return null;
    	}
    }
    //===============更改家長電話byid===============
    @PostMapping(value="/updateUsersPhoneAjax.controller")
    public @ResponseBody Parent updateUsersPhoneAjax(@RequestParam(name="userId")Integer userId,
                                                    @RequestParam(name="newPhone")String newPhone,
                                                    @RequestParam(name="oldCheckPwd")String oldCheckPwd){
            System.out.println("====================controller in");                                            
            Users oneUsers = userService.findUsersById(userId);
            Integer parentId=oneUsers.getParent().getId();
            Parent oneParent=parentService.findById(parentId);
            String oldPwd = oneUsers.getPassword();
            System.out.println("====================if start"); 
            if(oldPwd.equals(oldCheckPwd)) {
                oneParent.setTel(newPhone);;
                parentService.insert(oneParent);
    //    		model.addAttribute("msg","OK");
                return oneParent;
            }
            else {
    //    		model.addAttribute("msg","NG");
                return null;
            }                                            
            
            }
    
    //透過 身分類別找到 使用者清單
    @GetMapping(value = "/GroupProfile.json",
                produces = {"application/json;charset=UTF-8"})
    public @ResponseBody List<Users> getUsersFromGroupId(Integer groupId){
        List <Users> usersList = userService.getUsersFromGroupId(groupId);
        return usersList;
    }

    // 回傳校方頁面
    @GetMapping(value="/getSchoolList.page",
                produces ={"application/json;charset=UTF-8"})
    public @ResponseBody List<UserSchoolDto> getSchoolList(){
        int groupId=2;
        List <UserSchoolDto> usDto=userService.getSchoolFromGroupId(groupId);
        return usDto;
    }

    // 回傳老師頁面
    @GetMapping(value="/getTeacherList.page",
                produces ={"application/json;charset=UTF-8"})
    public @ResponseBody List<UserTeacherDto> getTeacherList(){
        int groupId=3;
        List <UserTeacherDto> utDto=userService.getTeacherFromGroupId(groupId);
        return utDto;
    }

    // 回傳學生頁面
    @GetMapping(value="/getStudentList.page",
                produces ={"application/json;charset=UTF-8"})
    public @ResponseBody List<UserStudentDto> getStudentList(){
        int groupId=4;
        List <UserStudentDto> usDto=userService.getStudentFromGroupId(groupId);
        return usDto;
    }

    // 回傳家長頁面
    @GetMapping(value="/getParentList.page",
    produces ={"application/json;charset=UTF-8"})
    public @ResponseBody List<UserParentDto> getParentList(){
    int groupId=5;
    List <UserParentDto> upDto=userService.getParentFromGroupId(groupId);
    return upDto;
    }


    // 更改人員權限
    @GetMapping(value="/updateUsersPermisson")
    public @ResponseBody void updateUserPermisson (@RequestParam(name="userId")Integer userId,@RequestParam(name="permission") Integer permission){
        Users users=userService.findUsersById(userId);
        users.setAccRight(permission);
        userService.insert(users);
        // return "redirect:/absentUpdate.page"
    }  

    
    @GetMapping("login")
    public String login() {
    	return"login/login";
    }
    
//    @PostMapping("users/checklogin")
//    public String checkLogin(@RequestParam(name="username") String username,@RequestParam(name="pwd") String pwd,SessionStatus status,Model m) {
//    	Users users = userService.checkLogin(username, pwd);
//    	// if(users.getIsFirst() == 1){
//        //     return "users/firstlogin";
//        // }     
//        if(users !=null) {
//			m.addAttribute("users",users);
//		} else {
//			m.addAttribute("LoginError", "帳號密碼錯誤，請重新輸入");
//			return "login/login";
//		}
//        if(users.getAccRight()==0){
//            m.addAttribute("LoginError", "帳號無登入權限，請聯絡工作人員");
//			status.setComplete();
//            return "login/login";
//        }
//        if(users.getIsFirst()==1){
//            return "users/firstlogin";
//        }
//    	Groups groups = users.getGroups();
//    	Integer id = groups.getId();
//    	switch(id) {
////        case 1:
////        	users.getadmin();
////            break;
//        case 2:
//            School school = users.getSchool();
//            m.addAttribute("school",school);
//            break;
//        case 3:
//            Teacher teacher = users.getTeacher();
//            m.addAttribute("teacher",teacher);
//            break;
//        case 4:
//            Student student = users.getStudent();
//            m.addAttribute("student",student);
//            
//            List<OrderDetail> aOrderDetailList = orderDetailService.findByStudentIs(student);
//            m.addAttribute("aOrderDetailList",aOrderDetailList);
//            break;
//        case 5:
//        	Parent parent = users.getParent();
//        	m.addAttribute("parent",parent);
//            break;     
//    	}
//    	return "activity/homepage";
//    }
    
    @PostMapping("users/checklogin")
    public String checkLogin(@RequestParam(name="username") String username,@RequestParam(name="pwd") String pwd,SessionStatus status,Model m) {
    	Users users = userService.checkLogin(username, pwd);
    	// if(users.getIsFirst() == 1){
        //     return "users/firstlogin";
        // }     
        if(users == null) {
        	m.addAttribute("LoginError", "帳號密碼錯誤，請重新輸入");
			return "login/login";		
		} else if(users.getAccRight() ==0){
			m.addAttribute("LoginError", "帳號無登入權限，請聯絡工作人員");
            return "login/login";
		}else if(users.getIsFirst() == 1) {
			m.addAttribute("users",users);
			return "login/firstLogin";
		}else {
			m.addAttribute("users",users);
		}
    	Groups groups = users.getGroups();
    	Integer id = groups.getId();
    	switch(id) {
//        case 1:
//        	users.getadmin();
//            break;
        case 2:
            School school = users.getSchool();
            m.addAttribute("school",school);
            break;
        case 3:
            Teacher teacher = users.getTeacher();
            m.addAttribute("teacher",teacher);
            break;
        case 4:
            Student student = users.getStudent();
            m.addAttribute("student",student);
            List<OrderDetail> aOrderDetailList = orderDetailService.findByStudentIs(student);
            List<Absent> personalAbsent=absentService.selectAbsentByStudent(student);
            List<Score> scoreforStudent = scoreStudentService.getScoreforStudent(student);
            m.addAttribute("aOrderDetailList",aOrderDetailList);
            m.addAttribute("personalAbsent", personalAbsent);
            m.addAttribute("scoreforStudent",scoreforStudent);
            break;
        case 5:
        	Parent parent = users.getParent();
        	m.addAttribute("parent",parent);
            break;     
    	}
    	return "cs_studentHomePage/studentHomepage";
    }
    
    @PostMapping(value = "users/updateFirstLogin")
    public String updateFirstLogin
    (@SessionAttribute("users") Users users,@RequestParam(name="newPassword")String newPwd,Model model,SessionStatus status) {
    	users.setPassword(newPwd);
    	users.setIsFirst(0);
    	userService.insert(users);
    	status.setComplete();
    	return"redirect:/login";
    }
    
    @GetMapping("/CSMSHomePage")
    public String goToHomePage() {
    	return "activity/homepage";
    }
    
    @GetMapping("/signout")
	public String deletestu(SessionStatus status,Model m) {
		status.setComplete();
		m.addAttribute("LoginError","已登出");
		return "login/login";
	}

    @GetMapping("/users/open/{id}")
    public String openAccount(@PathVariable int id){
    	userService.open(id);
    	return"register/manageusers";
    }
    @GetMapping("/users/close/{id}")
    public String closeAccount(@PathVariable int id){
    	System.out.println("close"+id);
    	userService.close(id);
    	return"register/manageusers";
    }
}
