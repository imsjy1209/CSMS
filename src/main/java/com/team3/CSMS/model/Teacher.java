package com.team3.CSMS.model;

import java.util.Date;
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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "TEACHER")
public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "teacher_id")
	private Integer id;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_user_id")
	@JsonIgnoreProperties("teacher")
	private Users users;

	@Column(name = "name", columnDefinition = "nvarchar(15)", nullable = false)
	private String name;

	@Column(name = "title", columnDefinition = "nvarchar(30)", nullable = false)
	private String title;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "hiredate", nullable = false)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd", timezone = "GMT+8")
	private Date hiredate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "resigndate", columnDefinition = "date")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd", timezone = "GMT+8")
	private Date resigndate;

	@Column(name = "status", columnDefinition = "nvarchar(10)", nullable = false)
	private String status;

	@Column(name = "expertise", columnDefinition = "nvarchar(30)", nullable = false)
	private String expertise;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "create_at", columnDefinition = "datetime", nullable = false)
	private Date create_at; // insert data default getDate()

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "update_at", columnDefinition = "datetime", nullable = false)
	private Date update_at; // insert data default getDate() ; update data default getDate()

//  @JsonManagedReference
	@JsonBackReference
//	@JsonIgnoreProperties("teacher")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "teacher", cascade = CascadeType.ALL)
	public List<Score> score;


	
	@PrePersist
	public void onCreate() {
		if (create_at == null) {
			create_at = new Date();
		}
		if (update_at == null) {
			update_at = new Date();
		}
		if( status == null) {
			status="在職";
		}
	}
    
	@PreUpdate
	public void onUpdate() {
		update_at = new Date();
	}
	
	
	public Teacher(Users users, String name, String title, Date hiredate, Date resigndate, String expertise) {
		super();
		this.users = users;
		this.name = name;
		this.title = title;
		this.hiredate = hiredate;
		this.resigndate = resigndate;
		this.expertise = expertise;
	}

	// 建構子
	public Teacher() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public Date getResigndate() {
		return resigndate;
	}

	public void setResigndate(Date resigndate) {
		this.resigndate = resigndate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
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

	public List<Score> getScore() {
		return score;
	}

	public void setScore(List<Score> score) {
		this.score = score;
	}


}