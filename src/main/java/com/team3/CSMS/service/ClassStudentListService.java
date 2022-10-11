package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.team3.CSMS.dao.ClassStudentListDao;
import com.team3.CSMS.dto.StudentListDto;
// import com.team3.CSMS.model.ClassStudentList;


import com.team3.CSMS.model.ClassStudentList;

@Service
@Transactional
public class ClassStudentListService {

    @Autowired  
    ClassStudentListDao classStudentListDao;
    //找到學生清單
    public List<StudentListDto> getStudentListByClassCodeId(Integer classCodeId){
        System.out.println(classCodeId);
        System.out.println("00000000000000000000");
        if(classStudentListDao==null){
            System.out.println("i am null");
        }else {
            System.out.println(" not null");
        }
        List<ClassStudentList> csList=classStudentListDao.getStudentListByCodeId(classCodeId);

        System.out.println("1111111111111111111111111111111111");
        ArrayList<StudentListDto> dtoList=new ArrayList<>();
        for(ClassStudentList csl:csList){
            System.out.println("22222222222222222222222222");
            StudentListDto slDto=new StudentListDto(csl);
            dtoList.add(slDto);
            // slDto.setStudentSitID(csl.getStudentNo()); 
            // slDto.setStudentName(csl.getStudent().getName());
            // dtoList.add(slDto);
        }
        System.out.println("33333333333333333333");
        return dtoList;
    }
	// 找所有班級對應學生清單ClassStudentList
	public List<ClassStudentList> findAllClassStudentList() {
		List<ClassStudentList> cslList = classStudentListDao.findAll();
		return cslList;
	}
	
	// 找單一班級對應學生清單ClassStudentList
	public List<ClassStudentList> findClassStudentListByClassListId(String id) {
		List<ClassStudentList> cslList = classStudentListDao.findByNameLike(id);
		return cslList;
	}


}
