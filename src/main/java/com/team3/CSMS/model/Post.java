package com.team3.CSMS.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="post")
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="post_id")
	private Integer id;
	
	@Column(name="userType", nullable = false)
	private Integer userType;
	
	@Column(name="topic",columnDefinition = "nvarchar(30)", nullable = false)
	private String topic;
	
	@Lob
	@Column(name="article",columnDefinition = "nvarchar(max)", nullable = false)
	private String article;
	
	@Column(name="isDelete",columnDefinition = "bit", nullable = false)
	private boolean isDelete;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "create_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date create_at;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "update_at", columnDefinition = "datetime default getDate()", nullable = false)
	private Date update_at;
	
	// 關聯
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="fk_users_id")
    private Users users;
	    
	// 建構子
    public Post(){
    }

    // getter & setter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public boolean getIsDelete() {
		return isDelete;
	}

	public void setisDelete(boolean isDelete) {
		this.isDelete = isDelete;
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

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}  
	
}
