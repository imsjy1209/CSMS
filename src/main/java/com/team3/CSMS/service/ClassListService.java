package com.team3.CSMS.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ClassListDao;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Course;

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
		
		
}
