package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ClassStudentListDao;
import com.team3.CSMS.dao.ContactBookDao;
import com.team3.CSMS.dao.ContactBookSignDao;
import com.team3.CSMS.dto.ContactBookSignAdminVerDto;
import com.team3.CSMS.dto.ContactBookSignParentVerDto;
import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.ContactBook;
import com.team3.CSMS.model.ContactBookSign;

@Service
@Transactional
public class ContactBookSignService {

	@Autowired
	private ClassStudentListDao cslDao;
	
	@Autowired
	private ContactBookDao cbDao;
	
	@Autowired
	private ContactBookSignDao cbsDao;
	
	//------------------------- 老師 -------------------------
	// 【JPA方法】老師點「建立聯絡簿」，同時insert一組資料By fk_cb_id, 每個班(fk_classlist_id)的student_id
	public void insertContactBookSignByCbIdAndStudentId(Integer classListId) {
		
		// 撈出這個班的studentId，用迴圈方式依序insert到聯絡簿簽名紀錄table
		List<ClassStudentList> cslList = cslDao.findClassStudentListByClassListId(classListId);
		
		// 抓第一個聯絡簿新增的cbId
		ContactBook cbBean = cbDao.findTopOneByclassListIdFromOrderedContactBook(classListId);
		
		for (int i = 0 ; i < cslList.size() ; i++) {
			ContactBookSign cbsBean = new ContactBookSign();
			cbsBean.setContactBook(cbBean);
			cbsBean.setStudent(cslList.get(i).getStudent());
			cbsDao.save(cbsBean);
		}

	}
	
	// 老師點「回上一頁」：以fk_cb_id刪除ContactBookSign資料
	public void deleteContactBookSignByCbId(Integer cbId) {
		cbsDao.deleteContactBookSignByCbId(cbId);
	}

	//------------------------- 校方 -------------------------
	// 校方點單筆查詢，顯示ContactBookSign查詢結果
	// (1) 以id查詢(此處id為fk_cb_id)
	public List<ContactBookSign> findContactBookSignByCbId(Integer cbId) {
		List<ContactBookSign> cbsList = cbsDao.findContactBookSignByCbId(cbId);
		return cbsList;
	}
	
	//------------------------- 家長 -------------------------
	// 家長聯絡簿清單(簽名紀錄部分)
	public List<ContactBookSignParentVerDto> findParentContactBookByclassListIdAndStudentId(Integer classListId, Integer studentId) {
		List<ContactBookSign> cbsList = cbsDao.findParentContactBookByclassListIdAndStudentId(classListId, studentId);
		ArrayList<ContactBookSignParentVerDto> dtoList = new ArrayList<>();
		for (ContactBookSign cbsOne : cbsList) {
			ContactBookSignParentVerDto clsDto = new ContactBookSignParentVerDto(cbsOne);
			dtoList.add(clsDto);
		}
		return dtoList;
	}
	
	// 家長簽名更新
	public void parentSignOneContactBook(Integer cbsId) {
		Optional<ContactBookSign> optional = cbsDao.findById(cbsId);
		if (optional.isPresent()) {
			ContactBookSign cbsBean = optional.get();
			cbsBean.setParentSign(1);
			cbsDao.save(cbsBean);
		}
	}
	//------------------------- Admin -------------------------	
	// Admin找聯絡簿清單(簽名紀錄部分)
	public List<ContactBookSignAdminVerDto> findAdminContactBookSignByclassListId(Integer classListId) {
		List<ContactBookSign> cbsList = cbsDao.findAdminContactBookSignByclassListId(classListId);
		ArrayList<ContactBookSignAdminVerDto> dtoList = new ArrayList<>();
		for (ContactBookSign cbsOne : cbsList) {
			ContactBookSignAdminVerDto clsDto = new ContactBookSignAdminVerDto(cbsOne);
			dtoList.add(clsDto);
		}
		return dtoList;
	}
	
}


//--------------------------------- Yan's Note (勿刪) ---------------------------------
//// 【原方法】老師點「建立聯絡簿」，同時insert一組資料By fk_cb_id, 每個班(fk_classlist_id)的student_id
//  public void insertContactBookSignByCbIdAndStudentId(Integer classListId){
//	// 撈出這個班的學生id，用迴圈方式依序insert到聯絡簿簽名紀錄table
//	List<ClassStudentList> cslList = cslDao.findClassStudentListByClassListId(classListId);
//	
//	// 抓第一個聯絡簿新增的cbId
//	ContactBook cbBean = cbDao.findCbId(classListId);
//	Integer cb_id = cbBean.getId();
//
//	for (int i = 0 ; i < cslList.size() ; i++) {
//		Integer student_id = cslList.get(i).getStudent().getId();
//		// insert 第i次
//		cbsDao.insertContactBookSignByCbIdAndStudentId(student_id,cb_id);
//	}
//}
