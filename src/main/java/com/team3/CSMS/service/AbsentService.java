package com.team3.CSMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.AbsentDao;
import com.team3.CSMS.model.Absent;



@Service
@Transactional
public class AbsentService {
    @Autowired
    private AbsentDao aDao;

    public void insert(Absent abs){
        aDao.save(abs);
    }
    
    
}
