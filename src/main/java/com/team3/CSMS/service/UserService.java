package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.UserDao;
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
}
