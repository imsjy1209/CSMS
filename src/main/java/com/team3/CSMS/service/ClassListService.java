package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.team3.CSMS.dao.ClassListDao;
import com.team3.CSMS.dto.AllClassListParentVerDto;
import com.team3.CSMS.dto.AllClassListSchoolVerDto;
import com.team3.CSMS.dto.AllClassListStudentVerDto;
import com.team3.CSMS.dto.AllClassListTeacherVerDto;
import com.team3.CSMS.dto.ClassInfoDto;
import com.team3.CSMS.dto.ClassListParentVerDto;
import com.team3.CSMS.dto.ClassListSchoolVerDto;
import com.team3.CSMS.dto.ClassListStudentVerDto;
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
		} else
			return null;
	}

	// 找單筆課程資訊ClassList
	public ClassList findClassListById(Integer id) {
		Optional<ClassList> oneClassList = classListDao.findById(id);
		ClassList aClassList = oneClassList.get();
		return aClassList;
	}

	// 新增課程資訊
	public void insertClassList(ClassList classList) {
		classListDao.save(classList);
	}

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

	/* 依使用者帳號列出可選擇之課程清單 */
	// 老師課程選單By account
	public List<AllClassListTeacherVerDto> getAllClassInfoListByTeacherAccount(String sessionAccount) {
		List<ClassList> clList = classListDao.getAllClassInfoListByTeacherAccount(sessionAccount); // 寫BA001sessionAccount
		ArrayList<AllClassListTeacherVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			AllClassListTeacherVerDto cltDto = new AllClassListTeacherVerDto(clOne);
			dtoList.add(cltDto);
		}
		return dtoList;
	}	
	
	// 校方課程選單By account
	public List<AllClassListSchoolVerDto> getAllClassInfoListBySchoolAccount(String sessionAccount) {
		List<ClassList> clList = classListDao.getAllClassInfoListBySchoolAccount(sessionAccount);
		ArrayList<AllClassListSchoolVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			AllClassListSchoolVerDto clsDto = new AllClassListSchoolVerDto(clOne);
			dtoList.add(clsDto);
		}
		return dtoList;
	}
	
	// 學生課程選單By account
	public List<AllClassListStudentVerDto> getAllClassInfoListByStudentAccount(String sessionAccount) {
		List<ClassList> clList = classListDao.getAllClassInfoListByStudentAccount(sessionAccount);
		ArrayList<AllClassListStudentVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			AllClassListStudentVerDto clstuDto = new AllClassListStudentVerDto(clOne);
			dtoList.add(clstuDto);
		}
		return dtoList;
	}	
	
	// 家長課程選單By account
	public List<AllClassListParentVerDto> getAllClassInfoListByParentAccount(String sessionAccount) {
		List<ClassList> clList = classListDao.getAllClassInfoListByParentAccount(sessionAccount);
		ArrayList<AllClassListParentVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			AllClassListParentVerDto clpDto = new AllClassListParentVerDto(clOne);
			dtoList.add(clpDto);
		}
		return dtoList;
	}
	
	/* 課程選單選了哪一項(可能要改) */
//	// 列出老師課程選單By account, classListId
//	public List<ClassListTeacherVerDto> getClassInfoListByTeacherAccount(String sessionAccount, Integer classListId) {
//		List<ClassList> clList = classListDao.getClassInfoListByTeacherAccount(sessionAccount, classListId);
//		ArrayList<ClassListTeacherVerDto> dtoList = new ArrayList<>();
//		for (ClassList clOne : clList) {
//			ClassListTeacherVerDto cltDto = new ClassListTeacherVerDto(clOne);
//			dtoList.add(cltDto);
//		}
//		return dtoList;
//	}

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
	public List<ClassListParentVerDto> getClassInfoListByParentAccount(String sessionAccount, Integer classListId,
			Integer studentId) {
		List<ClassList> clList = classListDao.getClassInfoListByParentAccount(sessionAccount, classListId, studentId);
		ArrayList<ClassListParentVerDto> dtoList = new ArrayList<>();
		for (ClassList clOne : clList) {
			ClassListParentVerDto clpDto = new ClassListParentVerDto(clOne);
			dtoList.add(clpDto);
		}
		return dtoList;
	}
	
	 //find ClassList by CourseId--Neil 1015
	public ClassList findClassListByCourseId(Integer courseId) {
		return classListDao.findClassListByCourseId(courseId);
	}
	
	//模糊查詢+OrderByClassCode
	public ClassList findLatestClassListByClassCode (String name){
		return classListDao.findLatestClassListByClassCode(name);
	}

}
