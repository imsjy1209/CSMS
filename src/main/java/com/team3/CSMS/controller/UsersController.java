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

import com.team3.CSMS.model.Users;
import com.team3.CSMS.service.UserService;

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
    public @ResponseBody List<Users> getUsersFromGroupId( Integer groupId){
        List <Users> usersList = userService.getUsersFromGroupId(groupId);
        return usersList;
    }
    // @PostMapping("/messages/post")
	// public String postMsg(@ModelAttribute(name="pwd") Messages msg, Model model) {
	// 	mService.insert(msg);
    //     Messages m1 = new Messages();
	// 	model.addAttribute("messages", m1);
	// 	Messages lastestMsg = mService.findLastest();
	// 	model.addAttribute("lastestMsg", lastestMsg);
	// 	return "messages/addMessagePage"; 
	// }
    
}
