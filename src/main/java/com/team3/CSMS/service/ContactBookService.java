package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;

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
