package com.team3.CSMS.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.ContactBookSign;

public interface ContactBookSignDao extends JpaRepository<ContactBookSign, Integer> {

	// 老師點「回上一頁」：以fk_cb_id刪除ContactBookSign資料
    @Query(value = "delete from ContactBookSign where [fk_cb_id] = :cbId", nativeQuery = true)
    @Modifying
    void deleteContactBookSignByCbId(@Param("cbId") Integer cbId);
    
    
}

//--------------------------------- Yan's Note (勿刪) ---------------------------------
//  // 【原方法】老師點「建立聯絡簿」，同時insert一組資料By fk_cb_id, 每個班(fk_classlist_id)的student_id
//  @Query(value = "insert into ContactBookSign (fk_student_id, fk_cb_id) values (:studentId, :cbId)", nativeQuery = true)
//  @Modifying // 問題：為何這邊的insert要@Modifying才會成功？
//  void insertContactBookSignByCbIdAndStudentId(@Param("studentId") Integer studentId, @Param("cbId") Integer cbId);