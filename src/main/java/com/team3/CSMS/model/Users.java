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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="users")
public class Users {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="users_id")
	private Integer id;
	
	// 學生外來
	@OneToOne(mappedBy = "users")
	@JsonIgnoreProperties("users")
	private Student student;
	
	// 老師外來
	@OneToOne(mappedBy = "users")
	@JsonIgnoreProperties("users")
	private Teacher teacher;

	// 校方外蘭
	@OneToOne(mappedBy = "users")
	@JsonIgnoreProperties("users")
	private School school;

	// 家長外來
	@OneToOne(mappedBy = "users")
	@JsonIgnoreProperties("users")
	private Parent parent;

	@Column(name="account" , columnDefinition = "varchar(15)",unique = true, nullable = false)
	private String account;
	
	@Column(name="password", columnDefinition = "varchar(30)", nullable = false)
	private String password;
	
	@Column(name="accright" , nullable = false)
	private Integer accRight; // insert data default 1 (0表示註銷登入權限，1表示有權限登入)
	
	@Column(name="isfirst" , nullable = false)
	private Integer isFirst; // insert data default 1 (0表示非首次登入，1表示有首次登入)
	
	@Column(name="closereason",columnDefinition = "nvarchar(10)")
	private String closeReason;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_groups_id")
	private Groups groups;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="create_at", columnDefinition = "datetime", nullable = false)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date create_at; // insert data default getDate()
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="update_at", columnDefinition = "datetime", nullable = false)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	private Date update_at; // insert data default getDate() ; update data default getDate()

	@PrePersist
	public void onCreate() {
		if (create_at == null) {
			create_at = new Date();
		}
		if (update_at == null) {
			update_at = new Date();
		} 
		if (accRight == null) {
			accRight = 1;
		}
		if (isFirst == null) {
			isFirst = 1;
		}
	}
    
	@PreUpdate
	public void onUpdate() {
		update_at = new Date();
	}
	



	
	public Users(String account, String password, Groups groups) {
		super();
		this.account = account;
		this.password = password;
		this.groups = groups;
	}

	
	
	public Groups getGroups() {
		return groups;
	}

	public void setGroups(Groups groups) {
		this.groups = groups;
	}

	// 建構子
	public Users() {
	}

	// getter & setter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAccRight() {
		return accRight;
	}

	public void setAccRight(Integer accRight) {
		this.accRight = accRight;
	}

	public Integer getIsFirst() {
		return isFirst;
	}

	public void setIsFirst(Integer isFirst) {
		this.isFirst = isFirst;
	}

	public String getCloseReason() {
		return closeReason;
	}

	public void setCloseReason(String closeReason) {
		this.closeReason = closeReason;
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

//	public Groups getGroups() {
//		return groups;
//	}
//
//	public void setGroups(Groups groups) {
//		this.groups = groups;
//	}
	
	// 外來Getter&SetterS
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
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

	public Parent getParent() {
		return parent;
	}

	public void setParent(Parent parent) {
		this.parent = parent;
	}
	
}