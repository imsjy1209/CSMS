package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ParentDao;

import com.team3.CSMS.dao.ScoreDao;
import com.team3.CSMS.dto.ClassInfoForStudentScorePageDto;

import com.team3.CSMS.dto.ScoreDto;
import com.team3.CSMS.dto.ScoreDto2;
import com.team3.CSMS.model.ClassList;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Score;

import com.team3.CSMS.dao.PostRepository;
import com.team3.CSMS.model.Parent;
import com.team3.CSMS.model.Post;


@Service
@Transactional
public class ParentService {


	@Autowired
	private ParentDao parentDao;

	// 找全部
	public List<Parent> findAllParent() {
		List<Parent> parentList = parentDao.findAll();
		return parentList;
	}
	//【Score】家長頁面上方課程選單
//	public List<ParentDto> getChildScoreListByParentId(Integer sessionUserId){
//		List<Parent> pList = parentDao.getChildScoreListByParentId(sessionUserId);
//		ArrayList<ParentDto> dtoList = new ArrayList<>();
//		for (Parent pOne : pList) {
//			ParentDto pDto = new ParentDto(pOne);
//			dtoList.add(pDto);
//		}
//		return dtoList;
//	}
	
	
	//【Score】家長頁面上方課程選單
	public List<Parent> getChildScoreListByParentId(Integer sessionUserId){
	List<Parent> pList = parentDao.getChildScoreListByParentId(sessionUserId);
	return pList;
}
	

	public void insert(Parent p) {
		parentDao.save(p);
	}

	public List<Parent> getAll() {
		return parentDao.findAll();
//		return aDao.getAll();
	}

	public Parent findById(Integer id) {
		Optional<Parent> optional = parentDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}
	public Parent searchParentByname(String name) {		
		return parentDao.searchParent(name);
	}

}
