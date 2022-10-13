package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.ClassList;

public class ClassListSchoolVerDto implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer classListId;
	private String classCode;
	private String courseCategory;
	private String courseSubject;
	private String courseGrade;
	private Integer courseClass;

	public ClassListSchoolVerDto() {
	}
	
	public ClassListSchoolVerDto(ClassList classList) {
		super();
		this.classListId = classList.getId();
		this.classCode = classList.getClassCode();
		this.courseCategory = classList.getCourse().getCourseCategory();
		this.courseSubject = classList.getCourse().getCourseSubject();
		this.courseGrade = classList.getCourse().getCourseGrade();
		this.courseClass = classList.getCourse().getCourseClass();
	}

	public Integer getClassListId() {
		return classListId;
	}

	public void setClassListId(Integer classListId) {
		this.classListId = classListId;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getCourseCategory() {
		return courseCategory;
	}

	public void setCourseCategory(String courseCategory) {
		this.courseCategory = courseCategory;
	}

	public String getCourseSubject() {
		return courseSubject;
	}

	public void setCourseSubject(String courseSubject) {
		this.courseSubject = courseSubject;
	}

	public String getCourseGrade() {
		return courseGrade;
	}

	public void setCourseGrade(String courseGrade) {
		this.courseGrade = courseGrade;
	}

	public Integer getCourseClass() {
		return courseClass;
	}

	public void setCourseClass(Integer courseClass) {
		this.courseClass = courseClass;
	}

}
