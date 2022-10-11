package com.team3.CSMS.dto;

import java.io.Serializable;

import com.team3.CSMS.model.ClassList;

public class ClassInfoDto  implements Serializable{
    private static final long serialVersionUID = 1L;
    private String teacherName;
    private String classroom;
    private String subject;
    private String schoolType;
    private int grade;
    
    public ClassInfoDto(){
    }
    public ClassInfoDto(ClassList classList){ 
        super();
        this.teacherName=classList.getTeacher().getName();
        this.classroom=classList.getRoom().getRoomName();
        this.subject=classList.getCourse().getCourseSubject();
        this.schoolType=classList.getCourse().getCourseGrade();
        this.grade=classList.getCourse().getCourseClass();
    }
    // public ClassInfoDto(String teacherName, String classroom, String subject, String schoolType, String grade) {
    //     super();
    //     this.teacherName = teacherName;
    //     this.classroom = classroom;
    //     this.subject = subject;
    //     this.schoolType = schoolType;
    //     this.grade = grade;
    // }

    public String getTeacherName() {
        return teacherName;
    }
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    public String getClassroom() {
        return classroom;
    }
    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getSchoolType() {
        return schoolType;
    }
    public void setSchoolType(String schoolType) {
        this.schoolType = schoolType;
    }
    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
        this.grade = grade;
    }

    
}
