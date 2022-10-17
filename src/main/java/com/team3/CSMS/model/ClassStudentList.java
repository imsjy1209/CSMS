package com.team3.CSMS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="ClassStudentList")
public class ClassStudentList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="classStudentList_id")
	private Integer id;


	@ManyToOne
	@JoinColumn(name="fk_classlist_id")
	@JsonIgnoreProperties("classStudentLists")
	private ClassList classList;

	// @JsonBackReference
	@ManyToOne
	@JoinColumn(name="fk_student_id")
	@JsonIgnoreProperties("classStudentLists")
	private Student student;
	
	@Column(name="studentNo")
	private int studentNo;

	public ClassStudentList() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ClassList getClassList() {
		return classList;
	}

	public void setClassList(ClassList classList) {
		this.classList = classList;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public int getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}

}