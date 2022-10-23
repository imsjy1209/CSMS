package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.ContactBookSign;

public class ContactBookSignDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
    private Integer studentNo;
    private String studentName;
    private String parentName;
    private String relationship;
    private Integer parentSign;
	private Integer student_id;
	private Integer cb_id;
    
    public ContactBookSignDto() {
    	
    }
    
    public ContactBookSignDto(ContactBookSign ContactBookSign) {
    	super();
//    	this.studentNo = 
//    	this.studentName = 
//    	this.parentName = 
//    	this.relationship = 
//    	this.parentSign = 
//    	this.student_id = 
//    	this.cb_id= 
    }
	
}
