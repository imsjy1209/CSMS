package com.team3.CSMS.model;

import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "contactbooksingle")
public class ContactBookSingle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cbs_id")
	private Integer id;

	@Column(name = "schoolMsg", columnDefinition = "nvarchar(150)", nullable = false)
	private String schoolMsg;

	@Column(name = "parentMsg", columnDefinition = "nvarchar(150)")
	private String parentMsg;

	@Column(name = "parentSign", columnDefinition = "bit default 0")
	private boolean parentSign;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "create_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date create_at;

	// 關聯
	@ManyToOne
	@JoinColumn(name = "fk_cbb_id")
	@JsonBackReference
	private ContactBookBatch contactBookBatch;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_student_id")
	private Student student;

//	@OneToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "fk_parent_id")
//	private Parent parent;

	// 建構子
	public ContactBookSingle() {
	}

	// getter & setter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSchoolMsg() {
		return schoolMsg;
	}

	public void setSchoolMsg(String schoolMsg) {
		this.schoolMsg = schoolMsg;
	}

	public String getParentMsg() {
		return parentMsg;
	}

	public void setParentMsg(String parentMsg) {
		this.parentMsg = parentMsg;
	}

	public boolean getParentSign() {
		return parentSign;
	}

	public void setParentSign(boolean parentSign) {
		this.parentSign = parentSign;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public ContactBookBatch getContactBookBatch() {
		return contactBookBatch;
	}

	public void setContactBookBatch(ContactBookBatch contactBookBatch) {
		this.contactBookBatch = contactBookBatch;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}
