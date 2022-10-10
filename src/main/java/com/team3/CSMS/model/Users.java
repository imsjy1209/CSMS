package com.team3.CSMS.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class Users {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="users_id")
	private Integer id;
	
	@Column(name="account" ,columnDefinition = "varchar(15)",unique = true, nullable = false)
	private String account;
	
	@Column(name="password",columnDefinition = "varchar(30)", nullable = false)
	private String password;
	
	@Column(name="accright" ,columnDefinition = "bit", nullable = false)
	private int accRight;
	
	@Column(name="isfirst" ,columnDefinition = "bit", nullable = false)
	private int isFirst;
	
	@Column(name="closereason",columnDefinition = "nvarchar(10)")
	private String closeReason;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="create_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date create_at;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="update_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date update_at;

	// 關聯
	@ManyToOne
	@JoinColumn(name = "fk_groups_id")
	private Groups groups;
	
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

	public int getAccRight() {
		return accRight;
	}

	public void setAccRight(int accRight) {
		this.accRight = accRight;
	}

	public int getIsFirst() {
		return isFirst;
	}

	public void setIsFirst(int isFirst) {
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

	public Groups getGroups() {
		return groups;
	}

	public void setGroups(Groups groups) {
		this.groups = groups;
	}
	
}