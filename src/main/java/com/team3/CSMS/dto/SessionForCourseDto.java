package com.team3.CSMS.dto;

import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SessionForCourseDto implements Serializable{
	 private static final long serialVersionUID = 1L;
	
	
	private Integer course_id;
	
	private Integer stuIdForSession;

	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}

	public Integer getStuIdForSession() {
		return stuIdForSession;
	}

	public void setStuIdForSession(Integer stuIdForSession) {
		this.stuIdForSession = stuIdForSession;
	}



	
	
}
