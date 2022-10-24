package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.Users;

public class userStudentDto implements Serializable{
    private static final long serialVersionUID=1L;

    private Integer StudentID;
    private String StudentName;
    private Integer whitList;

    public userStudentDto(){

    }

    public userStudentDto(Users users){
        this.StudentID=users.getStudent().getId();
        this.StudentName=users.getStudent().getName();
        this.whitList=users.getAccRight();
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
        return whitList;
    }
    public void setWhitList(Integer whitList) {
        this.whitList = whitList;
    }

    
}
