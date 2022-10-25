package com.team3.CSMS.dao;

import java.util.List;

import javax.servlet.jsp.jstl.sql.Result;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.ContactBook;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Score;

public interface ParentDao extends JpaRepository<Parent, Integer> {

	// 【Score】家長查詢學生課堂資訊
	@Query(value = "SELECT * from [Parent] as P " 
			+ "inner join [Student] as S on P.[parent_id] = S.[fk_parent_id] "
			+ "full join [Score] on [Score].[fk_parent_id]=P.[parent_id] "
			+ "where P.[fk_user_id] = (select [users_id] from [Users] where [users_id] = :sessionUserId)", nativeQuery = true)
	List<Parent> getChildScoreListByParentId(@Param("sessionUserId") Integer sessionUserId);

}
