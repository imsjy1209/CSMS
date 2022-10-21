package com.team3.CSMS.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "groups")
public class Groups implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "groups_id", nullable = false)
	private Integer id;

	@Column(name = "groupsName", columnDefinition = "nvarchar(15)", nullable = false)
	private String groupsName;

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
	}
    
	@PreUpdate
	public void onUpdate() {
		update_at = new Date();
	}

	// 關聯
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groups", cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<Users> users;
	
	// 移除Pages Model，刪除關聯部分
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groups", cascade = CascadeType.ALL)
//	@JsonManagedReference
//	private Set<Pages> pages;

	// 建構子
    public Groups(){
    }
	
	// getter & setter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGroupsName() {
		return groupsName;
	}

	public void setGroupsName(String groupsName) {
		this.groupsName = groupsName;
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

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}

//	public Set<Pages> getPages() {
//		return pages;
//	}
//
//	public void setPages(Set<Pages> pages) {
//		this.pages = pages;
//	}
	
}
