package com.team3.CSMS.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name="ClassList")
public class ClassList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="classList_id")
	private Integer id;
	
	

//	@JsonBackReference
//	@JsonManagedReference
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "classList",cascade = CascadeType.ALL)
	private List<ClassStudentList> classStudentLists ;
	
	@Column(name="classcode",columnDefinition = "nvarchar(10)",unique = true, nullable = false)
	private String classCode;
	

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_school_id")
	private School school;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_teacher_id")
	private Teacher teacher;
	
//	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_room_id")
	private Room room;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_course_id", nullable = false)
	private Course course;
	
	@Column(name="classmember")
	private int classMember;
	
	public List<ClassStudentList> getClassStudentLists() {
		return classStudentLists;
	}

	public void setClassStudentLists(List<ClassStudentList> classStudentLists) {
		this.classStudentLists = classStudentLists;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public ClassList() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getClassMember() {
		return classMember;
	}

	public void setClassMember(int classMember) {
		this.classMember = classMember;
	}
	
}