package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.Users;

public class UserStudentDto implements Serializable{
    private static final long serialVersionUID=1L;

    private Integer StudentID;
    private String StudentName;
    private Integer whiteList;

    public UserStudentDto(){

    }

    public UserStudentDto(Users users){
        this.StudentID=users.getStudent().getId();
        this.StudentName=users.getStudent().getName();
        this.whiteList=users.getAccRight();
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
    public Integer getWhitList() {
        return whiteList;
    }
    public void setWhitList(Integer whiteList) {
        this.whiteList = whiteList;
    }

    
}
