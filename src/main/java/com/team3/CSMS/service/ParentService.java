package com.team3.CSMS.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team3.CSMS.dao.ParentDao;
import com.team3.CSMS.model.Parent;

@Service
@Transactional
public class ParentService {
    @Autowired
    private ParentDao parentDAO;

    public Parent findParentById(Integer Id){
        Optional<Parent> oneParent = parentDAO.findById(Id);
        return oneParent.get();
    }
    public void insert(Parent parent){
        parentDAO.save(parent);
    }

}
