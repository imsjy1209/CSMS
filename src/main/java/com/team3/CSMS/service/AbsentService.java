package com.team3.CSMS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.AbsentDao;
// import com.team3.CSMS.dto.AbsentDataDto;
import com.team3.CSMS.model.Absent;

@Service
@Transactional
public class AbsentService {
    @Autowired
    private AbsentDao aDao;

    public void insert(Absent abs){
        aDao.save(abs);
    }
    // 找到出缺勤名單
    public List<Absent> searchAbsent(Integer classCodeId ,String days){
        return aDao.selectAbsentByDaysAndClassCodeId(classCodeId, days);
    }

    //  透過id找到學生出缺勤資料
    public Absent findStudentAbsentById(Integer stuid){
        Optional<Absent> opAbsent = aDao.findById(stuid);
        return opAbsent.get();
    }

    //  存入出缺勤資料 
    public Absent insertAbsent(Absent absent){
        Absent oneAbsent = aDao.save(absent);
        return oneAbsent;
    }

}
