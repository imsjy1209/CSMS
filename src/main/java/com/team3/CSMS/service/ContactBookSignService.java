package com.team3.CSMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ClassStudentListDao;
import com.team3.CSMS.dao.ContactBookDao;
import com.team3.CSMS.dao.ContactBookSignDao;
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
