package com.team3.CSMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.CSMS.dto.UserParentDto;
import com.team3.CSMS.dto.UserSchoolDto;
import com.team3.CSMS.dto.UserTeacherDto;
import com.team3.CSMS.dto.UserStudentDto;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.ParentService;
import com.team3.CSMS.service.UserService;

@Controller
public class UsersController {
	
    @Autowired
    private UserService userService;
    
    @Autowired
    private ParentService parentService;
    
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
            Parent oneParent=parentService.findParentById(parentId);
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
}
