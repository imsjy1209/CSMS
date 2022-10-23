package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ContactBookDao;
import com.team3.CSMS.dto.ContactBookListParentVerDto;
import com.team3.CSMS.dto.ContactBookListSchoolVerDto;
import com.team3.CSMS.dto.ContactBookListStudentVerDto;
import com.team3.CSMS.dto.ContactBookListTeacherVerDto;
import com.team3.CSMS.model.ContactBook;

@Service
@Transactional
public class ContactBookService {

	@Autowired
	private ContactBookDao cbDao;
	
	//------------------------- 共用 -------------------------
	// 【共用】以id單筆查詢(此處id為cb_id)
	public ContactBook findById(Integer id) {
		Optional<ContactBook> optional = cbDao.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	// 【共用】儲存一個Entity物件
	public void save(ContactBook contactBook) {
		cbDao.save(contactBook);
	}
	
	//------------------------- 老師 -------------------------
	// 老師聯絡簿選單By classListId
	public List<ContactBookListTeacherVerDto> getTeacherContactBookListByClassListId(Integer classListId) {
		List<ContactBook> cbList = cbDao.getTeacherContactBookListByClassListId(classListId);
		ArrayList<ContactBookListTeacherVerDto> dtoList = new ArrayList<>();
		for (ContactBook cbOne : cbList) {
			ContactBookListTeacherVerDto cltDto = new ContactBookListTeacherVerDto(cbOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}
	
	// 老師點「建立聯絡簿」按鈕insert一筆帶ClassListId資料
	public ContactBook insertTheClassListIdIntoContactBook(Integer classListId) {
		ContactBook cbBean = cbDao.insertTheClassListIdIntoContactBook(classListId);
		return cbBean;
	}
	
	// 老師點「確認送出」按鈕使用JPA內建方法
	// (1) 【共用】以id單筆查詢(此處id為cb_id)	
	// (2) 【共用】儲存一個Entity物件

	
	// 老師點「回上一頁」：delete當下這筆資料
	public void deleteThisContactBookData(ContactBook cbBean) {
		cbDao.delete(cbBean);
	}
	
	//------------------------- 校方 -------------------------
	// 校方聯絡簿選單By classListId
	public List<ContactBookListSchoolVerDto> getSchoolContactBookListByClassListId(Integer classListId) {
		List<ContactBook> cbList = cbDao.getSchoolContactBookListByClassListId(classListId);
		ArrayList<ContactBookListSchoolVerDto> dtoList = new ArrayList<>();
		for (ContactBook cbOne : cbList) {
			ContactBookListSchoolVerDto cltDto = new ContactBookListSchoolVerDto(cbOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}
	
	// 校方點單筆編輯使用JPA內建方法
	// (1) 【共用】以id單筆查詢(此處id為cb_id)	

	// 校方點「確認送出」按鈕使用JPA內建方法
	// (1) 【共用】以id單筆查詢(此處id為cb_id)	
	// (2) 【共用】儲存一個Entity物件
	
	// 校方點單筆查
	// (1) 看使用JPA內建方法：【共用】以id單筆查詢(此處id為cb_id)	
	// (2) 以id單筆查詢(此處id為fk_cb_id)
	
	
	//------------------------- 學生 -------------------------
	// 學生聯絡簿選單By classListId
	public List<ContactBookListStudentVerDto> getStudentContactBookListByClassListId(Integer classListId) {
		List<ContactBook> cbList = cbDao.getStudentContactBookListByClassListId(classListId);
		ArrayList<ContactBookListStudentVerDto> dtoList = new ArrayList<>();
		for (ContactBook cbOne : cbList) {
			ContactBookListStudentVerDto cltDto = new ContactBookListStudentVerDto(cbOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}
	
	//------------------------- 家長 -------------------------
	// 家長聯絡簿選單By classListId
	public List<ContactBookListParentVerDto> getParentContactBookListByClassListId(Integer classListId, Integer studentId) {
		List<ContactBook> cbList = cbDao.getParentContactBookListByClassListId(classListId, studentId);
		ArrayList<ContactBookListParentVerDto> dtoList = new ArrayList<>();
		for (ContactBook cbOne : cbList) {
			ContactBookListParentVerDto cltDto = new ContactBookListParentVerDto(cbOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}
	
	
}
