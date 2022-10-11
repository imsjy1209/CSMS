package com.team3.CSMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ClassRecordDao;
import com.team3.CSMS.model.ClassRecord;

@Service
@Transactional
public class ClassRecordService {

	@Autowired
	private ClassRecordDao classRecordDao;

	// 找所有已上課紀錄ClassRecord
	public List<ClassRecord> findAllClassRecord() {
		List<ClassRecord> crList = classRecordDao.findAll();
		return crList;
	}
}
