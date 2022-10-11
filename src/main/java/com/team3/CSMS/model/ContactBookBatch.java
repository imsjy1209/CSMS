package com.team3.CSMS.model;

import java.util.Date;
import java.util.Set;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

//@Entity
//@Table(name = "contactbookbatch")
public class ContactBookBatch {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cbb_id")
	private Integer id;
    
    @Column(name="courseContent" ,columnDefinition = "nvarchar(150)")
    private String courseContent;
    
    @Column(name="homework" ,columnDefinition = "nvarchar(150)")
    private String homework;
    
    @Column(name="quiznotice",columnDefinition = "nvarchar(150)")
    private String quizNotice;
    
    @Column(name = "phase",columnDefinition = "int default 1")
    private Integer phase;
    
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "create_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date create_at;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "update_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date update_at;
	
	// 關聯
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_classlist_id")
    private ClassList ClassList;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_teacher_id")
	private Teacher teacher;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_school_id")
	private School school;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "contactbooksingle", cascade = CascadeType.ALL)
	private Set<ContactBookSingle> contactBookSingle;
	
	// 建構子
    public ContactBookBatch(){
    }

	// getter & setter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getPhase() {
		return phase;
	}

	public void setPhase(Integer phase) {
		this.phase = phase;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public Date getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(Date update_at) {
		this.update_at = update_at;
	}

	public ClassList getClassList() {
		return ClassList;
	}

	public void setClassList(ClassList classList) {
		ClassList = classList;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Set<ContactBookSingle> getContactBookSingle() {
		return contactBookSingle;
	}

	public void setContactBookSingle(Set<ContactBookSingle> contactBookSingle) {
		this.contactBookSingle = contactBookSingle;
	} 
	
}
