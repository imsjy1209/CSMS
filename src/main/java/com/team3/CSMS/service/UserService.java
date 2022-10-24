package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.UserDao;
import com.team3.CSMS.dto.UserParentDto;
import com.team3.CSMS.dto.UserSchoolDto;
import com.team3.CSMS.dto.UserTeacherDto;
import com.team3.CSMS.dto.UserStudentDto;
import com.team3.CSMS.model.Users;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserDao userDao;

    // 塞資料
    public void insert(Users users){
        userDao.save(users);
    }
 
    // 透過id 找使用者
    public Users findUsersById(Integer usersId){
        Optional<Users> opUsers = userDao.findById(usersId);
        return opUsers.get(); 
    }

    public List<Users> getUsersFromGroupId(Integer groupId){
        List<Users> usersList= userDao.getUsersFromGroupId(groupId);
        return usersList;
    }

   // 透過groupid返回校方人員dto 
   public List<UserSchoolDto> getSchoolFromGroupId(Integer groupId){
    List<Users> usersList= userDao.getUsersFromGroupId(groupId);
    ArrayList<UserSchoolDto> schoolDtoList = new ArrayList<>();
    for (Users oneUser : usersList) {
        UserSchoolDto usDto = new UserSchoolDto(oneUser);
        schoolDtoList.add(usDto);
        }
    return schoolDtoList;
    }

    // 透過groupid返回教師人員dto 
    public List<UserTeacherDto> getTeacherFromGroupId(Integer groupId){
    List<Users> usersList= userDao.getUsersFromGroupId(groupId);
    ArrayList<UserTeacherDto> teacherDtoList = new ArrayList<>();
    for (Users oneUser : usersList) {
        UserTeacherDto utDto = new UserTeacherDto(oneUser);
        teacherDtoList.add(utDto);
    }
    return teacherDtoList;
    }

    // 透過groupid返回學生人員dto 
    public List<UserStudentDto> getStudentFromGroupId(Integer groupId){
        List<Users> usersList= userDao.getUsersFromGroupId(groupId);
        ArrayList<UserStudentDto> studentDtoList = new ArrayList<>();
        for (Users oneUser : usersList) {
            UserStudentDto usDto = new UserStudentDto(oneUser);
            studentDtoList.add(usDto);
        }
        return studentDtoList;
        }
    // 透過groupid返回家長人員dto 
      public List<UserParentDto> getParentFromGroupId(Integer groupId){
        List<Users> usersList= userDao.getUsersFromGroupId(groupId);
        ArrayList<UserParentDto> parentDtoList = new ArrayList<>();
        for (Users oneUser : usersList) {
            UserParentDto upDto = new UserParentDto(oneUser);
            parentDtoList.add(upDto);
        }
        return parentDtoList;
        }
}
