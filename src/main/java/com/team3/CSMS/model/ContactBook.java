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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "contactbook")
public class ContactBook {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cb_id")
	private Integer id;

	@Column(name = "courseContent", columnDefinition = "nvarchar(150)")
	private String courseContent;

	@Column(name = "homework", columnDefinition = "nvarchar(150)")
	private String homework;

	@Column(name = "quiznotice", columnDefinition = "nvarchar(150)")
	private String quizNotice;

	@Column(name = "phase") // 記得insert要default 1
	private Integer phase;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "create_at", columnDefinition = "date", nullable = false) // 記得insert要default getDate()
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd", timezone = "GMT+8")
	private Date create_at;

	// 關聯
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_classlist_id")
	private ClassList ClassList;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "contactBook", cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<ContactBookSign> contactBookSign;

	// 建構子 
	public ContactBook() {
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

	public ClassList getClassList() {
		return ClassList;
	}

	public void setClassList(ClassList classList) {
		ClassList = classList;
	}

	public Set<ContactBookSign> getContactBookSign() {
		return contactBookSign;
	}

	public void setContactBookSign(Set<ContactBookSign> contactBookSign) {
		this.contactBookSign = contactBookSign;
	}

}
