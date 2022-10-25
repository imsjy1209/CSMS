package com.team3.CSMS.dto;

import java.io.Serializable;
import java.util.List;

import com.team3.CSMS.model.ClassStudentList;
import com.team3.CSMS.model.ContactBook;
import com.team3.CSMS.model.ContactBookSign;

public class ContactBookSignDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
//	private List<ClassStudentList> classStudentList;
    private Integer studentNo;
    private String studentName;
    private String parentName;
    private String relationship;
    private Integer parentSign;
	private Integer student_id;
	private Integer cb_id;
    
    public ContactBookSignDto() {
    	
    }
    
    public ContactBookSignDto(ContactBookSign contactBookSign) {
    	super();
//    	this.studentNo = contactBookSign.getStudent().getClassStudentLists().get(0);
    	this.studentName =  contactBookSign.getStudent().getName();
    	this.parentName = contactBookSign.getStudent().getParent().getName();
    	this.relationship = contactBookSign.getStudent().getRelationship();
    	this.parentSign = contactBookSign.getParentSign();
    	this.student_id = contactBookSign.getStudent().getId();
    	this.cb_id = contactBookSign.getContactBook().getId();
    }
	
}
