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
    private ClassListDao clDao;
    
    public void insert (ClassList clist) {
        clDao.save(clist);
    }
    
    public List<ClassList>findAll(){
        return clDao.findAll();
    }
        
    public ClassList findById(Integer id ){
        Optional<ClassList> optional= clDao.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }
    public List<ClassInfoDto> getClassInfoByClassCodeId(Integer classCodeId){
        List <ClassList> clList=clDao.getClassInfoByClassCodeId(classCodeId);
        ArrayList<ClassInfoDto> dtoList=new ArrayList<>();
        for(ClassList clOne:clList){
            ClassInfoDto cliDto=new ClassInfoDto(clOne);
            dtoList.add(cliDto);
        }
        return dtoList;
    }
}
