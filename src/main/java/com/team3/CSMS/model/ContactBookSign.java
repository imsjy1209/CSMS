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
import javax.persistence.PrePersist;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "contactbooksign")
public class ContactBookSign {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cbs_id")
	private Integer id;

	@Column(name = "parentSign") 
	private Integer parentSign;
	// private Integer parentSign = 0; // insert要default 0 (方法一)

	@PrePersist
	public void onCreate() {
		if (parentSign == null) {
			parentSign = 0; // insert要default 0 (方法二)
		} 
	}
	
	// 關聯
	@ManyToOne
	@JoinColumn(name = "fk_cb_id")
	@JsonBackReference
	private ContactBook contactBook;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_student_id")
	private Student student;

	// 建構子
	public ContactBookSign() {
		//this.parentSign = 0; // insert要default 0 (方法三)
	}

	// getter & setter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentSign() {
		return parentSign;
	}

	public void setParentSign(Integer parentSign) {
		this.parentSign = parentSign;
	}

	public ContactBook getContactBook() {
		return contactBook;
	}

	public void setContactBook(ContactBook contactBook) {
		this.contactBook = contactBook;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}
