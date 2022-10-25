package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.team3.CSMS.dao.ClassListDao;
import com.team3.CSMS.dto.ClassInfoDto;
import com.team3.CSMS.dto.ClassInfoForStudentScorePageDto;
import com.team3.CSMS.dto.ClassListParentVerDto;
import com.team3.CSMS.dto.ClassListSchoolVerDto;
import com.team3.CSMS.dto.ClassListStudentVerDto;
import com.team3.CSMS.dto.ClassListTeacherVerDto;

import com.team3.CSMS.model.ClassList;

@Service
@Transactional
public class ClassListService {

	@Autowired
	private ClassListDao classListDao;

	public void insert(ClassList clist) {
		classListDao.save(clist);
	}

	public List<ClassList> findAll() {
		return classListDao.findAll();
	}

	public ClassList findById(Integer id) {
		Optional<ClassList> optional = classListDao.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		else return null;
	}
	//文萱新增	
//	public ClassList findClassListById1(Integer id) {
//		Optional<ClassList> oneClassList1 = classListDao.findById(id);
//		ClassList aClassList1 = oneClassList1.get();
//		return aClassList1;
//	}	
	
	// 【Score】學生頁面上方課程選單
	public List<ClassInfoForStudentScorePageDto> getClassInfoByClassCodeIdAndStudentId(Integer sessionUserId){
		List<ClassList> clList = classListDao.getClassInfoByClassCodeIdAndStudentId(sessionUserId);
		ArrayList<ClassInfoForStudentScorePageDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassInfoForStudentScorePageDto cltDto = new ClassInfoForStudentScorePageDto(clOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}
	
	//找單筆課程資訊ClassList
		public ClassList findClassListById(Integer id) {
			Optional<ClassList> oneClassList = classListDao.findById(id);
			ClassList aClassList = oneClassList.get();
			return aClassList;
		}
		
		//新增課程資訊
		public void insertClassList(ClassList classList) {
			classListDao.save(classList);
		}
		

	// 課堂資訊
	public List<ClassInfoDto> getClassInfoByClassCodeId(Integer classCodeId) {
		List<ClassList> clList = classListDao.getClassInfoByClassCodeId(classCodeId);
		ArrayList<ClassInfoDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassInfoDto cliDto = new ClassInfoDto(clOne);
			dtoList.add(cliDto);
		}
		return dtoList;
	}

	// 找所有已開課課程資訊ClassList
	public List<ClassList> findAllClassList() {
		List<ClassList> clList = classListDao.findAll();
		return clList;
	}
	
	// 列出老師課程選單By account, classListId
	public List<ClassListTeacherVerDto> getClassInfoListByTeacherAccount(String sessionAccount, Integer classListId) {
		List<ClassList> clList = classListDao.getClassInfoListByTeacherAccount(sessionAccount, classListId);
		ArrayList<ClassListTeacherVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassListTeacherVerDto cltDto = new ClassListTeacherVerDto(clOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}
	
	// 列出校方課程選單By account, classListId
	public List<ClassListSchoolVerDto> getClassInfoListBySchoolAccount(String sessionAccount, Integer classListId) {
		List<ClassList> clList = classListDao.getClassInfoListBySchoolAccount(sessionAccount, classListId);
		ArrayList<ClassListSchoolVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassListSchoolVerDto clsDto = new ClassListSchoolVerDto(clOne);
			dtoList.add(clsDto);
		}
		return dtoList;
	}

	// 列出學生課程選單By account, classListId
	public List<ClassListStudentVerDto> getClassInfoListByStudentAccount(String sessionAccount, Integer classListId) {
		List<ClassList> clList = classListDao.getClassInfoListByStudentAccount(sessionAccount, classListId);
		ArrayList<ClassListStudentVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassListStudentVerDto clstuDto = new ClassListStudentVerDto(clOne);
			dtoList.add(clstuDto);
		}
		return dtoList;
	}

	// 列出家長課程選單By account, classListId, studentId
	public List<ClassListParentVerDto> getClassInfoListByParentAccount(String sessionAccount, Integer classListId, Integer studentId) {
		List<ClassList> clList = classListDao.getClassInfoListByParentAccount(sessionAccount, classListId, studentId);
		ArrayList<ClassListParentVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassListParentVerDto clpDto = new ClassListParentVerDto(clOne);
			dtoList.add(clpDto);
		}
		return dtoList;
	}
	

}
