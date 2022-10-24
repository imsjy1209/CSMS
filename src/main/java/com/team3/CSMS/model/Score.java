package com.team3.CSMS.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Score")
public class Score {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "score")
	private Integer score;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_student_id")
	private Student student;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_classlist_id")
	private ClassList classlist;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_school_id")
	private School school;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_parent_id")
	private Parent parent;
	

	@JsonManagedReference
//	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "fk_teacher_id")
//	@JsonIgnoreProperties("score")
	private Teacher teacher;
	
	@Column(name = "frequency")
	private Integer frequency;

	public Score() {

	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public ClassList getClasslist() {
		return classlist;
	}

	public void setClasslist(ClassList classlist) {
		this.classlist = classlist;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Parent getParent() {
		return parent;
	}

	public void setParent(Parent parent) {
		this.parent = parent;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Integer getFrequency() {
		return frequency;
	}

	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}

	

}