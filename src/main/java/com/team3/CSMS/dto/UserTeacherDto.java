package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.Users;

public class UserTeacherDto implements Serializable{
    private static final long serialVersionUID=1L;
    
    private Integer userID;
    private Integer teacherId;
    private String teacherName;
    private String subject;
    private Integer whiteList;

    public UserTeacherDto(){
    }
    
    public UserTeacherDto( Users users){
        this.userID=users.getId();
        this.teacherId=users.getTeacher().getId();
        this.teacherName=users.getTeacher().getName();
        this.subject=users.getTeacher().getExpertise();
        this.whiteList=users.getAccRight();
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getTeacherId() {
        return teacherId;
    }
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }
    public String getTeacherName() {
        return teacherName;
    }
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public Integer getWhiteList() {
        return whiteList;
    }
    public void setWhiteList(Integer whiteList) {
        this.whiteList = whiteList;
    }

    
    
}
