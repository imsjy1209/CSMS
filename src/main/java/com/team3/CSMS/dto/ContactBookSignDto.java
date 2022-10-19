package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.ClassStudentList;

public class ContactBookSignDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
    private Integer studentNo;
    private String studentName;
    private String parentName;
    private String relationship;
    private Integer parentSign;
	private Integer student_id;
	private Integer bd_id;
    
    public ContactBookSignDto() {
    	
    }
    
    public ContactBookSignDto(ClassStudentList classStudentList) {
    	super();
    	this.studentNo = classStudentList.getStudentNo();
    	this.studentName = classStudentList.getStudent().getName();
    	this.parentName = classStudentList.getStudent().getParent().getName();
    	this.relationship = classStudentList.getStudent().getRelationship();
    
    }
	
}
