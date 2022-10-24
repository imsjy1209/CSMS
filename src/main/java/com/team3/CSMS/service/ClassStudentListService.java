package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ClassStudentListDao;
import com.team3.CSMS.dto.StudentListDto;
import com.team3.CSMS.model.ClassStudentList;


@Service
@Transactional
public class ClassStudentListService {

    @Autowired  
    ClassStudentListDao classStudentListDao;
    
    //找到學生清單
    public List<StudentListDto> getStudentListByClassCodeId(Integer classCodeId){
        // if(classStudentListDao==null){
        //     System.out.println("i am null");
        // }else {
        //     System.out.println("im not null");
        // }
        List<ClassStudentList> csList=classStudentListDao.getStudentListByCodeId(classCodeId);
        ArrayList<StudentListDto> dtoList=new ArrayList<>();
        for(ClassStudentList csl:csList){
            StudentListDto slDto=new StudentListDto(csl);
            dtoList.add(slDto);
        }
        return dtoList;
    }
	// 找所有班級對應學生清單ClassStudentList
	public List<ClassStudentList> findAllClassStudentList() {
		List<ClassStudentList> cslList = classStudentListDao.findAll();
		return cslList;
	}
	
	
	// 找單一班級對應學生清單ClassStudentList
	public List<ClassStudentList> findClassStudentListByClassListId(Integer id) {
		List<ClassStudentList> cslList = classStudentListDao.findClassStudentListByClassListId(id);
		return cslList;
	}
	
	// 新增學生清單ClassStudentList--Neil 1015
	public ClassStudentList insertClassStudentList(ClassStudentList classStudentList) {
		ClassStudentList oneClassStudentList = classStudentListDao.save(classStudentList);
		return oneClassStudentList;
	}
	
	// 刪除學生清單ById-ClassStudentList
	public void deleteClassStudentListById(Integer id) {
		classStudentListDao.deleteById(id);
	}
	
	// 刪除學生清單ByEntity-ClassStudentList--Neil 1015
	public void deleteClassStudentListByEntity(ClassStudentList classStudentList) {
		classStudentListDao.delete(classStudentList);
	}
	
	// 找學生清單By CSL Id-ClassStudentList--Neil 1015
	public ClassStudentList findClassStudentListById(Integer id) {
		Optional<ClassStudentList> oneCSLoptional = classStudentListDao.findById(id);
		return oneCSLoptional.get();
	}

	//find ClassStudntList By ClassListId And StudentId--Neil 1015
	public ClassStudentList findClassStudentListByClassListIdAndStudentId(Integer clId,Integer stId) {
		return classStudentListDao.findClassStudentListByClassListIdAndStudentId(clId,stId);
	}
	


}
