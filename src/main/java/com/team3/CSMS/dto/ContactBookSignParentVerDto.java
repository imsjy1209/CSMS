package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.ContactBookSign;

public class ContactBookSignParentVerDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer cbId;
	private Integer cbsId;
    private Integer parentSign;
	private Integer studentId;
	
    public ContactBookSignParentVerDto() {	
    }
    
    public ContactBookSignParentVerDto(ContactBookSign contactBookSign) {
    	super();
    	this.cbId = contactBookSign.getContactBook().getId();
    	this.cbsId = contactBookSign.getId();
    	this.parentSign = contactBookSign.getParentSign();
    	this.studentId = contactBookSign.getStudent().getId();
    }

	public Integer getParentSign() {
		return parentSign;
	}

	public void setParentSign(Integer parentSign) {
		this.parentSign = parentSign;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getCbId() {
		return cbId;
	}

	public void setCbId(Integer cbId) {
		this.cbId = cbId;
	}

	public Integer getCbsId() {
		return cbsId;
	}

	public void setCbsId(Integer cbsId) {
		this.cbsId = cbsId;
	}
    
}
