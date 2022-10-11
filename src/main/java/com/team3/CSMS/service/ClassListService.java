package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.team3.CSMS.dao.ClassListDao;
import com.team3.CSMS.dto.ClassInfoDto;
import com.team3.CSMS.model.ClassList;

@Service
@Transactional
public class ClassListService {

    @Autowired
    private ClassListDao classListDao;
    
    public void insert (ClassList clist) {
        classListDao.save(clist);
    }
    
    public List<ClassList>findAll(){
        return classListDao.findAll();
    }
        
    public ClassList findById(Integer id ){
        Optional<ClassList> optional= classListDao.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }
    public List<ClassInfoDto> getClassInfoByClassCodeId(Integer classCodeId){
        List <ClassList> clList=classListDao.getClassInfoByClassCodeId(classCodeId);
        ArrayList<ClassInfoDto> dtoList=new ArrayList<>();
        for(ClassList clOne:clList){
            ClassInfoDto cliDto=new ClassInfoDto(clOne);
            dtoList.add(cliDto);
        }
        return dtoList;
    }
		//找所有已開課課程資訊ClassList
		public List<ClassList> findAllClassList() {
			List<ClassList> clList = classListDao.findAll();
			return clList;
		}

}
