package com.team3.CSMS.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Entity
@Table(name="activity")
@Component
public class Activity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="activity_id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="place")
	private String place;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "date", columnDefinition = "datetime")
	private Date date;
	
	@Column(name="content",columnDefinition = "nvarchar(max)")
	private String content;
	
	@Lob
	@Column(name = "photo_file")
	private byte[] photo_file;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "added", columnDefinition = "datetime")
	private Date added;
	
	@ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinTable(name="student_activity",
	joinColumns = {@JoinColumn(name="fk_act_id",referencedColumnName = "activity_id")},
	inverseJoinColumns= {@JoinColumn(name="fk_stu_id",referencedColumnName="student_id")})
	private Set<Student> students=new HashSet<Student>();
	
	@PrePersist
	public void onCreate() {
		if(added == null) {
			added = new Date();
		}
	}
	
	public Activity() {
	}
	
	public Activity(String name, String place, Date date, String content, byte[] photo_file) {
		super();
		this.name = name;
		this.place = place;
		this.date = date;
		this.content = content;
		this.photo_file = photo_file;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public byte[] getPhoto_file() {
		return photo_file;
	}

	public void setPhoto_file(byte[] photo_file) {
		this.photo_file = photo_file;
	}

	public Date getAdded() {
		return added;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	
}