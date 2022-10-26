package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Users;

public interface UserDao extends JpaRepository<Users,Integer> {

    // @Modifying
    // @Query(value ="update Users set [password]=:newPwd "+
    // "where users_id =:usersId and [password]=oldPwd", nativeQuery = true)
    // void upDatePassword(@Param("newPwd")String newPwd,@Param("usersId")Integer usersId,@Param("oldPwd")String oldPwd);
    
    @Query(value="select * from Users where fk_groups_id= :groupId",nativeQuery = true)
    List<Users> getUsersFromGroupId(@Param("groupId")Integer groupId);

    @Query(value="from Users where account = :account and password = :password")
    Users checkLogin(@Param("account")String account,@Param("password")String password);
    
    @Modifying
    @Query(value="update users set accRight=1 where users_id=:id",nativeQuery = true)
    public void open(@Param("id") int id);
    
    @Modifying
    @Query(value="update users set accRight=0 where users_id=:id",nativeQuery = true)
    public void close(@Param("id") int id);
}
