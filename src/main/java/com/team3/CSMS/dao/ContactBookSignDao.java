package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ContactBookSign;

public interface ContactBookSignDao extends JpaRepository<ContactBookSign, Integer> {

	// 【老師】點「回上一頁」：以fk_cb_id刪除ContactBookSign資料
	@Modifying
	@Query(value = "delete from ContactBookSign where [fk_cb_id] = :cbId", nativeQuery = true)
    void deleteContactBookSignByCbId(@Param("cbId") Integer cbId);
    
    // 【校方】單筆查看：以fk_cb_id查詢ContactBookSign資料
    @Query(value = "select *  from [ContactBookSign] as CBS "
    		+ "inner join [Student] as S on S.[student_id] = CBS.[fk_student_id] "
    		+ "inner join [Parent] as P on P.[parent_id]  = S.[fk_parent_id] "
    		+ "inner join [ClassStudentList] as CSL on CSL.[fk_student_id] = S.[student_id] "
    		+ "where [fk_cb_id] = :cbId order by [studentNo] asc", nativeQuery = true)
    List<ContactBookSign> findContactBookSignByCbId(@Param("cbId") Integer cbId);
    
}

//--------------------------------- Yan's Note (勿刪) ---------------------------------
//  // 【原方法】老師點「建立聯絡簿」，同時insert一組資料By fk_cb_id, 每個班(fk_classlist_id)的student_id
//  @Query(value = "insert into ContactBookSign (fk_student_id, fk_cb_id) values (:studentId, :cbId)", nativeQuery = true)
//  @Modifying // 問題：為何這邊的insert要@Modifying才會成功？
//  void insertContactBookSignByCbIdAndStudentId(@Param("studentId") Integer studentId, @Param("cbId") Integer cbId);