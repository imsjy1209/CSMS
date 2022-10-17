package com.team3.CSMS.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class OrderDetailDto implements Serializable{
	 private static final long serialVersionUID = 1L;
	 
	 @JsonProperty("orderDetailId")
	 private Integer oDId;
	 
	 @JsonProperty("studentInfoId")
	 private Integer studentId;
	 
	 @JsonProperty("courseInfoId")
	 private Integer courseInfoId;

	public Integer getoDId() {
		return oDId;
	}

	public void setoDId(Integer oDId) {
		this.oDId = oDId;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getCourseInfoId() {
		return courseInfoId;
	}

	public void setCourseInfoId(Integer courseInfoId) {
		this.courseInfoId = courseInfoId;
	}
	 
	 
	 
}
