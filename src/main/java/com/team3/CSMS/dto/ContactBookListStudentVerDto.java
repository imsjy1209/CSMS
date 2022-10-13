package com.team3.CSMS.dto;

import java.io.Serializable;
import java.util.Date;

import com.team3.CSMS.model.ContactBook;

public class ContactBookListStudentVerDto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer cb_id;
	private Date create_at;
	private String classCode;
	private String teacherName;
	private String schoolName;
	private String courseContent;
	private String homework;
	private String quizNotice;
	
	public ContactBookListStudentVerDto() {
	}
	
	public ContactBookListStudentVerDto(ContactBook contactBook) {
		super();
		this.cb_id = contactBook.getId();
		this.create_at = contactBook.getCreate_at();
		this.classCode = contactBook.getClassList().getClassCode();
		this.teacherName = contactBook.getClassList().getTeacher().getName();
		this.schoolName = contactBook.getClassList().getSchool().getName();
		this.courseContent = contactBook.getCourseContent();
		this.homework = contactBook.getHomework();
		this.quizNotice = contactBook.getQuizNotice();
	}
	
	public Integer getCb_id() {
		return cb_id;
	}

	public void setCb_id(Integer cb_id) {
		this.cb_id = cb_id;
	}
	
	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public String getHomework() {
		return homework;
	}

	public void setHomework(String homework) {
		this.homework = homework;
	}

	public String getQuizNotice() {
		return quizNotice;
	}

	public void setQuizNotice(String quizNotice) {
		this.quizNotice = quizNotice;
	}

}
