package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.team3.CSMS.dto.UserParentDto;
import com.team3.CSMS.dto.UserSchoolDto;
import com.team3.CSMS.dto.UserTeacherDto;
import com.team3.CSMS.dto.UserStudentDto;
import com.team3.CSMS.model.Groups;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.School;
import com.team3.CSMS.model.Student;
import com.team3.CSMS.model.Teacher;
import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.UserService;

@SessionAttributes(names = {"users","school","teacher","student","parent"})
@Controller
public class UsersController {
	
	
    @Autowired
    private UserService userService;
    
    
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
    
    @GetMapping("login")
    public String login() {
    	return"login/login";
    }
    
    @PostMapping("users/checklogin")
    public String checkLogin(@RequestParam(name="username") String username,@RequestParam(name="pwd") String pwd,Model m) {
    	Users users = userService.checkLogin(username, pwd);
    	if(users !=null) {
			m.addAttribute("users",users);
		} else {
			m.addAttribute("LoginError", "帳號密碼錯誤，請重新輸入");
			return "login/login";
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
            break;
        case 5:
        	Parent parent = users.getParent();
        	m.addAttribute("parent",parent);
            break;     
    	}
    	return "activity/homepage";
    }
    
    @GetMapping("/signout")
	public String deletestu(SessionStatus status,Model m) {
		status.setComplete();
		m.addAttribute("LoginError","已登出");
		return "login/login";
	}
}
