package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.ClassStudentList;


// 學生姓名和座號
public class StudentListDto implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer studentSitID;
    private String studentName;
    
    public StudentListDto(){
    }
    public StudentListDto(ClassStudentList classStudentList){
        super();
        this.studentSitID=classStudentList.getStudentNo();
        this.studentName=classStudentList.getStudent().getName();
    }
    public Integer getStudentSitID() {
        return studentSitID;
    }
    public String getStudentName() {
        return studentName;
    }
    
    public void setStudentSitID(Integer studentSitID) {
        this.studentSitID = studentSitID;
    }
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    
}
