package com.team3.CSMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ClassListDao;
import com.team3.CSMS.model.ClassList;

@Service
@Transactional
public class ClassListService {

		@Autowired
		private ClassListDao classListDao;
		
		//找所有已開課課程資訊ClassList
		public List<ClassList> findAllClassList() {
			List<ClassList> clList = classListDao.findAll();
			return clList;
		}
}
