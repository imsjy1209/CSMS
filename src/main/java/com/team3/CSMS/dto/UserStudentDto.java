package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.Users;

public class UserStudentDto implements Serializable{
    private static final long serialVersionUID=1L;

    private Integer StudentID;
    private String StudentName;
    private Integer whiteList;
    private Integer userID;
    public UserStudentDto(){
        
    }
    
    public UserStudentDto(Users users){
        this.userID=users.getId();
        this.StudentID=users.getStudent().getId();
        this.StudentName=users.getStudent().getName();
        this.whiteList=users.getAccRight();
    }
    
    public Integer getWhiteList() {
        return whiteList;
    }

    public void setWhiteList(Integer whiteList) {
        this.whiteList = whiteList;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getStudentID() {
        return StudentID;
    }
    public void setStudentID(Integer studentID) {
        StudentID = studentID;
    }
    public String getStudentName() {
        return StudentName;
    }
    public void setStudentName(String studentName) {
        StudentName = studentName;
    } 
}
